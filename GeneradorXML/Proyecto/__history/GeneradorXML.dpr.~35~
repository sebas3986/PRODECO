program GeneradorXML;

uses
  windows,
  Vcl.Forms,
  System.SysUtils,
  UGeneradorXML in '..\Presentacion\UGeneradorXML.pas' {frm_GeneradorXML},
  DAOGeneradorXML in '..\Persistencia\DAOGeneradorXML.pas' {DMGeneradorXML: TDataModule},
  SeguridadSocial in '..\Persistencia\SeguridadSocial.pas',
  PlanillasNomina in '..\Persistencia\PlanillasNomina.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  NPlanillasNomina in '..\Persistencia\NPlanillasNomina.pas',
  NSeguridadSocial5 in '..\Persistencia\NSeguridadSocial5.pas',
  HistoriaLaboral in '..\Persistencia\HistoriaLaboral.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  XMLHistoriaLaboral in '..\Persistencia\XMLHistoriaLaboral.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UFTP in '..\Persistencia\UFTP.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\AplicacionVersion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  NSeguridadSocial in '..\Persistencia\NSeguridadSocial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  //Sebastian Camacho 20/09/2018 temporal
  VeriRuta    := false;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}

  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El Módulo de Generación de XML ya se encuentra en ejecución.'
                            + #10#13 + 'No se permite crear más de una instancia del Módulo en Memoria.',
                             'Generación de XML',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(Tfrm_GeneradorXML, frm_GeneradorXML);
  Application.CreateForm(TDMGeneradorXML, DMGeneradorXML);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el Módulo de Generación de XML desde esta instancia.'
                            + #10#13 + 'Ingrese al Menú Principal del Sistema y ejecute la opción respectiva.',
                            'Generación de XML',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.
