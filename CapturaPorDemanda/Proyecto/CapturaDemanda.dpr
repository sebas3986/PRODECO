program CapturaDemanda;

uses
  Vcl.Forms,
  windows,
  System.SysUtils,
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UProcesoCaptura in '..\Logica\UProcesoCaptura.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UDAOCaptura in '..\Persistencia\UDAOCaptura.pas',
  UFolioCaptura in '..\Logica\UFolioCaptura.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  URegistroCaptura in '..\Logica\URegistroCaptura.pas',
  ULogin in '..\Presentacion\ULogin.pas' {FrmLogin},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UCapturaDemanda in '..\Presentacion\UCapturaDemanda.pas' {frmCaptura},
  UFtpImagen in '..\..\FuncionesGenerales\Clases\Logica\UFtpImagen.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\AplicacionVersion\UDMAplicacion.pas' {DMAplicacion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  //Sebastian Camacho 20/09/2018  temporal
  VeriRuta    := False;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El M�dulo de Captura por Demanda ya se encuentra en ejecuci�n.'
                            + #10#13 + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                             'Captura de Informaci�n por Demanda',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  Application.CreateForm(TfrmCaptura, frmCaptura);
  Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Captura por Demanda desde esta instancia.'
                            + #10#13 + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                            'Captura de Informaci�n por Demanda',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.
