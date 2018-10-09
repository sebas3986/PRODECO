unit UFtpImagen;

interface

uses
  SysUtils,  strutils,  DBClient,
  UDAOParametro;

type

  TFtpImagen = class
  private
    FHostFtpImg           : string;   {DIRECCION FTP DESCARGA DE LAS IMAGENES}
    FPuertoFtpImg         : word;     {PUERTO DEL FTP DE IMAGENES}
    FUsuarioFtpImg        : string;   {USUARIO DEL FTP DE IMAGENES}
    FPasswordFtpImg       : string;   {PASSWORD DEL USUARIO FTP DE IMAGENES}
    FCarpetaRaizFtpImg    : string;   {CARPETA RAIZ DEL FTP DE IMAGENES TIF}
    FCarpetaRaizFtpPdf    : string;   {CARPETA RAIZ DEL FTP DE IMAGENES PDF}
    FHostRemotoFtpImg     : string;   {DIRECCION FTP DESCARGA DE LAS IMAGENES PARA ACCESO REMOTO}
    FUsuarioConFtpImg     : string;   {USUARIO DEL FTP DE IMAGENES DE SOLO LECTURA}
    FPasswordConFtpImg    : string;   {PASSWORD DEL USUARIO FTP DE IMAGENES DE SOLO CONSULTA}
    FFechaAcceso          : TDateTime;{FECHA EN LA QUE SE ACCESA AL SERVIDOR DE BASE DE DATOS}
  public
    constructor Create;

    {PROPERTIES}
    Property HostFtpImg        : string    read FHostFtpImg          write FHostFtpImg;
    Property PuertoFtpImg      : word      read FPuertoFtpImg        write FPuertoFtpImg;
    Property UsuarioFtpImg     : string    read FUsuarioFtpImg       write FUsuarioFtpImg;
    Property PasswordFtpImg    : string    read FPasswordFtpImg      write FPasswordFtpImg;
    Property CarpetaRaizFtpImg : string    read FCarpetaRaizFtpImg   write FCarpetaRaizFtpImg;
    Property CarpetaRaizFtpPdf : string    read FCarpetaRaizFtpPdf   write FCarpetaRaizFtpPdf;
    Property HostRemotoFtpImg  : string    read FHostRemotoFtpImg    write FHostRemotoFtpImg;
    Property UsuarioConFtpImg  : string    read FUsuarioConFtpImg    write FUsuarioConFtpImg;
    Property PasswordConFtpImg : string    read FPasswordConFtpImg   write FPasswordConFtpImg;
    Property FechaAcceso       : TDateTime read FFechaAcceso         write FFechaAcceso;
    {METODOS}
    procedure ConfigurarFtpImg;
  end;

implementation

{ TFTP }

{$REGION 'METODOS'}

procedure TFtpImagen.ConfigurarFtpImg;
var
  CodiErro  : Integer;
  DatoPara  : TDAOParametro;
  NumePuer  : string;
  ParaImag  : TClientDataSet;
begin
  try
    DatoPara := TDAOParametro.create;
    ParaImag := TclientDataSet.create(nil);
    ParaImag := DatoPara.BuscarParametros('FTP');
    ParaImag.First;
    if ParaImag.RecordCount > 0 then
    begin
      FHostFtpImg         := IfThen(ParaImag.Locate('PROPIEDAD','HOST',[]),
                                                      ParaImag.Fields[2].value,'');
      NumePuer            := IfThen(ParaImag.Locate('PROPIEDAD','PUERTO',[]),
                                                      ParaImag.Fields[2].value,'');
      FUsuarioFtpImg      := IfThen(ParaImag.Locate('PROPIEDAD','USUARIO',[]),
                                                      ParaImag.Fields[2].value,'');
      FPasswordFtpImg     := IfThen(ParaImag.Locate('PROPIEDAD','PASSWORD',[]),
                                                      ParaImag.Fields[2].value,'');
      if ParaImag.Locate('PROPIEDAD','CARPETARAIZ',[]) then
      begin
        FCarpetaRaizFtpImg := ifThen(AnsiRightStr(ParaImag.Fields[2].value,1) = '\',
                                      ParaImag.Fields[2].value,ParaImag.Fields[2].value + '\');
        {LA RUTA RAIZ EN EL FTP DE LAS IMAGENES PDF ES CASI LA MISMA A LA DE LOS TIF,
          TERMINA EN 'FE\'}
        FCarpetaRaizFtpPdf := LeftStr(FCarpetaRaizFtpImg,Length(FCarpetaRaizFtpImg)-1)+ 'FE\';
      end
      else
      begin
        FCarpetaRaizFtpImg := '';
        FCarpetaRaizFtpPdf := '';
      end;
      FHostRemotoFtpImg := IfThen(ParaImag.Locate('PROPIEDAD','HOSTREMOTO',[]),
                                                      ParaImag.Fields[2].value,'');
      FUsuarioConFtpImg := IfThen(ParaImag.Locate('PROPIEDAD','USUARIOCONS',[]),
                                                      ParaImag.Fields[2].value,'');
      FPasswordConFtpImg := IfThen(ParaImag.Locate('PROPIEDAD','PASSWORDCONS',[]),
                                                      ParaImag.Fields[2].value,'');
      FechaAcceso        := ParaImag .Fields[3].value;

      if (Trim(FHostFtpImg) = '') or (Trim(NumePuer) = '') or (Trim(FUsuarioFtpImg) = '') or
          (Trim(FPasswordFtpImg) = '') or (Trim(FCarpetaRaizFtpImg) = '') or
          (Trim(FHostRemotoFtpImg) = '') or (Trim(FUsuarioConFtpImg) = '') or
          (Trim(FPasswordConFtpImg) = '') then
        raise Exception.Create('La información de Parámetros está incompleta.')
      else
      begin
        val(NumePuer,FPuertoFtpImg,CodiErro);
        if CodiErro <> 0 then
          raise Exception.Create('Valor incorrecto en el Puerto del FTP: [' + NumePuer + '].');
      end;
    end
    else
      raise Exception.Create('No existe Información de Parámetros para el FTP de Imágenes.');
  except
    on e:exception do
      raise Exception.Create('Error configurando FTP de Imágenes. ' + #10#13 + '* '
                              + e.Message);
  end;
end;

{$ENDREGION}

{$REGION 'CREATE AND DESTRUCTOR'}
constructor  TFtpImagen.Create;
begin
  ConfigurarFtpImg;
end;
{$ENDREGION}

{$REGION 'GETTERS Y SETTERS'}
{$ENDREGION}
end.
