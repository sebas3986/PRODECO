program CarpetaDigital;

uses
  Vcl.Forms,
  MidasLib,
  WINDOWS,
  SysUtils,
  StrUtils,
  UDMConexion in '..\Persistencia\ConexiónBD\UDMConexion.pas' {DMConexion: TDataModule},
  UProcesoCarpetaDigi in '..\Logica\UProcesoCarpetaDigi.pas',
  UFolioCarpetaDigi in '..\Logica\UFolioCarpetaDigi.pas',
  UDAOCarpetaDigital in '..\Persistencia\DAO\UDAOCarpetaDigital.pas',
  UFTP in '..\Persistencia\ConexionFTP\UFTP.pas',
  UProcesoLogin in '..\Logica\UProcesoLogin.pas',
  UDAOLogin in '..\Persistencia\DAO\UDAOLogin.pas',
  ULogin in '..\Presentacion\ULogin.pas' {frmLogin},
  UCarpetaDigital in '..\Presentacion\UCarpetaDigital.pas' {frmCarpetaDigital},
  UVisor in '..\Presentacion\UVisor.pas' {FrmVisor},
  FPGenerales in '..\..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDAOParametro in '..\..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UCliente in '..\..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UUsuarioCarpetaDigi in '..\Logica\UUsuarioCarpetaDigi.pas' {$R *.res},
  UAplicacion in '..\Logica\UAplicacion.pas',
  UProcesoVisor in '..\Logica\UProcesoVisor.pas',
  UCarpetaCarpetaDigi in '..\Logica\UCarpetaCarpetaDigi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TfrmCarpetaDigital, frmCarpetaDigital);
  Application.Run;
end.
