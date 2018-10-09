unit UVisor;

interface

uses
  SysUtils, StrUtils,Forms, RxCtrls, RxSpin,ExtCtrls, ComCtrls, StdCtrls, Mask,
  Controls, Buttons, EnImgScr, EnBlowupForm,OleCtrls,  AcroPDFLib_TLB, Classes,
  UDMConexion, UProcesoVisor,  FPGenerales, RxRichEd, RxSplit, types;

type
  TFrmVisor = class(TForm)
    RpnVisor: TRxPanel;
    LblImagen: TLabel;
    RpnVisorFolio: TRxPanel;
    apdVisorPDF: TAcroPDF;
    RpnInformacionImagen: TRxPanel;
    GrpInformacionImagen: TGroupBox;
    TrvSeleccionImagen: TTreeView;
    RpnMensajeArbol: TRxPanel;
    rxlMensajeArbol: TRxLabel;
    RpnMensajeImagen: TRxPanel;
    rxlMensajeImagen: TRxLabel;
    LblEncabezado: TLabel;
    RpnTitulo: TRxPanel;
    LblTitulo: TLabel;
    imsVisorTif: TImageScrollBox;
    rgrVisor: TRadioGroup;
    RpnEncabezadoVisorTIF: TRxPanel;
    cbxZoomPredefinido: TComboBox;
    LblZoomPredefinido: TLabel;
    LblZoomPorcentaje: TLabel;
    rseZoom: TRxSpinEdit;
    spbLupa: TSpeedButton;
    chkVisuzalizarXml: TCheckBox;
    RpnMensajeXml: TRxPanel;
    rxlMensajeXml: TRxLabel;
    redVisorXml: TRxRichEdit;
    rspDivisor: TRxSplitter;
    LblDivisor: TLabel;
    RpnBaseEncabezado: TRxPanel;
    procedure FormShow(Sender: TObject);
    procedure TrvSeleccionImagenChange(Sender: TObject; Node: TTreeNode);
    procedure rgrVisorClick(Sender: TObject);
    procedure rseZoomChange(Sender: TObject);
    procedure spbLupaClick(Sender: TObject);
    procedure cbxZoomPredefinidoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkVisuzalizarXmlClick(Sender: TObject);

    procedure FormResize(Sender: TObject);
    procedure rspDivisorPosChanged(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    TituloPrn     : string;
    TituloUno     : string;
    TituloDos     : string;
    procedure EstablecerAreaMinimaXML;
    procedure OcultarXml;
    procedure UbicarMensajeErrorXml;
    procedure VisualizarXml;

  end;

var
  EstaForm      : TWindowState;
  frmLupa       : TBlowupForm;

implementation
uses
  UCarpetaDigital;

{$R *.dfm}
{$REGION 'PROCEDIMIENTOS DE EVENTO'}

procedure TFrmVisor.cbxZoomPredefinidoSelect(Sender: TObject);
begin
    rseZoom.Value:=Trunc(ZoomInstruccion(imsVisorTIF, cbxZoomPredefinido.ItemIndex));
end;

procedure TFrmVisor.chkVisuzalizarXmlClick(Sender: TObject);
begin
  redVisorXml.Clear;
  if chkVisuzalizarXml.Checked then
  begin
    VisualizarXml;
  end
  else
  begin
    OcultarXML;
  end;
end;

procedure TFrmVisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProcViso.BorrarCarpetaLocal(ExtractFileDir(Application.ExeName) + '\UNIANDES\');
end;


procedure TFrmVisor.FormResize(Sender: TObject);
begin
  EstablecerAreaMinimaXML;
  UbicarMensajeErrorXml;
end;

procedure TFrmVisor.FormShow(Sender: TObject);
var
  PerfUsua : string;
begin
  ProcViso.CrearCarpetaLocal(ExtractFileDir(Application.ExeName) + '\UNIANDES\');
  LblTitulo.Caption     := TituloPrn;
  LblEncabezado.Caption := TituloUno;
  if TituloDos <> '' then
    LblEncabezado.Caption:= LblEncabezado.Caption + #13#10 + TituloDos;
  PerfUsua := ProcLogi.DatosUsuarioCarpeta.DescripcionPerfilCarpeta;
  if (PerfUsua = 'MTIOPERADOR') or (PerfUsua = 'MTISUPERVISOR') then
    rgrVisor.Visible:=True
  else
    rgrVisor.Visible:=False;
  rgrVisor.ItemIndex := 1;
  {SE ESTABLECE EL AREA MINIMA PARA MOSTRAR EL ARCHIVO XML EN IMAGENES TIF.
    SE CALCULA CON BASE EN EL ALTO DEL MENSAJE DE ERROR QUE SE MUESTRA EN ESTA ZONA}
  rspDivisor.BottomRightLimit   := RpnMensajeXml.Height + 30;
  redVisorXml.Height:= rspDivisor.BottomRightLimit - LblDivisor.Height;

end;

procedure TFrmVisor.rgrVisorClick(Sender: TObject);
begin
  if rgrVisor.ItemIndex = 0 then
  begin
    apdVisorPDF.Visible           := False;
    imsVisorTif.Visible           := True;
    RpnEncabezadoVisorTIF.Visible := True;
    cbxZoomPredefinido.ItemIndex:= cbxZoomPredefinido.Items.IndexOf('Ajustar al Ancho');
    rseZoom.Value:= 1;
    if TrvSeleccionImagen.Selected = nil then
      RpnEncabezadoVisorTIF.Enabled:= False;
  end
  else
  begin
    apdVisorPDF.Visible           := True;
    imsVisorTif.Visible           := False;
    rspDivisor.Visible            := False;
    LblDivisor.Visible            := False;
    redVisorXml.Visible           := False;
    RpnEncabezadoVisorTIF.Visible := False;
    if spbLupa.Caption = 'Remover L&upa' then
      spbLupaClick(spbLupa);
  end;
  if TrvSeleccionImagen.Selected <> nil then
    TrvSeleccionImagenChange(TrvSeleccionImagen, TrvSeleccionImagen.Selected);
end;


procedure TFrmVisor.rseZoomChange(Sender: TObject);
begin
  if rseZoom.Value > 100 then
    rseZoom.Value:= 100;
  ZoomPorcentaje(imsVisorTif,rseZoom.Value);
end;

procedure TFrmVisor.rspDivisorPosChanged(Sender: TObject);
begin
  UbicarMensajeErrorXml;
end;

procedure TFrmVisor.spbLupaClick(Sender: TObject);
begin
  if spbLupa.Caption = 'Activar L&upa' then
  begin
    ZoomEmergente(frmLupa,imsVisorTif,'Función de Aumento (Lupa)', FrmVisor,300,300,true);
    spbLupa.Caption:= 'Remover L&upa'
  end
  else
  begin
    ZoomEmergente(frmLupa,imsVisorTif,'Función de Aumento (Lupa)',FrmVisor, 300,300,false);
    spbLupa.Caption:= 'Activar L&upa';
  end;

end;


procedure TFrmVisor.TrvSeleccionImagenChange(Sender: TObject; Node: TTreeNode);
var
  MensErro  : string;
begin
  if rgrVisor.Items[rgrVisor.ItemIndex] = 'PDF' then
  begin
    apdVisorPDF.LoadFile('x');
    apdVisorPDF.Refresh;
  end
  else
  begin
    imsVisorTif.Clear;
  end;
  RpnMensajeImagen.Visible:= false;
  RpnMensajeXml.Visible   := false;
  redVisorXml.Clear;
  with ProcCarp do
  begin
    MensErro:= '';
    DatosArbolSelector.RecNo:= Node.AbsoluteIndex + 1;
    if DatosArbolSelector.FieldByName('NOMBREIMAGEN').asstring  <> '' then
    begin
      MensErro:= ProcViso.VerificarDescargarImagen
                                    (DatosArbolSelector.FieldByName('NOMBREIMAGEN').Value,
                                     DatosArbolSelector.FieldByName('RUTAFTP').Value,
                                     rgrVisor.Items[rgrVisor.ItemIndex],
                                     DMConexion.TipoConeFtp);

      LblImagen.Caption := 'Archivo de Imagen' + #13#10 + '[ '
                            + ifthen(rgrVisor.Items[rgrVisor.ItemIndex] = 'PDF',
                                      ProcViso.DatosFolio.NombreImagenFirm,
                                      ProcViso.DatosFolio.NombreImagenOrig)
                            + ' ]';

      if MensErro = '' then
      begin
        if rgrVisor.Items[rgrVisor.ItemIndex] = 'PDF' then
        begin
          apdVisorPDF.LoadFile(ProcViso.DatosFolio.ImagenLocal);
          apdVisorPDF.setShowToolbar(false);
        end
        else
        begin
          if not RpnEncabezadoVisorTIF.Enabled then
            RpnEncabezadoVisorTIF.Enabled:=True;
          imsVisorTif.FileName:= ProcViso.DatosFolio.ImagenLocal;
          cbxZoomPredefinido.ItemIndex:= cbxZoomPredefinido.Items.IndexOf('Ajustar al Ancho');
          rseZoom.Value:= Trunc(ZoomInstruccion(imsVisorTIF, cbxZoomPredefinido.ItemIndex));
          chkVisuzalizarXml.Enabled:= True;
          if chkVisuzalizarXml.Checked then
            VisualizarXml;
        end;
        TrvSeleccionImagen.SetFocus;
      end
    end
    else
    begin
      LblImagen.Caption := '';
      if DatosArbolSelector.FieldByName('TIPONODO').asstring  = 'F' then
        MensErro:= 'El Folio ' + #10#13 + '[ '
                    + DatosArbolSelector.FieldByName('NODO').asstring + ' ]' + #10#13
                    + #10#13 + '* No tiene asociada ninguna Imagen.';
    end;
    if MensErro <> '' then
    begin
      RpnMensajeImagen.Visible:= True;
      rxlMensajeImagen.Caption:= MensErro;
      if (rgrVisor.Items[rgrVisor.ItemIndex] <> 'PDF') then
      begin
        RpnEncabezadoVisorTIF.Enabled:= False;
        chkVisuzalizarXml.Enabled:= False;
        if chkVisuzalizarXml.Checked then
          OcultarXml;
      end;
    end;
  end;
end;

{$ENDREGION}

{$REGION 'METODOS PROPIOS'}

procedure TFrmVisor.EstablecerAreaMinimaXML;
begin
  rspDivisor.TopLeftLimit := RpnEncabezadoVisorTIF.Height
                              + Trunc((RpnVisorFolio.Height - RpnEncabezadoVisorTIF.Height) / 5);
  if rspDivisor.Top < rspDivisor.TopLeftLimit then
    redVisorXml.Height:= RpnVisorFolio.Height - RpnEncabezadoVisorTIF.Height
                          - rspDivisor.TopLeftLimit - rspDivisor.Height
                          - LblDivisor.Height;
end;

procedure TFrmVisor.OcultarXml;
begin
  RpnMensajeXml.Visible := False;
  rspDivisor.Visible    := False;
  redVisorXml.Visible   := false;
  LblDivisor.Visible    := False;

end;

procedure TFrmVisor.UbicarMensajeErrorXML;
begin
  {CENTRA EL MENSAJE DE ERROR DENTRO DEL VISOR DE XML}
  RpnMensajeXml.Top := Trunc(redVisorXml.Top + (redVisorXml.Height - RpnMensajeXml.Height) / 2);
end;

procedure TFrmVisor.VisualizarXml;
var
  MensErro  : string;
  ListXmll  : TStringList;
begin
  if not redVisorXml.Visible then
  begin
    EstablecerAreaMinimaXML;
    redVisorXml.Visible := True;
    LblDivisor.Visible  := True;
    rspDivisor.Visible  := True;
  end;
  with ProcCarp do
  begin
    MensErro:= ProcViso.VerificarDescargarXml
                            (DatosArbolSelector.FieldByName('NOMBREIMAGEN').Value,
                             DatosArbolSelector.FieldByName('RUTAFTP').Value,
                             DMConexion.TipoConeFtp);
    LblDivisor.Caption:=  'Archivo XML : [ ' + ProcViso.DatosFolio.NombreXmlOrig + ' ]';
    if MensErro = '' then
    begin
      ListXmll := TStringList.Create;
      ListXmll.LoadFromFile(ProcViso.DatosFolio.XmlLocal);
      redVisorXml.Text:= ListXmll.Text;
    end
    else
    begin
      if RpnMensajeImagen.Visible = False then
      begin
        UbicarMensajeErrorXml;
        RpnMensajeXml.BringToFront;
        RpnMensajeXml.Visible:= True;
        rxlMensajeXml.Caption:= MensErro;
      end;
    end;
  end;
end;

{$ENDREGION}

end.
