unit UFTP;

interface

uses
  Windows, forms, SysUtils, strutils, IOUtils,Dialogs, DB, DBClient,Classes, IdFTP,
  UDAOParametro,FPGenerales;

type

  TFTP = class
  private
    FIPServidor     : string;
    FPuerto         : Int32;
    FUsuario        : string;
    FPassword       : string;
    FCarpetaRaizTif : string;
    FCarpetaRaizPdf : string;

    {GETTERS Y SETTERS}

  public
    {PROPERTIES}
    Property IPServidor     : string    read FIPServidor      write FIPServidor;
    Property Puerto         : Int32     read FPuerto          write FPuerto;
    Property Usuario        : string    read FUsuario         write FUsuario;
    Property Password       : string    read FPassword        write FPassword;
    Property CarpetaRaizTif : string    read FCarpetaRaizTif  write FCarpetaRaizTif;
    Property CarpetaRaizPdf : string    read FCarpetaRaizPdf  write FCarpetaRaizPdf;

    {METODOS}
    procedure ConfigurarFTP(P_NombCone: string);
    procedure BajarArchivo (P_RutaOrig, P_ArchOrig, P_RutaDest:string);
  end;

implementation

{ TFTP }

{$REGION 'METODOS'}

procedure TFTP.ConfigurarFTP(P_NombCone: string);
var
  ParaCone : TClientDataSet;
  DatoPara : TDAOParametro;
begin
  try
    DatoPara := TDAOParametro.create;
    ParaCone := TclientDataSet.create(nil);
    ParaCone := DatoPara.BuscarParametros('FTP');
    ParaCone.First;
    if not ParaCone.Eof then
    begin
      if P_NombCone = 'LOCAL' then
        ParaCone.Locate('PROPIEDAD','HOST',[])
      else
        ParaCone.Locate('PROPIEDAD','HOSTREMOTO',[]);
      IPServidor:= ParaCone.Fields[2].value;
      ParaCone.Locate('PROPIEDAD','PUERTO',[]);
      Puerto := ParaCone.Fields[2].value;
      ParaCone.Locate('PROPIEDAD','USUARIOCONS',[]);
      Usuario := ParaCone.Fields[2].value;
      ParaCone.Locate('PROPIEDAD','PASSWORDCONS',[]);
      Password := ParaCone.Fields[2].value;
      ParaCone.Locate('PROPIEDAD','CARPETARAIZ',[]);
      CarpetaRaizTif := ifThen(AnsiRightStr(ParaCone.Fields[2].value,1) = '\',
                              ParaCone.Fields[2].value,ParaCone.Fields[2].value + '\');
      {LA RUTA RAIZ EN EL FTP DE LAS IMAGENES PDF ES CASI LA MISMA A LA DE LOS TIF,
        TERMINA EN 'FE\'}
      CarpetaRaizPdf := LeftStr(CarpetaRaizTif,Length(CarpetaRaizTif)-1) + 'FE\';
    end
    else
       raise Exception.Create('No existen datos de configuración en la Base de Datos.');
  except
    on e:exception do
         raise Exception.Create('Error configurando FTP.'+ #10#13 + '* ' + e.Message);
  end;
end;

procedure TFTP.BajarArchivo(P_RutaOrig, P_ArchOrig, P_RutaDest : string);
var
  ArchComa    : TStringList;
  HandArch    : Integer;
  RutaFtpp    : string;
  TamaArch    :Int64;
begin
  try
    ArchComa:= TStringList.Create;
    RutaFtpp:= P_RutaOrig + P_ArchOrig;
    ArchComa.Append('OPEN ' + IpServidor);
    ArchComa.Append(Usuario);
    ArchComa.Append(Password);
    ArchComa.Append('get ' + RutaFtpp + '  ' + p_RutaDest + P_ArchOrig);
    ArchComa.Append('DISCONNECT');
    ArchComa.Append('quit');
    try
      if not TDirectory.Exists(p_RutaDest + 'U111-234-323-yy') then
      begin
        TDirectory.CreateDirectory(p_RutaDest + 'U111-234-323-yy');
      end;
      SetFileAttributes(PChar(p_RutaDest + 'U111-234-323-yy'),faHidden + faSysFile + faArchive);
      ArchComa.SaveToFile(p_RutaDest + 'U111-234-323-yy\PTF');
    except
      raise Exception.Create('No existen permisos para la carpeta de trabajo.');
    end;
    ArchComa.Clear;
    ArchComa.Append('mAc%4*$$');
    if EjecutarProceso('FTP -v -i -s:' + p_RutaDest + 'U111-234-323-yy\PTF ',True) then
    begin
      ArchComa.SaveToFile(p_RutaDest + 'U111-234-323-yy\PTF');
      TDirectory.Delete(p_RutaDest + 'U111-234-323-yy',true);
      if not FileExists(p_RutaDest + P_ArchOrig) then
        raise Exception.Create('Falla al copiar')
      else
      begin
        HandArch := FileOpen(P_RutaDest + P_ArchOrig, fmOpenRead);
        TamaArch := FileSeek(HandArch,0,2);
        FileClose(HandArch);
        if TamaArch > 0 then
          SetFileAttributes(PChar(P_RutaDest + P_ArchOrig),faHidden + faSysFile + faArchive)
        else
        begin
          TFile.Delete(P_RutaDest + P_ArchOrig);
          raise Exception.Create('Contenido del Archivo Incorrecto')
        end;
      end;
    end
    else
    begin
      ArchComa.SaveToFile(p_RutaDest + 'U111-234-323-yy\PTF');
      TDirectory.Delete(p_RutaDest + 'U111-234-323-yy',true);
      raise Exception.Create('Falla al intentar conectarse al Servidor.');
    end;
  except
    on e:exception do
      raise Exception.Create(e.Message);
  end;
end;

{$ENDREGION}

{$REGION 'CREATE AND DESTRUCTOR'}

{$ENDREGION}

{$REGION 'GETTERS Y SETTERS'}


{$ENDREGION}
end.
