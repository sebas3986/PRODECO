unit DAOCorreccionFolios;

interface

uses
  System.SysUtils, System.Classes, UDMConexion, Datasnap.DBClient, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDAOCorreccionFolios = class(TDataModule)
    ZQCarpeta: TZQuery;
    dsCarpeta: TDataSource;
    cdsCarpeta: TClientDataSet;
    intgrfldCarpetaidCarpetaAleta: TIntegerField;
    strngfldCarpetaDescripcionSubSerieDocumental: TStringField;
    intgrfldCarpetaCantidadFolios: TIntegerField;
    ZQActualizarFolios: TZQuery;
    intgrfldCarpetaidSerieSubSerie: TIntegerField;
  private
    { Private declarations }
  public
    function BuscarCarpeta (CodigoCarpeta : string): boolean;
    function ActualizarFolios (CantidadFolios, idCarpetaAleta : integer; CodigoCarpeta : string): boolean;
    { Public declarations }
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCorrecionFolios }

function TDAOCorreccionFolios.ActualizarFolios(CantidadFolios, idCarpetaAleta: integer; CodigoCarpeta: string): boolean;
begin
  Result := False;
  try
    with ZQActualizarFolios do
       begin
           Close;
           SQL.Clear;
           SQL.Add(Format('UPDATE %s.CarpetaAleta SET CantidadFolios =:CantidadFolios WHERE idCarpetaAleta =:idCarpetaAleta',[DMConexion.Esquema]));
           ParamByName('CantidadFolios').AsInteger := CantidadFolios;
           ParamByName('idCarpetaAleta').AsInteger := idCarpetaAleta;
           ExecSQL;
           Result := True;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMCorrecionFolios.ActualizarFolios. FuenteError : ' + E.Message);
  end;
end;

function TDAOCorreccionFolios.BuscarCarpeta(CodigoCarpeta: string): boolean;
begin
  Result := False;
  try
    with ZQCarpeta do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT idCarpetaAleta, DescripcionSubSerieDocumental, CantidadFolios, CAL.idSerieSubSerie');
         SQL.Add(Format('FROM %s.Carpeta CA',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.CarpetaAleta CAL ON (CAL.idCarpeta = CA.idCarpeta AND idFlujo = 1)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SerieSubSerie SSS ON (SSS.idSerieSubSerie = CAL.idSerieSubSerie)',[DMConexion.Esquema]));
         SQL.Add(Format('INNER JOIN %s.SubSerieDocumental SSD ON (SSD.idSubSerieDocumental = SSS.idSubSerieDocumental)',[DMConexion.Esquema]));
         SQL.Add('       WHERE CodigoCarpeta =:CodigoCarpeta');
         SQL.Add('              AND IdFlujo = 1 ');   // SOLO CARPETAS EN ESTADO DE RADICACION
         ParamByName('CodigoCarpeta').AsString := CodigoCarpeta;
         Open;
         cdsCarpeta.Close;
         cdsCarpeta.CreateDataSet;
         if NOT IsEmpty then
           begin
             First;
             repeat
               cdsCarpeta.Append;
               cdsCarpeta.FieldByName('idCarpetaAleta').AsInteger := FieldByName('idCarpetaAleta').AsInteger;
               cdsCarpeta.FieldByName('DescripcionSubSerieDocumental').AsString := FieldByName('DescripcionSubSerieDocumental').AsString;
               cdsCarpeta.FieldByName('CantidadFolios').AsInteger := FieldByName('CantidadFolios').AsInteger;
               cdsCarpeta.FieldByName('idSerieSubSerie').AsInteger := FieldByName('idSerieSubSerie').AsInteger;
               Next;
             until Eof;
             Result := True;
             cdsCarpeta.First;
         end else
            cdsCarpeta.EmptyDataSet;
    end;
  except
     on E : Exception do
       raise Exception.Create('Error TDMCorrecionFolios.BuscarCarpeta. FuenteError :' + E.Message);
  end;
end;


end.
