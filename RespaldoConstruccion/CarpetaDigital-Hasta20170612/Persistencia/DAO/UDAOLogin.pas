unit UDAOLogin;

interface
uses
  SysUtils,StrUtils,Classes,DB,DBClient, zdataset,  ZDbcIntfs,
  Variants, UUsuarioCarpetaDigi, UDMConexion;

type
  TDAOLogin = class
    private

    public
      {CONSTRUCTORES Y DESTRUCTORES}
     
      { PROCEDIMIENTOS Y FUNCIONES }
      function ConsultarDatosUsuario(p_CodiUsua:string; p_ClavAcce:string): TUsuarioCarpetaDigi;

  end;

implementation


{$REGION 'METODOS PROPIOS'}

function TDAOLogin.ConsultarDatosUsuario(p_CodiUsua: string; p_ClavAcce:string): TUsuarioCarpetaDigi;
{ FUNCION QUE BUSCA DATOS DE UN USUARIO }
var
  QuerDatoUsua: TZQuery;

begin
  Result:= TUsuarioCarpetaDigi.Create;
  try
    QuerDatoUsua:= TZQuery.Create(nil);
    QuerDatoUsua.Connection:= DMConexion.ZConexion;
    with QuerDatoUsua do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT USCA.codigousuariocarpeta, USCA.nombreusuariocarpeta, ');
      SQL.Add('       PEUS.idperfilusuario, PEUS.descripcionperfilusuario, USCA.habilitado ');
      SQL.Add(Format('FROM %s.USUARIOCARPETA USCA ', [DMConexion.esquema]));
      SQL.Add(Format('INNER JOIN %s.PERFILUSUARIO PEUS ON '
                     + 'PEUS.idperfilusuario = USCA.idperfilusuario', [DMConexion.esquema]));
      SQL.Add('       WHERE ');
      SQL.Add(Format('       USCA.codigousuariocarpeta = ''%s''',[p_CodiUsua]));
      SQL.Add(Format('       AND USCA.CLAVEUSUARIOCARPETA = MD5(''%s'')',[p_ClavAcce]));
      open;
      first;
      if not Eof then
      begin
        Result.CodigoUsuarioCarpeta     := FieldByName('codigousuariocarpeta').Value;
        Result.NombreUsuarioCarpeta     := FieldByName('nombreusuariocarpeta').Value;
        Result.IdPerfilCarpeta          := FieldByName('idperfilusuario').Value;
        Result.DescripcionPerfilCarpeta := FieldByName('descripcionperfilusuario').Value;
        Result.Habilitado               := FieldByName('habilitado').Value;
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
