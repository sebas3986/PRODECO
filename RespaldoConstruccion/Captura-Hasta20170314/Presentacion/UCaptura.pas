unit UCaptura;

interface

uses
  Windows, Messages, SysUtils, StrUtils, StdCtrls, Controls, Classes, Graphics, Forms,
  dateutils, Dialogs, ExtCtrls, ComCtrls,  Buttons, IdIPWatch, EnImgScr, EnBlowupForm,
  Vcl.Grids,  Vcl.Mask, RxLookup, DB, variants,  System.MaskUtils,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBGrids,
  RxSpin, RxSlider, RxCombos, RxRichEd, RxCtrls,
  UCliente, UProcesoCaptura, UFtpGestor, UDMConexion,FPGenerales, Vcl.DBCtrls;

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
    spbTerminarFolio: TSpeedButton;
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
    bbtConfirmarFecha: TBitBtn;
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
    GrpGeneralesAportes: TGroupBox;
    LblFechaPagoBanco: TLabel;
    mkeFechaPagoBanco: TMaskEdit;
    bbtConfirmarDatos: TBitBtn;
    LblFondoEntidad: TLabel;
    LblPeriodoCotizacion: TLabel;
    mkePeriodoCotizacion: TMaskEdit;
    spbGuardarRegistro: TSpeedButton;
    PnlSerieDocumental: TPanel;
    LblSerieDocumental: TLabel;
    dblSerieDocumental: TDBLookupComboBox;
    GrpGeneralesHistorias: TGroupBox;
    LblTituloHistorias: TLabel;
    dblFondoEntidad: TDBLookupComboBox;
    EdtTemporal: TEdit;
    procedure FormShow(Sender: TObject);

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure spbSalirClick(Sender: TObject);
    procedure spbNuevoFolioClick(Sender: TObject);
    procedure stgInfoImagenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure tmrTiempoFolioTimer(Sender: TObject);
    procedure chkObservacionFolioClick(Sender: TObject);
    procedure spbTerminarFolioClick(Sender: TObject);
    procedure mkeFechaNominaExit(Sender: TObject);

    procedure rlbTipoIdentificacionChange(Sender: TObject);
    procedure spbBuscarAndesClick(Sender: TObject);
    procedure dbgPersonasDblClick(Sender: TObject);
    procedure spbBuscarMtiClick(Sender: TObject);
    procedure bbtConfirmarFechaClick(Sender: TObject);
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
    procedure dblFondoEntidadExit(Sender: TObject);
    procedure dblFondoEntidadClick(Sender: TObject);
    procedure bbtConfirmarDatosClick(Sender: TObject);
    procedure dblSerieDocumentalClick(Sender: TObject);
    procedure EdtTemporalEnter(Sender: TObject);
    procedure bbtConfirmarDatosEnter(Sender: TObject);
    procedure mkeFechaPagoBancoEnter(Sender: TObject);
    procedure dblFondoEntidadEnter(Sender: TObject);
    procedure dblSerieDocumentalEnter(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure redObservacionFolioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure redObservacionRegistroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }
    DireccIP  : String;
    procedure ActivarObjetosConRegistroCaptura;
    procedure InactivarOpcionesGuardar;
    procedure LlenarFondos;
    procedure LlenarSeriesDocumentales;
    procedure LimpiarControles;
    procedure LimpiarDatosCaptura;
    procedure LimpiarNovedadRegistro;
    procedure LimpiarParticulares;
    procedure LimpiarBases;
    procedure ConfigurarAmbiente;
    procedure GuardarNovedadSinCaptura;
    procedure GuardarCaptura;
    procedure MostrarDatosImagen;
    procedure MostrarDatosPersonas;
    procedure MostrarEncabezadoCaptura;
    procedure ValidarCompletitudAportes;

  end;

var
  DiasProc  : Integer;
  frmCaptura: TfrmCaptura;
  frmLupa   : TBlowupForm;
  ModoDrag  : Boolean;
  NombModu  : string;
  OrigCapt  : string;
  ProcCapt  : TProcesoCaptura;
  PuntMous  : TPoint;
  SelePers  : Boolean;
  TiemProc  : TTime;
  TipoCapt  : Char;
  VersModu  : string;

implementation

{$R *.dfm}

{$REGION 'EVENTOS' }

procedure TfrmCaptura.bbtConfirmarDatosClick(Sender: TObject);
begin
  bbtConfirmarDatos.Visible     := False;
  GrpGeneralesAportes.Enabled   := False;
  GrpDatosPersona.Enabled       := True;
  chkObservacionRegistro.Enabled:=True;
  ProcCapt.DatosFolio.TipoPlanilla      := 'A';
  ProcCapt.DatosFolio.IdFondo           := dblFondoEntidad.KeyValue;
  ProcCapt.DatosFolio.PeriodoCotizacion := '01/' + mkePeriodoCotizacion.Text;
  ProcCapt.DatosFolio.FechaPagoBanco    := mkeFechaPagoBanco.Text;
  rlbTipoIdentificacion.SetFocus;
end;

procedure TfrmCaptura.bbtConfirmarDatosEnter(Sender: TObject);
begin
  EdtTemporal.Visible:=False;
end;

procedure TfrmCaptura.bbtConfirmarFechaClick(Sender: TObject);
begin
  bbtConfirmarFecha.Visible   :=False;
  GrpGeneralesNomina.Enabled := False;
  GrpDatosPersona.Enabled:= True;
  chkObservacionRegistro.Enabled:=True;
  ProcCapt.DatosFolio.TipoPlanilla      := 'N';
  ProcCapt.DatosFolio.FechaNomina       := mkeFechaNomina.Text;
  rlbTipoIdentificacion.SetFocus;
end;

procedure TfrmCaptura.cbxZoomPredefinidoChange(Sender: TObject);
begin
  rseZoom.Value:=Trunc(ZoomInstruccion(imsFolio, cbxZoomPredefinido.ItemIndex));
end;

procedure TfrmCaptura.ccbColorReglaChange(Sender: TObject);
begin
  RpnRegla.Color:= ccbColorRegla.ColorValue;
end;

procedure TfrmCaptura.chkObservacionFolioClick(Sender: TObject);
begin

  if chkObservacionFolio.Checked then
    begin
      if TipoCapt = 'N' then
      begin
        GrpGeneralesNomina.Enabled:=False;
        mkeFechaNomina.Text:='  /  /    ';
        bbtConfirmarFecha.Enabled:=False;
      end
      else
        if TipoCapt = 'A' then
        begin
          GrpGeneralesAportes.Enabled :=False;
          dblFondoEntidad.KeyValue    := -1;
          mkePeriodoCotizacion.Text   := '  /    ';
          mkeFechaPagoBanco.Text      := '  /  /    ';
          bbtConfirmarDatos.Enabled   := False;
        end
        else
           { ESTE CASO ES CUANDO EL TIPOCAPT = 'H'}
        begin
          GrpDatosParticulares.Enabled := false;
        end;

      redObservacionFolio.Enabled   :=True;
      redObservacionFolio.SetFocus;
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
        GrpGeneralesNomina.Enabled   := True;
        mkeFechaNomina.SetFocus;
      end
      else
        if TipoCapt = 'A' then
        begin
          GrpGeneralesAportes.Enabled := True;
          dblFondoEntidad.SetFocus;
        end
        else
        begin
          GrpDatosParticulares.Enabled := True;
        end;
      redObservacionFolio.Enabled := False;
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
      if TipoCapt = 'H' then
        chkObservacionFolio.Enabled:= False;

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
      if (TipoCapt = 'H') and  (ProcCapt.DatosPersonasFolio.Count = 0) and
          (rlbTipoIdentificacion.KeyValue = -1) and (EdtNumeroDocumento.Text = '') and
            (EdtPrimerNombre.Text = '') and (EdtSegundoNombre.Text = '') and
            (EdtPrimerApellido.Text = '') and (EdtSegundoApellido.Text = '') then
        chkObservacionFolio.Enabled:=True;

      redObservacionRegistro.Enabled:=False;
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

procedure TfrmCaptura.dblFondoEntidadExit(Sender: TObject);
begin
  ValidarCompletitudAportes;
end;

procedure TfrmCaptura.dblSerieDocumentalClick(Sender: TObject);
begin
  if dblSerieDocumental.KeyValue >= 0 then
    spbNuevoFolio.Enabled := True;
end;

procedure TfrmCaptura.dblSerieDocumentalEnter(Sender: TObject);
begin
  ProcCapt.VerificarVersion(NombModu,VersModu);
  LlenarSeriesDocumentales;
  dblSerieDocumental.CloseUp(true);  dblSerieDocumental.DropDown;
end;

procedure TfrmCaptura.EdtTemporalEnter(Sender: TObject);
begin
  SelectNext(sender as TWinControl,True,true);
  EdtTemporal.Visible:=False;
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
   rlbTipoIdentificacionChange(Sender);
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
   rlbTipoIdentificacionChange(Sender);
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
  if Application.MessageBox('Desea Salir del M�dulo de Captura?', 'Advertencia',
                            MB_ICONINFORMATION + MB_YESNO) = IDYES then
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

procedure TfrmCaptura.FormPaint(Sender: TObject);
begin
  {SE REALIZA LO SIGUIENTE PARA CORREGIR UN DESFASE EN EL DESPLIEGUE DE LA LISTA DE
   SERIES DOCUMENTALES}
  if TipoCapt = '*' then
  begin
    dblSerieDocumental.SetFocus;
    TipoCapt := #0;
  end;
end;

procedure TfrmCaptura.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
end;

procedure TfrmCaptura.mkeFechaNominaChange(Sender: TObject);
begin
  {LA SIGUIENTE LINEA ES PARA SUPRIMIR MENSAJES DE ERROR PROPIOS DEL CONTROL}
  mkeFechaNomina.Modified:= False;
  if mkeFechaNomina.Text = '  /  /    ' then
  begin
    chkObservacionFolio.Enabled := true;
  end
  else
  begin
    chkObservacionFolio.Enabled := False;
  end;
  if Pos(' ',mkeFechaNomina.Text) > 0 then
    bbtConfirmarfecha.Enabled := False;
end;

procedure TfrmCaptura.mkeFechaNominaExit(Sender: TObject);
begin
  try
    if (StrToDate(mkeFechaNomina.Text) > StrToDate('01/01/1940'))
        and (StrToDate(mkeFechaNomina.Text) < Now())
        and (Pos(' ',mkeFechaNomina.Text) = 0) then
    begin
      bbtConfirmarFecha.Enabled:= true;
      bbtConfirmarFecha.SetFocus;
    end
    else
    begin
      Application.MessageBox(PChar('Fecha incorrecta. Se admiten fechas entre [01/01/1940] y ['
                              + DateToStr(now()) + '].'), 'Fecha N�mina',
                              MB_OK + MB_ICONERROR);
      bbtConfirmarFecha.Enabled:= False;
      mkeFechaNomina.SetFocus;
    end;
  except
    if mkeFechaNomina.Text <> '  /  /    ' then
    begin
      Application.MessageBox(PChar('Fecha incorrecta. Se admiten fechas entre [01/01/1940] y ['
                              + DateToStr(now()) + '].'), 'Fecha N�mina',
                              MB_OK + MB_ICONERROR);
      bbtConfirmarFecha.Enabled:= False;
      mkeFechaNomina.SetFocus;
    end;
  end;
end;


procedure TfrmCaptura.mkeFechaPagoBancoChange(Sender: TObject);
begin
  {LA SIGUIENTE LINEA ES PARA SUPRIMIR MENSAJES DE ERROR PROPIOS DEL CONTROL}
  mkeFechaPagoBanco.Modified:= False;
  if (dblFondoEntidad.KeyValue = -1) or  (mkeFechaPagoBanco.Text = '  /  /    ')
        or (mkePeriodoCotizacion.Text = '  /    ') then
  begin
    chkObservacionFolio.Enabled := true;
  end
  else
  begin
    chkObservacionFolio.Enabled := False;
  end;
  if (Pos(' ',mkeFechaPagoBanco.Text) > 0) or (Pos(' ',mkePeriodoCotizacion.Text) > 0) then
    bbtConfirmarDatos.Enabled := False;
end;

procedure TfrmCaptura.mkeFechaPagoBancoEnter(Sender: TObject);
begin
  EdtTemporal.visible:=True;
end;

procedure TfrmCaptura.mkeFechaPagoBancoExit(Sender: TObject);
var
  DiaaMaxi: string;
  ErroFech: Boolean;
  FechMaxi: TDate;
  FechMini: TDate;
  FechPago: TDate;
begin

  ErroFech:=False;
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
      {ACTUALIZACI�N: [2016-03-14]
        SE REEMPLAZA LA SIGUIENTE L�NEA PARA VALIDAR UNA DIFERENCIA DE HASTA DIEZ A�OS EN LA FECHA DE
        PERIODO DE COTIZACION Y LA FECHA DE PAGO AL BANCO
        FechMaxi:= IncYear(StrToDate(DiaaMaxi + '/' + mkePeriodoCotizacion.text),6);
      }
      FechMaxi:= IncYear(StrToDate(DiaaMaxi + '/' + mkePeriodoCotizacion.text),10);
      if FechMaxi > Now() then
        FechMaxi:= Now();
    end;
    if (Pos(' ',mkeFechaPagoBanco.Text) = 0) and IsValidDate(StrToInt(AnsiRightstr(mkeFechaPagoBanco.Text,4)),
                   StrToInt(AnsiMidStr(mkeFechaPagoBanco.Text,4,2)),
                   StrtoInt(AnsiLeftStr(mkeFechaPagoBanco.Text,2))) then
    begin
      FechPago:= StrToDate(mkeFechaPagoBanco.Text);
      if (FechPago >= FechMini) and (FechPago <= FechMaxi) then
        ValidarCompletitudAportes
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
                                        ' (Hasta 10 a�os mas del Periodo de Cotizaci�n).')),
                              'Fecha Pago Banco',
                              MB_OK + MB_ICONERROR);
      bbtConfirmarDatos.Enabled := False;
      mkeFechaPagoBanco.SetFocus;
    end;
  end;
end;

procedure TfrmCaptura.mkePeriodoCotizacionChange(Sender: TObject);
begin
  mkePeriodoCotizacion.Modified:= False;
  {SE USA EL EVENTO CHANGE DE MKEFECHAPAGOBANCO}
  mkeFechaPagoBancoChange(Sender);
end;

procedure TfrmCaptura.mkePeriodoCotizacionExit(Sender: TObject);
var
  PeriMaxi: TDate;
  PeriMini: TDate;
  PeriCoti: TDate;
  ErroFech: Boolean;
begin
  ErroFech:=False;
  if mkePeriodoCotizacion.Text <> '  /    ' then
  begin
    if mkeFechaPagoBanco.Text = '  /  /    ' then
    begin
      PeriMini:= StrToDate('01/01/1940');
      PeriMaxi:= Now();
    end
    else
    begin
      {ACTUALIZACI�N: [2016-03-14]
        SE REEMPLAZA LA SIGUIENTE L�NEA PARA VALIDAR UNA DIFERENCIA DE HASTA DIEZ A�OS EN LA FECHA DE
        PERIODO DE COTIZACION Y LA FECHA DE PAGO AL BANCO
        PeriMini:= IncYear(StrToDate('01/' + AnsiRightStr(mkeFechaPagoBanco.text,7)),-6);
      }
      PeriMini:= IncYear(StrToDate('01/' + AnsiRightStr(mkeFechaPagoBanco.text,7)),-10);
      if PeriMini < StrToDate('01/01/1940') then
        PeriMini:= StrToDate('01/01/1940');
      PeriMaxi:= StrToDate(mkeFechaPagoBanco.Text);
    end;
    if (Pos(' ',mkePeriodoCotizacion.Text) = 0) and IsValidDate(StrToInt(AnsiRightstr(mkePeriodoCotizacion.Text,4)),
                   StrtoInt(AnsiLeftStr(mkePeriodoCotizacion.Text,2)),1) then
    begin
      PeriCoti:= StrToDate('01/' + mkePeriodoCotizacion.Text);
      if (PeriCoti >= PeriMini) and (PeriCoti <= PeriMaxi) then
        ValidarCompletitudAportes
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
                                        ' (M�nimo 10 a�os menos que la Fecha de Pago al Banco).')),
                              'Fecha Pago Banco',
                              MB_OK + MB_ICONERROR);
      bbtConfirmarDatos.Enabled := False;
      mkePeriodoCotizacion.SetFocus;
    end;
  end;
end;

procedure TfrmCaptura.redObservacionFolioChange(Sender: TObject);
begin
  QuitaEspaciosObjtxt(Sender, false);
  {ELIMINA LOS ENTER QUE TENGA EL TEXTO}
  redObservacionFolio.Text:= StringReplace(redObservacionFolio.Text,#13#10,' ',[rfReplaceAll]);
end;

procedure TfrmCaptura.redObservacionFolioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Key:=0;

end;



procedure TfrmCaptura.redObservacionFolioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {PARA CONTROLAR QUE SI SE PEGA DESDE EL PORTAPAPELES COLOQUE EL CURSOR AL FINAL}
  if (Shift = [ssCtrl]) and (Key= 86) then
    redObservacionFolio.SelStart := Length(redObservacionFolio.Text);
end;

procedure TfrmCaptura.redObservacionRegistroChange(Sender: TObject);
begin
  QuitaEspaciosObjtxt(Sender, false);
  {ELIMINA LOS ENTER QUE TENGA EL TEXTO}
  redObservacionRegistro.Text:= StringReplace(redObservacionRegistro.Text,#13#10,' ',[rfReplaceAll]);
end;

procedure TfrmCaptura.redObservacionRegistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Key:=0;
end;

procedure TfrmCaptura.redObservacionRegistroKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {PARA CONTROLAR QUE SI SE PEGA DESDE EL PORTAPAPELES COLOQUE EL CURSOR AL FINAL}
  if (Shift = [ssCtrl]) and (Key= 86) then
    redObservacionRegistro.SelStart := Length(redObservacionRegistro.Text);
end;

procedure TfrmCaptura.rlbTipoIdentificacionChange(Sender: TObject);
begin
  {PARA INACTIVAR LA OBSERVACION DEL FOLIO SI SE HA DIGIATADO ALGO EN ALGUN DATO DE
    LA PERSONA}
  if (rlbTipoIdentificacion.Text <> '') or (EdtNumeroDocumento.Text <> '') or
      (EdtPrimerNombre.Text <> '') or (EdtSegundoNombre.Text <> '') or
      (EdtPrimerApellido.text <> '') or (EdtSegundoApellido.Text <> '') then
  begin
    chkObservacionFolio.Enabled:= False;
  end
  else
  begin
    if ProcCapt.DatosPersonasFolio.Count = 0 then
      chkObservacionFolio.Enabled:= true;
  end;

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

procedure TfrmCaptura.spbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desea cancelar la Captura del Folio en curso?', 'Advertencia',
                              MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    spbCancelar.Enabled   := False;
    LimpiarControles;
  end;
end;

procedure TfrmCaptura.spbCancelarLimpiarClick(Sender: TObject);
begin
  GrpDatosPersona.Enabled  := True;
  if (StrToInt(PnlRegistrosIngresados.Caption) = 0) and
        (StrToInt(PnlNovedadesSinCap.Caption) = 0) then
    GrpGeneralesNomina.Enabled:=True;
  LimpiarParticulares;
  LimpiarBases;
  LimpiarNovedadRegistro;
  InactivarOpcionesGuardar;
  chkObservacionRegistro.Enabled:=True;
  rlbTipoIdentificacion.SetFocus;
end;

procedure TfrmCaptura.spbGuardarRegistroClick(Sender: TObject);
var
  NotaAdic : string;
  RespSegu : Integer;
begin
  if ProcCapt.DatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES' then
    NotaAdic := #13#10 + #13#10
                +'NOTA: Recuerde que los Folios de HISTORIAS LABORALES admiten �nicamente '
                +'un registro de Persona.'
                + #13#10 + 'El Folio se cerrar� de una vez.'
  else
    NotaAdic := '';
  if chkObservacionRegistro.Checked  then
  begin
    if redObservacionRegistro.Text ='' then
      Application.MessageBox(PChar('No se permite guardar una Novedad de '
                              + 'Registro sin el respectivo texto descriptivo en el '
                              + 'campo de Observaciones  Registro. '),
                              'Captura de Informaci�n', MB_ICONINFORMATION + MB_OK)
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
      begin
        if Application.MessageBox(PChar('Esta seguro(a) de Guardar este Registro de '
                                         + 'Persona con la Novedad digitada?'
                                         + NotaAdic),
                                  'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
          GuardarCaptura;
      end;
  end
  else
  begin
    if Application.MessageBox(PChar('Esta seguro(a) de Guardar este Registro de Persona?'
                                    + NotaAdic),
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO) = IDYES then
      GuardarCaptura;
  end;
end;

procedure TfrmCaptura.spbLupaClick(Sender: TObject);
begin
  if spbLupa.Caption = 'Activar L&upa' then
  begin
    ZoomEmergente(frmLupa,imsFolio,'Funci�n de Aumento (Lupa)',Self, 300,300,true);
    spbLupa.Caption:= 'Remover L&upa'
  end
  else
  begin
      ZoomEmergente(frmLupa,imsFolio,'Funci�n de Aumento (Lupa)', Self,300,300,false);
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
    ProcCapt.DatosFolio.DescSerieDocum := dblSerieDocumental.Text;
    ProcCapt.ObtenerFolioCaptura(dblSerieDocumental.Text);
    if ProcCapt.DatosFolio.IdFolio > 0 then
    begin
      RpnVisor.Enabled:= True;
      GrpInformacionImagen.Enabled := True;
      spbNuevoFolio.Enabled       := False;
      PnlSerieDocumental.Enabled  := False;
      spbCancelar.Enabled         := True;
      MostrarDatosImagen;
      ProcCapt.ObtenerDatosFolio;
      if ProcCapt.DatosFolio.ImagenLocal <> '' then
      begin
        imsFolio.FileName:= ProcCapt.DatosFolio.ImagenLocal;
        cbxZoomPredefinido.ItemIndex:= cbxZoomPredefinido.Items.IndexOf('Ajustar al Ancho');
        rseZoom.Value:= Trunc(ZoomInstruccion(imsFolio, cbxZoomPredefinido.ItemIndex));
        DiasProc:= ProcCapt.DatosFolio.DiasBloqueo;
        TiemProc:= ProcCapt.DatosFolio.HorasBloqueo;
        PnlTiempoCaptura.Caption:= ifthen(DiasProc > 0,IntToStr(diasproc) +'d ','')
                                          + FormatDateTime('hh:mm:ss',TiemProc);
        PnlRegistrosIngresados.Caption:= IntToStr(ProcCapt.DatosPersonasFolio.Count);
        PnlNovedadesSinCap.Caption    := IntToStr(ProcCapt.DatosFolio.NovedadesFolio.Count);

        GrpInformacionImagen.Enabled:= True;
        tmrTiempoFolio.Enabled:= True;
        MostrarEncabezadoCaptura;
        SelePers:= False;
        ProcCapt.ObtenerTiposIdentificacion;
        rlbTipoIdentificacion.LookupSource:= ProcCapt.TiposIdentificacion;;
        rlbTipoIdentificacion.LookupDisplay:= 'descripciontipoidentificacion';
        rlbTipoIdentificacion.LookupField:= 'idtipoidentificacion';
        rlbTipoIdentificacion.KeyValue   := -1;
      end;
    end
    else
    begin
      Application.MessageBox(PChar ('No existen folios disponibles para Captura de la '
                                    + 'Serie Documental [' + dblSerieDocumental.Text + '].'),
                             'Captura de Informaci�n',MB_OK OR MB_ICONASTERISK);
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

procedure TfrmCaptura.spbTerminarFolioClick(Sender: TObject);
var
  RespSegu: Integer;
  RespNoca: Integer;
begin
  if chkObservacionFolio.Checked then
  begin
    if redObservacionFolio.Text ='' then
      Application.MessageBox(PChar('No se permite guardar un Folio con novedad sin el respectivo '
                              + 'texto descriptivo en el campo de Observaciones Documento. '),
                              'Captura de Informaci�n',
                              MB_ICONINFORMATION + MB_OK)
    else
      RespSegu := Application.MessageBox('Esta seguro(a) de Terminar y Guardar este Folio'
                                          + ' con Novedad y sin Registros de Capura?',
                            'Advertencia', MB_ICONINFORMATION + MB_YESNO);
  end
  else
  begin
    if ProcCapt.DatosPersonasFolio.Count = 0 then
      Application.MessageBox(PChar('No se permite guardar un Folio sin Registros de Captura. '
                              + 'Si el Folio es totalmente ilegible m�rquelo como Documento '
                              + 'con Novedad con su respectiva observaci�n. '),
                              'Captura de Informaci�n',
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
                              'Captura de Informaci�n',
                              MB_ICONINFORMATION + MB_OK)
      else
      begin
        redObservacionFolio.Text := '';
        RespSegu := Application.MessageBox('Esta seguro(a) de Terminar y Guardar este Folio?',
                                'Advertencia', MB_ICONINFORMATION + MB_YESNO);
      end;
    end;
  end;

  if RespSegu = IDYES then
  begin
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
                               'Captura de Informaci�n', MB_ICONINFORMATION + MB_OK);
        LimpiarControles;
      end;
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
end;

procedure TfrmCaptura.ConfigurarAmbiente;
begin
  {SE CREA EL OBJETO DE LA CAPA LOGICA }
  NombModu:= 'MODULOCAPTURA';
  VersModu:= '20170303.M01';
  ProcCapt := TProcesoCaptura.Create;

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  ProcCapt.VerificarVersion(NombModu,VersModu);
  frmCaptura.Caption:= 'Captura de Informaci�n - [ Versi�n ' + VersModu + ' ]';
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  stbBarraEstado.Panels[0].Text:='Usuario: ' + ParamStr(1);
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
    if ProcCapt.DatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES' then
    begin
      RpnMensajeGrabar.Caption := 'REGISTRO Y FOLIO GUARDADOS';
      RpnMensajeGrabar.Visible:=True;
      Application.ProcessMessages;
      Sleep(1500);
      LimpiarControles;
    end
    else
    begin
      RpnRegistroGuardado.Caption := 'REGISTRO GUARDADO';
      RpnRegistroGuardado.BringToFront;
      RpnRegistroGuardado.Visible:=True;
      Application.ProcessMessages;
      Sleep(1500);
      LimpiarDatosCaptura;
    end;
  except
    on e:Exception do
    begin
       Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n',MB_ICONWARNING + MB_OK);
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
       Application.MessageBox(PChar(e.Message), 'Captura de Informaci�n',MB_ICONWARNING + MB_OK);
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
  mkeFechaNomina.Text       := '  /  /    ';
  mkePeriodoCotizacion.Text := '  /    ';
  mkeFechaPagoBanco.Text    := '  /  /    ';
  bbtConfirmarFecha.Visible := True;
  bbtConfirmarDatos.Visible := True;
  bbtConfirmarFecha.Enabled := False;
  bbtConfirmarDatos.Enabled := False;
  redObservacionFolio.text:='';
  redObservacionFolio.Enabled:=False;
  chkObservacionFolio.Enabled:=False;
  chkObservacionFolio.Checked:= False;

  if spbRegla.Caption = 'Remover &Regla' then
    spbReglaClick(spbRegla);
  if spbLupa.Caption = 'Remover L&upa' then
    spbLupaClick(spbRegla);
  cbxZoomPredefinido.Text:= 'Ajustar al Ancho';
  rseZoom.Value:=1;
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
  LimpiarBases;
  LimpiarNovedadRegistro;
  RpnMensajeGrabar.Visible:=False;
  tmrTiempoFolio.Enabled  := False;
  spbCancelar.Enabled     :=False;
  spbNuevoFolio.Enabled   := False;

  {SE CREA NUEVAMENTE EL OBJETO DE LA CAPA L�GICA}
  ProcCapt := TProcesoCaptura.Create;
  PnlSerieDocumental.Enabled := True;
  {no quitar la siguiente linea ni la de abajo}
  dblSerieDocumental.SetFocus;

  LblTituloHistorias.Caption := 'INFORMACI�N PROCESO DE CAPTURA';
  GrpGeneralesHistorias.Visible := true;
  GrpGeneralesNomina.Visible    := False;
  GrpGeneralesAportes.Visible   := False;
  {no quitar la siguiente linea}
  dblSerieDocumental.SetFocus;
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
  if (ProcCapt.DatosPersonasFolio.count >= 0) OR
      (ProcCapt.DatosFolio.NovedadesFolio.count >= 0) then
  begin
    GrpGeneralesNomina.Enabled:=False;
    GrpDatosPersona.Enabled:= True;
    PnlRegistrosIngresados.Caption:= IntToStr(ProcCapt.DatosPersonasFolio.Count);
    PnlNovedadesSinCap.Caption    := IntToStr(ProcCapt.DatosFolio.NovedadesFolio.Count);
    bbtConfirmarFecha.Visible:=False;
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

procedure TfrmCaptura.LlenarSeriesDocumentales;
begin
  ProcCapt.ObtenerSeriesDocumentales;
  dblSerieDocumental.ListSource:=  ProcCapt.SeriesDocumentales;
  dblSerieDocumental.KeyField:= 'idseriedocumental';
  dblSerieDocumental.ListField:='descripcionseriedocumental';
  dblSerieDocumental.KeyValue:= -1;
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
    stgInfoImagen.Cells[1,5]:= ParamStr(1);

  end;
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

end;

procedure TfrmCaptura.MostrarEncabezadoCaptura;
begin
  {VERIFICACIONES PARA EL CASO DE PLANILLAS DE N�MINA}
  if ProcCapt.DatosFolio.DescTipoSerieDocum = 'PLANILLAS DE N�MINA' then
  begin
    TipoCapt := 'N';
    GrpGeneralesNomina.Visible   := True;
    GrpGeneralesHistorias.Visible:= False;
    if ProcCapt.DatosFolio.FechaNomina = ''  then
    begin
      If ProcCapt.DatosPersonasFolio.count > 0 then
        raise Exception.Create('El Folio tiene informaci�n de Captura y no registra '
                                + 'Fecha de N�mina .')
      else
      begin
        if ProcCapt.DatosFolio.NovedadesFolio.Count > 0 then
           raise Exception.Create('El Folio tiene Novedades de Captura y no registra '
                                  + 'Fecha de N�mina.')
        else
        begin
          chkObservacionFolio.Enabled := True;
          GrpGeneralesNomina.Enabled  := True;
          mkeFechaNomina.SetFocus;
        end;
      end
    end
    else
    begin
      if (ProcCapt.DatosPersonasFolio.count = 0) and
            (ProcCapt.DatosFolio.NovedadesFolio.Count = 0) then
        raise Exception.Create('El Folio registra Fecha de N�mina pero no tiene '
                                + 'Datos de Captura ni Novedades.')
      else
      begin
        ActivarObjetosConRegistroCaptura;
        mkeFechaNomina.Text:= ProcCapt.DatosFolio.FechaNomina;
        GrpGeneralesNomina.Enabled:=False;
        bbtConfirmarFecha.Visible:=False;
      end;
    end;
  end
  else
    {VERIFICACIONES PARA EL CASO DE PLANILLAS DE APORTES}
    if ProcCapt.DatosFolio.DescTipoSerieDocum = 'PLANILLAS DE APORTES' then
    begin
      TipoCapt := 'A';
      GrpGeneralesAportes.Visible  := True;
      GrpGeneralesHistorias.Visible:= False;
      LlenarFondos;
      if (ProcCapt.DatosFolio.IdFondo = 0) and (ProcCapt.DatosFolio.PeriodoCotizacion = '')
           and (ProcCapt.DatosFolio.FechaPagoBanco = '') then
      begin
        If ProcCapt.DatosPersonasFolio.count > 0 then
          raise Exception.Create('El Folio tiene informaci�n de Captura y no registra '
                                + 'informaci�n de la Entidad del Fondo, Per�odo de '
                                + 'Cotizaci�n y Fecha de Pago al Banco.')
        else
        begin
          if ProcCapt.DatosFolio.NovedadesFolio.Count > 0 then
             raise Exception.Create('El Folio tiene Novedades de Captura y no registra '
                                    + 'informaci�n de la Entidad del Fondo, Per�odo de '
                                    + 'Cotizaci�n y Fecha de Pago al Banco.')
          else
          begin
            chkObservacionFolio.Enabled := True;
            GrpGeneralesAportes.Enabled  := True;
            dblFondoEntidad.SetFocus;
          end;
        end;
      end
      else
      begin
        if (ProcCapt.DatosFolio.IdFondo <> 0) and (ProcCapt.DatosFolio.PeriodoCotizacion <> '')
            and (ProcCapt.DatosFolio.FechaPagoBanco <> '') then
          begin
            if (ProcCapt.DatosPersonasFolio.count = 0) and
                (ProcCapt.DatosFolio.NovedadesFolio.Count = 0) then
              raise Exception.Create('El Folio registra informaci�n de la Entidad del Fondo, '
                                      + 'Per�odo de Cotizaci�n y Fecha de Pago al Banco, '
                                      + 'pero no tiene Datos de Captura ni Novedades.')
            else
            begin
              ActivarObjetosConRegistroCaptura;
              dblFondoEntidad.KeyValue  := ProcCapt.DatosFolio.IdFondo;
              mkePeriodoCotizacion.Text := ProcCapt.DatosFolio.PeriodoCotizacion;
              mkeFechaPagoBanco.Text    := ProcCapt.DatosFolio.FechaPagoBanco;
              GrpGeneralesAportes.Enabled:=False;
              bbtConfirmarDatos.Visible:=False;
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
        LblTituloHistorias.Caption:= 'CAPTURA DE INFORMACION HISTORIAS LABORALES';
        ActivarObjetosConRegistroCaptura;
        If ProcCapt.DatosPersonasFolio.count = 0 then
          chkObservacionFolio.Enabled:=True;
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
begin
  if (dblFondoEntidad.KeyValue <> -1) and (mkePeriodoCotizacion.text <> '  /    ')
      and (mkeFechaPagoBanco.Text <> '  /  /    ') then
    bbtConfirmarDatos.Enabled:= true
  else
    bbtConfirmarDatos.Enabled:= False;
end;


{$ENDREGION}
end.
