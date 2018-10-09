program CorreccionFolios;

uses
  Vcl.Forms, windows, System.SysUtils,
  UCorreccionFolios in '..\Presentacion\UCorreccionFolios.pas' {FCorrecionFolios},
  UDMConexion in '..\Persistencia\UDMConexion.pas' {DMConexion: TDataModule},
  UDMCorreccionFolios in '..\Persistencia\UDMCorreccionFolios.pas' {DMCorrecionFolios: TDataModule},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDMCorrecionFolios, DMCorrecionFolios);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  Application.CreateForm(TFCorrecionFolios, FCorrecionFolios);
  Application.Run;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'DESA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  VeriRuta    := TRUE;   {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El M�dulo de Correcci�n de Folios ya se encuentra en ejecuci�n.'
                            + #10#13 + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                             'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
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
    Application.MessageBox('No se permite ejecutar el M�dulo de Captura desde esta instancia.'
                            + #10#13 + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                            'Captura de Informaci�n',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;




end.
