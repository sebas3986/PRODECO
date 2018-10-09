unit UDMRecepcion;

interface

uses
  System.SysUtils, System.Classes,  Data.DB, Datasnap.Provider, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass, frxDBSet, frxExportPDF,
  frxBarcode,
  UGlobales, UDMConexion, FPGenerales, strUtils;
type
  TDMRecepcion = class(TDataModule)
    ZQSerieDocumental: TZQuery;
    cdsSerieDocumental: TClientDataSet;
    dspSerieDocumental: TDataSetProvider;
    dsSerieDocumental: TDataSource;
    strngfldSerieDocumentaldescripcionseriedocumental: TStringField;
    intgrfldSerieDocumentalidSerieDocumental: TIntegerField;
    ZQCaja: TZQuery;
    ZQSubSerie: TZQuery;
    dsSubSerie: TDataSource;
    cdsSubSerie: TClientDataSet;
    dspSubSerie: TDataSetProvider;
    intgrfldSubSerieidSerieSubSerie: TIntegerField;
    intgrfldSubSerieidTipoCarpeta: TIntegerField;
    intgrfldSubSerieidSerieDocumental: TIntegerField;
    strngfldSubSerieDescripcionTipoCarpeta: TStringField;
    intgrfldSubSerieidSubSerieDocumental: TIntegerField;
    cdsCaja: TClientDataSet;
    dsCaja: TDataSource;
    dspCaja: TDataSetProvider;
    intgrfldCajaidCaja: TIntegerField;
    strngfldCajaCodigoCaja: TStringField;
    strngfldCajaPrecintoUno: TStringField;
    strngfldCajaPrecintoDos: TStringField;
    ZQCarpeta: TZQuery;
    dsCarpeta: TDataSource;
    cdsCarpeta: TClientDataSet;
    dspCarpeta: TDataSetProvider;
    intgrfldCarpetaidCarpeta: TIntegerField;
    intgrfldCarpetaSecuenciaCarpeta: TIntegerField;
    strngfldCarpetaCodigoCarpeta: TStringField;
    ZQCarpetaAleta: TZQuery;
    dsCarpetaAleta: TDataSource;
    cdsCarpetaAleta: TClientDataSet;
    dspCarpetaAleta: TDataSetProvider;
    dsCarpetasRadicadas: TDataSource;
    cdsCarpetasRadicadas: TClientDataSet;
    dspCarpetasRadicadas: TDataSetProvider;
    ZQCarpetasRadicadas: TZQuery;
    intgrfldCarpetasRadicadasTotalFolios: TIntegerField;
    intgrfldCarpetasRadicadasidCaja: TIntegerField;
    intgrfldCarpetasRadicadasidCarpeta: TIntegerField;
    strngfldCarpetasRadicadasCodigoCaja: TStringField;
    strngfldCarpetasRadicadasCodigoCarpeta: TStringField;
    cdsCarpetasRadicadasObraCivil: TBooleanField;
    cdsCajaCerrada: TBooleanField;
    ZQCantidadFolios: TZQuery;
    dsCantidadFolios: TDataSource;
    cdsCantidadFolios: TClientDataSet;
    dspCantidadFolios: TDataSetProvider;
    intgrfldCantidadFoliosTotalFolios: TIntegerField;
    fdbSticker: TfrxDBDataset;
    frxSticker: TfrxReport;
    strngfldCajaCodigoMCaja: TStringField;
    fdbCarpeta: TfrxDBDataset;
    frxCarpeta: TfrxReport;
    strngfldCarpetaCodigoMCarpeta: TStringField;
    frxCarpetaAleta: TfrxReport;
    intgrfldCarpetaAletaidCarpeta: TIntegerField;
    intgrfldCarpetaAletaidSerieSubSerie: TIntegerField;
    strngfldCarpetaAletaCodigoCarpetaAleta: TStringField;
    intgrfldCarpetaAletaCantidadFolios: TIntegerField;
    strngfldCarpetaAletaCodigoMCarpetaAleta: TStringField;
    ZQSerieSubSerie: TZQuery;
    dsSerieSubSerie: TDataSource;
    dspSerieSubSerie: TDataSetProvider;
    cdsSerieSubSerie: TClientDataSet;
    intgrfldSerieSubSerieidSerieSubSerie: TIntegerField;
    intgrfldSerieSubSerieidSerieDocumental: TIntegerField;
    intgrfldSerieSubSerieidSubSerieDocumental: TIntegerField;
    intgrfldSerieSubSerieOrden: TIntegerField;
    strngfldSerieSubSerieDescripcionSubSerieDocumental: TStringField;
    fdbSerieSubSerie: TfrxDBDataset;
    strngfldSerieSubSerieCodigoMCarpetaAleta: TStringField;
    ZQStickerCaja: TZQuery;
    dsStickerCaja: TDataSource;
    cdsStickerCaja: TClientDataSet;
    dspStickerCaja: TDataSetProvider;
    strngfldStickerCajaPrecintoUno: TStringField;
    strngfldStickerCajaCodigoMCaja: TStringField;
    fdbSerieDocumental: TfrxDBDataset;
    fdbCarpetasRadicadas: TfrxDBDataset;
    frxActaRelevo: TfrxReport;
    fpdfExportar: TfrxPDFExport;
    ZQTotales: TZQuery;
    dsTotales: TDataSource;
    dspTotales: TDataSetProvider;
    cdsTotales: TClientDataSet;
    intgrfldTotalesToalCarpetas: TIntegerField;
    intgrfldTotalesTotalFolios: TIntegerField;
    fdbTotales: TfrxDBDataset;
    strngfldCarpetasRadicadasPrecintoUno: TStringField;
    strngfldCarpetasRadicadasPrecintoDos: TStringField;
    cdsCajaFecha: TDateTimeField;
    cdsCarpetasRadicadasFecha: TDateTimeField;
    strngfldSerieDocumentalDescripcionTipoSerieDocumental: TStringField;
    intgrfldSubSerieCantidadDivisiones: TIntegerField;
    ZQBuscarCarpeta: TZQuery;
    dsBuscarCarpeta: TDataSource;
    cdsBuscarCarpeta: TClientDataSet;
    dspBuscarCarpeta: TDataSetProvider;
    cdsBuscarCarpetaidCaja: TIntegerField;
    cdsBuscarCarpetaidSerieDocumental: TIntegerField;
    cdsBuscarCarpetaDescripcionSerieDocumental: TStringField;
    cdsBuscarCarpetaCodigoCarpeta: TStringField;
    cdsBuscarCarpetaNonmbresApellidos: TStringField;
    cdsBuscarCarpetaNumeroDocumento: TStringField;
    cdsBuscarCarpetaidTipoIdentificacion: TIntegerField;
    cdsBuscarCarpetaDescripcionTipoIdentificacion: TStringField;
    cdsBuscarCarpetaidTipoCarpeta: TIntegerField;
    cdsBuscarCarpetaSecuenciaCarpeta: TIntegerField;
    cdsBuscarCarpetaFoliada: TBooleanField;
    ZQValidarProceso: TZQuery;
    cdsSerieSubSerieCodigoMCarpetaAletaI: TStringField;
    cdsCarpetaSecuenciaClase: TIntegerField;
    cdsCarpetaClaseCarpeta: TStringField;
    cdsCarpetaidSerieDocumental: TIntegerField;
    cdsSubSerieDescripcionSubSerieDocumental: TStringField;
    cdsSubSerieCantidad: TIntegerField;
    cdsBuscarCarpetaCerrada: TBooleanField;
    ZQCarpetaCerrada: TZQuery;
    ZQFolio: TZQuery;
    ZQBuscarCodPreImpreso: TZQuery;
    cdsCajacodPreImpreso: TStringField;
    cdsCarpetasRadicadascodPreimpreso: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SerieDocumental (idSerieDocumental : integer);
    function InsertarCaja (PrecintoUno, PrecintoDos : string) : string;
    procedure InsertarCarpeta (idCaja, idSerieDocumental : integer; Foliada : boolean; CodigoCaja : string);
    procedure InsertarCarpetaAleta (idCarpeta, idSubSerieDocumental, CantidadFolios : integer; CodigoCarpeta :string);
    procedure ActualizarCarpeta (idCarpeta : integer; ObraCivil, Insercion : boolean;codPreimpreso :String = '');
    procedure CerrarCaja (idCaja : integer; codPreimpreso:String);
    function BuscarCaja (Parametro : integer; Precinto : string) : integer;
    function BuscarCarpeta (idCaja, idCarpeta, Criterio : integer; CodigoCarpeta : string) : boolean;
    procedure BuscarCarpetaAleta (idCarpeta, idSerieSubSerie : integer);
    function SubSerieDocumental (idTipoCarpeta, idSerieDocumental : integer) : integer;
    function BuscarSerieSubSerie (idSerieSubSerie, Criterio : integer; Carpeta : string) : boolean;
    function BuscarStickerCaja (Precinto : string) : boolean;
    procedure CarpetasRadicadas (idCaja : integer);
    procedure FoliosCaja (idCaja : integer);
    function ImprimirStickerCaja (Precinto : string) : boolean;
    function ImprimirStickerCarpeta (idCaja, idCarpeta, Criterio : integer; CodigoCarpeta : string) : boolean;
    function ImprimirStickerCarpetaAleta (idSerieSubSerie, Criterio : integer; Carpeta : string) : boolean;
    function ImprimirActaRelevo : boolean;
    procedure Totales (Caja : string);
    function BuscarCarpetasPersona (NumeroDocumento : string) : Boolean;
    function CarpetaInsercion (idCaja, idSeriedocumental, SecuenciaCarpeta : Integer; CodigoCarpeta : string; Foliada : boolean) : integer;
    function ValidarProcesInsercion (CodigoCarpeta : string) : integer;
    function CarpetaCerrada (CodigoCarpeta : string) : Boolean;
    //Sebastian Camacho 27/09/2018
    procedure AgregarFolio(idCarpetaAleta: Integer; idPreImpreso:Word);
    function BuscarCodPreimpreso (CodigoPreimpreso: string; Parametro: Word ): boolean;
    var
      ListaPreImpresos    : TStringList;
  end;

var
  DMRecepcion: TDMRecepcion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRecepcion }

procedure TDMRecepcion.ActualizarCarpeta(idCarpeta: integer; ObraCivil, Insercion  : boolean; codPreimpreso :String = '');
begin
  try
    if NOT Insercion then
      begin
        with ZQCarpeta do
           begin
             Close;
             SQL.Clear;
             if codPreimpreso <> '' then
             begin
               SQL.Add(Format('UPDATE %s.Carpeta SET Cerrada = True, ObraCivil =:ObraCivil, codpreimpreso =:codpreimpreso WHERE idCarpeta =:idCarpeta',[DMConexion.Esquema]));
               ParamByName('codpreimpreso').AsString := codPreimpreso;
             end
             else
               SQL.Add(Format('UPDATE %s.Carpeta SET Cerrada = True, ObraCivil =:ObraCivil WHERE idCarpeta =:idCarpeta',[DMConexion.Esquema]));
             ParamByName('idCarpeta').AsInteger := idCarpeta;
             ParamByName('ObraCivil').AsBoolean := ObraCivil;
             ExecSQL;
        end;
    end else
       begin
         with ZQCarpeta do
            begin
              Close;
              SQL.Clear;
              SQL.Add(Format('UPDATE %s.Carpeta SET Cerrada = True WHERE idCarpeta =:idCarpeta',[DMConexion.Esquema]));
              ParamByName('idCarpeta').AsInteger := idCarpeta;
              ExecSQL;
         end;
       end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.ActualizarCarpeta. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarCaja (Parametro : integer; Precinto : string) : integer;
begin
  try
    with ZQCaja do
       begin
         Close;
         SQL.Clear;
         case Parametro of
                  1 : SQL.Add(Format('SELECT idCaja, CodigoCaja, PrecintoUno, PrecintoDos, Cerrada, Fecha, codpreimpreso FROM %s.Caja WHERE PrecintoUno =:Precinto ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
                  2 : begin
                        SQL.Add(Format('SELECT idCaja, CodigoCaja, PrecintoUno, PrecintoDos, Cerrada, Fecha, codpreimpreso FROM %s.Caja WHERE PrecintoUno =:Precinto OR PrecintoDos =:Precinto',[DMConexion.Esquema]));
                        ParamByName('Precinto').AsString := Precinto;
                      end;
         end;
         Open;
         if NOT IsEmpty then
           begin
             cdsCaja.Close;
             cdsCaja.CreateDataSet;
             cdsCaja.Append;
             cdsCaja.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
             cdsCaja.FieldByName('CodigoCaja').AsString := FieldByName('CodigoCaja').AsString;
             cdsCaja.FieldByName('PrecintoUno').AsString := FieldByName('PrecintoUno').AsString;
             cdsCaja.FieldByName('PrecintoDos').AsString := FieldByName('PrecintoDos').AsString;
             cdsCaja.FieldByName('Cerrada').AsBoolean := FieldByName('Cerrada').AsBoolean;
             cdsCaja.FieldByName('CodigoMCaja').AsString := 'M'+FieldByName('CodigoCaja').AsString; //'M00001' +
             cdsCaja.FieldByName('Fecha').AsDateTime := FieldByName('Fecha').AsDateTime;
             cdsCaja.FieldByName('codpreimpreso').AsString := FieldByName('codpreimpreso').AsString;
             Result := FieldByName('idCaja').AsInteger;
         end else
             Result := -1;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarCaja. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarCarpeta(idCaja, idCarpeta, Criterio: integer; CodigoCarpeta : string) : boolean;
begin
  Result := False;
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         case Criterio of
                  1 : SQL.Add(Format('SELECT idCarpeta, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, SecuenciaClase, ClaseCarpeta FROM %s.Carpeta WHERE idCaja =:idCaja AND Cerrada = False ORDER BY 1 ASC',[DMConexion.Esquema]));
                  2 : SQL.Add(Format('SELECT idCarpeta, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, SecuenciaClase, ClaseCarpeta FROM %s.Carpeta WHERE idCaja =:idCaja AND Cerrada = True  ORDER BY 1 ASC',[DMConexion.Esquema]));
                  3 : SQL.Add(Format('SELECT idCarpeta, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, SecuenciaClase, ClaseCarpeta FROM %s.Carpeta WHERE CodigoCarpeta =:CodigoCarpeta AND ClaseCarpeta = ''C'' ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
                  4 : SQL.Add(Format('SELECT idCarpeta, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, SecuenciaClase, ClaseCarpeta FROM %s.Carpeta WHERE idCarpeta =:idCarpeta AND ClaseCarpeta = ''I'' ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
                  5 : SQL.Add(Format('SELECT idCarpeta, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, SecuenciaClase, ClaseCarpeta FROM %s.Carpeta WHERE CodigoCarpeta =:CodigoCarpeta AND ClaseCarpeta = ''I'' ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
         end;
         case Criterio of
               1, 2 : ParamByName('idCaja').AsInteger := idCaja;
               3, 5 : ParamByName('CodigoCarpeta').AsString := CodigoCarpeta;
                  4 : ParamByName('idCarpeta').AsInteger := idCarpeta;
         end;
         Open;
         cdsCarpeta.Close;
         cdsCarpeta.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsCarpeta.Close;
             cdsCarpeta.CreateDataSet;
             cdsCarpeta.Append;
             cdsCarpeta.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
             cdsCarpeta.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
             cdsCarpeta.FieldByName('SecuenciaCarpeta').AsInteger := FieldByName('SecuenciaCarpeta').AsInteger;
             cdsCarpeta.FieldByName('SecuenciaClase').AsInteger := FieldByName('SecuenciaClase').AsInteger;
             if Criterio = 4 then   //Para imprmir el sticker de inserci�n
               cdsCarpeta.FieldByName('CodigoMCarpeta').AsString := 'M'+FieldByName('CodigoCarpeta').AsString+' - I - '+IntToStr(FieldByName('SecuenciaClase').AsInteger)
             else
               cdsCarpeta.FieldByName('CodigoMCarpeta').AsString := 'M'+FieldByName('CodigoCarpeta').AsString;
             cdsCarpeta.FieldByName('ClaseCarpeta').AsString := FieldByName('ClaseCarpeta').AsString;
             cdsCarpeta.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
             if cdsCarpeta.FieldByName('idSerieDocumental').AsInteger <> 0 then
               SerieDocumental(cdsCarpeta.FieldByName('idSerieDocumental').AsInteger);
             idCarpetaB := FieldByName('idCarpeta').AsInteger;
             Result := True;
         end else
            cdsCarpeta.EmptyDataSet;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarCarpeta. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.BuscarCarpetaAleta(idCarpeta, idSerieSubSerie: integer);
begin
  try
    with ZQCarpetaAleta do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idCarpeta, CodigoCarpetaAleta, idSerieSubSerie, CantidadFolios FROM %s.CarpetaAleta WHERE idCarpeta =:idCarpeta AND idSerieSubSerie =:idSerieSubSerie AND Habilitado = True',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         ParamByName('idSerieSubSerie').AsInteger := idSerieSubSerie;
         Open;
         if NOT IsEmpty then
           begin
             cdsCarpetaAleta.Close;
             cdsCarpetaAleta.CreateDataSet;
             cdsCarpetaAleta.Append;
             cdsCarpetaAleta.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
             cdsCarpetaAleta.FieldByName('idSerieSubSerie').AsInteger := FieldByName('idSerieSubSerie').AsInteger;
             cdsCarpetaAleta.FieldByName('CantidadFolios').AsInteger := FieldByName('CantidadFolios').AsInteger;
             cdsCarpetaAleta.FieldByName('CodigoCarpetaAleta').AsString := FieldByName('CodigoCarpetaAleta').AsString;
             cdsCarpetaAleta.FieldByName('CodigoMCarpetaAleta').AsString := 'M'+FieldByName('CodigoCarpetaAleta').AsString;  //'M00001' +
         end else
            begin
              cdsCarpetaAleta.Close;
              cdsCarpetaAleta.CreateDataSet;
              cdsCarpetaAleta.EmptyDataSet;
            end;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarCarpetaAleta. FuenteError :' + E.Message);
  end;

end;

function TDMRecepcion.BuscarCarpetasPersona(NumeroDocumento: string): Boolean;
begin
  Result := False;
  try
    with ZQBuscarCarpeta do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT idCaja, SD.idSerieDocumental, SSS.idTipoCarpeta, DescripcionSerieDocumental, CodigoCarpeta, PrimerNombre||'' ''||SegundoNombre||'' ''||PrimerApellido||'' ''||SegundoApellido AS NonmbresApellidos,');
        SQL.Add('NumeroDocumento, TI.idTipoIdentificacion, DescripcionTipoIdentificacion, SecuenciaCarpeta, Foliada, Cerrada');
        SQL.Add(Format('FROM %s.Carpeta CR',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.CarpetaAleta CL ON (CL.idCarpeta = CR.idCarpeta)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.SerieSubSerie SSS ON (SSS.idSerieSubSerie = CL.idSerieSubSerie)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.TipoCarpeta TC ON (TC.idTipoCarpeta = SSS.idTipoCarpeta)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.Folio FO ON (FO.idCarpetaAleta = CL.idCarpetaAleta)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.FolioIdentificacion FI ON (FI.idFolio = FO.idFolio)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.Identificacion ID ON (ID.idIdentificacion = FI.idIdentificacion)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.Persona PE ON (PE.idPersona= ID.idPersona)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.TipoIdentificacion TI ON (TI.idTipoIdentificacion = ID.idTipoIdentificacion)',[DMConexion.Esquema]));
        SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = CR.idSerieDocumental AND SD.idSerieDocumental IN (3,4,8,9)) WHERE NumeroDocumento =:NumeroDocumento',[DMConexion.Esquema]));
        ParamByName('NumeroDocumento').AsString := NumeroDocumento;
        Open;
        cdsBuscarCarpeta.Close;
        cdsBuscarCarpeta.CreateDataSet;
        if NOT IsEmpty then
          begin
            First;
            repeat
              cdsBuscarCarpeta.Append;
              cdsBuscarCarpeta.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
              cdsBuscarCarpeta.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
              cdsBuscarCarpeta.FieldByName('idTipoCarpeta').AsInteger := FieldByName('idTipoCarpeta').AsInteger;
              cdsBuscarCarpeta.FieldByName('SecuenciaCarpeta').AsInteger := FieldByName('SecuenciaCarpeta').AsInteger;
              cdsBuscarCarpeta.FieldByName('Foliada').AsBoolean := FieldByName('Foliada').AsBoolean;
              cdsBuscarCarpeta.FieldByName('DescripcionSerieDocumental').AsString := FieldByName('DescripcionSerieDocumental').AsString;
              cdsBuscarCarpeta.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
              cdsBuscarCarpeta.FieldByName('NonmbresApellidos').AsString := FieldByName('NonmbresApellidos').AsString;
              cdsBuscarCarpeta.FieldByName('NumeroDocumento').AsString := FieldByName('NumeroDocumento').AsString;
              cdsBuscarCarpeta.FieldByName('DescripcionTipoIdentificacion').AsString := FieldByName('DescripcionTipoIdentificacion').AsString;
              cdsBuscarCarpeta.FieldByName('idTipoIdentificacion').AsInteger := FieldByName('idTipoIdentificacion').AsInteger;
              cdsBuscarCarpeta.FieldByName('Cerrada').AsBoolean := FieldByName('Cerrada').AsBoolean;
              Next;
            until Eof ;
            cdsBuscarCarpeta.Last;
            Result := True;
        end else
           cdsBuscarCarpeta.EmptyDataSet;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarCarpetasPersona. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarCodPreimpreso(CodigoPreimpreso: string; Parametro: Word ): boolean;
begin
  Result := False;
  try
    with ZQBuscarCodPreImpreso do
    begin
       Close;
       SQL.Clear;
       case Parametro of
         0 : SQL.Add(Format('SELECT codpreimpreso FROM %s.folio   WHERE codpreimpreso =:codpreimpreso ',[DMConexion.Esquema]));
         1 : SQL.Add(Format('SELECT codpreimpreso FROM %s.carpeta WHERE codpreimpreso =:codpreimpreso ',[DMConexion.Esquema]));
         2 : SQL.Add(Format('SELECT codpreimpreso FROM %s.caja    WHERE codpreimpreso =:codpreimpreso ',[DMConexion.Esquema]));
       end;
       ParamByName('codpreimpreso').AsString := CodigoPreimpreso;
       Open;
       if not IsEmpty then
         Result := True;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarCodPreimpreso. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarSerieSubSerie(idSerieSubSerie, Criterio : integer; Carpeta : string) : boolean;
begin
  Result := False;
  try
    with ZQSerieSubSerie do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT idSerieSubSerie, idSerieDocumental, SSD.idSubSerieDocumental, Orden, DescripcionSubSerieDocumental FROM %s.SerieSubSerie SSS',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SSS.idSubSerieDocumental AND SSS.Habilitado = TRUE AND SSD.Habilitado = TRUE) WHERE idSerieSubSerie =:idSerieSubSerie',[DMConexion.Esquema]));
         ParamByName('idSerieSubSerie').AsInteger := idSerieSubSerie;
         Open;
         cdsSerieSubSerie.Close;
         cdsSerieSubSerie.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsSerieSubSerie.Append;
             cdsSerieSubSerie.FieldByName('idSerieSubSerie').AsInteger := FieldByName('idSerieSubSerie').AsInteger;
             cdsSerieSubSerie.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
             cdsSerieSubSerie.FieldByName('idSubSerieDocumental').AsInteger := FieldByName('idSubSerieDocumental').AsInteger;
             cdsSerieSubSerie.FieldByName('Orden').AsInteger := FieldByName('Orden').AsInteger;
             cdsSerieSubSerie.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
             cdsSerieSubSerie.FieldByName('CodigoMCarpetaAleta').AsString := 'M'+Carpeta + LlenarCerosIzquierda('2', FieldByName('idSubSerieDocumental').AsInteger);  //Este es para la impresi�n del c�digo de barras
             if Criterio = 0 then
               cdsSerieSubSerie.FieldByName('CodigoMCarpetaAletaI').AsString := 'M'+Carpeta + LlenarCerosIzquierda('2', FieldByName('idSubSerieDocumental').AsInteger)   //Para visualizar el texto de c�digo de barras en creaci�n
             else
               cdsSerieSubSerie.FieldByName('CodigoMCarpetaAletaI').AsString := 'M'+Carpeta + LlenarCerosIzquierda('2', FieldByName('idSubSerieDocumental').AsInteger)+' - I - '+IntToStr(cdsCarpeta.FieldByName('SecuenciaClase').AsInteger);   //Para visualizar el texto de c�digo de barras en Inserci�n
             Result := True;
         end else
            cdsSerieSubSerie.EmptyDataSet;

    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.BuscarSerieSubSerie. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarStickerCaja (Precinto : string) : boolean;
begin
  Result := False;
  try
    with ZQStickerCaja do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format('SELECT PrecintoUno, CodigoCaja FROM %s.Caja WHERE PrecintoUno =:PrecintoUno',[DMConexion.Esquema]));
        ParamByName('PrecintoUno').AsString := Precinto;
        Open;
        if NOT IsEmpty then
          begin
            cdsStickerCaja.Close;
            cdsStickerCaja.CreateDataSet;
            cdsStickerCaja.Append;
            cdsStickerCaja.FieldByName('PrecintoUno').AsString := FieldByName('PrecintoUno').AsString;
            cdsStickerCaja.FieldByName('CodigoMCaja').AsString := 'M'+FieldByName('CodigoCaja').AsString;
            Result := True;
        end else
           begin
             cdsStickerCaja.Close;
             cdsStickerCaja.CreateDataSet;
             cdsStickerCaja.EmptyDataSet;
           end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.BuscarStickerCaja. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.CarpetaCerrada(CodigoCarpeta: string): Boolean;
begin
  Result := False;
  try
    with ZQCarpetaCerrada do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format('SELECT idCarpeta FROM %s.Carpeta WHERE CodigoCarpeta =:CodigoCarpeta AND Cerrada = FALSE ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
        ParamByName('CodigoCarpeta').AsString := CodigoCarpeta;
        Open;
        if NOT IsEmpty then
          Result  := True;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.CarpetaCerrada. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.CarpetaInsercion(idCaja, idSeriedocumental, SecuenciaCarpeta : Integer; CodigoCarpeta : string; Foliada : boolean): integer;
begin
  Result := 0;
  try
    with ZQCarpeta do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format('INSERT INTO %s.Carpeta (idCaja, idSerieDocumental, idFlujo, SecuenciaCarpeta, ClaseCarpeta, Usuario) VALUES (:idCaja, :idSerieDocumental, 1, :SecuenciaCarpeta, ''I'', :Usuario) RETURNING idCarpeta',[DMConexion.Esquema]));
        ParamByName('idCaja').AsInteger := idCaja;
        ParamByName('SecuenciaCarpeta').AsInteger := SecuenciaCarpeta;
        ParamByName('idSeriedocumental').AsInteger := idSeriedocumental;
        ParamByName('Usuario').AsString := ParamStr(1);
        Open;
        Result := FieldByName('idCarpeta').AsInteger;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.CarpetaInsercion. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.CarpetasRadicadas(idCaja : integer);
begin
  try
    with ZQCarpetasRadicadas do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT SUM (CantidadFolios) AS TotalFolios, CR.idCaja, CRA.idCarpeta, CodigoCaja, CodigoCarpeta, ObraCivil, PrecintoUno, PrecintoDos, CA.Fecha, CR.codpreimpreso FROM %s.Caja CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCaja = CA.idCaja AND CR.Habilitado = TRUE)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CRA ON (CRA.idCarpeta=CR.idCarpeta AND CRA.Habilitado=TRUE) WHERE CR.idCaja=:idCaja GROUP BY CR.idCaja,CRA.idCarpeta,CodigoCaja,CodigoCarpeta,ObraCivil,PrecintoUno,PrecintoDos,CA.Fecha,CR.codpreimpreso ORDER BY CRA.idCarpeta',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         Open;
         cdsCarpetasRadicadas.Close;
         cdsCarpetasRadicadas.CreateDataSet;
         if NOT IsEmpty then
           begin
             repeat
               cdsCarpetasRadicadas.Append;
               cdsCarpetasRadicadas.FieldByName('TotalFolios').AsInteger := FieldByName('TotalFolios').AsInteger;
               cdsCarpetasRadicadas.FieldByName('idCaja').AsInteger := FieldByName('idCaja').AsInteger;
               cdsCarpetasRadicadas.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
               cdsCarpetasRadicadas.FieldByName('CodigoCaja').AsString := FieldByName('CodigoCaja').AsString;
               cdsCarpetasRadicadas.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
               cdsCarpetasRadicadas.FieldByName('PrecintoUno').AsString := FieldByName('PrecintoUno').AsString;
               cdsCarpetasRadicadas.FieldByName('PrecintoDos').AsString := FieldByName('PrecintoDos').AsString;
               cdsCarpetasRadicadas.FieldByName('ObraCivil').AsBoolean := FieldByName('ObraCivil').AsBoolean;
               cdsCarpetasRadicadas.FieldByName('Fecha').AsDateTime := FieldByName('Fecha').AsDateTime;
               cdsCarpetasRadicadas.FieldByName('codPreimpreso').AsString := FieldByName('codPreimpreso').AsString;
               Next;
             until Eof;
         end else
             cdsCarpetasRadicadas.EmptyDataSet;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.CarpetasRadicadas. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.CerrarCaja(idCaja: integer; codPreimpreso:String);
begin
  try
    with ZQCaja do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Caja SET Cerrada = True, codpreimpreso = :codpreimpreso WHERE idCaja =:idCaja',[DMConexion.Esquema]));
         ParamByName('codpreimpreso').AsString := codPreimpreso;
         ParamByName('idCaja').AsInteger := idCaja;
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.CerrarCaja. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.DataModuleCreate(Sender: TObject);
begin
  ListaPreImpresos  := TStringList.Create;
  ListaPreImpresos.Duplicates:= dupIgnore;
  ListaPreImpresos.Sorted:=True;
end;

procedure TDMRecepcion.DataModuleDestroy(Sender: TObject);
begin
  ListaPreImpresos.Free;
end;

procedure TDMRecepcion.FoliosCaja(idCaja: integer);
begin
  try
    with ZQCantidadFolios do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT SUM (CantidadFolios) AS TotalFolios FROM %s.Caja CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCaja = CA.idCaja)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CRA ON (CRA.idCarpeta = CR.idCarpeta) WHERE CR.idCaja =:idCaja GROUP BY CR.idCaja ',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         Open;
         if NOT IsEmpty then
           begin
             cdsCantidadFolios.Close;
             cdsCantidadFolios.CreateDataSet;
             cdsCantidadFolios.Append;
             cdsCantidadFolios.FieldByName('TotalFolios').AsInteger := FieldByName('TotalFolios').AsInteger;
         end else
            begin
              cdsCantidadFolios.Close;
              cdsCantidadFolios.CreateDataSet;
              cdsCantidadFolios.EmptyDataSet;
            end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.FoliosCaja. FuenteError :' + E.Message);
  end;


end;

function TDMRecepcion.ImprimirActaRelevo : boolean;
begin
  frxActaRelevo.ShowReport;
end;

function TDMRecepcion.ImprimirStickerCaja (Precinto : string): boolean;
begin
  if BuscarStickerCaja(Precinto) then
    begin
      frxSticker.PrepareReport;
      frxSticker.Print;
  end;
end;

function TDMRecepcion.ImprimirStickerCarpeta(idCaja, idCarpeta, Criterio : integer; CodigoCarpeta : string): boolean;
begin
  if BuscarCarpeta(idCaja, idCarpeta,  Criterio, CodigoCarpeta) then
    begin
      frxCarpeta.PrepareReport;
      frxCarpeta.Print;
  end;
end;

function TDMRecepcion.ImprimirStickerCarpetaAleta(idSerieSubSerie, Criterio: integer; Carpeta : string): boolean;
begin
  if BuscarSerieSubSerie(idSerieSubSerie, Criterio, Carpeta) then
    begin
      frxCarpetaAleta.PrepareReport;
      frxCarpetaAleta.Print;
  end;
end;

function TDMRecepcion.InsertarCaja(PrecintoUno, PrecintoDos: string) : string;
var
  idCaja : integer;
begin
  try
    with ZQCaja do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.Caja (CodigoCaja, Usuario, PrecintoUno, PrecintoDos) VALUES (:CodigoCaja, :Usuario, :PrecintoUno, :PrecintoDos) RETURNING idCaja',[DMConexion.Esquema]));
         ParamByName('CodigoCaja').AsString := LlenarCerosIzquierda('4',0);
         ParamByName('Usuario').AsString := ParamStr(1);
         ParamByName('PrecintoUno').AsString := PrecintoUno;
         ParamByName('PrecintoDos').AsString := PrecintoDos;
         Open;
         idCaja := FieldByName('idCaja').AsInteger;
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Caja SET CodigoCaja =:CodigoCaja WHERE idCaja =:idCaja',[DMConexion.Esquema]));
         ParamByName('CodigoCaja').AsString := LlenarCerosIzquierda('4',idCaja);
         ParamByName('idCaja').AsInteger := idCaja;
         ExecSQL;
         Result := LlenarCerosIzquierda('4',idCaja);
    end;

  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.InsertarCaja. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.InsertarCarpeta(idCaja, idSerieDocumental: integer; Foliada: boolean; CodigoCaja : string);
var
  TotalCarpetas : integer;
begin
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT COUNT (DISTINCT idCarpeta) AS TotalCarpetas FROM %s.Caja CA ',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Carpeta CP ON (CP.idCaja = CA.idCaja) WHERE CA.idCaja =:idCaja',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         Open;
         TotalCarpetas := FieldByName('TotalCarpetas').AsInteger;
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.Carpeta (idCaja, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, idFlujo, Foliada, ClaseCarpeta, Usuario) VALUES (:idCaja, :idSerieDocumental, :SecuenciaCarpeta, :CodigoCarpeta, :idFlujo, :Foliada, ''C'', :Usuario)',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         ParamByName('idSerieDocumental').AsInteger := idSerieDocumental;
         ParamByName('SecuenciaCarpeta').AsInteger := TotalCarpetas + 1;
         ParamByName('idFlujo').AsInteger := 1;
         ParamByName('Foliada').AsBoolean := Foliada;
         ParamByName('Usuario').AsString := ParamStr(1);
         ExecSQL;
         BuscarCarpeta(idCaja, 0, 1,'');
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.InsertarCarpeta. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.InsertarCarpetaAleta(idCarpeta, idSubSerieDocumental, CantidadFolios: integer; CodigoCarpeta :string);
var
  I: Word;
begin
  try
    with ZQCarpetaAleta do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('INSERT INTO %s.CarpetaAleta (idCarpeta, idSerieSubSerie, CodigoCarpetaAleta, CantidadFolios, Usuario) VALUES (:idCarpeta, :idSerieSubSerie, :CodigoCarpetaAleta, :CantidadFolios, :Usuario)',[DMConexion.Esquema]));
      //Sebastian Camacho 27/09/2018
      SQL.Add('         RETURNING idcarpetaaleta');
      ParamByName('idCarpeta').AsInteger := idCarpeta;
      ParamByName('idSerieSubSerie').AsInteger := idSubSerieDocumental;
      ParamByName('CantidadFolios').AsInteger := CantidadFolios;
      ParamByName('CodigoCarpetaAleta').AsString := CodigoCarpeta+LlenarCerosIzquierda('2', cdsSubSerie.FieldByName('idSubSerieDocumental').AsInteger);
      ParamByName('Usuario').AsString := ParamStr(1);
      //Sebastian Camacho 27/09/2018
      //ExecSQL;
      open;
      if not IsEmpty then
      begin
        First;
        while not Eof do
        begin
          for I := 0 to CantidadFolios - 1 do
            AgregarFolio(FieldByName('idcarpetaaleta').AsInteger,I);
          Next
        end;
      end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.InsertarCarpetaAleta. FuenteError :' + E.Message);
  end;
end;

//Sebastian Camacho  27/09/2018
procedure TDMRecepcion.AgregarFolio(idCarpetaAleta: Integer; idPreImpreso:Word);
var
  TipoFoli :String;
begin

  try
    TipoFoli  := ifthen( cdsCarpeta.FieldByName('ClaseCarpeta').AsString = 'C','N','R')[1];
    with ZQFolio do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('INSERT INTO %s.FOLIO (idcarpetaaleta, tipofolio, chequeocalidad, usuario, codpreimpreso)',
                      [DMConexion.esquema]));
      SQL.Add(Format('  VALUES (%d,''%s'',''%s'',''%s'',''%s'')',[idCarpetaAleta,
                              TipoFoli,'FALSE',
                              Paramstr(1),ListaPreImpresos[idPreImpreso]]));
//      SQL.Add('         RETURNING idfolio, codigofolio');
      ExecSQL;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible insertar el Folio [' +  ListaPreImpresos[idPreImpreso] + ']. '
                              + #10#13 + '* '+ e.Message);
  end;
end;

procedure TDMRecepcion.SerieDocumental (idSerieDocumental : integer);
begin
  try
    with ZQSerieDocumental do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SEDO.idSerieDocumental, SEDO.DescripcionSerieDocumental, ');
      SQL.Add('       TISD.descripciontiposeriedocumental ');
      SQL.Add(Format('FROM %s.SerieDocumental SEDO ',[DMConexion.Esquema]));
      SQL.Add(Format('INNER JOIN %s.TipoSerieDocumental TISD ON '
                         + 'TISD.Idtiposeriedocumental = SEDO.Idtiposeriedocumental '
                         ,[DMConexion.Esquema]));
      SQL.Add('       WHERE SEDO.Habilitado  ');
      //Sebastian Camacho 20/09/2018 {Siempre se trabajara con la serie documental con id = 1 aportes pensionales}
      SQL.Add('       AND   SEDO.idseriedocumental = 1 ');
//      if idSerieDocumental <> 0 then
//        begin
//          SQL.Add('AND SEDO.idSerieDocumental =:idSerieDocumental');
//          ParamByName('idSerieDocumental').AsInteger := idSerieDocumental;
//      end;
      SQL.Add('       ORDER BY SEDO.DescripcionSerieDocumental');
      Open;
      if NOT IsEmpty then
       begin
         cdsSerieDocumental.Close;
         cdsSerieDocumental.CreateDataSet;
         repeat
           cdsSerieDocumental.Append;
           cdsSerieDocumental.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
           cdsSerieDocumental.FieldByName('DescripcionSerieDocumental').AsString := FieldByName('DescripcionSerieDocumental').AsString;
           cdsSerieDocumental.FieldByName('descripciontiposeriedocumental').AsString := FieldByName('descripciontiposeriedocumental').AsString;
           Next;
         until Eof;
      end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.SerieDocumental. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.SubSerieDocumental(idTipoCarpeta, idSerieDocumental: integer) : integer;
begin
  Result := 0;
  try
    with ZQSubSerie do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT idSerieSubSerie, TC.idTipoCarpeta, DescripcionTipoCarpeta, ');
         SQL.Add('TC.CantidadDivisiones, SD.idSerieDocumental, SSD.idSubSerieDocumental,');
         SQL.Add('SSD.DescripcionSubSerieDocumental ');
         SQL.Add(Format('FROM %s.SerieSubSerie SS',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.TipoCarpeta TC ON (TC.idTipoCarpeta = SS.idTipoCarpeta AND SS.idTipoCarpeta =:idTipoCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = SS.idSerieDocumental AND SD.idSerieDocumental =:idSerieDocumental )',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SS.idSubSerieDocumental) ORDER BY Orden',[DMConexion.Esquema]));
         ParamByName('idTipoCarpeta').AsInteger := idTipoCarpeta;
         ParamByName('idSerieDocumental').AsInteger := idSerieDocumental;
         Open;
         cdsSubSerie.Close;
         cdsSubSerie.CreateDataSet;
         if NOT IsEmpty then
           begin
             repeat
               cdsSubSerie.Append;
               cdsSubSerie.FieldByName('idSerieSubSerie').AsInteger := FieldByName('idSerieSubSerie').AsInteger;
               cdsSubSerie.FieldByName('idTipoCarpeta').AsInteger := FieldByName('idTipoCarpeta').AsInteger;
               cdsSubSerie.FieldByName('DescripcionTipoCarpeta').AsString := FieldByName('DescripcionTipoCarpeta').AsString;
               cdsSubSerie.FieldByName('CantidadDivisiones').AsInteger := FieldByName('CantidadDivisiones').AsInteger;
               cdsSubSerie.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
               cdsSubSerie.FieldByName('idSubSerieDocumental').AsInteger := FieldByName('idSubSerieDocumental').AsInteger;
               cdsSubSerie.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
               Next;
             until Eof;
             cdsSubSerie.First;
             Result := cdsSubSerie.RecordCount;
         end else
            cdsSubSerie.EmptyDataSet;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.SubSerieDocumental. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.Totales(Caja: string);
begin
  try
    with ZQTotales do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT COUNT (DISTINCT CR.idCarpeta) AS ToalCarpetas, SUM (CantidadFolios) AS TotalFolios  FROM %s.Caja CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCaja = CA.idCaja)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CR.idCArpeta) WHERE CodigoCaja =:CodigoCaja',[DMConexion.Esquema]));
         ParamByName('CodigoCaja').AsString := Caja;
         Open;
         if NOT IsEmpty then
           begin
             cdsTotales.Close;
             cdsTotales.CreateDataSet;
             cdsTotales.Append;
             cdsTotales.FieldByName('ToalCarpetas').AsInteger := FieldByName('ToalCarpetas').AsInteger;
             cdsTotales.FieldByName('TotalFolios').AsInteger := FieldByName('TotalFolios').AsInteger;
         end;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.Totales. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.ValidarProcesInsercion(CodigoCarpeta: string): integer;
begin
  Result := 0;
  try
    with ZQValidarProceso do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format('SELECT DISTINCT (idFlujo) AS idFlujo FROM %s.Carpeta WHERE CodigoCarpeta =:CodigoCarpeta AND idFlujo NOT IN (5) ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
        ParamByName('CodigoCarpeta').AsString := CodigoCarpeta;
        Open;
        if NOT IsEmpty then
          Result := FieldByName('idFlujo').AsInteger;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.ValidarProcesInsercion. FuenteError :' + E.Message);
  end;
end;

end.
