unit UCorreccionFolios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Data.DB, Vcl.DBGrids, IdIPWatch,
  UGlobales, DAOCorreccionFolios, Vcl.ComCtrls, UDMConexion;

type
  TFCorreccionFolios = class(TForm)
    PnlDetalle: TPanel;
    DBGCarpetaFolios: TDBGrid;
    btnGuardarCarpeta: TButton;
    EdtFolios: TEdit;
    lbl2: TLabel;
    PnlCodigoCarpeta: TPanel;
    EdtCodigoCarpeta: TEdit;
    Lbllbl1: TLabel;
    btnCancelar: TButton;
    stbBarraEstado: TStatusBar;
    PnlTitulo: TPanel;
    procedure EdtCodigoCarpetaKeyPress(Sender: TObject; var Key: Char);
    procedure btnGuardarCarpetaClick(Sender: TObject);
    procedure LimpiarFormulario;
    procedure EdtFoliosKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure EdtCodigoCarpetaChange(Sender: TObject);
    procedure EdtFoliosExit(Sender: TObject);
    procedure DBGCarpetaFoliosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    DireccIP  : String;
    procedure ConfigurarAmbiente;
    Procedure VerificarVersion(p_NombModu: string; p_VersModu: string; p_VeriRuta: Boolean);
  end;

var
  FCorreccionFolios: TFCorreccionFolios;
  DAOCorreccionFolios: TDAOCorreccionFolios;
  NombModu  : string;
  VersModu  : string;

implementation

{$R *.dfm}

uses UDMAplicacion;

{$REGION 'EVENTOS'}

procedure TFCorreccionFolios.btnCancelarClick(Sender: TObject);
begin
  LimpiarFormulario;
end;

procedure TFCorreccionFolios.btnGuardarCarpetaClick(Sender: TObject);
var
  TotalFolios : Word;
  UltimoSitio : TBookmark;
begin
  TotalFolios:= 0;
  with DAOCorreccionFolios do
  begin
    UltimoSitio:= cdsCarpeta.GetBookmark;
    cdsCarpeta.DisableControls;
    cdsCarpeta.First;
    { SE REEMPLAZA EL SEGMENTO PARA QUE VERIFIQUE QUE EL TOTAL DE FOLIOS SEA > 0 (GUSTAVO VEGA ROZO)
    if StrToInt (EdtFolios.Text) > 0 then
      begin
        repeat
          DMCorreccionFolios.ActualizarFolios(StrToInt(EdtFolios.Text), DMCorreccionFolios.cdsCarpeta.FieldByName('idCarpetaAleta').AsInteger, edCodigoCarpeta.Text);
          DMCorreccionFolios.cdsCarpeta.Next;
        until DMCorreccionFolios.cdsCarpeta.Eof;
        LimpliarFormulario;
        DMCorreccionFolios.BuscarCarpeta(edCodigoCarpeta.Text);
        ShowMessage('Operaci�n terminada con �xito ...');
    end else
       begin
         ShowMessage ('No se puede ingresar valores menores a 1 ...');
         EdtFolios.Text := '';
       end;
    }

    repeat
      TotalFolios:=TotalFolios + cdsCarpeta.FieldByName('CantidadFolios').AsInteger;
      cdsCarpeta.Next;
    until cdsCarpeta.Eof;
    if TotalFolios > 0  then
    begin
      cdsCarpeta.First;
      repeat
        ActualizarFolios(cdsCarpeta.FieldByName('CantidadFolios').AsInteger,
                         cdsCarpeta.FieldByName('idCarpetaAleta').AsInteger, edtCodigoCarpeta.Text);
        cdsCarpeta.Next;
      until cdsCarpeta.Eof;
      ShowMessage('Operaci�n terminada con �xito ...');
      cdsCarpeta.EnableControls;
      LimpiarFormulario;
    end
    else
    begin
      cdsCarpeta.GotoBookmark(UltimoSitio);
      cdsCarpeta.EnableControls;
      ShowMessage ('No se permiten carpetas sin Folios. Al menos una Aleta debe tener Folios ...');
      EdtFolios.Text := '';
      DBGCarpetaFolios.SetFocus;
    end;

  end;
end;

procedure TFCorreccionFolios.DBGCarpetaFoliosCellClick(Column: TColumn);
begin
    EdtFolios.Text := IntToStr(DAOCorreccionFolios.cdsCarpeta.FieldByName('CantidadFolios').AsInteger);
    EdtFolios.Enabled:= True;
    EdtFolios.SetFocus;
end;

procedure TFCorreccionFolios.EdtCodigoCarpetaChange(Sender: TObject);
begin
  if EdtCodigoCarpeta.Text = '' then
    btnCancelar.Enabled := False
  else
    btnCancelar.Enabled := True;
end;

procedure TFCorreccionFolios.EdtCodigoCarpetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    if DAOCorreccionFolios.BuscarCarpeta(edtCodigoCarpeta.Text) then
    begin
        btnGuardarCarpeta.Enabled := True;
        DBGCarpetaFolios.Enabled  := True;
        DBGCarpetaFolios.SetFocus;
        PnlCodigoCarpeta.Enabled:= False;
    end else
        begin
          ShowMessage('No se encontr� la carpeta '+ edtCodigoCarpeta.Text
                      +' o tiene un estado diferente a RECEPCI�N '
                      +' o no tiene aletas registradas ...');
          btnGuardarCarpeta.Enabled := False;
        end;
end;

procedure TFCorreccionFolios.EdtFoliosExit(Sender: TObject);
begin
  {SE CAMBIA LA SIGUIENTE LINEA PARA QUE ACEPTE VALORES >= 0 (GUSTAVO VEGA ROZO)
  if StrToInt (EdtFolios.Text) <= 0 then
  }
  if (EdtFolios.Text = '') or (StrToInt (EdtFolios.Text) < 0)   then
  begin
    ShowMessage ('Cantidad incorrecta de Folios. Se aceptan valores mayores e iguales a cero ...');
    EdtFolios.Text:=DAOCorreccionFolios.cdsCarpeta.FieldByName('CantidadFolios').Value;
    EdtFolios.SetFocus;
  end
  else
  begin
    DAOCorreccionFolios.cdsCarpeta.Edit;
    DAOCorreccionFolios.cdsCarpeta.FieldByName('CantidadFolios').Value := StrToInt (EdtFolios.Text);
    EdtFolios.Enabled:=False;
    EdtFolios.Text := '';
  end;

end;

procedure TFCorreccionFolios.EdtFoliosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     btnGuardarCarpeta.SetFocus
  else
    if  not (key in ['0'..'9',#8]) then
      Key := #0;

end;

procedure TFCorreccionFolios.LimpiarFormulario;
begin
  if not DAOCorreccionFolios.cdsCarpeta.IsEmpty then
  begin
    DAOCorreccionFolios.cdsCarpeta.EmptyDataSet;
    DAOCorreccionFolios.cdsCarpeta.Close;
  end;
  btnGuardarCarpeta.Enabled := False;
  DBGCarpetaFolios.Enabled  := False;
  edtCodigoCarpeta.Text     := '';
  EdtFolios.Text            := '';
  PnlCodigoCarpeta.Enabled  := True;
  edtCodigoCarpeta.SetFocus;
end;

{$ENDREGION}

{$REGION 'METODOS PROPIOS'}

procedure TFCorreccionFolios.ConfigurarAmbiente;
begin
  NombModu:= 'MODULOCORRECCIONFOLIOS';
  VersModu:= '20170706.M01';

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  VerificarVersion(NombModu, VersModu, VeriRuta);
  FCorreccionFolios.Caption:= 'Correcci�n de Folios - [ Versi�n ' + VersModu + ' ]';
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
 //Sebastian Camacho 20/09/2018 temporal
//  with stgInfoImagen do
//  begin
//    Cells[0,0]:='CODIGO DE CAJA';
//    Cells[0,1]:='CODIGO DE CARPETA';
//    Cells[0,2]:='SERIE DOCUMENTAL';
//    Cells[0,3]:='SUBSERIE DOCUMENTAL';
//    Cells[0,4]:='N�MERO DE FOLIO';
//    Cells[0,5]:='ARCHIVO DE IMAGEN';
//    Cells[0,6]:='USUARIO QUE CAPTURA';
//    ColWidths[0]:= 160;
//    ColWidths[1]:= Width - 150;
//    TipoCapt := '*';
//  end;
//  rslAnchoRegla.MaxValue:= imsFolio.Width;
//  rslAnchoRegla.MinValue:= ccbColorRegla.Width + rslAnchoRegla.Width + 70;
//  rslAnchoRegla.Value   := rslAnchoRegla.MinValue;
end;

Procedure TFCorreccionFolios.VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
begin
//  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'CAPTURA', p_VeriRuta);
end;

{$ENDREGION}


end.
