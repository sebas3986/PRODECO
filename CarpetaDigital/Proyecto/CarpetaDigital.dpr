program CarpetaDigital;



uses
  Vcl.Forms, MidasLib, WINDOWS, SysUtils,  StrUtils,
  UCarpetaDigital in '..\Presentacion\UCarpetaDigital.pas' {frmCarpetaDigital},
  UDMConexion in '..\Persistencia\ConexiónBD\UDMConexion.pas' {DMConexion: TDataModule},
  UProcesoCarpetaDigi in '..\Logica\UProcesoCarpetaDigi.pas',
  UFolioCarpetaDigi in '..\Logica\UFolioCarpetaDigi.pas',
  UDAOCarpetaDigital in '..\Persistencia\DAO\UDAOCarpetaDigital.pas',
  UFTP in '..\Persistencia\ConexionFTP\UFTP.pas',
  UProcesoLogin in '..\Logica\UProcesoLogin.pas',
  UDAOLogin in '..\Persistencia\DAO\UDAOLogin.pas',
  ULogin in '..\Presentacion\ULogin.pas' {frmLogin},
  UActualizaModulo in '..\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UVisor in '..\Presentacion\UVisor.pas' {FrmVisor},
  UUsuarioCarpetaDigi in '..\Logica\UUsuarioCarpetaDigi.pas',
  UProcesoVisor in '..\Logica\UProcesoVisor.pas',
  UCarpetaCarpetaDigi in '..\Logica\UCarpetaCarpetaDigi.pas',
  UDMAplicacion in '..\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas';


  {$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  //Sebastian Camacho 20/09/2018   temporal
  VeriRuta    := False;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if (ParamStr(1) = '') and (ParamStr(2) = '') and (ParamStr(3) = '') then
  begin
    AmbiEjecApli:= 'CLIE';
  end
  else
  begin
    if ParamStr(3) <> 'UaNnIdVeEs' then
    begin
      Application.MessageBox('No se permite ejecutar el Módulo de Carpeta Digital desde esta instancia.'
                              + #10#13 + 'Los parámetros de la Aplicación son incorrectos.',
                              'Carpeta Digital',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end;
  end;
  if EnEjecucion(ExtractFileName(Application.ExeName)) then
  begin
    Application.MessageBox(PChar(ifthen (AmbiEjecApli= 'CLIE', 'La Aplicación ', 'El Módulo ')
                                  + 'de Carpeta Digital ya se encuentra en ejecución.'
                                  + #10#13 + 'No se permite crear más de una instancia en Memoria.'),
                           'Carpeta Digital',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end
  else
  begin
    Application.CreateForm(TDMConexion, DMConexion);
    Application.CreateForm(TDMAplicacion, DMAplicacion);
    Application.CreateForm(TFrmCarpetaDigital, FrmCarpetaDigital);
    Application.Run;

  end;
end.


