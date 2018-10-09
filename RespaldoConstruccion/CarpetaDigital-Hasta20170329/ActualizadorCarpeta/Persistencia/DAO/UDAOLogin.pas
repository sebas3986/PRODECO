unit UDAOLogin;

interface
uses
  SysUtils,StrUtils,Classes,DB,DBClient, zdataset,  ZDbcIntfs,
  Variants, UDMConexion;

type
  TDAOLogin = class
    private

    public
      {CONSTRUCTORES Y DESTRUCTORES}
     
      { PROCEDIMIENTOS Y FUNCIONES }
      function ConsultarDatosUsuario(p_CodiUsua:string; p_ClavAcce:string): string;

  end;

implementation



{$REGION 'METODOS PROPIOS'}

function TDAOLogin.ConsultarDatosUsuario(p_CodiUsua: string; p_ClavAcce:string): string;
{ FUNCION QUE BUSCA DATOS DE UN USUARIO }
var
  QuerDatoUsua: TZQuery;

begin
  try
    Result:='';
    QuerDatoUsua:= TZQuery.Create(nil);
    QuerDatoUsua.Connection:= DMConexion.ZConexion;
    with QuerDatoUsua do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT USCA.nombreusuariocarpeta ');
      SQL.Add(Format('FROM %s.USUARIOCARPETA USCA ', [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      SQL.Add(Format('       USCA.CLAVEUSUARIOCARPETA = MD5(''%s'')',[p_ClavAcce]));
      open;
      first;
      if not Eof then
        Result:= FieldByName('nombreusuariocarpeta').Value;
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
