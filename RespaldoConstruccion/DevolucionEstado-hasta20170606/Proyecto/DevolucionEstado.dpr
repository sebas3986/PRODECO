program DevolucionEstado;

uses
  Vcl.Forms,
  MidasLib,
  WINDOWS,
  SysUtils,
  StrUtils,
  UProcesoDevolucionEsta in '..\Logica\UProcesoDevolucionEsta.pas',
  UDevolucionEstado in '..\Presentacion\UDevolucionEstado.pas' {frmCarpetaDigital},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UUsuarioDevolucionEsta in '..\Logica\UUsuarioDevolucionEsta.pas',
  ULoginDevolucionEsta in '..\Presentacion\ULoginDevolucionEsta.pas' {frmLogin},
  UProcesoLoginDevo in '..\Logica\UProcesoLoginDevo.pas',
  UDAOLoginDevo in '..\Persistencia\DAO\UDAOLoginDevo.pas',
  UDAODevolucionEstado in '..\Persistencia\DAO\UDAODevolucionEstado.pas',
  UCarpetaDevolucionEsta in '..\Logica\UCarpetaDevolucionEsta.pas',
  UFtpImagen in '..\..\FuncionesGenerales\Clases\Logica\UFtpImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'OPER';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  if EnEjecucion('DevolucionEstado.exe') then
  begin
    Application.MessageBox('El M�dulo de Devoluci�n de Estado ya se encuentra en ejecuci�n.'
                      + #10#13
                      + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                          'Devoluci�n de Estado',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end
  else
  begin
    Application.CreateForm(TFrmDevolucionEstado, FrmDevolucionEstado);
    Application.Run;
  end;
end.
