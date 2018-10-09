unit UProcesoActualizador;

interface

uses
  Windows, Forms, Sysutils, StrUtils, IOUtils, classes, DB, DBClient,
   ZDataset,FPGenerales, Winapi.ShellAPI;

type

  TProcesoActualizador = class
    private

    public

      {CONSTRUCTORES Y DESTRUCTORES}

      {PROPIEDADES}
      {METODOS PROPIOS}

      Function VerificarArchivos: boolean;
  end;


implementation
uses
  UActualizadorCarpeta;


Function TProcesoActualizador.VerificarArchivos: Boolean;
var
  ArchExec     : string;
  ArchInic     : string;
  CarpRaiz     : string;
  IndiBack     : Boolean;
  IpServid     : string;
  NombUsua     : string;
  PassUsua     : string;
  RutaBack     : string;
  RutaFtpp     : string;
  RutaDest     : string;
  UnidInst     : string;
  HoraActu     : TDate;
  ArchComa     : TStringList;

begin
  IpServid  := '10.10.136.52';
  CarpRaiz  := '\ftp_uniandes\IMGUNIANDES\';
  NombUsua  := 'cons_uniandes';
  PassUsua  := 'Con*U4d3s!';

  try
    ArchComa:= TStringList.Create;
    FrmActualizadorCarpeta.lstActualiazando.Items.Append('Contectando con servidor FTP: [ '
                                                        + IpServid + ' ]....');
    Application.ProcessMessages;

    FrmActualizadorCarpeta.lstActualiazando.Items.Delete(FrmActualizadorCarpeta.lstActualiazando.Items.Count - 1);
    FrmActualizadorCarpeta.lstActualiazando.Items.Append('ACTUALIZANDO DESDE EL SERVIDOR: [ '
                                                        + IpServid + ' ]');
    FrmActualizadorCarpeta.lstActualiazando.Items.Append('');
    Application.ProcessMessages;

    RutaFtpp:= CarpRaiz + 'Apl\';
    IndiBack:= False;

    UnidInst:= ExtractFileDrive(Application.ExeName);
    RutaDest:= UnidInst + '\CarpetaDigital\';
    try
      if not TDirectory.Exists(RutaDest) then
      begin
        TDirectory.CreateDirectory(RutaDest);
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se creó la Ruta de la Aplicación: [ '
                                                              + RutaDest + ' ]');
        Application.ProcessMessages;
      end;

    except
      raise Exception.Create('No se poseen permisos para crear la carpeta: [ '
                              + RutaDest + ' ]');
    end;

    ArchExec:= RutaDest + 'CarpetaDigital.exe';
    ArchInic:= RutaDest + 'CarpetaDigital.ini';
    if FileExists(ArchExec) or FileExists(ArchInic) then
    begin
      RutaBack:=RutaDest + 'backup\';
      if not TDirectory.Exists(RutaDest + 'backup') then
      begin
        TDirectory.CreateDirectory(RutaBack);
        FrmActualizadorCarpeta.lstActualiazando.Items.append('* Se creó la Ruta de Backup la Aplicación: [ '
                                                        + RutaBack + ' ]');
        Application.ProcessMessages;
      end;
      FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Efectuando copia de respaldo de la Aplicación.....');
      Application.ProcessMessages;
    end;
    TFile.Delete(RutaDest + 'control.dll');
    HoraActu:= Now();
    if FileExists(ArchExec) then
    begin
      TFile.Copy(ArchExec,RutaBack +'CarpetaDigital-'
                                   + FormatDateTime('yymmddnnss',HoraActu) + '.xan',true);
      IndiBack:=True;
    end;

    if FileExists(ArchInic)  then
    begin
      TFile.Copy(ArchInic,RutaBack + 'CarpetaDigital-'
                                   + FormatDateTime('yymmddnnss',HoraActu) + '.ian',true);
      IndiBack:=True;
    end;
    if IndiBack then
    begin
      FrmActualizadorCarpeta.lstActualiazando.Items.Delete(FrmActualizadorCarpeta.lstActualiazando.Items.Count - 1);
      FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se efectuó copia de respaldo de la Aplicación.');
    end;
    FrmActualizadorCarpeta.lstActualiazando.Items.Append('Descargando archivos de la Aplicacion....');
    Application.ProcessMessages;

    ArchComa.Append('OPEN ' + IpServid);
    ArchComa.Append(NombUsua);
    ArchComa.Append(PassUsua);
    ArchComa.Append('get ' + RutaFtpp + 'CarpetaDigital.exe ' + RutaDest + 'CarpetaDigital.exe');
    ArchComa.Append('get ' + RutaFtpp + 'CarpetaDigital.ini ' + RutaDest + 'CarpetaDigital.ini');
    ArchComa.Append('get ' + RutaFtpp + 'libpq.dll ' + RutaDest + 'libpq.dll');
    ArchComa.Append('get ' + RutaFtpp + 'libpq74.dll ' + RutaDest + 'libpq74.dll');
    ArchComa.Append('get ' + RutaFtpp + 'midas.dll ' + RutaDest + 'midas.dll');
    ArchComa.Append('get ' + RutaFtpp + 'control.dll ' + RutaDest + 'control.dll');

    ArchComa.Append('DISCONNECT');
    ArchComa.Append('quit');
    try
      if not TDirectory.Exists('U111-234-323-yy') then
      begin
        TDirectory.CreateDirectory('U111-234-323-yy');
      end;
      SetFileAttributes('U111-234-323-yy',faHidden + faSysFile + faArchive);
      ArchComa.SaveToFile('U111-234-323-yy\PTF');
    except
      raise Exception.Create('No existen permisos para la carpeta de trabajo.');
    end;
    ArchComa.Clear;
    ArchComa.Append('mAc%4*$$');
    if EjecutarProceso('FTP -v -i -s:U111-234-323-yy\PTF ',True) then
    begin
      if FileExists(RutaDest + 'control.dll') then
      begin
        ArchComa.SaveToFile('U111-234-323-yy\PTF');
        TFile.Delete(RutaDest + 'control.dll');
        FrmActualizadorCarpeta.lstActualiazando.Items.Delete(FrmActualizadorCarpeta.lstActualiazando.Items.Count - 1);
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se descargó CarpetaDigital.exe.');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se descargó CarpetaDigital.ini.');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('* Se descargaron Librerias.');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('<< PROCESO FINALIZADO >>');
      end
      else
      begin
        ArchComa.SaveToFile('U111-234-323-yy\PTF');
        TFile.Delete(RutaDest + 'CarpetaDigital.exe');
        TFile.Delete(RutaDest + 'CarpetaDigital.ini');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('');
        FrmActualizadorCarpeta.lstActualiazando.Items.Append('** ERROR DESCARGANDO CARPETA. LIBRERIAS INCOMPLETAS **');
      end;
      Application.ProcessMessages;
      TDirectory.Delete('U111-234-323-yy',true);
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



{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
