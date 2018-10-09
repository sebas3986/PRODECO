unit UFolioCarpetaDigi;

interface

uses
  Classes;

type

  TFolioCarpetaDigi = class
    private
      FImagenLocal        : string;       {ARCHIVO DE IMAGEN CON RUTA COMPLETA EN ELEQUIPO LOCAL}
      FNombreImagenFirm   : string;       {NOMBRE DEL ARCHIVO DE IMAGEN CON FIRMA Y ESTAMPA (CON EXTENSION PDF)}
      FNombreImagenOrig   : string;       {NOMBRE DEL ARCHIVO DE IMAGEN ORIGINAL (CON EXTENSION TIF)}
      FRutaFtpOrig        : string;       {RUTA DE LA CARPETA EN EL FTP IMAGENES ORIGINALES}
      FRutaFtpFirm        : string;       {RUTA DE LA CARPETA EN EL FTP IMAGENES FIRMADAS Y ESTAMPADAS}

    public
      property ImagenLocal        : string        read FImagenLocal         write FImagenLocal;
      property NombreImagenFirm   : string        read FNombreImagenFirm    write FNombreImagenFirm;
      property NombreImagenOrig   : string        read FNombreImagenOrig    write FNombreImagenOrig;
      property RutaFtpOrig        : string        read FRutaFtpOrig         write FRutaFtpOrig;
      property RutaFtpFirm        : string        read FRutaFtpFirm         write FRutaFtpFirm;


      {CONSTRUCTOR - DESTRUCTOR}
      constructor Create;
      destructor  Destroy;


 end;


implementation

{$REGION 'CONSTRUTOR AND DESTRUCTOR'}
constructor TFolioCarpetaDigi.Create;
begin

end;

destructor TFolioCarpetaDigi.Destroy;
begin

end;

{$ENDREGION}


end.
