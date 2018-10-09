program FabricaUNIANDES;

uses
  Vcl.Forms,
  UFrm_Administrador in '..\Presentacion\UFrm_Administrador.pas' {Frm_FabricaUNIANDES},
  frm_Login in '..\Persistencia\frm_Login.pas' {frmLogin},
  RegExpr in '..\Persistencia\RegExpr.pas',
  dm_Login in '..\Persistencia\dm_Login.pas' {dmLogin: TDataModule},
  UToolsStrings in '..\Persistencia\UToolsStrings.pas',
  UDMConexion in '..\Persistencia\UDMConexion.pas' {DMConexion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TFrm_FabricaUNIANDES, Frm_FabricaUNIANDES);
  Application.Run;
end.
