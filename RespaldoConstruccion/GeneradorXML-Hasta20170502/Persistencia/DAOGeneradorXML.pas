unit DAOGeneradorXML;

interface

uses
  System.SysUtils, System.Classes, UDMConexion, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMGeneradorXML = class(TDataModule)
    ZQCarpetasCaptura: TZQuery;
    dspCarpetasCaptura: TDataSetProvider;
    cdsCarpetasCaptura: TClientDataSet;
    intgrfldCarpetasCapturaidCarpeta: TIntegerField;
    intgrfldCarpetasCapturaidSerieDocumental: TIntegerField;
    intgrfldCarpetasCapturaidCaja: TIntegerField;
    intgrfldCarpetasCapturaSecuenciaCarpeta: TIntegerField;
    strngfldCarpetasCapturaCodigoCarpeta: TStringField;
    ZQFoliosXML: TZQuery;
    dspFoliosXML: TDataSetProvider;
    cdsFoliosXML: TClientDataSet;
    intgrfldFoliosXMLidSerieDocumental: TIntegerField;
    intgrfldFoliosXMLidSubSerieDocumental: TIntegerField;
    strngfldFoliosXMLDescripcionSerieDocumental: TStringField;
    strngfldFoliosXMLDescripcionSubSerieDocumental: TStringField;
    strngfldFoliosXMLCodigoCarpeta: TStringField;
    strngfldFoliosXMLCodigoCarpetaAleta: TStringField;
    intgrfldFoliosXMLCantidadFolios: TIntegerField;
    intgrfldFoliosXMLidFlujo: TIntegerField;
    intgrfldFoliosXMLidFolio: TIntegerField;
    intgrfldFoliosXMLSecuenciaFolio: TIntegerField;
    strngfldFoliosXMLCodigoFolio: TStringField;
    strngfldFoliosXMLipPublicacion: TStringField;
    intgrfldFoliosXMLDensidad: TIntegerField;
    cdsFoliosXMLFechaNomina: TDateField;
    cdsFoliosXMLFechaFolio: TDateTimeField;
    intgrfldFoliosXMLTamanoBytes: TIntegerField;
    dspPlanillaIndices: TDataSetProvider;
    cdsPlanillaIndices: TClientDataSet;
    ZQPlanillaIndices: TZQuery;
    strngfldPlanillaIndicesNumeroDocumento: TStringField;
    strngfldPlanillaIndicesPrimerNombre: TStringField;
    strngfldPlanillaIndicesSegundoNombre: TStringField;
    strngfldPlanillaIndicesPrimerApellido: TStringField;
    strngfldPlanillaIndicesSegundoApellido: TStringField;
    strngfldPlanillaIndicestipo: TStringField;
    strngfldPlanillaIndicesDescripcionTipoIdentificacion: TStringField;
    strngfldFoliosXMLRutaFTP: TStringField;
    strngfldFoliosXMLNombreImagen: TStringField;
    intgrfldCarpetasCapturaidTipoSerieDocumental: TIntegerField;
    ZQBuscarCodigo: TZQuery;
    dspBuscarCodigo: TDataSetProvider;
    cdsBuscarCodigo: TClientDataSet;
    intgrfldBuscarCodigoidCaja: TIntegerField;
    intgrfldBuscarCodigoidCarpeta: TIntegerField;
    intgrfldBuscarCodigoidFolio: TIntegerField;
    ZQCambiarEstado: TZQuery;
    strngfldPlanillaIndicesDescripcionFondo: TStringField;
    cdsPlanillaIndicesPeriodoCotizacion: TDateTimeField;
    cdsPlanillaIndicesFechaNomina: TDateTimeField;
    cdsPlanillaIndicesFechaPago: TDateTimeField;
    cdsFoliosXMLPeriodoCotizacion: TDateTimeField;
    strngfldFoliosXMLDescripcionFondo: TStringField;
    cdsFoliosXMLFechaImagen: TDateTimeField;
    ZQAletasFolio: TZQuery;
    dspAletasFolio: TDataSetProvider;
    cdsAletasFolio: TClientDataSet;
    strngfldAletasFolioDescripcionSubSerieDocumental: TStringField;
    ZQFolioIndexacion: TZQuery;
    dspFolioIndexacion: TDataSetProvider;
    cdsFolioIndexacion: TClientDataSet;
    cdsFolioIndexacionFechaFolio: TDateTimeField;
    ZQDatosPersona: TZQuery;
    dspDatosPersona: TDataSetProvider;
    cdsDatosPersona: TClientDataSet;
    strngfldDatosPersonaPrimerNombre: TStringField;
    strngfldDatosPersonaSegundoNombre: TStringField;
    strngfldDatosPersonaPrimerApellido: TStringField;
    strngfldDatosPersonaSegundoApellido: TStringField;
    ZQTiposIdentificacion: TZQuery;
    dspTiposIdentificacion: TDataSetProvider;
    cdsTiposIdentificacion: TClientDataSet;
    strngfldTiposIdentificacionDescripcionTipoIdentificacion: TStringField;
    strngfldTiposIdentificacionNumeroDocumento: TStringField;
    intgrfldPlanillaIndicesidTipoIdentificacion: TIntegerField;
    cdsFoliosXMLObraCivil: TBooleanField;
    cdsDatosPersonaIdentificacion: TStringField;
    cdsFoliosXMLCapturable: TBooleanField;
    cdsAletasFolioClaseCarpeta: TStringField;
    ZQAletaFolio: TZQuery;
    dspAletaFolio: TDataSetProvider;
    cdsAletaFolio: TClientDataSet;
    cdsAletaFolioDescripcionSubSerieDocumental: TStringField;
    cdsFoliosXMLTotalFolios: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function CarpetasCaptura (Codigo : string; Tipo : integer) : integer;
    procedure FoliosXML (idTipoSerieDocumental, Tipo : integer);
    procedure PlanillaIndices (idFolio, idTipoSerieDocumental : integer);
    procedure BuscarCodigo (Codigo : string; Tipo : integer);
    procedure CambiarEstado (idCarpeta : integer);
    procedure AletasFolio (idCarpeta : integer);
    function FolioIndexacion (idFolio : integer) : boolean;
    procedure DatosPersona (idFolio : integer);
    procedure TiposIdentificacion (idFolio : integer);
    procedure AletaFolio (idFolio : integer);

  end;

var
  DMGeneradorXML: TDMGeneradorXML;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{TDataModule1}
procedure TDMGeneradorXML.CambiarEstado(idCarpeta: integer);
begin
  try
    with ZQCambiarEstado do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT p_idenflujnuev FROM %s.fnc_AsignarFlujoCarpeta (:idCarpeta, ''GUARDADO SATISFACTORIO'')',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         Open;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMGeneradorXML.CambiarEstado. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.AletaFolio(idFolio: integer);
begin
  try
    with ZQAletaFolio do
      begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT CR.idCarpeta, DescripcionSubSerieDocumental, ClaseCarpeta FROM %s.Carpeta CR',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CR.idCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CAL.idCarpetaAleta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CR.idSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieSubSerie SSS ON (SSS.idSerieDocumental = SD.idSerieDocumental AND SSS.idSerieSubSerie = CAL.idSerieSubSerie)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SSS.idSubSerieDocumental) WHERE idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         cdsAletaFolio.Close;
         cdsAletaFolio.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsAletaFolio.Append;
             cdsAletaFolio.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
         end else
            cdsAletaFolio.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.AletaFolio (Aleta a la que pertenece el folio). FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.AletasFolio(idCarpeta: integer);
begin
  try
    with ZQAletasFolio do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT CR.idCarpeta, DescripcionSubSerieDocumental, ClaseCarpeta FROM %s.Carpeta CR',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CR.idCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CR.idSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieSubSerie SSS ON (SSS.idSerieDocumental = SD.idSerieDocumental '
                         + ' AND SSS.idSerieSubSerie = CAL.idSerieSubSerie)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SSS.idSubSerieDocumental) '
                          + ' WHERE CR.idCarpeta =:idCarpeta',[DMConexion.Esquema]));
         SQL.Add('ORDER BY ORDEN');

         ParamByName('idCarpeta').AsInteger := idCarpeta;
         Open;
         cdsAletasFolio.Close;
         cdsAletasFolio.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsAletasFolio.Append;
               cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
               cdsAletasFolio.FieldByName('ClaseCarpeta').AsString := FieldByName('ClaseCarpeta').AsString;
               Next;
             until Eof;
         end else
            cdsAletasFolio.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.AletasFolio. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.BuscarCodigo(Codigo: string; Tipo : integer);
var
  CodigoBusqueda : string;
begin
  case Tipo of
         0 : CodigoBusqueda := Copy (Codigo, 1,4);
         1 : CodigoBusqueda := Copy (Codigo, 1,8);
         2 : CodigoBusqueda := Codigo;
  end;
  try
    with ZQBuscarCodigo do
       begin
         Close;
         SQL.Clear;
         case Tipo of
                 0 : SQL.Add(Format('SELECT idCaja, 0 AS idCarpeta, 0 AS idFolio FROM %s.Caja WHERE CodigoCaja =:Codigo AND Habilitado = TRUE',[DMConexion.Esquema]));
                 1 : begin
                       {GVVR SE MODIFICO ESTA CONSULTA PARA QUE TRAIGA PARA UN CODIGO DE CARPETA EL IDCARPETA QUE SE ENCUENTRE EN
                             IDFLUJO 5 (GENERACIN XML) YA QUE EL CODIGOCARPETA PUEDE TENER DIFERENTES ID}
                       SQL.Add(Format('SELECT idCaja, idCarpeta, 0 AS idFolio FROM %s.Carpeta ', [DMConexion.Esquema]));
                       SQL.Add('          WHERE CodigoCarpeta =:Codigo AND Habilitado = TRUE ');
                       SQL.Add(Format('         AND idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 5) ',[DMConexion.Esquema]));
                     end;
                 2 : begin
                       SQL.Add(Format('SELECT idCaja, CR.idCarpeta, idFolio FROM %s.Carpeta CR',[DMConexion.Esquema]));
                       SQL.Add(Format('INNER JOIN %s.CarpetaAleta CA ON (CA.idCarpeta = CR.idCarpeta)',[DMConexion.Esquema]));
                       SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CA.idCarpetaAleta) WHERE CodigoFolio =:Codigo AND FO.Habilitado = TRUE',[DMConexion.Esquema]));
                     end;
         end;
         ParamByName('Codigo').AsString := CodigoBusqueda;
         Open;
         cdsBuscarCodigo.Close;
         cdsBuscarCodigo.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsBuscarCodigo.Append;
               cdsBuscarCodigo.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
               cdsBuscarCodigo.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
               cdsBuscarCodigo.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
               Next;
             until Eof;
         end else
            cdsBuscarCodigo.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.BuscarCaja. FuenteError :' + E.Message);
  end;
end;

function TDMGeneradorXML.CarpetasCaptura (Codigo : string; Tipo : integer): integer;
begin
  BuscarCodigo(Codigo, Tipo);
  Result := 0;
  try
    with ZQCarpetasCaptura do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT CA.idCarpeta, CA.idSerieDocumental, idCaja, SecuenciaCarpeta, CodigoCarpeta, idTipoSerieDocumental FROM %s.Carpeta CA ',[DMConexion.Esquema]));
         case Tipo of
                0 : begin
                       SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CA.idSerieDocumental) WHERE idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 5) AND idCaja =:idCaja AND CA.Habilitado = TRUE ORDER BY 1',[DMConexion.Esquema,DMConexion.Esquema]));
                       ParamByName('idCaja').AsInteger := cdsBuscarCodigo.FieldByName('idCaja').AsInteger;
                    end;
                1 : begin
                      SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CA.idSerieDocumental) WHERE idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 5) AND idCarpeta =:idCarpeta AND CA.Habilitado = TRUE ORDER BY 1',[DMConexion.Esquema,DMConexion.Esquema]));
                      ParamByName('idCarpeta').AsInteger := cdsBuscarCodigo.FieldByName('idCarpeta').AsInteger;
                    end;
                2 : begin
                      SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CA.idSerieDocumental)',[DMConexion.Esquema]));
                      SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CA.idCarpeta)',[DMConexion.Esquema]));
                      SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CAL.idCarpetaAleta)',[DMConexion.Esquema]));
                      SQL.Add(Format('WHERE idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 6) AND idFolio =:idFolio AND CA.Habilitado = TRUE ORDER BY 1',[DMConexion.Esquema]));
                      ParamByName('idFolio').AsInteger := cdsBuscarCodigo.FieldByName('idFolio').AsInteger;
                    end;
         end;
         Open;
         cdsCarpetasCaptura.Close;
         cdsCarpetasCaptura.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsCarpetasCaptura.Append;
               cdsCarpetasCaptura.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
               cdsCarpetasCaptura.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
               cdsCarpetasCaptura.FieldByName('idTipoSerieDocumental').AsInteger := FieldByName('idTipoSerieDocumental').AsInteger;
               cdsCarpetasCaptura.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
               cdsCarpetasCaptura.FieldByName('SecuenciaCarpeta').AsString := FieldByName('SecuenciaCarpeta').AsString;
               cdsCarpetasCaptura.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
               Next;
             until Eof;
             cdsCarpetasCaptura.First;
         end else
            cdsCarpetasCaptura.EmptyDataSet;
         Result := RecordCount;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.CarpetasCaptura. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.DatosPersona(idFolio: integer);
begin
  try
    with ZQDatosPersona do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT DISTINCT PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido',[DMConexion.Esquema]));
         SQL.Add(Format('FROM %s.FolioIdentificacion FI',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Identificacion ID ON (ID.idIdentificacion = FI.idIdentificacion)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Persona PE ON (PE.idPersona = ID.idPersona)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion) WHERE idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         cdsDatosPersona.Close;
         cdsDatosPersona.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsDatosPersona.Append;
             cdsDatosPersona.FieldByName('PrimerNombre').AsString := FieldByName('PrimerNombre').AsString;
             cdsDatosPersona.FieldByName('SegundoNombre').AsString := FieldByName('SegundoNombre').AsString;
             cdsDatosPersona.FieldByName('PrimerApellido').AsString := FieldByName('PrimerApellido').AsString;
             cdsDatosPersona.FieldByName('SegundoApellido').AsString := FieldByName('SegundoApellido').AsString;
        end else
            cdsDatosPersona.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.DatosPersona. FuenteError :' + E.Message);
  end;
end;

function TDMGeneradorXML.FolioIndexacion(idFolio: integer): boolean;
begin
  Result := False;
  try
    with ZQFolioIndexacion do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT MAX (FI.Fecha) AS FechaFolio FROM %s.Folio FO',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.FolioIdentificacion FI ON (FI.idFolio = FO.idFolio) WHERE FO.idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         cdsFolioIndexacion.Close;
         cdsFolioIndexacion.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsFolioIndexacion.Append;
             cdsFolioIndexacion.FieldByName('FechaFolio').AsDateTime := FieldByName('FechaFolio').AsDateTime;
             Result := True;
         end else
            cdsFolioIndexacion.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.FolioIndexacion. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.FoliosXML (idTipoSerieDocumental, Tipo : integer);
begin
  try
    with ZQFoliosXML do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT SD.idSerieDocumental, DescripcionSerieDocumental,  SSD.idSubSerieDocumental, DescripcionSubSerieDocumental, CodigoCarpeta, CodigoCarpetaAleta, MAX (Version) AS Version, IM.Fecha AS FechaImagen,');
         SQL.Add('CantidadFolios, idFlujo, FO.idFolio, SecuenciaFolio, CodigoFolio, ipPublicacion, Densidad, FechaNomina, FO.Fecha AS FechaFolio, TamanoBytes, RutaFTP, NombreImagen, ObraCivil, Capturable');
         if idTipoSerieDocumental = 3 then
           SQL.Add(', PeriodoCotizacion, DescripcionFondo');
         SQL.Add(Format('FROM %s.SerieSubSerie SSS',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = SSS.idSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SSS.idSubSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CA ON (CA.idSerieSubSerie = SSS.idSerieSubSerie)',[DMConexion.Esquema]));
         if Tipo <> 2 then
           SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCarpeta = CA.idCarpeta AND idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 5))',[DMConexion.Esquema,DMConexion.Esquema]))
         else
           SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCarpeta = CA.idCarpeta AND idFlujo IN (SELECT idFlujo FROM %s.Flujo WHERE idTareaProxima = 6))',[DMConexion.Esquema,DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CA.idCarpetaAleta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Imagen IM ON (IM.idFolio = FO.idFolio)',[DMConexion.Esquema]));
         SQL.Add(Format('LEFT JOIN %s.DatoPlanilla DP ON (DP.idDatoPlanilla = FO.idDatoPlanilla)',[DMConexion.Esquema]));
         if idTipoSerieDocumental = 3 then
           begin
             SQL.Add(Format('LEFT JOIN %s.Fondo FN ON (FN.idFondo = DP.idFondo)',[DMConexion.Esquema]));
             SQL.Add(Format('LEFT JOIN %s.TipoFondo TF ON (TF.idTipoFondo = FN.idTipoFondo)',[DMConexion.Esquema]));
         end;
         case Tipo of
                 0 : SQL.Add('WHERE idTipoSerieDocumental =:idTipoSerieDocumental AND idCaja =:idCaja');
                 1 : SQL.Add('WHERE idTipoSerieDocumental =:idTipoSerieDocumental AND CR.idCarpeta =:idCarpeta');
                 2 : SQL.Add('WHERE idTipoSerieDocumental =:idTipoSerieDocumental AND FO.idFolio =:idFolio');
         end;
         SQL.Add('GROUP BY SD.idSerieDocumental, SSD.idSubSerieDocumental, CR.CodigoCarpeta, CA.CodigoCarpetaAleta, CA.CantidadFolios, CR.idFlujo, FO.idFolio, IM.ipPublicacion,');
         if idTipoSerieDocumental = 3 then
           SQL.Add('IM.Densidad, DP.FechaNomina, IM.TamanoBytes, IM.RutaFTP, IM.NombreImagen, PeriodoCotizacion, DescripcionFondo, IM.Fecha, ObraCivil ORDER BY CodigoCarpeta, SecuenciaFolio')
         else
           SQL.Add('IM.Densidad, DP.FechaNomina, IM.TamanoBytes, IM.RutaFTP, IM.NombreImagen, IM.Fecha, ObraCivil ORDER BY CodigoCarpeta, SecuenciaFolio');
         ParamByName('idTipoSerieDocumental').AsInteger := idTipoSerieDocumental;
         case Tipo of
                 0 : ParamByName('idCaja').AsInteger := cdsBuscarCodigo.FieldByName('idCaja').AsInteger;
                 1 : ParamByName('idCarpeta').AsInteger := cdsBuscarCodigo.FieldByName('idCarpeta').AsInteger;
                 2 : ParamByName('idFolio').AsInteger := cdsBuscarCodigo.FieldByName('idFolio').AsInteger;
         end;
         Open;

         cdsFoliosXML.Close;
         cdsFoliosXML.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsFoliosXML.Append;
               cdsFoliosXML.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
               cdsFoliosXML.FieldByName('idSubSerieDocumental').AsInteger := FieldByName('idSubSerieDocumental').AsInteger;
               cdsFoliosXML.FieldByName('TotalFolios').AsInteger := ZQFoliosXML.RecordCount;
               cdsFoliosXML.FieldByName('DescripcionSerieDocumental').AsString := FieldByName('DescripcionSerieDocumental').AsString;
               cdsFoliosXML.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
               cdsFoliosXML.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
               cdsFoliosXML.FieldByName('CodigoCarpetaAleta').AsString := FieldByName('CodigoCarpetaAleta').AsString;
               cdsFoliosXML.FieldByName('CodigoFolio').AsString := FieldByName('CodigoFolio').AsString;
               cdsFoliosXML.FieldByName('CantidadFolios').AsInteger := FieldByName('CantidadFolios').AsInteger;
               cdsFoliosXML.FieldByName('idFlujo').AsInteger := FieldByName('idFlujo').AsInteger;
               cdsFoliosXML.FieldByName('idFolio').AsInteger := FieldByName('idFolio').AsInteger;
               cdsFoliosXML.FieldByName('SecuenciaFolio').AsInteger := FieldByName('SecuenciaFolio').AsInteger;
               cdsFoliosXML.FieldByName('Densidad').AsInteger := FieldByName('Densidad').AsInteger;
               cdsFoliosXML.FieldByName('ipPublicacion').AsString := FieldByName('ipPublicacion').AsString;
               cdsFoliosXML.FieldByName('FechaNomina').AsDateTime := FieldByName('FechaNomina').AsDateTime;
               cdsFoliosXML.FieldByName('FechaFolio').AsDateTime := FieldByName('FechaFolio').AsDateTime;
               cdsFoliosXML.FieldByName('TamanoBytes').AsInteger := FieldByName('TamanoBytes').AsInteger;
               cdsFoliosXML.FieldByName('RutaFTP').AsString := FieldByName('RutaFTP').AsString;
               cdsFoliosXML.FieldByName('NombreImagen').AsString := FieldByName('NombreImagen').AsString;
               cdsFoliosXML.FieldByName('FechaImagen').AsDateTime := FieldByName('FechaImagen').AsDateTime;
               cdsFoliosXML.FieldByName('Capturable').AsBoolean := FieldByName('Capturable').AsBoolean;
               case FieldByName('idSerieDocumental').AsInteger of
                        3,4        : cdsFoliosXML.FieldByName('ObraCivil').AsBoolean := FieldByName('ObraCivil').AsBoolean;

               end;

               if idTipoSerieDocumental = 3 then
                 begin
                   cdsFoliosXML.FieldByName('PeriodoCotizacion').AsDateTime := FieldByName('PeriodoCotizacion').AsDateTime;
                   cdsFoliosXML.FieldByName('DescripcionFondo').AsString := FieldByName('DescripcionFondo').AsString;
               end;
               Next;
             until Eof;
             cdsFoliosXML.First;
         end else
            cdsFoliosXML.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.FoliosXML. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.PlanillaIndices(idFolio, idTipoSerieDocumental : integer);
begin
  try
    with ZQPlanillaIndices do
       begin
          Close;
          SQL.Clear;
          Case idTipoSerieDocumental of
                     1 : begin
                           SQL.Add(Format('SELECT DISTINCT NumeroDocumento, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, DescripcionTipoIdentificacion, TI.idTipoIdentificacion, MIN (FI.Fecha) AS FechaCaptura FROM %s.FolioIdentificacion FI',[DMConexion.Esquema]));
                           {SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idFolio = FI.idFolio)',[DMConexion.Esquema]));
                           SQL.Add(Format('INNER JOIN %s.CarpetaAleta CL On (CL.idCarpetaAleta = FO.idCarpetaAleta)',[DMConexion.Esquema]));
                           SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCarpeta = CL.idCarpeta AND idSerieDocumental IN (3,4))',[DMConexion.Esquema]));}
                         end;
                     2 : SQL.Add(Format('SELECT NumeroDocumento, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, DescripcionTipoIdentificacion, TI.idTipoIdentificacion FROM %s.FolioIdentificacion FI',[DMConexion.Esquema]));
                     3 : SQL.Add(Format('SELECT NumeroDocumento, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, DescripcionTipoIdentificacion, PeriodoCotizacion, DescripcionFondo, FechaNomina, FechaPago FROM %s.FolioIdentificacion FI',[DMConexion.Esquema]));
          end;
          SQL.Add(Format('INNER JOIN %s.Identificacion ID ON (ID.idIdentificacion = FI.idIdentificacion)',[DMConexion.Esquema]));
          SQL.Add(Format('INNER JOIN %s.Persona PE ON (PE.idPersona = ID.idPersona)',[DMConexion.Esquema]));
          case idTipoSerieDocumental  of
                     1 : SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion) WHERE PrimerNombre =:PrimerNombre AND SegundoNombre =:SegundoNombre AND PrimerApellido =:PrimerApellido AND SegundoApellido =:SegundoApellido',[DMConexion.Esquema]));
                     2 : SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion) WHERE idFolio =:idFolio',[DMConexion.Esquema]));
                     3 : begin
                            SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion)',[DMConexion.Esquema]));
                            SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idFolio = FI.idFolio)',[DMConexion.Esquema]));
                            SQL.Add(Format('INNER JOIN %s.DatoPlanilla DP ON (DP.idDatoPlanilla = FO.idDatoPlanilla)',[DMConexion.Esquema]));
                            SQL.Add(Format('INNER JOIN %s.Fondo FN ON (FN.idFondo = DP.idFondo)',[DMConexion.Esquema]));
                            SQL.Add(Format('INNER JOIN %s.TipoFondo TF ON (TF.idTipoFondo = FN.idTipoFondo) WHERE FO.idFolio =:idFolio',[DMConexion.Esquema]));
                         end;
          end;
          case idTipoSerieDocumental of
                     1 : begin
                           SQL.Add('GROUP BY  NumeroDocumento, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, DescripcionTipoIdentificacion, TI.idTipoIdentificacion ORDER BY FechaCaptura ASC');
                           ParamByName('PrimerNombre').AsString := cdsDatosPersona.FieldByName('PrimerNombre').AsString;
                           ParamByName('SegundoNombre').AsString := cdsDatosPersona.FieldByName('SegundoNombre').AsString;
                           ParamByName('PrimerApellido').AsString := cdsDatosPersona.FieldByName('PrimerApellido').AsString;
                           ParamByName('SegundoApellido').AsString := cdsDatosPersona.FieldByName('SegundoApellido').AsString;
                         end;
                 2 , 3 : ParamByName('idFolio').AsInteger := idFolio;
          end;
          Open;
          cdsPlanillaIndices.Close;
          cdsPlanillaIndices.CreateDataSet;
          if NOT IsEmpty then
            begin
              First;
              repeat
                cdsPlanillaIndices.Append;
                cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString := FieldByName('NumeroDocumento').AsString;
                if idTipoSerieDocumental <> 3 then
                  cdsPlanillaIndices.FieldByName('idTipoIdentificacion').AsInteger := FieldByName('idTipoIdentificacion').AsInteger;
                cdsPlanillaIndices.FieldByName('DescripcionTipoIdentificacion').AsString := FieldByName('DescripcionTipoIdentificacion').AsString;
                cdsPlanillaIndices.FieldByName('PrimerNombre').AsString := FieldByName('PrimerNombre').AsString;
                cdsPlanillaIndices.FieldByName('SegundoNombre').AsString := FieldByName('SegundoNombre').AsString;
                cdsPlanillaIndices.FieldByName('PrimerApellido').AsString := FieldByName('PrimerApellido').AsString;
                cdsPlanillaIndices.FieldByName('SegundoApellido').AsString := FieldByName('SegundoApellido').AsString;
                if idTipoSerieDocumental = 3 then
                  begin
                    cdsPlanillaIndices.FieldByName('PeriodoCotizacion').AsDateTime := FieldByName('PeriodoCotizacion').AsDateTime;
                    cdsPlanillaIndices.FieldByName('DescripcionFondo').AsString := FieldByName('DescripcionFondo').AsString;
                    cdsPlanillaIndices.FieldByName('FechaNomina').AsDateTime := FieldByName('FechaNomina').AsDateTime;
                    cdsPlanillaIndices.FieldByName('FechaPago').AsDateTime := FieldByName('FechaPago').AsDateTime;
                end;
                Next;
              until Eof;
              cdsPlanillaIndices.First;
          end else
              cdsPlanillaIndices.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.FoliosXML. FuenteError :' + E.Message);
  end;
end;

procedure TDMGeneradorXML.TiposIdentificacion(idFolio: integer);
begin
  try
    with ZQTiposIdentificacion do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT DescripcionTipoIdentificacion, NumeroDocumento FROM %s.Folio FO',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.FolioIdentificacion FI ON (FI.idFolio = FO.idFolio)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Identificacion ID ON (ID.idIdentificacion = FI.idIdentificacion)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion AND TI.idTipoIdentificacion <>:idTipoIdentificacion) WHERE FO.idFolio =:idFolio',[DMConexion.Esquema]));
         ParamByName('idTipoIdentificacion').AsInteger := cdsPlanillaIndices.FieldByName('idTipoIdentificacion').AsInteger;
         ParamByName('idFolio').AsInteger := idFolio;
         Open;
         cdsTiposIdentificacion.Close;
         cdsTiposIdentificacion.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsTiposIdentificacion.Append;
               cdsTiposIdentificacion.FieldByName('DescripcionTipoIdentificacion').AsString := FieldByName('DescripcionTipoIdentificacion').AsString;
               cdsTiposIdentificacion.FieldByName('NumeroDocumento').AsString := FieldByName('NumeroDocumento').AsString;
               Next;
             until Eof;
             cdsTiposIdentificacion.First;
         end else
            cdsTiposIdentificacion.EmptyDataSet;
    end;
  except
    on E : Exception do
      raise Exception.Create('Error TDMGeneradorXML.TiposIdentificacion. FuenteError :' + E.Message);
  end;

end;

end.