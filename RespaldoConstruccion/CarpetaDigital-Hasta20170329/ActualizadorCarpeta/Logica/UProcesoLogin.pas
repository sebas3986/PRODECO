unit UProcesoLogin;

interface

uses
  Windows, Sysutils, StrUtils, IOUtils, classes, DB, DBClient,  ZDataset,
  UDAOLogin;

type

  TProcesoLogin = class
    private
      FCodigoUsuario : string;
      FNombreUsuario : string;

    public
      {CONSTRUCTORES Y DESTRUCTORES}

      {PROPIEDADES}
      property CodigoUsuario       : string        read FCodigoUsuario;
      property NombreUsuario       : string        read FNombreUsuario;

      {METODOS PROPIOS}
      procedure ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string);

  end;


implementation

var
  DAOLogin: TDAOLogin;

procedure TProcesoLogin.ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string);
begin
  DAOLogin:=TDAOLogin.Create;
  FNombreUsuario:=DAOLogin.ConsultarDatosUsuario(p_CodiUsua, p_ClavAcce);
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}

{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
