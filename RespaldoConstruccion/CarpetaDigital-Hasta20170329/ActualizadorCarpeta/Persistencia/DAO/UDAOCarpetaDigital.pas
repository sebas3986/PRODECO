unit UDAOCarpetaDigital;

interface
uses
  SysUtils,StrUtils,Classes,DB,DBClient, zdataset,  ZDbcIntfs,
  UDMConexion, Variants;

type
  TDAOCarpetaDigital = class
    private
      FQuery : TZquery;
    public
      {CONSTRUCTORES Y DESTRUCTORES}
      constructor create;
      destructor  destroy;

      { PROCEDIMIENTOS Y FUNCIONES }
      function ConsultarCarpetas(p_CodiCarp: string): TClientDataSet;
      function ConsultarDatosMtiAndes(p_identipo: variant; p_numedocu: string;
                                      p_primnomb:string; p_primapel:string): TDataSource;
      function ConsultarEmpleados(p_IdenPers: Int32; p_NombPers: string): TClientDataSet;
      function ConsultarTiposIdentificacion: TDataSource;
  end;

implementation


{$REGION 'METODOS PROPIOS'}

function TDAOCarpetaDigital.ConsultarDatosMtiAndes(p_identipo: Variant;
                    p_numedocu: string; p_primnomb:string; p_primapel:string): TDataSource;
{ FUNCION QUE BUSCA DATOS DE PERSONAS EN LA BASE DE DATOS DE MTI }
var
  adicwher : string;
  QuerDatosMTAN: TZQuery;
begin
  try
    QuerDatosMTAN:= TZQuery.Create(nil);
    QuerDatosMTAN.Connection:= DMConexion.ZConexion;
    Result:= TDataSource.Create(nil);
    adicwher := '';
    with QuerDatosMTAN do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT TIID.idtipoidentificacion, TIID.descripciontipoidentificacion, ');
      SQL.Add('       IDEN.numerodocumento, PERS.idpersona,');
      SQL.Add('       PERS.primernombre, PERS.segundonombre, ');
      SQL.Add('       CAST(CASE WHEN TRIM(PERS.segundonombre) IS NULL ');
      SQL.Add('               THEN TRIM(PERS.primernombre) ');
      SQL.Add('               ELSE TRIM(PERS.primernombre) || '' '' || TRIM(PERS.segundonombre)');
      SQL.Add('            END AS CHARACTER VARYING) AS nombres , ');
      SQL.Add('       PERS.primerapellido, PERS.segundoapellido, ');
      SQL.Add('       CAST(CASE WHEN TRIM(PERS.segundoapellido) IS NULL ');
      SQL.Add('               THEN TRIM(PERS.primerapellido) ');
      SQL.Add('               ELSE TRIM(PERS.primerapellido) || '' '' || TRIM(PERS.segundoapellido)');
      SQL.Add('            END AS CHARACTER VARYING) AS apellidos ');
      SQL.Add(Format('FROM %s.IDENTIFICACION IDEN ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.PERSONA PERS ON PERS.idpersona = IDEN.idpersona',
                        [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TIPOIDENTIFICACION TIID ON '
                        + 'TIID.idtipoidentificacion = IDEN.idtipoidentificacion',
                        [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      if p_identipo <> -1 then
        adicwher := adicwher + Format(' IDEN.idtipoidentificacion = %s  ',[p_identipo]);
      if p_numedocu <> '' then
        adicwher:= adicwher + IfThen(adicwher <> '',' and ', '')
                      + Format('IDEN.numerodocumento LIKE ''%s''',['%' + p_numedocu + '%']);

      if p_primnomb <> '' then
        adicwher:= adicwher + IfThen(adicwher <> '',' and ', '')
                      + Format('PERS.primernombre LIKE ''%s''',['%' + p_primnomb + '%']);

      if p_primapel <> '' then
        adicwher:= adicwher + IfThen(adicwher <> '',' and ', '')
                      + Format('PERS.primerapellido LIKE ''%s''',['%' + p_primapel + '%']);
      SQL.Add(adicwher);
      SQL.Add('       ORDER BY primernombre,segundonombre NULLS FIRST, primerapellido, '
                     + 'segundoapellido NULLS FIRST');
      open;
      first;
      result.DataSet:=QuerDatosMTAN;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar información de Base de Datos MTI-UNIANDES.'
                              + #10#13 + '* '+ e.Message);

  end;
end;

function TDAOCarpetaDigital.ConsultarTiposIdentificacion: TDataSource;
{ FUNCION QUE BUSCA LOS TIPOS DE IDENTIFICACION }

var
  QuerDatoTipi: TZQuery;
begin
  try
    QuerDatoTipi:= TZQuery.Create(nil);
    QuerDatoTipi.Connection:= DMConexion.ZConexion;
    Result:= TDataSource.Create(nil);
    with QuerDatoTipi do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT *');
      SQL.Add('   FROM (SELECT -1 idtipoidentificacion, NULL descripciontipoidentificacion');
      SQL.Add('         UNION');
      SQL.Add('         SELECT idtipoidentificacion, descripciontipoidentificacion');
      SQL.Add(Format('    FROM %s.TIPOIDENTIFICACION ) AS TIID ', [DMConexion.esquema]));
      SQL.Add('   ORDER BY descripciontipoidentificacion NULLS FIRST');
      open;
      first;
      result.DataSet:=QuerDatoTipi;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar los Tipos de Identificacion.'
                              + #10#13 + '* '+ e.Message);

  end;
end;

function TDAOCarpetaDigital.ConsultarCarpetas(p_CodiCarp: string): TClientDataSet;
{ FUNCION QUE BUSCA LAS IMAGENES QUE TIENE UNA CARPETA}

var
  NumeRegi    : Int32;
  RegiPadrNiv1: Int32;
  SubbSeriDocu: string;

  QuerDatoCarp: TZQuery;
begin
  try
    QuerDatoCarp := TZQuery.Create(nil);
    QuerDatoCarp.Connection := DMConexion.ZConexion;
    Result:= TClientDataSet.Create(nil);
    with Result do
    begin
      FieldDefs.Add('REGISTRO',ftInteger,0);
      FieldDefs.Add('NODO',ftString,200);
      FieldDefs.Add('RUTAFTP',ftString,150);
      FieldDefs.Add('NOMBREIMAGEN',ftString,100);
      FieldDefs.Add('PADRE',ftInteger,0);
      CreateDataSet;
    end;

    with QuerDatoCarp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUBS.descripcionsubseriedocumental,');
      SQL.Add('       FOLI.codigofolio, IMAG.rutaftp, IMAG.nombreimagen');
      SQL.Add(Format('FROM %s.FOLIO FOLI ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETAALETA CAAL ON '
                     + 'CAAL.idcarpetaaleta = FOLI.idcarpetaaleta ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETA CARP ON '
                     + 'CARP.idcarpeta = CAAL.idcarpeta', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SERIESUBSERIE SESU ON '
                     + 'SESU.idseriesubserie = CAAL.idseriesubserie',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SUBSERIEDOCUMENTAL SUBS ON '
                     + 'SUBS.idsubseriedocumental = SESU.idsubseriedocumental',
                     [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.IMAGEN IMAG ON IMAG.idfolio = FOLI.idfolio',
                     [DMConexion.esquema]));
      SQL.Add(Format('WHERE CARP.codigocarpeta= ''%s''' , [p_CodiCarp]));
      SQL.Add('             AND IMAG.version = (SELECT MAX(version)');
      SQL.Add(Format('                            FROM %s.IMAGEN', [DMConexion.esquema]));
      SQL.Add('                                   WHERE idfolio = FOLI.idfolio)');
      SQL.Add('       ORDER BY 1,2');
      Open;
      if NOT IsEmpty then
      begin
        First;
        NumeRegi:=-1;
        while not Eof do
        begin
          Inc(NumeRegi);
          RegiPadrNiv1 := NumeRegi;
          SubbSeriDocu := FieldByName('descripcionsubseriedocumental').AsString;
          Result.Append;
          Result.FieldByName('REGISTRO').Value := NumeRegi;
          Result.FieldByName('NODO').Value:= SubbSeriDocu;
          Result.FieldByName('PADRE').Value:= -1;
          while (not eof)
                  and (SubbSeriDocu = FieldByName('descripcionsubseriedocumental').AsString) do
          begin
            Inc(NumeRegi);
            Result.Append;
            Result.FieldByName('REGISTRO').Value := NumeRegi;
            Result.FieldByName('NODO').Value:= 'M' + FieldByName('codigofolio').AsString;
            Result.FieldByName('RUTAFTP').Value:= FieldByName('rutaftp').AsString;
            Result.FieldByName('NOMBREIMAGEN').Value:= FieldByName('nombreimagen').asstring;
            Result.FieldByName('PADRE').Value:= RegiPadrNiv1;
            Next;
          end;
        end;
      end;
    end;
  except
    on E:exception do
      raise Exception.Create(format('No es posible consultar las Imágenes para '
                                    + 'la Carpeta [%s].',[p_CodiCarp]) + #10#13
                                    + '* '+ e.Message);

  end;
end;

function TDAOCarpetaDigital.ConsultarEmpleados(p_IdenPers: Int32;
                                              p_NombPers: string): TClientDataSet;
{ FUNCION QUE BUSCA LAS IMAGENES QUE TIENE UNA PERSONA}

var
  AnnoNomi    : string;
  NumeRegi    : Int32;
  RegiPadrNiv1: Int32;
  RegiPadrNiv2: Int32;
  SeriDocu    : string;

  QuerDatoImag: TZQuery;
begin
  try
    QuerDatoImag := TZQuery.Create(nil);
    QuerDatoImag.Connection := DMConexion.ZConexion;
    Result:= TClientDataSet.Create(nil);
    with Result do
    begin
      FieldDefs.Add('REGISTRO',ftInteger,0);
      FieldDefs.Add('NODO',ftString,200);
      FieldDefs.Add('RUTAFTP',ftString,150);
      FieldDefs.Add('NOMBREIMAGEN',ftString,100);
      FieldDefs.Add('PADRE',ftInteger,0);
      CreateDataSet;
    end;

    with QuerDatoImag do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT TISD.descripciontiposeriedocumental,SEDO.descripcionseriedocumental,');
      SQL.Add('       CASE WHEN TISD.descripciontiposeriedocumental = ''PLANILLAS DE NÓMINA''');
      SQL.Add('         THEN DAPL.fechanomina ');
      SQL.Add('         ELSE DAPL.periodocotizacion ');
      SQL.Add('       END AS fecha,');
      SQL.Add('       FOLI.codigofolio, IMAG.rutaftp,IMAG.nombreimagen');
      SQL.Add(Format('FROM %s.IDENTIFICACION IDEN ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.FOLIOIDENTIFICACION FOID ON '
                     + 'FOID.ididentificacion = IDEN.ididentificacion',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.FOLIO FOLI ON '
                     + 'FOLI.idfolio = FOID.idfolio', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETAALETA CAAL ON '
                     + 'CAAL.idcarpetaaleta = FOLI.idcarpetaaleta ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETA CARP ON '
                     + 'CARP.idcarpeta = CAAL.idcarpeta', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SERIEDOCUMENTAL SEDO ON '
                     + 'SEDO.idseriedocumental = CARP.idseriedocumental',
                     [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TIPOSERIEDOCUMENTAL TISD ON '
                     + 'TISD.idtiposeriedocumental = SEDO.idtiposeriedocumental',
                     [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.IMAGEN IMAG ON IMAG.idfolio = FOLI.idfolio',
                     [DMConexion.esquema]));
      SQL.Add(Format('LEFT JOIN %s.DATOPLANILLA DAPL ON '
                     + 'DAPL.iddatoplanilla = FOLI.iddatoplanilla', [DMConexion.esquema]));
      SQL.Add(Format('WHERE IDEN.idpersona = %d' , [p_idenpers]));
      SQL.Add('             AND IMAG.version = (SELECT MAX(version)');
      SQL.Add(Format('                            FROM %s.IMAGEN', [DMConexion.esquema]));
      SQL.Add('                                   WHERE idfolio = FOLI.idfolio)');
      SQL.Add('       ORDER BY 1,2,3,4');
      Open;
      if NOT IsEmpty then
      begin
        First;
        NumeRegi:=-1;
        while not Eof do
        begin
          Inc(NumeRegi);
          RegiPadrNiv1 := NumeRegi;
          SeriDocu := FieldByName('descripcionseriedocumental').AsString;
          Result.Append;
          Result.FieldByName('REGISTRO').Value := NumeRegi;
          Result.FieldByName('NODO').Value:= SeriDocu;
          Result.FieldByName('PADRE').Value:= -1;
          while (not eof) and (SeriDocu = FieldByName('descripcionseriedocumental').AsString) do
          begin
            Inc(NumeRegi);
            RegiPadrNiv2 := NumeRegi;
            AnnoNomi := AnsiRightStr(FieldByName('fecha').AsString,4);
            Result.Append;
            Result.FieldByName('REGISTRO').Value := NumeRegi;
            Result.FieldByName('NODO').Value:= AnnoNomi;
            Result.FieldByName('PADRE').Value:= RegiPadrNiv1;
            while (not eof) and (SeriDocu = FieldByName('descripcionseriedocumental').AsString)
                            and (AnnoNomi = AnsiRightStr(FieldByName('fecha').AsString,4)) do
            begin
              Inc(NumeRegi);
              Result.Append;
              Result.FieldByName('REGISTRO').Value := NumeRegi;
              Result.FieldByName('NODO').Value:= '['
                          + FormatDateTime('mmm',StrToDate(FieldByName('fecha').AsString))
                          + ']-M' + FieldByName('codigofolio').AsString;
              Result.FieldByName('RUTAFTP').Value:= FieldByName('rutaftp').AsString;
              Result.FieldByName('NOMBREIMAGEN').Value:= FieldByName('nombreimagen').asstring;
              Result.FieldByName('PADRE').Value:= RegiPadrNiv2;
              Next;
            end;
          end;
        end;
      end;
    end;
  except
    on E:exception do
      raise Exception.Create(format('No es posible consultar las Imágenes para '
                                    + '[%s].',[p_NombPers]) + #10#13 + '* '+ e.Message);

  end;
end;

{$ENDREGION}


{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}
constructor TDAOCarpetaDigital.create;
begin
  FQuery:= TZQuery.create(nil);
  FQuery.Connection:= DMConexion.ZConexion;
end;

destructor TDAOCarpetaDigital.destroy;
begin
  FQuery.Close;
  FQuery.Connection.Disconnect;
  FQuery.free;
end;
{$ENDREGION}
end.
