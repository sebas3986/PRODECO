unit UDAOControlCalidad;

interface

uses
  System.SysUtils,  System.Classes,  UDMConexion,  Data.DB,  ZAbstractRODataset,
  Vcl.CheckLst,  ZAbstractDataset,  ZDataset,  Datasnap.Provider,  Datasnap.DBClient,
  StrUtils,frxClass,  frxDBSet,  frxExportImage;

type
  TDAOControlCalidad = class(TDataModule)
    ZQCarpeta: TZQuery;
    dsCarpeta: TDataSource;
    cdsCarpeta: TClientDataSet;
    dspCarpeta: TDataSetProvider;
    intgrfldCarpetaidSerieDocumental: TIntegerField;
    intgrfldCarpetaidCaja: TIntegerField;
    intgrfldCarpetaidCarpeta: TIntegerField;
    intgrfldCarpetaidCarpetaAleta: TIntegerField;
    intgrfldCarpetaSecuenciaCarpeta: TIntegerField;
    intgrfldCarpetaidFlujo: TIntegerField;
    strngfldCarpetaCodigoCaja: TStringField;
    strngfldCarpetaCodigoCarpeta: TStringField;
    strngfldCarpetaCodigoCarpetaAleta: TStringField;
    strngfldCarpetaDescripcionSerieDocumental: TStringField;
    strngfldCarpetaDescripcionSubSerieDocumental: TStringField;
    ZQTipoIdentificacion: TZQuery;
    dsTipoIdentificacion: TDataSource;
    dspTipoIdentificacion: TDataSetProvider;
    cdsTipoIdentificacion: TClientDataSet;
    intgrfldTipoIdentificacionidTipoIdentificacion: TIntegerField;
    strngfldTipoIdentificacionDescripcionTipoIdentificacion: TStringField;
    cdsCarpetaFoliada: TBooleanField;
    ZQNovedad: TZQuery;
    dsNovedad: TDataSource;
    cdsNovedad: TClientDataSet;
    dspNovedad: TDataSetProvider;
    intgrfldNovedadidNovedad: TIntegerField;
    strngfldNovedadDescripcionNovedad: TStringField;
    frxtifTestigo: TfrxTIFFExport;
    fdbCarpeta: TfrxDBDataset;
    fdbFolioNovedad: TfrxDBDataset;
    frxTestigo: TfrxReport;
    ZQDatosFolio: TZQuery;
    dsDatosFolio: TDataSource;
    dspDatosFolio: TDataSetProvider;
    cdsDatosFolio: TClientDataSet;
    strngfldDatosFolioCodigoCarpetaAleta: TStringField;
    strngfldDatosFolioCodigoFolio: TStringField;
    strngfldDatosFolioTipoFolio: TStringField;
    strngfldDatosFolioRutaLocal: TStringField;
    strngfldDatosFolioRutaFTP: TStringField;
    strngfldDatosFolioNombreImagen: TStringField;
    intgrfldDatosFolioidCarpeta: TIntegerField;
    intgrfldDatosFolioVersion: TIntegerField;
    ZQActualizarFolio: TZQuery;
    intgrfldDatosFolioidFolio: TIntegerField;
    ZQCapturable: TZQuery;
    intgrfldDatosFolioidCarpetaAleta: TIntegerField;
    ZQInsertarTestigo: TZQuery;
    ZQSecuenciaFolio: TZQuery;
    ZQObservacionTestigo: TZQuery;
    ZQNovedadesFolio: TZQuery;
    ZQFolioNovedad: TZQuery;
    dsFolioNovedad: TDataSource;
    dspFolioNovedad: TDataSetProvider;
    cdsFolioNovedad: TClientDataSet;
    ZQObservacionFolio: TZQuery;
    dsObservacionFolio: TDataSource;
    dspObservacionFolio: TDataSetProvider;
    cdsObservacionFolio: TClientDataSet;
    fdbObservacionFolio: TfrxDBDataset;
    intgrfldObservacionFolioidCarpetaAleta: TIntegerField;
    intgrfldObservacionFolioidFolio: TIntegerField;
    strngfldObservacionFolioTipoFolio: TStringField;
    strngfldObservacionFolioCodigoFolio: TStringField;
    strngfldObservacionFolioObservacion: TStringField;
    strngfldObservacionFolioTipoObservacion: TStringField;
    strngfldFolioNovedadDescripcionNovedad: TStringField;
    intgrfldFolioNovedadidFolio: TIntegerField;
    intgrfldFolioNovedadidNovedad: TIntegerField;
    strngfldCarpetaCodigoFolio: TStringField;
    ZQImagenFolio: TZQuery;
    intgrfldCarpetaidFolio: TIntegerField;
    cdsCarpetaChequeoCalidad: TBooleanField;
    ZQChequeoCalidad: TZQuery;
    ZQValidarTestigo: TZQuery;
    intgrfldCarpetaidSubSeriedocumental: TIntegerField;
    ZQNoCapturable: TZQuery;
    intgrfldDatosFolioSecuenciaFolio: TIntegerField;
    ZQCambiarEstado: TZQuery;
    ZQFoliosCalidad: TZQuery;
    ZQControlFolio: TZQuery;
    cdsDatosFolioChequeoCalidad: TBooleanField;
    strngfldCarpetaDescripcionTipoSerieDocumental: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function BuscarCaja (CodigoCaja : string) : boolean;
    procedure TipoIdentificacion;
    procedure Novedades (ListaNovedades : TCheckListBox);
    function DatosFolio (idCarpeta : integer): integer;
    procedure ActualizarPublicacion (idFolio, Ancho, Alto, TamanoBytes, Version : integer; RutaFTP, ServidorFTP, IPLocal, NombreImagen : string);
    function MarcarCapturable (idFolio, Condicion : integer): boolean;
    function GenerarTestigo (ListaChequeo: TCheckListBox; Observacion : string): integer;
    procedure ObservacionFolio (idFolio : integer);
    procedure NovedadesFolio (idFolio : integer);
    procedure ImagenTestigo (idFolio, TamanoBytes, Ancho, Alto, Densidad : integer; RutaLocal, RutaFTP, NombreImagen, ServidorFTP, ipPublicacion : string);
    procedure ChequeoCalidad (idFolio:Integer; P_cheqfoli: Boolean; idFolioAnterior : integer);
    function NombreTestigo (idFolio : integer) : string;
    procedure MarcarNoCapturable (idCarpeta : integer);
    procedure CambiarEstado (idCarpeta : integer);
    function ValidarFolios (idCarpeta : integer) : boolean;
  end;

var
  DAOControlCalidad: TDAOControlCalidad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDAOControlCalidad }

procedure TDAOControlCalidad.ActualizarPublicacion (idFolio, Ancho, Alto, TamanoBytes, Version : integer; RutaFTP, ServidorFTP, IPLocal, NombreImagen : string);
begin
  try
    with ZQActualizarFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.Imagen (idFolio, Version, RutaLocal, RutaFTP, NombreImagen, ServidorFTP, IPPublicacion, TamanoBytes, Ancho, Alto, Densidad, Usuario)',[DMConexion.Esquema]));
         SQL.Add('VALUES (:idFolio, :Version, :RutaLocal, :RutaFTP, :NombreImagen, :ServidorFTP, :IPPublicacion, :TamanoBytes, :Ancho, :Alto, :Densidad, :Usuario)');
         ParamByName('idFolio').AsInteger := idFolio;
         ParamByName('Version').AsInteger := Version;
         ParamByName('RutaLocal').AsString := 'C:\DIGITALIZACION\UNIANDES\SCANNER\';
         ParamByName('RutaFTP').AsString := RutaFTP;
         ParamByName('ServidorFTP').AsString := ServidorFTP;
         ParamByName('IPPublicacion').AsString := IPLocal;
         ParamByName('NombreImagen').AsString := NombreImagen;
         ParamByName('TamanoBytes').AsInteger := TamanoBytes;
         ParamByName('Ancho').AsInteger := Ancho;
         ParamByName('Alto').AsInteger := Alto;
         ParamByName('Densidad').AsInteger := Ancho;
         ParamByName('Usuario').AsString := ParamStr(1);
         ExecSQL;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDAOControlCalidad.ActualizarPublicacion. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.BuscarCaja(CodigoCaja: string): boolean;
begin
  Result := False;
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT SD.idSerieDocumental, SSD.idSubSeriedocumental, CJ.idCaja, CA.idCarpeta, CAL.idCarpetaAleta, SecuenciaCarpeta,  idFlujo, CodigoCaja, CodigoCarpeta, CodigoCarpetaAleta, DescripcionSerieDocumental, ');
         SQL.Add('DescripcionTipoSerieDocumental,DescripcionSubSerieDocumental, Foliada, CodigoFolio, idFolio, ChequeoCalidad');
         SQL.Add(Format('FROM %s.Carpeta CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Caja CJ ON (CJ.idCaja = CA.idCaja)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CA.idSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.TipoSerieDocumental TS ON (TS.idTipoSerieDocumental = SD.idTipoSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CA.idCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CAL.idCarpetaAleta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieSubSerie SSS ON (SSS.idSerieSubSerie = CAL.idSerieSubSerie)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSS.idSubSeriedocumental = SSD.idSubSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add('WHERE CodigoCarpeta =:CodigoCarpeta AND CA.Habilitado = TRUE AND idFlujo = 2 ORDER BY CodigoFolio, CAL.idCarpetaAleta, SSD.idSubSeriedocumental');
         ParamByName('CodigoCarpeta').AsString := CodigoCaja;
         Open;
         cdsCarpeta.Close;
         cdsCarpeta.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsCarpeta.Append;
               cdsCarpeta.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
               cdsCarpeta.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
               cdsCarpeta.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
               cdsCarpeta.FieldByName('idCarpetaAleta').AsInteger := FieldByName('idCarpetaAleta').AsInteger;
               cdsCarpeta.FieldByName('SecuenciaCarpeta').AsInteger := FieldByName('SecuenciaCarpeta').AsInteger;
               cdsCarpeta.FieldByName('idFlujo').AsInteger := FieldByName('idFlujo').AsInteger;
               cdsCarpeta.FieldByName('CodigoCaja').AsString := FieldByName('CodigoCaja').AsString;
               cdsCarpeta.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
               cdsCarpeta.FieldByName('CodigoCarpetaAleta').AsString := FieldByName('CodigoCarpetaAleta').AsString;
               cdsCarpeta.FieldByName('DescripcionSerieDocumental').AsString := FieldByName('DescripcionSerieDocumental').AsString;
               cdsCarpeta.FieldByName('DescripcionTipoSerieDocumental').AsString := FieldByName('DescripcionTipoSerieDocumental').AsString;
               cdsCarpeta.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
               cdsCarpeta.FieldByName('CodigoFolio').AsString := FieldByName('CodigoFolio').AsString;
               cdsCarpeta.FieldByName('Foliada').AsBoolean := FieldByName('Foliada').AsBoolean;
               cdsCarpeta.FieldByName('ChequeoCalidad').AsBoolean := FieldByName('ChequeoCalidad').AsBoolean;
               cdsCarpeta.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
               cdsCarpeta.FieldByName('idSubSeriedocumental').AsInteger := FieldByName('idSubSeriedocumental').AsInteger;
               Next;
             until Eof;
             Result := True;
         end else
             cdsCarpeta.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDAOControlCalidad.BuscarCarpeta. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.CambiarEstado(idCarpeta: integer);
begin
  try
    if cdsCarpeta.FieldByName('idFlujo').AsInteger = 2 then
      begin
        with ZQCambiarEstado do
           begin
             Close;
             SQL.Clear;
             SQL.Add(Format('SELECT p_idenflujnuev FROM %s.fnc_AsignarFlujoCarpeta (:idCarpeta, ''GUARDADO SATISFACTORIO'')',[DMConexion.Esquema]));
             ParamByName('idCarpeta').AsInteger := idCarpeta;
             Open;
        end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.CambiarEstado. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.ChequeoCalidad(idFolio: integer; P_cheqfoli: Boolean;
                                             idFolioAnterior : integer);
{ESTA FUNCION CHEQUEA O DESCHEQUEA EL FOLIO Y DESBLOQUEA EL ANTERIOR.
  EL PARAMETRO P_cheqfoli INDICA SI SE CHEQUEA O DESCHEQUEA}
var
   Duplicado : boolean;
begin
  Duplicado := False;
  try
    with ZQChequeoCalidad do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Folio SET ChequeoCalidad = '
                          + ifthen(P_cheqfoli,'True','False'), [DMConexion.Esquema]));
         SQL.Add('          WHERE idFolio =:idFolio');
         ParamByName('idFolio').AsInteger := idFolio;
         ExecSQL;
    end;

    with ZQControlFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idControlFolio FROM %s.ControlFolio WHERE idFolio =:idFolio AND idTarea = 3',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         if NOT IsEmpty then
           Duplicado := True;
    end;

    if NOT Duplicado then
      begin
        with ZQControlFolio do
           begin
             Close;
             SQL.Clear;
             SQL.Add(Format('INSERT INTO %s.ControlFolio (idFolio, idTarea, Bloqueado, Usuario, FechaBloqueo, ipBloqueo) VALUES (:idFolio, 3, TRUE, :Usuario, NOW(), HOST(inet_client_addr()))',[DMConexion.Esquema]));
             ParamByName('idFolio').AsInteger := idFolio;
             ParamByName('Usuario').AsString := ParamStr(1);
             ExecSQL;
        end;
    end;

    if idFolioAnterior > 0 then
      begin
        with ZQControlFolio do
           begin
             Close;
             SQL.Clear;
             SQL.Add(Format('UPDATE %s.ControlFolio SET Bloqueado = FALSE, FechaDesbloqueo = now() WHERE idFolio =:idFolio AND idTarea = 3',[DMConexion.Esquema]));
             ParamByName('idFolio').AsInteger := idFolioAnterior;
             ExecSQL;
        end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.ChequeoCalidad. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.DatosFolio(idCarpeta: integer) : integer;
begin
  try
    with ZQDatosFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT IMG.idFolio, CodigoFolio, IMG.Version, NombreImagen, IMG.RutaLocal, IMG.RutaFTP, SecuenciaFolio, idCarpetaAleta, CodigoCarpetaAleta,CodigoFolio, TipoFolio, idCarpeta, FOL.ChequeoCalidad FROM %s.Imagen IMG',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN  (SELECT FO.idFolio, FO.idCarpetaAleta, CodigoCarpetaAleta, CodigoFolio, TipoFolio, RutaLocal, RutaFTP, idCarpeta,  MAX (Version) AS Version, SecuenciaFolio, ChequeoCalidad FROM %s.CarpetaAleta CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CA.idCarpetaAleta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Imagen IM ON (IM.idFolio = FO.idFolio) WHERE idCarpeta =:idCarpeta AND FO.Habilitado = TRUE GROUP BY FO.idFolio, FO.idCarpetaAleta, CodigoCarpetaAleta,IM.RutaLocal, IM.RutaFTP, CA.idCarpeta) AS FOL',[DMConexion.Esquema]));
         SQL.Add('ON FOL.idFolio = IMG.idFolio AND FOL.Version = IMG.Version ORDER BY CodigoFolio');
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         Open;
         if NOT IsEmpty then
           begin
             cdsDatosFolio.Close;
             cdsDatosFolio.CreateDataSet;
             repeat
               cdsDatosFolio.Append;
               cdsDatosFolio.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
               cdsDatosFolio.FieldByName('CodigoCarpetaAleta').AsString := FieldByName('CodigoCarpetaAleta').AsString;
               cdsDatosFolio.FieldByName('CodigoFolio').AsString := FieldByName('CodigoFolio').AsString;
               cdsDatosFolio.FieldByName('TipoFolio').AsString := FieldByName('TipoFolio').AsString;
               cdsDatosFolio.FieldByName('RutaLocal').AsString := FieldByName('RutaLocal').AsString;
               cdsDatosFolio.FieldByName('RutaFTP').AsString := FieldByName('RutaFTP').AsString;
               cdsDatosFolio.FieldByName('NombreImagen').AsString := FieldByName('NombreImagen').AsString;
               cdsDatosFolio.FieldByName('Version').AsInteger := FieldByName('Version').AsInteger;
               cdsDatosFolio.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
               cdsDatosFolio.FieldByName('idCarpetaAleta').AsInteger := FieldByName('idCarpetaAleta').AsInteger;
               cdsDatosFolio.FieldByName('SecuenciaFolio').AsInteger := FieldByName('SecuenciaFolio').AsInteger;
               cdsDatosFolio.FieldByName('ChequeoCalidad').AsBoolean := FieldByName('ChequeoCalidad').AsBoolean;
               Next;
             until Eof;
             cdsDatosFolio.First;
             Result := cdsDatosFolio.RecordCount;
         end else
            begin
              cdsDatosFolio.Close;
              cdsDatosFolio.CreateDataSet;
              cdsDatosFolio.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.DatosFolio. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.GenerarTestigo (ListaChequeo: TCheckListBox; Observacion : string): integer;
var
  Secuencia : integer;
  idFolio, i   : integer;
begin
  Result := 0;
  idFolio := 0;
  try

    with ZQValidarTestigo do //Valida la existencia del testigo, en caso de existir no debe realizar el proceso.
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idFolio FROM %s.Folio WHERE CodigoFolio =:CodigoFolio',[DMConexion.Esquema]));
         ParamByName('CodigoFolio').AsString := Copy(cdsDatosFolio.FieldByName('CodigoFolio').AsString, 1, Length(cdsDatosFolio.FieldByName('CodigoFolio').AsString)-1)+'T';
         Open;
         if NOT IsEmpty then
           i := 0
         else
           i := 1;
    end;

    if i > 0 then
      begin
        with ZQInsertarTestigo do
           begin
             Close;
             SQL.Clear;
             SQL.Add(Format('INSERT INTO %s.Folio (idCarpetaAleta, SecuenciaFolio, TipoFolio, CodigoFolio, ChequeoCalidad, Usuario, Capturable) VALUES (:idCarpetaAleta, :SecuenciaFolio, :TipoFolio, :CodigoFolio, True, :Usuario, False) RETURNING idFolio',[DMConexion.Esquema]));
             ParamByName('idCarpetaAleta').AsInteger := cdsDatosFolio.FieldByName('idCarpetaAleta').AsInteger;;
             ParamByName('SecuenciaFolio').AsInteger := cdsDatosFolio.FieldByName('SecuenciaFolio').AsInteger;
             ParamByName('TipoFolio').AsString := 'T';
             ParamByName('CodigoFolio').AsString := Copy(cdsDatosFolio.FieldByName('CodigoFolio').AsString, 1, Length(cdsDatosFolio.FieldByName('CodigoFolio').AsString)-1)+'T';
             ParamByName('Usuario').AsString := ParamStr(1);
             Open;
             idFolio := FieldByName('idFolio').AsInteger;
        end;

        if Observacion <> '' then
          begin
            with ZQObservacionTestigo do
               begin
                 Close;
                 SQL.Clear;
                 SQL.Add(Format('INSERT INTO %s.ObservacionFolio (idFolio, idTarea, Observacion, TipoObservacion, Usuario) VALUES (:idFolio, 3, :Observacion, ''F'', :Usuario)',[DMConexion.Esquema]));
                 ParamByName('idFolio').AsInteger := idFolio;
                 ParamByName('Observacion').AsString := Observacion;
                 ParamByName('Usuario').AsString :=ParamStr(1);
                 ExecSQL;
            end;
        end;

        for i := 0 to (ListaChequeo.Items.Count-1) do
           begin
             if ListaChequeo.Checked[i] then
               begin
                 with ZQNovedadesFolio do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add(Format('INSERT INTO %s.FolioNovedad (idFolio, idNovedad, Usuario) VALUES (:idFolio, :idNovedad, :Usuario)',[DMConexion.Esquema]));
                      ParamByName('idFolio').AsInteger := idFolio;
                      ParamByName('idNovedad').AsInteger := i+1;
                      ParamByName('Usuario').AsString := ParamStr(1);
                      ExecSQL;
                 end;
             end;
        end;

        ObservacionFolio(idFolio);
        NovedadesFolio(idFolio);
        frxtifTestigo.FileName := 'C:\Digitalizacion\UNIANDES\CALIDAD\Testigo.tif';   //Imagen del reporte (FastReport) para el testigo
        frxTestigo.PrepareReport;
        frxTestigo.ShowReport;
        Result := idFolio;
        ObservacionFolio(-1);
        NovedadesFolio(-1);
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDAOControlCalidad.GenerarTestigo. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.ImagenTestigo (idFolio, TamanoBytes, Ancho, Alto, Densidad : integer; RutaLocal, RutaFTP, NombreImagen, ServidorFTP, ipPublicacion : string);
begin
  try
    with ZQImagenFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.Imagen (idFolio, RutaLocal, RutaFTP, NombreImagen, ServidorFTP, ipPublicacion, TamanoBytes, Ancho, Alto, Densidad, Usuario) ',[DMConexion.Esquema]));
         SQL.Add('VALUES (:idFolio, :RutaLocal, :RutaFTP, :NombreImagen, :ServidorFTP, :ipPublicacion, :TamanoBytes, 0, 0, :Densidad, :Usuario)');
         ParamByName('idFolio').AsInteger := idFolio;
         ParamByName('TamanoBytes').AsInteger := TamanoBytes;
         ParamByName('Densidad').AsInteger := Densidad;
         ParamByName('RutaLocal').AsString := RutaLocal;
         ParamByName('RutaFTP').AsString := RutaFTP;
         ParamByName('NombreImagen').AsString := 'M'+NombreImagen+'-V00.tif';
         ParamByName('ServidorFTP').AsString := ServidorFTP;
         ParamByName('ipPublicacion').AsString := ipPublicacion;
         ParamByName('Usuario').AsString := ParamStr(1);
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.ImagenTestigo. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.MarcarCapturable(idFolio, Condicion: integer): boolean;
begin
  try
    with ZQCapturable do
       begin
         Close;
         SQL.Clear;
         case Condicion of
                 1 : SQL.Add(Format('UPDATE %s.Folio SET Capturable = FALSE WHERE idFolio =:idFolio',[DMConexion.Esquema]));
                 2 : SQL.Add(Format('UPDATE %s.Folio SET Capturable = TRUE WHERE idFolio =:idFolio',[DMConexion.Esquema]));
         end;
         ParamByName('idFolio').AsInteger := idFolio;
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.MarcarCapturable. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.MarcarNoCapturable(idCarpeta: integer);
begin
  try
    with ZQNoCapturable do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Folio SET Capturable = FALSE WHERE idFolio IN (',[DMConexion.Esquema]));
         SQL.Add(Format('SELECT FO.idFolio FROM %s.CarpetaAleta CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CA.idCarpetaAleta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Imagen IM ON (IM.idFolio = FO.idFolio) WHERE idCarpeta =:idCarpeta AND FO.Habilitado = TRUE AND ChequeoCalidad = FALSE)',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.MarcarNoCapturable. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.NombreTestigo(idFolio: integer): string;
begin
  try
    with ZQImagenFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT CodigoFolio FROM %s.Folio WHERE idFolio =:idFolio ',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         if NOT IsEmpty then
           Result := FieldByName('CodigoFolio').AsString;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.NombreTestigo. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.Novedades (ListaNovedades : TCheckListBox);
begin
  try
    with ZQNovedad do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT DISTINCT idNovedad, DescripcionNovedad FROM %s.Novedad WHERE Habilitado = TRUE ORDER BY 1',[DMConexion.Esquema]));
         Open;
         if NOT IsEmpty then
           begin
             cdsNovedad.Close;
             cdsNovedad.CreateDataSet;
             First;
             repeat
               cdsNovedad.Append;
               cdsNovedad.FieldByName('idNovedad').AsInteger := FieldByName('idNovedad').AsInteger;
               cdsNovedad.FieldByName('DescripcionNovedad').AsString := FieldByName('DescripcionNovedad').AsString;
               ListaNovedades.Items.Add(cdsNovedad.FieldByName('DescripcionNovedad').AsString);
               Next;
             until Eof;
         end else
            begin
              cdsNovedad.Close;
              cdsNovedad.CreateDataSet;
              cdsNovedad.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.Novedades. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.NovedadesFolio(idFolio: integer);
begin
  try
    with ZQFolioNovedad do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT DescripcionNovedad, idFolio, NV.idNovedad FROM %s.FolioNovedad FN',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Novedad NV ON (NV.idNovedad = FN.idNovedad) WHERE idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         if NOT IsEmpty then
           begin
             cdsFolioNovedad.Close;
             cdsFolioNovedad.CreateDataSet;
             First;
             repeat
               cdsFolioNovedad.Append;
               cdsFolioNovedad.FieldByName('DescripcionNovedad').AsString := FieldByName('DescripcionNovedad').AsString;
               cdsFolioNovedad.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
               cdsFolioNovedad.FieldByName('idNovedad').AsInteger := FieldByName('idNovedad').AsInteger;
               Next;
             until Eof;
         end else
            begin
              cdsFolioNovedad.Close;
              cdsFolioNovedad.CreateDataSet;
              cdsFolioNovedad.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.NovedadesFolio. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.ObservacionFolio(idFolio: integer);
begin
  try
    with ZQObservacionFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idCarpetaAleta, FO.idFolio, TipoFolio, CodigoFolio, Observacion, TipoObservacion FROM %s.Folio FO',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.ObservacionFolio OB ON (OB.idFolio = FO.idFolio) WHERE FO.idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         if NOT IsEmpty then
           begin
             cdsObservacionFolio.Close;
             cdsObservacionFolio.CreateDataSet;
             cdsObservacionFolio.Append;
             cdsObservacionFolio.FieldByName('idCarpetaAleta').AsInteger := FieldByName('idCarpetaAleta').AsInteger;
             cdsObservacionFolio.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
             cdsObservacionFolio.FieldByName('TipoFolio').AsString := FieldByName('TipoFolio').AsString;
             cdsObservacionFolio.FieldByName('CodigoFolio').AsString := FieldByName('CodigoFolio').AsString;
             cdsObservacionFolio.FieldByName('Observacion').AsString := FieldByName('Observacion').AsString;
             cdsObservacionFolio.FieldByName('TipoObservacion').AsString := FieldByName('TipoObservacion').AsString;
         end else
            begin
              cdsObservacionFolio.Close;
              cdsObservacionFolio.CreateDataSet;
              cdsObservacionFolio.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.ObservacionFolio. FuenteError :' + E.Message);
  end;
end;

procedure TDAOControlCalidad.TipoIdentificacion;
begin
  try
    with ZQTipoIdentificacion do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idTipoIdentificacion, DescripcionTipoIdentificacion FROM %s.TipoIdentificacion ORDER BY 1',[DMConexion.Esquema]));
         Open;
         if NOT IsEmpty then
           begin
             cdsTipoIdentificacion.Close;
             cdsTipoIdentificacion.CreateDataSet;
             First;
             repeat
               cdsTipoIdentificacion.Append;
               cdsTipoIdentificacion.FieldByName('idTipoIdentificacion').AsInteger := FieldByName('idTipoIdentificacion').AsInteger;
               cdsTipoIdentificacion.FieldByName('DescripcionTipoIdentificacion').AsString := FieldByName('DescripcionTipoIdentificacion').AsString;
               Next;
             until Eof;
         end else
            begin
              cdsTipoIdentificacion.Close;
              cdsTipoIdentificacion.CreateDataSet;
              cdsTipoIdentificacion.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.TipoIdentificacion. FuenteError :' + E.Message);
  end;
end;

function TDAOControlCalidad.ValidarFolios(idCarpeta: integer): boolean;
begin
  Result := False;
  try
    with ZQFoliosCalidad do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT COUNT (idFolio) AS TotalFolios, CantidadFolios, CA.idCarpeta FROM %s.Carpeta CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CA.idCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CAL.idCarpetaAleta) WHERE CA.idCarpeta =:idCarpeta AND ChequeoCalidad = TRUE GROUP BY CAL.CantidadFolios, CA.idCarpeta',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         Open;
         if FieldByName('TotalFolios').AsInteger >= FieldByName('CantidadFolios').AsInteger then
           Result := True;
         if Result then
           begin
             Close;
             SQL.Clear;
             SQL.Add(Format('SELECT COUNT (idFolio) AS TotalFolios FROM %s.Carpeta CA',[DMConexion.Esquema]));
             SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CA.idCarpeta)',[DMConexion.Esquema]));
             SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CAL.idCarpetaAleta) WHERE CA.idCarpeta =:idCarpeta AND Capturable = TRUE GROUP BY CA.idCarpeta',[DMConexion.Esquema]));
             ParamByName('idCarpeta').AsInteger := idCarpeta;
             Open;
             if FieldByName('TotalFolios').AsInteger = 0 then
               Result := False;
         end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDAOControlCalidad.ValidarFolios. FuenteError :' + E.Message);
  end;
end;

end.
