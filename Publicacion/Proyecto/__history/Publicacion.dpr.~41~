program Publicacion;

uses
  Vcl.Forms,
  Windows,
  System.SysUtils,
  UPublicacion in '..\Presentacion\UPublicacion.pas' {frmPublicacion},
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  UCarpetaArchivo in '..\Logica\UCarpetaArchivo.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UDAOPublicacion in '..\Persistencia\UDAOPublicacion.pas',
  UFolio in '..\..\FuncionesGenerales\Clases\Logica\UFolio.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UFtpImagen in '..\..\FuncionesGenerales\Clases\Logica\UFtpImagen.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\AplicacionVersion\UDMAplicacion.pas' {DMAplicacion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AmbiEjecApli:= 'QA';  {AMBIENTE PARA EL CUAL SE COMPILA EL PROECTO }
  VeriRuta    := True;    {PARA EJECUTAR LA APLICACION VERIFICANDO RUTA DE INSTALACION O NO}
  if ParamStr(3) = 'UaNnIdVeEs' then
  begin
    if EnEjecucion(ExtractFileName(Application.ExeName)) then
    begin
      Application.MessageBox('El Módulo de Publicación ya se encuentra en ejecución.'
                            + #10#13 + 'No se permite crear más de una instancia del Módulo en Memoria.',
                             'Publicación de Imágenes',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
      Application.CreateForm(TDMAplicacion, DMAplicacion);
      Application.CreateForm(TfrmPublicacion, frmPublicacion);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el Módulo de Publicación desde esta instancia.'
                            + #10#13 + 'Ingrese al Menú Principal del Sistema y ejecute la opción respectiva.',
                            'Publicación de Imágenes',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.
