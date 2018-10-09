unit UDMConexion;

interface

uses
  windows,Forms, SysUtils, Classes, ZAbstractConnection, ZConnection,ActiveX,
  UGlobales, FPGenerales;

type
  TDMConexion = class(TDataModule)
    ZConexion: TZConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
    FHost     : string;
    FUsuario  : string;
    FPassword : string;
    FBaseDatos: string;
    FEsquema  : string;
    FPuerto   : Integer;
    FAmbiente : string;
    FTipoConeFtp : string;


  public
    Property Esquema      : string read FEsquema write FEsquema;
    property Ambiente     : string read FAmbiente write FAmbiente;
    property TipoConeFtp  : string read FTipoConeFtp;
    procedure Conectar;
    procedure Inicializar;

  end;

var
  DMConexion : TDMConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{$REGION 'METODOS PROPIOS'}
procedure TDMConexion.Inicializar;
var
  ArchConf : string;
begin
  try
    CoInitialize(nil);
    { TipoUsuaConeProg debe venir con los valores 'CLIENTE','PRODUCCION' O 'DESARROLLO' }
    if (AmbiEjecApli = 'CLIE') or (AmbiEjecApli = 'PROD') then
    BEGIN
      FHost         := '10.10.134.22';
      FUsuario      := 'produniandes';
      FPassword     := 'Pr0dUn12015d';
      FBaseDatos    := 'UNIANDES';
      FEsquema      := 'andes_prod';
      FPuerto       := 5432;
      if AmbiEjecApli = 'PROD' then
      begin
        FAmbiente   := 'PRODUCCIÓN';
        FTipoConeFtp:= 'LOCAL';
      end
      else
      begin
        FAmbiente   := 'CLIENTE';
        FTipoConeFtp:= 'REMOTO';
      end;
    end
    //Sebastian Camacho 20/09/2018 temporal
//    else
//    begin
//      FHost         := '172.17.3.17';
//      FUsuario      := 'Andes.Aplicacion';
//      FPassword     := 'AndZOISApl';
//      FBaseDatos    := 'UNIANDES';
//      FEsquema      := 'andes_desa';
//      FPuerto       := 5432;
//      FAmbiente     := 'DESARROLLO';
//      FTipoConeFtp  := 'LOCAL';
//    end;

//Sebastian Camacho 19/09/2018 temporal
    else
    begin
      FHost     := '10.10.253.112';
      FUsuario  := 'prodeco.apl';
      FPassword := 'Prodeco2018';
      FBaseDatos:= 'PRODECO';
      FEsquema  := 'prodeco_desa';
      FPuerto   := 5432;
      FAmbiente     := 'DESARROLLO';
      FTipoConeFtp  := 'LOCAL';
    end;
    Conectar;
  except
    on E:Exception do
      begin
        Application.MessageBox(PChar('No se permite la ejecución de la Aplicacion.' + #10#13
                                      + '* ' + e.Message),'Carpeta Digital',
                                      MB_ICONINFORMATION + MB_OK);
        ExitProcess(0);
      end;
  end;

end;

procedure TDMConexion.Conectar;
begin
  try
    with ZConexion do
    begin
      User     := FUsuario;
      Password := FPassword;
      HostName := FHost;
      Port     := FPuerto;
      Database := FBaseDatos;
      Connect;
      Disconnect;
    end;
  except
    on E:Exception do
      raise Exception.Create('Error al conectarse a la Base de Datos.'+ #10#13
                              + 'Revise Parametros de Conexión.');
  end;
end;

{$ENDREGION}

{$REGION 'GETTERS Y SETTERS'}

{$ENDREGION}

{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}

procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin
  try
    Inicializar;
  Except
    on E:Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Carpeta Digital', MB_ICONINFORMATION + MB_OK);
      Halt(0);
    end;
  end;
end;

{$ENDREGION}
end.
