unit UProcesoCaptura;

interface

uses
  Windows, Sysutils, StrUtils, IOUtils, classes, DB, DBClient,
  UDAOCaptura, UFolioCaptura,URegistroCaptura, UFTP, UImagen,Ucliente, ZDataset;

type

  TProcesoCaptura = class
    private
      FDatosCaptura        : TRegistroCaptura;
      FDatosCliente        : TCliente;
      FDatosFolio          : TFolioCaptura;
      FDatosAsociados      : TDataSource;
      FDatosMTIANI         : TDataSource;
      FFondos              : TDataSource;
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
      property Fondos              : TDataSource      read FFondos;
      property TiposIdentificacion : TDataSource      read FTiposIdentificacion;
      property DatosAsociados      : TDataSource      read FDatosAsociados;
      property DatosMTIANI         : TDataSource      read FDatosMTIANI;
      Procedure DescargarImagen;
      Procedure EliminarAsociacion(p_IdenFoid: Int64);
      Procedure GuardarDatoPlanilla;
      Procedure GuardarRegistroCaptura;
      Procedure MarcarFolioNoCapturable;
      function ObtenerDatosAsociados(p_IdenFoli: Int64): TDataSource;
      function  ObtenerDatosANI (p_DescTipoIden: string; p_numedocu: string;
                                  p_primnomb:string; p_primapel:string): TDataSource;
      function  ObtenerDatosMTI(p_identipo: variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;

      Procedure ObtenerFolioCaptura (p_CodiFoli: string);
      Procedure ObtenerFondos;
      Procedure ObtenerTiposIdentificacion;
      Procedure RefrescarAsociados;
      Procedure RegistrarNovedadSinCaptura;
      Procedure TerminarGuardarFolio(p_ObseNove: string);

  end;


implementation

Uses
  UCaptura;

var
  DAOCaptura: TDAOCaptura;
  ListArch  : TSearchRec;


Procedure TProcesoCaptura.DescargarImagen;
var
  ConexFTP : TFTP;
  CarpFtpp : string;
  CarpLoca : string;

begin
  try
    ConexFTP:= TFTP.Create;
    ConexFTP.ConfigurarFTP;
    ConexFTP.ConectarFTP;
    FDatosFolio.ImagenLocal := FDatosCliente.RutaCaptura + FDatosFolio.NombreImagen;
    if TDirectory.Exists(FDatosCliente.RutaCaptura) then
      TDirectory.Delete(FDatosCliente.RutaCaptura,TRUE);
    TDirectory.CreateDirectory(FDatosCliente.RutaCaptura);
    ConexFTP.BajarArchivo(FDatosFolio.RutaFtp,FDatosFolio.NombreImagen,
                          FDatosCliente.RutaCaptura );
    ConexFTP.DesconectarFTP;
    ConexFTP.Free;
  except
    on e:exception do
      raise Exception.Create('No es posible Descargar la Imagen [' + FDatosFolio.NombreImagen
                              + '] en el equipo local.' + #10#13 + '* ' + e.Message);

  end;
end;


Procedure TProcesoCaptura.EliminarAsociacion(p_IdenFoid: Int64);

begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      EliminarDatosAsociacion(p_IdenFoid, FDatosFolio.IdFolio, FDatosFolio.IdCarpeta,
                              FDatosFolio.IdDatoPlanilla);
      RefrescarAsociados;
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      raise Exception.Create('No es posible eliminar la persona solicitada de la Imagen ['
                                + FDatosFolio.NombreImagen + '].'
                                + #10#13 + '* ' + e.Message)
    end;
  end;
end;

Procedure TProcesoCaptura.GuardarDatoPlanilla;
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      AgregarDatosPanilla(StrToInt(FDatosFolio.IdDatoPlanilla), FDatosFolio.IdFondo,
                          FDatosFolio.FechaNomina, FDatosFolio.PeriodoCotizacion,
                          FDatosFolio.FechaPagoBanco);
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      raise Exception.Create('No es posible Guardar el Cambio soliciatdo.'
                              + #10#13 + '* ' + e.Message);
    end;
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

      RefrescarAsociados;
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      raise Exception.Create('No es posible Guardar el Registro de la Captura.'
                              + #10#13 + '* ' + e.Message);
    end;
  end;
end;

Procedure TProcesoCaptura.MarcarFolioNoCapturable;
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      RegistrarMarcaFolio(FDatosFolio.IdFolio);
      EliminarBloqueoFolioNoCapturable(FDatosFolio.IdFolio);
      //DesbloquearFolio(FDatosFolio.IdFolio, 'CAPTURA');
      CambiarEstadoCarpeta(FDatosFolio.IdCarpeta);
      FinalizarTransaccion;
    end;
  except
    on e:exception do
    begin
      DAOCaptura.CancelarTransaccion;
      raise Exception.Create('No es posible registrar la Marca NO-CAPTURABLE EN la Imagen ['
                                + FDatosFolio.NombreImagen + '].'
                                + #10#13 + '* ' + e.Message)
    end;
  end;
end;

function TProcesoCaptura.ObtenerDatosANI (p_DescTipoIden: string; p_numedocu: string;
                                          p_primnomb:string; p_primapel:string): TDataSource;

begin
  FDatosMTIANI:= DAOCaptura.ConsultarDatosANI(p_DescTipoIden,p_numedocu, p_primnomb,
                                              p_primapel);
end;

function TProcesoCaptura.ObtenerDatosAsociados(p_IdenFoli: Int64): TDataSource;

begin
  FDatosASociados:= DAOCaptura.ConsultarDatosAsociados(p_IdenFoli);
end;

function TProcesoCaptura.ObtenerDatosMTI (p_identipo: variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;

begin

  FDatosMTIANI:= DAOCaptura.ConsultarDatosMTI(p_identipo, p_numedocu, p_primnomb,p_primapel);
end;

Procedure TProcesoCaptura.ObtenerFolioCaptura (p_CodiFoli: string);
begin
  FDatosFolio:= DAOCaptura.AsignarFolio('CAPTURA',p_CodiFoli,UsuaAcce);
end;

Procedure TProcesoCaptura.ObtenerFondos;
begin
  FFondos:= DAOCaptura.ConsultarFondos;
end;

Procedure TProcesoCaptura.ObtenerTiposIdentificacion;
begin
  FTiposIdentificacion:= DAOCaptura.ConsultarTiposIdentificacion;
end;

Procedure TProcesoCaptura.RefrescarAsociados;
var
  bm:TBookmark;
begin
  bm:= FDatosAsociados.DataSet.GetBookmark;
  FDatosAsociados.DataSet.Refresh;
  if  FDatosAsociados.DataSet.BookmarkValid(bm) then
    FDatosAsociados.DataSet.GotoBookmark(bm)
  else
    FDatosAsociados.DataSet.Last;
end;

Procedure TProcesoCaptura.RegistrarNovedadSinCaptura;
begin
  try
    with DAOCaptura do
    begin
      IniciarTransaccion;
      AgregarNovedadFolio(FDatosFolio.IdFolio, FDatosFolio.IdTarea, FDatosCaptura.Observacion,'R');
      {SE VERIFICA SI ES EL PRIMER REGISTRO AGREAGADO PARA REGISTRAR LOS DATOS DE LA PLANILLA}
      {
      if (FDatosAsociados.DataSet.RecordCount = 0) and (FDatosFolio.NovedadesFolio.Count = 0) then
        AgregarDatosPanilla(FDatosCaptura.IdFolio,FDatosFolio.TipoPlanilla,
                            FDatosFolio.IdFondo, FDatosFolio.FechaNomina,
                            FDatosFolio.PeriodoCotizacion, FDatosFolio.FechaPagoBanco);
      }
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
      if p_ObseNove <> '' then
        AgregarNovedadFolio(FDatosFolio.IdFolio, FDatosFolio.IdTarea, p_ObseNove, 'F');
      DesbloquearFolio(FDatosFolio.IdFolio, 'CAPTURA');
      CambiarEstadoCarpeta(FDatosFolio.IdCarpeta);
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

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoCaptura.Create;
begin
  try
    DAOCaptura          := TDAOCaptura.create;
    FDatosFolio         := TFolioCaptura.Create;
    FDatosCliente       := TCliente.create;
    FDatosCaptura       := TRegistroCaptura.Create;
    FTiposIdentificacion:= TDataSource.create(nil);
    FDatosAsociados     := TDataSource.create(nil);
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
  FDatosFolio.Free;
  FDatosCliente.Free;
  FDatosCaptura.Free;
  FTiposIdentificacion.Free;
  FDatosAsociados.free;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
