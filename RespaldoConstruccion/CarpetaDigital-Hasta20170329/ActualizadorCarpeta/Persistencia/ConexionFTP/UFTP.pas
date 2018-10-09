unit UFTP;

interface

uses
  Windows, forms, SysUtils, strutils, IOUtils,Dialogs, DB, DBClient,Classes, IdFTP,
  FPGenerales;

type

  TFTP = class
  protected
    FTP : TIdFTP;

  private
    FIPServidor   : string;
    FCarpetaRaiz  : string;
    {GETTERS Y SETTERS}
  public
    constructor Create;
    destructor  Destroy;
    {PROPERTIES}
    Property IPServidor: string     read FIPServidor  write FIPServidor;
    Property CarpetaRaiz: string    read FCarpetaRaiz write FCarpetaRaiz;
    {METODOS}
    procedure ConfigurarFTP;
    procedure ConectarFTP;
    procedure DesconectarFTP;
    procedure CrearCarpeta(P_NombCarp: string);
    function  TestConexion():Boolean;
    procedure SubirArchivo(P_CarpOrig, P_ArchOrig, P_CarpDest, P_ArchDest: string);
    procedure BajarArchivo (P_RutaOrig, P_ArchOrig, P_RutaDest:string);
  end;

implementation
uses
 UActualizadorCarpeta;

{ TFTP }

{$REGION 'METODOS'}

procedure TFTP.ConfigurarFTP;
begin
  with FTP do
  begin
    IPServidor    := '10.10.136.52';
    Host          := IPServidor;
    Port   := 21;
    CarpetaRaiz := '\ftp_uniandes\IMGUNIANDES\';
    Username    := 'ftp_uniandes';
    Password:=  'Un14nd3sP';
  end;
end;

function TFTP.TestConexion:Boolean;
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

procedure TFTP.ConectarFTP;
var
  intentos: Int32;
  itsok:Boolean;
  temp:TComponent;
begin
  try
    FTP.ConnectTimeout:= 8000;
    FTP.ListenTimeout:= 8000;
    Intentos := 0;
    Repeat
         ItsOk := False;
         Try
           if NOT FTP.Connected then
              FTP.Connect;
            ItsOk := True;
         Except
            On E:EIdFTPException Do Begin
               Inc(Intentos);
               if Pos('10054',E.Message) > 0 then
               Begin
                  FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se descargó CarpetaDigital.exe.');
                  application.ProcessMessages;
                  temp.RemoveComponent(FTP);
                  FTP.Free;
                  FTP := Nil;
                  FTP := TIdFTP.Create;
               End;
            End;
         End;
  Until (Intentos > 10) Or ItsOk;
  if not ItsOk then
    raise Exception.Create('* 10 intentos fallidos');

  {  if NOT FTP.Connected then
      FTP.Connect;}
  except
    on E: Exception do
      raise Exception.Create('Imposible establecer conexión con el FTP.' + #10#13
                              + '* '+ e.Message);
  end;

end;

procedure TFTP.DesconectarFTP;
begin
  try
    if FTP.Connected then
      FTP.Disconnect;
  except
    on E: Exception do
      raise Exception.Create('Imposible terminar la conexión con el FTP.' + #10#13
                              + '* '+ e.Message);
  end;
end;

procedure TFTP.CrearCarpeta(P_NombCarp: string);
var
  ListDire: TStringList;
  I       : Integer;
begin
  ListDire:= TStringList.Create;
  with ListDire do
  begin
    StrictDelimiter:=True;
    Delimiter:='\';
    {SE ELIMINAN LOS '\' DE LOS EXTREMOS DE LA RUTA}
    DelimitedText:= IfThen(AnsiLeftStr(CarpetaRaiz,1) = '\', StuffString(CarpetaRaiz,1,1,''),
                            CarpetaRaiz)
                    + IfThen(AnsiRightStr(P_NombCarp,1) = '\',
                                          StuffString(P_NombCarp,Length(P_NombCarp),1,''),
                            P_NombCarp);
    {SE VERIFICA QUE LOS NOMBRES DE LA CARPETA Y SUBCARPETAS SEAN VALIDOS}
    I := 0;
    while (I < count) and (ListDire[I] <> '') and (AnsiLeftStr(ListDire[I],1) <> ' ')
                      and (AnsiRightStr(ListDire[I],1) <> ' ' ) do
      inc(I);

    if I >= count then
    begin
      {SE CREAN UNA A UNA LAS SUBCARPETAS}
      for I := 0 to ListDire.Count - 1 do
      begin
        try
          FTP.ChangeDir(ListDire[I]);
        except
          begin
            try
              FTP.MakeDir(ListDire[I]);
              FTP.ChangeDir(ListDire[I]);
            except
              on E : Exception do
                raise Exception.Create('Imposible crear la carpeta [' + P_NombCarp + '] en el FTP.'
                                    + #10#13 + '* '+ e.Message);
            end;
          end;

        end;
      end;
    end
    else
    begin
      raise Exception.Create('Imposible crear la carpeta [' + P_NombCarp + '] en el FTP.'
                             + #10#13 + '* ' + 'La ruta tiene caracteres icorrectos.');
    end;
  end;
end;

procedure TFTP.SubirArchivo(P_CarpOrig, P_ArchOrig, P_CarpDest, P_ArchDest: string);
begin
  try
    FTP.Put(P_CarpOrig + P_ArchOrig, CarpetaRaiz + P_CarpDest + P_ArchDest,False);
  except
      on E : Exception do
        raise Exception.Create('Imposible copiar el archivo [' + P_ArchDest + '] al FTP.'
                                + #10#13 + '* '+ e.Message);
  end;
end;

procedure TFTP.BajarArchivo(P_RutaOrig, P_ArchOrig, P_RutaDest : string);
var
  RutaFTP : string;
begin
  RutaFTP := CarpetaRaiz + P_RutaOrig + P_ArchOrig;
  try
    with FTP do
    begin
      Get(RutaFTP , P_RutaDest + P_ArchOrig, True);
    end;
  except
    on E : Exception do
      raise Exception.Create('Imposible descargar el archivo [' + P_ArchOrig
                            + '] desde el FTP.' + #10#13 + '* ' + e.Message);
  end;
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

{$REGION 'GETTERS Y SETTERS'}

{$ENDREGION}
end.
