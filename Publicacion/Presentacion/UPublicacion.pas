unit UPublicacion;

interface

uses
  Windows, Messages, SysUtils,  StdCtrls, Controls, Classes, Graphics, Forms,
  Dialogs,   ExtCtrls, ComCtrls, RxCtrls,   RxSplit, Buttons, IdIPWatch,
  UFtpImagen, UFtpGestor, UCliente, UCarpetaArchivo, UDMConexion, UDMAplicacion, UGlobales;

type
  TfrmPublicacion = class(TForm)
    stbBarraEstado: TStatusBar;
    GrpNovedades: TGroupBox;
    PnlTitulo: TPanel;
    GrpDatosGenerales: TGroupBox;
    RpnDatosGenerales: TRxPanel;
    GrpDatosProcesar: TGroupBox;
    LblCantidadCarpetas: TLabel;
    LblCantidadFolios: TLabel;
    LblProceso: TLabel;
    PnlCantidadCarpetas: TPanel;
    PnlCantidadFolios: TPanel;
    RprProceso: TRxProgress;
    GrpCarpetaProceso: TGroupBox;
    LblCarpetaProceso: TLabel;
    LblAletasCarpeta: TLabel;
    LblFoliosCarpeta: TLabel;
    PnlCarpetaProceso: TPanel;
    PnlAletasCarpeta: TPanel;
    PnlFoliosCarpeta: TPanel;
    GrpPie: TGroupBox;
    GrpPublicados: TGroupBox;
    GrpRenombre: TGroupBox;
    lstNovedades: TTextListBox;
    lstRenombre: TTextListBox;
    lstPublicados: TTextListBox;
    LblNovedades: TLabel;
    LblRenombre: TLabel;
    LblPublicados: TLabel;
    btnPublicar: TSpeedButton;
    btnSalir: TSpeedButton;
    RpnMensaje: TRxPanel;
    tmrMensaje: TTimer;
    procedure FormResize(Sender: TObject);
    procedure btnPublicarClick(Sender: TObject);
    procedure RprProcesoGetText(Position, Percent: Integer; var Text: string);
    procedure tmrMensajeTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    DireccIP  : String;
    procedure ConfigurarAmbiente;
    procedure ConfigurarFTP;
    procedure ConfigurarDirectorios;
    procedure LimpiarControles;
    Procedure VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
  end;

var
  frmPublicacion: TfrmPublicacion;
  CarpImag  : TCliente;     {DATOS DE LAS CARPETAS PARA LAS IMAGENES}
  CantCarp  : Integer;      {CANTIDAD DE CARPETAS A PROCESAR}
  CantFoli  : Integer;      {CANTIDAD DE FOLIOS A PROCESAR}
  MensPubl  : string;
  NombModu  : string;
  VersModu  : string;

implementation

{$R *.dfm}


procedure TfrmPublicacion.btnPublicarClick(Sender: TObject);
var
  CarpFoli: TCarpetaArchivo;
  I:Integer;
begin
  LimpiarControles;
  CarpFoli:= TCarpetaArchivo.Create(CarpImag);
  CantCarp:= CarpFoli.ListaCarpetas.Count;
  CarpFoli.ListaFolios.Last;
  CantFoli:= CarpFoli.ListaFolios.RecordCount;
  CarpFoli.ListaFolios.First;
  if CantCarp > 0  then
    begin
      try
        PnlCantidadCarpetas.Caption:= IntToStr(CantCarp);
        PnlCantidadCarpetas.Refresh;
        PnlCantidadFolios.Caption:=   IntToStr(CantFoli);
        PnlCantidadFolios.Refresh;
        RprProceso.Position := 0;
        RprProceso.Max := CantFoli;
        RpnMensaje.Visible:=True;
        btnPublicar.Enabled:= False;
        btnSalir.Enabled:= False;
        MensPubl:='P U B L I C A N D O';
        //APAGA TEMPORIZADOR PARA HACER PARPADEAR MENSAJE
        tmrMensaje.Enabled:= false;
        CarpFoli.ProcesarPublicacion;
        MensPubl:='P U B L I C A C I � N    F I N A L I Z A D A';
        //ENCIENDE TEMPORIZADOR PARA HACER PARPADEAR MENSAJE
        tmrMensaje.Enabled:=True;
        btnPublicar.Enabled:= True;
        btnSalir.Enabled:= true;
        CarpFoli.Free;
      except
        on E: Exception do
          begin
            Application.MessageBox(PChar('PUBLICACI�N DETENIDA' + #10#13 + e.Message),
                                    'Publicaci�n de Im�genes', MB_OK OR MB_ICONERROR);
            Application.Terminate;
          end;
      end;
    end
  else
  begin
    CarpFoli.Free;
    Application.MessageBox('No existen Carpetas para Procesar','Publicaci�n de Im�genes',
                            MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;
end;


procedure TfrmPublicacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
begin
  if Application.MessageBox('Desea Salir del M�dulo de Publicaci�n?', 'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
    CanClose := True
  else
    CanClose := False;
end;

end;

procedure TfrmPublicacion.FormResize(Sender: TObject);
var
  Ancho : integer;
begin
  Ancho:=  Trunc(Self.Width/3);
  GrpNovedades.Width:= Ancho;
  GrpRenombre.Width:= Ancho;
  RpnMensaje.Left := Trunc((GrpPie.Width-RpnMensaje.Width)/2);
end;



procedure TfrmPublicacion.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
  ConfigurarFtp;
  ConfigurarDirectorios;
end;

procedure TfrmPublicacion.RprProcesoGetText(Position, Percent: Integer;
  var Text: string);
begin
  if Position > 0 then
  begin
    Text:= IntToStr(Position) + ' de ' + inttostr(RprProceso.Max);
  end;
end;

procedure TfrmPublicacion.tmrMensajeTimer(Sender: TObject);
begin
  if RpnMensaje.Caption = '' then
    RpnMensaje.Caption:= MensPubl
  else
    RpnMensaje.Caption:= '';
end;

procedure TfrmPublicacion.btnSalirClick(Sender: TObject);
begin
  Self.Close;
end;

{$REGION 'METODOS PROPIOS}


procedure TfrmPublicacion.ConfigurarAmbiente;
begin
  NombModu:= 'MODULOPUBLICACION';
  VersModu:= '20170706.M01';

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  VerificarVersion(NombModu, VersModu, VeriRuta);
  frmPublicacion.Caption:= 'Publicaci�n de Im�genes - [ Versi�n ' + VersModu + ' ]';

  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  stbBarraEstado.Panels[0].Text:='Usuario: ' + ParamStr(1) + ' - ' + ParamStr(2) ;
  stbBarraEstado.Panels[1].Text:='IP: ' + DireccIP;
  if DMConexion.Ambiente <> 'PRODUCCI�N' then
  begin
    if DMConexion.Ambiente = 'DESARROLLO' then
      PnlTitulo.Font.Color   := clPurple
    else
      if DMConexion.Ambiente = 'PRUEBAS' then
        PnlTitulo.Font.Color   := clMaroon;
    PnlTitulo.Caption := PnlTitulo.Caption + '   [' + DMConexion.Ambiente + ']';
  end;

end;

procedure TfrmPublicacion.ConfigurarFTP;
var
  ConexFtp: TFtpGestor;
  DatosFTP: TFtpImagen;
begin
  try
    DatosFTP  := TFtpImagen.Create;
    ConexFTP := TFtpGestor.Create(DatosFTP.HostFtpImg,DatosFTP.UsuarioFtpImg,
                                  DatosFTP.PasswordFtpImg,DatosFTP.PuertoFtpImg);
    ConexFTP.ConectarFTP;
    ConexFTP.DesconectarFTP;
    ConexFTP.Free;
    DatosFTP.Free;
  except
    on e:exception do
    begin
      Application.MessageBox(PChar(e.Message),
                             'Publicaci�n de Im�genes',MB_OK OR MB_ICONERROR);
      ExitProcess(0);
    end;
  end;
end;


procedure TfrmPublicacion.ConfigurarDirectorios;

begin
  {DIRECTORIOS A VALIDAR}
  try
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
  except
    on e:exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Publicaci�n de Im�genes',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end;
  end;
  end;

procedure TfrmPublicacion.LimpiarControles;
begin
  pnlCantidadCarpetas.caption:= '';
  pnlCantidadCarpetas.Refresh;
  PnlCantidadFolios.Caption :='';
  PnlCantidadFolios.Refresh;
  RprProceso.Position:=0;
  PnlCarpetaProceso.Caption:= '';
  PnlCarpetaProceso.Refresh;
  PnlAletasCarpeta.Caption:= '';
  PnlAletasCarpeta.Refresh;
  PnlFoliosCarpeta.Caption:= '';
  PnlFoliosCarpeta.Refresh;
  lstNovedades.Clear;
  lstNovedades.Refresh;
  lstRenombre.Clear;
  lstRenombre.Refresh;
  lstPublicados.Clear;
  lstPublicados.Refresh;
  RpnMensaje.Visible:=False;
end;

Procedure TfrmPublicacion.VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'PUBLICACI�N DE IM�GENES', p_VeriRuta);
end;

{$ENDREGION}
end.