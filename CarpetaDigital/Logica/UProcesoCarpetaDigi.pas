unit UProcesoCarpetaDigi;

interface

uses
  DBClient, DB, ZDataset, Sysutils,
  UCarpetaCarpetaDigi, UDAOCarpetaDigital,  UDMAplicacion,  UDMConexion;

type
  TProcesoCarpetaDigi = class
    private
      FDatosArbolSelector    : TClientDataSet;
      FDatosCarpeta          : TCarpetaCarpetaDigi;
      FDatosMtiAndes         : TDataSource;
      FFondos                : TDataSource;
      FSeriesDocumentales    : TDataSource;
      FTiposIdentificacion   : TDataSource;


    public
      qr:TZQuery;
      {CONSTRUCTORES Y DESTRUCTORES}
      constructor Create;
      destructor  Destroy;

      {PROPIEDADES}
      property DatosArbolSelector  : TClientDataSet       read FDatosArbolSelector;
      property DatosCarpeta        : TCarpetaCarpetaDigi  read FDatosCarpeta;
      property DatosMtiAndes       : TDataSource          read FDatosMtiAndes;
      property Fondos              : TDataSource          read FFondos;
      property SeriesDocumentales  : TDataSource          read FSeriesDocumentales;
      property TiposIdentificacion : TDataSource          read FTiposIdentificacion;

      {METODOS PROPIOS}
      function ObtenerDatosArbolCarpeta(p_CodiCarp: string): string;
      Procedure ObtenerDatosCarpeta(p_CodiCarp: String);
      Procedure ObtenerDatosArbolEmpleado(p_IdenPers: Int32; p_NombPers: string;
                                          p_IdenSedo: variant;
                                          p_FechNoin: string; p_FechNofi:String;
                                          p_FechPain: string; p_FechPafi: string;
                                          p_PeriInic: string; p_PeriFina: string;
                                          p_IdenFond: variant);
      function  ObtenerDatosMtiAndes(p_identipo: variant; p_numedocu: string;
                                     p_primnomb:string; p_primapel:string;
                                     p_IdenSedo: variant;
                                     p_fechnoin:string; p_fechnofi:string;
                                     p_FechPagoInic: string; p_FechPagoFina: string;
                                     p_PeriInic: string; p_PeriFina: string;
                                     p_IdenFond: variant): TDataSource;
      Procedure ObtenerSeriesDocumentales;
      Procedure ObtenerFondos(p_TipoFond: string);
      Procedure ObtenerTiposIdentificacion;
      Procedure VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);

  end;


implementation

var
  DAOCarpetaDigital: TDAOCarpetaDigital;

function TProcesoCarpetaDigi.ObtenerDatosArbolCarpeta(p_CodiCarp: string): string;
begin
  Result:= '';
  FDatosCarpeta:= DAOCarpetaDigital.ConsultarDatosCarpeta(p_CodiCarp);
  if (FDatosCarpeta.EtapaCarpetaCrea = '') and (FDatosCarpeta.EtapaCarpetaInse = '') then
    Result:= 'LA CARPETA NO EXISTE ... '
  else
  begin
    FDatosArbolSelector:= DAOCarpetaDigital.ConsultarArbolCarpeta(p_CodiCarp);
    if FDatosArbolSelector.isempty then
      Result := 'LA CARPETA NO TIENE INFORMACI�N DE IM�GENES ... '
  end;
end;

Procedure TProcesoCarpetaDigi.ObtenerDatosCarpeta(p_CodiCarp: String);
begin
  FDatosCarpeta:= DAOCarpetaDigital.ConsultarDatosCarpeta(p_CodiCarp);
end;

function TProcesoCarpetaDigi.ObtenerDatosMtiAndes (p_identipo: variant; p_numedocu: string;
                                             p_primnomb:string; p_primapel:string;
                                             p_IdenSedo: variant;
                                             p_fechnoin:string; p_fechnofi:string;
                                             p_FechPagoInic: string; p_FechPagoFina: string;
                                             p_PeriInic: string; p_PeriFina: string;
                                             p_IdenFond: variant): TDataSource;
begin

  FDatosMtiAndes:= DAOCarpetaDigital.ConsultarDatosMtiAndes(p_identipo, p_numedocu,
                                                            p_primnomb,p_primapel, p_IdenSedo,
                                                            p_fechnoin,p_fechnofi,
                                                            p_FechPagoInic, p_FechPagoFina,
                                                            p_PeriInic, p_PeriFina,
                                                            p_IdenFond);
end;



Procedure TProcesoCarpetaDigi.ObtenerDatosArbolEmpleado(p_IdenPers: Int32; p_NombPers: string;
                                                        p_IdenSedo: variant;
                                                        p_FechNoin: string; p_FechNofi: String;
                                                        p_FechPain: string; p_FechPafi: string;
                                                        p_PeriInic: string; p_PeriFina: string;
                                                        p_IdenFond: variant);
begin
  FDatosArbolSelector:= DAOCarpetaDigital.ConsultarEmpleados(p_IdenPers,p_NombPers,
                                                             p_IdenSedo,p_FechNoin,p_FechNofi,
                                                             p_FechPain,p_FechPafi,
                                                             p_PeriInic,p_PeriFina,p_IdenFond);
end;

Procedure TProcesoCarpetaDigi.ObtenerFondos(p_TipoFond: string);
begin
  FFondos:= DAOCarpetaDigital.ConsultarFondos(p_TipoFond);
end;

Procedure TProcesoCarpetaDigi.ObtenerSeriesDocumentales;
begin
  FSeriesDocumentales:= DAOCarpetaDigital.ConsultarSeriesDocumentales;
end;

Procedure TProcesoCarpetaDigi.ObtenerTiposIdentificacion;
begin
  FTiposIdentificacion:= DAOCarpetaDigital.ConsultarTiposIdentificacion;
end;

Procedure TProcesoCarpetaDigi.VerificarVersion(p_NombModu: string;p_VersModu: string; p_VeriRuta: Boolean);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'CARPETA DIGITAL', p_VeriRuta);
end;


{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoCarpetaDigi.Create;
begin
  try
    FDatosArbolSelector   := TClientDataSet.Create(nil);
    FDatosCarpeta         := TCarpetaCarpetaDigi.Create;
    FSeriesDocumentales   := TDataSource.create(nil);
    FTiposIdentificacion  := TDataSource.create(nil);
  except
    on e:Exception do
      raise Exception.Create('No es posible Inicializar Componentes. '
                              + #10#13 + '* ' + e.Message);
  end;
end;

destructor TProcesoCarpetaDigi.Destroy;
begin
  FDatosArbolSelector.Free;
  FDatosCarpeta.Free;
  FTiposIdentificacion.Free;
  FSeriesDocumentales.Free;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
