program CorreccionFolios;

uses
  Vcl.Forms,
  windows,
  System.SysUtils,
  UCorreccionFolios in '..\Presentacion\UCorreccionFolios.pas' {FCorrecionFolios},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  DAOCorreccionFolios in '..\Persistencia\DAOCorreccionFolios.pas' {DAOCorreccionFolios: TDataModule},
  UProcesoCorreccionFolios in '..\Logica\UProcesoCorreccionFolios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  //Sebastian Camacho 20/09/2018   temporal
  VeriRuta    := False;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El M�dulo de Correcci�n de Folios ya se encuentra en ejecuci�n.'
                            + #10#13 + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                             'Correcci�n de Folios',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
      Application.CreateForm(TDMAplicacion, DMAplicacion);
      Application.CreateForm(TFCorreccionFolios, FCorreccionFolios);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Correcci�n de Folios desde esta instancia.'
                            + #10#13 + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                            'Correcci�n de Folios',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;




end.