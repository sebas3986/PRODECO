unit UCliente;

interface

uses
  Sysutils,  strutils,DB,  DBClient,  UDAOParametro;

type

  TCliente = class
    private
      FRutaScanner      : string;   {RUTA LOCAL DONDE SE DEJAN LOS ARCHIVOS DIGITALIZADOS}
      FRutaNovedad      : string;   {RUTA LOCAL DONDE EL PUBLICADOR DEJA LAS IMAGENES QUE NO SE PROCESARON}
      FRutaProceso      : string;   {RUTA DE PROCESAMIENTO PARA RENOMBRADO Y PUBLICACION}
      FRutaPublicado    : string;   {RUTA DONDE SE DEJAN LAS IMAGENES PUBLICADAS}
      FRutaCalidad       : string;   {RUTA DONDE SE DEJAN LAS IMAGENES DEL PROCESO DE CALIDAD}
      FRutaCaptura       : string;   {RUTA PARA TRABAJO DE LAS IMAGENES DE CAPTURA}
      FRutaCarpetaDigi   : string;   {RUTA PARA TRABAJO DE LA CARPETA DIGITAL}
      FEstructuraArchivo : string;   {EXPRESION REGULAR PARA EL NOMBRE DEL ARCHIVO DE IMAGEN}
      FEstructuraCarpeta : string;   {EXPRESION REGULAR PARA EL NOMBRE DE LA CARPETA DE IMAGEN}
      FEstructuraAleta   : string;   {EXPRESION REGULAR PARA EL NOMBRE DE LA ALETA DE IMAGEN}

      {GETTERS AND SETTERS}


    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property RutaScanner      : string    read FRutaScanner        write FRutaScanner;
      property RutaNovedad      : string    read FRutaNovedad        write FRutaNovedad;
      property RutaProceso      : string    read FRutaProceso        write FRutaProceso;
      property RutaPublicado    : string    read FRutaPublicado      write FRutaPublicado;
      property RutaCalidad      : string    read FRutaCalidad        write FRutaCalidad;
      property RutaCaptura      : string    read FRutaCaptura        write FRutaCaptura;
      property RutaCarpetaDigi  : string    read FRutaCarpetaDigi    write FRutaCarpetaDigi;
      property EstructuraArchivo: string    read FEstructuraArchivo  write FEstructuraArchivo;
      property EstructuraCarpeta: string    read FEstructuraCarpeta  write FEstructuraCarpeta;
      property EstructuraAleta  : string    read FEstructuraAleta    write FEstructuraAleta;

      {METODOS}
      procedure ConfigurarCliente;

  end;


implementation

procedure TCliente.ConfigurarCliente;
var
  DatoPara  : TDAOParametro;
  ParaClie  : TClientDataSet;
begin
  try
    DatoPara := TDAOParametro.create;
    ParaClie := TclientDataSet.create(nil);
    ParaClie := DatoPara.BuscarParametros('IMAGENCLIENTE');
    ParaClie.Locate('PROPIEDAD','RUTASCANNER',[]);
    RutaScanner := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTANOVEDAD',[]);
    RutaNovedad := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTAPROCESO',[]);
    RutaProceso := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTAPUBLICADO',[]);
    RutaPublicado := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTACALIDAD',[]);
    RutaCalidad := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTACAPTURA',[]);
    RutaCaptura := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','RUTACARPETADIGITAL',[]);
    FRutaCarpetaDigi := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','ESTRUCTURAARCHIVO',[]);
    EstructuraArchivo := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','ESTRUCTURCARPETA',[]);
    EstructuraCarpeta := ParaClie.Fields[2].value;
    ParaClie.Locate('PROPIEDAD','ESTRUCTURALETA',[]);
    EstructuraAleta:= ParaClie.Fields[2].value;
    DatoPara.Free;
    ParaClie.Free;
    if (Trim(RutaScanner) <> '') and (Trim(RutaNovedad) <> '') and (trim(RutaProceso) <> '')
          and (Trim(RutaPublicado) <> '')     and (Trim(RutaCalidad) <> '')
          and (Trim(RutaCaptura) <> '')       and (Trim(FRutaCarpetaDigi) <> '')
          and (Trim(EstructuraArchivo) <> '') and (Trim(EstructuraCarpeta) <> '')
          and (Trim(EstructuraCarpeta) <> '') then
      begin
        RutaScanner      := ifThen(AnsiRightStr(RutaScanner,1) = '\',RutaScanner,RutaScanner + '\');
        RutaNovedad      := ifThen(AnsiRightStr(RutaNovedad,1) = '\',RutaNovedad,RutaNovedad + '\');
        RutaProceso      := ifThen(AnsiRightStr(RutaProceso,1) = '\',RutaProceso,RutaProceso + '\');
        RutaPublicado    := ifThen(AnsiRightStr(RutaPublicado,1) = '\',RutaPublicado,RutaPublicado + '\');
        RutaCalidad      := ifThen(AnsiRightStr(RutaCalidad,1) = '\',RutaCalidad,RutaCalidad + '\');
        RutaCaptura      := ifThen(AnsiRightStr(RutaCaptura,1) = '\',RutaCaptura,RutaCaptura + '\');
        RutaCarpetaDigi  := ifThen(AnsiRightStr(RutaCarpetaDigi,1) = '\',RutaCarpetaDigi,RutaCarpetaDigi + '\');
      end
    else
      raise Exception.Create('La información de Parámetros sobre las carpetas está incompleta.');
  except
    on e : exception do
      raise Exception.Create('Error configurando Carpetas Locales. ' + #10#13 + '* '
                              + e.Message);
  end;

end;


{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TCliente.Create;
begin
  inherited;
end;

destructor TCliente.Destroy;
begin
  inherited;

end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
