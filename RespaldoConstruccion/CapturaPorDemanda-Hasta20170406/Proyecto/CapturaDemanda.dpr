program CapturaDemanda;



uses
  Vcl.Forms,
  windows,
  UCaptura in '..\Presentacion\UCaptura.pas' {frmCaptura},
  Vcl.Themes,
  Vcl.Styles,
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFTP in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFTP.pas',
  UProcesoCaptura in '..\Logica\UProcesoCaptura.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UDAOCaptura in '..\Persistencia\UDAOCaptura.pas',
  UFolioCaptura in '..\Logica\UFolioCaptura.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  URegistroCaptura in '..\Logica\URegistroCaptura.pas',
  ULogin in '..\Presentacion\ULogin.pas' {FrmLogin},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'OPER';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TfrmCaptura, frmCaptura);
  Application.Run;
end.
