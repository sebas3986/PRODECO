unit UCarpetaArchivo;

interface

uses
  Windows, Forms, Sysutils, StrUtils, IOUtils, classes, DB, DBClient,
  Vcl.Graphics, UDAOPublicacion, UCliente, UFTP, UFolio,UImagen;

type

  TCarpetaArchivo = class
    private
      FListaCarpetas    : TStringList;
      FListaFolios      : TClientDataSet;
      FCarpetasCliente  : TCliente;
      {METODOS PROPIOS}
      procedure ObtenerListaCarpetas(const P_CarpImag: TCliente);

    public
      {CONSTRUCTORES}
      constructor Create(const P_CarpImag: TCliente);
      destructor  Destroy;
      {PROPIEDADES}
      property ListaCarpetas    : TstringList    read FListaCarpetas;
      property ListaFolios      : TClientDataSet read FListaFolios;
      property CarpetasCliente  : TCliente       read FCarpetasCliente;

      procedure ProcesarPublicacion;
      procedure MoverImagenesCarpeta(P_NombCarp: string; P_CarpDest: string; P_OpciMovi: char);
      procedure PublicarImagenesFTP(P_NombCarp: string);
  end;


implementation

Uses
  UPublicacion;

var
  DAOPublicacion: TDAOPublicacion;
  ListArch  : TSearchRec;

procedure TCarpetaArchivo.ObtenerListaCarpetas(const P_CarpImag: TCliente);
var
  NombCarp  : string;
  NombArch  : string;
  begin
  try
    FCarpetasCliente:= P_CarpImag;
    FListaCarpetas.Duplicates:= dupIgnore;
    FListaCarpetas.Sorted:=True;
    if FindFirst(P_CarpImag.RutaScanner + '*.*', faArchive, ListArch) = 0 then
    begin
      repeat
        {SE OBTIENE NOMBRE DE ARCHIVO SIN EXTENSION}
        NombArch:= ansileftstr(ListArch.Name,Length(ListArch.Name)
                                        - Length(ExtractFileExt(ListArch.Name)));
        NombCarp:= AnsiLeftStr(NombArch,9); {EXCLUYE CODIOGO SIOVAL}
        FListaCarpetas.Add(NombCarp);
        FListaFolios.Append;
        FListaFolios.FieldByName('CARPETA').Value := NombCarp;
        FListaFolios.FieldByName('ALETA').Value   := AnsiLeftStr(NombArch,11);
        FListaFolios.FieldByName('FOLIO').Value   := ListArch.Name;
        FListaFolios.FieldByName('TAMANO').Value  := ListArch.Size;

      until FindNext(ListArch) <> 0;
    end;
  except
  end;
end;


procedure TCarpetaArchivo.ProcesarPublicacion();
var
  CantAlet    : Integer;
  CantCarp    : TClientDataSet;
  CantFoliCarp: Integer;
  CantFoliAlet: Integer;
  CantFoliForm: Integer;
  CodiAlet    : string;
  CodiCarp    : string;
  ErroPubl    : TStringList;
  I           : Integer;
  J           : Integer;

begin
  try
    CantCarp:= TClientDataSet.Create(nil);
    ErroPubl:= TStringList.Create;
    for I := 0 to FListaCarpetas.Count - 1 do
    begin
      ErroPubl.Clear;
      CantCarp:=  DAOPublicacion.ObtenerCantidadesCarpeta(FListaCarpetas[I]);
      if NOT CantCarp.IsEmpty then
      begin
        CantCarp.First;
        if CantCarp.FieldByName('DESCRIPCIONTAREA').Value = 'PUBLICACI�N' then
        begin
          CantAlet := CantCarp.RecordCount;
          CantFoliCarp:=0;
          while not CantCarp.eof do
          begin
            CantFoliCarp:= CantFoliCarp + CantCarp.FieldByName('CANTIDADFOLIOS').Value;
            CantCarp.Next;
          end;
          frmPublicacion.PnlCarpetaProceso.Caption:= FListaCarpetas[I];
          frmPublicacion.PnlAletasCarpeta.Caption:= inttostr(CantAlet);
          frmPublicacion.PnlFoliosCarpeta.Caption:= inttostr(CantFoliCarp);
          Application.ProcessMessages;
          CantCarp.First;
          while not CantCarp.eof do
          begin
            with FListaFolios do
            begin
              CodiAlet := 'M' + CantCarp.FieldByName('CODIGOCARPETAALETA').value;
              CodiCarp := 'M' + CantCarp.FieldByName('CODIGOCARPETA').value;
              Filter:= 'CARPETA = ' + QuotedStr(CodiCarp) + ' AND '
                       + 'ALETA = ' + QuotedStr(CodiAlet);
              Filtered:= True;
              First;
              CantFoliAlet:=0;
              CantFoliForm:=0;
              while not eof do
              begin
                inc(CantFoliAlet);
                {SE INCLUYE EL IDCARPETAALETA EN EL DATASET FLISTAFOLIOS}
                edit;
                fieldbyname('IDCARPETAALETA').value:= CantCarp.FieldByName('IDCARPETAALETA').value;
                {SE CUENTAN LOS ARCHIVOS QUE NO ESTEN EN FORMATO TIF PARA PRODUCIR EL ERROR}
                if AnsiStrUpper(PChar(ExtractFileExt(FieldByName('FOLIO').value))) <> '.TIF' then
                  Inc(CantFoliForm);
                Next;
              end;
              if CantFoliAlet <> CantCarp.FieldByName('CANTIDADFOLIOS').Value  then
              begin
                if CantCarp.FieldByName('CANTIDADFOLIOS').Value = 0 then
                  ErroPubl.Add('La Aleta ['+ CodiAlet + '] tiene [' + IntToStr(CantFoliAlet)
                                + '] ' + IfThen(CantFoliAlet = 1,'Folio ','Folios ')
                                + 'y no debe publicar ninguno.')
                else
                  ErroPubl.Add('La Aleta ['+ CodiAlet + '] tiene [' + IntToStr(CantFoliAlet)
                                + ' de ' + IntToStr(CantCarp.FieldByName('CANTIDADFOLIOS').Value)
                                + IfThen(CantCarp.FieldByName('CANTIDADFOLIOS').Value = 1,
                                          '] Folio ', '] Folios ')
                                + 'que debe publicar.');
              end
              else
              begin
                if CantFoliForm > 0 then
                  ErroPubl.Add('La Aleta ['+ CodiAlet + '] tiene [' + IntToStr(CantFoliForm)
                                  + '] ' + IfThen(CantFoliForm = 1,'Imagen ','Im�genes ')
                                  + 'en formato incorrecto.')
              end;
            end;
            CantCarp.Next;
          end;
        end
        else
          ErroPubl.Add('La Carpeta no se encuentra en estado de PUBLICACI�N.');
      end
      else
        ErroPubl.Add('No existe Informaci�n de Radicaci�n para la Carpeta. ');

      if ErroPubl.Count = 0 then
      begin
        MoverImagenesCarpeta(FListaCarpetas[I],FCarpetasCliente.RutaProceso, 'R');
        frmPublicacion.lstRenombre.AddItem('* Carpeta [ ' + FListaCarpetas[I]
                          + ' ]. ' + IfThen(CantFoliCarp > 1,'Se renombraron ','Se renombr� ')
                          + '[ ' + IntToStr(CantFoliCarp) + ' ] '
                          + IfThen(CantFoliCarp > 1,' Folios.','Folio') ,nil);
        Application.ProcessMessages;
        PublicarImagenesFTP(FListaCarpetas[I]);
        frmPublicacion.lstPublicados.AddItem('* Carpeta [ ' + FListaCarpetas[I]
                          + ' ]. ' + IfThen(CantFoliCarp > 1, 'Se publican ','Se publica ')
                          + '[ ' + IntToStr(CantFoliCarp) + ' ] '
                          + IfThen(CantFoliCarp > 1, 'Folios ','Folio ')
                          + 'para [ ' + IntToStr(CantAlet) + ' ] '
                          + IfThen(CantAlet>1, 'Aletas.','Aleta.'),nil);
        Application.ProcessMessages;
      end
      else
      begin
        frmPublicacion.lstNovedades.AddItem('* Carpeta [' + FListaCarpetas[I] + '] no se publica.',nil);
        for J := 0  to ErroPubl.Count -1 do
        begin
          frmPublicacion.lstNovedades.AddItem(stringofchar(' ',10) + 'Error: ' + ErroPubl[j],nil);
          Application.ProcessMessages;
        end;
        MoverImagenesCarpeta(FListaCarpetas[I],FCarpetasCliente.RutaNovedad, 'N');
      end;
    end;
    cantcarp.free;
    erropubl.free;
  finally

  end;

end;


procedure TCarpetaArchivo.MoverImagenesCarpeta(P_NombCarp: string; P_CarpDest: string;
                                                P_OpciMovi: char);
{P_OpciMovi:  VALORES: 'R', 'N'. INDICA SI AL MOVER VA A RENOMBRAR LOS ARCHIVOS
              CON UNA SECUENCIA O NO.
}
var
  ArchDest : string;
  CarpFina : string;
  ConsImag : Integer;
begin
  ConsImag := 0;
  with FListaFolios do
  begin
    CarpFina:= P_CarpDest + P_NombCarp + '\';
    if TDirectory.Exists(CarpFina) then
       TDirectory.Delete(CarpFina,TRUE);

    TDirectory.CreateDirectory(CarpFina);
    Filter:= 'CARPETA = ' + QuotedStr(P_NombCarp);
    Filtered:= True;
    First;
    while not eof do
    begin
      if P_OpciMovi = 'R' then
      begin
        Edit;
        inc(ConsImag);
        FieldByName('SECUENCIA').Value:= Format('%.4d',[ConsImag]);
        ArchDest:= FListaFolios.FieldByName('ALETA').Value
                     + Format('%.4d',[ConsImag]) + 'N' + '-V00'
                     + ExtractFileExt(FListaFolios.FieldByName('FOLIO').Value);
        FieldByName('NUEVOFOLIO').Value:= ArchDest;
        ArchDest:= carpfina + ArchDest;
      end
      else
      begin
        ArchDest:= CarpFina + FListaFolios.FieldByName('FOLIO').Value;
        frmPublicacion.RprProceso.Position:= frmPublicacion.RprProceso.Position +1;
        Application.ProcessMessages;
      end;

      MoveFile(pchar(CarpImag.RutaScanner + FListaFolios.FieldByName('FOLIO').AsString),
                PChar(ArchDest));
      Next;
    end;
  end;
end;

procedure TCarpetaArchivo.PublicarImagenesFTP(P_NombCarp: string);
var
  ConexFTP    : TFTP;
  CarpOrig    : string;
  CarpDest    : string;
  DatoFoli    : TFolio;
  DatoImag    : TImagen;
  IdenFoliInse: LongInt;

begin
  try
    DatoFoli := TFolio.Create;
    DatoImag := TImagen.Create;
    ConeXFTP := TFTP.Create;
    ConeXFTP.ConfigurarFTP;
    ConeXFTP.ConectarFTP;
    with FListaFolios do
    begin
      Filter:= 'CARPETA= ' + QuotedStr(P_NombCarp);
      Filtered:= True;
      First;
      if not IsEmpty then
      begin
        CarpOrig:=  FCarpetasCliente.RutaProceso + P_NombCarp + '\';
        CarpDest:=  FormatDateTime('yyyy',ConeXFTP.FechaAcceso) + '\'
                    + FormatDateTime('mm',ConeXFTP.FechaAcceso) + '\'
                    + FormatDateTime('dd',ConeXFTP.FechaAcceso) + '\'
                    + P_NombCarp + '\';
        ConeXFTP.CrearCarpeta(CarpDest);
        try
          DAOPublicacion.InicarTransaccion;
          while not eof do
          begin
            ConeXFTP.SubirArchivo(CarpOrig,FieldByName('NUEVOFOLIO').Value,
                                  CarpDest, FieldByName('NUEVOFOLIO').Value);
            {SE ARMA EL CONUJUNTO DE DATOS DE FOLIO PARA AGREGAR EN LA BASE DE DATOS}
            DatoFoli.IdCarpetaAleta     := FieldByName('IDCARPETAALETA').Value;
            DatoFoli.SecuenciaFolio     := strtoint(FieldByName('SECUENCIA').Value);
            DatoFoli.TipoFolio          := 'N';
            DatoFoli.CodigoFolio        := AnsiRightStr(FieldByName('ALETA').Value,
                                                        Length(FieldByName('ALETA').Value) - 1)
                                           + FieldByName('SECUENCIA').Value + 'N';
            DatoFoli.ChequeoCalidad     := False;
            {SE INSERTA REGISTRO EN TABLA FOLIO Y SE OBTIENE EL IDFOLIO PARA INSERTAR EN TABLA IMAGEN}
            IdenFoliInse                := DAOPublicacion.AgregarFolio(DatoFoli);

            {SE ARMA EL CONUJUNTO DE DATOS DE FOLIO PARA AGREGAR EN LA BASE DE DATOS}
            DatoImag.IdFolio       := IdenFoliInse;
            DatoImag.RutaLocal     := FCarpetasCliente.RutaScanner;
            DatoImag.ServidorFtp   := ConexFTP.IPServidor;
            DatoImag.RutaFtp       := CarpDest;
            DatoImag.NombreImagen  := FieldByName('NUEVOFOLIO').Value;
            DatoImag.Version       := 0;
            DatoImag.TamanoBytes   := FieldByName('TAMANO').Value;
            DatoImag.Ancho         := 0;
            DatoImag.Alto          := 0;
            DatoImag.Densidad      := 300;
            DatoImag.IpPublicacion := frmPublicacion.DireccIP;
            DAOPublicacion.AgregarImagen(DatoImag);
            frmPublicacion.RprProceso.Position:= frmPublicacion.RprProceso.Position + 1;
            Application.ProcessMessages;
            Next;
          end;
          DAOPublicacion.CambiarEstadoCarpeta(P_NombCarp);
          {SE MUEVE LA CARPETA DE RENOMBRAMIENTO (PROCESO) A PUBLICADO VERIFICANDO
          QUE NO EXISTA. SI EXITE SE ELIMINA}
          if TDirectory.Exists(FCarpetasCliente.RutaPublicado + P_NombCarp ) then
            TDirectory.Delete( FCarpetasCliente.RutaPublicado + P_NombCarp, TRUE);
          TDirectory.Move(CarpOrig,FCarpetasCliente.RutaPublicado + P_NombCarp);
          DAOPublicacion.FinalizarTransaccion;
        except
          on e: Exception do
          begin
            DAOPublicacion.CancelarTransaccion;
            raise Exception.Create(e.Message);
          end;
        end;
      end;
    end;
  except
    on e: Exception do
        raise Exception.Create('Ocurri� falla al publicar las im�genes de la carpeta ['
                                + P_NombCarp + '] en el FTP.' + #10#13 + '* '+ e.Message);
  end;
 end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TCarpetaArchivo.Create(const P_CarpImag: TCliente);
begin
  FListaCarpetas  := TStringList.Create;
  FListaFolios    := TClientDataSet.Create(nil);
  FCarpetasCliente:= TCliente.Create;
  DAOPublicacion  := TDAOPublicacion.create ;

  with FListaFolios do
  begin
    FieldDefs.Add('CARPETA', ftString,50);
    FieldDefs.Add('ALETA', ftString,50);
    FieldDefs.Add('FOLIO',ftString,50);
    FieldDefs.Add('SECUENCIA', ftstring,4);
    FieldDefs.Add('NUEVOFOLIO',ftString,50);
    FieldDefs.Add('TAMANO',ftLargeint,0);
    FieldDefs.Add('IDCARPETAALETA', ftlargeint,0);
    CreateDataSet;
    IndexFieldNames:= 'CARPETA;ALETA;FOLIO';
  end;
  ObtenerListaCarpetas(P_CarpImag);
end;

destructor TCarpetaArchivo.Destroy;
begin
  FListaCarpetas.Free;
  FListaFolios.Free;
  FCarpetasCliente.Free;
  DAOPublicacion.Free;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.