program ReimpresionSticker;

uses
  Vcl.Forms,
  Windows,
  UReimpresionSticker in '..\Presentacion\UReimpresionSticker.pas' {frm_ReimpresionSticker},
  UDAOImpresionSticker in '..\Persistencia\UDAOImpresionSticker.pas' {DAOImpresionSticker: TDataModule},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'PROD';
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  Application.CreateForm(TDMConexion, DMConexion);
  if EnEjecucion('Recepcion.exe') then
  begin
    Application.MessageBox('El Módulo de Recepción ya se encuentra en ejecución.' + #10#13 + 'No se permite crear más de una instancia del Módulo en Memoria.',
                           'Captura de Información',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end
  else
  begin
    Application.CreateForm(Tfrm_ReimpresionSticker, frm_ReimpresionSticker);
    Application.CreateForm(TDAOImpresionSticker, DAOImpresionSticker);
    Application.Run;
  end;
end.
