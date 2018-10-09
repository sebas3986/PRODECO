unit UDAOCaptura;

interface
uses
  SysUtils,StrUtils,Classes,DB,DBClient, zdataset,  ZDbcIntfs,
  UDMConexion, UFolioCaptura, URegistroCaptura, Variants;

type
  TDAOCaptura = class
    private
      FQuery : TZquery;
    public
      constructor create;
      destructor  destroy;

      procedure AgregarIdentificacionFolio(p_IdenFoli: int64; p_IdenIden: int32;
                                      p_ObseFoliIden: string; p_DescTipoIden: string;
                                      p_NumeDocu: string);
      procedure AgregarDatosPanilla(p_IdenDapl: int64;
                                    p_IdenFond: Int32; p_FechNomi: string;
                                    p_PeriCoti: string; p_FechPago: string);


      procedure AgregarNovedadFolio(p_IdenFoli: int64; p_IdenTare: int32;
                                          p_ObseFoli : string; p_TipoObse:Char);
      function AgregarNuevaIdentificacion(p_DescIdenTipoIden: string; p_DescFuenIden: string;
                              p_NumeDocu: string; p_PrimNomb: string; p_SeguNomb : string;
                              p_PrimApel: string; p_SeguApel: string): int32;
      function AsignarFolio(p_desctare: string; p_CodiFoli: string;
                            p_nombusua:string): TFolioCaptura;
      Function CambiarEstadoCarpeta(p_IdenCarp: int32): Boolean;
      function ConsultarDatosANI(p_DescTipoIden: string; p_numedocu: string;
                                  p_primnomb:string; p_primapel:string): TDataSource;
      function ConsultarDatosAsociados(p_IdenFoli: int64): TDataSource;
      function ConsultarDatosMTI(p_identipo: variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;
      function ConsultarFondos: TDataSource;
      function ConsultarPersonasFolio(p_idenfoli: int64): TList;
      function ConsultarTiposIdentificacion: TDataSource;
      procedure CancelarTransaccion;
      Function DesbloquearFolio(p_IdenFoli: int64; p_DescTare: string) : Boolean;
      procedure  EliminarBloqueoFolioNoCapturable(p_IdenFoli: int64);
      procedure EliminarDatosAsociacion(p_IdenFoid: int64; p_IdenFoli: Int64;
                                        p_IdenCarp: Int64; p_IdenDapl: string);
      procedure RegistrarMarcaFolio(p_IdenFoli: int64);
      procedure FinalizarTransaccion;
      procedure IniciarTransaccion;

  end;

implementation
Uses
  UCaptura;

{$REGION 'METODOS PROPIOS'}

procedure TDAOCaptura.AgregarIdentificacionFolio(p_IdenFoli: int64; p_IdenIden: int32;
                                           p_ObseFoliIden: string;
                                           p_DescTipoIden: string; p_NumeDocu: string);

begin

  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT idfolioidentificacion');
    SQL.Add(Format('FROM %s.FOLIOIDENTIFICACION ', [DMConexion.esquema]));
    SQL.Add(Format('WHERE idfolio = %d AND ididentificacion = %d ',[p_IdenFoli,p_IdenIden]));
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('INSERT INTO %s.FOLIOIDENTIFICACION (idfolio, ididentificacion, '
                                    + 'observacion, usuario)', [DMConexion.esquema]));
      SQL.Add(Format('  VALUES (%d,%d,%s,''%s'')',
                                [p_IdenFoli, p_IdenIden,
                                 ifthen(p_ObseFoliIden = '', 'NULL',QuotedStr(p_ObseFoliIden)),
                                 UsuaAcce]));
      ExecSQL;
    end
    else
      raise Exception.Create
                (Format('El Folio [%d] ya se encuentra asociado con el Documento [%s - %s].',
                        [p_IdenFoli,p_DescTipoIden,p_NumeDocu]));
  end;
end;

procedure TDAOCaptura.AgregarDatosPanilla(p_IdenDapl: int64;
                                          p_IdenFond : int32; p_FechNomi: string;
                                          p_PeriCoti: string; p_FechPago: string);
var
  AdicWher: string;
begin
  if (p_IdenFond > 0) or (p_FechNomi <> '') or (p_PeriCoti <> '') or (p_FechPago <> '') then
  begin
    with FQuery do
    begin
      Close;
      SQL.Clear;

      SQL.Add(Format('UPDATE %s.DATOPLANILLA ', [DMConexion.esquema]));
      SQL.Add('         SET ');
      adicwher:= '';
      if  p_IdenFond > 0 then
        AdicWher := AdicWher + Format('idfondo = %d ',[p_IdenFond]);
      if p_FechNomi <> '' then
        AdicWher:= AdicWher +

        IfThen(adicwher <> '',',', '')
                            + Format('fechanomina = %s ',
                              [QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(p_FechNomi,0)))]);
      if p_PeriCoti <> '' then
        AdicWher:= AdicWher + IfThen(adicwher <> '',',', '')
                            + Format('periodocotizacion = %s ',
                              [QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(p_PeriCoti,0)))]);
      if p_FechPago <> '' then
        AdicWher:= AdicWher + IfThen(adicwher <> '',',', '')
                            + Format('fechapago = %s ',
                              [QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(p_FechPago,0)))]);
      SQL.Add(AdicWher);
      SQL.Add(Format('  WHERE iddatoplanilla = %d ',[p_IdenDapl]));
      SQL.Add('         RETURNING iddatoplanilla');
      Open;
      if IsEmpty then
        raise Exception.Create
              ('Imposible Actualizar información de Fechas y/o Fondo para el Folio Solicitado.');
    end;
  end
  else
    raise Exception.Create
              ('No se enviaron datos de actualización de Fechas y/o Fondo para el Folio Solicitado.');

end;

procedure TDAOCaptura.AgregarNovedadFolio(p_IdenFoli: int64; p_IdenTare: int32;
                                          p_ObseFoli : string; p_TipoObse:Char);
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('INSERT INTO %s.OBSERVACIONFOLIO (idfolio, idtarea, observacion, '
                    + 'tipoobservacion, usuario) ',[DMConexion.esquema]));
    SQL.Add(Format('  VALUES (%d,%d,''%s'',''%s'',''%s'' )',
                      [p_IdenFoli, p_IdenTare, p_ObseFoli, p_TipoObse, UsuaAcce]));
    open;
  end;
end;

function TDAOCaptura.AgregarNuevaIdentificacion(p_DescIdenTipoIden: string; p_DescFuenIden: string;
                              p_NumeDocu: string; p_PrimNomb: string; p_SeguNomb : string;
                              p_PrimApel: string; p_SeguApel: string): int32;
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT p_idenidennuev');
    SQL.Add(Format('FROM %s.FNC_AGREGARIDENTIFICACIONPERSONA '
                      + '(''%s'', ''%s'',''%s'', %s, %s, %s, %s,''%s'')',
                    [DMConexion.esquema, p_DescIdenTipoIden, p_DescFuenIden, p_NumeDocu,
                       ifthen(p_PrimNomb = '', 'NULL',QuotedStr(p_PrimNomb)),
                       ifthen(p_SeguNomb = '', 'NULL',QuotedStr(p_SeguNomb)),
                       ifthen(p_PrimApel = '', 'NULL',QuotedStr(p_PrimApel)),
                       ifthen(p_SeguApel = '', 'NULL',QuotedStr(p_SeguApel)),
                       UsuaAcce]));
    Open;
    if not IsEmpty then
    begin
      First;
      Result:= FieldByName('p_idenidennuev').Value;
    end
    else
      raise Exception.Create(Format('No es posible Registrar el Documento [%s - %s].',
                              [p_NumeDocu,p_DescIdenTipoIden]));
  end;
end;

function TDAOCaptura.AsignarFolio(p_desctare: string; p_CodiFoli: string;
                                  p_nombusua:string): TFolioCaptura;
{ FUNCION QUE EJECUTA UN PROCEDIMIENTO ALMACENADO PARA OBTENER UN FOLIO DE UNA CARPETA QUE
  SE ENCUENTRE EN ESTADO DE CAPTURA Y QUE PERTENEZCA A UNA SERIE DOCUMENTAL. SI EL FOLIO YA
  SE HABIA BLOQUEADO PARA EL USUARIO SE LO VUELVE ASIGNAR DE LO CONTRARIO LE ASIGNA UN
  FOLIO QUE NO ESTE BLOQUEADO.
}

begin
  try
    Result:= TFolioCaptura.Create;
    with FQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FOLI.idfolio, FOLI.codigofolio, FOLI.secuenciafolio, FOLI.iddatoplanilla, ');
      SQL.Add('       IMAG.nombreimagen, CARP.idcarpeta, TARE.idtarea, ');
      SQL.Add('       CAJA.codigocaja, TISD.descripciontiposeriedocumental, ');
      SQL.Add('       SUBD.descripcionsubseriedocumental, 0 as p_diasbloq,  ');
      SQL.Add('       SEDO.descripcionseriedocumental, ');
      SQL.Add('       SUBD.descripcionsubseriedocumental, 0 as p_diasbloq,  ');
      SQL.Add('       cast(''00:00:00'' as TIME) as p_horabloq, ');
      SQL.Add('       IMAG.servidorftp, IMAG.rutaftp, DAPL.fechanomina, DAPL.idfondo, ');
      SQL.Add('       DAPL.periodocotizacion, DAPL.fechapago ');
      SQL.Add(Format('FROM %s.FOLIO FOLI ',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.IMAGEN IMAG ON IMAG.idfolio = FOLI.idfolio',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CONTROLFOLIO COFO ON COFO.idfolio = FOLI.idfolio',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETAALETA CAAL ON CAAL.idcarpetaaleta = FOLI.idcarpetaaleta',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CARPETA      CARP ON CARP.idcarpeta = CAAL.idcarpeta',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.FLUJO        FLUJ ON FLUJ.idflujo = CARP.idflujo',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TAREA        TARE ON TARE.idtarea = FLUJ.idtareaproxima',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.CAJA              ON CAJA.idcaja = CARP.idcaja',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SERIEDOCUMENTAL SEDO ON '
                      + 'SEDO.idseriedocumental = CARP.idseriedocumental',[DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TIPOSERIEDOCUMENTAL TISD ON '
                      + 'TISD.idtiposeriedocumental = SEDO.idtiposeriedocumental',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SERIESUBSERIE SESU ON SESU.idseriesubserie = CAAL.idseriesubserie',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.SUBSERIEDOCUMENTAL SUBD ON '
                      + 'SUBD.idsubseriedocumental = SESU.idseriedocumental',[DMConexion.esquema]));
      SQL.Add(Format('LEFT JOIN %s.DATOPLANILLA DAPL ON DAPL.iddatoplanilla = FOLI.iddatoplanilla',
                      [DMConexion.esquema]));
      SQL.Add(Format('LEFT JOIN %s.FONDO        FOND ON FOND.idfondo = DAPL.idfondo',
                      [DMConexion.esquema]));
      SQL.Add('       WHERE IMAG.version = (SELECT MAX(version)');
      SQL.Add(Format('                        FROM %s.IMAGEN ',[DMConexion.esquema]));
      SQL.Add('                               WHERE idfolio = FOLI.idfolio)');
      SQL.Add(Format('      AND FOLI.codigofolio >= ''%s''', [p_CodiFoli]));
      SQL.Add(Format('      AND CARP.codigocarpeta = ''%s''', [leftstr(p_CodiFoli,8)]));
      SQL.Add('             AND NOT COFO.bloqueado AND COFO.fechadesbloqueo IS NOT NULL');
      SQL.Add('             AND COFO.IDTAREA = 4 '); // VERIFICA QUE ESTE EN TAREA CAPTURA EN LA TABLABLOQUEO
      SQL.Add('             AND CARP.IDFLUJO = 4'); // VERIFICA QUE LA CARPETA ESTE EN ESTADO GENERACION XML
      SQL.Add('       ORDER BY FOLI.codigofolio ');
      SQL.Add('       LIMIT 2');

      open;
      first;
      if (not Eof) then
      begin
        Result.IdFolio            := FieldByName('idfolio').value;
        Result.CodigoFolio        := FieldByName('codigofolio').asstring;
        Result.secuenciafolio     := FieldByName('secuenciafolio').value;
        Result.IdDatoPlanilla     := FieldByName('iddatoplanilla').asstring;
        Result.NombreImagen       := FieldByName('nombreimagen').AsString;
        Result.IdCarpeta          := FieldByName('idcarpeta').value;
        Result.IdTarea            := FieldByName('idtarea').value;
        Result.CodigoCaja         := FieldByName('codigocaja').AsString;
        Result.DescSerieDocum     := FieldByName('descripcionseriedocumental').AsString;
        Result.DescTipoSerieDocum := FieldByName('descripciontiposeriedocumental').AsString;
        Result.DescSubSerieDocum  := FieldByName('descripcionsubseriedocumental').AsString;
        Result.DiasBloqueo        := FieldByName('p_diasbloq').value;
        Result.HorasBloqueo       := FieldByName('p_horabloq').value;
        Result.ServidorFtp        := FieldByName('servidorftp').AsString;
        Result.RutaFtp            := FieldByName('rutaftp').AsString;
        Result.RutaFtp            := ifThen(AnsiRightStr(Result.RutaFtp,1) = '\',
                                            Result.RutaFtp,Result.RutaFtp + '\');
        Result.FechaNomina        := FieldByName('fechanomina').asstring;
        Result.IdFondo            := StrToInt(ifthen(FieldByName('idfondo').asstring = '',
                                                '0', FieldByName('idfondo').asstring));
        Result.PeriodoCotizacion  := AnsiRightStr(FieldByName('periodocotizacion').AsString,7);
        Result.FechaPagoBanco     := FieldByName('fechapago').asstring;
        Next;
        Result.CodigoFolioSigu:= '';
        if (not Eof) then
          Result.CodigoFolioSigu := FieldByName('codigofolio').asstring;
        Close;
        SQL.Clear;
        SQL.Add('SELECT OBFO.idfolio, OBFO.observacion ');
        SQL.Add(Format('FROM %s.OBSERVACIONFOLIO OBFO ', [DMConexion.esquema]));
        SQL.Add(Format('INNER JOIN %s.TAREA TARE ON TARE.idtarea = OBFO.idtarea',
                        [DMConexion.esquema]));
        SQL.Add(Format('WHERE OBFO.idfolio = %d',[Result.IdFolio]));
        SQL.Add(       '   AND OBFO.tipoobservacion = ''R''');
        SQL.Add(Format('   AND  TARE. descripciontarea = ''%s''',[p_DescTare]));
        SQL.Add(       'ORDER BY OBFO.idfolio');
        open;
        first;
        while not Eof do
        begin
          Result.NovedadesFolio.add(FieldByName('observacion').AsString);
          Next;
        end;
      end;
    end;
  except
    on E:exception do
      raise Exception.Create(format('No es posible consultar el folio [%s].',[p_CodiFoli])
                                    + #10#13 + '* '+ e.Message);
  end;
end;

Function TDAOCaptura.CambiarEstadoCarpeta(p_IdenCarp: int32) : Boolean;
var
  DescDeci: string;
begin
  Result:= False;
  with FQuery do
  begin
    Close;
    SQL.Clear;
    {LA SIGUIENTE CONSULTA CUENTA CANTIDAD DE FOLIOS CAPTURABLES DE LA CARPETA, CUANTOS DE
      ELLOS ESTAN DESBLOQUEADOS Y CUANTOS DE ELLOS TIENEN NOVEDAD DE CAPTURA}

    SQL.Add('SELECT COUNT(FOLI.capturable) AS cantidadcapturables, ');
    SQL.Add('       SUM(CASE WHEN COFO.bloqueado = FALSE THEN 1 ELSE 0 END) '
                    + ' AS cantidaddesbloqueados, ');
    SQL.Add('       SUM (CASE WHEN EXISTS (SELECT idobservacionfolio ');
    SQL.Add(Format('                         FROM %s.OBSERVACIONFOLIO OBFO ',
                    [DMConexion.esquema]));
    SQL.Add(Format('                         INNER JOIN %s.TAREA TARE ON '
                                              + '(TARE.idtarea = OBFO.idtarea) ',
                    [DMConexion.esquema]));
    SQL.Add('                                WHERE OBFO.idfolio = FOLI.idfolio ');
    SQL.Add('                                   AND TARE.descripciontarea = ''CAPTURA'')');
    SQL.Add('                                      THEN 1 ELSE 0 END) AS cantidadnovedades ');
    SQL.Add(Format('FROM %s.CARPETAALETA CAAL', [DMConexion.esquema]));
    SQL.Add(Format('INNER JOIN %s.FOLIO FOLI ON (FOLI.idcarpetaaleta = CAAL.idcarpetaaleta)',
                    [DMConexion.esquema]));
    SQL.Add(Format('LEFT JOIN %s.CONTROLFOLIO COFO ON COFO.idfolio = FOLI.idfolio',
                    [DMConexion.esquema]));
     SQL.Add(Format('LEFT JOIN %s.TAREA TARE ON TARE.idtarea = COFO.idtarea',
                    [DMConexion.esquema]));
    SQL.Add(Format('WHERE CAAL.idcarpeta = %d ', [p_IdenCarp]));
    SQL.Add('             AND  FOLI.capturable ');
    SQL.Add('             AND  (TARE.descripciontarea IS NULL '
                                + ' OR TARE.descripciontarea= ''CAPTURA'') ');
    open;
    first;
    if not eof then
    begin
      {SE VERIFICA SI LA CANTIDAD DE FOLIOS ES IGUAL A LOS DESBLOQUEADOS}
      if FieldByName('cantidadcapturables').Value =
            FieldByName('cantidaddesbloqueados').Value then
      begin
        {SI HAY MINIMO UNA NOVEDAD EL ESTADO DE LA CARPETA SE VA POR PROCESO NOVEDAD}
        if FieldByName('cantidadnovedades').value = 0 then
          DescDeci:= 'GUARDADO SATISFACTORIO'
        else
          DescDeci:= 'PROCESO NOVEDAD';

        Close;
        SQL.Clear;
        SQL.Add('SELECT * ');
        SQL.Add(Format('FROM %s.FNC_ASIGNARFLUJOCARPETA (%d,''%s'')',
                      [DMConexion.esquema, p_IdenCarp, DescDeci]));
        open;
      end;
    end
    else
      raise Exception.Create(Format('No es posible verificar la completitud de la '
                                    + 'Carpeta con ID [%d].',[p_IdenCarp]));
  end;
end;

function TDAOCaptura.ConsultarDatosANI(p_DescTipoIden: string; p_numedocu: string;
                                        p_primnomb:string; p_primapel:string): TDataSource;
{ FUNCION QUE BUSCA DATOS DE PERSONAS EN LA BASE DE DATOS DE ANI
}
const
  Esquema = 'andes_ani';
var
  adicwher : string;
  QuerDatosANI: TZQuery;
begin
  try
    QuerDatosANI:= TZQuery.Create(nil);
    QuerDatosANI.Connection:= DMConexion.conBDANI;
    Result:= TDataSource.Create(nil);
    adicwher := '';
    with QuerDatosANI do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT numerocedula AS numerodocumento, primernombre, segundonombre, ');
      SQL.Add('       CAST(CASE WHEN TRIM(segundonombre) IS NULL ');
      SQL.Add('               THEN TRIM(primernombre) ');
      SQL.Add('               ELSE TRIM(primernombre) || '' '' || TRIM(segundonombre)');
      SQL.Add('            END AS CHARACTER VARYING) AS nombres , ');
      SQL.Add('       primerapellido, segundoapellido, ');
      SQL.Add('       CAST(CASE WHEN TRIM(segundoapellido) IS NULL ');
      SQL.Add('               THEN TRIM(primerapellido) ');
      SQL.Add('               ELSE TRIM(primerapellido) || '' '' || TRIM(segundoapellido)');
      SQL.Add('            END AS CHARACTER VARYING) AS apellidos,  ');
      SQL.Add(Format('''%s'' AS descripciontipoidentificacion ', [p_DescTipoIden]));
      SQL.Add(Format('FROM %s.CEDULA ', [Esquema]));
      SQL.Add('       WHERE ');
      if p_numedocu <> '' then
        adicwher:= Format('numerocedula LIKE ''%s''',['%' + p_numedocu + '%']);

      if p_primnomb <> '' then
        adicwher:= adicwher + IfThen(adicwher <> '',' and ', '')
                      + Format('primernombre LIKE ''%s''',['%' + p_primnomb + '%']);

      if p_primapel <> '' then
        adicwher:= adicwher + IfThen(adicwher <> '',' and ', '')
                      + Format('primerapellido LIKE ''%s''',['%' + p_primapel + '%']);
      SQL.Add(adicwher);
      SQL.Add('       ORDER BY primernombre,segundonombre NULLS FIRST, primerapellido, '
                      + 'segundoapellido NULLS FIRST');
      open;
      first;
      result.DataSet:=QuerDatosANI;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar información de Base de Datos ANI.'
                              + #10#13 + '* '+ e.Message);

  end;
end;


function TDAOCaptura.ConsultarDatosAsociados(p_IdenFoli: int64): TDataSource;
{ FUNCION QUE BUSCA DATOS DE PERSONAS ASOCIADAS AL FOLIO
}
var
  QuerDatoAsoc: TZQuery;
begin
  try
    QuerDatoAsoc:= TZQuery.Create(nil);
    QuerDatoAsoc.Connection:= DMConexion.ZConexion;
    Result:= TDataSource.Create(nil);
    with QuerDatoAsoc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FOID.idfolioidentificacion, IDEN.numerodocumento, TIID.descripciontipoidentificacion,');
      SQL.Add('       CAST(CASE WHEN TRIM(PERS.segundonombre) IS NULL ');
      SQL.Add('               THEN TRIM(PERS.primernombre) ');
      SQL.Add('               ELSE TRIM(PERS.primernombre) || '' '' || TRIM(PERS.segundonombre)');
      SQL.Add('            END AS CHARACTER VARYING) AS nombres , ');
      SQL.Add('       CAST(CASE WHEN TRIM(PERS.segundoapellido) IS NULL ');
      SQL.Add('               THEN TRIM(PERS.primerapellido) ');
      SQL.Add('               ELSE TRIM(PERS.primerapellido) || '' '' || TRIM(PERS.segundoapellido)');
      SQL.Add('            END AS CHARACTER VARYING) AS apellidos ');
      SQL.Add(Format('FROM %s.FOLIOIDENTIFICACION FOID ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.IDENTIFICACION IDEN ON IDEN.ididentificacion = FOID.ididentificacion',
                        [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.PERSONA PERS ON PERS.idpersona = IDEN.idpersona',
                        [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TIPOIDENTIFICACION TIID ON '
                        + 'TIID.idtipoidentificacion = IDEN.idtipoidentificacion',
                        [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      SQL.Add(Format('      FOID.idfolio = %d',[p_idenfoli]));
      SQL.Add('       ORDER BY FOID.idfolioidentificacion');
      open;
      first;
      result.DataSet:=QuerDatoAsoc;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar información de personas asociadas al Folio.'
                              + #10#13 + '* '+ e.Message);

  end;
end;

function TDAOCaptura.ConsultarDatosMTI(p_identipo: Variant; p_numedocu: string;
                         p_primnomb:string; p_primapel:string): TDataSource;
{ FUNCION QUE BUSCA DATOS DE PERSONAS EN LA BASE DE DATOS DE MTI
}
var
  adicwher : string;
  QuerDatosMTI: TZQuery;
begin
  try
    QuerDatosMTI:= TZQuery.Create(nil);
    QuerDatosMTI.Connection:= DMConexion.ZConexion;
    Result:= TDataSource.Create(nil);
    adicwher := '';
    with QuerDatosMTI do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT TIID.idtipoidentificacion, TIID.descripciontipoidentificacion, ');
      SQL.Add('       IDEN.ididentificacion, IDEN.numerodocumento, ');
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
      // LA SIGUIENTE LINEA ES TEMPORAL PARA QUE NO TRAIGA DATOS DE PERSONAS GRABADAS CON NUMERO PATRONAL  [2016-02-26]
      SQL.Add('           DESCRIPCIONTIPOIDENTIFICACION <> ''NÚMERO PATRONAL'' AND ');
      ///////////////////////////////////////////////////////////////////////////////////////////////////
      if p_identipo <> NULL then
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
      result.DataSet:=QuerDatosMTI;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar información de Base de Datos MTI.'
                              + #10#13 + '* '+ e.Message);

  end;
end;

function TDAOCaptura.ConsultarFondos: TDataSource;
var
  QuerFond: TZQuery;
begin
  try
    QuerFond:= TZQuery.Create(nil);
    QuerFond.Connection:= DMConexion.ZConexion;
    Result:= TDataSource.Create(nil);
    with QuerFond do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT idfondo, descripcionfondo');
      SQL.Add(Format('FROM %s.FONDO',[DMConexion.Esquema]));
      SQL.Add('       ORDER BY 2');
      Open;
      First;
      Result.DataSet := QuerFond;
    end;
  except
      on E:exception do
        raise Exception.Create('No es posible consultar los Fondos-Entidades.'
                                + #10#13 + '* '+ e.Message);
  end;
end;

function TDAOCaptura.ConsultarPersonasFolio(p_idenfoli: int64): TList;
// FUNCION QUE BUSCA LOS DATOS DEL FOLIO QUE SE HAYAN CAPTURADO
var
  DatoCapt : TRegistroCaptura;
begin
  try
    Result := TList.Create;
    with FQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FOID.idfolio, TIID.descripciontipoidentificacion, ');
      SQL.Add('       FUID.descripcionfuenteidentificacion,  IDEN.ididentificacion, ');
      SQL.Add('       IDEN.numerodocumento, PERS.idpersona, PERS.primernombre, ');
      SQL.Add('       PERS.segundonombre, PERS.primerapellido, PERS.segundoapellido ');
      SQL.Add(Format('FROM %s.FOLIOIDENTIFICACION FOID ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.IDENTIFICACION IDEN ON IDEN.ididentificacion = FOID.ididentificacion',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.TIPOIDENTIFICACION TIID ON '
                      + 'TIID.idtipoidentificacion = IDEN.idtipoidentificacion',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.FUENTEIDENTIFICACION FUID ON '
                      + 'FUID.idfuenteidentificacion = IDEN.idfuenteidentificacion',
                      [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.PERSONA PERS ON PERS.idpersona = IDEN.idpersona',
                      [DMConexion.esquema]));
      SQL.Add(Format('WHERE FOID.idfolio = %d',[p_idenfoli]));
      open;
      first;
      while not Eof do
      begin
        DatoCapt:= TRegistroCaptura.Create;
        DatoCapt.IdFolio:= FieldByName('idfolio').Value;
        DatoCapt.DescripcionTipoIdentificacion:= FieldByName('DescripcionTipoIdentificacion').Value;
        DatoCapt.descripcionfuenteidentificacion:= FieldByName('descripcionfuenteidentificacion').Value;
        DatoCapt.ididentificacion:= FieldByName('ididentificacion').Value;
        DatoCapt.numerodocumento:= FieldByName('numerodocumento').Value;
        DatoCapt.idpersona:= FieldByName('idpersona').Value;
        DatoCapt.primernombre:= FieldByName('primernombre').AsString;
        DatoCapt.segundonombre:= FieldByName('segundonombre').AsString;
        DatoCapt.primerapellido:= FieldByName('primerapellido').AsString;
        DatoCapt.segundoapellido:= FieldByName('segundoapellido').AsString;
        Result.Add(DatoCapt);
        DatoCapt.Free;
        Next;
      end;
    end;

  except
    on E:exception do
      raise Exception.Create('No es posible consultar datos de las personas asociadas al Folio.'
                              + #10#13 + '* '+ e.Message);

  end;

end;

function TDAOCaptura.ConsultarTiposIdentificacion: TDataSource;
{ FUNCION QUE BUSCA LOS TIPOS DE IDENTIFICACION
}
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
      SQL.Add('SELECT idtipoidentificacion, descripciontipoidentificacion');
      SQL.Add(Format('FROM %s.TIPOIDENTIFICACION ', [DMConexion.esquema]));
      // LA SIGUIENTE LINEA ES TEMPORAL PARA QUE NO TRAIGA TIPO DE IDENTIFICACION NUMERO PATRONAL  [2016-02-26]
      SQL.Add('       WHERE descripciontipoidentificacion <> ''NÚMERO PATRONAL''');
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
      SQL.Add('       ORDER BY 2');
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

Function TDAOCaptura.DesbloquearFolio(p_IdenFoli: int64; p_DescTare: string) : Boolean;
begin
  Result:= False;
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add(Format('FROM %s.FNC_DESBLOQUEARFOLIO(%d,''%s'')',
                  [DMConexion.esquema, p_IdenFoli,p_DescTare]));
    open;
    First;
    if (not eof) and (FieldByName('p_folidesb').asstring <> '') then
      result := True;
  end;
end;

procedure TDAOCaptura.EliminarDatosAsociacion(p_IdenFoid: int64; p_IdenFoli: Int64;
                                              p_IdenCarp: Int64; p_IdenDapl: string);
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('DELETE FROM %s.FOLIOIDENTIFICACION ', [DMConexion.esquema]));
    SQL.Add(Format('  WHERE idfolioidentificacion = %d ',[p_IdenFoid]));
    SQL.Add('         RETURNING idfolioidentificacion ');
    Open;
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT count(*) AS PERSONASFOLIO');
      SQL.Add(Format('FROM %s.FOLIOIDENTIFICACION FOID ', [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      SQL.Add(Format('      FOID.idfolio = %d',[p_IdenFoli]));
      open;
      if FieldByName('personasfolio').Value = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format('DELETE FROM %s.CONTROLFOLIO ', [DMConexion.esquema]));
        SQL.Add(Format('  WHERE idfolio = %d ',[p_IdenFoli]));
        Open;
        Close;
        SQL.Clear;
        SQL.Add(Format('DELETE FROM %s.OBSERVACIONFOLIO', [DMConexion.esquema]));
        SQL.Add(Format('  WHERE idfolio = %d ',[p_IdenFoli]));
        SQL.Add('               AND idtarea = 4');
        Open;
        if p_IdenDapl <> ''  then
        begin
          Close;
          SQL.Clear;
          SQL.Add(Format('UPDATE %s.FOLIO', [DMConexion.esquema]));
          SQL.Add('         SET iddatoplanilla = NULL');
          SQL.Add(Format('  WHERE idfolio = %d ',[p_IdenFoli]));
          Open;
          Close;
          SQL.Clear;
          SQL.Add(Format('DELETE FROM %s.DATOPLANILLA ', [DMConexion.esquema]));
          SQL.Add(Format('  WHERE iddatoplanilla = %s ',[p_IdenDapl]));
          Open;
        end;
        Close;
        SQL.Clear;
        SQL.Add(Format('UPDATE %s.CARPETA', [DMConexion.esquema]));
        SQL.Add('         SET idflujo= 3');
        SQL.Add(Format('  WHERE idcarpeta = %d ',[p_IdenCarp]));
        Open;
      end;
    end
    else
      raise Exception.Create
                (Format('Imposible eliminar la asociación de la persona solicitada. ID [%d].',
                        [p_IdenFoid]));
  end;
end;


{LOS DOS SIGUIENTES PROCEDIMIENTOS  RegistrarMarcaFolio Y EliminarBloqueoFolioNoCapturable
  SON TEMPORALES PARA SUBSANAR EL HECHO DE TENER TODOS LOS FOLIOS COMO 'CAPTURABLES'.}
procedure TDAOCaptura.RegistrarMarcaFolio(p_IdenFoli: int64);
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('UPDATE %s.FOLIO ', [DMConexion.esquema]));
    SQL.Add(       '  SET capturable = FALSE');
    SQL.Add(Format('  WHERE idfolio = %d ',[p_IdenFoli]));
    SQL.Add('         RETURNING idfolio');
    Open;
    if IsEmpty then
      raise Exception.Create
                (Format('Imposible registrar el Folio con ID [%d] como NO-CAPTURABLE.',
                        [p_IdenFoli]));
  end;

end;
procedure TDAOCaptura.EliminarBloqueoFolioNoCapturable(p_IdenFoli: int64);
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('DELETE FROM %s.CONTROLFOLIO ', [DMConexion.esquema]));
    SQL.Add(Format('  WHERE idfolio = %d ',[p_IdenFoli]));
    SQL.Add('               AND idtarea in (SELECT idtarea ');
    SQL.Add(Format('                          FROM  %s.TAREA', [DMConexion.esquema]));
    SQL.Add(       '                          WHERE descripciontarea = ''CAPTURA'')');
    SQL.Add('         RETURNING idfolio');
    Open;
    if IsEmpty then
      raise Exception.Create
                (Format('Imposible eliminar el bloqueo del Folio con ID [%d].',
                        [p_IdenFoli]));
  end;
end;


///////////////////////////////////////////////////////////////////////////////////////////////


{$REGION 'CONTROL DE TRANSACCIONES'}

procedure TDAOCaptura.CancelarTransaccion;
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

procedure TDAOCaptura.FinalizarTransaccion;
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

procedure TDAOCaptura.IniciarTransaccion;
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

{$ENDREGION}


{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}
constructor TDAOCaptura.create;
begin
  FQuery:= TZQuery.create(nil);
  FQuery.Connection:= DMConexion.ZConexion;
end;

destructor TDAOCaptura.destroy;
begin
  FQuery.Close;
  FQuery.Connection.Disconnect;
  FQuery.free;
end;
{$ENDREGION}
end.
