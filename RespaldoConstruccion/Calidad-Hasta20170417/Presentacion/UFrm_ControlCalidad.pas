unit UFrm_ControlCalidad;

interface

uses
  Winapi.Windows,  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls,  Vcl.ComCtrls, IdIPWatch, EnImgScr, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, System.IOUtils, UDAOControlCalidad, UFTP, UCliente, UFrm_Testigo,
  UFrm_Identificacion, UValidaciones, UDMConexion, UDMAplicacion, RxCtrls;

type
  TFrm_ControlCalidad = class(TForm)
    statInformacion: TStatusBar;
    grpOpciones: TGroupBox;
    spl1: TSplitter;
    grpImagen: TGroupBox;
    grpEncabezado: TGroupBox;
    imgImagenCalidad: TImageScrollBox;
    grpFolio: TGroupBox;
    btnNovedad: TButton;
    btnTestigo: TButton;
    btnFinalizar: TButton;
    btnIzquierda: TSpeedButton;
    btnDerecha: TSpeedButton;
    grpBuscarCaja: TGroupBox;
    lblCaja: TLabel;
    edBuscarCaja: TEdit;
    grp3: TGroupBox;
    dbeCaja: TDBEdit;
    dbeCodigoCarpeta: TDBEdit;
    dbeDescripcionSubSerieDocumental: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dbtxtDescripcionSerieDocumental: TDBText;
    grpZoom: TGroupBox;
    lblZoom: TLabel;
    scrlbrZoom: TScrollBar;
    edtZoom: TEdit;
    btnCambiarFolio: TButton;
    btnNuevo: TButton;
    btnCapturable: TButton;
    lblFolio: TLabel;
    edFolio: TEdit;
    grp2: TGroupBox;
    btnIdentificacion: TButton;
    lblFolios: TLabel;
    lblNoFolio: TLabel;
    edNoFolio: TEdit;
    RpnMensajeImagen: TRxPanel;
    rxlMensajeImagen: TRxLabel;
    procedure edBuscarCajaKeyPress(Sender: TObject; var Key: Char);
    procedure btnTestigoClick(Sender: TObject);
    procedure btnIdentificacionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnIzquierdaClick(Sender: TObject);
    procedure btnDerechaClick(Sender: TObject);
    procedure scrlbrZoomChange(Sender: TObject);
    procedure btnNovedadClick(Sender: TObject);
    procedure edtZoomKeyPress(Sender: TObject; var Key: Char);
    procedure btnCambiarFolioClick(Sender: TObject);
    procedure btnCapturableClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edNoFolioKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FTP : TFtp;
  public
    procedure ConfigurarAmbiente;
    procedure ConfigurarFTP;
    procedure ConfigurarDirectorios;
    function MostrarImagen (Ruta, RutaFTP, NombreImagen : string): boolean;
    procedure HabilitarBotones (Criterio : integer);
    procedure PublicarImagen (Ruta, NombreArchivo, RutaFTP, NombreImagen  : string);
    function TamanoArchivo (sFileToExamine: string) : Longword;
    Procedure VerificarVersion(p_NombModu: string;p_VersModu: string);
    { Public declarations }
  end;

var

  Frm_ControlCalidad : TFrm_ControlCalidad;
  CarpImag     : TCliente;     {DATOS DE LAS CARPETAS PARA LAS IMAGENES}
  CantCarp     : Integer;      {CANTIDAD DE CARPETAS A PROCESAR}
  CantFoli     : Integer;      {CANTIDAD DE FOLIOS A PROCESAR}
  DireccIP     : String;
  FileName     : String;
  NombModu     : string;
  NoFolios     : integer;
  PosFolio     : integer;
  FolioBloqueo : integer;
  VersModu     : string;

implementation

{$R *.dfm}

function TFrm_ControlCalidad.TamanoArchivo (sFileToExamine: string) : Longword;
var
  FileHandle: THandle;
  FileSize: Longword;
  d1: Double;
begin
  FileHandle := CreateFile(PChar(sFileToExamine),
    GENERIC_READ,
    0, {exclusivo}
    nil, {seguridad}
    OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL,
    0);
  FileSize   := GetFileSize(FileHandle, nil);
  Result     := FileSize;
  CloseHandle(FileHandle);
end;

procedure TFrm_ControlCalidad.btnIzquierdaClick(Sender: TObject);
begin
  Dec(PosFolio);
  if PosFolio < 1 then
    PosFolio := 1;
  lblFolios.Caption := 'Folio '+LlenarCerosIzquierda('4',PosFolio)+' de '+LlenarCerosIzquierda('4',NoFolios);
  DAOControlCalidad.cdsDatosFolio.Prior;
  edFolio.Text := DAOControlCalidad.cdsDatosFolio.FieldByName('CodigoFolio').AsString;

  MostrarImagen (ExtractFilePath(Application.ExeName)+'ImagenesCalidad\' ,
                      DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,
                      DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString);
end;

procedure TFrm_ControlCalidad.btnCambiarFolioClick(Sender: TObject);
var
  ArchivoImagen : TSearchRec;
  iResultado    : integer;
  Directory     : TFileName;
  NombreArchivo : TFileName;
  Version       : integer;
  VersionImagen : string;
begin
  Directory  := 'C:\Digitalizacion\UNIANDES\CALIDAD\';
  Directory  := StringReplace(Directory, '\\', '\', [rfReplaceAll]);
  Directory  := IncludeTrailingBackslash(Directory);
  iResultado :=  FindFirst(Directory + '*.tif', faAnyFile, ArchivoImagen);
  if iResultado = 0 then
  begin
    if Application.MessageBox('�Est� seguro que desea cambiar la imagen seleccionada?','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
    begin
      while (iResultado = 0) do
      begin
        if (ArchivoImagen.Attr and faArchive = faArchive) and (ArchivoImagen.Attr and faDirectory <> faDirectory) then
        begin
          Version       := DAOControlCalidad.cdsDatosFolio.FieldByName('Version').AsInteger + 1;
          VersionImagen := Copy (DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString, 1, Length(DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString)-6) + LlenarCerosIzquierda('2',Version)+'.tif';
          Directory := 'C:\Digitalizacion\UNIANDES\CALIDAD\' + ArchivoImagen.Name;
          NombreArchivo := 'C:\Digitalizacion\UNIANDES\CALIDAD\' + DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString;
          RenameFile (Directory, NombreArchivo);

          PublicarImagen ('C:\Digitalizacion\UNIANDES\CALIDAD\', DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString, DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,  VersionImagen);

          DAOControlCalidad.ActualizarPublicacion(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, imgImagenCalidad.Graphic.XDotsPerInch, imgImagenCalidad.Graphic.YDotsPerInch, TamanoArchivo(Directory),
                                                  Version,  DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString, FTP.IPServidor, DireccIP, VersionImagen);

          if NOT DeleteFile(ExtractFilePath(Application.ExeName)+'ImagenesCalidad\'+DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString) then
            ShowMessage(fileName+' Error al borara la imagen original : '+ IntToStr(GetLastError));
          if NOT DeleteFile ('C:\Digitalizacion\UNIANDES\CALIDAD\'+DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString) then
            ShowMessage(fileName+' Error al borara la imagen original : '+ IntToStr(GetLastError));
          {SE ACTUALIZA EL CLIENTDATASET CON LA NUEVA IMAGEN PARA QUE SE MUESTRE}
          DAOControlCalidad.cdsDatosFolio.Edit;
          DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString  := VersionImagen;
          DAOControlCalidad.cdsDatosFolio.FieldByName('Version').AsInteger      := Version;
          if MostrarImagen (ExtractFilePath(Application.ExeName)+'ImagenesCalidad\' , DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,
                          DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString) then
          begin
            if NOT DAOControlCalidad.cdsDatosFolio.FieldByName('ChequeoCalidad').AsBoolean then
              DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, True, 0);
            ShowMessage('La Imagen se reemplaz� con �xito. ' + #13#10
                        + ' El nombre de la nueva imagen es: ['
                        + DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString
                        + '].')
          end;
          break;
        end;
        iResultado := FindNext(ArchivoImagen);
      end;
    end;
  end
  else
    ShowMessage('En la Carpeta de Trabajo no existe el archivo de imagen por el cual se va a reemplazar.');

  btnNovedad.Caption := 'Novedad';
  HabilitarBotones(2);
end;

procedure TFrm_ControlCalidad.btnCapturableClick(Sender: TObject);
begin
  if btnCapturable.Caption = 'NO Capturable' then
    begin
      if Application.MessageBox ('Este proceso marca el folio como NO CAPTURABLE. �Desea Continuar? ','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
        if DAOControlCalidad.MarcarCapturable(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, 1) then
          ShowMessage('Se ha realizado el cambio de forma satisfactoria (Folio NO CAPTURABLE) ...');
  end else
     begin
       if Application.MessageBox ('Este proceso marca el folio como CAPTURABLE. �Desea Continuar? ','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
         if DAOControlCalidad.MarcarCapturable(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, 2) then
           ShowMessage('Se ha realizado el cambio de forma satisfactoria (Folio CAPTURABLE) ...');
     end;
end;

procedure TFrm_ControlCalidad.btnDerechaClick(Sender: TObject);
begin
  Inc(PosFolio);
  if PosFolio > NoFolios then
    PosFolio := NoFolios;
  lblFolios.Caption := 'Folio '+LlenarCerosIzquierda('4',PosFolio)+' de '+LlenarCerosIzquierda('4',NoFolios);
  {SE OCULTA MOMENTANEAMENTE EL BOTON PARA QUE NO LE DEN CLICK SEGUIDO Y PASE LAS IM�GENES RAPIDO}
  btnDerecha.Visible:= False;
  Application.ProcessMessages;
  if NOT DAOControlCalidad.cdsDatosFolio.Eof then
  begin
    DAOControlCalidad.cdsDatosFolio.Next;
    edFolio.Text := DAOControlCalidad.cdsDatosFolio.FieldByName('CodigoFolio').AsString;
    if MostrarImagen (ExtractFilePath(Application.ExeName)+'ImagenesCalidad\' ,
                        DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,
                        DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString)  then
      {SI SE PUDO  MOSTRAR LA IMAGEN SE CHEQUEA CALIDAD}
      DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, True, FolioBloqueo)
    else
      {SI NO SE PUDO  MOSTRAR LA IMAGEN SE DESCHEQUEA CALIDAD}
      DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, False, FolioBloqueo);
    FolioBloqueo := DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger;
    end
  else
     ShowMessage('Fin de las im�genes de la carpeta ...');
  Application.ProcessMessages;
  Sleep(500);
  Application.ProcessMessages;
  {SE MUESTRA EL BOTON DESPUES DE ESPERAR UN SEGUNDO Y DE PROCESAR Y LIMPIAR LA COLA DE EVENTOS }
  btnDerecha.Visible:=True;

end;

procedure TFrm_ControlCalidad.btnFinalizarClick(Sender: TObject);
var
  PathCalidad : string;
begin
  PathCalidad := ExtractFilePath(Application.ExeName)+'ImagenesCalidad\';

  if Application.MessageBox ('�Desea Finalizar esta Carpeta?','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
  begin
      if DAOControlCalidad.ValidarFolios(DAOControlCalidad.dsCarpeta.DataSet.FieldByName('idCarpeta').AsInteger) then
      begin
        if TDirectory.Exists(PathCalidad, True) then
          TDirectory.Delete(PathCalidad, True);
        DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, True, FolioBloqueo);
        DAOControlCalidad.CambiarEstado(DAOControlCalidad.dsCarpeta.DataSet.FieldByName('idCarpeta').AsInteger);
        edBuscarCaja.Text := '';
        grpFolio.Enabled := False;
        dbtxtDescripcionSerieDocumental.Caption := '';
        edFolio.Text := '';
        dbeCaja.Text := '';
        dbeCodigoCarpeta.Text := '';
        dbeDescripcionSubSerieDocumental.Text := '';
        edBuscarCaja.SetFocus;
      end
      else
        ShowMessage('No coincide el n�mero de folios con los analizados en Calidad ...');

  end;
end;

procedure TFrm_ControlCalidad.btnIdentificacionClick(Sender: TObject);
begin
  if Application.MessageBox ('�Est� seguro que desea marcar este folio como identificaci�n asociada a la carpeta?','Informaci�n', MB_OKCANCEL + MB_ICONINFORMATION) = ID_OK then
    begin
    if frm_Identificacion.ShowModal = mrOK then
      frm_Identificacion.Visible := True;
    ShowMessage('Cambio realizado con �xito ...');
  end;
end;

procedure TFrm_ControlCalidad.btnNovedadClick(Sender: TObject);
begin
  if btnNovedad.Caption = 'Novedad' then
    begin
      btnNovedad.Caption := 'Cancelar';
      HabilitarBotones(1);
  end else
     begin
       btnNovedad.Caption := 'Novedad';
       HabilitarBotones(2);
     end;
end;

procedure TFrm_ControlCalidad.btnNuevoClick(Sender: TObject);
begin
  FolioBloqueo := 0;
  NoFolios := DAOControlCalidad.DatosFolio(DAOControlCalidad.dsCarpeta.DataSet.FieldByName('idCarpeta').AsInteger);
  PosFolio := 1;
  lblFolios.Caption := 'Folio '+LlenarCerosIzquierda('4',PosFolio)+' de '+LlenarCerosIzquierda('4',NoFolios);
  DAOControlCalidad.cdsDatosFolio.First;
  edFolio.Text := DAOControlCalidad.cdsDatosFolio.FieldByName('CodigoFolio').AsString;
  FolioBloqueo := DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger;
  if MostrarImagen (ExtractFilePath(Application.ExeName)+'ImagenesCalidad\' ,
                    DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,
                    DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString) then
    {SI SE PUDO  MOSTRAR LA IMAGEN SE CHEQUEA CALIDAD}
    DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, True, FolioBloqueo)
  else
    {SI NO SE PUDO  MOSTRAR LA IMAGEN SE DESCHEQUEA CALIDAD}
    DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, False, FolioBloqueo);
end;

procedure TFrm_ControlCalidad.btnTestigoClick(Sender: TObject);
begin
  if frm_Testigo.ShowModal = mrOk then
    frm_Testigo.Visible := True;
end;

procedure TFrm_ControlCalidad.ConfigurarAmbiente;
begin
  NombModu:= 'MODULOCONTROLCALIDAD';
  VersModu:= '20160902.M01';

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  VerificarVersion(NombModu,VersModu);
  Frm_ControlCalidad.Caption:= 'Control Calidad - [ Versi�n ' + VersModu + ' ]';
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  statInformacion.Panels[0].Text :='Usuario: ' + ParamStr(1);
  statInformacion.Panels[1].Text :='IP: ' + DireccIP;
  statInformacion.Panels[2].Text :='Ambiente: ' + DMConexion.Ambiente;
end;


procedure TFrm_ControlCalidad.ConfigurarDirectorios;
begin
  try //Directorios a validar
    CarpImag := TCliente.create;
    CarpImag.ConfigurarCliente;
    if not DirectoryExists(CarpImag.RutaScanner) then
      ForceDirectories(CarpImag.RutaScanner);
    if not DirectoryExists(CarpImag.RutaNovedad) then
      ForceDirectories(CarpImag.RutaNovedad);
    if not DirectoryExists(CarpImag.RutaProceso) then
      ForceDirectories(CarpImag.RutaProceso);
    if not DirectoryExists(CarpImag.RutaPublicado) then
      ForceDirectories(CarpImag.RutaPublicado);
    if not DirectoryExists(CarpImag.RutaCalidad) then
      ForceDirectories(CarpImag.RutaCalidad);
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'ImagenesCalidad') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'ImagenesCalidad');
  except
    on e:exception do
      begin
        Application.MessageBox(PChar(e.Message), 'Publicaci�n de Im�genes',MB_OK OR MB_ICONERROR);
        Application.Terminate;
    end;
  end;
end;

procedure TFrm_ControlCalidad.ConfigurarFTP;
begin
  try
    FTP  := TFTP.Create;
    FTP.ConfigurarFTP;
    if not FTP.TestConexion then
      begin
        Application.MessageBox('Error, no se estableci� conexi�n con el FTP. Favor Verificar. ', 'Publicaci�n de Im�genes',MB_OK OR MB_ICONERROR);
        Application.Terminate;
    end;
  except
    on e:exception do
      begin
        Application.MessageBox(PChar(e.Message), 'Control Calidad de Im�genes',MB_OK OR MB_ICONERROR);
        Application.Terminate;
    end;
  end;
end;


procedure TFrm_ControlCalidad.edBuscarCajaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if DAOControlCalidad.BuscarCaja(edBuscarCaja.Text) then
    begin
      DAOControlCalidad.dsCarpeta.DataSet.First;
      if DAOControlCalidad.cdsCarpeta.FieldByName('DescripcionTipoSerieDocumental').AsString =
                                                  'HISTORIAS LABORALES' then
      begin
        btnCapturable.Caption := 'Capturable';
        DAOControlCalidad.MarcarNoCapturable(DAOControlCalidad.dsCarpeta.DataSet.FieldByName('idCarpeta').AsInteger);
      end;
      grpFolio.Enabled := True;
    end
    else
       ShowMessage('No se encontr� la Carpeta o no esta disponible para este m�dulo ...');
end;

procedure TFrm_ControlCalidad.edNoFolioKeyPress(Sender: TObject; var Key: Char);
var
   i : integer;
begin
  if Key = #13 then
    begin
      if edNoFolio.Text = '' then
        edNoFolio.Text := '1';
      NoFolios := DAOControlCalidad.DatosFolio(DAOControlCalidad.dsCarpeta.DataSet.FieldByName('idCarpeta').AsInteger);
      PosFolio := 0;
      DAOControlCalidad.cdsDatosFolio.First;
      for i := 1 to StrToInt(edNoFolio.Text) do
         begin
           DAOControlCalidad.cdsDatosFolio.Next;
           Inc(PosFolio);
      end;
      lblFolios.Caption := 'Folio '+LlenarCerosIzquierda('4',PosFolio)+' de '+LlenarCerosIzquierda('4',NoFolios);
      edFolio.Text := DAOControlCalidad.cdsDatosFolio.FieldByName('CodigoFolio').AsString;
      if MostrarImagen (ExtractFilePath(Application.ExeName)+'ImagenesCalidad\' ,
                        DAOControlCalidad.cdsDatosFolio.FieldByName('RutaFTP').AsString,
                        DAOControlCalidad.cdsDatosFolio.FieldByName('NombreImagen').AsString) then
        {SI SE PUDO  MOSTRAR LA IMAGEN SE CHEQUEA CALIDAD}
        DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, True, FolioBloqueo)
      else
        {SI NO SE PUDO  MOSTRAR LA IMAGEN SE DESCHEQUEA CALIDAD}
        DAOControlCalidad.ChequeoCalidad(DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger, False, FolioBloqueo);
      FolioBloqueo := DAOControlCalidad.cdsDatosFolio.FieldByName('idFolio').AsInteger;
  end;
end;


procedure TFrm_ControlCalidad.edtZoomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
    imgImagenCalidad.ZoomPercent := StrToInt(edtZoom.Text);
    scrlbrZoom.Position := StrToInt(edtZoom.Text);
  end;
end;

procedure TFrm_ControlCalidad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  PathCalidad : string;
begin
  PathCalidad := ExtractFilePath(Application.ExeName)+'ImagenesCalidad\';
  if TDirectory.Exists(PathCalidad, True) then
    TDirectory.Delete(PathCalidad, True);
end;


procedure TFrm_ControlCalidad.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
  ConfigurarFtp;
  ConfigurarDirectorios;
  scrlbrZoom.Position := 100;
end;

procedure TFrm_ControlCalidad.HabilitarBotones(Criterio: integer);
begin
  case Criterio of
           1 : begin
                 btnTestigo.Enabled := False;
                 btnFinalizar.Enabled := False;
                 btnIdentificacion.Enabled := False;
                 btnDerecha.Enabled := False;
                 btnIzquierda.Enabled := False;
                 btnCambiarFolio.Visible := True;
                 btnNuevo.Visible := False;
               end;
           2 : begin
                 btnTestigo.Enabled := True;
                 btnFinalizar.Enabled := True;
                 btnIdentificacion.Enabled := True;
                 btnDerecha.Enabled := True;
                 btnIzquierda.Enabled := True;
                 btnCambiarFolio.Visible := False;
                 btnNuevo.Visible := True;
               end;
  end;
end;

function TFrm_ControlCalidad.MostrarImagen (Ruta, RutaFTP, NombreImagen : string):boolean;
var
  MensErro: string;
begin
  result := true;
  RpnMensajeImagen.Visible:= False;
  if FileExists(Ruta+NombreImagen) then
  begin
      {MOSTRAR IMAGEN}
      if AnsiCompareStr(imgImagenCalidad.FileName, Ruta) <> 0 then
        begin
          FileName := Ruta+NombreImagen;
          imgImagenCalidad.AntiAliased := False;
          imgImagenCalidad.LoadFromFile(FileName, 1);
          imgImagenCalidad.ZoomMode := zmFitWidth;
          //imgImagenCalidad.ZoomPercent := scrlbrZoom.Position;
          imgImagenCalidad.MouseMode := mmAnnotate;
      end;
  end
  else
  begin
   {TRAER IMAGEN}
    try
      FTP.ConectarFTP;
      FTP.BajarArchivo(RutaFTP, NombreImagen, Ruta);
      FTP.DesconectarFTP;
    except
      MensErro:= 'NO ES POSIBLE DESCARGAR LA IMAGEN' + #13#10
                  + '[' + NombreImagen + ']' + #13#10 + #13#10
                  + 'RAZONES POSIBLES:                                  '
                  + #13#10
                  + '* LA IMAGEN NO EXISTE EN EL SERVIDOR.              '
                  + #13#10
                  + '* HAY UNA FALLA EN LA COMUNICACION CON EL SERVIDOR.'
                  + #13#10 + #13#10
                  + 'Favor intente cargar nuevamene la Imagen. '
                   + #13#10
                  + 'Si la falla continua, Reemplace la Imagen por la opci�n NOVEDAD.';
      Result:= false;
    end;
    if result then
    begin
      try
        FileName := Ruta+NombreImagen;
        imgImagenCalidad.AntiAliased := False;
        imgImagenCalidad.LoadFromFile(FileName, 1);
        imgImagenCalidad.ZoomMode := zmFitWidth;
        //imgImagenCalidad.ZoomPercent := scrlbrZoom.Position;
        imgImagenCalidad.MouseMode := mmAnnotate;
      except
        MensErro:= 'NO ES POSIBLE MOSTRAR LA IMAGEN' + #13#10
                    + '[' + NombreImagen + ']' + #13#10 + #13#10
                    + 'PARAMETROS DE DIGITALIZACI�N INCORRECTOS.'
                    + #13#10 + #13#10
                    + 'Favor Reemplace la Imagen por la opci�n NOVEDAD.';
        Result:= false;
      end;
    end;
    if not result then
    begin
      imgImagenCalidad.clear;
      rxlMensajeImagen.Caption:= MensErro;
      RpnMensajeImagen.Visible:= True;
    end;
  end;
end;

procedure TFrm_ControlCalidad.PublicarImagen (Ruta, NombreArchivo, RutaFTP, NombreImagen  : string);
begin
  FTP.ConectarFTP;
  FTP.SubirArchivo(Ruta, NombreArchivo, RutaFTP, NombreImagen);
end;

Procedure TFrm_ControlCalidad.VerificarVersion(p_NombModu: string;p_VersModu: string);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'CONTROL CALIDAD');
end;

procedure TFrm_ControlCalidad.scrlbrZoomChange(Sender: TObject);
begin
  imgImagenCalidad.ZoomPercent := scrlbrZoom.Position;
  edtZoom.Text := IntToStr(scrlbrZoom.Position);
end;

end.
