unit UFolio;

interface

uses
  Sysutils,strutils,DB, DBClient, UDAOParametro;

type

  TFolio = class
    private
      FIdCarpetaAleta     : Int64;
      FSecuenciaFolio     : Integer;
      FTipoFolio          : string;
      FCodigoFolio        : string;
      FIdDatoPlanilla     : Int64;
      FChequeoCalidad     : boolean;

      IdFolio          : int64;        {ID DEL FOLIO QUE SE ASIGNA}

      NombreImagen     : string;       {NOMBRE DEL ARCHIVO CON EXTENSION}
      CodigoCaja       : string;       {NOMBRE DE LA CAJA A LA QUE PERTENECE LA IMAGEN}
      IdSerieDocum     : Int32;        {ID DE LA SERIE DOCUMENTAL}
      DescSerieDocum   : string;       {DESCRIPCION SERIE DOCUMENTAL}
      IdSubSerieDocum  : Int32;        {ID DE LA SUB SERIE DOCUMENTAL}
      DescSubSerieDocum: string;       {DESCRIPCION SUB SERIE DOCUMENTAL}
      ServidorFtp      : string;       {DIRECCION IP DEL FTP}
      RutaFtp          : string;       {DIRECTORIO DE LA IMAGEN EN EL FTP}




      {GETTERS AND SETTERS}
      function  GetIdCarpetaAleta():Int64;
      procedure SetIdCarpetaAleta(Valor:Int64);

      function  GetSecuenciaFolio():integer;
      procedure SetSecuenciaFolio(Valor:integer);

      function  GetTipoFolio():string;
      procedure SetTipoFolio(Valor:string);

      function  GetCodigoFolio():string;
      procedure SetCodigoFolio(valor:string);

      function  GetIdDatoPlanilla():int64;
      procedure SetIdDatoPlanilla(valor:int64);

      function  GetChequeoCalidad():Boolean;
      procedure SetChequeoCalidad(valor:Boolean);

    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;
      {PROPIEDADES}
      property IdCarpetaAleta     : Int64     read GetIdCarpetaAleta      write SetIdCarpetaAleta;
      property SecuenciaFolio     : Integer   read GetSecuenciaFolio      write SetSecuenciaFolio;
      property TipoFolio          : string    read GetTipoFolio           write SetTipoFolio;
      property CodigoFolio        : string    read GetCodigoFolio         write SetCodigoFolio;
      property IdDatoPlanilla     : Int64     read GetIdDatoPlanilla      write SetIdDatoPlanilla;
      property ChequeoCalidad     : boolean   read GetChequeoCalidad      write SetChequeoCalidad;

  end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TFolio.Create;
begin
  inherited;
end;

destructor TFolio.Destroy;
begin
  inherited;

end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}
function  TFolio.GetIdCarpetaAleta():Int64;
begin
  Result := FIdCarpetaAleta;
end;

procedure TFolio.SetIdCarpetaAleta(valor:Int64);
begin
  FIdCarpetaAleta := valor;
end;

function  TFolio.GetSecuenciaFolio():Integer;
begin
  Result := FSecuenciaFolio;
end;

procedure TFolio.SetSecuenciaFolio(Valor:Integer);
begin
  FSecuenciaFolio := Valor;
end;

function  TFolio.GetTipoFolio():string;
begin
  Result := FTipoFolio;
end;

procedure TFolio.SetTipoFolio(Valor:string);
begin
  FTipoFolio := Valor;
end;

function  TFolio.GetCodigoFolio():string;
begin
  Result := FCodigoFolio;
end;

procedure TFolio.SetCodigoFolio(Valor:string);
begin
  FCodigoFolio := Valor;
end;

function  TFolio.GetIdDatoPlanilla():Int64;
begin
  Result := FIdDatoPlanilla;
end;

procedure TFolio.SetIdDatoPlanilla(Valor:Int64);
begin
  FIdDatoPlanilla := Valor;
end;

function  TFolio.GetChequeoCalidad():boolean;
begin
  Result := FChequeoCalidad;
end;

procedure TFolio.SetChequeoCalidad(Valor:boolean);
begin
  FChequeoCalidad := Valor;
end;


{$ENDREGION}

end.
