unit frm_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, jpeg;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtLogin: TEdit;
    edtPassword: TEdit;
    lblLogin: TLabel;
    lblPassword: TLabel;
    Image1: TImage;
    lblConfirmPass: TLabel;
    lblNewPass: TLabel;
    edtConfirmPass: TEdit;
    edtNewPass: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    function GetLog: String;
    function GetPass: String;
    function GetConfirmPass: String;
    function GetNewPass: String;
    { Private declarations }
  public
    Property Log : String Read GetLog;
    Property Pass : String Read GetPass;
    Property NewPass : String Read GetNewPass;
    Property ConfirmPass : String Read GetConfirmPass;
    Procedure ViewNewPass;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses dm_Login;

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  Self.Constraints.MinHeight := 161;
  Self.Constraints.MaxHeight := 161;
  StatusBar1.Panels[1].Text := Format('Version %s', [dmLogin.Version]);
end;

function TfrmLogin.GetConfirmPass: String;
begin
  Result := edtConfirmPass.Text;
end;

function TfrmLogin.GetLog: String;
begin
  Result := edtLogin.Text;
end;

function TfrmLogin.GetNewPass: String;
begin
  Result := edtNewPass.Text;
end;

function TfrmLogin.GetPass: String;
begin
  Result := edtPassword.Text;
end;

procedure TfrmLogin.ViewNewPass;
begin
  edtLogin.Enabled := False;
  edtPassword.Enabled := False;
  edtNewPass.Enabled := True;
  edtConfirmPass.Enabled := True;
  Self.Constraints.MinHeight := 221;
  Self.Constraints.MaxHeight := 221;
  edtNewPass.SetFocus;
end;

end.
