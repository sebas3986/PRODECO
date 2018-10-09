program FabricaUNIANDES;

uses
  Forms,
  Windows,
  SysUtils,
  UFrm_Administrador in '..\Presentacion\UFrm_Administrador.pas' {Frm_FabricaUNIANDES},
  frm_Login in '..\Persistencia\frm_Login.pas' {frmLogin},
  dm_Login in '..\Persistencia\dm_Login.pas' {dmLogin: TDataModule},
  UDMConexion in '..\Persistencia\UDMConexion.pas' {DMConexion: TDataModule},
  UToolsStrings in '..\Persistencia\UToolsStrings.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UProcesoAdministrador in '..\Logica\UProcesoAdministrador.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\AplicacionVersion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UModulo in '..\..\FuncionesGenerales\Clases\Logica\UModulo.pas',
  RegExpr in '..\Persistencia\RegExpr.pas';

var
  ArchConf : string;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli  := 'QA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  VeriRuta      := True;    {VERIFICA O NO LA RUTA DE INSTALACION DEL EJECUTABLE}
  if EnEjecucion(ExtractFileName(Application.ExeName)) then
  begin
    Application.MessageBox('La Aplicación de Fábrica PRODECO ya se encuentra en ejecución.'
                      + #10#13
                      + 'No se permite crear más de una instancia de la Aplicación en Memoria.',
                          'Aplicación Fábrica PRODECO',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end
  else
  begin
    Application.Title := 'PRODECO';
    Application.CreateForm(TDMConexion, DMConexion);
    Application.CreateForm(TDMAplicacion, DMAplicacion);
    Application.CreateForm(TFrm_FabricaUNIANDES, Frm_FabricaUNIANDES);
    Application.Run;
  end;
end.
