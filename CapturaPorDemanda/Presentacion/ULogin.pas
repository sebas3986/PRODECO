unit ULogin;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    OKBtn: TButton;
    LblComentario: TLabel;
    EdtContrasena: TEdit;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
    FAccesoEspecial : Boolean;
  public
    { Public declarations }
    property AccesoEspecial : Boolean  read  FAccesoEspecial;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.OKBtnClick(Sender: TObject);
begin
  With EdtContrasena do
  begin
    if (Text <> '') and (Text = FormatDateTime('mmnnddhh',now())) then
      FAccesoEspecial:=True
    else
      FAccesoEspecial:=False;
  end;
end;

end.
 
