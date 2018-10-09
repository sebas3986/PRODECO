unit URegistroCaptura;

interface

type

  TRegistroCaptura = class
    private
      FIdFolio                        : int64;        {ID DEL FOLIO AL QUE SE LE ASIGNA EL REGISTRO}
      FDescripcionTipoIdentificacion  : string;       {DESCRIPCION  TIPO IDENTIFICACION }
      FDescripcionFuenteIdentificacion: string;       {DESCRIPCION FUENTE IDENTIFICACION: MTI,ANI, ANDES}
      FIdIdentificacion               : Int32;        {ID DE LA TABLA IDENTIFICACION QUE COTIENE
                                                        PERSONA,DOCUMENTO Y TIPO DE IDENTIFICACION}
      FNumeroDocumento                : string;       {NUMERO DEL DOCUMENTO DE IDENTIDAD}
      FIdPersona                      : Int32;        {ID ASOCIADO A LA PERSONA EN PROCESO}
      FPrimerNombre                   : string;       {PRIMER NOMBRE DE LA PERSONA}
      FSegundoNombre                  : string;       {SEGUNDO NOMBRE DE LA PERSONA}
      FPrimerApellido                 : string;       {PRIMER APELLIDO DE LA PERSONA}
      FSegundoApellido                : string;       {SEGUNDO APELLIDO DE LA PERSONA}
      FObservacion                    : string;       {OBSERVACION CAPTURA}

    public
      property  IdFolio               : int64    read FIdFolio          write FIdFolio;
      property  DescripcionTipoIdentificacion  : string   read FDescripcionTipoIdentificacion
                                                          write FDescripcionTipoIdentificacion;
      property  DescripcionFuenteIdentificacion: string   read FDescripcionFuenteIdentificacion
                                                          write FDescripcionFuenteIdentificacion;
      property  IdIdentificacion      : Int32    read FIdIdentificacion write FIdIdentificacion;
      property  NumeroDocumento       : string   read FNumeroDocumento  write FNumeroDocumento;
      property  IdPersona             : Int32    read FIdPersona        write FIdPersona;
      property  PrimerNombre          : string   read FPrimerNombre     write FPrimerNombre;
      property  SegundoNombre         : string   read FSegundoNombre    write FSegundoNombre;
      property  PrimerApellido        : string   read FPrimerApellido   write FPrimerApellido;
      property  SegundoApellido       : string   read FSegundoApellido  write FSegundoApellido;
      property  Observacion           : string   read FObservacion      write FObservacion;


      {CONSTRUCTOR - DESTRUCTOR}
      constructor Create;


 end;

implementation



{$REGION 'CONSTRUTOR AND DESTRUCTOR'}

constructor TRegistroCaptura.Create;
begin
  inherited;
end;

{$ENDREGION}


end.


