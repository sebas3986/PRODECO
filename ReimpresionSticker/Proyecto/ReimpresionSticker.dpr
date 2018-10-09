program ReimpresionSticker;

uses
  Vcl.Forms, Windows, System.SysUtils,
  UReimpresionSticker in '..\Presentacion\UReimpresionSticker.pas' {frm_ReimpresionSticker},
  UDAOImpresionSticker in '..\Persistencia\UDAOImpresionSticker.pas' {DAOImpresionSticker: TDataModule},
  UGlobales in '..\..\FuncionesGenerales\Clases\Logica\UGlobales.pas',
  FPGenerales in '..\..\FuncionesGenerales\Funciones\FPGenerales.pas',
  UDAOParametro in '..\..\FuncionesGenerales\Clases\Persistencia\DAO\UDAOParametro.pas',
  UFtpGestor in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionFTP\UFtpGestor.pas',
  UActualizaModulo in '..\..\FuncionesGenerales\Clases\Presentacion\UActualizaModulo.pas' {FrmActualizaModulo},
  UDMConexion in '..\..\FuncionesGenerales\Clases\Persistencia\ConexionBD\UDMConexion.pas' {DMConexion: TDataModule},
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
      Application.MessageBox('El M�dulo de Reimpresi�n de Stickers ya se encuentra en ejecuci�n.'
                            + #10#13 + 'No se permite crear m�s de una instancia del M�dulo en Memoria.',
                             'Reimpresi�n de Stickers',MB_OK OR MB_ICONERROR);
      Application.Terminate;
    end
    else
    begin
      Application.CreateForm(TDMConexion, DMConexion);
      Application.CreateForm(TDMAplicacion, DMAplicacion);
    Application.CreateForm(Tfrm_ReimpresionSticker, frm_ReimpresionSticker);
    Application.CreateForm(TDAOImpresionSticker, DAOImpresionSticker);
      Application.Run;
    end;
  end
  else
  begin
    Application.MessageBox('No se permite ejecutar el M�dulo de Reimpresi�n de Stickers desde esta instancia.'
                            + #10#13 + 'Ingrese al Men� Principal del Sistema y ejecute la opci�n respectiva.',
                            'Reimpresi�n de Stickers',MB_OK OR MB_ICONERROR);
    Application.Terminate;
  end;

end.
