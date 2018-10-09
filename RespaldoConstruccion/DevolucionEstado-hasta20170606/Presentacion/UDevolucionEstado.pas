unit UDevolucionEstado;

interface

uses
  Windows,  SysUtils, StdCtrls,  StrUtils, Controls,  Classes,  Graphics,  Forms,
  ComCtrls, ExtCtrls, Buttons, IdIPWatch, DBCtrls, Grids, DBGrids, RxCtrls, DB,
  UDMConexion,  UProcesoDevolucionEsta,  ULoginDevolucionEsta,  UProcesoLoginDevo;
type
  TFrmDevolucionEstado = class(TForm)
    stbBarraEstado: TStatusBar;
    PnlTitulo: TPanel;
    GrpPie: TGroupBox;
    spbSalir: TSpeedButton;
    RpnCriteriosBusqueda: TRxPanel;
    RpnCaptura: TRxPanel;
    GrpSeleccionCarpeta: TGroupBox;
    GrpSeleccionEstado: TGroupBox;
    dblEstadoDevolver: TDBLookupComboBox;
    EdtCodigoCaja: TEdit;
    LblCodigoCaja: TLabel;
    LblEme: TLabel;
    spbConsultarCarpeta: TSpeedButton;
    PnlCriteriosAportes: TPanel;
    stgDatosCarpeta: TStringGrid;
    LblDatosCarpeta: TLabel;
    LblEstadoDevolver: TLabel;
    GrpCriteriosAdicionales: TGroupBox;
    bbtEfectuarDevolucion: TBitBtn;
    bbtOtraCaja: TBitBtn;
    chkEliminaCarpeta: TCheckBox;
    Lbl1: TLabel;
    LblMensajeError: TLabel;
    PnlListaCarpetas: TPanel;
    LblListaCarpetas: TLabel;
    LblAyudaCarpetas: TLabel;
    LblCantidadCarpetas: TLabel;
    dbgListaCarpetas: TDBGrid;
    PnlCaja: TPanel;
    PnlEstadoProceso: TPanel;
    LblDevolverCarpeta: TLabel;
    PnlTituloEstado: TPanel;
    stgEstadoProceso: TStringGrid;
    RpnMensajeProceso: TRxPanel;
    bbtOtraCarpeta: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoCajaChange(Sender: TObject);
    procedure EdtCodigoCajaKeyPress(Sender: TObject; var Key: Char);
    procedure spbSalirClick(Sender: TObject);
    procedure spbConsultarCarpetaClick(Sender: TObject);
    procedure stgDatosCarpetaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dbgListaCarpetasDblClick(Sender: TObject);
    procedure bbtOtraCajaClick(Sender: TObject);
    {DECLARACI�N DEL EVENTO DataChange DEL DATASOURCE QUE SE ENCUENTRA EN EL DbGrid}
    procedure dbgListaCarpetasDataSourceDataChange(Sender: TObject;   Field: TField);
    procedure dblEstadoDevolverEnter(Sender: TObject);
    procedure dblEstadoDevolverCloseUp(Sender: TObject);
    procedure bbtEfectuarDevolucionClick(Sender: TObject);
    procedure stgEstadoProcesoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure bbtOtraCarpetaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    DireccIP      : String;
    procedure ConfigurarAmbiente;
    procedure LimpiarControles;
    procedure LimpiarDatosCarpeta;
    procedure LimpiarEstadoProceso;

  end;

var
  FrmDevolucionEstado     : TFrmDevolucionEstado;
  FrmLoginDevolucionEsta  : TFrmLoginDevolucionEsta;
  NombModu                : string;
  ProcDevo                : TProcesoDevolucionEsta;
  ProcLogi                : TProcesoLoginDevo;
  VersModu                : string;

implementation

{$R *.dfm}

{$REGION 'EVENTOS' }



procedure TFrmDevolucionEstado.bbtEfectuarDevolucionClick(Sender: TObject);
begin
  ProcDevo.DatosCarpeta.IdFlujoNuevo    :=
              dblEstadoDevolver.ListSource.DataSet.FieldByName('idflujo').Value;
  ProcDevo.DatosCarpeta.DescTareFlujNuev:=
              dblEstadoDevolver.ListSource.DataSet.FieldByName('descripciontarea').Value;
  if Application.MessageBox(
                  PChar('Est� seguro(a) de devolver la Carpeta ['
                        + ProcDevo.DatosCarpeta.CodigoCarpeta + '] desde el Estado ['
                        + ProcDevo.DatosCarpeta.DescTareCarpeta + '] hasta el Estado ['
                        + ProcDevo.DatosCarpeta.DescTareFlujNuev + '] ?'),
                  'Confirmaci�n Devoluci�n', MB_YESNO OR MB_ICONQUESTION) = IDYES then
  begin
    try
      GrpSeleccionCarpeta.Enabled   := False;
      GrpSeleccionEstado.Enabled    := False;
      bbtOtraCaja.Enabled           := False;
      spbSalir.Enabled              := False;
      bbtEfectuarDevolucion.Visible := False;
      RpnMensajeProceso.Caption     := 'DEVOLVIENDO CARPETA ....';
      RpnMensajeProceso.Font.Color  := clMaroon;
      RpnMensajeProceso.Visible     := True;
      ProcDevo.DevolverEstadoCarpeta(chkEliminaCarpeta.checked);
      RpnMensajeProceso.Caption     := 'DEVOLUCI�N FINALIZADA';
      RpnMensajeProceso.Font.Color  := clBlue;
      Application.ProcessMessages;
      bbtOtraCaja.Enabled           := true;
      bbtOtraCarpeta.Visible        := true;
      spbSalir.Enabled              := True;
    except
      on E:exception do
      begin
        Application.MessageBox(PChar(E.Message),'Devoluci�n de Estado',MB_OK OR MB_ICONERROR);
        bbtOtraCaja.OnClick(Sender);
      end;
    end;
  end;
end;

procedure TFrmDevolucionEstado.bbtOtraCajaClick(Sender: TObject);
begin
  LimpiarControles;
end;

procedure TFrmDevolucionEstado.bbtOtraCarpetaClick(Sender: TObject);
var
  PosiActu  : TBookmark;
begin
  LimpiarEstadoProceso;
  LimpiarDatosCarpeta;
  PosiActu:= dbgListaCarpetas.DataSource.DataSet.GetBookmark;
  spbConsultarCarpetaClick(sender);
  if not dbgListaCarpetas.DataSource.DataSet.BookmarkValid(PosiActu) then
    PosiActu[0]:= dbgListaCarpetas.DataSource.DataSet.RecordCount;
  dbgListaCarpetas.DataSource.DataSet.GotoBookmark(PosiActu);
  dbgListaCarpetas.SetFocus;
end;

{DEFINICI�N DEL EVENTO DataChange DEL DATASOURCE QUE SE ENCUENTRA EN EL DbGrid}
procedure TFrmDevolucionEstado.dbgListaCarpetasDataSourceDataChange(Sender: TObject; Field: TField);
begin
  LimpiarDatosCarpeta;
end;

procedure TFrmDevolucionEstado.dbgListaCarpetasDblClick(Sender: TObject);
begin
  with dbgListaCarpetas.DataSource.DataSet do
    ProcDevo.ObtenerDatosCarpeta(FieldByName('idcarpeta').value,
                                    FieldByName('codigocarpeta').asstring );
  with ProcDevo.DatosCarpeta do
  begin
    with stgDatosCarpeta do
    begin
      Cells[1,0]      := 'M' + CodigoCaja;
      CodiCompCarpeta := 'M' + CodigoCarpeta + ' - '
                          + ifthen(ClaseCarpeta = 'C', 'Creaci�n',
                                    'Inserci�n - ' + IntToStr(SecuenciaClase));
      CodiResuCarpeta := 'M' + CodigoCarpeta
                          + ifthen(ClaseCarpeta = 'C', '','-I-' + IntToStr(SecuenciaClase));
      Cells[1,1]    := CodiCompCarpeta;
      Cells[1,2]    := DescSeriDocumental;
      Cells[1,3]    := DescTareCarpeta;
      Cells[1,4]    := formatfloat('#,##0',CantidadAletas);
      Cells[1,5]    := formatfloat('#,##0',CantidadFolios);
      Cells[1,6]    := formatfloat('#,##0',CantRegiPersonas);
      Cells[1,7]    := formatfloat('#,##0',CantFoliFirmados);
      ProcDevo.ObtenerEstadosDevolver(IdFLujo);
      dblEstadoDevolver.ListSource  := ProcDevo.EstadosDevolver;
      dblEstadoDevolver.ListField   := 'descripciontarea';
      dblEstadoDevolver.KeyField    := 'idflujo';
      dblEstadoDevolver.KeyValue    := 0;
      GrpSeleccionEstado.Enabled    := True;
      dblEstadoDevolver.SetFocus;
    end;
  end;
end;

procedure TFrmDevolucionEstado.dblEstadoDevolverCloseUp(Sender: TObject);
begin
  bbtEfectuarDevolucion.Enabled       := True;
  if dblEstadoDevolver.ListSource.DataSet.FieldByName('descripciontarea').Value = 'RECEPCION' then
  begin
    if (dblEstadoDevolver.ListSource.DataSet.RecordCount = 1)
          and (ProcDevo.DatosCarpeta.CantidadAletas = 0 )then
    begin
      chkEliminaCarpeta.Enabled:= false;
      chkEliminaCarpeta.Checked:= true;
    end
    else
      chkEliminaCarpeta.Enabled:= True;
  end
  else
  begin
    chkEliminaCarpeta.Enabled:= false;
    chkEliminaCarpeta.Checked:= false;
  end;
end;

procedure TFrmDevolucionEstado.dblEstadoDevolverEnter(Sender: TObject);
begin
  dblEstadoDevolver.DropDown;
end;

procedure TFrmDevolucionEstado.EdtCodigoCajaChange(Sender: TObject);
begin
  LblMensajeError.Visible:=False;
  if Length(EdtCodigoCaja.Text) = 4 then
    spbConsultarCarpeta.Enabled:= True
  else
    spbConsultarCarpeta.Enabled:= False;
  if EdtCodigoCaja.Text = ''  then
    bbtOtraCaja.Enabled:=False
  else
    bbtOtraCaja.Enabled:=True;
end;

procedure TFrmDevolucionEstado.EdtCodigoCajaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key <> #8) and ((Key < '0') or (Key > '9')) then
    Key := #0;
end;


procedure TfrmDevolucionEstado.FormCreate(Sender: TObject);
begin
  try
    ConfigurarAmbiente;
  except
    on e:Exception do
    begin
      Application.MessageBox(PChar(e.Message),'Devoluci�n de Estado',MB_OK OR MB_ICONERROR);
      ExitProcess(0);
    end;
  end;
end;

procedure TFrmDevolucionEstado.spbConsultarCarpetaClick(Sender: TObject);
begin
  spbConsultarCarpeta.Enabled:= False;
  ProcDevo.ObtenerCarpetas(EdtCodigoCaja.Text);
  with ProcDevo.Carpetas.DataSet do
  begin
    if (FieldByName('idcaja').IsNull) or (FieldByName('idcarpeta').IsNull) then
    begin
      if FieldByName('idcaja').isnull then
        LblMensajeError.Caption := 'ESTE CODIGO DE CAJA NO EXISTE'
      else
        LblMensajeError.Caption := 'ESTA CAJA NO POSEE CARPETAS ASOCIADAS';
      LblMensajeError.Visible:= True;
      Application.ProcessMessages;
      Sleep(2000);
      LblMensajeError.Visible:= False;
    end
    else
    begin
      dbgListaCarpetas.DataSource := ProcDevo.Carpetas;
      LblCantidadCarpetas.Caption := 'CANTIDAD DE CARPETAS:' + #13#10 + '['
                                    + IntToStr(ProcDevo.Carpetas.DataSet.RecordCount)
                                    + ']';
      LblCantidadCarpetas.Visible := True;
      dbgListaCarpetas.Enabled    := True;
      PnlCaja.Enabled:= False;
      {ASIGNACION DEL EVENTO DataChange DEL DataSource ASIGNADO AL DBGRID}
      dbgListaCarpetas.DataSource.OnDataChange:= dbgListaCarpetasDataSourceDataChange;
    end;

  end;
end;

procedure TFrmDevolucionEstado.spbSalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmDevolucionEstado.stgDatosCarpetaDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with  (Sender as TStringGrid) do
  begin
    if ACol = 0 then
    begin
      Canvas.Font.Color:= clBlack;
      Canvas.Font.Style:= [];
      Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,Cells[ACol,ARow]);
    end
    else
    begin
      Canvas.Font.Color:= clWhite;
      Canvas.Font.Name  := 'Arial';
      Canvas.Font.size := 12;
      Canvas.Font.Style:= [fsbold];
      Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,Cells[ACol,ARow]);
    end
  end;

end;

procedure TFrmDevolucionEstado.stgEstadoProcesoDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with  (Sender as TStringGrid) do
  begin
    if ACol = 0 then
    begin
      Canvas.Brush.Color      := clWhite;
      Rect.Left:= 0;
      Canvas.Font.Color:= clBlack;
      Canvas.Font.Style:= [];
      Canvas.TextRect(Rect, Rect.Left+5, Rect.Top+2,Cells[ACol,ARow]);

    end
    else
    begin
      Canvas.Font.Color:= clBlack;
      Canvas.Font.Name  := 'Arial';
      Canvas.Font.size := 12;
      Canvas.Font.Style:= [fsbold];
      Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,Cells[ACol,ARow]);
    end;

  end;

end;

{$ENDREGION}

{$REGION 'METODOS PROPIOS'}

procedure TfrmDevolucionEstado.ConfigurarAmbiente;
begin

  {SE CREAN OBJETOS DE LA CAPA LOGICA }
  ProcDevo  := TProcesoDevolucionEsta.Create;
  ProcLogi  := TProcesoLoginDevo.Create;
  FrmLoginDevolucionEsta := TFrmLoginDevolucionEsta.Create(nil);
  FrmLoginDevolucionEsta.ShowModal;
  FrmLoginDevolucionEsta.Free;
  NombModu:= 'MODULODEVOLUCIONESTADO';
  VersModu:= '20170505.M01';
  ProcDevo.VerificarVersion(NombModu,VersModu);
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  FrmDevolucionEstado.Caption:= 'Devoluci�n de Estado para Carpetas - [ ' + VersModu + ' ]';
  stbBarraEstado.Panels[0].Text:='Usuario: ' + ProcLogi.DatosUsuarioDevolucionEsta.CodigoUsuarioDevo
                                  + ' - '    + ProcLogi.DatosUsuarioDevolucionEsta.NombreUsuarioDevo;
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
  with stgDatosCarpeta do
  begin
    Cells[0,0]:='C�digo de la Caja';
    Cells[0,1]:='C�digo de la Carpeta';
    Cells[0,2]:='Serie Documental';
    Cells[0,3]:='Estado Actual Carpeta';
    Cells[0,4]:='Cantidad de Aletas';
    Cells[0,5]:='Cantidad de Folios';
    Cells[0,6]:='Cantidad Registros Personas';
    Cells[0,7]:='Cantidad Folios Firmados';
    ColWidths[0]:= 200;
    ColWidths[1]:= 300;
  end;
  with stgEstadoProceso do
  begin
    Cells[0,0]:='* Aletas Eliminadas';
    Cells[0,1]:='* Folios Actualizados';
    Cells[0,2]:='* Folios Eliminados';
    Cells[0,3]:='* Registros de Identificaci�n Eliminados';
    Cells[0,4]:='* Registros de Control Folio Eliminados';
    Cells[0,5]:='* Registros de Imagen Eliminados';
    Cells[0,6]:='* Registros de Novedades Folio Eliminados';
    Cells[0,7]:='* Registros de Planillas Eliminados';
    Cells[0,8]:='* Registros de Observaciones Eliminados';
    Cells[0,9]:='* Registros de Firma Eliminados';
    ColWidths[0]:= Trunc(stgEstadoProceso.Width / 2);
    ColWidths[1]:= stgEstadoProceso.Width - ColWidths[0];
  end;
end;

procedure TFrmDevolucionEstado.LimpiarControles;
begin
  LimpiarEstadoProceso;
  LimpiarDatosCarpeta;
  dbgListaCarpetas.DataSource.DataSet:= nil;
  dbgListaCarpetas.Enabled    := false;
  EdtCodigoCaja.Clear;
  LblCantidadCarpetas.Visible:= False;
  PnlCaja.Enabled:= true;
  EdtCodigoCaja.SetFocus;
end;

procedure TFrmDevolucionEstado.LimpiarDatosCarpeta;
Var
  I: Integer;
begin
  for I := 0 to stgDatosCarpeta.RowCount - 1 do
    stgDatosCarpeta.Cells[1,I]  := '';
  dblEstadoDevolver.ListSource  := nil;
  dblEstadoDevolver.KeyValue    := -1;
  chkEliminaCarpeta.Checked     := False;
  GrpSeleccionEstado.Enabled    := False;
  bbtEfectuarDevolucion.Enabled :=False;
  ProcDevo.VerificarVersion(NombModu,VersModu);
end;

procedure TFrmDevolucionEstado.LimpiarEstadoProceso;
Var
  I: Integer;
begin
  for I := 0 to stgEstadoProceso.RowCount - 1 do
    stgEstadoProceso.Cells[1,I]  := '';
  LblDevolverCarpeta.Caption    := '';
  stgEstadoProceso.Visible      := False;
  bbtEfectuarDevolucion.Visible := true;
  RpnMensajeProceso.Visible     := False;
  GrpSeleccionCarpeta.Enabled   := True;
  bbtOtraCarpeta.Visible        := False;
end;

{$ENDREGION}

end.
