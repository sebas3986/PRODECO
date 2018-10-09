unit UDAOPublicacion;

interface
uses
  SysUtils,StrUtils,Classes,DB,DBClient, zdataset,  ZDbcIntfs, UDMConexion, UFolio, UImagen;

type
  TDAOPublicacion = class
    private
      FQuery : TZquery;
    public
      constructor create;
      destructor  destroy;
      Function  AgregarFolio(P_DatoFolio: TFolio): LongInt;
      Procedure AgregarImagen(P_DatoImag: TImagen);
      Procedure CambiarEstadoCarpeta(P_CodiCarp: string);
      procedure CancelarTransaccion;
      procedure FinalizarTransaccion;
      procedure InicarTransaccion;
      function  ObtenerCantidadesCarpeta(P_CodiCarp: string): TClientDataSet;
  end;

implementation


{$REGION 'METODOS PROPIOS'}

function TDAOPublicacion.ObtenerCantidadesCarpeta(P_CodiCarp: string): TClientDataSet;
var
  CarpCodi : string;
begin
  try

    Result:= TClientDataSet.Create(nil);
    with Result do
    begin
      FieldDefs.Add('IDCARPETA',ftInteger, 0,False);
      FieldDefs.Add('CODIGOCARPETA',ftString, 30);
      FieldDefs.Add('IDCARPETAALETA',ftLargeint, 0);
      FieldDefs.Add('CODIGOCARPETAALETA',ftString, 30);
      FieldDefs.Add('CANTIDADFOLIOS',ftInteger, 0);
      FieldDefs.Add('DESCRIPCIONTAREA',ftString, 50);
      CreateDataSet;
    end;
    {SE REMUEVE EL CODIGO SIOVAL PARA HACER LA CONSULTA}
    CarpCodi := AnsiRightStr(P_CodiCarp,P_CodiCarp.Length - 1);
    with FQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT CARP.IDCARPETA, CARP.CODIGOCARPETA, CARP.CERRADA, CAAL.IDCARPETAALETA, ');
      SQL.Add(        'CAAL.CODIGOCARPETAALETA, CAAL.CANTIDADFOLIOS, TARE.DESCRIPCIONTAREA');
      SQL.Add(Format('FROM %s.CARPETA CARP',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETAALETA CAAL ON CAAL.IDCARPETA=CARP.IDCARPETA',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.FLUJO FLUJ ON FLUJ.IDFLUJO = CARP.IDFLUJO',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TAREA TARE ON TARE.IDTAREA = FLUJ.IDTAREAPROXIMA',[DMConexion.esquema]));
      SQL.Add('       WHERE CARP.CODIGOCARPETA = ' + QuotedStr(CarpCodi));
      SQL.Add('         AND CARP.HABILITADO AND CAAL.HABILITADO AND FLUJ.HABILITADO AND TARE.HABILITADO');
      SQL.Add('       ORDER BY 5');
      open;
      first;
      while (not Eof) do
      begin
        Result.Append;
        Result.FieldByName('IDCARPETA').Value           := FieldByName('IDCARPETA').AsString;
        Result.FieldByName('CODIGOCARPETA').Value       := FieldByName('CODIGOCARPETA').AsString;
        Result.FieldByName('IDCARPETAALETA').Value      := FieldByName('IDCARPETAALETA').AsString;
        Result.FieldByName('CODIGOCARPETAALETA').Value  := FieldByName('CODIGOCARPETAALETA').AsString;
        Result.FieldByName('CANTIDADFOLIOS').Value      := FieldByName('CANTIDADFOLIOS').AsString;
        Result.FieldByName('DESCRIPCIONTAREA').Value    := FieldByName('DESCRIPCIONTAREA').AsString;
        next;
      end;
    end;

  except
    on E:exception do
      raise Exception.Create('No es posible consultar cantidades de la Carpeta (' + P_CodiCarp + ') ['
                              + ParamStr(2) + '].' + #10#13 + '* '+ e.Message);

  end;
end;

Function TDAOPublicacion.AgregarFolio(P_DatoFolio: TFolio): LongInt;
begin
  try
    with FQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('INSERT INTO %s.FOLIO (idcarpetaaleta, secuenciafolio, tipofolio, codigofolio,'
                      + 'chequeocalidad, usuario)',[DMConexion.esquema]));

      SQL.Add(Format('  VALUES (%d,%d,''%s'',''%s'',''%s'',''%s'' )',[P_DatoFolio.IdCarpetaAleta,
                              P_DatoFolio.SecuenciaFolio, P_DatoFolio.TipoFolio, P_DatoFolio.CodigoFolio,
                              ifthen(P_DatoFolio.ChequeoCalidad, 'TRUE', 'FALSE'),
                              Paramstr(1)]));
      SQL.Add('         RETURNING idfolio');
      open;
      Result:=  FieldByName('idfolio').Value;
    end;

  except
    on E:exception do
      raise Exception.Create('No es posible indexar el Folio [' + P_DatoFolio.CodigoFolio + ']. '
                              + #10#13 + '* '+ e.Message);

  end;
end;

Procedure TDAOPublicacion.AgregarImagen(P_DatoImag: TImagen);
begin
  try
    with FQuery do
    begin
      Close;
      SQL.Clear;


      SQL.Add(Format('INSERT INTO %s.IMAGEN  (idfolio, version, rutalocal, rutaftp, nombreimagen, '
                      + 'servidorftp, ippublicacion, tamanobytes, ancho, alto, densidad, '
                      + 'usuario)',[DMConexion.esquema]));
      SQL.Add(Format('  VALUES (%d,%d,''%s'',''%s'',''%s'',''%s'', ''%s'', %d, %d, %d, %d, ''%s'' )',
                              [P_DatoImag.IdFolio, P_DatoImag.Version, P_DatoImag.RutaLocal,
                               P_DatoImag.RutaFTP, P_DatoImag.NombreImagen, P_DatoImag.ServidorFTP,
                               P_DatoImag.IpPublicacion, P_DatoImag.TamanoBytes, P_DatoImag.Ancho,
                               P_DatoImag.Alto, P_DatoImag.Densidad, Paramstr(1)]));
      ExecSQL;
    end;

  except
    on E:exception do
      raise Exception.Create('No es posible insertar la Imagen [' + P_DatoImag.NombreImagen
                             + ']. ' + #10#13 + '* ' + e.Message);

  end;
end;

Procedure TDAOPublicacion.CambiarEstadoCarpeta(P_CodiCarp: string);
var
  CarpCodi : string;
begin
  try
    {SE REMUEVE EL CODIGO SIOVAL PARA HACER LA CONSULTA}
    CarpCodi := AnsiRightStr(P_CodiCarp,P_CodiCarp.Length - 1);
    with FQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('UPDATE %s.CARPETA ',[DMConexion.esquema]));
      SQL.Add('         SET idflujo = 2 ');
      SQL.Add(Format('  WHERE codigocarpeta = ''%s'' ',[CarpCodi]));
      ExecSQL;
    end;

  except
    on E:exception do
      raise Exception.Create('No es posible actualizar el estado de la Carpeta ['
                              + P_CodiCarp + ']. ' + #10#13 + '* ' + e.Message);

  end;
end;
{$ENDREGION}

{$REGION 'CONTROL DE TRANSACCIONES'}

procedure TDAOPublicacion.CancelarTransaccion;
begin
  try
    with FQuery do
    begin
      if Connection.InTransaction then
        Connection.Rollback;
      Connection.TransactIsolationLevel:= TZTransactIsolationLevel.tinone;
    end;
  finally
  end;
end;

procedure TDAOPublicacion.InicarTransaccion;
begin
  try
    with FQuery do
    begin
      Connection.TransactIsolationLevel := TZTransactIsolationLevel.tiReadCommitted;
      Connection.StartTransaction;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible inicializar Administrador de Transacciones. '
                              + #10#13 + '* ' + e.Message);
  end;
end;

procedure TDAOPublicacion.FinalizarTransaccion;
begin
  try
    with FQuery do
    begin
      Connection.commit;
      Connection.TransactIsolationLevel:= TZTransactIsolationLevel.tinone;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible finalizar el Administrador de Transacciones. '
                              + #10#13 + '* ' + e.Message);
  end;
end;

{$ENDREGION}

{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}
constructor TDAOPublicacion.create;
begin
  FQuery:= TZQuery.create(nil);
  FQuery.Connection:= DMConexion.ZConexion;
end;

destructor TDAOPublicacion.destroy;
begin
  FQuery.Close;
  FQuery.Connection.Disconnect;
  FQuery.free;
end;
{$ENDREGION}
end.
