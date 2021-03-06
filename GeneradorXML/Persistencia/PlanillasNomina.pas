
{***********************************************************************************************************}
{                                                                                                           }
{                                             XML Data Binding                                              }
{                                                                                                           }
{         Generated on: 13/01/2016 12:19:46 p.m.                                                            }
{       Generated from: D:\TM_UNIANDES_BPO\TRUNK\Aplicacion\GeneradorXML\Persistencia\PlanillasNomina.dtd   }
{   Settings stored in: D:\TM_UNIANDES_BPO\TRUNK\Aplicacion\GeneradorXML\Persistencia\PlanillasNomina.xdb   }
{                                                                                                           }
{***********************************************************************************************************}

unit PlanillasNomina;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLPLANILLA_NOMINAType = interface;
  IXMLContenidoType = interface;
  IXMLContenidoTypeList = interface;
  IXMLTipo_documentalType = interface;
  IXMLTitulo_documentoType = interface;
  IXMLAutor_emisorresponsableType = interface;
  IXMLClasificacion_accesoType = interface;
  IXMLFecha_creacionType = interface;
  IXMLFolio_electronicoType = interface;
  IXMLTema_asuntoType = interface;
  IXMLEstructuraType = interface;
  IXMLEstructuraTypeList = interface;
  IXMLDescripcionType = interface;
  IXMLFormatoType = interface;
  IXMLEstadoType = interface;
  IXMLProceso_administrativoType = interface;
  IXMLUnidad_administrativa_respType = interface;
  IXMLSerieType = interface;
  IXMLContextoType = interface;
  IXMLContextoTypeList = interface;
  IXMLJuridico_administrativoType = interface;
  IXMLTecnologicoType = interface;
  IXMLAutenticidadType = interface;
  IXMLDigitalizacionType = interface;
  IXMLIndicesType = interface;
  IXMLIndicesTypeList = interface;

{ IXMLPLANILLA_NOMINAType }

  IXMLPLANILLA_NOMINAType = interface(IXMLNode)
    ['{2A08C006-5CB2-4B3E-B6C7-22DBDDFBE96C}']
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
    ['{93DFE8C4-6A2F-46E7-8351-432F2CCB052E}']
    { Property Accessors }
    function Get_Nombreimagen: UnicodeString;
    function Get_Periodo_nomina: UnicodeString;
    function Get_Tipo_documental: IXMLTipo_documentalType;
    function Get_Titulo_documento: IXMLTitulo_documentoType;
    function Get_Autor_emisorresponsable: IXMLAutor_emisorresponsableType;
    function Get_Clasificacion_acceso: IXMLClasificacion_accesoType;
    function Get_Fecha_creacion: IXMLFecha_creacionType;
    function Get_Folio_electronico: IXMLFolio_electronicoType;
    function Get_Tema_asunto: IXMLTema_asuntoType;
    function Get_Palabras_clave: UnicodeString;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Periodo_nomina(Value: UnicodeString);
    procedure Set_Palabras_clave(Value: UnicodeString);
    { Methods & Properties }
    property Nombreimagen: UnicodeString read Get_Nombreimagen write Set_Nombreimagen;
    property Periodo_nomina: UnicodeString read Get_Periodo_nomina write Set_Periodo_nomina;
    property Tipo_documental: IXMLTipo_documentalType read Get_Tipo_documental;
    property Titulo_documento: IXMLTitulo_documentoType read Get_Titulo_documento;
    property Autor_emisorresponsable: IXMLAutor_emisorresponsableType read Get_Autor_emisorresponsable;
    property Clasificacion_acceso: IXMLClasificacion_accesoType read Get_Clasificacion_acceso;
    property Fecha_creacion: IXMLFecha_creacionType read Get_Fecha_creacion;
    property Folio_electronico: IXMLFolio_electronicoType read Get_Folio_electronico;
    property Tema_asunto: IXMLTema_asuntoType read Get_Tema_asunto;
    property Palabras_clave: UnicodeString read Get_Palabras_clave write Set_Palabras_clave;
  end;

{ IXMLContenidoTypeList }

  IXMLContenidoTypeList = interface(IXMLNodeCollection)
    ['{BEEED181-1DD8-4B71-A2F0-48BD48AC6E42}']
    { Methods & Properties }
    function Add: IXMLContenidoType;
    function Insert(const Index: Integer): IXMLContenidoType;

    function Get_Item(Index: Integer): IXMLContenidoType;
    property Items[Index: Integer]: IXMLContenidoType read Get_Item; default;
  end;

{ IXMLTipo_documentalType }

  IXMLTipo_documentalType = interface(IXMLNode)
    ['{ADDA8B2E-B93B-4F53-8B1E-B3B03C3FA8A0}']
    { Property Accessors }
    function Get_Seriedocumental: UnicodeString;
    procedure Set_Seriedocumental(Value: UnicodeString);
    { Methods & Properties }
    property Seriedocumental: UnicodeString read Get_Seriedocumental write Set_Seriedocumental;
  end;

{ IXMLTitulo_documentoType }

  IXMLTitulo_documentoType = interface(IXMLNode)
    ['{C6C5EB6D-92A8-48C5-8035-91659AB856E4}']
    { Property Accessors }
    function Get_Titulodocumento: UnicodeString;
    procedure Set_Titulodocumento(Value: UnicodeString);
    { Methods & Properties }
    property Titulodocumento: UnicodeString read Get_Titulodocumento write Set_Titulodocumento;
  end;

{ IXMLAutor_emisorresponsableType }

  IXMLAutor_emisorresponsableType = interface(IXMLNode)
    ['{EC3DAA90-BADD-4528-9D84-4DFF10EC533D}']
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
    ['{E1CE124E-71B9-4BC1-90E9-64359E4EDCA9}']
    { Property Accessors }
    function Get_Nivel_acceso: UnicodeString;
    procedure Set_Nivel_acceso(Value: UnicodeString);
    { Methods & Properties }
    property Nivel_acceso: UnicodeString read Get_Nivel_acceso write Set_Nivel_acceso;
  end;

{ IXMLFecha_creacionType }

  IXMLFecha_creacionType = interface(IXMLNode)
    ['{42EBA0F5-7A60-404B-A97B-75FF9001C67D}']
    { Property Accessors }
    function Get_Fechacreacion: UnicodeString;
    procedure Set_Fechacreacion(Value: UnicodeString);
    { Methods & Properties }
    property Fechacreacion: UnicodeString read Get_Fechacreacion write Set_Fechacreacion;
  end;

{ IXMLFolio_electronicoType }

  IXMLFolio_electronicoType = interface(IXMLNode)
    ['{56C95BA8-C4DE-4985-8C19-204655061737}']
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
    ['{4F109865-3644-46EE-B2F3-C1142DBB69E4}']
    { Property Accessors }
    function Get_Tema: UnicodeString;
    procedure Set_Tema(Value: UnicodeString);
    { Methods & Properties }
    property Tema: UnicodeString read Get_Tema write Set_Tema;
  end;

{ IXMLEstructuraType }

  IXMLEstructuraType = interface(IXMLNode)
    ['{82CDA3C2-7FA7-419D-9C45-DF8D311B0F77}']
    { Property Accessors }
    function Get_Descripcion: IXMLDescripcionType;
    function Get_Formato: IXMLFormatoType;
    function Get_Estado: IXMLEstadoType;
    function Get_Proceso_administrativo: IXMLProceso_administrativoType;
    function Get_Unidad_administrativa_resp: IXMLUnidad_administrativa_respType;
    function Get_Perfil_autorizado: UnicodeString;
    function Get_Ubicacion: UnicodeString;
    function Get_Serie: IXMLSerieType;
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
  end;

{ IXMLEstructuraTypeList }

  IXMLEstructuraTypeList = interface(IXMLNodeCollection)
    ['{3DEC0B46-3580-491C-9DB1-8C8409629A30}']
    { Methods & Properties }
    function Add: IXMLEstructuraType;
    function Insert(const Index: Integer): IXMLEstructuraType;

    function Get_Item(Index: Integer): IXMLEstructuraType;
    property Items[Index: Integer]: IXMLEstructuraType read Get_Item; default;
  end;

{ IXMLDescripcionType }

  IXMLDescripcionType = interface(IXMLNode)
    ['{4B48217B-ED2D-42CB-8918-780E60A4FEFF}']
    { Property Accessors }
    function Get_Descripcion_: UnicodeString;
    procedure Set_Descripcion_(Value: UnicodeString);
    { Methods & Properties }
    property Descripcion_: UnicodeString read Get_Descripcion_ write Set_Descripcion_;
  end;

{ IXMLFormatoType }

  IXMLFormatoType = interface(IXMLNode)
    ['{B69470D6-8533-4DE1-87FB-56862CD9D6F4}']
    { Property Accessors }
    function Get_Formato_: UnicodeString;
    procedure Set_Formato_(Value: UnicodeString);
    { Methods & Properties }
    property Formato_: UnicodeString read Get_Formato_ write Set_Formato_;
  end;

{ IXMLEstadoType }

  IXMLEstadoType = interface(IXMLNode)
    ['{AA5473F0-D9E1-4657-A6E9-691D8F4B9EC8}']
    { Property Accessors }
    function Get_Estado_elaboracion: UnicodeString;
    procedure Set_Estado_elaboracion(Value: UnicodeString);
    { Methods & Properties }
    property Estado_elaboracion: UnicodeString read Get_Estado_elaboracion write Set_Estado_elaboracion;
  end;

{ IXMLProceso_administrativoType }

  IXMLProceso_administrativoType = interface(IXMLNode)
    ['{83C9329F-6CB8-4DC5-A52D-1E4C303D7ADB}']
    { Property Accessors }
    function Get_Macroproceso: UnicodeString;
    function Get_Procesonivel1: UnicodeString;
    function Get_Procesonivel2: UnicodeString;
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1(Value: UnicodeString);
    procedure Set_Procesonivel2(Value: UnicodeString);
    { Methods & Properties }
    property Macroproceso: UnicodeString read Get_Macroproceso write Set_Macroproceso;
    property Procesonivel1: UnicodeString read Get_Procesonivel1 write Set_Procesonivel1;
    property Procesonivel2: UnicodeString read Get_Procesonivel2 write Set_Procesonivel2;
  end;

{ IXMLUnidad_administrativa_respType }

  IXMLUnidad_administrativa_respType = interface(IXMLNode)
    ['{2FB8764D-1B8A-4EF3-A0D1-F9CACE15D921}']
    { Property Accessors }
    function Get_Unidadadministrativaresp: UnicodeString;
    procedure Set_Unidadadministrativaresp(Value: UnicodeString);
    { Methods & Properties }
    property Unidadadministrativaresp: UnicodeString read Get_Unidadadministrativaresp write Set_Unidadadministrativaresp;
  end;

{ IXMLSerieType }

  IXMLSerieType = interface(IXMLNode)
    ['{50884E8B-28D7-482D-B470-7759B2D95FF6}']
    { Property Accessors }
    function Get_Serie_: UnicodeString;
    function Get_Subserie: UnicodeString;
    procedure Set_Serie_(Value: UnicodeString);
    procedure Set_Subserie(Value: UnicodeString);
    { Methods & Properties }
    property Serie_: UnicodeString read Get_Serie_ write Set_Serie_;
    property Subserie: UnicodeString read Get_Subserie write Set_Subserie;
  end;

{ IXMLContextoType }

  IXMLContextoType = interface(IXMLNode)
    ['{249D93B0-AD40-4A2D-A1E1-274D6AAA4D3C}']
    { Property Accessors }
    function Get_Juridico_administrativo: IXMLJuridico_administrativoType;
    function Get_Documental: UnicodeString;
    function Get_Procedencia: UnicodeString;
    function Get_Procedimental: UnicodeString;
    function Get_Tecnologico: IXMLTecnologicoType;
    function Get_Autenticidad: IXMLAutenticidadType;
    function Get_Digitalizacion: IXMLDigitalizacionType;
    function Get_Indices: IXMLIndicesType;
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
    property Indices: IXMLIndicesType read Get_Indices;
  end;

{ IXMLContextoTypeList }

  IXMLContextoTypeList = interface(IXMLNodeCollection)
    ['{7BD7AD3A-8573-492A-B3E7-DD16BCE2CB6F}']
    { Methods & Properties }
    function Add: IXMLContextoType;
    function Insert(const Index: Integer): IXMLContextoType;

    function Get_Item(Index: Integer): IXMLContextoType;
    property Items[Index: Integer]: IXMLContextoType read Get_Item; default;
  end;

{ IXMLJuridico_administrativoType }

  IXMLJuridico_administrativoType = interface(IXMLNode)
    ['{553AB99C-2466-4DF3-95B5-BA42DBCC7E2E}']
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
    ['{92D800AD-0816-4AA0-AD86-369BC7C5E6EC}']
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
    ['{017ACF07-C14B-4CFB-B7F3-E654080599B7}']
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
    ['{2A769403-043F-4010-86DA-CC3CC9EFA443}']
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
    ['{34CF3218-BDAA-477E-BA0D-A9F671A8C402}']
    { Property Accessors }
    function Get_Fecha_nomina: UnicodeString;
    function Get_Num_id: UnicodeString;
    function Get_Tipo: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    procedure Set_Fecha_nomina(Value: UnicodeString);
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
    { Methods & Properties }
    property Fecha_nomina: UnicodeString read Get_Fecha_nomina write Set_Fecha_nomina;
    property Num_id: UnicodeString read Get_Num_id write Set_Num_id;
    property Tipo: UnicodeString read Get_Tipo write Set_Tipo;
    property Prim_apll: UnicodeString read Get_Prim_apll write Set_Prim_apll;
    property Seg_apll: UnicodeString read Get_Seg_apll write Set_Seg_apll;
    property Prim_nomb: UnicodeString read Get_Prim_nomb write Set_Prim_nomb;
    property Seg_nomb: UnicodeString read Get_Seg_nomb write Set_Seg_nomb;
  end;

{ IXMLIndicesTypeList }

  IXMLIndicesTypeList = interface(IXMLNodeCollection)
    ['{0F4F0F7F-9ED8-4E39-BE74-6F7A23452D1B}']
    { Methods & Properties }
    function Add: IXMLIndicesType;
    function Insert(const Index: Integer): IXMLIndicesType;

    function Get_Item(Index: Integer): IXMLIndicesType;
    property Items[Index: Integer]: IXMLIndicesType read Get_Item; default;
  end;

{ Forward Decls }

  TXMLPLANILLA_NOMINAType = class;
  TXMLContenidoType = class;
  TXMLContenidoTypeList = class;
  TXMLTipo_documentalType = class;
  TXMLTitulo_documentoType = class;
  TXMLAutor_emisorresponsableType = class;
  TXMLClasificacion_accesoType = class;
  TXMLFecha_creacionType = class;
  TXMLFolio_electronicoType = class;
  TXMLTema_asuntoType = class;
  TXMLEstructuraType = class;
  TXMLEstructuraTypeList = class;
  TXMLDescripcionType = class;
  TXMLFormatoType = class;
  TXMLEstadoType = class;
  TXMLProceso_administrativoType = class;
  TXMLUnidad_administrativa_respType = class;
  TXMLSerieType = class;
  TXMLContextoType = class;
  TXMLContextoTypeList = class;
  TXMLJuridico_administrativoType = class;
  TXMLTecnologicoType = class;
  TXMLAutenticidadType = class;
  TXMLDigitalizacionType = class;
  TXMLIndicesType = class;
  TXMLIndicesTypeList = class;

{ TXMLPLANILLA_NOMINAType }

  TXMLPLANILLA_NOMINAType = class(TXMLNode, IXMLPLANILLA_NOMINAType)
  private
    FContenido: IXMLContenidoTypeList;
    FEstructura: IXMLEstructuraTypeList;
    FContexto: IXMLContextoTypeList;
    FIndices: IXMLIndicesTypeList;
  protected
    { IXMLPLANILLA_NOMINAType }
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
    function Get_Periodo_nomina: UnicodeString;
    function Get_Tipo_documental: IXMLTipo_documentalType;
    function Get_Titulo_documento: IXMLTitulo_documentoType;
    function Get_Autor_emisorresponsable: IXMLAutor_emisorresponsableType;
    function Get_Clasificacion_acceso: IXMLClasificacion_accesoType;
    function Get_Fecha_creacion: IXMLFecha_creacionType;
    function Get_Folio_electronico: IXMLFolio_electronicoType;
    function Get_Tema_asunto: IXMLTema_asuntoType;
    function Get_Palabras_clave: UnicodeString;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Periodo_nomina(Value: UnicodeString);
    procedure Set_Palabras_clave(Value: UnicodeString);
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

{ TXMLTipo_documentalType }

  TXMLTipo_documentalType = class(TXMLNode, IXMLTipo_documentalType)
  protected
    { IXMLTipo_documentalType }
    function Get_Seriedocumental: UnicodeString;
    procedure Set_Seriedocumental(Value: UnicodeString);
  end;

{ TXMLTitulo_documentoType }

  TXMLTitulo_documentoType = class(TXMLNode, IXMLTitulo_documentoType)
  protected
    { IXMLTitulo_documentoType }
    function Get_Titulodocumento: UnicodeString;
    procedure Set_Titulodocumento(Value: UnicodeString);
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
    function Get_Procesonivel1: UnicodeString;
    function Get_Procesonivel2: UnicodeString;
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1(Value: UnicodeString);
    procedure Set_Procesonivel2(Value: UnicodeString);
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
    procedure Set_Serie_(Value: UnicodeString);
    procedure Set_Subserie(Value: UnicodeString);
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
    function Get_Indices: IXMLIndicesType;
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
    function Get_Fecha_nomina: UnicodeString;
    function Get_Num_id: UnicodeString;
    function Get_Tipo: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    procedure Set_Fecha_nomina(Value: UnicodeString);
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
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

function GetPLANILLA_NOMINA(Doc: IXMLDocument): IXMLPLANILLA_NOMINAType;
function LoadPLANILLA_NOMINA(const FileName: string): IXMLPLANILLA_NOMINAType;
function NewPLANILLA_NOMINA: IXMLPLANILLA_NOMINAType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetPLANILLA_NOMINA(Doc: IXMLDocument): IXMLPLANILLA_NOMINAType;
begin
  Result := Doc.GetDocBinding('PLANILLA_NOMINA', TXMLPLANILLA_NOMINAType, TargetNamespace) as IXMLPLANILLA_NOMINAType;
end;

function LoadPLANILLA_NOMINA(const FileName: string): IXMLPLANILLA_NOMINAType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('PLANILLA_NOMINA', TXMLPLANILLA_NOMINAType, TargetNamespace) as IXMLPLANILLA_NOMINAType;
end;

function NewPLANILLA_NOMINA: IXMLPLANILLA_NOMINAType;
begin
  Result := NewXMLDocument.GetDocBinding('PLANILLA_NOMINA', TXMLPLANILLA_NOMINAType, TargetNamespace) as IXMLPLANILLA_NOMINAType;
end;

{ TXMLPLANILLA_NOMINAType }

procedure TXMLPLANILLA_NOMINAType.AfterConstruction;
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

function TXMLPLANILLA_NOMINAType.Get_Contenido: IXMLContenidoTypeList;
begin
  Result := FContenido;
end;

function TXMLPLANILLA_NOMINAType.Get_Estructura: IXMLEstructuraTypeList;
begin
  Result := FEstructura;
end;

function TXMLPLANILLA_NOMINAType.Get_Contexto: IXMLContextoTypeList;
begin
  Result := FContexto;
end;

function TXMLPLANILLA_NOMINAType.Get_Indices: IXMLIndicesTypeList;
begin
  Result := FIndices;
end;

{ TXMLContenidoType }

procedure TXMLContenidoType.AfterConstruction;
begin
  RegisterChildNode('tipo_documental', TXMLTipo_documentalType);
  RegisterChildNode('titulo_documento', TXMLTitulo_documentoType);
  RegisterChildNode('autor_emisorresponsable', TXMLAutor_emisorresponsableType);
  RegisterChildNode('clasificacion_acceso', TXMLClasificacion_accesoType);
  RegisterChildNode('fecha_creacion', TXMLFecha_creacionType);
  RegisterChildNode('folio_electronico', TXMLFolio_electronicoType);
  RegisterChildNode('tema_asunto', TXMLTema_asuntoType);
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

function TXMLContenidoType.Get_Periodo_nomina: UnicodeString;
begin
  Result := ChildNodes['periodo_nomina'].Text;
end;

procedure TXMLContenidoType.Set_Periodo_nomina(Value: UnicodeString);
begin
  ChildNodes['periodo_nomina'].NodeValue := Value;
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

function TXMLContenidoType.Get_Palabras_clave: UnicodeString;
begin
  Result := ChildNodes['palabras_clave'].Text;
end;

procedure TXMLContenidoType.Set_Palabras_clave(Value: UnicodeString);
begin
  ChildNodes['palabras_clave'].NodeValue := Value;
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

{ TXMLTipo_documentalType }

function TXMLTipo_documentalType.Get_Seriedocumental: UnicodeString;
begin
  Result := ChildNodes['seriedocumental'].Text;
end;

procedure TXMLTipo_documentalType.Set_Seriedocumental(Value: UnicodeString);
begin
  ChildNodes['seriedocumental'].NodeValue := Value;
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

{ TXMLEstructuraType }

procedure TXMLEstructuraType.AfterConstruction;
begin
  RegisterChildNode('descripcion', TXMLDescripcionType);
  RegisterChildNode('formato', TXMLFormatoType);
  RegisterChildNode('estado', TXMLEstadoType);
  RegisterChildNode('proceso_administrativo', TXMLProceso_administrativoType);
  RegisterChildNode('unidad_administrativa_resp', TXMLUnidad_administrativa_respType);
  RegisterChildNode('serie', TXMLSerieType);
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

function TXMLProceso_administrativoType.Get_Procesonivel1: UnicodeString;
begin
  Result := ChildNodes['procesonivel1'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel1(Value: UnicodeString);
begin
  ChildNodes['procesonivel1'].NodeValue := Value;
end;

function TXMLProceso_administrativoType.Get_Procesonivel2: UnicodeString;
begin
  Result := ChildNodes['procesonivel2'].Text;
end;

procedure TXMLProceso_administrativoType.Set_Procesonivel2(Value: UnicodeString);
begin
  ChildNodes['procesonivel2'].NodeValue := Value;
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

{ TXMLContextoType }

procedure TXMLContextoType.AfterConstruction;
begin
  RegisterChildNode('juridico_administrativo', TXMLJuridico_administrativoType);
  RegisterChildNode('tecnologico', TXMLTecnologicoType);
  RegisterChildNode('autenticidad', TXMLAutenticidadType);
  RegisterChildNode('digitalizacion', TXMLDigitalizacionType);
  RegisterChildNode('indices', TXMLIndicesType);
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

function TXMLContextoType.Get_Indices: IXMLIndicesType;
begin
  Result := ChildNodes['indices'] as IXMLIndicesType;
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

function TXMLIndicesType.Get_Fecha_nomina: UnicodeString;
begin
  Result := ChildNodes['fecha_nomina'].Text;
end;

procedure TXMLIndicesType.Set_Fecha_nomina(Value: UnicodeString);
begin
  ChildNodes['fecha_nomina'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Num_id: UnicodeString;
begin
  Result := ChildNodes['num_id'].Text;
end;

procedure TXMLIndicesType.Set_Num_id(Value: UnicodeString);
begin
  ChildNodes['num_id'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Tipo: UnicodeString;
begin
  Result := ChildNodes['tipo'].Text;
end;

procedure TXMLIndicesType.Set_Tipo(Value: UnicodeString);
begin
  ChildNodes['tipo'].NodeValue := Value;
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