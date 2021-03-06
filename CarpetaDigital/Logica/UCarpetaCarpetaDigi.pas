unit UCarpetaCarpetaDigi;

interface

uses
  Classes;

type

  TCarpetaCarpetaDigi = class
    private
      FEstadoCarpetaCrea  : Boolean;      {ESTADO DE HABILITADO DE LA CARPETA DE CREACION}
      FEstadoCarpetaInse  : Boolean;      {ESTADO DE HABILITADO DE LA ULTIMA CARPETA DE INSRCION}
      FEtapaCarpetaCrea   : string;       {TAREA EN LA CUAL SE ENCUENTRA LA CARPETA DE CREACION}
      FEtapaCarpetaInse   : string;       {TAREA EN LA CUAL SE ENCUENTRA ULTIMA CARPETA DE INSRCION}

    public
      property EstadoCarpetaCrea  : Boolean read FEstadoCarpetaCrea write FEstadoCarpetaCrea;
      property EstadoCarpetaInse  : Boolean read FEstadoCarpetaInse write FEstadoCarpetaInse;
      property EtapaCarpetaCrea   : string  read FEtapaCarpetaCrea  write FEtapaCarpetaCrea;
      property EtapaCarpetaInse   : string  read FEtapaCarpetaInse  write FEtapaCarpetaInse;

      {CONSTRUCTOR - DESTRUCTOR}
      constructor Create;
      destructor  Destroy;


 end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TCarpetaCarpetaDigi.Create;
begin

end;

destructor TCarpetaCarpetaDigi.Destroy;
begin

end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}
{$ENDREGION}

end.
