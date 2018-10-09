program Reportes;

uses
  Vcl.Forms, windows,
  UReportes in '..\Presentacion\UReportes.pas' {frmReportes},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UProcesoReportes in '..\Logica\UProcesoReportes.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas' {/ UAplicacionCtrl in '..\..\FuncionesGenerales\Clases\Presentacion\UAplicacionCtrl.pas' {FrmActualizadorCarpeta},
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'PROD';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  if EnEjecucion('Reportes.exe') then
  begin
    Application.MessageBox('El M�dulo de Reportes ya se encuentra en ejecuci�n.'
                      + #10#13
                      + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                          'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end
  else
  begin
    Application.CreateForm(TfrmReportes, frmReportes);
    Application.Run;
  end;
end.
