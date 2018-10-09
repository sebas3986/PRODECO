unit UDMRecepcion;

interface

uses
  System.SysUtils, System.Classes, UDMConexion, Data.DB, Datasnap.Provider, UHerramientas,
  Datasnap.DBClient, ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass,
  frxDBSet, frxExportPDF, frxBarcode;

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
    strngfldSubSerieDescripcionSubSerieDocumental: TStringField;
    intgrfldSubSerieCantidad: TIntegerField;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SerieDocumental;
    function InsertarCaja (PrecintoUno, PrecintoDos : string) : string;
    procedure InsertarCarpeta (idCaja, idSerieDocumental : integer; Foliada : boolean; CodigoCaja : string);
    procedure InsertarCarpetaAleta (idCarpeta, idSubSerieDocumental, CantidadFolios : integer; CodigoCarpeta :string);
    procedure ActualizarCarpeta (idCarpeta : integer; ObraCivil : boolean);
    procedure CerrarCaja (idCaja : integer);
    function BuscarCaja (Parametro : integer; Precinto : string) : integer;
    function BuscarCarpeta (idCaja, Criterio : integer) : boolean;
    procedure BuscarCarpetaAleta (idCarpeta, idSerieSubSerie : integer);
    procedure SubSerieDocumental (idTipoCarpeta, idSerieDocumental : integer);
    function BuscarSerieSubSerie (idSerieSubSerie : integer; Carpeta : string) : boolean;
    function BuscarStickerCaja (Precinto : string) : boolean;
    procedure CarpetasRadicadas (idCaja : integer);
    procedure FoliosCaja (idCaja : integer);
    function ImprimirStickerCaja (Precinto : string) : boolean;
    function ImprimirStickerCarpeta (idCaja : integer) : boolean;
    function ImprimirStickerCarpetaAleta (idSerieSubSerie : integer; Carpeta : string) : boolean;
    function ImprimirActaRelevo : boolean;
    procedure Totales (Caja : string);
  end;

var
  DMRecepcion: TDMRecepcion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRecepcion }

procedure TDMRecepcion.ActualizarCarpeta(idCarpeta: integer; ObraCivil : boolean);
begin
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Carpeta SET Cerrada = True, ObraCivil =:ObraCivil WHERE idCarpeta =:idCarpeta',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         ParamByName('ObraCivil').AsBoolean := ObraCivil;
         ExecSQL;
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
                  1 : SQL.Add(Format('SELECT idCaja, CodigoCaja, PrecintoUno, PrecintoDos, Cerrada, Fecha FROM %s.Caja WHERE PrecintoUno =:Precinto ORDER BY 1 DESC LIMIT 1',[DMConexion.Esquema]));
                  2 : begin
                        SQL.Add(Format('SELECT idCaja, CodigoCaja, PrecintoUno, PrecintoDos, Cerrada, Fecha FROM %s.Caja WHERE PrecintoUno =:Precinto OR PrecintoDos =:Precinto',[DMConexion.Esquema]));
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
             Result := FieldByName('idCaja').AsInteger;
         end else
             Result := -1;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.BuscarCaja. FuenteError :' + E.Message);
  end;
end;

function TDMRecepcion.BuscarCarpeta(idCaja, Criterio: integer) : boolean;
begin
  Result := False;
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         case Criterio of
                  1 : SQL.Add(Format('SELECT idCarpeta, SecuenciaCarpeta, CodigoCarpeta FROM %s.Carpeta WHERE idCaja =:idCaja AND Cerrada = False ORDER BY 1 ASC',[DMConexion.Esquema]));
                  2 : SQL.Add(Format('SELECT idCarpeta, SecuenciaCarpeta, CodigoCarpeta FROM %s.Carpeta WHERE idCaja =:idCaja AND Cerrada = True  ORDER BY 1 ASC',[DMConexion.Esquema]));
         end;
         ParamByName('idCaja').AsInteger := idCaja;
         Open;
          cdsCarpeta.Close;
          cdsCarpeta.CreateDataSet;
         if NOT IsEmpty then
           begin
             cdsCarpeta.Close;
             cdsCarpeta.CreateDataSet;
             cdsCarpeta.Append;
             cdsCarpeta.FieldByName('idCarpeta').AsInteger := FieldByName('idCarpeta').AsInteger;
             cdsCarpeta.FieldByName('SecuenciaCarpeta').AsInteger := FieldByName('SecuenciaCarpeta').AsInteger;
             cdsCarpeta.FieldByName('CodigoCarpeta').AsString := FieldByName('CodigoCarpeta').AsString;
             cdsCarpeta.FieldByName('CodigoMCarpeta').AsString := 'M'+FieldByName('CodigoCarpeta').AsString;  //'M00001' +
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

function TDMRecepcion.BuscarSerieSubSerie(idSerieSubSerie: integer; Carpeta : string) : boolean;
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
         if NOT IsEmpty then
           begin
             cdsSerieSubSerie.Close;
             cdsSerieSubSerie.CreateDataSet;
             cdsSerieSubSerie.Append;
             cdsSerieSubSerie.FieldByName('idSerieSubSerie').AsInteger := FieldByName('idSerieSubSerie').AsInteger;
             cdsSerieSubSerie.FieldByName('idSerieDocumental').AsInteger := FieldByName('idSerieDocumental').AsInteger;
             cdsSerieSubSerie.FieldByName('idSubSerieDocumental').AsInteger := FieldByName('idSubSerieDocumental').AsInteger;
             cdsSerieSubSerie.FieldByName('Orden').AsInteger := FieldByName('Orden').AsInteger;
             cdsSerieSubSerie.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
             cdsSerieSubSerie.FieldByName('CodigoMCarpetaAleta').AsString := 'M'+Carpeta + LlenarCerosIzquierda('2',FieldByName('idSubSerieDocumental').AsInteger); // 'M00001' +
             Result := True;
         end else
            begin
             cdsSerieSubSerie.Close;
             cdsSerieSubSerie.CreateDataSet;
             cdsSerieSubSerie.EmptyDataSet;
            end;

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

procedure TDMRecepcion.CarpetasRadicadas(idCaja : integer);
begin
  try
    with ZQCarpetasRadicadas do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('SELECT SUM (CantidadFolios) AS TotalFolios, CR.idCaja, CRA.idCarpeta, CodigoCaja, CodigoCarpeta, ObraCivil, PrecintoUno, PrecintoDos, CA.Fecha FROM %s.Caja CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.Carpeta CR ON (CR.idCaja = CA.idCaja AND CR.Habilitado = TRUE)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CRA ON (CRA.idCarpeta = CR.idCarpeta AND CRA.Habilitado = TRUE) WHERE CR.idCaja =:idCaja GROUP BY CR.idCaja, CRA.idCarpeta, CodigoCaja, CodigoCarpeta, ObraCivil, PrecintoUno, PrecintoDos, CA.Fecha ORDER BY CRA.idCarpeta',[DMConexion.Esquema]));
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

procedure TDMRecepcion.CerrarCaja(idCaja: integer);
begin
  try
    with ZQCaja do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('UPDATE %s.Caja SET Cerrada = True WHERE idCaja =:idCaja',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.CerrarCaja. FuenteError :' + E.Message);
  end;
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

function TDMRecepcion.ImprimirStickerCarpeta(idCaja : integer): boolean;
begin
  if BuscarCarpeta(idCaja, 1) then
    begin

      frxCarpeta.PrepareReport;
      frxCarpeta.Print;
  end;
end;

function TDMRecepcion.ImprimirStickerCarpetaAleta(idSerieSubSerie: integer; Carpeta : string): boolean;
begin
  if BuscarSerieSubSerie(idSerieSubSerie, Carpeta) then
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
{    with ZQCaja do
       begin
         idCaja := BuscarCaja(1,'');
         if idCaja = -1 then
           idCaja = 0;
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.Caja (CodigoCaja, Usuario, PrecintoUno, PrecintoDos) VALUES (:CodigoCaja, :Usuario, :PrecintoUno, :PrecintoDos)',[DMConexion.Esquema]));
         ParamByName('CodigoCaja').AsString := LlenarCerosIzquierda('4',idCaja + 1);
         ParamByName('Usuario').AsString := ParamStr(1);
         ParamByName('PrecintoUno').AsString := PrecintoUno;
         ParamByName('PrecintoDos').AsString := PrecintoDos;
         ExecSQL;
         idCaja := BuscarCaja(2,PrecintoUno);
         Result := LlenarCerosIzquierda('4',idCaja);
    end;  }
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
         SQL.Add(Format('INSERT INTO %s.Carpeta (idCaja, idSerieDocumental, SecuenciaCarpeta, CodigoCarpeta, idFlujo, Foliada, Usuario) VALUES (:idCaja, :idSerieDocumental, :SecuenciaCarpeta, :CodigoCarpeta, :idFlujo, :Foliada, :Usuario)',[DMConexion.Esquema]));
         ParamByName('idCaja').AsInteger := idCaja;
         ParamByName('idSerieDocumental').AsInteger := idSerieDocumental;
         ParamByName('SecuenciaCarpeta').AsInteger := TotalCarpetas + 1;
         ParamByName('CodigoCarpeta').AsString := CodigoCaja + LlenarCerosIzquierda('2', cdsSerieDocumental.FieldByName('idSerieDocumental').AsInteger)+ LlenarCerosIzquierda('2', TotalCarpetas + 1);
         ParamByName('idFlujo').AsInteger := 1;
         ParamByName('Foliada').AsBoolean := Foliada;
         ParamByName('Usuario').AsString := ParamStr(1);
         ExecSQL;
         BuscarCarpeta(idCaja, 1);
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMRecepcion.InsertarCarpeta. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.InsertarCarpetaAleta(idCarpeta, idSubSerieDocumental, CantidadFolios: integer; CodigoCarpeta :string);
begin
  try
    with ZQCarpetaAleta do
       begin
         Close;
         SQL.Clear;
         SQL.Add(Format('INSERT INTO %s.CarpetaAleta (idCarpeta, idSerieSubSerie, CodigoCarpetaAleta, CantidadFolios, Usuario) VALUES (:idCarpeta, :idSerieSubSerie, :CodigoCarpetaAleta, :CantidadFolios, :Usuario)',[DMConexion.Esquema]));
         ParamByName('idCarpeta').AsInteger := idCarpeta;
         ParamByName('idSerieSubSerie').AsInteger := idSubSerieDocumental;
         ParamByName('CantidadFolios').AsInteger := CantidadFolios;
         ParamByName('CodigoCarpetaAleta').AsString := CodigoCarpeta+LlenarCerosIzquierda('2', cdsSubSerie.FieldByName('idSubSerieDocumental').AsInteger);
         ParamByName('Usuario').AsString := ParamStr(1);
         ExecSQL;
    end;
  except
   on E : Exception do
     raise Exception.Create('Error TDMRecepcion.InsertarCarpetaAleta. FuenteError :' + E.Message);
  end;
end;

procedure TDMRecepcion.SerieDocumental;
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
      SQL.Add('              AND TISD.descripciontiposeriedocumental = ''HISTORIAS LABORALES''');
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

procedure TDMRecepcion.SubSerieDocumental(idTipoCarpeta, idSerieDocumental: integer);
begin
  try
    with ZQSubSerie do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT idSerieSubSerie, TC.idTipoCarpeta, DescripcionTipoCarpeta, ');
         SQL.Add('        TC.CantidadDivisiones, SD.idSerieDocumental, SSD.idSubSerieDocumental,');
         SQL.Add('        SSD.DescripcionSubSerieDocumental ');
         SQL.Add(Format('FROM %s.SerieSubSerie SS',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.TipoCarpeta TC ON (TC.idTipoCarpeta = SS.idTipoCarpeta AND SS.idTipoCarpeta =:idTipoCarpeta)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieDocumental SD ON (SD.idSerieDocumental = SS.idSerieDocumental AND SD.idSerieDocumental =:idSerieDocumental )',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SS.idSubSerieDocumental) ORDER BY Orden',[DMConexion.Esquema]));
         ParamByName('idTipoCarpeta').AsInteger := idTipoCarpeta;
         ParamByName('idSerieDocumental').AsInteger := idSerieDocumental;
         Open;
         if NOT IsEmpty then
           begin
             cdsSubSerie.Close;
             cdsSubSerie.CreateDataSet;
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
         end else
            begin
              cdsSubSerie.Close;
              cdsSubSerie.CreateDataSet;
              cdsSubSerie.EmptyDataSet;
            end;
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

end.
