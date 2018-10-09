unit URecepcion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, ShellAPI,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, IdIPWatch,
  RxLookup, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  UDMRecepcion,  UDMAplicacion, UDMConexion, UHerramientas;

type
  TFrm_Recepcion = class(TForm)
    pnlEncabezado: TPanel;
    stbInformacion: TStatusBar;
    grp1: TGroupBox;
    grpDerecho: TGroupBox;
    rlbSerieDocumental: TRxDBLookupCombo;
    lbl1: TLabel;
    edPrecinto1: TEdit;
    edPrecinto2: TEdit;
    lblPrecinto1: TLabel;
    lblPrecinto2: TLabel;
    grpDatosCarpeta: TGroupBox;
    rgpGrFoliacion: TRadioGroup;
    rgpTipoCarpeta: TRadioGroup;
    rgpGrContratoCivil: TRadioGroup;
    grp3: TGroupBox;
    DBGCarpeta: TDBGrid;
    chkDoblePrecinto: TCheckBox;
    lblCofirmarPrecinto: TLabel;
    grp4: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    edCaja: TEdit;
    edCarpeta: TEdit;
    edTotalCaja: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    btnCarpeta: TSpeedButton;
    grpPrecinto: TGroupBox;
    grpRadicadas: TGroupBox;
    grpCarpetasRadicadas: TGroupBox;
    DBGCarpetasRadicadas: TDBGrid;
    btnGuardarCarpeta: TButton;
    btnCerrarCaja: TButton;
    btnReimpresion: TButton;
    procedure FormShow(Sender: TObject);
    procedure edPrecinto1KeyPress(Sender: TObject; var Key: Char);
    procedure edPrecinto2KeyPress(Sender: TObject; var Key: Char);
    procedure btnCarpetaClick(Sender: TObject);
    procedure rlbSerieDocumentalClick(Sender: TObject);
    procedure rgpTipoCarpetaClick(Sender: TObject);
    procedure rgpGrFoliacionClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGCarpetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGuardarCarpetaClick(Sender: TObject);
    procedure btnCerrarCajaClick(Sender: TObject);
    procedure edPrecinto1Change(Sender: TObject);
    procedure DBGCarpetaKeyPress(Sender: TObject; var Key: Char);
    procedure edPrecinto2Change(Sender: TObject);
    procedure btnReimpresionClick(Sender: TObject);
  private
    { Private declarations }
     IngresoUno, IngresoDos : string;
     StickerCaja : string;
  public
    { Public declarations }
    procedure ActivarGrupos;
    function CompararPrecinto (Precinto : string) : boolean;
    procedure ConfigurarAmbiente;
    procedure CerrarCaja;
    Procedure VerificarVersion(p_NombModu: string;p_VersModu: string);
  end;

var
  DireccIP      : String;
  Frm_Recepcion : TFrm_Recepcion;
  NombModu      : string;
  VersModu      : string;

implementation

{$R *.dfm}

procedure TFrm_Recepcion.ActivarGrupos;  //Activa el grupo ContratoObraCivl para el caso de historias laborales
begin
  if rlbSerieDocumental.LookupSource.DataSet.FieldByName('descripciontiposeriedocumental').Value = 'HISTORIAS LABORALES' then
    rgpGrContratoCivil.Enabled := True
  else
  begin
     rgpGrContratoCivil.Enabled := False;
     rgpTipoCarpeta.Enabled := False;
     rgpGrContratoCivil.ItemIndex := -1;
     rgpTipoCarpeta.ItemIndex := -1;
  end;
end;

procedure TFrm_Recepcion.btnCarpetaClick(Sender: TObject);
var
  Foliada : boolean;
begin
  if Application.MessageBox('�Desea crear la Carpeta ...? ', 'Guardar Carpeta', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      case  rgpGrFoliacion.ItemIndex of
                     0 : Foliada := True;
                     1 : Foliada := False;
      end;
      DMRecepcion.InsertarCarpeta(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger, rlbSerieDocumental.KeyValue, Foliada,edCaja.Text);
      DMRecepcion.ImprimirStickerCarpeta(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
      edCarpeta.Text := DMRecepcion.cdsCarpeta.FieldByName('CodigoCarpeta').AsString;
      ActivarGrupos;
      edPrecinto1.Enabled := False;
      btnGuardarCarpeta.Enabled := True;
      rgpGrFoliacion.Enabled := True;
      btnCarpeta.Visible := False;
      btnCerrarCaja.Enabled := True;
      rgpGrFoliacion.Enabled := True;
  end;
end;

procedure TFrm_Recepcion.btnCerrarCajaClick(Sender: TObject);
begin
  if btnGuardarCarpeta.Enabled = True then
    begin
      if Application.MessageBox('Hay una carpeta sin cerrar. �Desea Guardar la Caja ...? ', 'Guardar Caja', MB_YESNO + MB_ICONQUESTION) = IDYES then
        begin
          DMRecepcion.Totales(edCaja.Text);
          DMRecepcion.ImprimirActaRelevo;
          CerrarCaja;
      end;
  end else
      begin
        DMRecepcion.Totales(edCaja.Text);
        DMRecepcion.ImprimirActaRelevo;
        CerrarCaja;
      end;
end;

procedure TFrm_Recepcion.btnGuardarCarpetaClick(Sender: TObject);
var
  ContratoCivil : boolean;
begin
  DBGCarpeta.Columns.Grid.Fields[0].ReadOnly := False;
  case rgpGrContratoCivil.ItemIndex of
               0 : ContratoCivil := True;
               1 : ContratoCivil := False;
  else
    if rlbSerieDocumental.LookupSource.DataSet.FieldByName('descripciontiposeriedocumental').Value = 'HISTORIAS LABORALES' then
    begin
      ShowMessage('Debe marcar si esta carpeta posee Contrato de Obra Civil ...');
      Exit;
    end
    else
      ContratoCivil := False;
  end;
  DBGCarpeta.DataSource.DataSet.First;
  repeat
    {if DMRecepcion.cdsSubSerie.FieldByName('Cantidad').AsInteger = 0 then
      begin
        ShowMessage('No se aceptan campos vac�os ...');
        Exit;
    end;  }
    if DMRecepcion.cdsSubSerie.FieldByName('Cantidad').AsInteger > 9999 then
      begin
        ShowMessage('Existe una cantidad demasiado grande ...');
        Exit;
    end;
    DBGCarpeta.DataSource.DataSet.Next;
  until DBGCarpeta.DataSource.DataSet.Eof;
  DBGCarpeta.DataSource.DataSet.First;
  repeat
    DMRecepcion.InsertarCarpetaAleta(DMRecepcion.cdsCarpeta.FieldByName('idCarpeta').AsInteger, DMRecepcion.cdsSubSerie.FieldByName('idSerieSubSerie').AsInteger, DMRecepcion.cdsSubSerie.FieldByName('Cantidad').AsInteger, edCarpeta.Text);
    DBGCarpeta.DataSource.DataSet.Next;
  until DBGCarpeta.DataSource.DataSet.Eof;
  ShowMessage('Operaci�n Termianada con �xito ...');
  DMRecepcion.ActualizarCarpeta(DMRecepcion.cdsCarpeta.FieldByName('idCarpeta').AsInteger, ContratoCivil);
  btnGuardarCarpeta.Enabled := False;
  edCarpeta.Text := '';
  btnCarpeta.Visible := True;
  rgpGrFoliacion.ItemIndex := -1;
  rgpTipoCarpeta.ItemIndex := -1;
  rgpGrContratoCivil.ItemIndex := -1;
  rgpGrFoliacion.Enabled := False;
  DMRecepcion.CarpetasRadicadas(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
  DMRecepcion.FoliosCaja(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
  edTotalCaja.Text := IntToStr(DMRecepcion.cdsCantidadFolios.FieldByName('TotalFolios').AsInteger );
  DMRecepcion.SubSerieDocumental(0,0);
  DBGCarpeta.Enabled:=False;
end;

procedure TFrm_Recepcion.btnReimpresionClick(Sender: TObject);
begin
   DMRecepcion.Totales(edCaja.Text);
   DMRecepcion.ImprimirActaRelevo;
  //ShellExecute(Handle, 'open',  PChar(ExtractFilePath(Application.ExeName) + 'Recepcion\Recepcion.exe'), PChar('"'+DMConexion.LoginUser +'" "'+'"Recepci�n"'), nil, SW_SHOW);
end;

procedure TFrm_Recepcion.CerrarCaja;
begin
  DMRecepcion.CerrarCaja(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
  ShowMessage('Operaci�n realizada con �xito ...');
  btnCerrarCaja.Enabled := False;
  DMRecepcion.CarpetasRadicadas(-1);
  edPrecinto1.Text := '';
  edPrecinto2.Text := '';
  edCaja.Text := '';
  edTotalCaja.Text := '';
  btnCarpeta.Visible := False;
  edPrecinto1.Enabled := True;
  edPrecinto1.SetFocus;
  DMRecepcion.CarpetasRadicadas(-1);
end;

function TFrm_Recepcion.CompararPrecinto(Precinto: string): boolean; //Verifica el ingreso correcto del precinto con doble captura
begin
  Result := False;
  if (IngresoUno = '') AND (IngresoDos = '') then
    begin
      IngresoUno := Precinto;
      lblCofirmarPrecinto.Visible := True;
  end else
     begin
       if (IngresoUno <> '') AND (IngresoDos = '') then
         begin
           IngresoDos := Precinto;
           //edPrecinto1.Enabled := False;
       end;
       if (IngresoUno <> '') AND (IngresoDos <> '') then
         if IngresoUno = IngresoDos then
           begin
             Result := True;
             lblCofirmarPrecinto.Visible := False;
             edPrecinto1.Enabled := False;
             IngresoUno := '';
             IngresoDos := '';
         end else
            begin
              ShowMessage('No coincide la captura del precinto ...');
              edPrecinto1.Text := '';
              IngresoUno := '';
              IngresoDos := '';
            end;
     end;
end;

procedure TFrm_Recepcion.DBGCarpetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DBGCarpeta.DataSource.DataSet.Eof then
    DBGCarpeta.DataSource.DataSet.Prior
  else
    DBGCarpeta.ReadOnly := False;
  DBGCarpeta.Columns.Grid.Fields[0].ReadOnly := True;
  rgpTipoCarpeta.Enabled := False;
end;

procedure TFrm_Recepcion.DBGCarpetaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      if DBGCarpeta.DataSource.DataSet.FieldByName('idSerieSubSerie').AsInteger = 0 then
        DBGCarpeta.DataSource.DataSet.Prior;
  end;
end;

procedure TFrm_Recepcion.edPrecinto1Change(Sender: TObject);
begin
  if Length (edPrecinto1.Text) > 7 then
    edPrecinto1.ReadOnly := True
  else
    edPrecinto1.ReadOnly := False;
end;

procedure TFrm_Recepcion.edPrecinto1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      if edPrecinto1.Text <> '' then
        begin
          if DMRecepcion.BuscarCaja(2,edPrecinto1.Text) = -1 then //Busca si ya existe este precinto
            begin
              if NOT CompararPrecinto(edPrecinto1.Text) then //Compara los dos ingresos de data
                begin
                  edPrecinto1.Text := '';
              end else
                 begin
                   edPrecinto1.Enabled := False;
                   if chkDoblePrecinto.Checked = true then
                     begin
                       edPrecinto2.Enabled := True;
                       edPrecinto2.SetFocus;
                   end else
                      begin
                        StickerCaja := DMRecepcion.InsertarCaja(edPrecinto1.Text,edPrecinto2.Text);
                        DMRecepcion.ImprimirStickerCaja (edPrecinto1.Text);
                        DMRecepcion.BuscarCaja(2,edPrecinto1.Text);
                        edCaja.Text := StickerCaja;
                        btnCarpeta.Visible := True;
                        chkDoblePrecinto.Enabled := False;
                      end;
                 end;
          end else
             begin
               if NOT DMRecepcion.cdsCaja.FieldByName('Cerrada').AsBoolean then
                 begin
                   edCaja.Text := DMRecepcion.cdsCaja.FieldByName('CodigoCaja').AsString;
                   edPrecinto1.Text :=  DMRecepcion.cdsCaja.FieldByName('PrecintoUno').AsString;
                   edPrecinto2.Text :=  DMRecepcion.cdsCaja.FieldByName('PrecintoDos').AsString;
                   edPrecinto1.Enabled := False;
                   DMRecepcion.BuscarCarpeta(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger, 1);
                   edCarpeta.Text := DMRecepcion.cdsCarpeta.FieldByName('CodigoCarpeta').AsString;
                   DMRecepcion.CarpetasRadicadas(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
                   lblCofirmarPrecinto.Visible := False;
                   if edCarpeta.Text = '' then
                     btnCarpeta.Visible := True
                   else
                     begin
                       btnCarpeta.Visible := False;
                       rgpGrFoliacion.Enabled := True;
                     end;
                   DMRecepcion.FoliosCaja(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
                   edTotalCaja.Text := IntToStr(DMRecepcion.cdsCantidadFolios.FieldByName('TotalFolios').AsInteger );
               end else
                  begin
                    ShowMessage('Esta caja ya se encuentra Cerrada ...');
                    edCaja.Text := DMRecepcion.cdsCaja.FieldByName('CodigoCaja').AsString;
                    edPrecinto1.Text :=  DMRecepcion.cdsCaja.FieldByName('PrecintoUno').AsString;
                    edPrecinto2.Text :=  DMRecepcion.cdsCaja.FieldByName('PrecintoDos').AsString;
                    edPrecinto1.Enabled := False;
                    DMRecepcion.BuscarCarpeta(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger, 2);
                    edCarpeta.Text := DMRecepcion.cdsCarpeta.FieldByName('CodigoCarpeta').AsString;
                    DMRecepcion.CarpetasRadicadas(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
                    lblCofirmarPrecinto.Visible := False;
                    btnCarpeta.Visible := False;
                    btnCarpeta.Visible := False;
                    rgpGrFoliacion.Enabled := False;
                    DMRecepcion.FoliosCaja(DMRecepcion.cdsCaja.FieldByName('idCaja').AsInteger);
                    edTotalCaja.Text := IntToStr(DMRecepcion.cdsCantidadFolios.FieldByName('TotalFolios').AsInteger );
                  end;
             end;
      end else
         ShowMessage('Debe ingresar el n�mero del precinto ...');
  end else
     Key := SoloNumeros(Key); //Limitar Caracteres
end;

procedure TFrm_Recepcion.edPrecinto2Change(Sender: TObject);
begin
  if Length (edPrecinto2.Text) > 7 then
    edPrecinto2.ReadOnly := True
  else
    edPrecinto2.ReadOnly := False;
end;

procedure TFrm_Recepcion.edPrecinto2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      if edPrecinto1.Text <> edPrecinto2.Text then
        begin
          if NOT CompararPrecinto(edPrecinto2.Text) then
              edPrecinto2.Text := ''
          else
             begin
               StickerCaja := DMRecepcion.InsertarCaja(edPrecinto1.Text,edPrecinto2.Text);
               DMRecepcion.ImprimirStickerCaja (edPrecinto1.Text);
                DMRecepcion.BuscarCaja(2,edPrecinto1.Text);
               edCaja.Text := StickerCaja;
               edPrecinto2.Enabled := False;
               btnCarpeta.Visible := True;
               chkDoblePrecinto.Enabled := False;
             end;
      end else
         begin
           ShowMessage('Debe ingresar precintos diferentes ...');
           edPrecinto2.Text := '';
         end;
  end else
     Key := SoloNumeros(Key); {Limitar Caracteres}
end;

procedure TFrm_Recepcion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      DMRecepcion.ImprimirStickerCarpetaAleta(DBGCarpeta.DataSource.DataSet.FieldByName('idSerieSubSerie').AsInteger, edCarpeta.Text);
      Key := VK_DOWN;
  end;
  if Key = VK_BACK then
    edPrecinto1.ReadOnly := False;
  if Key = VK_HOME then
    btnCerrarCaja.Enabled := True;
  if Key = VK_END then
    btnReimpresion.Enabled := True;

end;

procedure TFrm_Recepcion.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
end;

procedure TFrm_Recepcion.rgpGrFoliacionClick(Sender: TObject);
begin
  if (rgpGrFoliacion.ItemIndex <> -1)
      AND (rlbSerieDocumental.LookupSource.DataSet.FieldByName('descripciontiposeriedocumental').Value = 'HISTORIAS LABORALES') then
    begin
     rgpTipoCarpeta.Enabled := True;
     DBGCarpeta.Enabled := False;
  end else
     begin
       rgpTipoCarpeta.Enabled := False;
       rgpTipoCarpeta.ItemIndex := 2;
       DMRecepcion.SubSerieDocumental(3, rlbSerieDocumental.KeyValue);
     end;

  if (edPrecinto1.Text <> '') AND (edPrecinto1.Enabled = False) AND (edCarpeta.Text <> '')then
    btnGuardarCarpeta.Enabled := True;
  rgpGrFoliacion.Enabled := False;
end;

procedure TFrm_Recepcion.rgpTipoCarpetaClick(Sender: TObject); //Determina el n�mero de carpetas y las presenta en la grilla
begin
  case rgpTipoCarpeta.ItemIndex of
             0 : DMRecepcion.SubSerieDocumental(1, rlbSerieDocumental.KeyValue);
             1 : DMRecepcion.SubSerieDocumental(2, rlbSerieDocumental.KeyValue);
             2 : DMRecepcion.SubSerieDocumental(3, rlbSerieDocumental.KeyValue);
  end;
  if DMRecepcion.cdsSubSerie.RecordCount > 0 then
    DBGCarpeta.Enabled := True
  else
    DBGCarpeta.Enabled := False;
end;

procedure TFrm_Recepcion.ConfigurarAmbiente;
begin
  {SE CREA EL OBJETO DE LA CAPA LOGICA }
  NombModu:= 'MODULORECEPCION';
  VersModu:= '20160829.M01';

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  VerificarVersion(NombModu,VersModu);
  Frm_Recepcion.Caption:= 'Recepci�n - [ Versi�n ' + VersModu + ' ]';
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  stbInformacion.Panels[0].Text :='Usuario: ' + ParamStr(1);
  stbInformacion.Panels[1].Text :='IP: ' + DireccIP;
  stbInformacion.Panels[2].Text :='Ambiente: ' + DMConexion.Ambiente;
  DMRecepcion.SerieDocumental;
  IngresoUno := '';
  IngresoDos := '';
end;


Procedure TFrm_Recepcion.VerificarVersion(p_NombModu: string;p_VersModu: string);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'RECEPCI�N');
end;

procedure TFrm_Recepcion.rlbSerieDocumentalClick(Sender: TObject);
begin
  grpPrecinto.Enabled := True;
  ActivarGrupos;
  chkDoblePrecinto.Enabled := True;
  edPrecinto1.Enabled := True;
  edPrecinto1.SetFocus;
end;

end.