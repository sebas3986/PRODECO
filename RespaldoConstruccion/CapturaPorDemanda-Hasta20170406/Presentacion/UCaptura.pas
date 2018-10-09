unit UCaptura;

interface

uses
  Windows, Messages, SysUtils, StrUtils, StdCtrls, Controls, Classes, Graphics, Forms,
  dateutils, Dialogs, ExtCtrls, ComCtrls,  Buttons, IdIPWatch, EnImgScr, EnBlowupForm,
  Vcl.Grids,  Vcl.Mask, RxLookup, DB, variants,  System.MaskUtils,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBGrids,
  RxSpin, RxSlider, RxCombos, RxRichEd, RxCtrls,
  UFTP, UCliente, UProcesoCaptura, ULogin, UDMConexion,FPGenerales, Vcl.DBCtrls;

type
  TfrmCaptura = class(TForm)
    stbBarraEstado: TStatusBar;
    PnlTitulo: TPanel;
    GrpPie: TGroupBox;
    spbSalir: TSpeedButton;
    RpnVisor: TRxPanel;
    RpnInformacionImagen: TRxPanel;
    RpnVisorFolio: TRxPanel;
    imsFolio: TImageScrollBox;
    GrpInformacionImagen: TGroupBox;
    stgInfoImagen: TStringGrid;
    LblTiempoCaptura: TLabel;
    LblRegistrosIngresados: TLabel;
    PnlTiempoCaptura: TPanel;
    PnlRegistrosIngresados: TPanel;
    redObservacionFolio: TRxRichEdit;
    chkObservacionFolio: TCheckBox;
    LblObservacionFolio: TLabel;
    spbNuevoFolio: TSpeedButton;
    tmrTiempoFolio: TTimer;
    RpnMensajeGrabar: TRxPanel;
    RpnCapturaDatos: TRxPanel;
    RpnBusqueda: TRxPanel;
    GrpGeneralesNomina: TGroupBox;
    GrpDatosParticulares: TGroupBox;
    RpnCaptura: TRxPanel;
    GrpBusquedaPersonas: TGroupBox;
    LblFechaNomina: TLabel;
    EdtPrimerNombre: TEdit;
    LblTipoIdentificacion: TLabel;
    rlbTipoIdentificacion: TRxDBLookupCombo;
    LblNUmeroIdentificacion: TLabel;
    EdtNumeroDocumento: TEdit;
    LblPrimerNombre: TLabel;
    LblSegundoNombre: TLabel;
    LblPrimerApellido: TLabel;
    LblSegundoApellido: TLabel;
    EdtSegundoNombre: TEdit;
    EdtPrimerApellido: TEdit;
    EdtSegundoApellido: TEdit;
    GrpOpcionesBusqueda: TGroupBox;
    spbBuscarMti: TSpeedButton;
    spbBuscarAndes: TSpeedButton;
    mkeFechaNomina: TMaskEdit;
    dbgPersonas: TDBGrid;
    LblPersonas: TLabel;
    GrpOpcionesGuardar: TGroupBox;
    spbCancelarLimpiar: TSpeedButton;
    spbNuevaPersona: TSpeedButton;
    GrpDatosPersona: TGroupBox;
    spbCancelar: TSpeedButton;
    scrlbx1: TScrollBox;
    cbxZoomPredefinido: TComboBox;
    LblZoomPredefinido: TLabel;
    LblZoomPorcentaje: TLabel;
    rseZoom: TRxSpinEdit;
    RpnRegla: TRxPanel;
    spbRegla: TSpeedButton;
    rslAnchoRegla: TRxSlider;
    ccbColorRegla: TColorComboBox;
    spbLupa: TSpeedButton;
    redObservacionRegistro: TRxRichEdit;
    chkObservacionRegistro: TCheckBox;
    RpnBuscando: TRxPanel;
    LblObservacionesRegistro: TLabel;
    RpnRegistroGuardado: TRxPanel;
    LblNovedadesSinCap: TLabel;
    PnlNovedadesSinCap: TPanel;
    PnlFolioNoCap: TPanel;
    chkFolioNoCap: TRxCheckBox;
    rxlFolioNoCap: TRxLabel;
    GrpGeneralesAportes: TGroupBox;
    LblFechaPagoBanco: TLabel;
    mkeFechaPagoBanco: TMaskEdit;
    LblFondoEntidad: TLabel;
    LblPeriodoCotizacion: TLabel;
    mkePeriodoCotizacion: TMaskEdit;
    spbGuardarRegistro: TSpeedButton;
    PnlSerieDocumental: TPanel;
    GrpGeneralesHistorias: TGroupBox;
    LblTituloHistorias: TLabel;
    dblFondoEntidad: TDBLookupComboBox;
    EdtTemporal: TEdit;
    EdtCodigoFolio: TEdit;
    Lbl1: TLabel;
    dbgAsociados: TDBGrid;
    RpnAsociados: TRxPanel;
    RpnInformacion: TRxPanel;
    LblInformacion: TLabel;
    spbSiguiente: TSpeedButton;
    bbtCambiarFechaNomina: TBitBtn;
    bbtGuardarFechaNomina: TBitBtn;
    spbCancelarFechaNomina: TSpeedButton;
    RpnRealizadosNomina: TRxPanel;
    PnlDatosNomina: TPanel;
    PnlDatosAportes: TPanel;
    bbtCambiarInformacionAportes: TBitBtn;
    bbtGuardarCambiosAportes: TBitBtn;
    spbCancelarCambiosAportes: TSpeedButton;
    RpnRealizadosAportes: TRxPanel;
    procedure FormShow(Sender: TObject);

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure spbSalirClick(Sender: TObject);
    procedure spbNuevoFolioClick(Sender: TObject);
    procedure stgInfoImagenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure tmrTiempoFolioTimer(Sender: TObject);
    procedure chkObservacionFolioClick(Sender: TObject);
    procedure spbTerminaClick(Sender: TObject);
    procedure mkeFechaNominaExit(Sender: TObject);

    procedure rlbTipoIdentificacionChange(Sender: TObject);
    procedure spbBuscarAndesClick(Sender: TObject);
    procedure dbgPersonasDblClick(Sender: TObject);
    procedure spbBuscarMtiClick(Sender: TObject);
    procedure spbCancelarLimpiarClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
    procedure spbNuevaPersonaClick(Sender: TObject);
    procedure EdtPrimerNombreKeyPress(Sender: TObject; var Key: Char);
    procedure cbxZoomPredefinidoChange(Sender: TObject);

    procedure RpnReglaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RpnReglaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RpnReglaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure spbReglaClick(Sender: TObject);
    procedure rslAnchoReglaChanged(Sender: TObject);
    procedure ccbColorReglaChange(Sender: TObject);
    procedure rseZoomChange(Sender: TObject);
    procedure spbLupaClick(Sender: TObject);
    procedure chkObservacionRegistroClick(Sender: TObject);
    procedure mkeFechaNominaChange(Sender: TObject);
    procedure EdtPrimerNombreExit(Sender: TObject);
    procedure chkFolioNoCapClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RpnReglaResize(Sender: TObject);
    procedure redObservacionRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure redObservacionFolioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSegundoNombreExit(Sender: TObject);
    procedure EdtPrimerApellidoExit(Sender: TObject);
    procedure EdtSegundoApellidoExit(Sender: TObject);
    procedure EdtSegundoApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrimerApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSegundoNombreKeyPress(Sender: TObject; var Key: Char);
    procedure redObservacionRegistroChange(Sender: TObject);
    procedure spbGuardarRegistroClick(Sender: TObject);
    procedure EdtPrimerNombreChange(Sender: TObject);
    procedure EdtPrimerApellidoChange(Sender: TObject);
    procedure EdtSegundoNombreChange(Sender: TObject);
    procedure EdtSegundoApellidoChange(Sender: TObject);
    procedure redObservacionFolioChange(Sender: TObject);
    procedure mkeFechaPagoBancoChange(Sender: TObject);
    procedure mkeFechaPagoBancoExit(Sender: TObject);
    procedure mkePeriodoCotizacionChange(Sender: TObject);
    procedure mkePeriodoCotizacionExit(Sender: TObject);
    procedure dblFondoEntidadClick(Sender: TObject);
    procedure EdtTemporalEnter(Sender: TObject);
    procedure dblFondoEntidadEnter(Sender: TObject);
    procedure EdtCodigoFolioChange(Sender: TObject);
    procedure dbgAsociadosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure spbSiguienteClick(Sender: TObject);
    procedure bbtCambiarFechaNominaClick(Sender: TObject);
    procedure spbCancelarFechaNominaClick(Sender: TObject);
    procedure bbtGuardarFechaNominaClick(Sender: TObject);
    procedure bbtCambiarInformacionAportesClick(Sender: TObject);
    procedure spbCancelarCambiosAportesClick(Sender: TObject);
    procedure bbtGuardarCambiosAportesClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
    DireccIP  : String;
    procedure ActivarObjetosConRegistroCaptura;
    procedure InactivarOpcionesGuardar;
    procedure LlenarFondos;
    procedure LimpiarControles;
    procedure LimpiarDatosCaptura;
    procedure LimpiarNovedadRegistro;
    procedure LimpiarParticulares;
    procedure LimpiarBases;
    procedure ConfigurarAmbiente;
    procedure ConfigurarFTP;
    procedure GuardarNovedadSinCaptura;
    procedure GuardarCaptura;
    procedure GuardarInformacionPlanilla;
    procedure MostrarDatosAsociados;
    procedure MostrarDatosImagen;
    procedure MostrarDatosPersonas;
    procedure MostrarEncabezadoCaptura;
    procedure ValidarCompletitudAportes;

  end;

var
  DiasProc  : Integer;
  DifeAnio  : Integer;
  frmCaptura: TfrmCaptura;
  frmLupa   : TBlowupForm;
  FoliSigu  : string;
  ModoDrag  : Boolean;
  OrigCapt  : string;
  ProcCapt  : TProcesoCaptura;
  PuntMous  : TPoint;
  SelePers  : Boolean;
  TiemProc  : TTime;
  TipoCapt  : Char;
  UsuaAcce  : string;

implementation

{$R *.dfm}

{$REGION 'EVENTOS' }

procedure TfrmCaptura.bbtCambiarFechaNominaClick(Sender: TObject);
begin
  PnlDatosNomina.Enabled:=True;
  bbtCambiarFechaNomina.Visible:=false;
  bbtGuardarFechaNomina.Visible:= True;
  bbtGuardarFechaNomina.Enabled:= False;
  spbCancelarFechaNomina.Visible:= True;
  spbCancelarFechaNomina.Enabled:= true;
  mkeFechaNomina.SelStart:=0;
  mkeFechaNomina.SetFocus;
  LimpiarParticulares;
  LimpiarNovedadRegistro;
  GrpDatosParticulares.Enabled:= False;
end;

procedure TfrmCaptura.bbtCambiarInformacionAportesClick(Sender: TObject);
begin
  PnlDatosAportes.Enabled:=True;
  bbtCambiarInformacionAportes.Visible:=false;
  bbtGuardarCambiosAportes.Visible:= True;
  bbtGuardarCambiosAportes.Enabled:= False;
  spbCancelarCambiosAportes.Visible:= True;
  spbCancelarCambiosAportes.Enabled:= true;
  mkeFechaPagoBanco.SelStart:=0;
  mkePeriodoCotizacion.SelStart:=0;
  dblFondoEntidad.SetFocus;
  LimpiarParticulares;
  LimpiarNovedadRegistro;
  GrpDatosParticulares.Enabled:= False;
end;



{GUS
procedure TfrmCaptura.bbtConfirmarDatosEnter(Sender: TObject);
begin
  EdtTemporal.Visible:=False;
end;
}

procedure TfrmCaptura.bbtGuardarCambiosAportesClick(Sender: TObject);
begin
  if Application.MessageBox('Esta seguro(a) de Guardar los cambios en la Informaci�n de Aportes?',
                         'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    PnlDatosAportes.Enabled               := False;
    bbtGuardarCambiosAportes.Visible      := false;
    spbCancelarCambiosAportes.Visible     := false;
    ProcCapt.DatosFolio.IdFondo           := dblFondoEntidad.KeyValue;
    ProcCapt.DatosFolio.FechaPagoBanco    := mkeFechaPagoBanco.Text;
    ProcCapt.DatosFolio.PeriodoCotizacion := '01/' + mkePeriodoCotizacion.Text;
    GuardarInformacionPlanilla;
    RpnRealizadosAportes.BringToFront;
    RpnRealizadosAportes.Visible:=True;
    Application.ProcessMessages;
    Sleep(1500);
    RpnRealizadosAportes.Visible        :=False;
    bbtCambiarInformacionAportes.Visible:=true;
    GrpDatosParticulares.Enabled        := True;
    ActivarObjetosConRegistroCaptura;

  end;
end;

procedure TfrmCaptura.bbtGuardarFechaNominaClick(Sender: TObject);
begin
  if Application.MessageBox('Esta seguro(a) de Guardar el cambio de la Fecha de N�mina?',
                         'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    PnlDatosNomina.Enabled          := False;
    bbtGuardarFechaNomina.Visible   := false;
    spbCancelarFechaNomina.Visible  := false;
    ProcCapt.DatosFolio.FechaNomina := mkeFechaNomina.Text;
    GuardarInformacionPlanilla;
    RpnRealizadosNomina.BringToFront;
    RpnRealizadosNomina.Visible:=True;
    Application.ProcessMessages;
    Sleep(1500);
    RpnRealizadosNomina.Visible:=False;
    bbtCambiarFechaNomina.Visible:=true;
    GrpDatosParticulares.Enabled:= True;
    ActivarObjetosConRegistroCaptura;
  end;
end;

procedure TfrmCaptura.cbxZoomPredefinidoChange(Sender: TObject);
begin
  rseZoom.Value:=Trunc(ZoomInstruccion(imsFolio, cbxZoomPredefinido.ItemIndex));
end;

procedure TfrmCaptura.ccbColorReglaChange(Sender: TObject);
begin
  RpnRegla.Color:= ccbColorRegla.ColorValue;
end;

procedure TfrmCaptura.chkFolioNoCapClick(Sender: TObject);
begin
  if chkFolioNoCap.Checked then
    begin
      if TipoCapt = 'N' then
      begin
        mkeFechaNomina.Text:='  /  /    ';
        //bbtConfirmarFecha.Enabled:=False;
      end
      else
        if TipoCapt = 'A' then
        begin
          GrpGeneralesAportes.Enabled :=False;
          dblFondoEntidad.KeyValue    := -1;
          mkePeriodoCotizacion.Text   := '  /    ';
          mkeFechaPagoBanco.Text      := '  /  /    ';
          //bbtConfirmarDatos.Enabled   := False;
        end;
      chkObservacionFolio.Enabled := False;
    end
  else
  begin
    if TipoCapt = 'N' then
    begin
      mkeFechaNomina.SetFocus;
    end
    else
      if TipoCapt = 'A' then
      begin
        GrpGeneralesAportes.Enabled := True;
        dblFondoEntidad.SetFocus;
      end;
    chkObservacionFolio.Enabled := True;
  end;
end;

procedure TfrmCaptura.chkObservacionFolioClick(Sender: TObject);
begin

  if chkObservacionFolio.Checked then
    begin
      if TipoCapt = 'N' then
      begin
        mkeFechaNomina.Text:='  /  /    ';
        //bbtConfirmarFecha.Enabled:=False;
      end
      else
        if TipoCapt = 'A' then
        begin
          GrpGeneralesAportes.Enabled :=False;
          dblFondoEntidad.KeyValue    := -1;
          mkePeriodoCotizacion.Text   := '  /    ';
          mkeFechaPagoBanco.Text      := '  /  /    ';
          //bbtConfirmarDatos.Enabled   := False;
        end;
      redObservacionFolio.Enabled   :=True;
      redObservacionFolio.SetFocus;
      chkFolioNoCap.Enabled         := false;
      rxlFolioNoCap.Enabled         := false;
    end
  else
    if redObservacionFolio.Text <> '' then
    begin
      chkObservacionFolio.Checked := True;
      Application.MessageBox('Si desea desmarcar Documento con Novedad, '
                              + 'elimine el texto de las Observaciones. ',
                              'Tenga en cuenta', MB_ICONINFORMATION + MB_OK);
    end
    else
    begin
      if TipoCapt = 'N' then
      begin
        mkeFechaNomina.SetFocus;
      end
      else
        if TipoCapt = 'A' then
        begin
          GrpGeneralesAportes.Enabled := True;
          dblFondoEntidad.SetFocus;
        end;
      redObservacionFolio.Enabled := False;
      chkFolioNoCap.Enabled       := True;
      rxlFolioNoCap.Enabled       := True;
    end;
end;

procedure TfrmCaptura.chkObservacionRegistroClick(Sender: TObject);
begin
  if chkObservacionRegistro.Checked then
    begin
      if  not SelePers then
      begin
        LimpiarBases;
        LimpiarParticulares;
        GrpDatosPersona.Enabled:= False;
        spbGuardarRegistro.Enabled  := True;
        spbCancelarLimpiar.Enabled  := True;
      end;
      redObservacionRegistro.Enabled:=True;
      redObservacionRegistro.SetFocus;
    end
  else
    if redObservacionRegistro.Text <> '' then
    begin
      chkObservacionRegistro.Checked := True;
      Application.MessageBox('Si desea desmarcar Registro con Novedad, '
                              + 'elimine el texto de las Observaciones. ',
                              'Tenga en cuenta', MB_ICONINFORMATION + MB_OK);
    end
    else
    begin
      if not SelePers then
      begin
        GrpDatosPersona.Enabled := True;
        InactivarOpcionesGuardar;
        rlbTipoIdentificacion.SetFocus;
      end;
      redObservacionRegistro.Enabled:=False;
    end;
end;

procedure TfrmCaptura.dbgAsociadosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
c:Integer;
begin
  if FrmLogin.AccesoEspecial then
  begin
    if Button=mbRight then
    begin
      with dbgAsociados.DataSource.DataSet do
      begin
        if Application.MessageBox(PChar('Desea Retirar a ' + FieldByName('nombres').AsString
                                    + ' ' + FieldByName('apellidos').AsString + '?'),
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
        begin
          ProcCapt.EliminarAsociacion(FieldByName('idfolioidentificacion').value);
          PnlRegistrosIngresados.Caption:= IntToStr(dbgAsociados.DataSource.DataSet.RecordCount);
          if dbgAsociados.DataSource.DataSet.IsEmpty then
          begin
            Application.MessageBox('El Folio ya no tiene Personas relacionadas. '
                                    + 'Se devuelve a Captura.',
                                    'Atenci�n', MB_ICONINFORMATION + MB_OK);
            spbCancelar.Enabled   := False;
            LimpiarControles;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCaptura.dbgPersonasDblClick(Sender: TObject);
begin
  with dbgPersonas.DataSource.DataSet do
  begin
    if OrigCapt = 'BDAND' then
    begin
      rlbTipoIdentificacion.KeyValue:= FieldByName('idtipoidentificacion').asstring;
      ProcCapt.DatosCaptura.IdIdentificacion := FieldByName('ididentificacion').Value;
    end ;

    GrpDatosPersona.Enabled     :=False;
    EdtNumeroDocumento.text     := FieldByName('numerodocumento').asstring;
    EdtPrimerNombre.text        := FieldByName('primernombre').asstring;
    EdtSegundoNombre.text       := FieldByName('segundonombre').asstring;
    EdtPrimerApellido.text      := FieldByName('primerapellido').asstring;
    EdtSegundoApellido.text     := FieldByName('segundoapellido').asstring;

    spbBuscarMti.Enabled        := False;
    spbBuscarAndes.Enabled      := False;
    spbGuardarRegistro.Enabled  := True;
    spbNuevaPersona.Enabled     := False;
    SelePers:= True;
  end;
end;

procedure TfrmCaptura.dblFondoEntidadClick(Sender: TObject);
begin
  ValidarCompletitudAportes;
end;

procedure TfrmCaptura.dblFondoEntidadEnter(Sender: TObject);
begin
  dblFondoEntidad.DropDown;
end;
{GUS
procedure TfrmCaptura.dblFondoEntidadExit(Sender: TObject);
begin
  ValidarCompletitudAportes;
end;
}


procedure TfrmCaptura.EdtTemporalEnter(Sender: TObject);
begin
  SelectNext(sender as TWinControl,True,true);
  EdtTemporal.Visible:=False;
end;

procedure TfrmCaptura.EdtCodigoFolioChange(Sender: TObject);
begin
  if Length(EdtCodigoFolio.Text) >= 8 then
    spbNuevoFolio.Enabled:= true
  else
    spbNuevoFolio.Enabled:= False;


end;

procedure TfrmCaptura.EdtPrimerApellidoChange(Sender: TObject);
begin
  QuitaEspaciosObjtxt(Sender, false);
  rlbTipoIdentificacionChange(Sender);
end;

procedure TfrmCaptura.EdtPrimerApellidoExit(Sender: TObject);
begin
  EdtPrimerNombreExit(Sender);
end;

procedure TfrmCaptura.EdtPrimerApellidoKeyPress(Sender: TObject; var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;

procedure TfrmCaptura.EdtPrimerNombreChange(Sender: TObject);
begin
   QuitaEspaciosObjtxt(Sender, false);
   rlbTipoIdentificacionChange(Sender);
end;

procedure TfrmCaptura.EdtPrimerNombreExit(Sender: TObject);
begin
  (Sender as TEdit).Text:= Trim(ReemplazarTexto((Sender as TEdit).Text,'  ', ' ',
                                          true));
end;

procedure TfrmCaptura.EdtPrimerNombreKeyPress(Sender: TObject; var Key: Char);
begin
  key:= AnsiUpperCase(Char(Key))[1];
end;

procedure TfrmCaptura.EdtSegundoApellidoChange(Sender: TObject);
begin
   QuitaEspaciosObjtxt(Sender, false);
end;

procedure TfrmCaptura.EdtSegundoApellidoExit(Sender: TObject);
begin
   EdtPrimerNombreExit(Sender);
end;

procedure TfrmCaptura.EdtSegundoApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;

procedure TfrmCaptura.EdtSegundoNombreChange(Sender: TObject);
begin
   QuitaEspaciosObjtxt(Sender, false);
end;

procedure TfrmCaptura.EdtSegundoNombreExit(Sender: TObject);
begin
   EdtPrimerNombreExit(Sender);
end;

procedure TfrmCaptura.EdtSegundoNombreKeyPress(Sender: TObject; var Key: Char);
begin
  EdtPrimerNombreKeyPress(Sender,Key);
end;



procedure TfrmCaptura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Application.MessageBox('Desea Salir del M�dulo de Captura de Infomaci�n por Demanda?',
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
    CanClose := True
  else
    CanClose := False;

end;



procedure TfrmCaptura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key in [VK_NUMPAD8, VK_NUMPAD2,VK_NUMPAD4,VK_NUMPAD6,
                                    VK_ADD,VK_SUBTRACT]) then
  begin
    {MOVIMIENTO Y AJUSTE DE LA REGLA CON EL TECLADO}
    case key of
      VK_NUMPAD8 : RpnRegla.Top:= RpnRegla.Top - 5;
      VK_NUMPAD2 : RpnRegla.Top:= RpnRegla.Top + 5;
      VK_NUMPAD4 : RpnRegla.left:= RpnRegla.left - 5;
      VK_NUMPAD6 : RpnRegla.left:= RpnRegla.left + 5;
      VK_ADD     : RpnRegla.Width:= imsFolio.Width;//RpnRegla.Width:= RpnRegla.Width + 5;
      VK_SUBTRACT: RpnRegla.Width:= ccbColorRegla.Width + rslAnchoRegla.Width + 70;
    end;
    if RpnRegla.Top < 0 then
      RpnRegla.Top:=0
    else
      if RpnRegla.Top + RpnRegla.Height > imsFolio.Height then
        RpnRegla.Top:= imsFolio.Height - RpnRegla.Height
      else
        if RpnRegla.left < 0 then
          RpnRegla.left := 0
        else
          if RpnRegla.left + RpnRegla.width > imsFolio.Width then
            RpnRegla.left:= imsFolio.width - RpnRegla.width;
  end;

 end;



procedure TfrmCaptura.FormShow(Sender: TObject);
begin
  FrmLogin:= TFrmLogin.Create(nil);
  FrmLogin.ShowModal;
  ConfigurarAmbiente;
  ConfigurarFtp;

end;

procedure TfrmCaptura.mkeFechaNominaChange(Sender: TObject);
begin
  {LA SIGUIENTE LINEA ES PARA SUPRIMIR MENSAJES DE ERROR PROPIOS DEL CONTROL}
  mkeFechaNomina.Modified:= False;
  if ((Pos(' ',mkeFechaNomina.Text) > 0)
        or (mkeFechaNomina.Text = ProcCapt.DatosFolio.FechaNomina)) then
    bbtGuardarFechaNomina.Enabled := false
  else
    bbtGuardarFechaNomina.Enabled := True;
end;

procedure TfrmCaptura.mkeFechaNominaExit(Sender: TObject);
begin
  try
    if mkeFechaNomina.Text <> '  /  /    ' then
    begin
      if (StrToDate(mkeFechaNomina.Text) < StrToDate('01/01/1940'))
          or (StrToDate(mkeFechaNomina.Text) > Now())
          or (Pos(' ',mkeFechaNomina.Text) > 0) then
      begin
        Application.MessageBox(PChar('Fecha incorrecta. Se admiten fechas entre [01/01/1940] y ['
                                + DateToStr(now()) + '].'), 'Fecha N�mina',
                                MB_OK + MB_ICONERROR);
        bbtGuardarFechaNomina.Enabled:= False;
        mkeFechaNomina.SetFocus;
      end;
    end;
  except
    Application.MessageBox(PChar('Fecha incorrecta. Se admiten fechas entre [01/01/1940] y ['
                              + DateToStr(now()) + '].'), 'Fecha N�mina',
                              MB_OK + MB_ICONERROR);
    bbtGuardarFechaNomina.Enabled:= False;
    mkeFechaNomina.SetFocus;
  end;
end;


procedure TfrmCaptura.mkeFechaPagoBancoChange(Sender: TObject);
begin
  {LA SIGUIENTE LINEA ES PARA SUPRIMIR MENSAJES DE ERROR PROPIOS DEL CONTROL}
  mkeFechaPagoBanco.Modified:= False;
  ValidarCompletitudAportes;
end;

procedure TfrmCaptura.mkeFechaPagoBancoExit(Sender: TObject);
var
  DiaaMaxi: string;
  ErroFech: Boolean;
  FechMaxi: TDate;
  FechMini: TDate;
  FechPago: TDate;
begin

  if mkeFechaPagoBanco.Text <> '  /  /    ' then
  begin
    if mkePeriodoCotizacion.Text = '  /    ' then
    begin
      FechMini:= StrToDate('01/01/1940');
      FechMaxi:= Now();
    end
    else
    begin
      FechMini:= StrToDate('01/' + mkePeriodoCotizacion.text);
      DiaaMaxi:= IntToStr(daysinamonth(StrToInt(AnsiRightstr(mkePeriodoCotizacion.Text,4)),
                                       StrToInt(AnsiLeftStr(mkePeriodoCotizacion.Text,2))));
      FechMaxi:= IncYear(StrToDate(DiaaMaxi + '/' + mkePeriodoCotizacion.text),DifeAnio);
      if FechMaxi > Now() then
        FechMaxi:= Now();
    end;
    if (Pos(' ',mkeFechaPagoBanco.Text) = 0) and IsValidDate(StrToInt(AnsiRightstr(mkeFechaPagoBanco.Text,4)),
                   StrToInt(AnsiMidStr(mkeFechaPagoBanco.Text,4,2)),
                   StrtoInt(AnsiLeftStr(mkeFechaPagoBanco.Text,2))) then
    begin
      FechPago:= StrToDate(mkeFechaPagoBanco.Text);
      if (FechPago >= FechMini) and (FechPago <= FechMaxi) then
        ErroFech:=False
      else
        ErroFech:= True;
    end
    else
      ErroFech:=True;
    if ErroFech then
    begin
      Application.MessageBox(PChar('Fecha incorrecta. Se admiten fechas entre ['
                              + FormatDateTime('dd/mm/yyyy',FechMini) + '] y ['
                              + FormatDateTime('dd/mm/yyyy',FechMaxi) + ']'
                              + ifthen(mkePeriodoCotizacion.Text = '  /    ', '.',
                                        ' (Hasta ' + IntToStr(DifeAnio)
                              + IfThen(DifeAnio > 1, ' a�os ', ' a�o ')
                              + 'mas del Periodo de Cotizaci�n).')),
                              'Fecha Pago Banco',
                              MB_OK + MB_ICONERROR);
      bbtGuardarCambiosAportes.Enabled := False;
      mkeFechaPagoBanco.SetFocus;
    end;
  end;
end;

procedure TfrmCaptura.mkePeriodoCotizacionChange(Sender: TObject);
begin
  mkePeriodoCotizacion.Modified:= False;
  ValidarCompletitudAportes;
end;

procedure TfrmCaptura.mkePeriodoCotizacionExit(Sender: TObject);
var
  PeriMaxi: TDate;
  PeriMini: TDate;
  PeriCoti: TDate;
  ErroFech: Boolean;
begin
  if mkePeriodoCotizacion.Text <> '  /    ' then
  begin
    if mkeFechaPagoBanco.Text = '  /  /    ' then
    begin
      PeriMini:= StrToDate('01/01/1940');
      PeriMaxi:= Now();
    end
    else
    begin
      PeriMini:= IncYear(StrToDate('01/' + AnsiRightStr(mkeFechaPagoBanco.text,7)),-DifeAnio);
      if PeriMini < StrToDate('01/01/1940') then
        PeriMini:= StrToDate('01/01/1940');
      PeriMaxi:= StrToDate(mkeFechaPagoBanco.Text);
    end;
    if (Pos(' ',mkePeriodoCotizacion.Text) = 0) and IsValidDate(StrToInt(AnsiRightstr(mkePeriodoCotizacion.Text,4)),
                   StrtoInt(AnsiLeftStr(mkePeriodoCotizacion.Text,2)),1) then
    begin
      PeriCoti:= StrToDate('01/' + mkePeriodoCotizacion.Text);
      if (PeriCoti >= PeriMini) and (PeriCoti <= PeriMaxi) then
        ErroFech:=False
      else
        ErroFech:= True;
    end
    else
      ErroFech:=True;
    if ErroFech then
    begin
      Application.MessageBox(PChar('Periodo incorrecto. Se admiten periodos entre ['
                              + FormatDateTime('mm/yyyy',PeriMini) + '] y ['
                              + FormatDateTime('mm/yyyy',PeriMaxi) + ']'
                              + ifthen(mkeFechaPagoBanco.Text = '  /  /    ', '.',
                                        ' (M�nimo ' + IntToStr(DifeAnio)
                              + IfThen(DifeAnio > 1, ' a�os ', ' a�o ')
                              + 'menos que la Fecha de Pago al Banco).')),
                              'Fecha Pago Banco',
                              MB_OK + MB_ICONERROR);
      bbtGuardarCambiosAportes.Enabled := False;
      mkePeriodoCotizacion.SetFocus;
    end;
  end;
end;

procedure TfrmCaptura.redObservacionFolioChange(Sender: TObject);
begin
  QuitaEspaciosObjtxt(Sender, false);
end;

procedure TfrmCaptura.redObservacionFolioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Key:=0;
end;

procedure TfrmCaptura.redObservacionRegistroChange(Sender: TObject);
begin
  QuitaEspaciosObjtxt(Sender, false);
end;

procedure TfrmCaptura.redObservacionRegistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Key:=0;
end;

procedure TfrmCaptura.rlbTipoIdentificacionChange(Sender: TObject);
begin
  if OrigCapt <> 'NUE' then
  begin
    if ((rlbTipoIdentificacion.Text <> '') and (EdtNumeroDocumento.Text <> '')) or
        (EdtNumeroDocumento.Text <> '') or (EdtPrimerNombre.Text <> '') or
        (EdtPrimerApellido.text <> '') then

        spbBuscarAndes.Enabled:=true
    else
    begin
      spbBuscarAndes.Enabled:=False;
      spbBuscarMti.Enabled:=False;
      LimpiarBases;
      InactivarOpcionesGuardar;
    end
  end
  else
  begin
    if (rlbTipoIdentificacion.Text <> '') and (EdtNumeroDocumento.Text <> '') and
        (EdtPrimerNombre.Text <> '') and (EdtPrimerApellido.text <> '') then

      spbGuardarRegistro.Enabled:= true
    else
      spbGuardarRegistro.Enabled:= false;
  end;
end;

procedure TfrmCaptura.RpnReglaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then
  begin
    ModoDrag:=True;
    PuntMous.X := X;
    PuntMous.Y := Y;
  end
end;

procedure TfrmCaptura.RpnReglaMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ModoDrag then
  begin
    if (RpnRegla.Left - (PuntMous.X - X))< 0 then
      RpnRegla.Left:=0
    else
      if (RpnRegla.Left - (PuntMous.X - X))> imsFolio.Width - RpnRegla.Width then
        RpnRegla.Left :=  imsFolio.Width - RpnRegla.Width
      else
        RpnRegla.Left:= RpnRegla.Left - (PuntMous.X - X);
    if (RpnRegla.top - (PuntMous.Y - Y))< 0 then
      RpnRegla.top:=0
    else
    if (RpnRegla.top - (PuntMous.Y - Y))> imsFolio.Height - RpnRegla.Height then
      RpnRegla.Top :=  imsFolio.Height - RpnRegla.Height
    else
      RpnRegla.Top:= RpnRegla.Top - (PuntMous.Y - Y);
  end;
end;

procedure TfrmCaptura.RpnReglaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ModoDrag:=False;
end;


procedure TfrmCaptura.RpnReglaResize(Sender: TObject);
begin
  {SI EL PANEL DE LA REGLA CAMBIA DE TAMA�O(CUANDO SE HACE POR TECLADO) HAY QUE AJUSTAR EL
    SLIDER Y EJECUTAR EL SU PROCEDIMIENTO CHANDED}
   rslAnchoRegla.Value:= RpnRegla.Width;
   rslAnchoReglaChanged(RpnRegla);
end;

procedure TfrmCaptura.rseZoomChange(Sender: TObject);
begin
  if rseZoom.Value > 100 then
    rseZoom.Value:= 100;
  ZoomPorcentaje(imsFolio,rseZoom.Value);
end;

procedure TfrmCaptura.rslAnchoReglaChanged(Sender: TObject);
begin
  {CONTROLA QUE LA REGLA NO SE CAMBIE DE TAMA�O POR FUERA DE LOS LIMITES DE LA IMAGEN}
  rslAnchoRegla.MaxValue:= imsFolio.Width;
  rslAnchoRegla.MinValue:= ccbColorRegla.Width + rslAnchoRegla.Width + 70;
  RpnRegla.Width:= rslAnchoRegla.Value;
  if (RpnRegla.Left + RpnRegla.Width) > imsFolio.Width then
    RpnRegla.Left:=  imsFolio.Width - RpnRegla.Width;
end;

procedure TfrmCaptura.spbBuscarMtiClick(Sender: TObject);
begin
  {SE BUSCA EN EL DATASET DEL COMBO DE TIPOS DE IDENTIFICACION}
  OrigCapt := 'BDMTI';
  LimpiarBases;
  rpnBuscando.Visible := true;
  rlbTipoIdentificacion.LookupSource.DataSet.Locate('descripciontipoidentificacion',
                                              'C�DULA DE CIUDADAN�A',[]);
  rlbTipoIdentificacion.KeyValue:= rlbTipoIdentificacion.LookupSource.DataSet.FieldByName(
                            'idtipoidentificacion').Value;
  Application.ProcessMessages;
  ProcCapt.ObtenerDatosANI(rlbTipoIdentificacion.Text, EdtNumeroDocumento.Text,
                           EdtPrimerNombre.Text, EdtPrimerApellido.text);
  LblPersonas.Caption:= 'BASE DE DATOS PERSONAS - MTI';
  LblPersonas.Color:= $0087C293;
  MostrarDatosPersonas;
end;

procedure TfrmCaptura.spbBuscarAndesClick(Sender: TObject);

begin
  OrigCapt := 'BDAND';
  LimpiarBases;
  ProcCapt.ObtenerDatosMTI(rlbTipoIdentificacion.KeyValue,EdtNumeroDocumento.Text,
                            EdtPrimerNombre.Text, EdtPrimerApellido.text);
  LblPersonas.Caption:= 'BASE DE DATOS PERSONAS - UNIANDES';
  LblPersonas.Color:= $0000D2D2;
  MostrarDatosPersonas;
  spbBuscarMti.Enabled:=True;
end;

procedure TfrmCaptura.spbCancelarCambiosAportesClick(Sender: TObject);
begin
  dblFondoEntidad.KeyValue            := ProcCapt.DatosFolio.IdFondo;
  mkePeriodoCotizacion.Text           := ProcCapt.DatosFolio.PeriodoCotizacion;
  mkeFechaPagoBanco.Text              := ProcCapt.DatosFolio.FechaPagoBanco;
  PnlDatosAportes.Enabled             := False;
  bbtCambiarInformacionAportes.Visible:= true;
  bbtGuardarCambiosAportes.Visible    := false;
  spbCancelarCambiosAportes.Visible   := false;
  GrpDatosParticulares.Enabled        := True;
  ActivarObjetosConRegistroCaptura;
end;

procedure TfrmCaptura.spbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desea cancelar la Captura del Folio en curso?', 'Advertencia',
                              MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    spbCancelar.Enabled   := False;
    spbSiguiente.Enabled  := False;
    LimpiarControles;
  end;
end;

procedure TfrmCaptura.spbCancelarFechaNominaClick(Sender: TObject);
begin
  mkeFechaNomina.Text:= ProcCapt.DatosFolio.FechaNomina;
  PnlDatosNomina.Enabled:=False;
  bbtCambiarFechaNomina.Visible:=true;
  bbtGuardarFechaNomina.Visible:= false;
  spbCancelarFechaNomina.Visible:= false;
  GrpDatosParticulares.Enabled:= True;
  ActivarObjetosConRegistroCaptura;
end;

procedure TfrmCaptura.spbCancelarLimpiarClick(Sender: TObject);
begin
  GrpDatosPersona.Enabled  := True;
  LimpiarParticulares;
  LimpiarBases;
  LimpiarNovedadRegistro;
  InactivarOpcionesGuardar;
  chkObservacionRegistro.Enabled:=True;
  rlbTipoIdentificacion.SetFocus;
end;

procedure TfrmCaptura.spbGuardarRegistroClick(Sender: TObject);
var
  RespSegu : Integer;
begin
  if chkObservacionRegistro.Checked  then
  begin
    if redObservacionRegistro.Text ='' then
      Application.MessageBox(PChar('No se permite guardar una Novedad de '
                              + 'Registro sin el respectivo texto descriptivo en el '
                              + 'campo de Observaciones  Registro. '),
                              'Captura de Informaci�n por Demanda', MB_ICONINFORMATION + MB_OK)
    else
      if (EdtNumeroDocumento.text = '') and (EdtPrimerNombre.text = '') and
            (EdtPrimerApellido.text = '')  then
      begin
        if Application.MessageBox('Esta seguro(a) de Guardar esta Novedad de '
                                  + 'Registro sin Informaci�n de Captura?',
                                  'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
          GuardarNovedadSinCaptura;
      end
      else
        if Application.MessageBox('Esta seguro(a) de Guardar este Registro de '
                                  +'Persona con la Novedad digitada?',
                                  'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
          GuardarCaptura;
  end
  else
  begin
    if Application.MessageBox('Esta seguro(a) de Guardar este Registro de Persona?',
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
      GuardarCaptura;
  end;
end;

procedure TfrmCaptura.spbLupaClick(Sender: TObject);
begin
  if spbLupa.Caption = 'Activar L&upa' then
  begin
    ZoomEmergente(frmLupa,imsFolio,'Funci�n de Aumento (Lupa)',frmCaptura, 300,300,true);
    spbLupa.Caption:= 'Remover L&upa'
  end
  else
  begin
      ZoomEmergente(frmLupa,imsFolio,'Funci�n de Aumento (Lupa)',frmCaptura,300,300,false);
    spbLupa.Caption:= 'Activar L&upa';
  end;
end;

procedure TfrmCaptura.spbNuevaPersonaClick(Sender: TObject);
begin
  OrigCapt := 'NUE';
  LimpiarBases;
  spbBuscarAndes.Enabled:=False;
  spbBuscarMti.Enabled:=False;
  spbNuevaPersona.Enabled := False;
  if (rlbTipoIdentificacion.Text <> '') and (EdtNumeroDocumento.Text <> '') and
     (EdtPrimerNombre.Text <> '') and (EdtPrimerApellido.text <> '') then
    spbGuardarRegistro.Enabled:= true
  else
    spbGuardarRegistro.Enabled:= false;
  rlbTipoIdentificacion.SetFocus;
  SelePers:= True;
end;

procedure TfrmCaptura.spbNuevoFolioClick(Sender: TObject);
var
  ArchImag: string;
begin
  try
    ProcCapt.ObtenerFolioCaptura(EdtCodigoFolio.Text);
    if ProcCapt.DatosFolio.IdFolio > 0 then
    begin
      EdtCodigoFolio.Text:= ProcCapt.DatosFolio.CodigoFolio;
      if ProcCapt.DatosFolio.CodigoFolioSigu <> '' then
      begin
        spbSiguiente.enabled:=True;
        FoliSigu := ProcCapt.DatosFolio.CodigoFolioSigu;
      end
      else
        spbSiguiente.enabled:=False;
      RpnVisor.Enabled:= True;
      GrpInformacionImagen.Enabled := True;
      spbNuevoFolio.Enabled       := False;
      PnlSerieDocumental.Enabled  := False;
      spbCancelar.Enabled         := True;
      MostrarDatosImagen;
      ProcCapt.DescargarImagen;
      if ProcCapt.DatosFolio.ImagenLocal <> '' then
      begin
        imsFolio.FileName:= ProcCapt.DatosFolio.ImagenLocal;
        cbxZoomPredefinido.ItemIndex:= cbxZoomPredefinido.Items.IndexOf('Ajustar al Ancho');
        rseZoom.Value:= Trunc(ZoomInstruccion(imsFolio, cbxZoomPredefinido.ItemIndex));
        DiasProc:= ProcCapt.DatosFolio.DiasBloqueo;
        TiemProc:= ProcCapt.DatosFolio.HorasBloqueo;
        PnlTiempoCaptura.Caption:= ifthen(DiasProc > 0,IntToStr(diasproc) +'d ','')
                                          + FormatDateTime('hh:mm:ss',TiemProc);
        ProcCapt.ObtenerDatosAsociados(ProcCapt.DatosFolio.IdFolio);
        MostrarDatosAsociados;
        PnlRegistrosIngresados.Caption:= IntToStr(dbgAsociados.DataSource.DataSet.RecordCount);
        PnlNovedadesSinCap.Caption    := IntToStr(ProcCapt.DatosFolio.NovedadesFolio.Count);

        GrpInformacionImagen.Enabled:= True;
        tmrTiempoFolio.Enabled:= True;
        MostrarEncabezadoCaptura;
        SelePers:= False;
        ProcCapt.ObtenerTiposIdentificacion;
        rlbTipoIdentificacion.LookupSource:= ProcCapt.TiposIdentificacion;;
        rlbTipoIdentificacion.LookupDisplay:= 'descripciontipoidentificacion';
        rlbTipoIdentificacion.LookupField:= 'idtipoidentificacion';
      end;
    end
    else
    begin
      Application.MessageBox(PChar ('El folio [' + EdtCodigoFolio.Text + ' ] '
                                    + 'no existe o no est� en el estado GENERACI�N XML. '),
                             'Captura de Informaci�n por Demanda.',MB_OK OR MB_ICONASTERISK);
      LimpiarControles;
    end;
  except
    on e:Exception do
    begin
       Application.MessageBox(PChar('Proceso de Captura Detenido.' + #10#13 + '* ' + e.Message),
                              'Captura de Informaci�n',MB_ICONWARNING + MB_OK);
       LimpiarControles;
    end;
  end;

end;

procedure TfrmCaptura.spbReglaClick(Sender: TObject);
begin
  if RpnVisor.Enabled then
  begin
    RpnRegla.Visible:= not RpnRegla.Visible;
    if RpnRegla.Visible then
    begin
      RpnRegla.Width:= rslAnchoRegla.Value;
      RpnRegla.Color:=ccbColorRegla.ColorValue;
      spbRegla.Caption:='Remover &Regla'
    end
    else
      spbRegla.Caption:='Activar &Regla';
  end;
end;

procedure TfrmCaptura.spbSalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCaptura.spbSiguienteClick(Sender: TObject);
begin
  if Application.MessageBox('Desea terminar la Captura del Folio en curso y cargar el siguiente?', 'Advertencia',
                              MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    LimpiarControles;
    EdtCodigoFolio.Text:= FoliSigu;
    spbNuevoFolioClick(nil);
  end;
end;

procedure TfrmCaptura.spbTerminaClick(Sender: TObject);
var
  RespSegu: Integer;
  RespNoca: Integer;
begin
  if chkObservacionFolio.Checked then
  begin
    if redObservacionFolio.Text ='' then
      Application.MessageBox(PChar('No se permite guardar un Folio con novedad sin el respectivo '
                              + 'texto descriptivo en el campo de Observaciones Documento. '),
                              'Captura de Informaci�n por Demanda',
                              MB_ICONINFORMATION + MB_OK)
    else
      RespSegu := Application.MessageBox('Esta seguro(a) de Terminar y Guardar este Folio'
                                          + ' con Novedad y sin Registros de Capura?',
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO);
  end
  else
  begin
    if chkFolioNoCap.Checked then
    begin
      if Application.MessageBox(PChar('Esta seguro(a) de marcar este Folio como NO-CAPTURABLE?'),'Marcaci�n Folio',
                                  MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDYES then
        RespNoca:= Application.MessageBox(PChar('Confirme si desea marcar este Folio como NO-CAPTURABLE?'),
                                          'Confiramci�n Marcaci�n Folio',
                                          MB_ICONWARNING or MB_YESNO or MB_DEFBUTTON2);

    end
    else
    begin
      if dbgAsociados.DataSource.DataSet.RecordCount = 0 then
        Application.MessageBox(PChar('No se permite guardar un Folio sin Registros de Captura. '
                                + 'Si el Folio es totalmente ilegible m�rquelo como Documento '
                                + 'con Novedad con su respectiva observaci�n. '),
                                'Captura de Informaci�n por Demanda',
                                MB_ICONINFORMATION + MB_OK)
      else
      begin
        if (rlbTipoIdentificacion.Text <> '') or (EdtNumeroDocumento.Text <> '') or
            (EdtPrimerNombre.Text <> '') or (EdtSegundoNombre.Text <> '') or
            (EdtPrimerApellido.Text <> '') or (EdtSegundoApellido.Text <> '') or
            (chkObservacionRegistro.Checked) or (dbgPersonas.DataSource <> nil) then
          Application.MessageBox(PChar('No se permite guardar el Folio ya que existe un '
                                + 'proceso de Captura sin terminar. Debe finalizar la captura '
                                + 'o cancelarla para guardar el Folio. '),
                                'Captura de Informaci�n por Demanda',
                                MB_ICONINFORMATION + MB_OK)
        else
        begin
          redObservacionFolio.Text := '';
          RespSegu := Application.MessageBox('Esta seguro(a) de Terminar y Guardar este Folio?',
                                  'Advertencia', MB_ICONINFORMATION + MB_YESNO);
        end;
      end;
    end;
  end;
  if RespSegu = IDYES then
    try

      ProcCapt.TerminarGuardarFolio(Trim(redObservacionFolio.Text));
      RpnMensajeGrabar.Caption := 'FOLIO GUARDADO';
      RpnMensajeGrabar.Visible:=True;
      Application.ProcessMessages;
      Sleep(1500);
      LimpiarControles;
    except
      on e:exception do
      begin
        Application.MessageBox(PChar('Proceso de Captura Cancelado.' + #10#13 + '* '
                                      + e.Message),
                               'Captura de Informaci�n por Demanda', MB_ICONINFORMATION + MB_OK);
        LimpiarControles;
      end;
    end
  else
    if RespNoca = IDYES then
    try
      ProcCapt.MarcarFolioNoCapturable;
      RpnMensajeGrabar.Caption := 'FOLIO MARCADO';
      RpnMensajeGrabar.Visible:=True;
      Application.ProcessMessages;
      Sleep(1500);
      LimpiarControles;
    except
      on e:exception do
      begin
        Application.MessageBox(PChar('Proceso de Marcaci�n de Folio Cancelado.' + #10#13 + '* '
                                      + e.Message),
                               'Captura de Informaci�n por Demanda', MB_ICONINFORMATION + MB_OK);
        LimpiarControles;
      end;
    end;

end;

procedure TfrmCaptura.stgInfoImagenDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol = 1 then
  begin
    with  (Sender as TStringGrid) do
    begin
      Canvas.Font.Color:= clWhite;
      Canvas.Font.Style:= [fsBold];
      Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,Cells[ACol,ARow]);
    end;

  end;
end;

procedure TfrmCaptura.tmrTiempoFolioTimer(Sender: TObject);
begin
  TiemProc :=  TiemProc + 1/86400;
  if (FormatDateTime('hh:mm:ss',TiemProc) = '00:00:00') then
    inc(DiasProc);

  PnlTiempoCaptura.Caption:= ifthen(DiasProc > 0,IntToStr(diasproc) +'d ','')+ FormatDateTime('hh:mm:ss',TiemProc);
end;

{$ENDREGION}

{$REGION 'METODOS PROPIOS'}

procedure TfrmCaptura.ActivarObjetosConRegistroCaptura;
begin
  GrpDatosPersona.Enabled:= True;
  chkObservacionRegistro.Enabled:=True;
  GrpOpcionesGuardar.Enabled:=True;
  rlbTipoIdentificacion.SetFocus;
  chkObservacionFolio.Enabled:= False;
  redObservacionFolio.Enabled:= False;
  chkFolioNoCap.Enabled :=False;
  rxlFolioNoCap.Enabled :=False;
end;

procedure TfrmCaptura.ConfigurarAmbiente;
begin
  {SE CREA EL OBJETO DE LA CAPA LOGICA }
  DifeAnio := 15;
  ProcCapt := TProcesoCaptura.Create;
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  if FrmLogin.AccesoEspecial then
  begin
    UsuaAcce:= 'ESPCDIPD';
    LblInformacion.Caption:= 'INFORMACI�N CAPTURADA' + #13#10 + #13#10
                              + '(Habilitado retiro de Personas del Folio)';
  end
  else
  begin
    UsuaAcce:= 'CDIPD';
    LblInformacion.Caption:= 'INFORMACI�N CAPTURADA';
  end;
  stbBarraEstado.Panels[0].Text:='Usuario: ' + UsuaAcce;
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

  with stgInfoImagen do
  begin
    Cells[0,0]:='CODIGO DE LA CAJA';
    Cells[0,1]:='SERIE DOCUMENTAL';
    Cells[0,2]:='SUBSERIE DOCUMENTAL';
    Cells[0,3]:='N�MERO DE FOLIO';
    Cells[0,4]:='ARCHIVO DE IMAGEN';
    Cells[0,5]:='USUARIO QUE CAPTURA';
    ColWidths[0]:= 160;
    ColWidths[1]:= 200;
    TipoCapt := '*';
  end;
  rslAnchoRegla.MaxValue:= imsFolio.Width;
  rslAnchoRegla.MinValue:= ccbColorRegla.Width + rslAnchoRegla.Width + 70;
  rslAnchoRegla.Value   := rslAnchoRegla.MinValue;
end;

procedure TfrmCaptura.ConfigurarFTP;
var
  FTP: TFtp;
begin
  try
    FTP  := TFTP.Create;
    FTP.ConfigurarFTP;
    if not FTP.TestConexion then
    begin
      Application.MessageBox('Error, no se estableci� conexi�n con el FTP. Favor Verificar. ',
                              'Captura de Informaci�n por Demanda',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end;
  except
    on e:exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n por Demanda',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmCaptura.GuardarCaptura;
begin
  try
    ProcCapt.DatosCaptura.IdFolio        := ProcCapt.DatosFolio.IdFolio;
    ProcCapt.DatosCaptura.NumeroDocumento:= EdtNumeroDocumento.text;
    ProcCapt.DatosCaptura.PrimerNombre   := Trim(EdtPrimerNombre.text);
    ProcCapt.DatosCaptura.SegundoNombre  := Trim(EdtSegundoNombre.text);
    ProcCapt.DatosCaptura.PrimerApellido := Trim(EdtPrimerApellido.text);
    ProcCapt.DatosCaptura.SegundoApellido:= Trim(EdtSegundoApellido.text);
    ProcCapt.DatosCaptura.DescripcionTipoIdentificacion:= rlbTipoIdentificacion.text;
    ProcCapt.DatosCaptura.Observacion    := trim(redObservacionRegistro.text);
    if OrigCapt = 'BDMTI' then
      ProcCapt.DatosCaptura.DescripcionFuenteIdentificacion := 'MTI-BASEDATOS'
    else
      if OrigCapt = 'NUE' then
        ProcCapt.DatosCaptura.DescripcionFuenteIdentificacion := 'MTI-CAPTURA'
      else
        ProcCapt.DatosCaptura.DescripcionFuenteIdentificacion := 'DBM';
    ProcCapt.GuardarRegistroCaptura;
    RpnRegistroGuardado.Caption := 'REGISTRO GUARDADO';
    RpnRegistroGuardado.BringToFront;
    RpnRegistroGuardado.Visible:=True;
    Application.ProcessMessages;
    Sleep(1500);
    LimpiarDatosCaptura;
  except
    on e:Exception do
    begin
       Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n por Demanda',MB_ICONWARNING + MB_OK);
       LimpiarDatosCaptura;
    end;
  end;
end;

procedure TfrmCaptura.GuardarInformacionPlanilla;
begin
  try
    ProcCapt.GuardarDatoPlanilla;
  except
    on e:Exception do
    begin
       Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n por Demanda',MB_ICONWARNING + MB_OK);
       LimpiarDatosCaptura;
    end;
  end;
end;

procedure TfrmCaptura.GuardarNovedadSinCaptura;
begin
  try
    ProcCapt.DatosCaptura.IdFolio        := ProcCapt.DatosFolio.IdFolio;
    ProcCapt.DatosCaptura.Observacion    := Trim(redObservacionRegistro.text);
    ProcCapt.RegistrarNovedadSinCaptura;
    RpnRegistroGuardado.Caption := 'NOVEDAD GUARDADA';
    RpnRegistroGuardado.Visible:=True;
    Application.ProcessMessages;
    Sleep(1500);
    LimpiarDatosCaptura;
  except
    on e:Exception do
    begin
       Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n por Demanda',MB_ICONWARNING + MB_OK);
       LimpiarDatosCaptura;
    end;
  end;
end;

procedure TfrmCaptura.InactivarOpcionesGuardar;
begin
  spbCancelarLimpiar.Enabled:=False;
  spbGuardarRegistro.Enabled:=False;
  spbNuevaPersona.Enabled:=False;
end;


procedure TfrmCaptura.LimpiarBases;
begin
  LblPersonas.Caption:= 'BASE DE DATOS PERSONAS';
  LblPersonas.Color:= clSilver;
  dbgPersonas.DataSource:= nil;
  GrpBusquedaPersonas.Enabled   :=False;
  SelePers:=False;
end;

procedure TfrmCaptura.LimpiarControles;
var
  I       : Integer;
begin
  EdtCodigoFolio.Text:= '';
  mkeFechaNomina.Text       := '  /  /    ';
  mkePeriodoCotizacion.Text := '  /    ';
  mkeFechaPagoBanco.Text    := '  /  /    ';
  redObservacionFolio.text:='';
  redObservacionFolio.Enabled:=False;
  chkObservacionFolio.Enabled:=False;
  chkObservacionFolio.Checked:= False;
  chkFolioNoCap.Enabled       := False;
  chkFolioNoCap.Checked       := False;
  rxlFolioNoCap.Enabled       := False;

  if spbRegla.Caption = 'Remover &Regla' then
    spbReglaClick(spbRegla);
  if spbLupa.Caption = 'Remover L&upa' then
    spbLupaClick(spbRegla);
  cbxZoomPredefinido.Text:= 'Ajustar al Ancho';
  rseZoom.Value:=1;
  dbgAsociados.DataSource:= nil;
  RpnVisor.Enabled:= False;

  LimpiarParticulares;

  for I := 0 to stgInfoImagen.RowCount do
    stgInfoImagen.Cells[1,I] := '';
  imsFolio.FileName := '';
  PnlRegistrosIngresados.caption:= '';
  PnlNovedadesSinCap.Caption    := '';
  PnlTiempoCaptura.Caption:='';

  GrpInformacionImagen.Enabled:=False;
  GrpDatosPersona.Enabled:=False;
  GrpDatosParticulares.Enabled:=True;
  LimpiarBases;
  LimpiarNovedadRegistro;
  RpnMensajeGrabar.Visible:=False;
  tmrTiempoFolio.Enabled  := False;
  spbCancelar.Enabled     :=False;
  spbNuevoFolio.Enabled   := False;

  {SE CREA NUEVAMENTE EL OBJETO DE LA CAPA L�GICA}
  ProcCapt := TProcesoCaptura.Create;
  PnlSerieDocumental.Enabled := True;
  EdtCodigoFolio.SetFocus;

  GrpGeneralesNomina.Visible    := False;
  LblTituloHistorias.Caption := 'INFORMACI�N PROCESO DE CAPTURA';
  GrpGeneralesAportes.Visible   := False;
  GrpGeneralesHistorias.Visible := true;
  Application.ProcessMessages;
end;

procedure TfrmCaptura.LimpiarDatosCaptura;
begin
  LimpiarBases;
  LimpiarParticulares;
  LimpiarNovedadRegistro;
  InactivarOpcionesGuardar;
  chkObservacionRegistro.Enabled:=True;
  RpnRegistroGuardado.Visible:=False;
  if (dbgAsociados.DataSource.DataSet.RecordCount >= 0) OR
      (ProcCapt.DatosFolio.NovedadesFolio.count >= 0) then
  begin
    GrpDatosPersona.Enabled:= True;
    PnlRegistrosIngresados.Caption:= IntToStr(dbgAsociados.DataSource.DataSet.RecordCount);
    PnlNovedadesSinCap.Caption    := IntToStr(ProcCapt.DatosFolio.NovedadesFolio.Count);
    rlbTipoIdentificacion.SetFocus;
  end
  else
    raise Exception.Create('No es posible obtener la cantidad de Registros del Folio.');

end;

procedure TfrmCaptura.LimpiarNovedadRegistro;
begin
  redObservacionRegistro.Enabled  := False;
  chkObservacionRegistro.Enabled  := False;
  redObservacionRegistro.Text     := '';
  chkObservacionRegistro.Checked  := False;
end;

procedure TfrmCaptura.LimpiarParticulares;
var
  i         : Integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if (Components[i] is TEdit) and ((Components[i] as tedit).Parent = GrpDatosPersona) then
      (Components[i] as TEdit).Text := ''
    else
      if (Components[i] is TRxDBLookupCombo) and
          ((Components[i] as TRxDBLookupCombo).Parent = GrpDatosPersona) then
        (Components[i] as TRxDBLookupCombo).KeyValue:= -1
      else
        if (Components[i] is TSpeedButton) and
               ((Components[i] as TSpeedButton).Parent = GrpDatosPersona) then
          (Components[i] as TSpeedButton).Enabled:= False;
  end;
  OrigCapt:= '';
end;

procedure TfrmCaptura.LlenarFondos;
begin
  ProcCapt.ObtenerFondos;
  dblFondoEntidad.ListSource:=  ProcCapt.Fondos;
  dblFondoEntidad.KeyField:= 'idfondo';
  dblFondoEntidad.ListField:='descripcionfondo';
  dblFondoEntidad.KeyValue:= -1;
end;

procedure TfrmCaptura.MostrarDatosImagen;
begin
  with ProcCapt.DatosFolio do
  begin
    stgInfoImagen.Cells[1,0]:= CodigoCaja;
    stgInfoImagen.Cells[1,1]:= DescSerieDocum;
    stgInfoImagen.Cells[1,2]:= DescSubSerieDocum;
    stgInfoImagen.Cells[1,3]:= IntToStr(SecuenciaFolio);
    stgInfoImagen.Cells[1,4]:= NombreImagen;
    stgInfoImagen.Cells[1,5]:= UsuaAcce;

  end;
end;

procedure TfrmCaptura.MostrarDatosAsociados;
begin
  dbgAsociados.DataSource:= ProcCapt.DatosAsociados;
  Application.ProcessMessages;
end;


procedure TfrmCaptura.MostrarDatosPersonas;
begin
  dbgPersonas.DataSource:= ProcCapt.DatosMTIANI;
  dbgPersonas.Columns[0].Width:= 130;
  dbgPersonas.Columns[1].Width:= 130;
  dbgPersonas.Columns[2].Width:= 80;
  dbgPersonas.Columns[3].Width:= 200;
  GrpOpcionesGuardar.Visible:=True;
  spbGuardarRegistro.Enabled:=False;
  spbCancelarLimpiar.Enabled:=True;
  spbNuevaPersona.Enabled   :=True;
  GrpBusquedaPersonas.Enabled:=True;
  rpnBuscando.Visible       := False;
  Application.ProcessMessages;
    {
  with DBGrid1 do
  begin
    Canvas.Font.Assign(DBGrid1.Font);
    DataSource.DataSet.First;
    SetLength(anchmaxi,columns.Count);
    for I := 0 to High do

    anchmaxi:= canvas.TextWidth(DataSource.DataSet.Fields[0].      FieldByName('nombres').Value);
    while not DBGrid1.DataSource.DataSet.eof do
    begin
      if canvas.TextWidth(DBGrid1.DataSource.DataSet.FieldByName('nombres').Value) > anchmaxi then
        anchmaxi:=  canvas.TextWidth(DBGrid1.DataSource.DataSet.FieldByName('nombres').Value);
      DBGrid1.DataSource.DataSet.Next;
    end;
    DBGrid1.Columns[0].t:=anchmaxi;
  end;
  }
end;

procedure TfrmCaptura.MostrarEncabezadoCaptura;
begin
  {VERIFICACIONES PARA EL CASO DE PLANILLAS DE N�MINA}
  if ProcCapt.DatosFolio.DescTipoSerieDocum = 'PLANILLAS DE N�MINA' then
  begin
    TipoCapt := 'N';
    GrpGeneralesNomina.Visible   := True;
    bbtCambiarFechaNomina.Visible:= True;
    GrpGeneralesHistorias.Visible:= False;
    if ProcCapt.DatosFolio.FechaNomina = ''  then
    begin
      raise Exception.Create('El Folio no registra Fecha de N�mina.')
    end
    else
    begin
      if (dbgAsociados.DataSource.DataSet.RecordCount = 0) and
            (ProcCapt.DatosFolio.NovedadesFolio.Count = 0) then
        raise Exception.Create('El Folio registra Fecha de N�mina pero no tiene '
                                + 'Datos de Captura ni Novedades.')
      else
      begin
        ActivarObjetosConRegistroCaptura;
        mkeFechaNomina.Text:= ProcCapt.DatosFolio.FechaNomina;
        bbtGuardarFechaNomina.Visible:= False;
        spbCancelarFechaNomina.Visible:= False;
        PnlDatosNomina.Enabled:=false;
      end;
    end;
  end
  else
    {VERIFICACIONES PARA EL CASO DE PLANILLAS DE APORTES}
    if ProcCapt.DatosFolio.DescTipoSerieDocum = 'PLANILLAS DE APORTES' then
    begin
      TipoCapt := 'A';
      GrpGeneralesAportes.Visible           := True;
      bbtCambiarInformacionAportes.Visible  := True;
      GrpGeneralesHistorias.Visible:= False;
      LlenarFondos;
      if (ProcCapt.DatosFolio.IdFondo = 0) and (ProcCapt.DatosFolio.PeriodoCotizacion = '')
           and (ProcCapt.DatosFolio.FechaPagoBanco = '') then
        raise Exception.Create
                ('El Folio no registra informaci�n de Fondo, Periodo de Cotizaci�n y Fecha de Pago.')
      else
      begin
        if (ProcCapt.DatosFolio.IdFondo <> 0) and (ProcCapt.DatosFolio.PeriodoCotizacion <> '')
            and (ProcCapt.DatosFolio.FechaPagoBanco <> '') then
          begin
            if (dbgAsociados.DataSource.DataSet.RecordCount = 0) and
                (ProcCapt.DatosFolio.NovedadesFolio.Count = 0) then
              raise Exception.Create('El Folio registra informaci�n de la Entidad del Fondo, '
                                      + 'Per�odo de Cotizaci�n y Fecha de Pago al Banco, '
                                      + 'pero no tiene Datos de Captura ni Novedades.')
            else
            begin
              ActivarObjetosConRegistroCaptura;
              dblFondoEntidad.KeyValue          := ProcCapt.DatosFolio.IdFondo;
              mkePeriodoCotizacion.Text         := ProcCapt.DatosFolio.PeriodoCotizacion;
              mkeFechaPagoBanco.Text            := ProcCapt.DatosFolio.FechaPagoBanco;
              bbtGuardarCambiosAportes.Visible  := False;
              spbCancelarCambiosAportes.Visible := False;
              PnlDatosAportes.Enabled:=False;
            end;
          end
        else
          raise Exception.Create('La informaci�n de Entidad del Fondo, Per�odo de Cotizaci�n '
                                  + 'y Fecha de Pago al Banco para este folio, es incompleta.');
      end;

    end
    else
      {VERIFICACIONES PARA EL CASO DE HISTORIAS LABORALES}
      if ProcCapt.DatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES' then
      begin
        TipoCapt:= 'H';
        LblTituloHistorias.Caption:= 'CAPTURA DE INFORMACION HISTORIAS LABORALES'
      end
      else
      begin
        TipoCapt := ' ';
        raise Exception.Create('No se permite la captura del folio ya que el Tipo de '
                                + 'Serie Documental [' + ProcCapt.DatosFolio.DescTipoSerieDocum
                                + '] es incorrecto.');
      end;
end;

procedure TfrmCaptura.ValidarCompletitudAportes;
{PROCEDIMIENTO QUE VERIFICA LA COMPETITUD DE LOS DATOS DE APORTES PARA SABER SI ACTIVA
 EL BOTON DE GRABACI�N O NO}
begin
  if (dblFondoEntidad.KeyValue = ProcCapt.DatosFolio.IdFondo)
        and ((Pos(' ',mkeFechaPagoBanco.Text) > 0)
              or (mkeFechaPagoBanco.Text = ProcCapt.DatosFolio.FechaPagoBanco))
        and ((Pos(' ',mkePeriodoCotizacion.Text) > 0)
              or (mkePeriodoCotizacion.Text = ProcCapt.DatosFolio.PeriodoCotizacion)) then
    bbtGuardarCambiosAportes.Enabled := false
  else
    bbtGuardarCambiosAportes.Enabled := True;
end;


{$ENDREGION}
end.
