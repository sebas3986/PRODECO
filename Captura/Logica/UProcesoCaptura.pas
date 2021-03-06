unit UProcesoCaptura;

interface

uses
  Windows, Sysutils, StrUtils, IOUtils, classes, DB, DBClient, ZDataset,
  UDAOCaptura, UFolioCaptura,URegistroCaptura, UFtpGestor, UFtpImagen, Ucliente,
  UDMAplicacion;


type

  TProcesoCaptura = class
    private
      FDatosCaptura        : TRegistroCaptura;
      FDatosCliente        : TCliente;
      FDatosFolio          : TFolioCaptura;
      FDatosPersonasFolio  : TList;
      FDatosMTIANI         : TDataSource;
      FFondos              : TDataSource;
      FSeriesDocumentales  : TDataSource;
      FTiposIdentificacion : TDataSource;


      {METODOS PROPIOS}


    public
      qr:TZQuery;
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property DatosCaptura        : TRegistroCaptura read FDatosCaptura;
      property DatosCliente        : TCliente         read FDatosCliente;
      property DatosFolio          : TFolioCaptura    read FDatosFolio;
      property DatosPersonasFolio  : TList            read FDatosPersonasFolio;
      property Fondos              : TDataSource      read FFondos;
      property SeriesDocumentales  : TDataSource      read FSeriesDocumentales;
      property TiposIdentificacion : TDataSource      read FTiposIdentificacion;
      property DatosMTIANI         : TDataSource      read FDatosMTIANI;
      Procedure DescargarImagen;
      Procedure GuardarRegistroCaptura;
      procedure ObtenerDatosFolio;
      function  ObtenerDatosANI (p_DescTipoIden: string; p_numedocu: string;
                                  p_primnomb:string; p_primapel:string): TDataSource;
      function  ObtenerDatosMTI(p_identipo: variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;

      Procedure ObtenerFolioCaptura (p_descseridocu: string);
      Procedure ObtenerFondos;
      Procedure ObtenerSeriesDocumentales;
      Procedure ObtenerTiposIdentificacion;
      procedure RegistrarFolio(p_ObseNove: string);
      Procedure RegistrarNovedadSinCaptura;
      Procedure TerminarGuardarFolio(p_ObseNove: string);
      Procedure VerificarVersion(p_NombModu: string; p_VersModu: string; p_VeriRuta: Boolean);

  end;


implementation

Uses
  UCaptura;

var
  DAOCaptura: TDAOCaptura;
  ListArch  : TSearchRec;


Procedure TProcesoCaptura.DescargarImagen;
var
  ConexFTP : TFtpGestor;
  CarpFtpp : string;
  CarpLoca : string;
  DatosFTP : TFtpImagen;

begin
  try
    DatosFTP := TFtpImagen.Create;
    ConexFTP := TFtpGestor.Create(DatosFTP.HostFtpImg,DatosFTP.UsuarioFtpImg,
                                  DatosFTP.PasswordFtpImg,DatosFTP.PuertoFtpImg);
    ConexFTP.ConectarFTP;
    FDatosFolio.ImagenLocal := FDatosCliente.RutaCaptura + FDatosFolio.NombreImagen;
    if TDirectory.Exists(FDatosCliente.RutaCaptura) then
      TDirectory.Delete(FDatosCliente.RutaCaptura,TRUE);
    TDirectory.CreateDirectory(FDatosCliente.RutaCaptura);
    ConexFTP.BajarArchivo(DatosFTP.CarpetaRaizFtpImg+FDatosFolio.RutaFtp,FDatosFolio.NombreImagen,
                          FDatosCliente.RutaCaptura );
    ConexFTP.DesconectarFTP;
    ConexFTP.Free;
    DatosFTP.Free;
  except
    on e:exception do
      raise Exception.Create('No es posible Descargar la Imagen [' + FDatosFolio.NombreImagen
                              + '] en el equipo local.' + #10#13 + '* ' + e.Message);

  end;
end;

Procedure TProcesoCaptura.GuardarRegistroCaptura;
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      if (FDatosCaptura.DescripcionFuenteIdentificacion = 'MTI-BASEDATOS') or
          (FDatosCaptura.DescripcionFuenteIdentificacion = 'MTI-CAPTURA') then
        FDatosCaptura.IdIdentificacion:=
                AgregarNuevaIdentificacion(FDatosCaptura.DescripcionTipoIdentificacion,
                          FDatosCaptura.DescripcionFuenteIdentificacion,
                          FDatosCaptura.NumeroDocumento, FDatosCaptura.PrimerNombre,
                          FDatosCaptura.SegundoNombre, FDatosCaptura.PrimerApellido,
                          FDatosCaptura.SegundoApellido);

      AgregarIdentificacionFolio(FDatosCaptura.IdFolio, FDatosCaptura.IdIdentificacion,
                 FDatosCaptura.Observacion,FDatosCaptura.DescripcionTipoIdentificacion,
                 FDatosCaptura.NumeroDocumento);
      {SE VERIFICA SI ES EL PRIMER REGISTRO AGREAGADO PARA REGISTRAR LOS DATOS DE LA PLANILLA,
        ÚNICAMENTE SI EXISTE ALGUNA DE LAS FECHAS: DE NOMINA, DE PAGO O PERIODO DE COTIZACIÓN}
      if (FDatosPersonasFolio.Count = 0) and (FDatosFolio.NovedadesFolio.Count = 0) then
        if (FDatosFolio.FechaNomina <> '') or (FDatosFolio.PeriodoCotizacion <> '') or
              (FDatosFolio.FechaPagoBanco <> '') then
          AgregarDatosPanilla(FDatosCaptura.IdFolio,FDatosFolio.TipoPlanilla,
                              FDatosFolio.IdFondo, FDatosFolio.FechaNomina,
                              FDatosFolio.PeriodoCotizacion, FDatosFolio.FechaPagoBanco);

      {SE REGISTRA EN LA LISTA DATOSPERSONASFOLIO LA NUEVA INFORMACION CAPTURADA}
      FDatosPersonasFolio.Add(DatosCaptura);

      {SI ES UN FOLIO DE HISTORIAS LABORALES SE CIERRA DE UNA VEZ}
      if FDatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES' then
        RegistrarFolio('');  {SE ENVIA NULO PORQUE NO HAY OBSERVACION DEL FOLIO}
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      if FDatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES' then
        raise Exception.Create('No es posible Guardar el Registro de la Captura '
                              + 'y cerrar el Folio.' +#10#13 + '* ' + e.Message)
      else
        raise Exception.Create('No es posible Guardar el Registro de la Captura.'
                              + #10#13 + '* ' + e.Message);
    end;
  end;
end;

function TProcesoCaptura.ObtenerDatosANI (p_DescTipoIden: string; p_numedocu: string;
                                          p_primnomb:string; p_primapel:string): TDataSource;

begin
  FDatosMTIANI:= DAOCaptura.ConsultarDatosANI(p_DescTipoIden,p_numedocu, p_primnomb,
                                              p_primapel);
end;

Procedure TProcesoCaptura.ObtenerDatosFolio;

begin
  DescargarImagen;
  FDatosPersonasFolio := DAOCaptura.ConsultarPersonasFolio(FDatosFolio.idfolio);
end;

function TProcesoCaptura.ObtenerDatosMTI (p_identipo: variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;

begin
  FDatosMTIANI:= DAOCaptura.ConsultarDatosMTI(p_identipo, p_numedocu, p_primnomb,p_primapel);
end;

Procedure TProcesoCaptura.ObtenerFolioCaptura (p_descseridocu: string);
begin
  FDatosFolio:= DAOCaptura.AsignarFolio(p_descseridocu,paramstr(1));
end;

Procedure TProcesoCaptura.ObtenerFondos;
begin
  FFondos:= DAOCaptura.ConsultarFondos;
end;

Procedure TProcesoCaptura.ObtenerSeriesDocumentales;
begin
  FSeriesDocumentales:= DAOCaptura.ConsultarSeriesDocumentales;
end;

Procedure TProcesoCaptura.ObtenerTiposIdentificacion;
begin
  FTiposIdentificacion:= DAOCaptura.ConsultarTiposIdentificacion;
end;

procedure TProcesoCaptura.RegistrarFolio(p_ObseNove: string);
{ESTE PROCEDIMIENTO GUARDA EN BD LA INFORMACION DEL FOLIO CUANDO SE SELECCIONA LA OPCION
 DE TERMINAR Y GUARDAR O CUANDO SE GRABA UN REGISTRO EN UN FOLIO DE HISTORIAS LABORALES}
begin
  with DAOCaptura do
  begin
    if p_ObseNove <> '' then
      AgregarNovedadFolio(FDatosFolio.IdFolio, FDatosFolio.IdTarea, p_ObseNove, 'F');
    DesbloquearFolio(FDatosFolio.IdFolio, 'CAPTURA');
    {SE VERIFICA SI A LA CARPETA YA SE LE CAPTURARON TODOS LOS FOLIOS QUE SON CAPTURABLES}
    if VerificarCarpetaCompleta(FDatosFolio.IdCarpeta) then
    begin
      if (DatosFolio.DescTipoSerieDocum = 'HISTORIAS LABORALES')  then
        {PROCEDIMIENTO PARA DESPLEGAR DOCUMENTO A LOS FOLIOS NO CAPTURABLES EN HISTORIAS LABORALES}
        AsignarCapturaFoliosNoCapturables(FDatosFolio.IdCarpeta);
      CambiarEstadoCarpeta(FDatosFolio.IdCarpeta);
    end;
  end;
end;

Procedure TProcesoCaptura.RegistrarNovedadSinCaptura;
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      AgregarNovedadFolio(FDatosFolio.IdFolio, FDatosFolio.IdTarea, FDatosCaptura.Observacion,'R');
      {SE VERIFICA SI ES EL PRIMER REGISTRO AGREAGADO PARA REGISTRAR LOS DATOS DE LA PLANILLA,
       ÚNICAMENTE SI EXISTE ALGUNA DE LAS FECHAS: DE NOMINA, DE PAGO O PERIODO DE COTIZACIÓN}
      if (FDatosPersonasFolio.Count = 0) and (FDatosFolio.NovedadesFolio.Count = 0) then
        if (FDatosFolio.FechaNomina <> '') or (FDatosFolio.PeriodoCotizacion <> '') or
              (FDatosFolio.FechaPagoBanco <> '') then
          AgregarDatosPanilla(FDatosCaptura.IdFolio,FDatosFolio.TipoPlanilla,
                              FDatosFolio.IdFondo, FDatosFolio.FechaNomina,
                              FDatosFolio.PeriodoCotizacion, FDatosFolio.FechaPagoBanco);

      FDatosFolio.NovedadesFolio.Add(FDatosCaptura.Observacion);
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      raise Exception.Create('No es posible registrar la Novedad del Registro del Folio ['
                             + FDatosFolio.NombreImagen + '].'
                             + #10#13 + '* ' + e.Message);
    end;
  end;
end;

Procedure TProcesoCaptura.TerminarGuardarFolio(p_ObseNove: string);
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      RegistrarFolio(p_ObseNove);
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      if p_ObseNove <> '' then
        raise Exception.Create('No es posible registrar la Novedad de la Imagen ['
                                + FDatosFolio.NombreImagen + '].'
                                + #10#13 + '* ' + e.Message)
      else
        raise Exception.Create('No es posible Terminar y Guardar el Folio ['
                                + FDatosFolio.NombreImagen + '].'
                                + #10#13 + '* ' + e.Message);
    end;
  end;
end;

Procedure TProcesoCaptura.VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'CAPTURA', p_VeriRuta );
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoCaptura.Create;
begin
  try
    DAOCaptura          := TDAOCaptura.create;
    FDatosCliente       := TCliente.create;
    FDatosCaptura       := TRegistroCaptura.Create;
    FDatosFolio         := TFolioCaptura.Create;
    FTiposIdentificacion:= TDataSource.create(nil);
    FDatosPersonasFolio := TList.Create;
    FDatosCliente.ConfigurarCliente;
  except
    on e:Exception do
      raise Exception.Create('No es posible Inicializar Componentes. '
                              + #10#13 + '* ' + e.Message);
  end;
end;

destructor TProcesoCaptura.Destroy;
begin
  DAOCaptura.Free;
  FDatosCliente.Free;
  FDatosCaptura.Free;
  FDatosFolio.Free;
  FDatosPersonasFolio.Free;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
