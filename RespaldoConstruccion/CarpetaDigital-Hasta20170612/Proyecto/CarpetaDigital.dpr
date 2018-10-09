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

var
  ArchConf : string;

  {$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ArchConf  := StringReplace(Application.ExeName,'.exe','.ini',[rfReplaceAll]);

  if FileExists(ArchConf) then
  begin
    TipoUsuaConeProg := IfThen(LeeVariableIni('CONFIGURACION','INSTALACION',ArchConf).Text <> '',
                                  LeeVariableIni('CONFIGURACION','INSTALACION',ArchConf)[0], '');
TipoUsuaConeProg:='DESARROLLO';
    if (TipoUsuaConeProg = 'CLIENTE') or (TipoUsuaConeProg = 'PRODUCCION')
                                      or (TipoUsuaConeProg = 'DESARROLLO') then
    begin
      if EnEjecucion('CarpetaDigital.exe') then
      begin
        Application.MessageBox('La Aplicación de Carpeta Digital ya se encuentra en ejecución.'
                          + #10#13
                          + 'No se permite crear más de una instancia de la Aplicación en Memoria.',
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
    end
    else
    begin
      Application.MessageBox('No se permite el acceso a la Aplicación. Configuración Incorrecta.',
                             'Carpeta Digital',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite el acceso a la Aplicación. '
                            + 'No existe el Archivo de Configuración.',
                           'Carpeta Digital',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.


