program Reportes;

uses
  Vcl.Forms,
  windows,
  System.SysUtils,
  UReportes in '..\Presentacion\UReportes.pas' {frmReportes},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UProcesoReportes in '..\Logica\UProcesoReportes.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas' {/ UAplicacionCtrl in '..\..\FuncionesGenerales\Clases\Presentacion\UAplicacionCtrl.pas' {FrmActualizadorCarpeta},
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\AplicacionVersion\UDMAplicacion.pas' {DMAplicacion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  //Sebastian Camacho 20/09/2018 temporal
  VeriRuta    := False;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El Módulo de Reportes ya se encuentra en ejecución.'
                            + #10#13 + 'No se permite crear más de una instancia del Módulo en Memoria.',
                             'Reportes',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
      Application.CreateForm(TfrmReportes, frmReportes);
      Application.CreateForm(TDMAplicacion, DMAplicacion);
       Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el Módulo de Reportes desde esta instancia.'
                            + #10#13 + 'Ingrese al Menú Principal del Sistema y ejecute la opción respectiva.',
                            'Reportes',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;
end.
