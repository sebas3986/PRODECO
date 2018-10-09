unit UProcesoLogin;

interface

uses
  Sysutils, StrUtils, IOUtils,
  UUsuarioCarpetaDigi, UDAOLogin;

type

  TProcesoLogin = class
    private
      FDatosUsuarioCarpeta  : TUsuarioCarpetaDigi;

    public
      constructor Create;
      destructor  Destroy;

      {CONSTRUCTORES Y DESTRUCTORES}

      {PROPIEDADES}
      property DatosUsuarioCarpeta : TUsuarioCarpetaDigi        read FDatosUsuarioCarpeta;
      {METODOS PROPIOS}
      function ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string): TUsuarioCarpetaDigi;

  end;


implementation

var
  DAOLogin: TDAOLogin;

function TProcesoLogin.ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string):TUsuarioCarpetaDigi;
begin
  FDatosUsuarioCarpeta:=DAOLogin.ConsultarDatosUsuario(p_CodiUsua, p_ClavAcce);
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoLogin.Create;
begin
  DAOLogin:=TDAOLogin.Create;
  FDatosUsuarioCarpeta:= TUsuarioCarpetaDigi.create;
end;
destructor TProcesoLogin.Destroy;
begin
  DAOLogin.free;
  FdatosUsuarioCarpeta.free;
end;

{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
