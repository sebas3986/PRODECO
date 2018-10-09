unit UDMConexion;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TDMConexion = class(TDataModule)
    ZConexion: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FUser : string;
    FPass : string;
    FDB   : string;
    FSchem: string;
    FHost : string;
    FPort : string;

    procedure Conectar;
  public
    { Public declarations }
  property Esquema  : string            read FSchem    write FSchem;

  end;

var
  DMConexion: TDMConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConexion }

procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin
    FUser := 'pedro.ocampo';
    FPass := 'Peter2015';
    FDB   := 'UNIANDES';
    FSchem:= 'andes_desa';
    FHost := '172.17.3.17';
    FPort := '5432';
    Conectar;
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



end.
