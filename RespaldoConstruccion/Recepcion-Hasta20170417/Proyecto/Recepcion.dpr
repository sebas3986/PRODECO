program Recepcion;

uses
  Vcl.Forms,
  windows,
  URecepcion in '..\Presentacion\URecepcion.pas' {Frm_Recepcion},
  UDMRecepcion in '..\Persistencia\UDMRecepcion.pas' {DMRecepcion: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  UValidaciones in '..\Persistencia\UValidaciones.pas',
  UHerramientas in '..\Persistencia\UHerramientas.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'PROD';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  if ParamStr(1) <> '' then
  begin
    if EnEjecucion('Recepcion.exe') then
    begin
      Application.MessageBox('El M�dulo de Recepci�n ya se encuentra en ejecuci�n.'
                        + #10#13
                        + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                            'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TFrm_Recepcion, Frm_Recepcion);
      Application.CreateForm(TDMRecepcion, DMRecepcion);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Recepci�n desde esta instancia.'
                        + #10#13
                        + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                          'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;
end.
