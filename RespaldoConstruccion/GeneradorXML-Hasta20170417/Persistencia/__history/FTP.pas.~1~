unit FTP;

interface

uses
  Windows, SysUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,Imagen, UDMConexion;

type

  TFTP = class
  protected
    FTP : TIdFTP;
    function FormatRutaFTP(Imagen:TImagen):string;
    
  private
    FHost     : string;
    FPort     : Integer;
    FUsuario  : string;
    FPassword : string;

    {HOST}
    function  GetHost():string;
    procedure SetHost(Valor:string);

    {PUERTO}
    function  GetPort():Integer;
    procedure SetPort(Valor:Integer);

    {USUARIO}
    function  GetUsuario():string;
    procedure SetUsuario(Valor:string);

    {PASSWORD}
    function  GetPassword():string;
    procedure SetPassword(Valor:string);

  public
    constructor Create;
    destructor  Destroy;

    {GETTERS AND SETTERS}
    property FTPHost     : string read GetHost     write SetHost;
    property FTPPort     : Integer read GetPort    write SetPort;
    property FTPUsuario  : string read GetUsuario  write SetUsuario;
    property FTPPassWord : string read GetPassword write SetPassword;

    {METHODS}
    procedure ConfigurarFTP;
    function  TestConexion():Boolean;
    function  SubirArchivo(Imagen:TImagen):Boolean;
    function  BajarArchivo(Imagen : TImagen):Boolean;
  end;

implementation

{ TFTP }

{$REGION 'METHODS'}
function TFTP.FormatRutaFTP(Imagen:TImagen):string;
var
  Unidad        : string;
  RutaArhivoFTP : string;
begin
  Result        := '';
  RutaArhivoFTP := Imagen.UbicServImg;

  {RUTA FTP}
  Unidad := ExtractFileDrive(RutaArhivoFTP);
  RutaArhivoFTP := ExtractFilePath(Imagen.UbicServImg);
  RutaArhivoFTP := StringReplace(RutaArhivoFTP,Unidad,'',[rfReplaceAll]);
  RutaArhivoFTP := StringReplace(RutaArhivoFTP,'\','/',[rfReplaceAll]);

  if RutaArhivoFTP <> '' then
    begin
      if (DMConexion.Ambiente = 'TEST') or (DMConexion.Ambiente = 'PROD') OR (DMConexion.Ambiente = 'DEV') then
        RutaArhivoFTP := 'BCSC/' + RutaArhivoFTP;
      Result := RutaArhivoFTP;
  end;
end;

procedure TFTP.ConfigurarFTP;
begin
  with FTP do
     begin
       Host := FHost;
       Port := FPort;
       Username := FUsuario;
       Password := FPassword;
  end;
end;

function TFTP.TestConexion():Boolean;
begin
  try
    try
      Result := False;
      FTP.Connect;
      Result := True;
    except
    end;
  finally
    FTP.Disconnect;
  end;
end;

function TFTP.SubirArchivo(Imagen:TImagen):Boolean;
var
  NomArchivoFTP : string;
  RutaArhivoFTP : string;
  Unidad        : string;
begin
  try
    Result := False;
    NomArchivoFTP := ExtractFileName(Imagen.UbicServImg);
    RutaArhivoFTP := FormatRutaFTP(Imagen);

    {RUTA FTP}
    Unidad := ExtractFileDrive(RutaArhivoFTP);
    RutaArhivoFTP := ExtractFilePath(Imagen.UbicServImg);
    RutaArhivoFTP := StringReplace(RutaArhivoFTP,Unidad,'',[rfReplaceAll]);
    RutaArhivoFTP := StringReplace(RutaArhivoFTP,'\','/',[rfReplaceAll]);


    with FTP do
      begin
        Connect;
        try
          MakeDir(RutaArhivoFTP);
        except
        end;
        ChangeDir(RutaArhivoFTP);
        Put(Imagen.UbicLocalImg, NomArchivoFTP,False);
        Disconnect;
        Result := True;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error en TFTP.SubirArchivo , Fuente Error:' + E.Message);
  end;
end;

function TFTP.BajarArchivo(Imagen : TImagen):Boolean;
var
  NomArchivoFTP : string;
  RutaArhivoFTP : string;
  RutaLocal     : string;
begin
  try
    Result := False;
    NomArchivoFTP := ExtractFileName(Imagen.UbicServImg);
    RutaArhivoFTP := FormatRutaFTP(Imagen);
    RutaLocal     := Imagen.UbicLocalImg + '\' + Imagen.NombreImagen;

    with FTP do
       begin
         Connect;
         ChangeDir(RutaArhivoFTP);
         Get(NomArchivoFTP,RutaLocal,True);
         Disconnect;
         Result := True;
    end; 
  except
    on E : Exception do
      raise Exception.Create('Error en TFTP.BajarArchivo , Fuente Error:' + E.Message);
  end;
end;

{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}
function  TFTP.GetHost():string;
begin
  Result := FHost;
end;

procedure TFTP.SetHost(Valor:string);
begin
  FHost := Valor;
end;

function  TFTP.GetPort():Integer;
begin
  Result := FPort;
end;

procedure TFTP.SetPort(Valor:Integer);
begin
  FPort := Valor;
end;

function  TFTP.GetUsuario():string;
begin
  Result := FUsuario; 
end;

procedure TFTP.SetUsuario(Valor:string);
begin
  FUsuario := Valor;
end;

function  TFTP.GetPassword():string;
begin
  Result := FPassword;
end;

procedure TFTP.SetPassword(Valor:string);
begin
  FPassword := Valor;
end;
{$ENDREGION}

{$REGION 'CREATE AND DESTRUCTOR'}
constructor TFTP.Create;
begin
  inherited;
  FTP :=TIdFTP.Create;
end;

destructor TFTP.Destroy;
begin
  inherited;
  FTP.Disconnect;
  FTP.FreeOnRelease;
end;
{$ENDREGION}


end.
