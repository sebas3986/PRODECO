unit UDMConexion;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection,ActiveX;

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

    procedure SetEsquema(valor:string);
    function  GetEsquema(): string;
    procedure SetAmbiente(valor:string);
    function  GetAmbiente(): string;

  public
    Property Esquema: string read GetEsquema write SetEsquema;
    property Ambiente: string read GetAmbiente write SetAmbiente;

    procedure Conectar;

  end;

var
  DMConexion : TDMConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{$REGION 'METODOS PROPIOS'}
procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin
  { aqui se debe leer el .INI para cargar los parametros de conexión a la Base de Datos }
    CoInitialize(nil);
    {desarrollo}
  try
    FHost     := '172.17.3.17';
    FUsuario  := 'Andes.Aplicacion';
    FPassword := 'AndZOISApl';
    FBaseDatos:= 'UNIANDES';
    FEsquema  := 'andes_desa';
    FPuerto   := 5432;
    FAmbiente := 'DESARROLLO';

    {produccion}

    {FHost     := '172.17.4.22';
    FUsuario  := 'produniandes';
    FPassword := 'Pr0dUn12015d';
    FBaseDatos:= 'UNIANDES';
    FEsquema  := 'andes_prod';
    FPuerto   := 5432;
    FAmbiente := 'PRODUCCIÓN';}

    conectar;

  except
    on E:Exception do
      raise Exception.Create('Error al conectarse a la Base de Datos ['+ ParamStr(2) + ']. Fuente: '+ e.Message);

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
      raise Exception.Create('Error al conectarse a la Base de Datos.'+ #10#13 + ' * '+ e.Message);
  end;
end;
{$ENDREGION}

{$REGION 'GETTERS Y SETTERS'}
procedure TDMConexion.SetEsquema(valor:string);
begin
  FEsquema:= Valor;
end;

function  TDMConexion.GetEsquema(): string;
begin
  Result:= FEsquema;
end;

procedure TDMConexion.SetAmbiente(valor:string);
begin
  Fambiente := Valor;
end;

function  TDMConexion.GetAmbiente: string;
begin
  Result:= Fambiente;
end;
{$ENDREGION}

{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}
{$ENDREGION}
end.
