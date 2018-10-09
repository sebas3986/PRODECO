unit UFolioCaptura;

interface

uses
  Classes;

type

  TFolioCaptura = class
    private
      FIdFolio            : int64;        {ID DEL FOLIO QUE SE ASIGNA}
      FCodigoFolio        : string;       {CODIGO DEL FOLIO}
      FCodigoFolioSigu    : string;       {CODIGO DEL FOLIO SIGUIENTE}
      FSecuenciaFolio     : int32;        {CONSECUTIVO DEL FOLIO}
      FIdDatoPlanilla     : string;        {ID DE LA INFORMACION DE LA PLANILLA SI LA TIENE}
      FNombreImagen       : string;       {NOMBRE DEL ARCHIVO CON EXTENSION}
      FIdCarpeta          : Int32;        {ID DE LA CARPETA A LA QUE PERTENECE EL FOLIO}
      FIdTarea            : Int32;        {ID DE LA TAREA DE LA CARPETADEL  FOLIO}
      FCodigoCaja         : string;       {NOMBRE DE LA CAJA A LA QUE PERTENECE LA IMAGEN}
      FDescSerieDocum     : string;       {DESCRIPCION SERIE DOCUMENTAL}
      FDescTipoSerieDocum : string;       {DESCRIPCION TIPO DE SERIE DOCUMENTAL}
      FDescSubSerieDocum  : string;       {DESCRIPCION SUB SERIE DOCUMENTAL}
      FDiasBloqueo        : Int32;        {DIAS QUE LLEVA EL BLOQUEO DEL FOLIO SI YA SE ASIGNÓ}
      FHorasBloqueo       : TTime;        {HORAS,MINUTOS Y SEGUNDOS QUE LLEVA EL BLOQUEO DEL FOLIO SI YA SE ASIGNÓ}
      FServidorFtp        : string;       {DIRECCION IP DEL FTP}
      FRutaFtp            : string;       {RUTA DE LA CARPETA EN EL FTP}
      FImagenLocal        : string;       {ARCHIVO DE IMAGEN CON RUTA COMPLETA EN ELEQUIPO LOCAL}
      FFechaNomina        : string;       {FECHA DE NOMINA REGISTRADA EN TABLA DATOS PLAINILLA}
      FIdFondo            : Int32;        {ID DE LA ENTIDAD FONDO}
      FPeriodoCotizacion  : string;       {PERIODO DE COTIZACIÓN PARA PLANILLAS DE APORTES}
      FFechaPagoBanco     : string;       {FECHA DE PAGO AL BANCO PARA PLANILLAS DE APORTES}
      FTipoPlanilla       : char;         {TIPO DE PLANILLA N:NOMINA A:APORTES}
      FNovedadesFolio     : TStringList;   {NOVEDADES (OBSERVACIONES) AL FOLIO SIN CAPTURA}

    public
      property IdFolio            : int64         read FIdFolio             write FIdFolio;
      property CodigoFolio        : string        read FCodigoFolio         write FCodigoFolio;
      property CodigoFolioSigu    : string        read FCodigoFolioSigu     write FCodigoFolioSigu;
      property SecuenciaFolio     : int32         read FSecuenciaFolio      write FSecuenciaFolio;
      property IdDatoPlanilla     : string        read FIdDatoPlanilla      write FIdDatoPlanilla;
      property NombreImagen       : string        read FNombreImagen        write FNombreImagen;
      property IdCarpeta          : int32         read FIdCarpeta           write FIdCarpeta;
      property IdTarea            : int32         read FIdTarea             write FIdTarea;
      property CodigoCaja         : string        read FCodigoCaja          write FCodigoCaja;
      property DescSerieDocum     : string        read FDescSerieDocum      write FDescSerieDocum;
      property DescTipoSerieDocum : string        read FDescTipoSerieDocum  write FDescTipoSerieDocum;
      property DescSubSerieDocum  : string        read FDescSubSerieDocum   write FDescSubSerieDocum;
      property DiasBloqueo        : int32         read FDiasBloqueo         write FDiasBloqueo;
      property HorasBloqueo       : TTime         read FHorasBloqueo        write FHorasBloqueo;
      property ServidorFtp        : string        read FServidorFtp         write FServidorFtp;
      property RutaFtp            : string        read FRutaFtp             write FRutaFtp;
      property ImagenLocal        : string        read FImagenLocal         write FImagenLocal;
      property FechaNomina        : string        read FFechaNomina         write FFechaNomina;
      property IdFondo            : Int32         read FIdFondo             write FIdFondo;
      property PeriodoCotizacion  : string        read FPeriodoCotizacion   write FPeriodoCotizacion;
      property FechaPagoBanco     : string        read FFechaPagoBanco      write FFechaPagoBanco;
      property TipoPlanilla       : Char          read FTipoPlanilla        write FTipoPlanilla;
      property NovedadesFolio     : TStringList   read FNovedadesFolio      write FNovedadesFolio;

      {CONSTRUCTOR - DESTRUCTOR}
      constructor Create;
      destructor  Destroy;


 end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TFolioCaptura.Create;
begin
  FFechaNomina        := '';
  FIdFondo            := 0;
  FPeriodoCotizacion  := '';
  FFechaPagoBanco     := '';
  FNovedadesFolio:= TStringList.Create;
end;

destructor TFolioCaptura.Destroy;
begin
  FNovedadesFolio.free;
end;

{$ENDREGION}


end.
