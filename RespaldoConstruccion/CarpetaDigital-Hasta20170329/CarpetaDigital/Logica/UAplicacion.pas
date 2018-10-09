unit UAplicacion;

interface

uses
  Sysutils,strutils,DB, DBClient, UDAOParametro;

type

  TAplicacion = class
    private
      FVersion              : string;   {VERSION DEL MODULO}
      FFtpHost              : string;   {DIRECCION FTP DESCARGA DEL MODULO}
      FFtpPuerto            : string;   {PUERTO DEL FTP}
      FFtpUsuario           : string;   {USUARIO DEL FTP}
      FFtpPassword          : string;   {PASSWORD DEL USUARIO FTP}
      FFtpRutaAplicacion    : string;   {RUTA CARPETA DESCARGA DEL MODULO}
      FRutaDestino          : string;   {RUTA LOCAL DONDE SE DESCARGA EL MODULO}

      {GETTERS AND SETTERS}

    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property Version          : string    read FVersion           write FVersion;
      property FtpHost          : string    read FFtpHost           write FFtpHost;
      property FtpPuerto        : string    read FFtpPuerto         write FFtpPuerto;
      property FtpUsuario       : string    read FFtpUsuario        write FFtpUsuario;
      property FtpPassword      : string    read FFtpPassword       write FFtpPassword;
      property FtpRutaAplicacion: string    read FFtpRutaAplicacion write FFtpRutaAplicacion;
      property RutaDestino      : string    read FRutaDestino       write FRutaDestino;

     {METODOS}
      procedure ConfigurarAplicacion(p_NombModu: string);

  end;


implementation

procedure TAplicacion.ConfigurarAplicacion(p_NombModu: string);
var
  DatoPara  : TDAOParametro;
  ParaApli  : TClientDataSet;
begin
  try
    DatoPara := TDAOParametro.create;
    ParaApli := TclientDataSet.create(nil);
    ParaApli := DatoPara.BuscarParametros(p_NombModu);
    ParaApli.Locate('PROPIEDAD','VERSION',[]);
    Version           := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','FTPHOST',[]);
    FtpHost           := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','FTPPUERTO',[]);
    FtpPuerto         := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','FTPUSUARIO',[]);
    FtpUsuario        := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','FTPPASSWORD',[]);
    FtpPassword       := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','FTPRUTAAPLICACION',[]);
    FtpRutaAplicacion := ParaApli.Fields[2].value;
    ParaApli.Locate('PROPIEDAD','RUTADESTINO',[]);
    RutaDestino       := ParaApli.Fields[2].value;
    DatoPara.Free;
    ParaApli.Free;
    if (Trim(Version) = '') or (Trim(FtpHost) = '') or (Trim(FtpPuerto) = '') or
        (Trim(FtpUsuario) = '') or (Trim(FtpPassword) = '') or
        (Trim(FtpRutaAplicacion) = '') or (Trim(RutaDestino) = '') then
      raise Exception.Create('La información de Parámetros sobre la Aplicación está incompleta.')
    else
    begin
      FtpRutaAplicacion := ifThen(AnsiRightStr(FtpRutaAplicacion,1) = '\',
                                  FtpRutaAplicacion,FtpRutaAplicacion + '\');
      RutaDestino       := ifThen(AnsiRightStr(RutaDestino,1) = '\',
                                                RutaDestino,RutaDestino + '\');
    end;
  except
    on e : exception do
      raise Exception.Create('Error configurando Parámetros de la Aplicación. ' + #10#13 + '* '
                              + e.Message);
  end;

end;


{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TAplicacion.Create;
begin
  inherited;
end;

destructor TAplicacion.Destroy;
begin
  inherited;

end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
