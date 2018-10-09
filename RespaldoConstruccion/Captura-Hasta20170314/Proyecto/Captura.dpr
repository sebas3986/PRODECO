program Captura;

uses
  Vcl.Forms,
  windows,
  UCaptura in '..\Presentacion\UCaptura.pas' {frmCaptura},
  Vcl.Themes,
  Vcl.Styles,
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UProcesoCaptura in '..\Logica\UProcesoCaptura.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UDAOCaptura in '..\Persistencia\UDAOCaptura.pas',
  UFolioCaptura in '..\Logica\UFolioCaptura.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  URegistroCaptura in '..\Logica\URegistroCaptura.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UFtpImagen in '..\..\FuncionesGenerales\Clases\Logica\UFtpImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'DESA';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  if ParamStr(1) <> '' then
  begin
    if EnEjecucion('Captura.exe') then
    begin
      Application.MessageBox('El M�dulo de Captura ya se encuentra en ejecuci�n.'
                        + #10#13
                        + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                            'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TfrmCaptura, frmCaptura);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Captura desde esta instancia.'
                        + #10#13
                        + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                          'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;
end.