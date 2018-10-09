unit ULoginDevolucionEsta;

interface

uses
  Forms,  RxCtrls,  StdCtrls,  ExtCtrls,  Buttons,  Controls,  Classes,  SysUtils,
  windows,  Graphics,  UDMConexion, UGlobales;

type
  TFrmLoginDevolucionEsta = class(TForm)
    RpnAcceso: TRxPanel;
    PnlTitulo: TPanel;
    LblUsuario: TLabel;
    LblContrasena: TLabel;
    EdtUsuario: TEdit;
    EdtContrasena: TEdit;
    spbSalir: TSpeedButton;
    spbIngresar: TSpeedButton;
    PnlErrorUsuario: TPanel;
    PnlAutenticado: TPanel;
    LblTitulo: TLabel;

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

var
  NumeInte  : SmallInt;

implementation
uses
  UDevolucionEstado;

{$R *.dfm}



procedure TFrmLoginDevolucionEsta.EdtContrasenaChange(Sender: TObject);
begin
  EdtUsuarioChange(Sender);
end;

procedure TFrmLoginDevolucionEsta.EdtUsuarioChange(Sender: TObject);
begin
  if (EdtUsuario.Text <> '') and (EdtContrasena.Text <> '') then
    spbIngresar.Visible:= True
  else
    spbIngresar.Visible:= False;
end;

procedure TFrmLoginDevolucionEsta.FormActivate(Sender: TObject);
begin
  try
    ConfigurarAmbiente;
  except
    on E:Exception do
      begin
        Application.MessageBox(PChar(e.Message), 'Devoluci�n de Estado para Carpetas',MB_OK OR MB_ICONERROR);
        Application.Terminate;
      end;
  end;
end;

procedure TFrmLoginDevolucionEsta.spbIngresarClick(Sender: TObject);
begin
  ProcLogi.ObtenerDatosUsuario(EdtUsuario.Text,EdtContrasena.Text);
  spbSalir.Visible:=False;
  if ProcLogi.DatosUsuarioDevolucionEsta.NombreUsuarioDevo = '' then
  begin
    PnlErrorUsuario.Caption:= 'Usuario o Contrase�a Incorrectos';
    PnlErrorUsuario.Visible:=True;
    Application.ProcessMessages;
    Sleep(3000);
    PnlErrorUsuario.Visible:=false;
    EdtUsuario.Text:='';
    EdtContrasena.Text:='';
    EdtUsuario.SetFocus;
    spbSalir.Visible:= True;
    inc(NumeInte);
  end
  else
  begin
    if ProcLogi.DatosUsuarioDevolucionEsta.DescripcionPerfilDevo <> 'MTISUPERVISOR' then
    begin
      PnlAutenticado.Caption:= ProcLogi.DatosUsuarioDevolucionEsta.NombreUsuarioDevo;
      PnlAutenticado.Visible:= True;
      PnlErrorUsuario.Caption:= 'Usuario sin Permiso de ingreso al M�dulo';
      PnlErrorUsuario.Visible:=True;
      Application.ProcessMessages;
      Sleep(3000);
      PnlErrorUsuario.Visible:=false;
      EdtUsuario.Text:='';
      EdtContrasena.Text:='';
      PnlAutenticado.Visible:= False;
      EdtUsuario.SetFocus;
      spbSalir.Visible:=True;
      inc(NumeInte);
    end
    else
    begin
      PnlAutenticado.Caption:= 'Ingresando:  '
                                + ProcLogi.DatosUsuarioDevolucionEsta.NombreUsuarioDevo;
      PnlAutenticado.Visible:= True;
      Application.ProcessMessages;
      Sleep(2000);
      Self.Close;
    end;
  end;
  if NumeInte = 3 then
    ExitProcess(0);
end;

procedure TFrmLoginDevolucionEsta.spbSalirClick(Sender: TObject);
begin
  ExitProcess(0);
end;

{$REGION 'METODOS PROPIOS'}

procedure TFrmLoginDevolucionEsta.ConfigurarAmbiente;
begin
  {SE VERIFICAN LAS CONEXIONES CON LA BASE DE DATOS Y CON EL FTP}
  if TipoUsuaConeProg = 'DESA' then
  begin
    LblTitulo.Font.Color   := StringToColor('$008101E9');
    LblTitulo.Caption := LblTitulo.Caption + #13#10 + '[' + DMConexion.Ambiente + ']';
  end
  else
    if TipoUsuaConeProg = 'OPER' then
        LblTitulo.Font.Color   := clBlack;

  Application.ProcessMessages;
  NumeInte:= 0;
end;

{$ENDREGION}

end.
