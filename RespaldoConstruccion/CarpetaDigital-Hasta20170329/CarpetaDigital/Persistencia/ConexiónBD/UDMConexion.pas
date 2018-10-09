unit UDMConexion;

interface

uses
  windows,Forms, SysUtils, Classes, ZAbstractConnection, ZConnection,ActiveX,FPGenerales;

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
  { aqui se debe leer el .INI para cargar los parametros de conexi�n a la Base de Datos }
    ArchConf:= StringReplace(Application.ExeName,'.exe','.ini',[rfReplaceAll]);
    FHost     := LeeVariableIni('CONFIGURACION','CONEXION',ArchConf)[0];
    FAmbiente := LeeVariableIni('CONFIGURACION','INSTALACION',ArchConf)[0];
    CoInitialize(nil);
    {desarrollo}
    if (FAmbiente = 'CLIENTE') OR (FAmbiente = 'PRODUCCION')
          OR (FAmbiente = 'DESARROLLO')   then
    BEGIN
      if (FAmbiente = 'CLIENTE') OR (FAmbiente = 'PRODUCCION')  then
      begin
        FUsuario  := 'produniandes';
        FPassword := 'Pr0dUn12015d';
        FBaseDatos:= 'UNIANDES';
        FEsquema  := 'andes_prod';
        FPuerto   := 5432;
        if FAmbiente = 'PRODUCCION' then
          FTipoConeFtp := 'LOCAL'
        else
          FTipoConeFtp := 'REMOTO';
      end
      else
        if (FAmbiente = 'DESARROLLO') then
        begin
          FHost     := '172.17.3.17';
          FUsuario  := 'Andes.Aplicacion';
          FPassword := 'AndZOISApl';
          FBaseDatos:= 'UNIANDES';
          FEsquema  := 'andes_desa';
          FPuerto   := 5432;
          FTipoConeFtp := 'LOCAL';
        end;
      Conectar;
    END
    else
      raise Exception.Create('');
  except
    on E:Exception do
      raise Exception.Create('No se permite el acceso a la Aplicacion.' + #13#10
                             + '* ' + E.Message);
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
                              + 'Revise Parametros de Conexi�n.');
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
