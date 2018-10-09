unit UDMConexion;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, dm_Login;

type
  TDMConexion = class(TDataModule)
    ZConexion: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    CurrentUser  : TUserData;
    Restrictions : TStringList;
    FUser : string;
    FPass : string;
    FDB   : string;
    FSchem: string;
    FHost : string;
    FPort : string;

    procedure Conectar;
    function  GetLoginUser: String;
  public
    { Public declarations }
  property Esquema   : string   read FSchem    write FSchem;
  Property LoginUser : String  read GetLoginUser;
  function  GetNameUser: String;
  end;

var
  DMConexion: TDMConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConexion }

procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin

  FUser := 'produniandes';
  FPass := 'Pr0dUn12015d';
  FDB   := 'UNIANDES';
  FSchem:= 'andes_prod';
  FHost := '172.17.4.22';
  FPort := '5432';

 {
  FUser := 'Andes.Aplicacion';
  FPass := 'AndZOISApl';
  FDB   := 'UNIANDES';
  FSchem:= 'andes_desa';
  FHost := '172.17.3.17';
  FPort := '5432';
  }

  Conectar;

  if not Assigned(CurrentUser) then
    CurrentUser := TUserData.Create;
  if not Assigned(Restrictions) then
    Restrictions := TStringList.Create;

  if not ExeLogin('FabricaUNIANDES','Fabrica UNIANDES', '1.0', CurrentUser, Restrictions) then
    Exit;


end;

procedure TDMConexion.Conectar;
begin
  try
    try
      {POSTGRE}
      with ZConexion do
         begin
           User     := FUser;
           Password := FPass;
           Database := FDB;
           Port     := StrToInt(FPort);
           HostName := FHost;
           Connect;
           Disconnect;
      end;
    except
      on E : Exception do
        raise Exception.Create('Error Al Conectar Base de Datos. Fuente Del Error:' + E.Message);
    end;
  finally
    ZConexion.Disconnect;
  end;
end;

{$REGION 'GET AND SETTERS'}
function TDMConexion.GetLoginUser: String;
begin
  Result := CurrentUser.LoginUser;
end;

function TDMConexion.GetNameUser: String;
begin
  Result := CurrentUser.NameUser;
end;
{$ENDREGION}



end.
