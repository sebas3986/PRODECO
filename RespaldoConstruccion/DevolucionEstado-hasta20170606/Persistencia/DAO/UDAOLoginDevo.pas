unit UDAOLoginDevo;

interface
uses
  SysUtils,
  zdataset,
  UUsuarioDevolucionEsta,
  UDMConexion;

type
  TDAOLoginDevo = class
    private

    public
      {CONSTRUCTORES Y DESTRUCTORES}
     
      { PROCEDIMIENTOS Y FUNCIONES }
      function ConsultarDatosUsuario(p_CodiUsua:string; p_ClavAcce:string): TUsuarioDevolucionEsta;

  end;

implementation



{$REGION 'METODOS PROPIOS'}

function TDAOLoginDevo.ConsultarDatosUsuario(p_CodiUsua: string; p_ClavAcce:string): TUsuarioDevolucionEsta;
{ FUNCION QUE BUSCA DATOS DE UN USUARIO }
var
  QuerDatoUsua: TZQuery;

begin
  Result:= TUsuarioDevolucionEsta.Create;
  try
    QuerDatoUsua:= TZQuery.Create(nil);
    QuerDatoUsua.Connection:= DMConexion.ZConexion;
    with QuerDatoUsua do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT USCA.codigousuariocarpeta, USCA.nombreusuariocarpeta, '
                      + 'PEUS.idperfilusuario, PEUS.descripcionperfilusuario');
      SQL.Add(Format('FROM %s.USUARIOCARPETA USCA ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.PERFILUSUARIO PEUS ON PEUS.idperfilusuario = USCA.idperfilusuario ',
                      [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      SQL.Add(Format('       USCA.CLAVEUSUARIOCARPETA = MD5(''%s'')',[p_ClavAcce]));
      open;
      first;
      if not Eof then
      begin
        Result.CodigoUsuarioDevo     := FieldByName('codigousuariocarpeta').Value;
        Result.NombreUsuarioDevo     := FieldByName('nombreusuariocarpeta').Value;
        Result.IdPerfilDevo          := FieldByName('idperfilusuario').Value;
        Result.DescripcionPerfilDevo := FieldByName('descripcionperfilusuario').Value;
      end;
    end;
  except
    on E:exception do
      raise Exception.Create('No es posible consultar la información del Usuario.'
                              + #10#13 + '* '+ e.Message);

  end;
end;

{$ENDREGION}


{$REGION 'CONSTRUCTOR Y DESTRUCTOR'}

{$ENDREGION}
end.
