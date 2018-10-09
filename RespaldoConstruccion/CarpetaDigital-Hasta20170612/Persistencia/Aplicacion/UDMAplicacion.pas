unit UDMAplicacion;

interface

uses
  windows,  forms,  Sysutils,  strutils,  IOUtils,  Classes,  DBClient,
  FPGenerales, UDAOParametro,   UActualizaModulo;

type

  TDMAplicacion = class(TDataModule)
    private
      FVersion              : string;   {VERSION DEL MODULO}
      FFtpHost              : string;   {DIRECCION FTP DESCARGA DEL MODULO}
      FFtpPuerto            : word;     {PUERTO DEL FTP}
      FFtpUsuario           : string;   {USUARIO DEL FTP}
      FFtpPassword          : string;   {PASSWORD DEL USUARIO FTP}
      FFtpRutaAplicacion    : string;   {RUTA CARPETA DESCARGA DEL MODULO}
      FRutaDestino          : string;   {RUTA LOCAL DONDE SE DESCARGA EL MODULO}
      FArchivoEjecutable    : string;   {NOMBRE DEL ARCHIVO EJECUTABLE}
      FArchivoIni           : string;   {NOMBRE DEL ARCHIVO CONFIGURACION .INI}
      {GETTERS AND SETTERS}

    public
      {CONSTRUCTORES}

      {PROPIEDADES}
      property Version          : string    read FVersion           write FVersion;
      property FtpHost          : string    read FFtpHost           write FFtpHost;
      property FtpPuerto        : Word      read FFtpPuerto         write FFtpPuerto;
      property FtpUsuario       : string    read FFtpUsuario        write FFtpUsuario;
      property FtpPassword      : string    read FFtpPassword       write FFtpPassword;
      property FtpRutaAplicacion: string    read FFtpRutaAplicacion write FFtpRutaAplicacion;
      property RutaDestino      : string    read FRutaDestino       write FRutaDestino;
      property ArchivoEjecutable: string    read FArchivoEjecutable write FArchivoEjecutable;
      property ArchivoIni       : string    read FArchivoIni        write FArchivoIni;

     {METODOS}
      procedure VerificarAplicacion(p_NombModu: string; p_VersModu: string;
                                            p_DescModu: string);
      procedure DescargarEjecutable;
  end;

var
  DMAplicacion      : TDMAplicacion;
  ErrorDescarga     : string;
  FrmActualizaModulo: TFrmActualizaModulo;

implementation

{$R *.dfm}

{$REGION 'METODOS PROPIOS'}
procedure TDMAplicacion.VerificarAplicacion(p_NombModu: string; p_VersModu: string;
                                            p_DescModu: string);
var
  CodiErro  : Integer;
  DatoPara  : TDAOParametro;
  NumePuer  : string;
  ParaApli  : TClientDataSet;
  RutaElim  : string;
  g:Boolean;

begin
  try
    try
      DatoPara := TDAOParametro.create;
      ParaApli := TclientDataSet.create(nil);
      ParaApli := DatoPara.BuscarParametros(p_NombModu);
      ParaApli.First;
      if ParaApli.RecordCount > 0 then
      begin
        FVersion           := IfThen(ParaApli.Locate('PROPIEDAD','VERSION',[]),
                                            ParaApli.Fields[2].value, '');
        FFtpHost           := IfThen(ParaApli.Locate('PROPIEDAD','FTPHOST',[]),
                                            ParaApli.Fields[2].value, '');
        NumePuer           := IfThen(ParaApli.Locate('PROPIEDAD','FTPPUERTO',[]),
                                            ParaApli.Fields[2].value,'');
        FFtpUsuario        := IfThen(ParaApli.Locate('PROPIEDAD','FTPUSUARIO',[]),
                                            ParaApli.Fields[2].value,'');
        FFtpPassword       := IfThen(ParaApli.Locate('PROPIEDAD','FTPPASSWORD',[]),
                                            ParaApli.Fields[2].value,'');
        FFtpRutaAplicacion := IfThen(ParaApli.Locate('PROPIEDAD','FTPRUTAAPLICACION',[]),
                                            ParaApli.Fields[2].value,'');
        FRutaDestino       := IfThen(ParaApli.Locate('PROPIEDAD','RUTADESTINO',[]),
                                            ParaApli.Fields[2].value,'');
        FArchivoEjecutable := IfThen(ParaApli.Locate('PROPIEDAD','ARCHIVOEJECUTABLE',[]),
                                            ParaApli.Fields[2].value,'');
        DatoPara.Free;
        ParaApli.Free;
      end
      else
        raise Exception.Create('No existe Información de Parámetros para el Módulo: ['
                               + p_DescModu + ']');
    except
      on e:Exception do
        raise Exception.Create('Error configurando Parámetros de la Aplicación. '
                             + #10#13 + '* ' + e.Message);

    end;

    if (Trim(Version) = '') or (Trim(FtpHost) = '') or (Trim(NumePuer) = '') or
        (Trim(FtpUsuario) = '') or (Trim(FtpPassword) = '') or
        (Trim(FtpRutaAplicacion) = '') or (Trim(RutaDestino) = '') or
        (Trim(FArchivoEjecutable) = '') then
      raise Exception.Create('Error configurando Parámetros de la Aplicación. '
                              + #10#13
                              + '* La información de Parámetros está incompleta.')
    else
    begin
      val(NumePuer,FFtpPuerto,CodiErro);
      if CodiErro = 0 then
      begin
        if LowerCase(ExtractFileExt(FArchivoEjecutable)) = '.exe' then
          FArchivoIni := ReplaceStr(LowerCase(FArchivoEjecutable),'.exe', '.ini')
        else
          raise Exception.Create('Error configurando Parámetros de la Aplicación. '
                                + #10#13
                                + '* Valor incorrecto en el Nombre del Archivo Ejecutable: ['
                                + FArchivoEjecutable + '].');

        FFtpRutaAplicacion := ifThen(AnsiRightStr(FFtpRutaAplicacion,1) = '\',
                                    FFtpRutaAplicacion,FFtpRutaAplicacion + '\');
        FRutaDestino       := ExtractFileDrive(Application.ExeName) +
                              IfThen(MidStr(FRutaDestino,2,1) = ':', MidStr(FRutaDestino,3, 1000),
                                                                     FRutaDestino);
        FRutaDestino       := ifThen(AnsiRightStr(FRutaDestino,1) = '\', FRutaDestino,
                                                                         FRutaDestino + '\');

        {LAS SIGUINTES LINEAS SON PARA ASEGURAR EL BORRADO DEL EJECUTABLE QUE ANTERIORMENTE
          ACTUALIZABA LA VERSION DEL MÓDULO DE CARPETA DIGITAL DE LOS DIRECTORIOS MAS FRECUENTEES
          DONDE SE INSTALO}
        RutaElim  := FRutaDestino + 'ActualizadorCarpeta.exe';
        if FileExists(RutaElim) then
          TFile.Delete(RutaElim);
        RutaElim  := MidStr(RutaElim,3, 1000);
        if FileExists('c:' + RutaElim) then
          TFile.Delete('c:' + RutaElim);
        if FileExists('d:' + RutaElim) then
          TFile.Delete('d:' + RutaElim);
        if FileExists('c:\mtiexe\UNIANDESFabrica' + RutaElim) then
          TFile.Delete('c:\mtiexe\uniandesfabrica' + RutaElim);
        if FileExists('d:\mtiexe\uniandesfabrica' + RutaElim) then
          TFile.Delete('d:\mtiexe\uniandesfabrica' + RutaElim);
        {--------------------------------------------------------------------}

        if FVersion <> p_VersModu  then
        begin
          FrmActualizaModulo := TFrmActualizaModulo.create(nil);
          FrmActualizaModulo.DescripcionModulo:= p_DescModu;
          FrmActualizaModulo.VersionNueva     := FVersion;
          FrmActualizaModulo.ShowModal;
          ErrorDescarga := FrmActualizaModulo.MensajeError;
          FrmActualizaModulo.Free;
          if ErrorDescarga <> '' then
          begin
            raise Exception.Create(ErrorDescarga);
          end;
          {Si la actualización del módulo es exitosa descarga todo el módulo}
          ExitProcess(0);
        end;
        { En este punto no hay excepcion. Es cuando la Version del Módulo es correcta}

      end
      else
        raise Exception.Create('Error configurando Parámetros de la Aplicación. '
                              + #10#13
                              + '* Valor incorrecto en el Puerto del FTP: [' + NumePuer + '].');
    end;
  except
    on e : exception do
      begin
        Application.MessageBox(PChar(e.Message),'Advertencia', MB_ICONINFORMATION + MB_OK);
        ExitProcess(0);
      end;
  end;
end;

Procedure TDMAplicacion.DescargarEjecutable;
var
  ArchComa     : TStringList;
  ArchExec     : string;
  ArchInic     : string;
  ArchBackExec : string;
  ArchBackInic : string;
  HoraActu     : TDate;
  RutaBack     : string;
begin
  try
    ArchComa:= TStringList.Create;
    try
      if not TDirectory.Exists(FRutaDestino) then
        TDirectory.CreateDirectory(FRutaDestino);

    except
      raise Exception.Create('No se poseen permisos para crear la carpeta: [ '
                              + FRutaDestino + ' ]');
    end;

    ArchExec    := FRutaDestino + FArchivoEjecutable;
    ArchInic    := FRutaDestino + FArchivoIni;
    RutaBack    := FRutaDestino + 'backup\';
    HoraActu    := Now();
    ArchBackExec:= RutaBack + ReplaceStr(LowerCase(FArchivoEjecutable),'.exe',
                                       '-' + FormatDateTime('yymmddnnss',HoraActu) + '.xan');
    ArchBackInic:= ReplaceStr(LowerCase(ArchBackExec),'.xan', '.ian');
    if FileExists(ArchExec) or FileExists(ArchInic) then
    begin
      if not TDirectory.Exists(RutaBack) then
        TDirectory.CreateDirectory(RutaBack);
      SetFileAttributes(PChar(RutaBack),FaHidden + faSysFile + faArchive);
    end;
    TFile.Delete(FRutaDestino + 'control.dll');

    if FileExists(ArchExec) then
      TFile.Move(ArchExec,ArchBackExec);

    if FileExists(ArchInic)  then
      TFile.Move(ArchInic,ArchBackInic);

    ArchComa.Append('OPEN ' + FFtpHost);
    ArchComa.Append(FFtpUsuario);
    ArchComa.Append(FFtpPassword);
    ArchComa.Append('get ' + FFtpRutaAplicacion + FArchivoEjecutable + ' ' + ArchExec);
    ArchComa.Append('get ' + FFtpRutaAplicacion + FArchivoIni   + ' ' + ArchInic);
    ArchComa.Append('get ' + FFtpRutaAplicacion + 'libpq.dll'   + ' ' + FRutaDestino + 'libpq.dll');
    ArchComa.Append('get ' + FFtpRutaAplicacion + 'libpq74.dll' + ' ' + FRutaDestino + 'libpq74.dll');
    ArchComa.Append('get ' + FFtpRutaAplicacion + 'midas.dll'   + ' ' + FRutaDestino + 'midas.dll');
    ArchComa.Append('get ' + FFtpRutaAplicacion + 'control.dll' + ' ' + FRutaDestino + 'control.dll');

    ArchComa.Append('DISCONNECT');
    ArchComa.Append('quit');
    try
      if not TDirectory.Exists('U111-234-323-yy') then
        TDirectory.CreateDirectory('U111-234-323-yy');

      SetFileAttributes('U111-234-323-yy',faHidden + faSysFile + faArchive);
      ArchComa.SaveToFile('U111-234-323-yy\PTF');
    except
      raise Exception.Create('No existen permisos para la carpeta de trabajo.');
    end;
    ArchComa.Clear;
    ArchComa.Append('mAc%4*$$');
    if EjecutarProceso('FTP -v -i -s:U111-234-323-yy\PTF ',True) then
    begin
      if FileExists(FRutaDestino + 'control.dll') then
      begin
        ArchComa.SaveToFile('U111-234-323-yy\PTF');
        TFile.Delete(FRutaDestino + 'control.dll');
        TDirectory.Delete('U111-234-323-yy',true);
      end
      else
      begin
        ArchComa.SaveToFile('U111-234-323-yy\PTF');
        TFile.Delete(ArchExec);
        TFile.Delete(ArchInic);
        TDirectory.Delete('U111-234-323-yy',true);
        raise Exception.Create('Librerías Incompletas.');
      end;

    end
    else
    begin
      ArchComa.SaveToFile('U111-234-323-yy\PTF');
      TDirectory.Delete('U111-234-323-yy',true);
      raise Exception.Create('Falla an intentar conectarse al FTP.');

    end;
  except
    on e:exception do
      raise Exception.Create('No es posible descargar el aplicativo de Carpeta Digital.'
                            + #10#13 + '* ' + e.Message);

  end;
end;

end.
