unit Imagen;

interface

uses
  Windows, SysUtils;

type
  TZonificacion = class
    Top         : Integer;
    Left        : Integer;
    Bottom      : Integer;
    Right       : Integer;
  end;

  TImagen = class
    private
      FNombre    : string;   {NOMBRE DEL ARCHIVO}
      FExtension : string;   {EXTENSION DEL ARCHIVO}
      FSizeImagen: Int64;    {TAMANIO DEL ARCHIVO}
      FUbicLocal : string;   {UBICACION LOCAL}
      FUbicServ  : string;   {UBICACION SERVIDOR}
      FTiemCread : TDateTime;{TIEMPO ARCHIVO CREADO}
      FNovedad   : string;   {NOVEDAD DE LA IMAGEN ENCONTRADA}
      FTIpo      : string;   {ESTRUCTURA CODM}
      FDocumento : string;   {ESTRUCTURA CODM}
      Fkey       : string;   {ESTRUCTURA CODM}
      Fpaginas   : Integer;  {CANTIDAD DE PAGINAS DEL ARCHIVOS}
      FIPImagen  : string;
      FPCImagen  : string;
      FZonifica  : TZonificacion;

      {GETTERS AND SETTERS}
      function  GetNombre():string;
      procedure SetNombre(Valor:string);

      function  GetExtension():string;
      procedure SetExtension(Valor:string);

      function  GetSizeImagen():Int64;
      procedure SetSizeImagen(Valor:Int64);

      function  GetUbicLocal():string;
      procedure SetUbicLocal(Valor:string);

      function  GetUbicServ():string;
      procedure SetUbicserv(Valor:string);

      function  GetTiempoCread():TDateTime;
      procedure SetTiempoCread(Valor:TDateTime);

      function  GetNovedadImag():string;
      procedure SetNovedadImag(valor:string);

      function  GetTipo():string;
      procedure SetTipo(valor:string);

      function  GetDocumento():string;
      procedure SetDocumento(valor:string);

      function  GetKey():string;
      procedure SetKey(valor:string);

      function  GetPaginas():Integer;
      procedure SetPaginas(valor:Integer);

      function  GetIPImagen():string;
      procedure SetIPImagen(valor:string);

      function  GetPCImagen():string;
      procedure SetPCImagen(valor:string);

    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;

      property NombreImagen  : string    read GetNombre      write SetNombre;
      property ExtenImagen   : string    read GetExtension   write SetExtension;
      property SizeImagen    : Int64     read GetSizeImagen  write SetSizeImagen;
      property UbicLocalImg  : string    read GetUbicLocal   write SetUbicLocal;
      property UbicServImg   : string    read GetUbicserv    write SetUbicServ;
      property TiempoCread   : TDateTime read GetTiempoCread write SetTiempoCread;
      property NovedadImg    : string    read GetNovedadImag write SetNovedadImag;
      property CodMTipoImg   : string    read GetTipo        write SetTipo;
      property CodMDocuImg   : string    read GetDocumento   write SetDocumento;
      property CodMKeyImg    : string    read GetKey         write SetKey;
      property PaginasImg    : Integer   read GetPaginas     write SetPaginas;
      property IPImagen      : string    read GetIPImagen    write SetIPImagen;
      property PcImagen      : string    read GetPCImagen    write SetPCImagen;
      property Zonificacion  : TZonificacion read FZonifica  write FZonifica;


{METHODS}

  end;


implementation

{ TImagen }

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TImagen.Create;
begin
  inherited;
  FZonifica := TZonificacion.Create;
  FNovedad := '';
end;

destructor TImagen.Destroy;
begin
  inherited;
  FZonifica.Free;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}
function  TImagen.GetNovedadImag():string;
begin
  Result := FNovedad;
end;

procedure TImagen.SetNovedadImag(valor:string);
begin
  FNovedad := valor;
end;

function  TImagen.GetNombre():string;
begin
  Result := FNombre;
end;

procedure TImagen.SetNombre(Valor:string);
begin
  FNombre := Valor;
end;

function  TImagen.GetExtension():string;
begin
  Result := FExtension;
end;

procedure TImagen.SetExtension(Valor:string);
begin
  FExtension := Valor;
end;

function  TImagen.GetSizeImagen():Int64;
begin
  Result := FSizeImagen;
end;

procedure TImagen.SetSizeImagen(Valor:Int64);
begin
  FSizeImagen := Valor;
end;

function  TImagen.GetUbicLocal():string;
begin
  Result := FUbicLocal;
end;

procedure TImagen.SetUbicLocal(Valor:string);
begin
  FUbicLocal := Valor;
end;

function  TImagen.GetUbicServ():string;
begin
  Result := FUbicServ;
end;

procedure TImagen.SetUbicserv(Valor:string);
begin
  FUbicServ := Valor;
end;

function  TImagen.GetTiempoCread():TDateTime;
begin
  Result := FTiemCread
end;

procedure TImagen.SetTiempoCread(Valor:TDateTime);
begin
  FTiemCread := Valor;
end;

function  TImagen.GetTipo():string;
begin
  Result := FTIpo
end;

procedure TImagen.SetTipo(valor:string);
begin
  FTIpo := valor;
end;

function  TImagen.GetDocumento():string;
begin
  Result := FDocumento;
end;

procedure TImagen.SetDocumento(valor:string);
begin
  FDocumento := valor
end;

function  TImagen.GetKey():string;
begin
  Result := Fkey;
end;

procedure TImagen.SetKey(valor:string);
begin
  Fkey := valor;
end;

function  TImagen.GetPaginas():Integer;
begin
  Result := Fpaginas
end;

procedure TImagen.SetPaginas(valor:Integer);
begin
  FPaginas := Valor;
end;

function  TImagen.GetIPImagen():string;
begin
  Result := FIPImagen;
end;
procedure TImagen.SetIPImagen(valor:string);
begin
  FIPImagen := valor;
end;

function  TImagen.GetPCImagen():string;
begin
  Result := FPCImagen;
end;

procedure TImagen.SetPCImagen(valor:string);
begin
  FPCImagen := valor;
end;
{$ENDREGION}

end.
