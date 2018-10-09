program ControlCalidad;



uses
  Vcl.Forms,
  windows,
  UFrm_ControlCalidad in '..\Presentacion\UFrm_ControlCalidad.pas' {Frm_ControlCalidad},
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
  UDAOControlCalidad in '..\Persistencia\UDAOControlCalidad.pas' {DAOControlCalidad: TDataModule},
  UFrm_Testigo in '..\Presentacion\UFrm_Testigo.pas' {frm_Testigo},
  UFrm_Identificacion in '..\Presentacion\UFrm_Identificacion.pas' {frm_Identificacion},
  UFTP in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFTP.pas',
  UCliente in '..\..\FuncionesGenerales\Clases\Logica\UCliente.pas',
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDMAplicacion in '..\..\FuncionesGenerales\Clases\Persistencia\Aplicacion\UDMAplicacion.pas' {DMAplicacion: TDataModule},
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UValidaciones in '..\..\Recepcion\Persistencia\UValidaciones.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TipoUsuaConeProg:= 'DESA';
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TDAOControlCalidad, DAOControlCalidad);
  Application.CreateForm(TDMAplicacion, DMAplicacion);
  if ParamStr(1) <> '' then
  begin
    if EnEjecucion('ControlCalidad.exe') then
    begin
      Application.MessageBox('El M�dulo de Control Calidad ya se encuentra en ejecuci�n.'
                        + #10#13
                        + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                            'Control Calidad',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TFrm_ControlCalidad, Frm_ControlCalidad);
      Application.CreateForm(Tfrm_Testigo, frm_Testigo);
      Application.CreateForm(Tfrm_Identificacion, frm_Identificacion);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Control Calidad desde esta instancia.'
                        + #10#13
                        + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                          'Control Calidad',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.
