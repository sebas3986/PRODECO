unit UProcesoAdministrador;

interface

uses
  Forms, SysUtils, Strutils, DBclient, Classes,  DB,
  UDAOParametro, UModulo, UDMAplicacion;

type

  TProcesoAdministrador = class
    private
      {METODOS PROPIOS}
      FDatosModulo : TClientDataSet;
    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property  DatosModulo : TClientDataSet   read FDatosModulo;
      Procedure VerificarVersion(p_NombModu: string;p_VersModu: string; P_VeriRuta: Boolean);
      function ObtenerDatosModulo(P_NombModu: string; P_NombOpci: string): TModulo;

  end;


implementation


function TProcesoAdministrador.ObtenerDatosModulo(P_NombModu: string; P_NombOpci: string): TModulo;
var
  Codierro  : Integer;
  DatoPara  : TDAOParametro;
  NumePuer  : string;
  PuerNume  : Integer;
begin
  DatoPara      := TDAOParametro.create;
  FDatosModulo  := DatoPara.BuscarInformacionModulo(P_NombModu);
  Result        := TModulo.Create;
  with FDatosModulo do
  begin
    First;
    if not eof then
    begin
      with Result do
      begin
        NombreModulo        := P_NombModu;
        Version             := IfThen(Locate('PROPIEDAD','VERSION',[]), Fields[2].value, '');
        IpFtpDescarga       := IfThen(Locate('PROPIEDAD','FTPHOST',[]), Fields[2].value, '');
        NumePuer            := IfThen(Locate('PROPIEDAD','FTPPUERTO',[]), Fields[2].value,'');
        UsuarioFtpDescarga  := IfThen(Locate('PROPIEDAD','FTPUSUARIO',[]), Fields[2].value,'');
        PasswordFtpDescarga := IfThen(Locate('PROPIEDAD','FTPPASSWORD',[]), Fields[2].value,'');
        RutaFtpDescarga     := IfThen(Locate('PROPIEDAD','FTPRUTAAPLICACION',[]), Fields[2].value,'');
        RutaDestino         := IfThen(Locate('PROPIEDAD','RUTADESTINO',[]), Fields[2].value,'');
        ArchivoEjecutable   := IfThen(Locate('PROPIEDAD','ARCHIVOEJECUTABLE',[]), Fields[2].value,'');
        val(NumePuer,  PuerNume, CodiErro);
        PuertoFtpDescarga:= PuerNume;
        if (Trim(Version) = '') or (Trim(IpFtpDescarga) = '') or (Trim(NumePuer) = '') or
              (Trim(UsuarioFtpDescarga) = '') or (Trim(PasswordFtpDescarga) = '') or
              (Trim(RutaFtpDescarga) = '') or (Trim(RutaDestino) = '') or
              (Trim(ArchivoEjecutable) = '') or  (CodiErro <> 0) or
              (LowerCase(ExtractFileExt(ArchivoEjecutable)) <> '.exe') then
          raise Exception.Create('Imposible ejecutar la Opci�n [' + P_NombOpci + '].'
                                  + #13#10 + 'El Par�metro [' + P_NombModu
                                  + '] tiene informaci�n incorrecta.' )
        else
        begin
          RutaFtpDescarga := ifThen(AnsiRightStr(RutaFtpDescarga,1) = '\',
                                                 RutaFtpDescarga,RutaFtpDescarga + '\');

          if MidStr(RutaDestino,2,1) = ':'  then
            RutaDestino    := ifThen(AnsiRightStr(RutaDestino,1) = '\',
                                                    RutaDestino,RutaDestino + '\')
          else
          begin
            {SE LE DA UN TRATAMIENTO ESPACIAL AL MODULO DE CARPETA DIGITAL (DURENTE UN
              TIEMPO DE 1 MES) YA QE LA RUTA LOCAL DEL EJECUTABLE DE ESTE M�DULO NO
              TIENE UNIDAD DE DISCO Y AHORA TODOS LA TIENEN}
            if P_NombModu = 'MODULOCARPETADIGITAL' then
            begin
              RutaDestino   := ifThen(AnsiLeftStr(RutaDestino,1) = '\',
                                                   RutaDestino, '\' + RutaDestino );
              RutaDestino   := ExtractFileDir(Application.ExeName) + RutaDestino;
              RutaDestino   := ifThen(AnsiRightStr(RutaDestino,1) = '\',
                                                   RutaDestino,RutaDestino + '\');
            end
            else
              raise Exception.Create('Imposible ejecutar la Opci�n [' + P_NombOpci + '].'
                                      + #13#10
                                      + '* Ruta de Instalaci�n incorrecta. '
                                      + 'No se especifica la Unidad de Disco.');
          end;
        end;
      end;
    end
    else
      raise Exception.Create('Imposible ejecutar la Opci�n [' + P_NombOpci + '].'
                              + #13#10 + 'No existe el Par�metro [' + P_NombModu + '].' );
  end;

end;


Procedure TProcesoAdministrador.VerificarVersion(p_NombModu: string;p_VersModu: string;
                                                  P_VeriRuta:Boolean);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'ADMINISTRADOR FABRICA UNIANDES',P_VeriRuta);
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoAdministrador.Create;
begin
  FDatosModulo := TClientDataSet.Create(nil);
end;

destructor TProcesoAdministrador.Destroy;
begin
  FDatosModulo.Free;
end;

{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.