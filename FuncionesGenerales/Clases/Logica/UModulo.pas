unit UModulo;

interface

uses
  SysUtils;
Type
  TModulo = class
    private
      FNombreModulo         : string;
      FVersion              : string;   {VERSION DEL MODULO}
      FIpFtpDescarga        : string;   {DIRECCION FTP DESCARGA DEL MODULO}
      FPuertoFtpDescarga    : word;     {PUERTO DEL FTP}
      FUsuarioFtpDescarga   : string;   {USUARIO DEL FTP}
      FPasswordFtpDescarga  : string;   {PASSWORD DEL USUARIO FTP}
      FRutaFtpDescarga      : string;   {RUTA CARPETA DESCARGA DEL MODULO}
      FRutaDestino          : string;   {RUTA LOCAL DONDE SE DESCARGA EL MODULO}
      FArchivoEjecutable    : string;   {NOMBRE DEL ARCHIVO EJECUTABLE}


    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property NombreModulo         : string  read FNombreModulo         write FNombreModulo;
      property Version              : string  read FVersion              write FVersion;
      property IpFtpDescarga        : string  read FIpFtpDescarga        write FIpFtpDescarga;
      property PuertoFtpDescarga    : Word    read FPuertoFtpDescarga    write FPuertoFtpDescarga;
      property UsuarioFtpDescarga   : string  read FUsuarioFtpDescarga   write FUsuarioFtpDescarga;
      property PasswordFtpDescarga  : string  read FPasswordFtpDescarga  write FPasswordFtpDescarga;
      property RutaFtpDescarga      : string  read FRutaFtpDescarga      write FRutaFtpDescarga;
      property RutaDestino          : string  read FRutaDestino          write FRutaDestino;
      property ArchivoEjecutable    : string  read FArchivoEjecutable    write FArchivoEjecutable;
   end;

implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TModulo.Create;
begin
  inherited;
end;

destructor TModulo.Destroy;
begin
  inherited;

end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
