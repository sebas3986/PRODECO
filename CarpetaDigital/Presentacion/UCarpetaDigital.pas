﻿unit UCarpetaDigital;

interface

uses
  Windows, SysUtils, StrUtils, StdCtrls, Controls, Classes, Graphics,  Forms, ComCtrls,
  ExtCtrls, Buttons, IdIPWatch, DateUtils,  Mask, variants, DBCtrls, Grids, DBGrids, DB,
  RxCtrls,  RxExtenders,
  UGlobales, UFTP,  UProcesoCarpetaDigi,  UVisor, ULogin,  UProcesoLogin, UDMConexion,
  UProcesoVisor, FPGenerales;



type
  TFrmCarpetaDigital = class(TForm)
    stbBarraEstado: TStatusBar;
    PnlTitulo: TPanel;
    GrpPie: TGroupBox;
    spbSalir: TSpeedButton;
    RpnCriteriosBusqueda: TRxPanel;
    RpnCaptura: TRxPanel;
    GrpCriteriosGenerales: TGroupBox;
    LblTipoBusqueda: TLabel;
    GrpCriteriosPersona: TGroupBox;
    LblNUmeroIdentificacion: TLabel;
    LblPrimerNombre: TLabel;
    LblSegundoNombre: TLabel;
    LblPrimerApellido: TLabel;
    LblSegundoApellido: TLabel;
    EdtNumeroDocumento: TEdit;
    EdtPrimerNombre: TEdit;
    EdtSegundoNombre: TEdit;
    EdtPrimerApellido: TEdit;
    EdtSegundoApellido: TEdit;
    GrpOpcionesBusqueda: TGroupBox;
    cbxTipoBusqueda: TComboBox;
    PnlSeleccionCarpeta: TPanel;
    EdtCodigoCarpeta: TEdit;
    PnlSeleccionSerieDocu: TPanel;
    LblSerieDocumental: TLabel;
    dblSerieDocumental: TDBLookupComboBox;
    LblTipoIdentificacion: TLabel;
    LblCodigoCarpeta: TLabel;
    dblTipoIdentificacion: TDBLookupComboBox;
    spbConsultarCarpeta: TSpeedButton;
    LblEme: TLabel;
    RpnOtrosCriterios: TRxPanel;
    GrpCiteriosAdicionales: TGroupBox;
    RpnInformacionImagen: TRxPanel;
    GrpBaseDatos: TGroupBox;
    RpnBusqueda: TRxPanel;
    RpnBuscando: TRxPanel;
    RpnMensajePersonas: TRxPanel;
    rxlMensajePersonas: TRxLabel;
    dbgPersonas: TDBGrid;
    LblPersonas: TLabel;
    spbCancelarLimpiar: TSpeedButton;
    RpnErrorCarpeta: TRxPanel;
    spbConsultarPersona: TSpeedButton;
    RpnErrorPersona: TRxPanel;
    PnlMensajeAdicionales: TPanel;
    LblMensajeAdicionales: TLabel;
    PnlCriteriosPlanillas: TPanel;
    LblFechaNominaFinal: TLabel;
    LbLFechaNominaInicial: TLabel;
    mkeFechaNominaInicial: TMaskEdit;
    mkeFechaNominaFinal: TMaskEdit;
    PnlCriteriosAportes: TPanel;
    GrpFechaPago: TGroupBox;
    LblFechaPagoInicial: TLabel;
    LblFechaPagoFinal: TLabel;
    mkeFechaPagoInicial: TMaskEdit;
    mkeFechaPagoFinal: TMaskEdit;
    GrpPeriodoCotizacion: TGroupBox;
    LblPeriodoInicial: TLabel;
    LblPeriodoFinal: TLabel;
    mkePeriodoInicial: TMaskEdit;
    mkePeriodoFinal: TMaskEdit;
    LblFondo: TLabel;
    dblFondo: TDBLookupComboBox;
    chkFechaPago: TCheckBox;
    chkPeriodo: TCheckBox;
    bbtConsultarBD: TBitBtn;
    LblCantidadRegistros: TLabel;

    procedure bbtConsultarBDClick(Sender: TObject);
    procedure dbgPersonasDblClick(Sender: TObject);
    {DECLARACIÓN DEL EVENTO DataChange DEL DATASOURCE QUE SE ENCUENTRA EN EL DbGrid}
    procedure dbgPersonasDataSourceDataChange(Sender: TObject; Field: TField);
    procedure dblTipoIdentificacionEnter(Sender: TObject);
    procedure dblTipoIdentificacionCloseUp(Sender: TObject);
    procedure EdtNumeroDocumentoChange(Sender: TObject);
    procedure EdtNumeroDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrimerApellidoChange(Sender: TObject);
    procedure EdtPrimerApellidoExit(Sender: TObject);
    procedure EdtPrimerApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrimerNombreChange(Sender: TObject);
    procedure EdtPrimerNombreKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrimerNombreExit(Sender: TObject);
    procedure EdtSegundoApellidoChange(Sender: TObject);
    procedure EdtSegundoApellidoExit(Sender: TObject);
    procedure EdtSegundoApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSegundoNombreChange(Sender: TObject);
    procedure EdtSegundoNombreExit(Sender: TObject);
    procedure EdtSegundoNombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure spbCancelarLimpiarClick(Sender: TObject);
    procedure spbSalirClick(Sender: TObject);
    procedure cbxTipoBusquedaEnter(Sender: TObject);
    procedure cbxTipoBusquedaChange(Sender: TObject);
    procedure spbConsultarCarpetaClick(Sender: TObject);
    procedure EdtCodigoCarpetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigoCarpetaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbConsultarPersonaClick(Sender: TObject);
    procedure dblSerieDocumentalEnter(Sender: TObject);
    procedure dblSerieDocumentalClick(Sender: TObject);
    procedure mkeFechaNominaInicialChange(Sender: TObject);
    procedure mkeFechaNominaFinalChange(Sender: TObject);
    procedure mkeFechaNominaInicialExit(Sender: TObject);
    procedure mkeFechaNominaFinalExit(Sender: TObject);
    procedure dblFondoEnter(Sender: TObject);
    procedure chkFechaPagoClick(Sender: TObject);
    procedure chkPeriodoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblFondoCloseUp(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ActivarBusquedaFondo(p_TipoFond: string);
    Procedure ActivarBusquedaPersona;
    Procedure ActivarBusquedaSerie;
    procedure ConfigurarAmbiente;
    procedure HabilitarFechaPago;
    procedure HabilitarPeriodo;
    procedure InhabilitarFechaPago;
    procedure InhabilitarPeriodo;
    procedure LimpiarBases;
    procedure LimpiarCriteriosAdicionales;
    procedure LimpiarCriteriosPersona;
    procedure LimpiarFormulario;
    procedure LlenarArbol;
    procedure MostrarDatosImagen;
    procedure MostrarDatosPersonas;
    function  ValidarCriteriosAdicionales: Boolean;
    function  ValidarFecha(p_FechAval: string; p_FechCont: string;
                                                p_TipoFech:string): string;
    function  ValidarFechasCompletas(p_FechInic: string; p_FechFina: string):Boolean;

  end;

var

  DireccIP          : String;
  FrmCarpetaDigital : TFrmCarpetaDigital;
  FrmVisor          : TFrmVisor;
  FrmLogin          : TFrmLogin;
  FondSele          : Integer;
  IdenPers          : Int32;
  IndiBorrGrid      : Boolean;
  NombModu          : string;
  TipoIdenSele      : Integer;
  TipoSeriDocu      : string;
  TipoCapt          : Char;
  ProcCarp          : TProcesoCarpetaDigi;
  ProcLogi          : TProcesoLogin;
  ProcViso          : TProcesoVisor;
  SeleSedo          : Int64;
  VersModu          : string;
const
  DifeAnio          : Int16 = 5 ;

implementation

{$R *.dfm}

{$REGION 'EVENTOS' }

procedure TFrmCarpetaDigital.bbtConsultarBDClick(Sender: TObject);
var
  DiaaMaxi: string;
begin
  if dbgPersonas.DataSource <> nil then
    LimpiarBases;
  rpnBuscando.Visible := true;
  Application.ProcessMessages;
  Sleep(800);
  if mkePeriodoFinal.text <> '  /    ' then
    DiaaMaxi:= IntToStr(daysinamonth(StrToInt(AnsiRightstr(mkePeriodoFinal.Text,4)),
                                     StrToInt(AnsiLeftStr(mkePeriodoFinal.Text,2))));

  ProcCarp.ObtenerDatosMtiAndes(dblTipoIdentificacion.KeyValue,EdtNumeroDocumento.Text,
                EdtPrimerNombre.Text, EdtPrimerApellido.text,
                dblSerieDocumental.KeyValue,
                ifthen(mkeFechaNominaInicial.text = '  /  /    ','',
                        FormatDateTime('yyyy-mm-dd',StrToDateDef(mkeFechaNominaInicial.text,0))),
                ifthen(mkeFechaNominaFinal.text = '  /  /    ','',
                        FormatDateTime('yyyy-mm-dd',StrToDateDef(mkeFechaNominaFinal.text,0))),
                ifthen(mkeFechaPagoInicial.text = '  /  /    ','',
                        FormatDateTime('yyyy-mm-dd',StrToDateDef(mkeFechaPagoInicial.text,0))),
                ifthen(mkeFechaPagoFinal.text = '  /  /    ','',
                        FormatDateTime('yyyy-mm-dd',StrToDateDef(mkeFechaPagoFinal.text,0))),
                ifthen(mkePeriodoInicial.text = '  /    ','',
                        FormatDateTime('yyyy-mm-dd',StrToDateDef('01/' + mkePeriodoInicial.text,0))),
                ifthen(mkePeriodoFinal.text = '  /    ','',
                        FormatDateTime('yyyy-mm-dd',
                                       StrToDateDef(DiaaMaxi + '/' + mkePeriodoFinal.text,0))),
                dblFondo.KeyValue);

  rpnBuscando.Visible:= False;
  LblPersonas.Caption:= 'BASE DE DATOS PERSONAS - UNIANDES';
  LblPersonas.Color:= $0000D2D2;
  if ProcCarp.DatosMtiAndes.DataSet.RecordCount > 0 then
    MostrarDatosPersonas
  else
    RpnMensajePersonas.Visible:= True;
end;

procedure TFrmCarpetaDigital.cbxTipoBusquedaChange(Sender: TObject);
begin
  LimpiarCriteriosPersona;
  LimpiarCriteriosAdicionales;
  PnlCriteriosAportes.Visible   := False;
  PnlCriteriosPlanillas.Visible := False;
  PnlMensajeAdicionales.Visible := False;
  GrpCriteriosPersona.Enabled := False;
  spbCancelarLimpiar.Enabled:=False;
  PnlSeleccionCarpeta.Visible:=False;
  PnlSeleccionSerieDocu.Visible:=False;
  dblSerieDocumental.KeyValue := -1;
  if cbxTipoBusqueda.Text = 'SERIE DOCUMENTAL' then
    ActivarBusquedaSerie
  else
    if cbxTipoBusqueda.Text = 'CARPETA' then
    begin
      EdtCodigoCarpeta.Text:='';
      PnlSeleccionCarpeta.Visible:=True;
      EdtCodigoCarpeta.SetFocus;
    end
    else
    begin
      if cbxTipoBusqueda.Text = 'EMPLEADO' then
        ActivarBusquedaPersona;
    end;
end;


procedure TFrmCarpetaDigital.cbxTipoBusquedaEnter(Sender: TObject);
var
  CursAnte : SmallInt;
begin
  if  TipoCapt = '*' then
  begin
      cbxTipoBusqueda.DroppedDown:=true;
      {ES NECESARIA LA SIGUIENTE LÍNEA PARA RECUPERAR EL CURSOR YA QUE LA PROPIEDAD
        DROPPEDDOWN LE COLOCA OTRO CURSOR}
      Screen.Cursor := crArrow;
      TipoCapt:=#0;
  end;
end;

procedure TFrmCarpetaDigital.chkFechaPagoClick(Sender: TObject);
begin
  if chkFechaPago.Checked then
  begin
    HabilitarFechaPago;
    InhabilitarPeriodo;
    chkPeriodo.Checked:= False;
  end
  else
    InhabilitarFechaPago;
end;

procedure TFrmCarpetaDigital.chkPeriodoClick(Sender: TObject);
begin
  if chkPeriodo.Checked  then
  begin
    HabilitarPeriodo;
    InhabilitarFechaPago;
    chkFechaPago.Checked:= False;
  end
  else
    InhabilitarPeriodo;
end;

procedure TFrmCarpetaDigital.dbgPersonasDblClick(Sender: TObject);

begin
  IndiBorrGrid:= False;
  with dbgPersonas.DataSource.DataSet do
  begin
    GrpCriteriosGenerales.Enabled :=False;
    GrpCriteriosPersona.Enabled   :=False;
    PnlCriteriosPlanillas.Enabled :=False;
    PnlCriteriosAportes.Enabled   :=false;
    dblTipoIdentificacion.KeyValue:= FieldByName('idtipoidentificacion').asstring;
    IdenPers                      := FieldByName('idpersona').Value;
    EdtNumeroDocumento.text       := FieldByName('numerodocumento').asstring;
    EdtPrimerNombre.text          := FieldByName('primernombre').asstring;
    EdtSegundoNombre.text         := FieldByName('segundonombre').asstring;
    EdtPrimerApellido.text        := FieldByName('primerapellido').asstring;
    EdtSegundoApellido.text       := FieldByName('segundoapellido').asstring;
    bbtConsultarBD.Enabled        := False;
    spbConsultarPersona.Enabled   := True;
    RpnErrorPersona.Visible       := False;
  end;
end;

{DEFINICIÓN DEL EVENTO DataChange DEL DATASOURCE QUE SE ENCUENTRA EN EL DbGrid}
procedure TFrmCarpetaDigital.dbgPersonasDataSourceDataChange(Sender: TObject; Field: TField);
begin
  with (Sender as TDataSource) do
    LblCantidadRegistros.Caption:= ' Registro [ '
                                    + formatfloat('#,##0',DataSet.RecNo) + ' de '
                                    + formatfloat('#,##0',DataSet.RecordCount)+ ' ] ';
end;

procedure TFrmCarpetaDigital.dblFondoEnter(Sender: TObject);
begin
  FondSele := dblFondo.KeyValue;
  dblFondo.DropDown;
end;

procedure TFrmCarpetaDigital.dblFondoCloseUp(Sender: TObject);
begin
  if FondSele <> dblFondo.KeyValue then
  begin
    LimpiarBases;
    dblTipoIdentificacionCloseUp(Sender);
  end;

end;

procedure TFrmCarpetaDigital.dblSerieDocumentalClick(Sender: TObject);

begin
  if SeleSedo <> dblSerieDocumental.KeyValue then
  begin
    LimpiarCriteriosAdicionales;
    LimpiarBases;
    PnlCriteriosAportes.Visible  := False;
    PnlCriteriosPlanillas.Visible:= False;
    PnlMensajeAdicionales.Visible:= False;
  end;
  ActivarBusquedaPersona;
  with  ProcCarp.SeriesDocumentales.DataSet do
  begin
    TipoSeriDocu:= FieldByName('descripciontiposeriedocumental').Value;
    if  TipoSeriDocu = 'PLANILLAS DE APORTES' then
    begin
      if FieldByName('descripcionseriedocumental').Value = 'APORTES SEGURIDAD PENSIÓN' then
        ActivarBusquedaFondo('PENSIÓN')
      else
        if FieldByName('descripcionseriedocumental').Value = 'APORTES SEGURIDAD SALUD' then
          ActivarBusquedaFondo('SALUD')
        else
          if FieldByName('descripcionseriedocumental').Value = 'PLANILLAS APORTES RIESGOS PROFESIONALES' then
            ActivarBusquedaFondo('ARL')
          else
            ActivarBusquedaFondo('');
      PnlMensajeAdicionales.Visible:=True;
      PnlCriteriosAportes.Visible:=True;
      PnlCriteriosAportes.Enabled:=True;
    end
    else
      if TipoSeriDocu = 'PLANILLAS DE NÓMINA' then
      begin
        PnlMensajeAdicionales.Visible:=True;
        PnlCriteriosPlanillas.Visible:=True;
        PnlCriteriosPlanillas.Enabled:=True;
      end;
  end;
end;

procedure TFrmCarpetaDigital.dblSerieDocumentalEnter(Sender: TObject);
begin
  dblSerieDocumental.DropDown;
  SeleSedo :=  dblSerieDocumental.KeyValue;
end;

procedure TFrmCarpetaDigital.dblTipoIdentificacionCloseUp(Sender: TObject);
begin
  if dblTipoIdentificacion.KeyValue <> TipoIdenSele then
  begin
    TipoIdenSele:= dblTipoIdentificacion.KeyValue;
    LimpiarBases;
  end;
  if (dblTipoIdentificacion.Text <> '') or (EdtNumeroDocumento.Text <> '') or
      (EdtPrimerNombre.Text <> '') or (EdtPrimerApellido.text <> '') or
      (EdtSegundoNombre.Text <> '') or (EdtSegundoApellido.Text <> '') or
      (mkeFechaNominaInicial.Text <> '  /  /    ') or
      (mkeFechaNominaFinal.Text <> '  /  /    ' ) then
    spbCancelarLimpiar.Enabled:= true
  else
    spbCancelarLimpiar.Enabled:= False;

  if ((dblTipoIdentificacion.Text <> '') and
                  ((EdtNumeroDocumento.Text <> '') or
                   (EdtPrimerNombre.Text <> '') or
                   (EdtPrimerApellido.text <> ''))) or
        (EdtNumeroDocumento.Text <> '') or (EdtPrimerNombre.Text <> '') or
        (EdtPrimerApellido.text <> '')  then
    begin
      if ValidarCriteriosAdicionales then
        bbtConsultarBD.Enabled:= true
      else
        bbtConsultarBD.Enabled:= False;
    end
  else
    bbtConsultarBD.Enabled:= False;
end;


procedure TFrmCarpetaDigital.dblTipoIdentificacionEnter(Sender: TObject);
begin
  if dblTipoIdentificacion.KeyValue <> null then
    TipoIdenSele := dblTipoIdentificacion.KeyValue
  else
    TipoIdenSele:= -1;
  dblTipoIdentificacion.DropDown;
end;

procedure TFrmCarpetaDigital.EdtCodigoCarpetaChange(Sender: TObject);
begin
  RpnErrorCarpeta.Visible:=False;
  if Length(EdtCodigoCarpeta.Text) = 8 then
    spbConsultarCarpeta.Enabled:= True
  else
    spbConsultarCarpeta.Enabled:= False;
  if EdtCodigoCarpeta.Text = ''  then
    spbCancelarLimpiar.Enabled:=True
  else
    spbCancelarLimpiar.Enabled:=True;
end;

procedure TFrmCarpetaDigital.EdtCodigoCarpetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key <> #8) and ((Key < '0') or (Key > '9')) then
    Key := #0;

end;

procedure TFrmCarpetaDigital.EdtNumeroDocumentoChange(Sender: TObject);
begin
  LimpiarBases;
  dblTipoIdentificacionCloseUp(Sender);
end;

procedure TFrmCarpetaDigital.EdtNumeroDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;

procedure TFrmCarpetaDigital.EdtPrimerApellidoChange(Sender: TObject);
begin
  LimpiarBases;
  QuitaEspaciosObjtxt(Sender, false);
  dblTipoIdentificacionCloseUp(Sender);
end;

procedure TFrmCarpetaDigital.EdtPrimerApellidoExit(Sender: TObject);
begin
  EdtPrimerNombreExit(Sender);
end;

procedure TFrmCarpetaDigital.EdtPrimerApellidoKeyPress(Sender: TObject; var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;

procedure TFrmCarpetaDigital.EdtPrimerNombreChange(Sender: TObject);
begin
  LimpiarBases;
  QuitaEspaciosObjtxt(Sender, false);
  dblTipoIdentificacionCloseUp(Sender);
end;

procedure TFrmCarpetaDigital.EdtPrimerNombreExit(Sender: TObject);
begin
  (Sender as TEdit).Text:= Trim(ReemplazarTexto((Sender as TEdit).Text,'  ', ' ',
                                          true));
end;

procedure TFrmCarpetaDigital.EdtPrimerNombreKeyPress(Sender: TObject; var Key: Char);
begin
  key:= AnsiUpperCase(Char(Key))[1];
end;

procedure TFrmCarpetaDigital.EdtSegundoApellidoChange(Sender: TObject);
begin
   QuitaEspaciosObjtxt(Sender, false);
end;

procedure TFrmCarpetaDigital.EdtSegundoApellidoExit(Sender: TObject);
begin
   EdtPrimerNombreExit(Sender);
end;

procedure TFrmCarpetaDigital.EdtSegundoApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;

procedure TFrmCarpetaDigital.EdtSegundoNombreChange(Sender: TObject);
begin
   QuitaEspaciosObjtxt(Sender, false);
end;

procedure TFrmCarpetaDigital.EdtSegundoNombreExit(Sender: TObject);
begin
   EdtPrimerNombreExit(Sender);
end;

procedure TFrmCarpetaDigital.EdtSegundoNombreKeyPress(Sender: TObject; var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;


procedure TFrmCarpetaDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Close;
end;

procedure TFrmCarpetaDigital.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Application.MessageBox('Desea Salir del Módulo de Carpeta Digital?', 'Advertencia',
                            MB_ICONINFORMATION + MB_YESNO) = IDYES then
    Halt(0)
  else
    CanClose := False;
end;


procedure TFrmCarpetaDigital.FormCreate(Sender: TObject);
begin
  frmLogin  := TfrmLogin.Create(nil);
  {SE CREAN OBJETOS DE LA CAPA LOGICA }
  ProcCarp  := TProcesoCarpetaDigi.Create;
  ProcLogi  := TProcesoLogin.Create;
  ProcViso  := TProcesoVisor.Create;


end;

procedure TFrmCarpetaDigital.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
end;

procedure TFrmCarpetaDigital.mkeFechaNominaFinalChange(Sender: TObject);
begin
  mkeFechaNominaFinal.Modified:= False;
  LimpiarBases;
  dblTipoIdentificacionCloseUp(Sender);
end;

procedure TFrmCarpetaDigital.mkeFechaNominaFinalExit(Sender: TObject);
var
  ResuVali: string;
begin
  ResuVali:= ValidarFecha(mkeFechaNominaFinal.text,mkeFechaNominaInicial.Text,'F');
  if ResuVali <> '' then
  begin
      Application.MessageBox(PChar(ResuVali), 'Fecha Nómina Final',MB_OK + MB_ICONERROR);
      mkeFechaNominaFinal.SetFocus;
  end;
end;

procedure TFrmCarpetaDigital.mkeFechaNominaInicialChange(Sender: TObject);
begin
  mkeFechaNominaInicial.Modified:= False;
  LimpiarBases;
  dblTipoIdentificacionCloseUp(Sender);
end;

procedure TFrmCarpetaDigital.mkeFechaNominaInicialExit(Sender: TObject);
var
  ResuVali: string;
begin
  ResuVali:= ValidarFecha(mkeFechaNominaInicial.Text,mkeFechaNominaFinal.text,'I');
  if ResuVali <> '' then
  begin
      Application.MessageBox(PChar(ResuVali), 'Fecha Nómina Inicial',MB_OK + MB_ICONERROR);
      mkeFechaNominaInicial.SetFocus;
  end;
end;

procedure TFrmCarpetaDigital.spbCancelarLimpiarClick(Sender: TObject);
begin
  LimpiarFormulario;
  ProcCarp.VerificarVersion(NombModu, VersModu, VeriRuta);
end;

procedure TFrmCarpetaDigital.spbConsultarCarpetaClick(Sender: TObject);
var
  MensErro: string;
begin
  spbCancelarLimpiar.Enabled:= True;
  spbConsultarCarpeta.Enabled:= False;
  MensErro:= ProcCarp.ObtenerDatosArbolCarpeta(EdtCodigoCarpeta.Text);
  if MensErro = '' then
  begin
    MostrarDatosImagen;
    GrpCriteriosGenerales.Enabled:= False;
  end
  else
  begin
    RpnErrorCarpeta.Visible :=True;
    RpnErrorCarpeta.Caption := MensErro;
    {LAS DOS INSTRUCCIONES SIGUIENTES PARA AJUSTAR EL PANEL AL TEXTO DEL ERROR }
    Canvas.Font.Assign(RpnErrorCarpeta.Font);
    RpnErrorCarpeta.Width:= Canvas.TextWidth('  ') + RpnErrorCarpeta.Margins.Left
                            + Canvas.TextWidth(RpnErrorCarpeta.Caption)
                            + RpnErrorCarpeta.Margins.Right ;
  end;
end;

procedure TFrmCarpetaDigital.spbConsultarPersonaClick(Sender: TObject);
var
  DiaaMaxi : string;
  NombComp : string;

begin
  NombComp:= EdtPrimerNombre.Text + ' ' +  EdtSegundoNombre.Text + ' '
            + EdtPrimerApellido.Text + ' ' + EdtSegundoApellido.Text;
  if mkePeriodoFinal.text <> '  /    ' then
    DiaaMaxi:= IntToStr(daysinamonth(StrToInt(AnsiRightstr(mkePeriodoFinal.Text,4)),
                                     StrToInt(AnsiLeftStr(mkePeriodoFinal.Text,2))));

  ProcCarp.ObtenerDatosArbolEmpleado(IdenPers, NombComp, dblSerieDocumental.KeyValue,
                  ifthen(mkeFechaNominaInicial.text = '  /  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef(mkeFechaNominaInicial.text,0))),
                  ifthen(mkeFechaNominaFinal.text = '  /  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef(mkeFechaNominaFinal.text,0))),
                  ifthen(mkeFechaPagoInicial.text = '  /  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef(mkeFechaPagoInicial.text,0))),
                  ifthen(mkeFechaPagoFinal.text = '  /  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef(mkeFechaPagoFinal.text,0))),
                  ifthen(mkePeriodoInicial.text = '  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef('01/' + mkePeriodoInicial.text,0))),
                  ifthen(mkePeriodoFinal.text = '  /    ','',
                         FormatDateTime('yyyy-mm-dd',
                                        StrToDateDef(DiaaMaxi + '/'
                                                      + mkePeriodoFinal.text,0))),
                  dblFondo.keyvalue);

  if not ProcCarp.DatosArbolSelector.IsEmpty then
  begin
    RpnErrorPersona.Visible:=false;
    MostrarDatosImagen;
  end
  else
  begin
    RpnErrorPersona.Visible:=True;
    spbConsultarPersona.Enabled:=false;
  end;
end;

procedure TFrmCarpetaDigital.spbSalirClick(Sender: TObject);
begin
  Self.Close;
end;


{$ENDREGION}

{$REGION 'METODOS PROPIOS'}

Procedure TFrmCarpetaDigital.ActivarBusquedaFondo(p_TipoFond: string);
begin
  ProcCarp.ObtenerFondos(p_TipoFond);
  dblFondo.ListSource:= ProcCarp.Fondos;
  dblFondo.ListField:= 'descripcionfondo';
  dblFondo.KeyField:= 'idfondo';
  dblFondo.KeyValue:= -1;
end;

Procedure TFrmCarpetaDigital.ActivarBusquedaPersona;
begin
  GrpCriteriosPersona.Enabled := True;
  ProcCarp.ObtenerTiposIdentificacion;
  dblTipoIdentificacion.SetFocus;
  dblTipoIdentificacion.ListSource:= ProcCarp.TiposIdentificacion;;
  dblTipoIdentificacion.ListField:= 'descripciontipoidentificacion';
  dblTipoIdentificacion.KeyField:= 'idtipoidentificacion';
  dblTipoIdentificacion.KeyValue:= -1;

end;

Procedure TFrmCarpetaDigital.ActivarBusquedaSerie;
begin
  PnlSeleccionSerieDocu.Visible:=True;
  ProcCarp.ObtenerSeriesDocumentales;
  dblSerieDocumental.ListSource:= ProcCarp.SeriesDocumentales;;
  dblSerieDocumental.ListField:= 'descripcionseriedocumental';
  dblSerieDocumental.KeyField:= 'idseriedocumental';
  dblSerieDocumental.KeyValue:= -1;
  dblSerieDocumental.SetFocus;
end;

procedure TFrmCarpetaDigital.ConfigurarAmbiente;
begin
  {SE CREA EL OBJETO DE LA CAPA LOGICA }
  NombModu  := 'MODULOCARPETADIGITAL';
  VersModu  := '20170706.M01';
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  ProcCarp.VerificarVersion(NombModu, VersModu, VeriRuta);
  FrmCarpetaDigital.Caption:= 'Carpeta Digital - [ Versión  ' + VersModu + ' ]';
  PnlTitulo.Font.Color   := clBlack;
  if DMConexion.Ambiente = 'CLIENTE' then
  begin
    frmLogin.ShowModal;
    FrmLogin.Free;
    PnlTitulo.Caption := PnlTitulo.Caption + ' UNIVERSIDAD DE LOS ANDES';
    stbBarraEstado.Panels[0].Text:= 'Usuario: ' + ProcLogi.DatosUsuarioCarpeta.CodigoUsuarioCarpeta
                                                + ' - '
                                                + ProcLogi.DatosUsuarioCarpeta.NombreUsuarioCarpeta;
  end
  else
  begin
    { SI LA AUTENTICACIÓN ES POR MANAGER USER, SE ASIGNAN DIRECTAMENTE LOS DATOS DEL
      USUARIO A LOS CAMPOS RESPECTIVOS}
    ProcLogi.DatosUsuarioCarpeta.CodigoUsuarioCarpeta     := ParamStr(1);
    ProcLogi.DatosUsuarioCarpeta.NombreUsuarioCarpeta     := ParamStr(2);
    ProcLogi.DatosUsuarioCarpeta.DescripcionPerfilCarpeta := 'MTIOPERADOR';

    stbBarraEstado.Panels[0].Text:='Usuario: ' + ParamStr(1) + ' - ' + ParamStr(2) ;
    if DMConexion.Ambiente = 'DESARROLLO' then
    begin
      PnlTitulo.Font.Color   := clPurple;
      PnlTitulo.Caption := PnlTitulo.Caption + '   [' + DMConexion.Ambiente + ']';
    end;
  end;
  stbBarraEstado.Panels[1].Text:='IP: ' + DireccIP;
  TipoCapt    :='*';
  IndiBorrGrid:= True;
end;

procedure TFrmCarpetaDigital.HabilitarFechaPago;
begin
  grpFechaPago.enabled:= True;
  LblFechaPagoInicial.enabled:= True;
  LblFechaPagoFinal.enabled:= True;
end;

procedure TFrmCarpetaDigital.HabilitarPeriodo;
begin
  grpPeriodoCotizacion.enabled:= True;
  lblPeriodoInicial.enabled:= True;
  lblPeriodoFinal.enabled:= True;
end;

procedure TFrmCarpetaDigital.InhabilitarFechaPago;
begin
  grpFechaPago.enabled:= False;
  lblFechaPagoInicial.enabled:= False;
  lblFechaPagoFinal.enabled:= False;
  mkeFechaPagoInicial.Text:= '  /  /    ';
  mkeFechaPagoFinal.Text:= '  /  /    ';
end;

procedure TFrmCarpetaDigital.InhabilitarPeriodo;
begin
  grpPeriodoCotizacion.enabled:= False;
  lblPeriodoInicial.enabled:= False;
  lblPeriodoFinal.enabled:= False;
  mkePeriodoInicial.Text:= '  /    ';
  mkePeriodoFinal.Text:= '  /    ';
end;
procedure TFrmCarpetaDigital.LimpiarBases;
begin
  if IndiBorrGrid then
  begin
    LblPersonas.Caption:= 'BASE DE DATOS PERSONAS';
    LblPersonas.Color:= clSilver;
    LblCantidadRegistros.Visible:= False;
    dbgPersonas.DataSource:= nil;
    RpnMensajePersonas.Visible:= False;
    GrpBaseDatos.Enabled:= False;
  end;
end;

procedure TFrmCarpetaDigital.LimpiarCriteriosAdicionales;
begin
  mkeFechaNominaInicial.Text:= '  /  /    ';
  mkeFechaNominaFinal.Text:= '  /  /    ';
  mkeFechaPagoInicial.Text:= '  /  /    ';
  mkeFechaPagoFinal.Text:= '  /  /    ';
  mkePeriodoInicial.text:= '  /    ';
  mkePeriodoFinal.text:= '  /    ';
  chkFechaPago.Checked:= False;
  chkPeriodo.Checked  := False;
  dblFondo.KeyValue := -1;
end;

procedure TFrmCarpetaDigital.LimpiarCriteriosPersona;
begin
  EdtNumeroDocumento.text       := '';
  EdtPrimerNombre.text          := '';
  EdtSegundoNombre.text         := '';
  EdtPrimerApellido.text        := '';
  EdtSegundoApellido.text       := '';
  dblTipoIdentificacion.KeyValue:= -1;
  bbtConsultarBD.Enabled        := False;
end;

procedure TFrmCarpetaDigital.LimpiarFormulario;
begin
  GrpCriteriosGenerales.Enabled := True;
  if (cbxTipoBusqueda.Text = 'EMPLEADO') or
      (cbxTipoBusqueda.Text = 'SERIE DOCUMENTAL') then
  begin
    IndiBorrGrid:= True;
    LimpiarBases;
    LimpiarCriteriosPersona;
    GrpCriteriosPersona.Enabled   := True;
    PnlCriteriosAportes.Enabled   := True;
    PnlCriteriosPlanillas.Enabled := True;
    LimpiarCriteriosAdicionales;
    dblTipoIdentificacion.SetFocus;
  end
  else
    if cbxTipoBusqueda.Text = 'CARPETA'  then
    begin
      EdtCodigoCarpeta.Text := '';
      EdtCodigoCarpeta.SetFocus;
    end;
  spbCancelarLimpiar.Enabled:=False;
  RpnErrorCarpeta.Visible:= False;
  RpnErrorPersona.Visible:= False;
  spbConsultarPersona.Enabled:=False;
end;

procedure TFrmCarpetaDigital.LlenarArbol;
var
  NiveUnoo  : TTreeNode;
  NiveDoss  : TTreeNode;
  NiveTres  : TTreeNode;
  NiveCuat  : TTreeNode;
  DatoUnoo  : string;
  DatoDoss  : string;
  DatoTres  : string;

begin
  FrmVisor.TrvSeleccionImagen.Items.Clear;
  with ProcCarp.DatosArbolSelector do
  begin
    First;
    while not Eof do
    begin
      DatoUnoo := FieldByName('REGISTRO').AsString;
      NiveUnoo := FrmVisor.TrvSeleccionImagen.Items.AddChild(nil,FieldByName('NODO').AsString);
      next;
      while (not eof) and (DatoUnoo = FieldByName('PADRE').AsString) do
      begin
        DatoDoss := FieldByName('REGISTRO').AsString;
        NiveDoss := FrmVisor.TrvSeleccionImagen.Items.AddChild(NiveUnoo,FieldByName('NODO').AsString);
        next;
        while (not eof) and (DatoDoss = FieldByName('PADRE').AsString)  do
        begin
          DatoTres := FieldByName('REGISTRO').AsString;
          NiveTres := FrmVisor.TrvSeleccionImagen.Items.AddChild(NiveDoss,FieldByName('NODO').AsString);
          next;
          while (not eof) and (DatoTres = FieldByName('PADRE').AsString)  do
          begin
            if FieldByName('NODO').AsString <> '' then
              NiveCuat := FrmVisor.TrvSeleccionImagen.Items.AddChild(NiveTres ,FieldByName('NODO').AsString);
            Next;
          end;
        end;
      end;
    end;
  end;
end;


procedure tfrmCarpetaDigital.MostrarDatosImagen;
var
  PerfUsua : string;
begin
  { SE CREA EL OBJETO FORMULARIO CON EL VISOR }
  FrmVisor:= TFrmVisor.Create(nil);
  LlenarArbol;
  FrmVisor.TituloUno:= '';
  FrmVisor.TituloDos:= '';
  if (cbxTipoBusqueda.Text = 'EMPLEADO') or
      (cbxTipoBusqueda.Text = 'SERIE DOCUMENTAL')   then
  begin
    FrmVisor.TituloUno:= 'Documento: [ ' + dblTipoIdentificacion.Text + ' - '
                                + EdtNumeroDocumento.Text + ' ]';
    FrmVisor.TituloDos:= 'Empleado : [ ' + EdtPrimerNombre.text + ' '
                              + EdtSegundoNombre.text + ' '
                              + EdtPrimerApellido.text + ' '
                              + EdtSegundoApellido.text + ' ]';
    if cbxTipoBusqueda.Text = 'EMPLEADO' then
      FrmVisor.TituloPrn:='SELECCIÓN DE IMÁGENES POR EMPLEADO'
    ELSE
      FrmVisor.TituloPrn:='SELECCIÓN DE IMÁGENES POR SERIE DOCUMENTAL - '
                          + dblSerieDocumental.Text;
  end
  else
  begin
    if cbxTipoBusqueda.Text = 'CARPETA' then
    begin
      FrmVisor.TituloPrn:='SELECCIÓN DE IMÁGENES POR CARPETA';
      FrmVisor.TituloUno:= 'Carpeta: [ ' + EdtCodigoCarpeta.Text + ' ]';
      PerfUsua := ProcLogi.DatosUsuarioCarpeta.DescripcionPerfilCarpeta;
      if (PerfUsua = 'MTIOPERADOR') or (PerfUsua = 'MTISUPERVISOR') then
      begin
        with ProcCarp.DatosCarpeta do
        begin
          if EtapaCarpetaInse <> '' then
          begin
            FrmVisor.TituloUno:= FrmVisor.TituloUno +   ' ►Estado Creación : ['
                                 + EtapaCarpetaCrea + '] <'
                                 + IfThen(EstadoCarpetaCrea,'Habilitada','InHabilitada') + '>';
            FrmVisor.TituloDos:= StringOfChar(' ',21) + ' ►Estado Inserción: ['
                                 + EtapaCarpetaInse + '] <'
                                 + IfThen(EstadoCarpetaInse,'Habilitada','InHabilitada') + '>';
          end
          else
            FrmVisor.TituloUno:= FrmVisor.TituloUno + ' ►Estado : ['
                                 + EtapaCarpetaCrea + '] <'
                                 + IfThen(EstadoCarpetaCrea,'Habilitada','InHabilitada') + '>';
        end;
      end;
    end;
  end;
  FrmVisor.ShowModal;
  FrmVisor.Free;
end;

procedure TFrmCarpetaDigital.MostrarDatosPersonas;
begin
  dbgPersonas.DataSource      := ProcCarp.DatosMtiAndes;
  {ASIGNACION DEL EVENTO DataChange DEL DataSource ASIGNADO AL DBGRID}
  dbgPersonas.DataSource.OnDataChange := dbgPersonasDataSourceDataChange;
  dbgPersonas.DataSource.DataSet.First;
  LblCantidadRegistros.Visible:= True;
  GrpBaseDatos.Enabled        :=True;
  Application.ProcessMessages;
end;

function TFrmCarpetaDigital.ValidarCriteriosAdicionales: Boolean;
var
  FechInic: TDate;
  FechFina: TDate;
  FechMaxi: TDate;
begin
  result:= False;
  if dblSerieDocumental.Text = 'PLANILLAS DE NÓMINA' then
  begin
    if (mkeFechaNominaInicial.Text = '  /  /    ') and
        (mkeFechaNominaFinal.Text = '  /  /    ' ) then
      Result:=True
    else
     if (Pos(' ',mkeFechaNominaInicial.Text) = 0) and (Pos(' ',mkeFechaNominaFinal.text) = 0) then
        result:= true;
  end
  else
  begin
    if dblSerieDocumental.Text = 'PLANILLAS DE APORTES' then
    begin
      if chkFechaPago.Checked and ((mkeFechaPagoInicial.Text <> '  /  /    ') or
                                      (mkeFechaNominaFinal.Text <> '  /  /    ' )) and
           ValidarFechasCompletas(mkeFechaPagoInicial.Text,mkeFechaNominaFinal.text) then
         result:= True
      else
        if chkPeriodo.Checked and ((mkePeriodoInicial.Text <> '  /    ') or
                                      (mkePeriodoFinal.Text <> '  /    ' )) and
              ValidarFechasCompletas(mkePeriodoInicial.Text,mkePeriodoFinal.text) then
          result:= True;
    end
    else
      result:=true;
  end;
end;

function TFrmCarpetaDigital.ValidarFecha(p_FechAval: string; p_FechCont: string;
                                                             p_TipoFech:string): string;
var
  ErroFech: Boolean;
  FechMaxi: TDate;
  FechMini: TDate;
begin
  ErroFech:= False;
  Result := '';
  if p_FechAval <> '  /  /    ' then
  begin
    if p_FechCont = '  /  /    ' then
    begin
      FechMini:= StrToDate('01/01/1940');
      FechMaxi:= Now();
    end
    else
    begin
      if p_TipoFech = 'I' then
      begin
        FechMini:= IncYear(StrToDate(p_FechCont),-DifeAnio);
        if FechMini < StrToDate('01/01/1940') then
          FechMini:= StrToDate('01/01/1940');
        FechMaxi:= StrToDate(p_FechCont);
      end
      else
      begin
        FechMini:= StrToDate(p_FechCont);
        FechMaxi:= IncYear(StrToDate(p_FechCont),DifeAnio);
        if FechMaxi > Now() then
          FechMaxi:= Now();
      end;
    end;
    if (Pos(' ',p_FechAval) = 0) and
          IsValidDate(StrToInt(AnsiRightstr(p_FechAval,4)),
                      StrToInt(AnsiMidStr(p_FechAval,4,2)),
                      StrtoInt(AnsiLeftStr(p_FechAval,2))) then
    begin
      if (StrToDate(p_FechAval) < FechMini) or (StrToDate(p_FechAval) > FechMaxi) then
        ErroFech:= True;
    end
    else
      ErroFech:=True;
    if ErroFech then
      Result:= 'Fecha Incorrecta. Se admiten fechas entre ['
                + FormatDateTime('dd/mm/yyyy',FechMini) + '] y ['
                + FormatDateTime('dd/mm/yyyy',FechMaxi) + ']'
                + ifthen(p_FechCont = '  /  /    ', '.',
                          ' (Diferencia máxima de ' + IntToStr(DifeAnio)
                          + ifthen(DifeAnio = 1,' año ',' años ') + 'entre fechas).');
  end;
end;

function TFrmCarpetaDigital.ValidarFechasCompletas(p_FechInic: string;
                                                   p_FechFina: string):Boolean;
var
  FechInic: TDate;
  FechFina: TDate;
  FechMaxi: TDate;
begin
  result:= False;
  try
    if (Pos(' ',p_FechInic) = 0) and (Pos(' ',p_FechFina) = 0) then
    begin
      FechInic:= StrToDate(p_FechInic);
      FechFina:= StrToDate(p_FechFina);
      FechMaxi:= IncYear(fechInic,DifeAnio);
      if FechFina <= FechMaxi then
        result:= True;
    end;
  except
      Result:=False;
  end;
end;

{$ENDREGION}

end.
