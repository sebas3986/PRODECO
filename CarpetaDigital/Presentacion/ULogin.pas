unit ULogin;

interface

uses
  Forms, RxCtrls,StdCtrls, ExtCtrls, Buttons,Controls, Classes,SysUtils, windows,
  Graphics,
  UGlobales, UProcesoLogin, UDMConexion;

type
  TfrmLogin = class(TForm)
    RpnAcceso: TRxPanel;
    PnlTitulo: TPanel;
    PnlVerificacion: TPanel;
    LblUsuario: TLabel;
    LblContrasena: TLabel;
    EdtUsuario: TEdit;
    EdtContrasena: TEdit;
    spbSalir: TSpeedButton;
    spbIngresar: TSpeedButton;
    PnlErrorUsuario: TPanel;
    PnlAutenticado: TPanel;

    procedure spbSalirClick(Sender: TObject);
    procedure EdtUsuarioChange(Sender: TObject);
    procedure EdtContrasenaChange(Sender: TObject);
    procedure spbIngresarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfigurarAmbiente;
  end;

implementation
uses
  UCarpetaDigital;

{$R *.dfm}



procedure TfrmLogin.EdtContrasenaChange(Sender: TObject);
begin
  EdtUsuarioChange(Sender);
end;

procedure TfrmLogin.EdtUsuarioChange(Sender: TObject);
begin
  if (EdtUsuario.Text <> '') and (EdtContrasena.Text <> '') then
    spbIngresar.Visible:= True
  else
    spbIngresar.Visible:= False;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  try
    ConfigurarAmbiente;
  except
    on E:Exception do
      begin
        PnlVerificacion.Visible:= False;
        Application.MessageBox(PChar(e.Message), 'Carpeta Digital',MB_OK OR MB_ICONERROR);
        Application.Terminate;
      end;
  end;
end;

procedure TfrmLogin.spbIngresarClick(Sender: TObject);
begin
  ProcLogi.ObtenerDatosUsuario(EdtUsuario.Text,EdtContrasena.Text);
  if ProcLogi.DatosUsuarioCarpeta.NombreUsuarioCarpeta = '' then
  begin
    PnlErrorUsuario.Caption := 'Usuario o Contraseña Incorrectos';
    PnlErrorUsuario.Visible := True;
    Application.ProcessMessages;
    Sleep(1500);
    PnlErrorUsuario.Visible:=false;
    EdtUsuario.Text:='';
    EdtContrasena.Text:='';
    EdtUsuario.SetFocus;
  end
  else
  begin
    if ProcLogi.DatosUsuarioCarpeta.Habilitado then
    begin
      PnlAutenticado.Caption:= 'Ingresando:  ' + ProcLogi.DatosUsuarioCarpeta.NombreUsuarioCarpeta;
      PnlAutenticado.Visible:= True;
      Application.ProcessMessages;
      Sleep(1800);
      Self.Close;
    end
    else
    begin
      PnlErrorUsuario.Caption := 'Usuario Deshabilitado';
      PnlErrorUsuario.Visible := True;
      Application.ProcessMessages;
      Sleep(1500);
      PnlErrorUsuario.Visible:=false;
      EdtUsuario.Text:='';
      EdtContrasena.Text:='';
      EdtUsuario.SetFocus;
    end;
  end;
end;

procedure TfrmLogin.spbSalirClick(Sender: TObject);
begin
  ExitProcess(0);
end;

{$REGION 'METODOS PROPIOS'}

procedure TfrmLogin.ConfigurarAmbiente;
begin
  {SE VERIFICAN LAS CONEXIONES CON LA BASE DE DATOS Y CON EL FTP}
  if DMConexion.Ambiente = 'DESARROLLO' then
  begin
    PnlTitulo.Font.Color  := clPurple;
    PnlTitulo.Caption     := PnlTitulo.Caption + '   [' + DMConexion.Ambiente + ']';
  end
  else
    PnlTitulo.Font.Color  := clBlack;

  Application.ProcessMessages;
  Sleep(1500);
  LblUsuario.Visible:=True;
  LblContrasena.Visible:=True;
  EdtUsuario.Visible:= True;
  EdtUsuario.SetFocus;
  EdtContrasena.Visible:=True;
  PnlVerificacion.Visible:= False;
  spbSalir.Visible:=True;

end;

{$ENDREGION}

end.
