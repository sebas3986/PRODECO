program GeneradorXML;

uses
  Vcl.Forms,
  windows,
  UGeneradorXML in '..\Presentacion\UGeneradorXML.pas' {frm_GeneradorXML},
  DAOGeneradorXML in '..\Persistencia\DAOGeneradorXML.pas' {DMGeneradorXML: TDataModule},
  SeguridadSocial in '..\Persistencia\SeguridadSocial.pas',
  PlanillasNomina in '..\Persistencia\PlanillasNomina.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFTP in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFTP.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  NPlanillasNomina in '..\Persistencia\NPlanillasNomina.pas',
  NSeguridadSocial in '..\Persistencia\NSeguridadSocial.pas',
  HistoriaLaboral in '..\Persistencia\HistoriaLaboral.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  XMLHistoriaLaboral in '..\Persistencia\XMLHistoriaLaboral.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule};

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
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  Application.CreateForm(TDMConexion, DMConexion);
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