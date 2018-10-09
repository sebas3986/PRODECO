program GeneradorXML;

uses
  Vcl.Forms, Windows,
  UGeneradorXML in '..\Presentacion\UGeneradorXML.pas' {frm_GeneradorXML},
  DAOGeneradorXML in '..\Persistencia\DAOGeneradorXML.pas' {DMGeneradorXML: TDataModule},
  UDMConexion in '..\Persistencia\UDMConexion.pas' {DMConexion: TDataModule},
  SeguridadSocial in '..\Persistencia\SeguridadSocial.pas',
  PlanillasNomina in '..\Persistencia\PlanillasNomina.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFTP in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFTP.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  NPlanillasNomina in '..\Persistencia\NPlanillasNomina.pas',
  NSeguridadSocial in '..\Persistencia\NSeguridadSocial.pas',
  HistoriaLaboral in '..\Persistencia\HistoriaLaboral.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'PROD';
  if ParamStr(1) <> '' then
  begin
    if EnEjecucion('GeneradorXML.exe') then
    begin
      Application.MessageBox('El M�dulo de Generaci�n de XML ya se encuentra en ejecuci�n.'
                        + #10#13
                        + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                            'Control Calidad',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(Tfrm_GeneradorXML, frm_GeneradorXML);
      Application.CreateForm(TDMGeneradorXML, DMGeneradorXML);
      Application.CreateForm(TDMConexion, DMConexion);
      Application.CreateForm(TDMAplicacion, DMAplicacion);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Generaci�n de XML desde esta instancia.'
                        + #10#13
                        + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                          'Control Calidad',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.