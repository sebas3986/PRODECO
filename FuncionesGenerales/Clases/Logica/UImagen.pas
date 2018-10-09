unit UImagen;

interface

type

  TImagen = class
    private
      FIdFolio       : int64;    {ID DEL FOLIO AL QUE PERTENECE}
      FRutaLocal     : string;   {RUTA COMPLETA DESDE DONDE SE PUBLICO LA IMAGEN}
      FServidorFtp   : string;   {DIRECCION IP DEL FTP}
      FRutaFtp       : string;   {DIRECTORIO DE LA IMAGEN EN EL FTP}
      FNombreImagen  : string;   {NOMBRE DEL ARCHIVO CON EXTENSION}
      FVersion       : integer;  {NUERO DE VERSION DE LA IMAGEN}
      FTamanoBytes   : Int64;    {TAMAÑO DEL ARCHIVO EN BYTES}
      FAncho         : integer;  {ANCHO EN PIXELES }
      FAlto          : integer;  {ALTO EN PIXELES}
      FDensidad      : integer;  {DENSIDAD DE LA IMAGEN EN DPI}
      FIpPublicacion : string;   {DIRECCION DE LA MAQUINA DESDE DONDE SE PUBLICO}

      {GETTERS AND SETTERS}


    public
      {CONSTRUCTORES}
      constructor Create;
      destructor  Destroy;

      property IdFolio       : int64     read FIdFolio        write FIdFolio;
      property RutaLocal     : string    read FRutaLocal      write FRutaLocal;
      property ServidorFtp   : string    read FServidorFtp    write FServidorFtp;
      property RutaFtp       : string    read FRutaFtp        write FRutaFtp;
      property NombreImagen  : string    read FNombreImagen   write FNombreImagen;
      property Version       : integer   read FVersion        write FVersion;
      property TamanoBytes   : Int64     read FTamanoBytes    write FTamanoBytes;
      property Ancho         : integer   read FAncho          write FAncho;
      property Alto          : integer   read FAlto           write FAlto;
      property Densidad      : integer   read FDensidad       write FDensidad;
      property IpPublicacion : string    read FIpPublicacion  write FIpPublicacion;

  end;


implementation

{ TImagen }

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TImagen.Create;
begin
  inherited;
end;

destructor TImagen.Destroy;
begin
  inherited;
end;
{$ENDREGION}

{$REGION 'GETTERS AND SETTERS'}

{$ENDREGION}

end.
