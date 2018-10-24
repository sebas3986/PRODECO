
{***********************************************************************************}
{                                                                                   }
{                                 XML Data Binding                                  }
{                                                                                   }
{         Generated on: 16/10/2018 10:47:55 a. m.                                   }
{       Generated from: D:\PRODECO\GeneradorXML\Persistencia\NSeguridadSocial.dtd   }
{   Settings stored in: D:\PRODECO\GeneradorXML\Persistencia\NSeguridadSocial.xdb   }
{                                                                                   }
{***********************************************************************************}

unit NSeguridadSocial;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLSEGURIDAD_SOCIALType = interface;
  IXMLContenidoType = interface;
  IXMLContenidoTypeList = interface;
  IXMLEstructuraType = interface;
  IXMLEstructuraTypeList = interface;
  IXMLContextoType = interface;
  IXMLContextoTypeList = interface;
  IXMLJuridico_administrativoType = interface;
  IXMLTecnologicoType = interface;
  IXMLDigitalizacionType = interface;
  IXMLIndicesType = interface;
  IXMLIndicesTypeList = interface;
  IXMLColaboradorType = interface;

{ IXMLSEGURIDAD_SOCIALType }

  IXMLSEGURIDAD_SOCIALType = interface(IXMLNode)
    ['{1D9E9B96-5D31-4087-AE85-5DEB56582C3C}']
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
    ['{28A0DB96-715D-48E8-B516-C4B00C3975A4}']
    { Property Accessors }
    function Get_Nombreimagen: UnicodeString;
    function Get_Titulo_documento: UnicodeString;
    function Get_Tipo_documental: UnicodeString;
    function Get_Numero_planilla: UnicodeString;
    function Get_Nombre_entidad: UnicodeString;
    function Get_Periodo_cotizacion: UnicodeString;
    function Get_Fecha_recaudo: UnicodeString;
    function Get_Empresa: UnicodeString;
    function Get_Seccional: UnicodeString;
    function Get_Serie_documental: UnicodeString;
    function Get_Subserie_documental: UnicodeString;
    function Get_Unidad_responsable: UnicodeString;
    function Get_Autor: UnicodeString;
    function Get_Clasificacion_acceso: UnicodeString;
    function Get_Fechacreacion: UnicodeString;
    function Get_Folio_inicial: UnicodeString;
    function Get_Folio_final: UnicodeString;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Titulo_documento(Value: UnicodeString);
    procedure Set_Tipo_documental(Value: UnicodeString);
    procedure Set_Numero_planilla(Value: UnicodeString);
    procedure Set_Nombre_entidad(Value: UnicodeString);
    procedure Set_Periodo_cotizacion(Value: UnicodeString);
    procedure Set_Fecha_recaudo(Value: UnicodeString);
    procedure Set_Empresa(Value: UnicodeString);
    procedure Set_Seccional(Value: UnicodeString);
    procedure Set_Serie_documental(Value: UnicodeString);
    procedure Set_Subserie_documental(Value: UnicodeString);
    procedure Set_Unidad_responsable(Value: UnicodeString);
    procedure Set_Autor(Value: UnicodeString);
    procedure Set_Clasificacion_acceso(Value: UnicodeString);
    procedure Set_Fechacreacion(Value: UnicodeString);
    procedure Set_Folio_inicial(Value: UnicodeString);
    procedure Set_Folio_final(Value: UnicodeString);
    { Methods & Properties }
    property Nombreimagen: UnicodeString read Get_Nombreimagen write Set_Nombreimagen;
    property Titulo_documento: UnicodeString read Get_Titulo_documento write Set_Titulo_documento;
    property Tipo_documental: UnicodeString read Get_Tipo_documental write Set_Tipo_documental;
    property Numero_planilla: UnicodeString read Get_Numero_planilla write Set_Numero_planilla;
    property Nombre_entidad: UnicodeString read Get_Nombre_entidad write Set_Nombre_entidad;
    property Periodo_cotizacion: UnicodeString read Get_Periodo_cotizacion write Set_Periodo_cotizacion;
    property Fecha_recaudo: UnicodeString read Get_Fecha_recaudo write Set_Fecha_recaudo;
    property Empresa: UnicodeString read Get_Empresa write Set_Empresa;
    property Seccional: UnicodeString read Get_Seccional write Set_Seccional;
    property Serie_documental: UnicodeString read Get_Serie_documental write Set_Serie_documental;
    property Subserie_documental: UnicodeString read Get_Subserie_documental write Set_Subserie_documental;
    property Unidad_responsable: UnicodeString read Get_Unidad_responsable write Set_Unidad_responsable;
    property Autor: UnicodeString read Get_Autor write Set_Autor;
    property Clasificacion_acceso: UnicodeString read Get_Clasificacion_acceso write Set_Clasificacion_acceso;
    property Fechacreacion: UnicodeString read Get_Fechacreacion write Set_Fechacreacion;
    property Folio_inicial: UnicodeString read Get_Folio_inicial write Set_Folio_inicial;
    property Folio_final: UnicodeString read Get_Folio_final write Set_Folio_final;
  end;

{ IXMLContenidoTypeList }

  IXMLContenidoTypeList = interface(IXMLNodeCollection)
    ['{97F2EB02-1D97-4985-B9BD-1421A6D3282B}']
    { Methods & Properties }
    function Add: IXMLContenidoType;
    function Insert(const Index: Integer): IXMLContenidoType;

    function Get_Item(Index: Integer): IXMLContenidoType;
    property Items[Index: Integer]: IXMLContenidoType read Get_Item; default;
  end;

{ IXMLEstructuraType }

  IXMLEstructuraType = interface(IXMLNode)
    ['{CB6FAFC3-8C05-469A-A122-6A7FFD2FCB9B}']
    { Property Accessors }
    function Get_Descripcion: UnicodeString;
    function Get_Formato: UnicodeString;
    function Get_Macroproceso: UnicodeString;
    function Get_Procesonivel1: UnicodeString;
    function Get_Procesonivel2: UnicodeString;
    function Get_Unidad_administrativa_resp: UnicodeString;
    function Get_Ubicacion: UnicodeString;
    function Get_Serie_documental: UnicodeString;
    function Get_Subserie_documental: UnicodeString;
    procedure Set_Descripcion(Value: UnicodeString);
    procedure Set_Formato(Value: UnicodeString);
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1(Value: UnicodeString);
    procedure Set_Procesonivel2(Value: UnicodeString);
    procedure Set_Unidad_administrativa_resp(Value: UnicodeString);
    procedure Set_Ubicacion(Value: UnicodeString);
    procedure Set_Serie_documental(Value: UnicodeString);
    procedure Set_Subserie_documental(Value: UnicodeString);
    { Methods & Properties }
    property Descripcion: UnicodeString read Get_Descripcion write Set_Descripcion;
    property Formato: UnicodeString read Get_Formato write Set_Formato;
    property Macroproceso: UnicodeString read Get_Macroproceso write Set_Macroproceso;
    property Procesonivel1: UnicodeString read Get_Procesonivel1 write Set_Procesonivel1;
    property Procesonivel2: UnicodeString read Get_Procesonivel2 write Set_Procesonivel2;
    property Unidad_administrativa_resp: UnicodeString read Get_Unidad_administrativa_resp write Set_Unidad_administrativa_resp;
    property Ubicacion: UnicodeString read Get_Ubicacion write Set_Ubicacion;
    property Serie_documental: UnicodeString read Get_Serie_documental write Set_Serie_documental;
    property Subserie_documental: UnicodeString read Get_Subserie_documental write Set_Subserie_documental;
  end;

{ IXMLEstructuraTypeList }

  IXMLEstructuraTypeList = interface(IXMLNodeCollection)
    ['{A0890F3C-08E3-4BD5-B785-1E5931C8BBA5}']
    { Methods & Properties }
    function Add: IXMLEstructuraType;
    function Insert(const Index: Integer): IXMLEstructuraType;

    function Get_Item(Index: Integer): IXMLEstructuraType;
    property Items[Index: Integer]: IXMLEstructuraType read Get_Item; default;
  end;

{ IXMLContextoType }

  IXMLContextoType = interface(IXMLNode)
    ['{77CD141C-E035-4884-B22A-EAF6C50C987E}']
    { Property Accessors }
    function Get_Juridico_administrativo: IXMLJuridico_administrativoType;
    function Get_Documental: UnicodeString;
    function Get_Procedencia: UnicodeString;
    function Get_Procedimental: UnicodeString;
    function Get_Tecnologico: IXMLTecnologicoType;
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
    property Digitalizacion: IXMLDigitalizacionType read Get_Digitalizacion;
  end;

{ IXMLContextoTypeList }

  IXMLContextoTypeList = interface(IXMLNodeCollection)
    ['{070ABC01-B346-4002-869E-7E44AC394C68}']
    { Methods & Properties }
    function Add: IXMLContextoType;
    function Insert(const Index: Integer): IXMLContextoType;

    function Get_Item(Index: Integer): IXMLContextoType;
    property Items[Index: Integer]: IXMLContextoType read Get_Item; default;
  end;

{ IXMLJuridico_administrativoType }

  IXMLJuridico_administrativoType = interface(IXMLNode)
    ['{C973A0F2-E7BD-4B4A-9E28-793A66DBAE40}']
    { Property Accessors }
    function Get_Valores_primarios: UnicodeString;
    procedure Set_Valores_primarios(Value: UnicodeString);
    { Methods & Properties }
    property Valores_primarios: UnicodeString read Get_Valores_primarios write Set_Valores_primarios;
  end;

{ IXMLTecnologicoType }

  IXMLTecnologicoType = interface(IXMLNode)
    ['{AC9C196C-282F-4EB9-906D-9399C654A3B3}']
    { Property Accessors }
    function Get_Tipodefirma: UnicodeString;
    function Get_Dominio_red: UnicodeString;
    function Get_Ip_usuario: UnicodeString;
    function Get_MAC_usuario: UnicodeString;
    procedure Set_Tipodefirma(Value: UnicodeString);
    procedure Set_Dominio_red(Value: UnicodeString);
    procedure Set_Ip_usuario(Value: UnicodeString);
    procedure Set_MAC_usuario(Value: UnicodeString);
    { Methods & Properties }
    property Tipodefirma: UnicodeString read Get_Tipodefirma write Set_Tipodefirma;
    property Dominio_red: UnicodeString read Get_Dominio_red write Set_Dominio_red;
    property Ip_usuario: UnicodeString read Get_Ip_usuario write Set_Ip_usuario;
    property MAC_usuario: UnicodeString read Get_MAC_usuario write Set_MAC_usuario;
  end;

{ IXMLDigitalizacionType }

  IXMLDigitalizacionType = interface(IXMLNode)
    ['{A39B5042-8BD1-4B10-A4D7-AFD76B8B21E6}']
    { Property Accessors }
    function Get_Procesado_por: UnicodeString;
    function Get_Fecha_digitalizacion: UnicodeString;
    function Get_Fecha_indexacion: UnicodeString;
    function Get_Resolucion: UnicodeString;
    function Get_Tamano: UnicodeString;
    function Get_Software_captura: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_Compresion: UnicodeString;
    procedure Set_Procesado_por(Value: UnicodeString);
    procedure Set_Fecha_digitalizacion(Value: UnicodeString);
    procedure Set_Fecha_indexacion(Value: UnicodeString);
    procedure Set_Resolucion(Value: UnicodeString);
    procedure Set_Tamano(Value: UnicodeString);
    procedure Set_Software_captura(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Compresion(Value: UnicodeString);
    { Methods & Properties }
    property Procesado_por: UnicodeString read Get_Procesado_por write Set_Procesado_por;
    property Fecha_digitalizacion: UnicodeString read Get_Fecha_digitalizacion write Set_Fecha_digitalizacion;
    property Fecha_indexacion: UnicodeString read Get_Fecha_indexacion write Set_Fecha_indexacion;
    property Resolucion: UnicodeString read Get_Resolucion write Set_Resolucion;
    property Tamano: UnicodeString read Get_Tamano write Set_Tamano;
    property Software_captura: UnicodeString read Get_Software_captura write Set_Software_captura;
    property Color: UnicodeString read Get_Color write Set_Color;
    property Compresion: UnicodeString read Get_Compresion write Set_Compresion;
  end;

{ IXMLIndicesType }

  IXMLIndicesType = interface(IXMLNode)
    ['{6A947DA0-55FA-46F9-8D7A-4AFF6AED173A}']
    { Property Accessors }
    function Get_Numero_planilla: UnicodeString;
    function Get_Nombre_entidad: UnicodeString;
    function Get_Periodo_cotizacion: UnicodeString;
    function Get_Fecha_recaudo: UnicodeString;
    function Get_Empresa: UnicodeString;
    function Get_Seccional: UnicodeString;
    function Get_Colaborador: IXMLColaboradorType;
    procedure Set_Numero_planilla(Value: UnicodeString);
    procedure Set_Nombre_entidad(Value: UnicodeString);
    procedure Set_Periodo_cotizacion(Value: UnicodeString);
    procedure Set_Fecha_recaudo(Value: UnicodeString);
    procedure Set_Empresa(Value: UnicodeString);
    procedure Set_Seccional(Value: UnicodeString);
    { Methods & Properties }
    property Numero_planilla: UnicodeString read Get_Numero_planilla write Set_Numero_planilla;
    property Nombre_entidad: UnicodeString read Get_Nombre_entidad write Set_Nombre_entidad;
    property Periodo_cotizacion: UnicodeString read Get_Periodo_cotizacion write Set_Periodo_cotizacion;
    property Fecha_recaudo: UnicodeString read Get_Fecha_recaudo write Set_Fecha_recaudo;
    property Empresa: UnicodeString read Get_Empresa write Set_Empresa;
    property Seccional: UnicodeString read Get_Seccional write Set_Seccional;
    property Colaborador: IXMLColaboradorType read Get_Colaborador;
  end;

{ IXMLIndicesTypeList }

  IXMLIndicesTypeList = interface(IXMLNodeCollection)
    ['{FE6F9D6A-D3B8-44C6-BC50-8210776F47CD}']
    { Methods & Properties }
    function Add: IXMLIndicesType;
    function Insert(const Index: Integer): IXMLIndicesType;

    function Get_Item(Index: Integer): IXMLIndicesType;
    property Items[Index: Integer]: IXMLIndicesType read Get_Item; default;
  end;

{ IXMLColaboradorType }

  IXMLColaboradorType = interface(IXMLNode)
    ['{A768A4A1-C80F-474E-9B01-E71BABF40323}']
    { Property Accessors }
    function Get_Num_id: UnicodeString;
    function Get_Tip_id: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Tip_id(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
    { Methods & Properties }
    property Num_id: UnicodeString read Get_Num_id write Set_Num_id;
    property Tip_id: UnicodeString read Get_Tip_id write Set_Tip_id;
    property Prim_nomb: UnicodeString read Get_Prim_nomb write Set_Prim_nomb;
    property Seg_nomb: UnicodeString read Get_Seg_nomb write Set_Seg_nomb;
    property Prim_apll: UnicodeString read Get_Prim_apll write Set_Prim_apll;
    property Seg_apll: UnicodeString read Get_Seg_apll write Set_Seg_apll;
  end;

{ Forward Decls }

  TXMLSEGURIDAD_SOCIALType = class;
  TXMLContenidoType = class;
  TXMLContenidoTypeList = class;
  TXMLEstructuraType = class;
  TXMLEstructuraTypeList = class;
  TXMLContextoType = class;
  TXMLContextoTypeList = class;
  TXMLJuridico_administrativoType = class;
  TXMLTecnologicoType = class;
  TXMLDigitalizacionType = class;
  TXMLIndicesType = class;
  TXMLIndicesTypeList = class;
  TXMLColaboradorType = class;

{ TXMLSEGURIDAD_SOCIALType }

  TXMLSEGURIDAD_SOCIALType = class(TXMLNode, IXMLSEGURIDAD_SOCIALType)
  private
    FContenido: IXMLContenidoTypeList;
    FEstructura: IXMLEstructuraTypeList;
    FContexto: IXMLContextoTypeList;
    FIndices: IXMLIndicesTypeList;
  protected
    { IXMLSEGURIDAD_SOCIALType }
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
    function Get_Titulo_documento: UnicodeString;
    function Get_Tipo_documental: UnicodeString;
    function Get_Numero_planilla: UnicodeString;
    function Get_Nombre_entidad: UnicodeString;
    function Get_Periodo_cotizacion: UnicodeString;
    function Get_Fecha_recaudo: UnicodeString;
    function Get_Empresa: UnicodeString;
    function Get_Seccional: UnicodeString;
    function Get_Serie_documental: UnicodeString;
    function Get_Subserie_documental: UnicodeString;
    function Get_Unidad_responsable: UnicodeString;
    function Get_Autor: UnicodeString;
    function Get_Clasificacion_acceso: UnicodeString;
    function Get_Fechacreacion: UnicodeString;
    function Get_Folio_inicial: UnicodeString;
    function Get_Folio_final: UnicodeString;
    procedure Set_Nombreimagen(Value: UnicodeString);
    procedure Set_Titulo_documento(Value: UnicodeString);
    procedure Set_Tipo_documental(Value: UnicodeString);
    procedure Set_Numero_planilla(Value: UnicodeString);
    procedure Set_Nombre_entidad(Value: UnicodeString);
    procedure Set_Periodo_cotizacion(Value: UnicodeString);
    procedure Set_Fecha_recaudo(Value: UnicodeString);
    procedure Set_Empresa(Value: UnicodeString);
    procedure Set_Seccional(Value: UnicodeString);
    procedure Set_Serie_documental(Value: UnicodeString);
    procedure Set_Subserie_documental(Value: UnicodeString);
    procedure Set_Unidad_responsable(Value: UnicodeString);
    procedure Set_Autor(Value: UnicodeString);
    procedure Set_Clasificacion_acceso(Value: UnicodeString);
    procedure Set_Fechacreacion(Value: UnicodeString);
    procedure Set_Folio_inicial(Value: UnicodeString);
    procedure Set_Folio_final(Value: UnicodeString);
  end;

{ TXMLContenidoTypeList }

  TXMLContenidoTypeList = class(TXMLNodeCollection, IXMLContenidoTypeList)
  protected
    { IXMLContenidoTypeList }
    function Add: IXMLContenidoType;
    function Insert(const Index: Integer): IXMLContenidoType;

    function Get_Item(Index: Integer): IXMLContenidoType;
  end;

{ TXMLEstructuraType }

  TXMLEstructuraType = class(TXMLNode, IXMLEstructuraType)
  protected
    { IXMLEstructuraType }
    function Get_Descripcion: UnicodeString;
    function Get_Formato: UnicodeString;
    function Get_Macroproceso: UnicodeString;
    function Get_Procesonivel1: UnicodeString;
    function Get_Procesonivel2: UnicodeString;
    function Get_Unidad_administrativa_resp: UnicodeString;
    function Get_Ubicacion: UnicodeString;
    function Get_Serie_documental: UnicodeString;
    function Get_Subserie_documental: UnicodeString;
    procedure Set_Descripcion(Value: UnicodeString);
    procedure Set_Formato(Value: UnicodeString);
    procedure Set_Macroproceso(Value: UnicodeString);
    procedure Set_Procesonivel1(Value: UnicodeString);
    procedure Set_Procesonivel2(Value: UnicodeString);
    procedure Set_Unidad_administrativa_resp(Value: UnicodeString);
    procedure Set_Ubicacion(Value: UnicodeString);
    procedure Set_Serie_documental(Value: UnicodeString);
    procedure Set_Subserie_documental(Value: UnicodeString);
  end;

{ TXMLEstructuraTypeList }

  TXMLEstructuraTypeList = class(TXMLNodeCollection, IXMLEstructuraTypeList)
  protected
    { IXMLEstructuraTypeList }
    function Add: IXMLEstructuraType;
    function Insert(const Index: Integer): IXMLEstructuraType;

    function Get_Item(Index: Integer): IXMLEstructuraType;
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
    procedure Set_Valores_primarios(Value: UnicodeString);
  end;

{ TXMLTecnologicoType }

  TXMLTecnologicoType = class(TXMLNode, IXMLTecnologicoType)
  protected
    { IXMLTecnologicoType }
    function Get_Tipodefirma: UnicodeString;
    function Get_Dominio_red: UnicodeString;
    function Get_Ip_usuario: UnicodeString;
    function Get_MAC_usuario: UnicodeString;
    procedure Set_Tipodefirma(Value: UnicodeString);
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
    procedure Set_Procesado_por(Value: UnicodeString);
    procedure Set_Fecha_digitalizacion(Value: UnicodeString);
    procedure Set_Fecha_indexacion(Value: UnicodeString);
    procedure Set_Resolucion(Value: UnicodeString);
    procedure Set_Tamano(Value: UnicodeString);
    procedure Set_Software_captura(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Compresion(Value: UnicodeString);
  end;

{ TXMLIndicesType }

  TXMLIndicesType = class(TXMLNode, IXMLIndicesType)
  protected
    { IXMLIndicesType }
    function Get_Numero_planilla: UnicodeString;
    function Get_Nombre_entidad: UnicodeString;
    function Get_Periodo_cotizacion: UnicodeString;
    function Get_Fecha_recaudo: UnicodeString;
    function Get_Empresa: UnicodeString;
    function Get_Seccional: UnicodeString;
    function Get_Colaborador: IXMLColaboradorType;
    procedure Set_Numero_planilla(Value: UnicodeString);
    procedure Set_Nombre_entidad(Value: UnicodeString);
    procedure Set_Periodo_cotizacion(Value: UnicodeString);
    procedure Set_Fecha_recaudo(Value: UnicodeString);
    procedure Set_Empresa(Value: UnicodeString);
    procedure Set_Seccional(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIndicesTypeList }

  TXMLIndicesTypeList = class(TXMLNodeCollection, IXMLIndicesTypeList)
  protected
    { IXMLIndicesTypeList }
    function Add: IXMLIndicesType;
    function Insert(const Index: Integer): IXMLIndicesType;

    function Get_Item(Index: Integer): IXMLIndicesType;
  end;

{ TXMLColaboradorType }

  TXMLColaboradorType = class(TXMLNode, IXMLColaboradorType)
  protected
    { IXMLColaboradorType }
    function Get_Num_id: UnicodeString;
    function Get_Tip_id: UnicodeString;
    function Get_Prim_nomb: UnicodeString;
    function Get_Seg_nomb: UnicodeString;
    function Get_Prim_apll: UnicodeString;
    function Get_Seg_apll: UnicodeString;
    procedure Set_Num_id(Value: UnicodeString);
    procedure Set_Tip_id(Value: UnicodeString);
    procedure Set_Prim_nomb(Value: UnicodeString);
    procedure Set_Seg_nomb(Value: UnicodeString);
    procedure Set_Prim_apll(Value: UnicodeString);
    procedure Set_Seg_apll(Value: UnicodeString);
  end;

{ Global Functions }

function GetSEGURIDAD_SOCIAL(Doc: IXMLDocument): IXMLSEGURIDAD_SOCIALType;
function LoadSEGURIDAD_SOCIAL(const FileName: string): IXMLSEGURIDAD_SOCIALType;
function NewSEGURIDAD_SOCIAL: IXMLSEGURIDAD_SOCIALType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetSEGURIDAD_SOCIAL(Doc: IXMLDocument): IXMLSEGURIDAD_SOCIALType;
begin
  Result := Doc.GetDocBinding('SEGURIDAD_SOCIAL', TXMLSEGURIDAD_SOCIALType, TargetNamespace) as IXMLSEGURIDAD_SOCIALType;
end;

function LoadSEGURIDAD_SOCIAL(const FileName: string): IXMLSEGURIDAD_SOCIALType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('SEGURIDAD_SOCIAL', TXMLSEGURIDAD_SOCIALType, TargetNamespace) as IXMLSEGURIDAD_SOCIALType;
end;

function NewSEGURIDAD_SOCIAL: IXMLSEGURIDAD_SOCIALType;
begin
  Result := NewXMLDocument.GetDocBinding('SEGURIDAD_SOCIAL', TXMLSEGURIDAD_SOCIALType, TargetNamespace) as IXMLSEGURIDAD_SOCIALType;
end;

{ TXMLSEGURIDAD_SOCIALType }

procedure TXMLSEGURIDAD_SOCIALType.AfterConstruction;
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

function TXMLSEGURIDAD_SOCIALType.Get_Contenido: IXMLContenidoTypeList;
begin
  Result := FContenido;
end;

function TXMLSEGURIDAD_SOCIALType.Get_Estructura: IXMLEstructuraTypeList;
begin
  Result := FEstructura;
end;

function TXMLSEGURIDAD_SOCIALType.Get_Contexto: IXMLContextoTypeList;
begin
  Result := FContexto;
end;

function TXMLSEGURIDAD_SOCIALType.Get_Indices: IXMLIndicesTypeList;
begin
  Result := FIndices;
end;

{ TXMLContenidoType }

function TXMLContenidoType.Get_Nombreimagen: UnicodeString;
begin
  Result := ChildNodes['nombreimagen'].Text;
end;

procedure TXMLContenidoType.Set_Nombreimagen(Value: UnicodeString);
begin
  ChildNodes['nombreimagen'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Titulo_documento: UnicodeString;
begin
  Result := ChildNodes['titulo_documento'].Text;
end;

procedure TXMLContenidoType.Set_Titulo_documento(Value: UnicodeString);
begin
  ChildNodes['titulo_documento'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Tipo_documental: UnicodeString;
begin
  Result := ChildNodes['tipo_documental'].Text;
end;

procedure TXMLContenidoType.Set_Tipo_documental(Value: UnicodeString);
begin
  ChildNodes['tipo_documental'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Numero_planilla: UnicodeString;
begin
  Result := ChildNodes['numero_planilla'].Text;
end;

procedure TXMLContenidoType.Set_Numero_planilla(Value: UnicodeString);
begin
  ChildNodes['numero_planilla'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Nombre_entidad: UnicodeString;
begin
  Result := ChildNodes['nombre_entidad'].Text;
end;

procedure TXMLContenidoType.Set_Nombre_entidad(Value: UnicodeString);
begin
  ChildNodes['nombre_entidad'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Periodo_cotizacion: UnicodeString;
begin
  Result := ChildNodes['periodo_cotizacion'].Text;
end;

procedure TXMLContenidoType.Set_Periodo_cotizacion(Value: UnicodeString);
begin
  ChildNodes['periodo_cotizacion'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Fecha_recaudo: UnicodeString;
begin
  Result := ChildNodes['fecha_recaudo'].Text;
end;

procedure TXMLContenidoType.Set_Fecha_recaudo(Value: UnicodeString);
begin
  ChildNodes['fecha_recaudo'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Empresa: UnicodeString;
begin
  Result := ChildNodes['empresa'].Text;
end;

procedure TXMLContenidoType.Set_Empresa(Value: UnicodeString);
begin
  ChildNodes['empresa'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Seccional: UnicodeString;
begin
  Result := ChildNodes['seccional'].Text;
end;

procedure TXMLContenidoType.Set_Seccional(Value: UnicodeString);
begin
  ChildNodes['seccional'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Serie_documental: UnicodeString;
begin
  Result := ChildNodes['serie_documental'].Text;
end;

procedure TXMLContenidoType.Set_Serie_documental(Value: UnicodeString);
begin
  ChildNodes['serie_documental'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Subserie_documental: UnicodeString;
begin
  Result := ChildNodes['subserie_documental'].Text;
end;

procedure TXMLContenidoType.Set_Subserie_documental(Value: UnicodeString);
begin
  ChildNodes['subserie_documental'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Unidad_responsable: UnicodeString;
begin
  Result := ChildNodes['unidad_responsable'].Text;
end;

procedure TXMLContenidoType.Set_Unidad_responsable(Value: UnicodeString);
begin
  ChildNodes['unidad_responsable'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Autor: UnicodeString;
begin
  Result := ChildNodes['autor'].Text;
end;

procedure TXMLContenidoType.Set_Autor(Value: UnicodeString);
begin
  ChildNodes['autor'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Clasificacion_acceso: UnicodeString;
begin
  Result := ChildNodes['clasificacion_acceso'].Text;
end;

procedure TXMLContenidoType.Set_Clasificacion_acceso(Value: UnicodeString);
begin
  ChildNodes['clasificacion_acceso'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Fechacreacion: UnicodeString;
begin
  Result := ChildNodes['fechacreacion'].Text;
end;

procedure TXMLContenidoType.Set_Fechacreacion(Value: UnicodeString);
begin
  ChildNodes['fechacreacion'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Folio_inicial: UnicodeString;
begin
  Result := ChildNodes['folio_inicial'].Text;
end;

procedure TXMLContenidoType.Set_Folio_inicial(Value: UnicodeString);
begin
  ChildNodes['folio_inicial'].NodeValue := Value;
end;

function TXMLContenidoType.Get_Folio_final: UnicodeString;
begin
  Result := ChildNodes['folio_final'].Text;
end;

procedure TXMLContenidoType.Set_Folio_final(Value: UnicodeString);
begin
  ChildNodes['folio_final'].NodeValue := Value;
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

{ TXMLEstructuraType }

function TXMLEstructuraType.Get_Descripcion: UnicodeString;
begin
  Result := ChildNodes['descripcion'].Text;
end;

procedure TXMLEstructuraType.Set_Descripcion(Value: UnicodeString);
begin
  ChildNodes['descripcion'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Formato: UnicodeString;
begin
  Result := ChildNodes['formato'].Text;
end;

procedure TXMLEstructuraType.Set_Formato(Value: UnicodeString);
begin
  ChildNodes['formato'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Macroproceso: UnicodeString;
begin
  Result := ChildNodes['macroproceso'].Text;
end;

procedure TXMLEstructuraType.Set_Macroproceso(Value: UnicodeString);
begin
  ChildNodes['macroproceso'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Procesonivel1: UnicodeString;
begin
  Result := ChildNodes['procesonivel1'].Text;
end;

procedure TXMLEstructuraType.Set_Procesonivel1(Value: UnicodeString);
begin
  ChildNodes['procesonivel1'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Procesonivel2: UnicodeString;
begin
  Result := ChildNodes['procesonivel2'].Text;
end;

procedure TXMLEstructuraType.Set_Procesonivel2(Value: UnicodeString);
begin
  ChildNodes['procesonivel2'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Unidad_administrativa_resp: UnicodeString;
begin
  Result := ChildNodes['unidad_administrativa_resp'].Text;
end;

procedure TXMLEstructuraType.Set_Unidad_administrativa_resp(Value: UnicodeString);
begin
  ChildNodes['unidad_administrativa_resp'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Ubicacion: UnicodeString;
begin
  Result := ChildNodes['ubicacion'].Text;
end;

procedure TXMLEstructuraType.Set_Ubicacion(Value: UnicodeString);
begin
  ChildNodes['ubicacion'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Serie_documental: UnicodeString;
begin
  Result := ChildNodes['serie_documental'].Text;
end;

procedure TXMLEstructuraType.Set_Serie_documental(Value: UnicodeString);
begin
  ChildNodes['serie_documental'].NodeValue := Value;
end;

function TXMLEstructuraType.Get_Subserie_documental: UnicodeString;
begin
  Result := ChildNodes['subserie_documental'].Text;
end;

procedure TXMLEstructuraType.Set_Subserie_documental(Value: UnicodeString);
begin
  ChildNodes['subserie_documental'].NodeValue := Value;
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

{ TXMLContextoType }

procedure TXMLContextoType.AfterConstruction;
begin
  RegisterChildNode('juridico_administrativo', TXMLJuridico_administrativoType);
  RegisterChildNode('tecnologico', TXMLTecnologicoType);
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

{ TXMLTecnologicoType }

function TXMLTecnologicoType.Get_Tipodefirma: UnicodeString;
begin
  Result := ChildNodes['tipodefirma'].Text;
end;

procedure TXMLTecnologicoType.Set_Tipodefirma(Value: UnicodeString);
begin
  ChildNodes['tipodefirma'].NodeValue := Value;
end;

function TXMLTecnologicoType.Get_Dominio_red: UnicodeString;
begin
  Result := ChildNodes['dominio_red'].Text;
end;

procedure TXMLTecnologicoType.Set_Dominio_red(Value: UnicodeString);
begin
  ChildNodes['dominio_red'].NodeValue := Value;
end;

function TXMLTecnologicoType.Get_Ip_usuario: UnicodeString;
begin
  Result := ChildNodes['ip_usuario'].Text;
end;

procedure TXMLTecnologicoType.Set_Ip_usuario(Value: UnicodeString);
begin
  ChildNodes['ip_usuario'].NodeValue := Value;
end;

function TXMLTecnologicoType.Get_MAC_usuario: UnicodeString;
begin
  Result := ChildNodes['MAC_usuario'].Text;
end;

procedure TXMLTecnologicoType.Set_MAC_usuario(Value: UnicodeString);
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

{ TXMLIndicesType }

procedure TXMLIndicesType.AfterConstruction;
begin
  RegisterChildNode('colaborador', TXMLColaboradorType);
  inherited;
end;

function TXMLIndicesType.Get_Numero_planilla: UnicodeString;
begin
  Result := ChildNodes['numero_planilla'].Text;
end;

procedure TXMLIndicesType.Set_Numero_planilla(Value: UnicodeString);
begin
  ChildNodes['numero_planilla'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Nombre_entidad: UnicodeString;
begin
  Result := ChildNodes['nombre_entidad'].Text;
end;

procedure TXMLIndicesType.Set_Nombre_entidad(Value: UnicodeString);
begin
  ChildNodes['nombre_entidad'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Periodo_cotizacion: UnicodeString;
begin
  Result := ChildNodes['periodo_cotizacion'].Text;
end;

procedure TXMLIndicesType.Set_Periodo_cotizacion(Value: UnicodeString);
begin
  ChildNodes['periodo_cotizacion'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Fecha_recaudo: UnicodeString;
begin
  Result := ChildNodes['fecha_recaudo'].Text;
end;

procedure TXMLIndicesType.Set_Fecha_recaudo(Value: UnicodeString);
begin
  ChildNodes['fecha_recaudo'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Empresa: UnicodeString;
begin
  Result := ChildNodes['empresa'].Text;
end;

procedure TXMLIndicesType.Set_Empresa(Value: UnicodeString);
begin
  ChildNodes['empresa'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Seccional: UnicodeString;
begin
  Result := ChildNodes['seccional'].Text;
end;

procedure TXMLIndicesType.Set_Seccional(Value: UnicodeString);
begin
  ChildNodes['seccional'].NodeValue := Value;
end;

function TXMLIndicesType.Get_Colaborador: IXMLColaboradorType;
begin
  Result := ChildNodes['colaborador'] as IXMLColaboradorType;
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

{ TXMLColaboradorType }

function TXMLColaboradorType.Get_Num_id: UnicodeString;
begin
  Result := ChildNodes['num_id'].Text;
end;

procedure TXMLColaboradorType.Set_Num_id(Value: UnicodeString);
begin
  ChildNodes['num_id'].NodeValue := Value;
end;

function TXMLColaboradorType.Get_Tip_id: UnicodeString;
begin
  Result := ChildNodes['tip_id'].Text;
end;

procedure TXMLColaboradorType.Set_Tip_id(Value: UnicodeString);
begin
  ChildNodes['tip_id'].NodeValue := Value;
end;

function TXMLColaboradorType.Get_Prim_nomb: UnicodeString;
begin
  Result := ChildNodes['prim_nomb'].Text;
end;

procedure TXMLColaboradorType.Set_Prim_nomb(Value: UnicodeString);
begin
  ChildNodes['prim_nomb'].NodeValue := Value;
end;

function TXMLColaboradorType.Get_Seg_nomb: UnicodeString;
begin
  Result := ChildNodes['seg_nomb'].Text;
end;

procedure TXMLColaboradorType.Set_Seg_nomb(Value: UnicodeString);
begin
  ChildNodes['seg_nomb'].NodeValue := Value;
end;

function TXMLColaboradorType.Get_Prim_apll: UnicodeString;
begin
  Result := ChildNodes['prim_apll'].Text;
end;

procedure TXMLColaboradorType.Set_Prim_apll(Value: UnicodeString);
begin
  ChildNodes['prim_apll'].NodeValue := Value;
end;

function TXMLColaboradorType.Get_Seg_apll: UnicodeString;
begin
  Result := ChildNodes['seg_apll'].Text;
end;

procedure TXMLColaboradorType.Set_Seg_apll(Value: UnicodeString);
begin
  ChildNodes['seg_apll'].NodeValue := Value;
end;

end.