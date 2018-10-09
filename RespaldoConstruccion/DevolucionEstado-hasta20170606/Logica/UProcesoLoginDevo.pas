unit UProcesoLoginDevo;

interface

uses
  UUsuarioDevolucionEsta, UDAOLoginDevo;

type

  TProcesoLoginDevo = class
    private
      FDatosUsuarioDevolucionEsta : TUsuarioDevolucionEsta;

    public
      constructor Create;
      destructor  Destroy;

      {CONSTRUCTORES Y DESTRUCTORES}

      {PROPIEDADES}
      property DatosUsuarioDevolucionEsta : TUsuarioDevolucionEsta        read FDatosUsuarioDevolucionEsta;
      {METODOS PROPIOS}
      function ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string): TUsuarioDevolucionEsta;

  end;


implementation

var
  DAOLoginDev: TDAOLoginDevo;

function TProcesoLoginDevo.ObtenerDatosUsuario(p_CodiUsua: string; p_ClavAcce:string):TUsuarioDevolucionEsta;
begin
  FDatosUsuarioDevolucionEsta:=DAOLoginDev.ConsultarDatosUsuario(p_CodiUsua, p_ClavAcce);
end;

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TProcesoLoginDevo.Create;
begin
  DAOLoginDev:=TDAOLoginDevo.Create;
  FDatosUsuarioDevolucionEsta:= TUsuarioDevolucionEsta.create;
end;
destructor TProcesoLoginDevo.Destroy;
begin
  DAOLoginDev.free;
  FDatosUsuarioDevolucionEsta.free;
end;

{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
