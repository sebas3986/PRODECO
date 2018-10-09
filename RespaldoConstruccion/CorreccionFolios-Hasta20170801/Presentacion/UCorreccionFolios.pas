unit UCorreccionFolios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, UDMCorreccionFolios,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Data.DB,
  Vcl.DBGrids;

type
  TFCorrecionFolios = class(TForm)
    pnl1: TPanel;
    DBGCarpetaFolios: TDBGrid;
    btnGuardarCarpeta: TButton;
    EdtFolios: TEdit;
    lbl2: TLabel;
    PnlCodigoCarpeta: TPanel;
    EdtCodigoCarpeta: TEdit;
    Lbllbl1: TLabel;
    btnCancelar: TButton;
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
  end;

var
  FCorrecionFolios: TFCorrecionFolios;

implementation

{$R *.dfm}

procedure TFCorrecionFolios.btnCancelarClick(Sender: TObject);
begin
  LimpiarFormulario;
end;

procedure TFCorrecionFolios.btnGuardarCarpetaClick(Sender: TObject);
var
  TotalFolios : Word;
  UltimoSitio : TBookmark;
begin
  TotalFolios:= 0;
  with DMCorrecionFolios do
  begin
    UltimoSitio:= cdsCarpeta.GetBookmark;
    cdsCarpeta.DisableControls;
    cdsCarpeta.First;
    { SE REEMPLAZA EL SEGMENTO PARA QUE VERIFIQUE QUE EL TOTAL DE FOLIOS SEA > 0 (GUSTAVO VEGA ROZO)
    if StrToInt (EdtFolios.Text) > 0 then
      begin
        repeat
          DMCorrecionFolios.ActualizarFolios(StrToInt(EdtFolios.Text), DMCorrecionFolios.cdsCarpeta.FieldByName('idCarpetaAleta').AsInteger, edCodigoCarpeta.Text);
          DMCorrecionFolios.cdsCarpeta.Next;
        until DMCorrecionFolios.cdsCarpeta.Eof;
        LimpliarFormulario;
        DMCorrecionFolios.BuscarCarpeta(edCodigoCarpeta.Text);
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

procedure TFCorrecionFolios.DBGCarpetaFoliosCellClick(Column: TColumn);
begin
    EdtFolios.Text := IntToStr(DMCorrecionFolios.cdsCarpeta.FieldByName('CantidadFolios').AsInteger);
    EdtFolios.Enabled:= True;
    EdtFolios.SetFocus;
end;

procedure TFCorrecionFolios.EdtCodigoCarpetaChange(Sender: TObject);
begin
  if EdtCodigoCarpeta.Text = '' then
    btnCancelar.Enabled := False
  else
    btnCancelar.Enabled := True;
end;

procedure TFCorrecionFolios.EdtCodigoCarpetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    if DMCorrecionFolios.BuscarCarpeta(edtCodigoCarpeta.Text) then
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

procedure TFCorrecionFolios.EdtFoliosExit(Sender: TObject);
begin
  {SE CAMBIA LA SIGUIENTE LINEA PARA QUE ACEPTE VALORES >= 0 (GUSTAVO VEGA ROZO)
  if StrToInt (EdtFolios.Text) <= 0 then
  }
  if (EdtFolios.Text = '') or (StrToInt (EdtFolios.Text) < 0)   then
  begin
    ShowMessage ('Cantidad incorrecta de Folios. Se aceptan valores mayores e iguales a cero ...');
    EdtFolios.Text:=DMCorrecionFolios.cdsCarpeta.FieldByName('CantidadFolios').Value;
    EdtFolios.SetFocus;
  end
  else
  begin
    DMCorrecionFolios.cdsCarpeta.Edit;
    DMCorrecionFolios.cdsCarpeta.FieldByName('CantidadFolios').Value := StrToInt (EdtFolios.Text);
    EdtFolios.Enabled:=False;
    EdtFolios.Text := '';
  end;

end;

procedure TFCorrecionFolios.EdtFoliosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     btnGuardarCarpeta.SetFocus
  else
    if  not (key in ['0'..'9',#8]) then
      Key := #0;

end;

procedure TFCorrecionFolios.LimpiarFormulario;
begin
  if not DMCorrecionFolios.cdsCarpeta.IsEmpty then
  begin
    DMCorrecionFolios.cdsCarpeta.EmptyDataSet;
    DMCorrecionFolios.cdsCarpeta.Close;
  end;
  btnGuardarCarpeta.Enabled := False;
  DBGCarpetaFolios.Enabled  := False;
  edtCodigoCarpeta.Text     := '';
  EdtFolios.Text            := '';
  PnlCodigoCarpeta.Enabled  := True;
  edtCodigoCarpeta.SetFocus;
end;

end.