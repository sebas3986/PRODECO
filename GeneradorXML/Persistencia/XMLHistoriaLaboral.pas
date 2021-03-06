
{********************************************************************************************************}
{                                                                                                        }
{                                            XML Data Binding                                            }
{                                                                                                        }
{         Generated on: 23/03/2017 03:45:30 p.m.                                                         }
{       Generated from: D:\TM_UNIANDES-BPO\Aplicacion\GeneradorXML\Persistencia\XMLHistoriaLaboral.dtd   }
{   Settings stored in: D:\TM_UNIANDES-BPO\Aplicacion\GeneradorXML\Persistencia\XMLHistoriaLaboral.xdb   }
{                                                                                                        }
{********************************************************************************************************}

unit XMLHistoriaLaboral;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLHISTORIA_LABORALType = interface;
  IXMLContenidoType = interface;
  IXMLContenidoTypeList = interface;
  IXMLIdentificacion_adicionalType = interface;
  IXMLTipo_documentalType = interface;
  IXMLTitulo_documentoType = interface;
  IXMLAutor_emisorresponsableType = interface;
  IXMLClasificacion_accesoType = interface;
  IXMLFecha_creacionType = interface;
  IXMLFolio_electronicoType = interface;
  IXMLTema_asuntoType = interface;
  IXMLPalabras_claveType = interface;
  IXMLSeccionesType = interface;
  IXMLEstructuraType = interface;
  IXMLEstructuraTypeList = interface;
  IXMLDescripcionType = interface;
  IXMLFormatoType = interface;
  IXMLEstadoType = interface;
  IXMLProceso_administrativoType = interface;
  IXMLUnidad_administrativa_respType = interface;
  IXMLSerieType = interface;
  IXMLNumero_clasificacionType = interface;
  IXMLIdiomaType = interface;
  IXMLContextoType = interface;
  IXMLContextoTypeList = interface;
  IXMLJuridico_administrativoType = interface;
  IXMLTecnologicoType = interface;
  IXMLAutenticidadType = interface;
  IXMLDigitalizacionType = interface;
  IXMLIndicesType = interface;
  IXMLIndicesTypeList = interface;

{ IXMLHISTORIA_LABORALType }

  IXMLHISTORIA_LABORALType = interface(IXMLNode)
    ['{343A2A3B-F8D5-49AF-8FD1-9B98C98D505B}']
    { Property Accessors }
    function Get_Contenido: IXMLContenidoTypeList;
    function Get_Estructura: IXMLEstructuraTypeList;
    function Get_Contexto: IXMLContextoTypeList;
    function Get_Indices: IXMLIndicesTypeList;
    { Methods & Properties }
    property Contenido: IXMLContenidoTypeList read Get_Contenido;
    property Estructura: IXMLEstructuraTypeList read Get_Estructura;
    property Contexto: IXMLContextoTypeList read Get_Contexto;
    property Indices: IXMLIndicesTypeList read Get_Indices;
  end;

{ IXMLContenidoType }

  IXMLContenidoType = interface(IXMLNode)
    ['{CD31B708-A7C5-469B-8753-B5B8FA5EC9AD}']
    { Property Accessors }
    function Get_Nombreimagen: UnicodeString;
    function Get_Tipoidentificacion: UnicodeString;
    function Get_Identificacion: UnicodeString;
    function Get_Folio_es_tipoidentificacion: UnicodeString;
    function Get_Identificacion_adicional: IXMLIdentificacion_adicionalType;
    function Get_Tipo_documental: IXMLTipo_documentalType;
    function Get_Titulo_documento: IXMLTitulo_documentoType;
    function Get_Autor_emisorresponsable: IXMLAutor_emisorresponsableType;
    function Get_Clasificacion_acceso: IXMLClasificacion_accesoType;
    function Get_Fecha_creacion: IXMLFecha_creacionType;
    function Get_Folio_electronico: IXMLFolio_electronicoType;
    function Get_Tema_asunto: IXMLTema_asuntoType;
    function Get_Palabras_clave: IXMLPalabras_claveType;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Tipoidentificacion(Value: UnicodeString);
    procedure Set_Identificacion(Value: UnicodeString);
    procedure Set_Folio_es_tipoidentificacion(Value: UnicodeString);
    { Methods & Properties }
    property Nombreimagen: UnicodeString read Get_Nombreimagen write Set_Nombreimagen;
    property Tipoidentificacion: UnicodeString read Get_Tipoidentificacion write Set_Tipoidentificacion;
    property Identificacion: UnicodeString read Get_Identificacion write Set_Identificacion;
    property Folio_es_tipoidentificacion: UnicodeString read Get_Folio_es_tipoidentificacion write Set_Folio_es_tipoidentificacion;
    property Identificacion_adicional: IXMLIdentificacion_adicionalType read Get_Identificacion_adicional;
    property Tipo_documental: IXMLTipo_documentalType read Get_Tipo_documental;
    property Titulo_documento: IXMLTitulo_documentoType read Get_Titulo_documento;
    property Autor_emisorresponsable: IXMLAutor_emisorresponsableType read Get_Autor_emisorresponsable;
    property Clasificacion_acceso: IXMLClasificacion_accesoType read Get_Clasificacion_acceso;
    property Fecha_creacion: IXMLFecha_creacionType read Get_Fecha_creacion;
    property Folio_electronico: IXMLFolio_electronicoType read Get_Folio_electronico;
    property Tema_asunto: IXMLTema_asuntoType read Get_Tema_asunto;
    property Palabras_clave: IXMLPalabras_claveType read Get_Palabras_clave;
  end;

{ IXMLContenidoTypeList }

  IXMLContenidoTypeList = interface(IXMLNodeCollection)
    ['{90EDDF58-FD78-4723-BB91-8E5D28BFBDE4}']
    { Methods & Properties }
    function Add: IXMLContenidoType;
    function Insert(const Index: Integer): IXMLContenidoType;

    function Get_Item(Index: Integer): IXMLContenidoType;
    property Items[Index: Integer]: IXMLContenidoType read Get_Item; default;
  end;

{ IXMLIdentificacion_adicionalType }

  IXMLIdentificacion_adicionalType = interface(IXMLNode)
    ['{B31D6BE8-FC7B-4AEA-9949-228BB78C6A8F}']
    { Property Accessors }
    function Get_Tipoidentificacionadicional: UnicodeString;
    function Get_Identificacionadicional: UnicodeString;
    procedure Set_Tipoidentificacionadicional(Value: UnicodeString);
    procedure Set_Identificacionadicional(Value: UnicodeString);
    { Methods & Properties }
    property Tipoidentificacionadicional: UnicodeString read Get_Tipoidentificacionadicional write Set_Tipoidentificacionadicional;
    property Identificacionadicional: UnicodeString read Get_Identificacionadicional write Set_Identificacionadicional;
  end;

{ IXMLTipo_documentalType }

  IXMLTipo_documentalType = interface(IXMLNode)
    ['{83B1541E-960D-4D44-9E38-ADCD0A960A0B}']
    { Property Accessors }
    function Get_Tipodocumental: UnicodeString;
    function Get_Tipo_proceso: UnicodeString;
    function Get_Seccion: UnicodeString;
    procedure Set_Tipodocumental(Value: UnicodeString);
    procedure Set_Tipo_proceso(Value: UnicodeString);
    procedure Set_Seccion(Value: UnicodeString);
    { Methods & Properties }
    property Tipodocumental: UnicodeString read Get_Tipodocumental write Set_Tipodocumental;
    property Tipo_proceso: UnicodeString read Get_Tipo_proceso write Set_Tipo_proceso;
    property Seccion: UnicodeString read Get_Seccion write Set_Seccion;
  end;

{ IXMLTitulo_documentoType }

  IXMLTitulo_documentoType = interface(IXMLNode)
    ['{BFA427EC-FD40-41F6-9225-6787E76F02EB}']
    { Property Accessors }
    function Get_Titulodocumento: UnicodeString;
    function Get_Seccion_1: UnicodeString;
    function Get_Seccion_2: UnicodeString;
    function Get_Seccion_3: UnicodeString;
    function Get_Seccion_4: UnicodeString;
    function Get_Seccion_5: UnicodeString;
    function Get_Seccion_6: UnicodeString;
    function Get_ContratoCivil: UnicodeString;
    procedure Set_Titulodocumento(Value: UnicodeString);
    procedure Set_Seccion_1(Value: UnicodeString);
    procedure Set_Seccion_2(Value: UnicodeString);
    procedure Set_Seccion_3(Value: UnicodeString);
    procedure Set_Seccion_4(Value: UnicodeString);
    procedure Set_Seccion_5(Value: UnicodeString);
    procedure Set_Seccion_6(Value: UnicodeString);
    procedure Set_ContratoCivil(Value: UnicodeString);
    { Methods & Properties }
    property Titulodocumento: UnicodeString read Get_Titulodocumento write Set_Titulodocumento;
    property Seccion_1: UnicodeString read Get_Seccion_1 write Set_Seccion_1;
    property Seccion_2: UnicodeString read Get_Seccion_2 write Set_Seccion_2;
    property Seccion_3: UnicodeString read Get_Seccion_3 write Set_Seccion_3;
    property Seccion_4: UnicodeString read Get_Seccion_4 write Set_Seccion_4;
    property Seccion_5: UnicodeString read Get_Seccion_5 write Set_Seccion_5;
    property Seccion_6: UnicodeString read Get_Seccion_6 write Set_Seccion_6;
    property ContratoCivil: UnicodeString read Get_ContratoCivil write Set_ContratoCivil;
  end;

{ IXMLAutor_emisorresponsableType }

  IXMLAutor_emisorresponsableType = interface(IXMLNode)
    ['{21179DC8-5DC0-489E-AACF-102E7D4BCF35}']
    { Property Accessors }
    function Get_Fondo: UnicodeString;
    function Get_Unidad_responsable: UnicodeString;
    procedure Set_Fondo(Value: UnicodeString);
    procedure Set_Unidad_responsable(Value: UnicodeString);
    { Methods & Properties }
    property Fondo: UnicodeString read Get_Fondo write Set_Fondo;
    property Unidad_responsable: UnicodeString read Get_Unidad_responsable write Set_Unidad_responsable;
  end;

{ IXMLClasificacion_accesoType }

  IXMLClasificacion_accesoType = interface(IXMLNode)
    ['{A39C4636-79F2-439A-84CE-8DD86A76A4B3}']
    { Property Accessors }
    function Get_Nivel_acceso: UnicodeString;
    procedure Set_Nivel_acceso(Value: UnicodeString);
    { Methods & Properties }
    property Nivel_acceso: UnicodeString read Get_Nivel_acceso write Set_Nivel_acceso;
  end;

{ IXMLFecha_creacionType }

  IXMLFecha_creacionType = interface(IXMLNode)
    ['{9F8BC9E1-C60F-4445-93EE-FC2DA7ABAC27}']
    { Property Accessors }
    function Get_Fechacreacion: UnicodeString;
    procedure Set_Fechacreacion(Value: UnicodeString);
    { Methods & Properties }
    property Fechacreacion: UnicodeString read Get_Fechacreacion write Set_Fechacreacion;
  end;

{ IXMLFolio_electronicoType }

  IXMLFolio_electronicoType = interface(IXMLNode)
    ['{DA700A27-A1C9-46BE-B9C0-EDFAF7640203}']
    { Property Accessors }
    function Get_Folios_totales: UnicodeString;
    function Get_Folio_actual: UnicodeString;
    procedure Set_Folios_totales(Value: UnicodeString);
    procedure Set_Folio_actual(Value: UnicodeString);
    { Methods & Properties }
    property Folios_totales: UnicodeString read Get_Folios_totales write Set_Folios_totales;
    property Folio_actual: UnicodeString read Get_Folio_actual write Set_Folio_actual;
  end;

{ IXMLTema_asuntoType }

  IXMLTema_asuntoType = interface(IXMLNode)
    ['{6117A2BF-502E-479B-87A5-669604A2968B}']
    { Property Accessors }
    function Get_Tema: UnicodeString;
    procedure Set_Tema(Value: UnicodeString);
    { Methods & Properties }
    property Tema: UnicodeString read Get_Tema write Set_Tema;
  end;

{ IXMLPalabras_claveType }

  IXMLPalabras_claveType = interface(IXMLNode)
    ['{827CFCB1-426C-4EBC-8B7B-F02B9F9767D2}']
    { Property Accessors }
    function Get_Nombres_Apellidos: UnicodeString;
    function Get_Secciones: IXMLSeccionesType;
    function Get_Num_id: UnicodeString;
    procedure Set_Nombres_Apellidos(Value: UnicodeString);
    procedure Set_Num_id(Value: UnicodeString);
    { Methods & Properties }
    property Nombres_Apellidos: UnicodeString read Get_Nombres_Apellidos write Set_Nombres_Apellidos;
    property Secciones: IXMLSeccionesType read Get_Secciones;
    property Num_id: UnicodeString read Get_Num_id write Set_Num_id;
  end;

{ IXMLSeccionesType }

  IXMLSeccionesType = interface(IXMLNode)
    ['{DAA1B530-7104-4D1A-B5E4-1212D92856B1}']
    { Property Accessors }
    function Get_Seccion_1: UnicodeString;
    function Get_Seccion_2: UnicodeString;
    function Get_Seccion_3: UnicodeString;
    function Get_Seccion_4: UnicodeString;
    function Get_Seccion_5: UnicodeString;
    function Get_Seccion_6: UnicodeString;
    procedure Set_Seccion_1(Value: UnicodeString);
    procedure Set_Seccion_2(Value: UnicodeString);
    procedure Set_Seccion_3(Value: UnicodeString);
    procedure Set_Seccion_4(Value: UnicodeString);
    procedure Set_Seccion_5(Value: UnicodeString);
    procedure Set_Seccion_6(Value: UnicodeString);
    { Methods & Properties }
    property Seccion_1: UnicodeString read Get_Seccion_1 write Set_Seccion_1;
    property Seccion_2: UnicodeString read Get_Seccion_2 write Set_Seccion_2;
    property Seccion_3: UnicodeString read Get_Seccion_3 write Set_Seccion_3;
    property Seccion_4: UnicodeString read Get_Seccion_4 write Set_Seccion_4;
    property Seccion_5: UnicodeString read Get_Seccion_5 write Set_Seccion_5;
    property Seccion_6: UnicodeString read Get_Seccion_6 write Set_Seccion_6;
  end;

{ IXMLEstructuraType }

  IXMLEstructuraType = interface(IXMLNode)
    ['{DDFC49D5-7064-41BA-ACCE-5C3C3CF3F2C5}']
    { Property Accessors }
    function Get_Descripcion: IXMLDescripcionType;
    function Get_Formato: IXMLFormatoType;
    function Get_Estado: IXMLEstadoType;
    function Get_Proceso_administrativo: IXMLProceso_administrativoType;
    function Get_Unidad_administrativa_resp: IXMLUnidad_administrativa_respType;
    function Get_Perfil_autorizado: UnicodeString;
    function Get_Ubicacion: UnicodeString;
    function Get_Serie: IXMLSerieType;
    function Get_Numero_clasificacion: IXMLNumero_clasificacionType;
    function Get_Idioma: IXMLIdiomaType;
    procedure Set_Perfil_autorizado(Value: UnicodeString);
    procedure Set_Ubicacion(Value: UnicodeString);
    { Methods & Properties }
    property Descripcion: IXMLDescripcionType read Get_Descripcion;
    property Formato: IXMLFormatoType read Get_Formato;
    property Estado: IXMLEstadoType read Get_Estado;
    property Proceso_administrativo: IXMLProceso_administrativoType read Get_Proceso_administrativo;
    property Unidad_administrativa_resp: IXMLUnidad_administrativa_respType read Get_Unidad_administrativa_resp;
    property Perfil_autorizado: UnicodeString read Get_Perfil_autorizado write Set_Perfil_autorizado;
    property Ubicacion: UnicodeString read Get_Ubicacion write Set_Ubicacion;
    property Serie: IXMLSerieType read Get_Serie;
    property Numero_clasificacion: IXMLNumero_clasificacionType read Get_Numero_clasificacion;
    property Idioma: IXMLIdiomaType read Get_Idioma;
  end;

{ IXMLEstructuraTypeList }

  IXMLEstructuraTypeList = interface(IXMLNodeCollection)
    ['{91F8F95F-B8CB-4EE3-9ABA-C7C882211336}']
    { Methods & Properties }
    function Add: IXMLEstructuraType;
    function Insert(const Index: Integer): IXMLEstructuraType;

    function Get_Item(Index: Integer): IXMLEstructuraType;
    property Items[Index: Integer]: IXMLEstructuraType read Get_Item; default;
  end;

{ IXMLDescripcionType }

  IXMLDescripcionType = interface(IXMLNode)
    ['{5E5C42CA-A292-4226-86E9-589A03E5AA18}']
    { Property Accessors }
    function Get_Descripcion_: UnicodeString;
    procedure Set_Descripcion_(Value: UnicodeString);
    { Methods & Properties }
    property Descripcion_: UnicodeString read Get_Descripcion_ write Set_Descripcion_;
  end;

{ IXMLFormatoType }

  IXMLFormatoType = interface(IXMLNode)
    ['{602D5B8C-BFCD-4E89-BDEF-372E2C8A24D2}']
    { Property Accessors }
    function Get_Formato_: UnicodeString;
    procedure Set_Formato_(Value: UnicodeString);
    { Methods & Properties }
    property Formato_: UnicodeString read Get_Formato_ write Set_Formato_;
  end;

{ IXMLEstadoType }

  IXMLEstadoType = interface(IXMLNode)
    ['{F5A4E267-6899-49F1-9744-C0CE6BE9E49A}']
    { Property Accessors }
    function Get_Estado_elaboracion: UnicodeString;
    procedure Set_Estado_elaboracion(Value: UnicodeString);
    { Methods & Properties }
    property Estado_elaboracion: UnicodeString read Get_Estado_elaboracion write Set_Estado_elaboracion;
  end;

{ IXMLProceso_administrativoType }

  IXMLProceso_administrativoType = interface(IXMLNode)
    ['{D049F655-0E00-4862-BE53-026A9B48ABD4}']
    { Property Accessors }
    function Get_Macroproceso: UnicodeString;
    function Get_Procesonivel1_1: UnicodeString;
    function Get_Procesonivel1_2: UnicodeString;
    function Get_Procesonivel1_3: UnicodeString;
    function Get_Procesonivel1_4: UnicodeString;
    function Get_Procesonivel1_5: UnicodeString;
    function Get_Procesonivel2_1: UnicodeString;
    function Get_Procesonivel2_2: UnicodeString;
    function Get_Procesonivel2_3: UnicodeString;
    function Get_Procesonivel2_4: UnicodeString;
    function Get_Procesonivel2_5: UnicodeString;
    function Get_Procesonivel2_6: UnicodeString;
    function Get_Procesonivel2_7: UnicodeString;
    function Get_Procesonivel2_8: UnicodeString;
    function Get_Procesonivel2_9: UnicodeString;
    function Get_Procesonivel2_10: UnicodeString;
    function Get_Procesonivel2_11: UnicodeString;
    function Get_Procesonivel2_12: UnicodeString;
    function Get_Procesonivel2_13: UnicodeString;
    function Get_Procesonivel2_14: UnicodeString;
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1_1(Value: UnicodeString);
    procedure Set_Procesonivel1_2(Value: UnicodeString);
    procedure Set_Procesonivel1_3(Value: UnicodeString);
    procedure Set_Procesonivel1_4(Value: UnicodeString);
    procedure Set_Procesonivel1_5(Value: UnicodeString);
    procedure Set_Procesonivel2_1(Value: UnicodeString);
    procedure Set_Procesonivel2_2(Value: UnicodeString);
    procedure Set_Procesonivel2_3(Value: UnicodeString);
    procedure Set_Procesonivel2_4(Value: UnicodeString);
    procedure Set_Procesonivel2_5(Value: UnicodeString);
    procedure Set_Procesonivel2_6(Value: UnicodeString);
    procedure Set_Procesonivel2_7(Value: UnicodeString);
    procedure Set_Procesonivel2_8(Value: UnicodeString);
    procedure Set_Procesonivel2_9(Value: UnicodeString);
    procedure Set_Procesonivel2_10(Value: UnicodeString);
    procedure Set_Procesonivel2_11(Value: UnicodeString);
    procedure Set_Procesonivel2_12(Value: UnicodeString);
    procedure Set_Procesonivel2_13(Value: UnicodeString);
    procedure Set_Procesonivel2_14(Value: UnicodeString);
    { Methods & Properties }
    property Macroproceso: UnicodeString read Get_Macroproceso write Set_Macroproceso;
    property Procesonivel1_1: UnicodeString read Get_Procesonivel1_1 write Set_Procesonivel1_1;
    property Procesonivel1_2: UnicodeString read Get_Procesonivel1_2 write Set_Procesonivel1_2;
    property Procesonivel1_3: UnicodeString read Get_Procesonivel1_3 write Set_Procesonivel1_3;
    property Procesonivel1_4: UnicodeString read Get_Procesonivel1_4 write Set_Procesonivel1_4;
    property Procesonivel1_5: UnicodeString read Get_Procesonivel1_5 write Set_Procesonivel1_5;
    property Procesonivel2_1: UnicodeString read Get_Procesonivel2_1 write Set_Procesonivel2_1;
    property Procesonivel2_2: UnicodeString read Get_Procesonivel2_2 write Set_Procesonivel2_2;
    property Procesonivel2_3: UnicodeString read Get_Procesonivel2_3 write Set_Procesonivel2_3;
    property Procesonivel2_4: UnicodeString read Get_Procesonivel2_4 write Set_Procesonivel2_4;
    property Procesonivel2_5: UnicodeString read Get_Procesonivel2_5 write Set_Procesonivel2_5;
    property Procesonivel2_6: UnicodeString read Get_Procesonivel2_6 write Set_Procesonivel2_6;
    property Procesonivel2_7: UnicodeString read Get_Procesonivel2_7 write Set_Procesonivel2_7;
    property Procesonivel2_8: UnicodeString read Get_Procesonivel2_8 write Set_Procesonivel2_8;
    property Procesonivel2_9: UnicodeString read Get_Procesonivel2_9 write Set_Procesonivel2_9;
    property Procesonivel2_10: UnicodeString read Get_Procesonivel2_10 write Set_Procesonivel2_10;
    property Procesonivel2_11: UnicodeString read Get_Procesonivel2_11 write Set_Procesonivel2_11;
    property Procesonivel2_12: UnicodeString read Get_Procesonivel2_12 write Set_Procesonivel2_12;
    property Procesonivel2_13: UnicodeString read Get_Procesonivel2_13 write Set_Procesonivel2_13;
    property Procesonivel2_14: UnicodeString read Get_Procesonivel2_14 write Set_Procesonivel2_14;
  end;

{ IXMLUnidad_administrativa_respType }

  IXMLUnidad_administrativa_respType = interface(IXMLNode)
    ['{733CC9F5-C32F-488D-87CD-D276B972CAAF}']
    { Property Accessors }
    function Get_Unidadadministrativaresp: UnicodeString;
    procedure Set_Unidadadministrativaresp(Value: UnicodeString);
    { Methods & Properties }
    property Unidadadministrativaresp: UnicodeString read Get_Unidadadministrativaresp write Set_Unidadadministrativaresp;
  end;

{ IXMLSerieType }

  IXMLSerieType = interface(IXMLNode)
    ['{25AB2058-C3C9-49C1-BA83-309D46809F6A}']
    { Property Accessors }
    function Get_Serie_: UnicodeString;
    function Get_Subserie: UnicodeString;
    function Get_Serie_1: UnicodeString;
    function Get_Serie_2: UnicodeString;
    procedure Set_Serie_(Value: UnicodeString);
    procedure Set_Subserie(Value: UnicodeString);
    procedure Set_Serie_1(Value: UnicodeString);
    procedure Set_Serie_2(Value: UnicodeString);
    { Methods & Properties }
    property Serie_: UnicodeString read Get_Serie_ write Set_Serie_;
    property Subserie: UnicodeString read Get_Subserie write Set_Subserie;
    property Serie_1: UnicodeString read Get_Serie_1 write Set_Serie_1;
    property Serie_2: UnicodeString read Get_Serie_2 write Set_Serie_2;
  end;

{ IXMLNumero_clasificacionType }

  IXMLNumero_clasificacionType = interface(IXMLNode)
    ['{61799015-83B9-4667-AC52-C357B4E02F5D}']
    { Property Accessors }
    function Get_Numero_clasificacion_documental: UnicodeString;
    procedure Set_Numero_clasificacion_documental(Value: UnicodeString);
    { Methods & Properties }
    property Numero_clasificacion_documental: UnicodeString read Get_Numero_clasificacion_documental write Set_Numero_clasificacion_documental;
  end;

{ IXMLIdiomaType }

  IXMLIdiomaType = interface(IXMLNode)
    ['{3B0586B0-A007-4577-B5B6-CC78333CD0C0}']
    { Property Accessors }
    function Get_Idioma_: UnicodeString;
    procedure Set_Idioma_(Value: UnicodeString);
    { Methods & Properties }
    property Idioma_: UnicodeString read Get_Idioma_ write Set_Idioma_;
  end;

{ IXMLContextoType }

  IXMLContextoType = interface(IXMLNode)
    ['{72A48CBE-A1AD-4C1C-A51B-0AC35DEDC82E}']
    { Property Accessors }
    function Get_Juridico_administrativo: IXMLJuridico_administrativoType;
    function Get_Documental: UnicodeString;
    function Get_Procedencia: UnicodeString;
    function Get_Procedimental: UnicodeString;
    function Get_Tecnologico: IXMLTecnologicoType;
    function Get_Autenticidad: IXMLAutenticidadType;
    function Get_Digitalizacion: IXMLDigitalizacionType;
    procedure Set_Documental(Value: UnicodeString);
    procedure Set_Procedencia(Value: UnicodeString);
    procedure Set_Procedimental(Value: UnicodeString);
    { Methods & Properties }
    property Juridico_administrativo: IXMLJuridico_administrativoType read Get_Juridico_administrativo;
    property Documental: UnicodeString read Get_Documental write Set_Documental;
    property Procedencia: UnicodeString read Get_Procedencia write Set_Procedencia;
    property Procedimental: UnicodeString read Get_Procedimental write Set_Procedimental;
    property Tecnologico: IXMLTecnologicoType read Get_Tecnologico;
    property Autenticidad: IXMLAutenticidadType read Get_Autenticidad;
    property Digitalizacion: IXMLDigitalizacionType read Get_Digitalizacion;
  end;

{ IXMLContextoTypeList }

  IXMLContextoTypeList = interface(IXMLNodeCollection)
    ['{EF1E7832-97C0-4B46-AE7E-488477C70C62}']
    { Methods & Properties }
    function Add: IXMLContextoType;
    function Insert(const Index: Integer): IXMLContextoType;

    function Get_Item(Index: Integer): IXMLContextoType;
    property Items[Index: Integer]: IXMLContextoType read Get_Item; default;
  end;

{ IXMLJuridico_administrativoType }

  IXMLJuridico_administrativoType = interface(IXMLNode)
    ['{3371F29E-A312-48C4-95AB-FD26F0193B47}']
    { Property Accessors }
    function Get_Valores_primarios: UnicodeString;
    function Get_Valores_secundarios: UnicodeString;
    procedure Set_Valores_primarios(Value: UnicodeString);
    procedure Set_Valores_secundarios(Value: UnicodeString);
    { Methods & Properties }
    property Valores_primarios: UnicodeString read Get_Valores_primarios write Set_Valores_primarios;
    property Valores_secundarios: UnicodeString read Get_Valores_secundarios write Set_Valores_secundarios;
  end;

{ IXMLTecnologicoType }

  IXMLTecnologicoType = interface(IXMLNode)
    ['{324A40A2-2131-402A-9646-B95FB72582E3}']
    { Property Accessors }
    function Get_Tecnologico_1: UnicodeString;
    function Get_Tipodefirma: UnicodeString;
    procedure Set_Tecnologico_1(Value: UnicodeString);
    procedure Set_Tipodefirma(Value: UnicodeString);
    { Methods & Properties }
    property Tecnologico_1: UnicodeString read Get_Tecnologico_1 write Set_Tecnologico_1;
    property Tipodefirma: UnicodeString read Get_Tipodefirma write Set_Tipodefirma;
  end;

{ IXMLAutenticidadType }

  IXMLAutenticidadType = interface(IXMLNode)
    ['{C0770AC2-92E9-44B1-9C85-6390CF7F660C}']
    { Property Accessors }
    function Get_Dominio_red: UnicodeString;
    function Get_Ip_usuario: UnicodeString;
    function Get_MAC_usuario: UnicodeString;
    procedure Set_Dominio_red(Value: UnicodeString);
    procedure Set_Ip_usuario(Value: UnicodeString);
    procedure Set_MAC_usuario(Value: UnicodeString);
    { Methods & Properties }
    property Dominio_red: UnicodeString read Get_Dominio_red write Set_Dominio_red;
    property Ip_usuario: UnicodeString read Get_Ip_usuario write Set_Ip_usuario;
    property MAC_usuario: UnicodeString read Get_MAC_usuario write Set_MAC_usuario;
  end;

{ IXMLDigitalizacionType }

  IXMLDigitalizacionType = interface(IXMLNode)
    ['{08ABC730-9A8F-4CAB-B0CF-582C7341BD68}']
    { Property Accessors }
    function Get_Procesado_por: UnicodeString;
    function Get_Fecha_digitalizacion: UnicodeString;
    function Get_Fecha_indexacion: UnicodeString;
    function Get_Resolucion: UnicodeString;
    function Get_Tamano: UnicodeString;
    function Get_Software_captura: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_Compresion: UnicodeString;
    function Get_Folio_inicial: UnicodeString;
    function Get_Folio_final: UnicodeString;
    procedure Set_Procesado_por(Value: UnicodeString);
    procedure Set_Fecha_digitalizacion(Value: UnicodeString);
    procedure Set_Fecha_indexacion(Value: UnicodeString);
    procedure Set_Resolucion(Value: UnicodeString);
    procedure Set_Tamano(Value: UnicodeString);
    procedure Set_Software_captura(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Compresion(Value: UnicodeString);
    procedure Set_Folio_inicial(Value: UnicodeString);
    procedure Set_Folio_final(Value: UnicodeString);
    { Methods & Properties }
    property Procesado_por: UnicodeString read Get_Procesado_por write Set_Procesado_por;
    property Fecha_digitalizacion: UnicodeString read Get_Fecha_digitalizacion write Set_Fecha_digitalizacion;
    property Fecha_indexacion: UnicodeString read Get_Fecha_indexacion write Set_Fecha_indexacion;
    property Resolucion: UnicodeString read Get_Resolucion write Set_Resolucion;
    property Tamano: UnicodeString read Get_Tamano write Set_Tamano;
    property Software_captura: UnicodeString read Get_Software_captura write Set_Software_captura;
    property Color: UnicodeString read Get_Color write Set_Color;
    property Compresion: UnicodeString read Get_Compresion write Set_Compresion;
    property Folio_inicial: UnicodeString read Get_Folio_inicial write Set_Folio_inicial;
    property Folio_final: UnicodeString read Get_Folio_final write Set_Folio_final;
  end;

{ IXMLIndicesType }

  IXMLIndicesType = interface(IXMLNode)
    ['{01FDE84A-283D-4C1B-BBB0-54E6608D73F6}']
    { Property Accessors }
    function Get_Num_id: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
    { Methods & Properties }
    property Num_id: UnicodeString read Get_Num_id write Set_Num_id;
    property Prim_nomb: UnicodeString read Get_Prim_nomb write Set_Prim_nomb;
    property Seg_nomb: UnicodeString read Get_Seg_nomb write Set_Seg_nomb;
    property Prim_apll: UnicodeString read Get_Prim_apll write Set_Prim_apll;
    property Seg_apll: UnicodeString read Get_Seg_apll write Set_Seg_apll;
  end;

{ IXMLIndicesTypeList }

  IXMLIndicesTypeList = interface(IXMLNodeCollection)
    ['{E796BA50-93D1-4583-A01C-23D28C57C600}']
    { Methods & Properties }
    function Add: IXMLIndicesType;
    function Insert(const Index: Integer): IXMLIndicesType;

    function Get_Item(Index: Integer): IXMLIndicesType;
    property Items[Index: Integer]: IXMLIndicesType read Get_Item; default;
  end;

{ Forward Decls }

  TXMLHISTORIA_LABORALType = class;
  TXMLContenidoType = class;
  TXMLContenidoTypeList = class;
  TXMLIdentificacion_adicionalType = class;
  TXMLTipo_documentalType = class;
  TXMLTitulo_documentoType = class;
  TXMLAutor_emisorresponsableType = class;
  TXMLClasificacion_accesoType = class;
  TXMLFecha_creacionType = class;
  TXMLFolio_electronicoType = class;
  TXMLTema_asuntoType = class;
  TXMLPalabras_claveType = class;
  TXMLSeccionesType = class;
  TXMLEstructuraType = class;
  TXMLEstructuraTypeList = class;
  TXMLDescripcionType = class;
  TXMLFormatoType = class;
  TXMLEstadoType = class;
  TXMLProceso_administrativoType = class;
  TXMLUnidad_administrativa_respType = class;
  TXMLSerieType = class;
  TXMLNumero_clasificacionType = class;
  TXMLIdiomaType = class;
  TXMLContextoType = class;
  TXMLContextoTypeList = class;
  TXMLJuridico_administrativoType = class;
  TXMLTecnologicoType = class;
  TXMLAutenticidadType = class;
  TXMLDigitalizacionType = class;
  TXMLIndicesType = class;
  TXMLIndicesTypeList = class;

{ TXMLHISTORIA_LABORALType }

  TXMLHISTORIA_LABORALType = class(TXMLNode, IXMLHISTORIA_LABORALType)
  private
    FContenido: IXMLContenidoTypeList;
    FEstructura: IXMLEstructuraTypeList;
    FContexto: IXMLContextoTypeList;
    FIndices: IXMLIndicesTypeList;
  protected
    { IXMLHISTORIA_LABORALType }
    function Get_Contenido: IXMLContenidoTypeList;
    function Get_Estructura: IXMLEstructuraTypeList;
    function Get_Contexto: IXMLContextoTypeList;
    function Get_Indices: IXMLIndicesTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLContenidoType }

  TXMLContenidoType = class(TXMLNode, IXMLContenidoType)
  protected
    { IXMLContenidoType }
    function Get_Nombreimagen: UnicodeString;
    function Get_Tipoidentificacion: UnicodeString;
    function Get_Identificacion: UnicodeString;
    function Get_Folio_es_tipoidentificacion: UnicodeString;
    function Get_Identificacion_adicional: IXMLIdentificacion_adicionalType;
    function Get_Tipo_documental: IXMLTipo_documentalType;
    function Get_Titulo_documento: IXMLTitulo_documentoType;
    function Get_Autor_emisorresponsable: IXMLAutor_emisorresponsableType;
    function Get_Clasificacion_acceso: IXMLClasificacion_accesoType;
    function Get_Fecha_creacion: IXMLFecha_creacionType;
    function Get_Folio_electronico: IXMLFolio_electronicoType;
    function Get_Tema_asunto: IXMLTema_asuntoType;
    function Get_Palabras_clave: IXMLPalabras_claveType;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Tipoidentificacion(Value: UnicodeString);
    procedure Set_Identificacion(Value: UnicodeString);
    procedure Set_Folio_es_tipoidentificacion(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLContenidoTypeList }

  TXMLContenidoTypeList = class(TXMLNodeCollection, IXMLContenidoTypeList)
  protected
    { IXMLContenidoTypeList }
    function Add: IXMLContenidoType;
    function Insert(const Index: Integer): IXMLContenidoType;

    function Get_Item(Index: Integer): IXMLContenidoType;
  end;

{ TXMLIdentificacion_adicionalType }

  TXMLIdentificacion_adicionalType = class(TXMLNode, IXMLIdentificacion_adicionalType)
  protected
    { IXMLIdentificacion_adicionalType }
    function Get_Tipoidentificacionadicional: UnicodeString;
    function Get_Identificacionadicional: UnicodeString;
    procedure Set_Tipoidentificacionadicional(Value: UnicodeString);
    procedure Set_Identificacionadicional(Value: UnicodeString);
  end;

{ TXMLTipo_documentalType }

  TXMLTipo_documentalType = class(TXMLNode, IXMLTipo_documentalType)
  protected
    { IXMLTipo_documentalType }
    function Get_Tipodocumental: UnicodeString;
    function Get_Tipo_proceso: UnicodeString;
    function Get_Seccion: UnicodeString;
    procedure Set_Tipodocumental(Value: UnicodeString);
    procedure Set_Tipo_proceso(Value: UnicodeString);
    procedure Set_Seccion(Value: UnicodeString);
  end;

{ TXMLTitulo_documentoType }

  TXMLTitulo_documentoType = class(TXMLNode, IXMLTitulo_documentoType)
  protected
    { IXMLTitulo_documentoType }
    function Get_Titulodocumento: UnicodeString;
    function Get_Seccion_1: UnicodeString;
    function Get_Seccion_2: UnicodeString;
    function Get_Seccion_3: UnicodeString;
    function Get_Seccion_4: UnicodeString;
    function Get_Seccion_5: UnicodeString;
    function Get_Seccion_6: UnicodeString;
    function Get_ContratoCivil: UnicodeString;
    procedure Set_Titulodocumento(Value: UnicodeString);
    procedure Set_Seccion_1(Value: UnicodeString);
    procedure Set_Seccion_2(Value: UnicodeString);
    procedure Set_Seccion_3(Value: UnicodeString);
    procedure Set_Seccion_4(Value: UnicodeString);
    procedure Set_Seccion_5(Value: UnicodeString);
    procedure Set_Seccion_6(Value: UnicodeString);
    procedure Set_ContratoCivil(Value: UnicodeString);
  end;

{ TXMLAutor_emisorresponsableType }

  TXMLAutor_emisorresponsableType = class(TXMLNode, IXMLAutor_emisorresponsableType)
  protected
    { IXMLAutor_emisorresponsableType }
    function Get_Fondo: UnicodeString;
    function Get_Unidad_responsable: UnicodeString;
    procedure Set_Fondo(Value: UnicodeString);
    procedure Set_Unidad_responsable(Value: UnicodeString);
  end;

{ TXMLClasificacion_accesoType }

  TXMLClasificacion_accesoType = class(TXMLNode, IXMLClasificacion_accesoType)
  protected
    { IXMLClasificacion_accesoType }
    function Get_Nivel_acceso: UnicodeString;
    procedure Set_Nivel_acceso(Value: UnicodeString);
  end;

{ TXMLFecha_creacionType }

  TXMLFecha_creacionType = class(TXMLNode, IXMLFecha_creacionType)
  protected
    { IXMLFecha_creacionType }
    function Get_Fechacreacion: UnicodeString;
    procedure Set_Fechacreacion(Value: UnicodeString);
  end;

{ TXMLFolio_electronicoType }

  TXMLFolio_electronicoType = class(TXMLNode, IXMLFolio_electronicoType)
  protected
    { IXMLFolio_electronicoType }
    function Get_Folios_totales: UnicodeString;
    function Get_Folio_actual: UnicodeString;
    procedure Set_Folios_totales(Value: UnicodeString);
    procedure Set_Folio_actual(Value: UnicodeString);
  end;

{ TXMLTema_asuntoType }

  TXMLTema_asuntoType = class(TXMLNode, IXMLTema_asuntoType)
  protected
    { IXMLTema_asuntoType }
    function Get_Tema: UnicodeString;
    procedure Set_Tema(Value: UnicodeString);
  end;

{ TXMLPalabras_claveType }

  TXMLPalabras_claveType = class(TXMLNode, IXMLPalabras_claveType)
  protected
    { IXMLPalabras_claveType }
    function Get_Nombres_Apellidos: UnicodeString;
    function Get_Secciones: IXMLSeccionesType;
    function Get_Num_id: UnicodeString;
    procedure Set_Nombres_Apellidos(Value: UnicodeString);
    procedure Set_Num_id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSeccionesType }

  TXMLSeccionesType = class(TXMLNode, IXMLSeccionesType)
  protected
    { IXMLSeccionesType }
    function Get_Seccion_1: UnicodeString;
    function Get_Seccion_2: UnicodeString;
    function Get_Seccion_3: UnicodeString;
    function Get_Seccion_4: UnicodeString;
    function Get_Seccion_5: UnicodeString;
    function Get_Seccion_6: UnicodeString;
    procedure Set_Seccion_1(Value: UnicodeString);
    procedure Set_Seccion_2(Value: UnicodeString);
    procedure Set_Seccion_3(Value: UnicodeString);
    procedure Set_Seccion_4(Value: UnicodeString);
    procedure Set_Seccion_5(Value: UnicodeString);
    procedure Set_Seccion_6(Value: UnicodeString);
  end;

{ TXMLEstructuraType }

  TXMLEstructuraType = class(TXMLNode, IXMLEstructuraType)
  protected
    { IXMLEstructuraType }
    function Get_Descripcion: IXMLDescripcionType;
    function Get_Formato: IXMLFormatoType;
    function Get_Estado: IXMLEstadoType;
    function Get_Proceso_administrativo: IXMLProceso_administrativoType;
    function Get_Unidad_administrativa_resp: IXMLUnidad_administrativa_respType;
    function Get_Perfil_autorizado: UnicodeString;
    function Get_Ubicacion: UnicodeString;
    function Get_Serie: IXMLSerieType;
    function Get_Numero_clasificacion: IXMLNumero_clasificacionType;
    function Get_Idioma: IXMLIdiomaType;
    procedure Set_Perfil_autorizado(Value: UnicodeString);
    procedure Set_Ubicacion(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEstructuraTypeList }

  TXMLEstructuraTypeList = class(TXMLNodeCollection, IXMLEstructuraTypeList)
  protected
    { IXMLEstructuraTypeList }
    function Add: IXMLEstructuraType;
    function Insert(const Index: Integer): IXMLEstructuraType;

    function Get_Item(Index: Integer): IXMLEstructuraType;
  end;

{ TXMLDescripcionType }

  TXMLDescripcionType = class(TXMLNode, IXMLDescripcionType)
  protected
    { IXMLDescripcionType }
    function Get_Descripcion_: UnicodeString;
    procedure Set_Descripcion_(Value: UnicodeString);
  end;

{ TXMLFormatoType }

  TXMLFormatoType = class(TXMLNode, IXMLFormatoType)
  protected
    { IXMLFormatoType }
    function Get_Formato_: UnicodeString;
    procedure Set_Formato_(Value: UnicodeString);
  end;

{ TXMLEstadoType }

  TXMLEstadoType = class(TXMLNode, IXMLEstadoType)
  protected
    { IXMLEstadoType }
    function Get_Estado_elaboracion: UnicodeString;
    procedure Set_Estado_elaboracion(Value: UnicodeString);
  end;

{ TXMLProceso_administrativoType }

  TXMLProceso_administrativoType = class(TXMLNode, IXMLProceso_administrativoType)
  protected
    { IXMLProceso_administrativoType }
    function Get_Macroproceso: UnicodeString;
    function Get_Procesonivel1_1: UnicodeString;
    function Get_Procesonivel1_2: UnicodeString;
    function Get_Procesonivel1_3: UnicodeString;
    function Get_Procesonivel1_4: UnicodeString;
    function Get_Procesonivel1_5: UnicodeString;
    function Get_Procesonivel2_1: UnicodeString;
    function Get_Procesonivel2_2: UnicodeString;
    function Get_Procesonivel2_3: UnicodeString;
    function Get_Procesonivel2_4: UnicodeString;
    function Get_Procesonivel2_5: UnicodeString;
    function Get_Procesonivel2_6: UnicodeString;
    function Get_Procesonivel2_7: UnicodeString;
    function Get_Procesonivel2_8: UnicodeString;
    function Get_Procesonivel2_9: UnicodeString;
    function Get_Procesonivel2_10: UnicodeString;
    function Get_Procesonivel2_11: UnicodeString;
    function Get_Procesonivel2_12: UnicodeString;
    function Get_Procesonivel2_13: UnicodeString;
    function Get_Procesonivel2_14: UnicodeString;
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1_1(Value: UnicodeString);
    procedure Set_Procesonivel1_2(Value: UnicodeString);
    procedure Set_Procesonivel1_3(Value: UnicodeString);
    procedure Set_Procesonivel1_4(Value: UnicodeString);
    procedure Set_Procesonivel1_5(Value: UnicodeString);
    procedure Set_Procesonivel2_1(Value: UnicodeString);
    procedure Set_Procesonivel2_2(Value: UnicodeString);
    procedure Set_Procesonivel2_3(Value: UnicodeString);
    procedure Set_Procesonivel2_4(Value: UnicodeString);
    procedure Set_Procesonivel2_5(Value: UnicodeString);
    procedure Set_Procesonivel2_6(Value: UnicodeString);
    procedure Set_Procesonivel2_7(Value: UnicodeString);
    procedure Set_Procesonivel2_8(Value: UnicodeString);
    procedure Set_Procesonivel2_9(Value: UnicodeString);
    procedure Set_Procesonivel2_10(Value: UnicodeString);
    procedure Set_Procesonivel2_11(Value: UnicodeString);
    procedure Set_Procesonivel2_12(Value: UnicodeString);
    procedure Set_Procesonivel2_13(Value: UnicodeString);
    procedure Set_Procesonivel2_14(Value: UnicodeString);
  end;

{ TXMLUnidad_administrativa_respType }

  TXMLUnidad_administrativa_respType = class(TXMLNode, IXMLUnidad_administrativa_respType)
  protected
    { IXMLUnidad_administrativa_respType }
    function Get_Unidadadministrativaresp: UnicodeString;
    procedure Set_Unidadadministrativaresp(Value: UnicodeString);
  end;

{ TXMLSerieType }

  TXMLSerieType = class(TXMLNode, IXMLSerieType)
  protected
    { IXMLSerieType }
    function Get_Serie_: UnicodeString;
    function Get_Subserie: UnicodeString;
    function Get_Serie_1: UnicodeString;
    function Get_Serie_2: UnicodeString;
    procedure Set_Serie_(Value: UnicodeString);
    procedure Set_Subserie(Value: UnicodeString);
    procedure Set_Serie_1(Value: UnicodeString);
    procedure Set_Serie_2(Value: UnicodeString);
  end;

{ TXMLNumero_clasificacionType }

  TXMLNumero_clasificacionType = class(TXMLNode, IXMLNumero_clasificacionType)
  protected
    { IXMLNumero_clasificacionType }
    function Get_Numero_clasificacion_documental: UnicodeString;
    procedure Set_Numero_clasificacion_documental(Value: UnicodeString);
  end;

{ TXMLIdiomaType }

  TXMLIdiomaType = class(TXMLNode, IXMLIdiomaType)
  protected
    { IXMLIdiomaType }
    function Get_Idioma_: UnicodeString;
    procedure Set_Idioma_(Value: UnicodeString);
  end;

{ TXMLContextoType }

  TXMLContextoType = class(TXMLNode, IXMLContextoType)
  protected
    { IXMLContextoType }
    function Get_Juridico_administrativo: IXMLJuridico_administrativoType;
    function Get_Documental: UnicodeString;
    function Get_Procedencia: UnicodeString;
    function Get_Procedimental: UnicodeString;
    function Get_Tecnologico: IXMLTecnologicoType;
    function Get_Autenticidad: IXMLAutenticidadType;
    function Get_Digitalizacion: IXMLDigitalizacionType;
    procedure Set_Documental(Value: UnicodeString);
    procedure Set_Procedencia(Value: UnicodeString);
    procedure Set_Procedimental(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLContextoTypeList }

  TXMLContextoTypeList = class(TXMLNodeCollection, IXMLContextoTypeList)
  protected
    { IXMLContextoTypeList }
    function Add: IXMLContextoType;
    function Insert(const Index: Integer): IXMLContextoType;

    function Get_Item(Index: Integer): IXMLContextoType;
  end;

{ TXMLJuridico_administrativoType }

  TXMLJuridico_administrativoType = class(TXMLNode, IXMLJuridico_administrativoType)
  protected
    { IXMLJuridico_administrativoType }
    function Get_Valores_primarios: UnicodeString;
    function Get_Valores_secundarios: UnicodeString;
    procedure Set_Valores_primarios(Value: UnicodeString);
    procedure Set_Valores_secundarios(Value: UnicodeString);
  end;

{ TXMLTecnologicoType }

  TXMLTecnologicoType = class(TXMLNode, IXMLTecnologicoType)
  protected
    { IXMLTecnologicoType }
    function Get_Tecnologico_1: UnicodeString;
    function Get_Tipodefirma: UnicodeString;
    procedure Set_Tecnologico_1(Value: UnicodeString);
    procedure Set_Tipodefirma(Value: UnicodeString);
  end;

{ TXMLAutenticidadType }

  TXMLAutenticidadType = class(TXMLNode, IXMLAutenticidadType)
  protected
    { IXMLAutenticidadType }
    function Get_Dominio_red: UnicodeString;
    function Get_Ip_usuario: UnicodeString;
    function Get_MAC_usuario: UnicodeString;
    procedure Set_Dominio_red(Value: UnicodeString);
    procedure Set_Ip_usuario(Value: UnicodeString);
    procedure Set_MAC_usuario(Value: UnicodeString);
  end;

{ TXMLDigitalizacionType }

  TXMLDigitalizacionType = class(TXMLNode, IXMLDigitalizacionType)
  protected
    { IXMLDigitalizacionType }
    function Get_Procesado_por: UnicodeString;
    function Get_Fecha_digitalizacion: UnicodeString;
    function Get_Fecha_indexacion: UnicodeString;
    function Get_Resolucion: UnicodeString;
    function Get_Tamano: UnicodeString;
    function Get_Software_captura: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_Compresion: UnicodeString;
    function Get_Folio_inicial: UnicodeString;
    function Get_Folio_final: UnicodeString;
    procedure Set_Procesado_por(Value: UnicodeString);
    procedure Set_Fecha_digitalizacion(Value: UnicodeString);
    procedure Set_Fecha_indexacion(Value: UnicodeString);
    procedure Set_Resolucion(Value: UnicodeString);
    procedure Set_Tamano(Value: UnicodeString);
    procedure Set_Software_captura(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Compresion(Value: UnicodeString);
    procedure Set_Folio_inicial(Value: UnicodeString);
    procedure Set_Folio_final(Value: UnicodeString);
  end;

{ TXMLIndicesType }

  TXMLIndicesType = class(TXMLNode, IXMLIndicesType)
  protected
    { IXMLIndicesType }
    function Get_Num_id: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
  end;

{ TXMLIndicesTypeList }

  TXMLIndicesTypeList = class(TXMLNodeCollection, IXMLIndicesTypeList)
  protected
    { IXMLIndicesTypeList }
    function Add: IXMLIndicesType;
    function Insert(const Index: Integer): IXMLIndicesType;

    function Get_Item(Index: Integer): IXMLIndicesType;
  end;

{ Global Functions }

function GetHISTORIA_LABORAL(Doc: IXMLDocument): IXMLHISTORIA_LABORALType;
function LoadHISTORIA_LABORAL(const FileName: string): IXMLHISTORIA_LABORALType;
function NewHISTORIA_LABORAL: IXMLHISTORIA_LABORALType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetHISTORIA_LABORAL(Doc: IXMLDocument): IXMLHISTORIA_LABORALType;
begin
  Result := Doc.GetDocBinding('HISTORIA_LABORAL', TXMLHISTORIA_LABORALType, TargetNamespace) as IXMLHISTORIA_LABORALType;
end;

function LoadHISTORIA_LABORAL(const FileName: string): IXMLHISTORIA_LABORALType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('HISTORIA_LABORAL', TXMLHISTORIA_LABORALType, TargetNamespace) as IXMLHISTORIA_LABORALType;
end;

function NewHISTORIA_LABORAL: IXMLHISTORIA_LABORALType;
begin
  Result := NewXMLDocument.GetDocBinding('HISTORIA_LABORAL', TXMLHISTORIA_LABORALType, TargetNamespace) as IXMLHISTORIA_LABORALType;
end;

{ TXMLHISTORIA_LABORALType }

procedure TXMLHISTORIA_LABORALType.AfterConstruction;
begin
  RegisterChildNode('contenido', TXMLContenidoType);
  RegisterChildNode('estructura', TXMLEstructuraType);
  RegisterChildNode('contexto', TXMLContextoType);
  RegisterChildNode('indices', TXMLIndicesType);
  FContenido := CreateCollection(TXMLContenidoTypeList, IXMLContenidoType, 'contenido') as IXMLContenidoTypeList;
  FEstructura := CreateCollection(TXMLEstructuraTypeList, IXMLEstructuraType, 'estructura') as IXMLEstructuraTypeList;
  FContexto := CreateCollection(TXMLContextoTypeList, IXMLContextoType, 'contexto') as IXMLContextoTypeList;
  FIndices := CreateCollection(TXMLIndicesTypeList, IXMLIndicesType, 'indices') as IXMLIndicesTypeList;
  inherited;
end;

function TXMLHISTORIA_LABORALType.Get_Contenido: IXMLContenidoTypeList;
begin
  Result := FContenido;
end;

function TXMLHISTORIA_LABORALType.Get_Estructura: IXMLEstructuraTypeList;
begin
  Result := FEstructura;
end;

function TXMLHISTORIA_LABORALType.Get_Contexto: IXMLContextoTypeList;
begin
  Result := FContexto;
end;

function TXMLHISTORIA_LABORALType.Get_Indices: IXMLIndicesTypeList;
begin
  Result := FIndices;
end;

{ TXMLContenidoType }

procedure TXMLContenidoType.AfterConstruction;
begin
  RegisterChildNode('identificacion_adicional', TXMLIdentificacion_adicionalType);
  RegisterChildNode('tipo_documental', TXMLTipo_documentalType);
  RegisterChildNode('titulo_documento', TXMLTitulo_documentoType);
  RegisterChildNode('autor_emisorresponsable', TXMLAutor_emisorresponsableType);
  RegisterChildNode('clasificacion_acceso', TXMLClasificacion_accesoType);
  RegisterChildNode('fecha_creacion', TXMLFecha_creacionType);
  RegisterChildNode('folio_electronico', TXMLFolio_electronicoType);
  RegisterChildNode('tema_asunto', TXMLTema_asuntoType);
  RegisterChildNode('palabras_clave', TXMLPalabras_claveType);
  inherited;
end;

function TXMLContenidoType.Get_Nombreimagen: UnicodeString;
begin
  Result := ChildNodes['nombreimagen'].Text;
end;

procedure TXMLContenidoType.Set_Nombreimagen(Value: UnicodeString);
begin
  ChildNodes['nombreimagen'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Tipoidentificacion: UnicodeString;
begin
  Result := ChildNodes['tipoidentificacion'].Text;
end;

procedure TXMLContenidoType.Set_Tipoidentificacion(Value: UnicodeString);
begin
  ChildNodes['tipoidentificacion'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Identificacion: UnicodeString;
begin
  Result := ChildNodes['identificacion'].Text;
end;

procedure TXMLContenidoType.Set_Identificacion(Value: UnicodeString);
begin
  ChildNodes['identificacion'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Folio_es_tipoidentificacion: UnicodeString;
begin
  Result := ChildNodes['folio_es_tipoidentificacion'].Text;
end;

procedure TXMLContenidoType.Set_Folio_es_tipoidentificacion(Value: UnicodeString);
begin
  ChildNodes['folio_es_tipoidentificacion'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Identificacion_adicional: IXMLIdentificacion_adicionalType;
begin
  Result := ChildNodes['identificacion_adicional'] as IXMLIdentificacion_adicionalType;
end;

function TXMLContenidoType.Get_Tipo_documental: IXMLTipo_documentalType;
begin
  Result := ChildNodes['tipo_documental'] as IXMLTipo_documentalType;
end;

function TXMLContenidoType.Get_Titulo_documento: IXMLTitulo_documentoType;
begin
  Result := ChildNodes['titulo_documento'] as IXMLTitulo_documentoType;
end;

function TXMLContenidoType.Get_Autor_emisorresponsable: IXMLAutor_emisorresponsableType;
begin
  Result := ChildNodes['autor_emisorresponsable'] as IXMLAutor_emisorresponsableType;
end;

function TXMLContenidoType.Get_Clasificacion_acceso: IXMLClasificacion_accesoType;
begin
  Result := ChildNodes['clasificacion_acceso'] as IXMLClasificacion_accesoType;
end;

function TXMLContenidoType.Get_Fecha_creacion: IXMLFecha_creacionType;
begin
  Result := ChildNodes['fecha_creacion'] as IXMLFecha_creacionType;
end;

function TXMLContenidoType.Get_Folio_electronico: IXMLFolio_electronicoType;
begin
  Result := ChildNodes['folio_electronico'] as IXMLFolio_electronicoType;
end;

function TXMLContenidoType.Get_Tema_asunto: IXMLTema_asuntoType;
begin
  Result := ChildNodes['tema_asunto'] as IXMLTema_asuntoType;
end;

function TXMLContenidoType.Get_Palabras_clave: IXMLPalabras_claveType;
begin
  Result := ChildNodes['palabras_clave'] as IXMLPalabras_claveType;
end;

{ TXMLContenidoTypeList }

function TXMLContenidoTypeList.Add: IXMLContenidoType;
begin
  Result := AddItem(-1) as IXMLContenidoType;
end;

function TXMLContenidoTypeList.Insert(const Index: Integer): IXMLContenidoType;
begin
  Result := AddItem(Index) as IXMLContenidoType;
end;

function TXMLContenidoTypeList.Get_Item(Index: Integer): IXMLContenidoType;
begin
  Result := List[Index] as IXMLContenidoType;
end;

{ TXMLIdentificacion_adicionalType }

function TXMLIdentificacion_adicionalType.Get_Tipoidentificacionadicional: UnicodeString;
begin
  Result := ChildNodes['tipoidentificacionadicional'].Text;
end;

procedure TXMLIdentificacion_adicionalType.Set_Tipoidentificacionadicional(Value: UnicodeString);
begin
  ChildNodes['tipoidentificacionadicional'].NodeValue := Value;
end;

function TXMLIdentificacion_adicionalType.Get_Identificacionadicional: UnicodeString;
begin
  Result := ChildNodes['identificacionadicional'].Text;
end;

procedure TXMLIdentificacion_adicionalType.Set_Identificacionadicional(Value: UnicodeString);
begin
  ChildNodes['identificacionadicional'].NodeValue := Value;
end;

{ TXMLTipo_documentalType }

function TXMLTipo_documentalType.Get_Tipodocumental: UnicodeString;
begin
  Result := ChildNodes['tipodocumental'].Text;
end;

procedure TXMLTipo_documentalType.Set_Tipodocumental(Value: UnicodeString);
begin
  ChildNodes['tipodocumental'].NodeValue := Value;
end;

function TXMLTipo_documentalType.Get_Tipo_proceso: UnicodeString;
begin
  Result := ChildNodes['tipo_proceso'].Text;
end;

procedure TXMLTipo_documentalType.Set_Tipo_proceso(Value: UnicodeString);
begin
  ChildNodes['tipo_proceso'].NodeValue := Value;
end;

function TXMLTipo_documentalType.Get_Seccion: UnicodeString;
begin
  Result := ChildNodes['Seccion'].Text;
end;

procedure TXMLTipo_documentalType.Set_Seccion(Value: UnicodeString);
begin
  ChildNodes['Seccion'].NodeValue := Value;
end;

{ TXMLTitulo_documentoType }

function TXMLTitulo_documentoType.Get_Titulodocumento: UnicodeString;
begin
  Result := ChildNodes['titulodocumento'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Titulodocumento(Value: UnicodeString);
begin
  ChildNodes['titulodocumento'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_1: UnicodeString;
begin
  Result := ChildNodes['Seccion_1'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_1(Value: UnicodeString);
begin
  ChildNodes['Seccion_1'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_2: UnicodeString;
begin
  Result := ChildNodes['Seccion_2'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_2(Value: UnicodeString);
begin
  ChildNodes['Seccion_2'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_3: UnicodeString;
begin
  Result := ChildNodes['Seccion_3'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_3(Value: UnicodeString);
begin
  ChildNodes['Seccion_3'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_4: UnicodeString;
begin
  Result := ChildNodes['Seccion_4'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_4(Value: UnicodeString);
begin
  ChildNodes['Seccion_4'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_5: UnicodeString;
begin
  Result := ChildNodes['Seccion_5'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_5(Value: UnicodeString);
begin
  ChildNodes['Seccion_5'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_Seccion_6: UnicodeString;
begin
  Result := ChildNodes['Seccion_6'].Text;
end;

procedure TXMLTitulo_documentoType.Set_Seccion_6(Value: UnicodeString);
begin
  ChildNodes['Seccion_6'].NodeValue := Value;
end;

function TXMLTitulo_documentoType.Get_ContratoCivil: UnicodeString;
begin
  Result := ChildNodes['ContratoCivil'].Text;
end;

procedure TXMLTitulo_documentoType.Set_ContratoCivil(Value: UnicodeString);
begin
  ChildNodes['ContratoCivil'].NodeValue := Value;
end;

{ TXMLAutor_emisorresponsableType }

function TXMLAutor_emisorresponsableType.Get_Fondo: UnicodeString;
begin
  Result := ChildNodes['fondo'].Text;
end;

procedure TXMLAutor_emisorresponsableType.Set_Fondo(Value: UnicodeString);
begin
  ChildNodes['fondo'].NodeValue := Value;
end;

function TXMLAutor_emisorresponsableType.Get_Unidad_responsable: UnicodeString;
begin
  Result := ChildNodes['unidad_responsable'].Text;
end;

procedure TXMLAutor_emisorresponsableType.Set_Unidad_responsable(Value: UnicodeString);
begin
  ChildNodes['unidad_responsable'].NodeValue := Value;
end;

{ TXMLClasificacion_accesoType }

function TXMLClasificacion_accesoType.Get_Nivel_acceso: UnicodeString;
begin
  Result := ChildNodes['nivel_acceso'].Text;
end;

procedure TXMLClasificacion_accesoType.Set_Nivel_acceso(Value: UnicodeString);
begin
  ChildNodes['nivel_acceso'].NodeValue := Value;
end;

{ TXMLFecha_creacionType }

function TXMLFecha_creacionType.Get_Fechacreacion: UnicodeString;
begin
  Result := ChildNodes['fechacreacion'].Text;
end;

procedure TXMLFecha_creacionType.Set_Fechacreacion(Value: UnicodeString);
begin
  ChildNodes['fechacreacion'].NodeValue := Value;
end;

{ TXMLFolio_electronicoType }

function TXMLFolio_electronicoType.Get_Folios_totales: UnicodeString;
begin
  Result := ChildNodes['folios_totales'].Text;
end;

procedure TXMLFolio_electronicoType.Set_Folios_totales(Value: UnicodeString);
begin
  ChildNodes['folios_totales'].NodeValue := Value;
end;

function TXMLFolio_electronicoType.Get_Folio_actual: UnicodeString;
begin
  Result := ChildNodes['folio_actual'].Text;
end;

procedure TXMLFolio_electronicoType.Set_Folio_actual(Value: UnicodeString);
begin
  ChildNodes['folio_actual'].NodeValue := Value;
end;

{ TXMLTema_asuntoType }

function TXMLTema_asuntoType.Get_Tema: UnicodeString;
begin
  Result := ChildNodes['tema'].Text;
end;

procedure TXMLTema_asuntoType.Set_Tema(Value: UnicodeString);
begin
  ChildNodes['tema'].NodeValue := Value;
end;

{ TXMLPalabras_claveType }

procedure TXMLPalabras_claveType.AfterConstruction;
begin
  RegisterChildNode('Secciones', TXMLSeccionesType);
  inherited;
end;

function TXMLPalabras_claveType.Get_Nombres_Apellidos: UnicodeString;
begin
  Result := ChildNodes['Nombres_Apellidos'].Text;
end;

procedure TXMLPalabras_claveType.Set_Nombres_Apellidos(Value: UnicodeString);
begin
  ChildNodes['Nombres_Apellidos'].NodeValue := Value;
end;

function TXMLPalabras_claveType.Get_Secciones: IXMLSeccionesType;
begin
  Result := ChildNodes['Secciones'] as IXMLSeccionesType;
end;

function TXMLPalabras_claveType.Get_Num_id: UnicodeString;
begin
  Result := ChildNodes['num_id'].Text;
end;

procedure TXMLPalabras_claveType.Set_Num_id(Value: UnicodeString);
begin
  ChildNodes['num_id'].NodeValue := Value;
end;

{ TXMLSeccionesType }

function TXMLSeccionesType.Get_Seccion_1: UnicodeString;
begin
  Result := ChildNodes['Seccion_1'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_1(Value: UnicodeString);
begin
  ChildNodes['Seccion_1'].NodeValue := Value;
end;

function TXMLSeccionesType.Get_Seccion_2: UnicodeString;
begin
  Result := ChildNodes['Seccion_2'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_2(Value: UnicodeString);
begin
  ChildNodes['Seccion_2'].NodeValue := Value;
end;

function TXMLSeccionesType.Get_Seccion_3: UnicodeString;
begin
  Result := ChildNodes['Seccion_3'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_3(Value: UnicodeString);
begin
  ChildNodes['Seccion_3'].NodeValue := Value;
end;

function TXMLSeccionesType.Get_Seccion_4: UnicodeString;
begin
  Result := ChildNodes['Seccion_4'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_4(Value: UnicodeString);
begin
  ChildNodes['Seccion_4'].NodeValue := Value;
end;

function TXMLSeccionesType.Get_Seccion_5: UnicodeString;
begin
  Result := ChildNodes['Seccion_5'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_5(Value: UnicodeString);
begin
  ChildNodes['Seccion_5'].NodeValue := Value;
end;

function TXMLSeccionesType.Get_Seccion_6: UnicodeString;
begin
  Result := ChildNodes['Seccion_6'].Text;
end;

procedure TXMLSeccionesType.Set_Seccion_6(Value: UnicodeString);
begin
  ChildNodes['Seccion_6'].NodeValue := Value;
end;

{ TXMLEstructuraType }

procedure TXMLEstructuraType.AfterConstruction;
begin
  RegisterChildNode('descripcion', TXMLDescripcionType);
  RegisterChildNode('formato', TXMLFormatoType);
  RegisterChildNode('estado', TXMLEstadoType);
  RegisterChildNode('proceso_administrativo', TXMLProceso_administrativoType);
  RegisterChildNode('unidad_administrativa_resp', TXMLUnidad_administrativa_respType);
  RegisterChildNode('serie', TXMLSerieType);
  RegisterChildNode('numero_clasificacion', TXMLNumero_clasificacionType);
  RegisterChildNode('idioma', TXMLIdiomaType);
  inherited;
end;

function TXMLEstructuraType.Get_Descripcion: IXMLDescripcionType;
begin
  Result := ChildNodes['descripcion'] as IXMLDescripcionType;
end;

function TXMLEstructuraType.Get_Formato: IXMLFormatoType;
begin
  Result := ChildNodes['formato'] as IXMLFormatoType;
end;

function TXMLEstructuraType.Get_Estado: IXMLEstadoType;
begin
  Result := ChildNodes['estado'] as IXMLEstadoType;
end;

function TXMLEstructuraType.Get_Proceso_administrativo: IXMLProceso_administrativoType;
begin
  Result := ChildNodes['proceso_administrativo'] as IXMLProceso_administrativoType;
end;

function TXMLEstructuraType.Get_Unidad_administrativa_resp: IXMLUnidad_administrativa_respType;
begin
  Result := ChildNodes['unidad_administrativa_resp'] as IXMLUnidad_administrativa_respType;
end;

function TXMLEstructuraType.Get_Perfil_autorizado: UnicodeString;
begin
  Result := ChildNodes['perfil_autorizado'].Text;
end;

procedure TXMLEstructuraType.Set_Perfil_autorizado(Value: UnicodeString);
begin
  ChildNodes['perfil_autorizado'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Ubicacion: UnicodeString;
begin
  Result := ChildNodes['ubicacion'].Text;
end;

procedure TXMLEstructuraType.Set_Ubicacion(Value: UnicodeString);
begin
  ChildNodes['ubicacion'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Serie: IXMLSerieType;
begin
  Result := ChildNodes['serie'] as IXMLSerieType;
end;

function TXMLEstructuraType.Get_Numero_clasificacion: IXMLNumero_clasificacionType;
begin
  Result := ChildNodes['numero_clasificacion'] as IXMLNumero_clasificacionType;
end;

function TXMLEstructuraType.Get_Idioma: IXMLIdiomaType;
begin
  Result := ChildNodes['idioma'] as IXMLIdiomaType;
end;

{ TXMLEstructuraTypeList }

function TXMLEstructuraTypeList.Add: IXMLEstructuraType;
begin
  Result := AddItem(-1) as IXMLEstructuraType;
end;

function TXMLEstructuraTypeList.Insert(const Index: Integer): IXMLEstructuraType;
begin
  Result := AddItem(Index) as IXMLEstructuraType;
end;

function TXMLEstructuraTypeList.Get_Item(Index: Integer): IXMLEstructuraType;
begin
  Result := List[Index] as IXMLEstructuraType;
end;

{ TXMLDescripcionType }

function TXMLDescripcionType.Get_Descripcion_: UnicodeString;
begin
  Result := ChildNodes['descripcion_'].Text;
end;

procedure TXMLDescripcionType.Set_Descripcion_(Value: UnicodeString);
begin
  ChildNodes['descripcion_'].NodeValue := Value;
end;

{ TXMLFormatoType }

function TXMLFormatoType.Get_Formato_: UnicodeString;
begin
  Result := ChildNodes['formato_'].Text;
end;

procedure TXMLFormatoType.Set_Formato_(Value: UnicodeString);
begin
  ChildNodes['formato_'].NodeValue := Value;
end;

{ TXMLEstadoType }

function TXMLEstadoType.Get_Estado_elaboracion: UnicodeString;
begin
  Result := ChildNodes['estado_elaboracion'].Text;
end;

procedure TXMLEstadoType.Set_Estado_elaboracion(Value: UnicodeString);
begin
  ChildNodes['estado_elaboracion'].NodeValue := Value;
end;

{ TXMLProceso_administrativoType }

function TXMLProceso_administrativoType.Get_Macroproceso: UnicodeString;
begin
  Result := ChildNodes['macroproceso'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Macroproceso(Value: UnicodeString);
begin
  ChildNodes['macroproceso'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel1_1: UnicodeString;
begin
  Result := ChildNodes['procesonivel1_1'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1_1(Value: UnicodeString);
begin
  ChildNodes['procesonivel1_1'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel1_2: UnicodeString;
begin
  Result := ChildNodes['procesonivel1_2'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1_2(Value: UnicodeString);
begin
  ChildNodes['procesonivel1_2'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel1_3: UnicodeString;
begin
  Result := ChildNodes['procesonivel1_3'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1_3(Value: UnicodeString);
begin
  ChildNodes['procesonivel1_3'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel1_4: UnicodeString;
begin
  Result := ChildNodes['procesonivel1_4'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1_4(Value: UnicodeString);
begin
  ChildNodes['procesonivel1_4'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel1_5: UnicodeString;
begin
  Result := ChildNodes['procesonivel1_5'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1_5(Value: UnicodeString);
begin
  ChildNodes['procesonivel1_5'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_1: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_1'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_1(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_1'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_2: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_2'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_2(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_2'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_3: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_3'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_3(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_3'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_4: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_4'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_4(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_4'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_5: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_5'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_5(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_5'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_6: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_6'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_6(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_6'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_7: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_7'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_7(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_7'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_8: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_8'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_8(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_8'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_9: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_9'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_9(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_9'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_10: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_10'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_10(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_10'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_11: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_11'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_11(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_11'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_12: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_12'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_12(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_12'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_13: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_13'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_13(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_13'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2_14: UnicodeString;
begin
  Result := ChildNodes['procesonivel2_14'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2_14(Value: UnicodeString);
begin
  ChildNodes['procesonivel2_14'].NodeValue := Value;
end;

{ TXMLUnidad_administrativa_respType }

function TXMLUnidad_administrativa_respType.Get_Unidadadministrativaresp: UnicodeString;
begin
  Result := ChildNodes['unidadadministrativaresp'].Text;
end;

procedure TXMLUnidad_administrativa_respType.Set_Unidadadministrativaresp(Value: UnicodeString);
begin
  ChildNodes['unidadadministrativaresp'].NodeValue := Value;
end;

{ TXMLSerieType }

function TXMLSerieType.Get_Serie_: UnicodeString;
begin
  Result := ChildNodes['serie_'].Text;
end;

procedure TXMLSerieType.Set_Serie_(Value: UnicodeString);
begin
  ChildNodes['serie_'].NodeValue := Value;
end;

function TXMLSerieType.Get_Subserie: UnicodeString;
begin
  Result := ChildNodes['subserie'].Text;
end;

procedure TXMLSerieType.Set_Subserie(Value: UnicodeString);
begin
  ChildNodes['subserie'].NodeValue := Value;
end;

function TXMLSerieType.Get_Serie_1: UnicodeString;
begin
  Result := ChildNodes['Serie_1'].Text;
end;

procedure TXMLSerieType.Set_Serie_1(Value: UnicodeString);
begin
  ChildNodes['Serie_1'].NodeValue := Value;
end;

function TXMLSerieType.Get_Serie_2: UnicodeString;
begin
  Result := ChildNodes['Serie_2'].Text;
end;

procedure TXMLSerieType.Set_Serie_2(Value: UnicodeString);
begin
  ChildNodes['Serie_2'].NodeValue := Value;
end;

{ TXMLNumero_clasificacionType }

function TXMLNumero_clasificacionType.Get_Numero_clasificacion_documental: UnicodeString;
begin
  Result := ChildNodes['numero_clasificacion_documental'].Text;
end;

procedure TXMLNumero_clasificacionType.Set_Numero_clasificacion_documental(Value: UnicodeString);
begin
  ChildNodes['numero_clasificacion_documental'].NodeValue := Value;
end;

{ TXMLIdiomaType }

function TXMLIdiomaType.Get_Idioma_: UnicodeString;
begin
  Result := ChildNodes['idioma_'].Text;
end;

procedure TXMLIdiomaType.Set_Idioma_(Value: UnicodeString);
begin
  ChildNodes['idioma_'].NodeValue := Value;
end;

{ TXMLContextoType }

procedure TXMLContextoType.AfterConstruction;
begin
  RegisterChildNode('juridico_administrativo', TXMLJuridico_administrativoType);
  RegisterChildNode('tecnologico', TXMLTecnologicoType);
  RegisterChildNode('autenticidad', TXMLAutenticidadType);
  RegisterChildNode('digitalizacion', TXMLDigitalizacionType);
  inherited;
end;

function TXMLContextoType.Get_Juridico_administrativo: IXMLJuridico_administrativoType;
begin
  Result := ChildNodes['juridico_administrativo'] as IXMLJuridico_administrativoType;
end;

function TXMLContextoType.Get_Documental: UnicodeString;
begin
  Result := ChildNodes['documental'].Text;
end;

procedure TXMLContextoType.Set_Documental(Value: UnicodeString);
begin
  ChildNodes['documental'].NodeValue := Value;
end;

function TXMLContextoType.Get_Procedencia: UnicodeString;
begin
  Result := ChildNodes['procedencia'].Text;
end;

procedure TXMLContextoType.Set_Procedencia(Value: UnicodeString);
begin
  ChildNodes['procedencia'].NodeValue := Value;
end;

function TXMLContextoType.Get_Procedimental: UnicodeString;
begin
  Result := ChildNodes['procedimental'].Text;
end;

procedure TXMLContextoType.Set_Procedimental(Value: UnicodeString);
begin
  ChildNodes['procedimental'].NodeValue := Value;
end;

function TXMLContextoType.Get_Tecnologico: IXMLTecnologicoType;
begin
  Result := ChildNodes['tecnologico'] as IXMLTecnologicoType;
end;

function TXMLContextoType.Get_Autenticidad: IXMLAutenticidadType;
begin
  Result := ChildNodes['autenticidad'] as IXMLAutenticidadType;
end;

function TXMLContextoType.Get_Digitalizacion: IXMLDigitalizacionType;
begin
  Result := ChildNodes['digitalizacion'] as IXMLDigitalizacionType;
end;

{ TXMLContextoTypeList }

function TXMLContextoTypeList.Add: IXMLContextoType;
begin
  Result := AddItem(-1) as IXMLContextoType;
end;

function TXMLContextoTypeList.Insert(const Index: Integer): IXMLContextoType;
begin
  Result := AddItem(Index) as IXMLContextoType;
end;

function TXMLContextoTypeList.Get_Item(Index: Integer): IXMLContextoType;
begin
  Result := List[Index] as IXMLContextoType;
end;

{ TXMLJuridico_administrativoType }

function TXMLJuridico_administrativoType.Get_Valores_primarios: UnicodeString;
begin
  Result := ChildNodes['valores_primarios'].Text;
end;

procedure TXMLJuridico_administrativoType.Set_Valores_primarios(Value: UnicodeString);
begin
  ChildNodes['valores_primarios'].NodeValue := Value;
end;

function TXMLJuridico_administrativoType.Get_Valores_secundarios: UnicodeString;
begin
  Result := ChildNodes['valores_secundarios'].Text;
end;

procedure TXMLJuridico_administrativoType.Set_Valores_secundarios(Value: UnicodeString);
begin
  ChildNodes['valores_secundarios'].NodeValue := Value;
end;

{ TXMLTecnologicoType }

function TXMLTecnologicoType.Get_Tecnologico_1: UnicodeString;
begin
  Result := ChildNodes['tecnologico_1'].Text;
end;

procedure TXMLTecnologicoType.Set_Tecnologico_1(Value: UnicodeString);
begin
  ChildNodes['tecnologico_1'].NodeValue := Value;
end;

function TXMLTecnologicoType.Get_Tipodefirma: UnicodeString;
begin
  Result := ChildNodes['tipodefirma'].Text;
end;

procedure TXMLTecnologicoType.Set_Tipodefirma(Value: UnicodeString);
begin
  ChildNodes['tipodefirma'].NodeValue := Value;
end;

{ TXMLAutenticidadType }

function TXMLAutenticidadType.Get_Dominio_red: UnicodeString;
begin
  Result := ChildNodes['dominio_red'].Text;
end;

procedure TXMLAutenticidadType.Set_Dominio_red(Value: UnicodeString);
begin
  ChildNodes['dominio_red'].NodeValue := Value;
end;

function TXMLAutenticidadType.Get_Ip_usuario: UnicodeString;
begin
  Result := ChildNodes['ip_usuario'].Text;
end;

procedure TXMLAutenticidadType.Set_Ip_usuario(Value: UnicodeString);
begin
  ChildNodes['ip_usuario'].NodeValue := Value;
end;

function TXMLAutenticidadType.Get_MAC_usuario: UnicodeString;
begin
  Result := ChildNodes['MAC_usuario'].Text;
end;

procedure TXMLAutenticidadType.Set_MAC_usuario(Value: UnicodeString);
begin
  ChildNodes['MAC_usuario'].NodeValue := Value;
end;

{ TXMLDigitalizacionType }

function TXMLDigitalizacionType.Get_Procesado_por: UnicodeString;
begin
  Result := ChildNodes['procesado_por'].Text;
end;

procedure TXMLDigitalizacionType.Set_Procesado_por(Value: UnicodeString);
begin
  ChildNodes['procesado_por'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Fecha_digitalizacion: UnicodeString;
begin
  Result := ChildNodes['fecha_digitalizacion'].Text;
end;

procedure TXMLDigitalizacionType.Set_Fecha_digitalizacion(Value: UnicodeString);
begin
  ChildNodes['fecha_digitalizacion'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Fecha_indexacion: UnicodeString;
begin
  Result := ChildNodes['fecha_indexacion'].Text;
end;

procedure TXMLDigitalizacionType.Set_Fecha_indexacion(Value: UnicodeString);
begin
  ChildNodes['fecha_indexacion'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Resolucion: UnicodeString;
begin
  Result := ChildNodes['resolucion'].Text;
end;

procedure TXMLDigitalizacionType.Set_Resolucion(Value: UnicodeString);
begin
  ChildNodes['resolucion'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Tamano: UnicodeString;
begin
  Result := ChildNodes['tamano'].Text;
end;

procedure TXMLDigitalizacionType.Set_Tamano(Value: UnicodeString);
begin
  ChildNodes['tamano'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Software_captura: UnicodeString;
begin
  Result := ChildNodes['software_captura'].Text;
end;

procedure TXMLDigitalizacionType.Set_Software_captura(Value: UnicodeString);
begin
  ChildNodes['software_captura'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Color: UnicodeString;
begin
  Result := ChildNodes['color'].Text;
end;

procedure TXMLDigitalizacionType.Set_Color(Value: UnicodeString);
begin
  ChildNodes['color'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Compresion: UnicodeString;
begin
  Result := ChildNodes['compresion'].Text;
end;

procedure TXMLDigitalizacionType.Set_Compresion(Value: UnicodeString);
begin
  ChildNodes['compresion'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Folio_inicial: UnicodeString;
begin
  Result := ChildNodes['folio_inicial'].Text;
end;

procedure TXMLDigitalizacionType.Set_Folio_inicial(Value: UnicodeString);
begin
  ChildNodes['folio_inicial'].NodeValue := Value;
end;

function TXMLDigitalizacionType.Get_Folio_final: UnicodeString;
begin
  Result := ChildNodes['folio_final'].Text;
end;

procedure TXMLDigitalizacionType.Set_Folio_final(Value: UnicodeString);
begin
  ChildNodes['folio_final'].NodeValue := Value;
end;

{ TXMLIndicesType }

function TXMLIndicesType.Get_Num_id: UnicodeString;
begin
  Result := ChildNodes['num_id'].Text;
end;

procedure TXMLIndicesType.Set_Num_id(Value: UnicodeString);
begin
  ChildNodes['num_id'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Prim_nomb: UnicodeString;
begin
  Result := ChildNodes['prim_nomb'].Text;
end;

procedure TXMLIndicesType.Set_Prim_nomb(Value: UnicodeString);
begin
  ChildNodes['prim_nomb'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Seg_nomb: UnicodeString;
begin
  Result := ChildNodes['seg_nomb'].Text;
end;

procedure TXMLIndicesType.Set_Seg_nomb(Value: UnicodeString);
begin
  ChildNodes['seg_nomb'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Prim_apll: UnicodeString;
begin
  Result := ChildNodes['prim_apll'].Text;
end;

procedure TXMLIndicesType.Set_Prim_apll(Value: UnicodeString);
begin
  ChildNodes['prim_apll'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Seg_apll: UnicodeString;
begin
  Result := ChildNodes['seg_apll'].Text;
end;

procedure TXMLIndicesType.Set_Seg_apll(Value: UnicodeString);
begin
  ChildNodes['seg_apll'].NodeValue := Value;
end;

{ TXMLIndicesTypeList }

function TXMLIndicesTypeList.Add: IXMLIndicesType;
begin
  Result := AddItem(-1) as IXMLIndicesType;
end;

function TXMLIndicesTypeList.Insert(const Index: Integer): IXMLIndicesType;
begin
  Result := AddItem(Index) as IXMLIndicesType;
end;

function TXMLIndicesTypeList.Get_Item(Index: Integer): IXMLIndicesType;
begin
  Result := List[Index] as IXMLIndicesType;
end;

end.