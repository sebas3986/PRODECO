program Publicacion;



uses
  Vcl.Forms,
  Windows,
  UPublicacion in '..\Presentacion\UPublicacion.pas' {frmPublicacion},
  Vcl.Themes,
  Vcl.Styles,
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFTP in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFTP.pas',
  UImagen in '..\..\FuncionesGenerales\Clases\Logica\UImagen.pas',
  UCarpetaArchivo in '..\Logica\UCarpetaArchivo.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UDAOPublicacion in '..\Persistencia\UDAOPublicacion.pas',
  UFolio in '..\..\FuncionesGenerales\Clases\Logica\UFolio.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'PROD';
  Application.CreateForm(TDMConexion, DMConexion);
  if ParamStr(1) <> '' then
  begin
    Application.CreateForm(TfrmPublicacion, frmPublicacion);
    Application.Run;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el Módulo de Publicación desde esta instancia.'
                            + #10#13
                            + 'Ingrese al Menú Principal del Sistema y ejecute la opción respectiva.',
                              'Publicación de Imágenes',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;
end.
