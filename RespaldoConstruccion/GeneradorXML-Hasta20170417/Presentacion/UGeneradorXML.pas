unit UGeneradorXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, DAOGeneradorXML,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, HistoriaLaboral, PlanillasNomina, NSeguridadSocial,
  Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc,  IdIPWatch,
  UFTP, UDMConexion, UDMAplicacion;

type
  Tfrm_GeneradorXML = class(TForm)
    pnl1: TPanel;
    stbInformacion: TStatusBar;
    grp1: TGroupBox;
    pbGeneradorXML: TProgressBar;
    pnl2: TPanel;
    grp2: TGroupBox;
    grp3: TGroupBox;
    spl1: TSplitter;
    spl2: TSplitter;
    grpCarpetas: TGroupBox;
    MeCarpetas: TMemo;
    grpFoliosPendientes: TGroupBox;
    MePendientes: TMemo;
    btnReporte: TButton;
    btnIniciar: TButton;
    lblPorcentaje: TLabel;
    xmlHistoriaLaboral: TXMLDocument;
    xmlPlanillasNomina: TXMLDocument;
    xmlSeguridadSocial: TXMLDocument;
    tmrProgress: TTimer;
    grpBusqueda: TGroupBox;
    cbbCriterio: TComboBox;
    lblCriterio: TLabel;
    edCodigo: TEdit;
    lblCodigo: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure tmrProgressTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTP : TFtp;
  public
    { Public declarations }
    procedure ConfigurarAmbiente;
    procedure ConfigurarFTP;
    procedure HistoriaLaboral;
    procedure PlanillaNomina;
    procedure SeguridadSocial;
    procedure BorrarArchivos(Ruta: string);
    function QuitarTildes (NombreCampo : string):  string;
    Procedure VerificarVersion(p_NombModu: string;p_VersModu: string);
  end;

var
  DireccIP          : String;
  frm_GeneradorXML  : Tfrm_GeneradorXML;
  i                 : integer;
  NombModu          : string;
  VersModu          : string;

implementation

{$R *.dfm}

{ Tfrm_GeneradorXML }
function Tfrm_GeneradorXML.QuitarTildes(NombreCampo: string): string;
begin
  NombreCampo := StringReplace(NombreCampo, '�', 'A', [rfReplaceAll, rfIgnoreCase]);
  NombreCampo := StringReplace(NombreCampo, '�', 'E', [rfReplaceAll, rfIgnoreCase]);
  NombreCampo := StringReplace(NombreCampo, '�', 'I', [rfReplaceAll, rfIgnoreCase]);
  NombreCampo := StringReplace(NombreCampo, '�', 'O', [rfReplaceAll, rfIgnoreCase]);
  NombreCampo := StringReplace(NombreCampo, '�', 'U', [rfReplaceAll, rfIgnoreCase]);
  Result := NombreCampo;
end;

procedure Tfrm_GeneradorXML.BorrarArchivos(Ruta: string);
var
  SR : TSearchRec;
begin
  if FindFirst(Ruta + '*.xml', faArchive+faHidden+faReadOnly, SR)= 0 then
   repeat
     DeleteFile(Ruta+'\'+SR.Name);
   until FindNext(SR) <> 0;
end;

procedure Tfrm_GeneradorXML.ConfigurarFTP;
begin
  try
    FTP := TFTP.Create;
    FTP.ConfigurarFTP;
    if not FTP.TestConexion then
      begin
        Application.MessageBox('Error, no se estableci� conexi�n con el FTP. Favor Verificar. ', 'Publicaci�n de Im�genes',MB_OK OR MB_ICONERROR);
        Application.Terminate;
    end;
  except
     on e:exception do
       begin
         Application.MessageBox(PChar(e.Message), 'Control Calidad de Im�genes',MB_OK OR MB_ICONERROR);
         Application.Terminate;
     end;
  end;
end;

procedure Tfrm_GeneradorXML.FormShow(Sender: TObject);
begin
  ConfigurarAmbiente;
  ConfigurarFtp;
end;


procedure Tfrm_GeneradorXML.ConfigurarAmbiente;
begin
  NombModu:= 'MODULOGENERADORXML';
  VersModu:= '20161006.M01';

  {SE VERIFICA LA LA VERSION DEL M�DULO)}
  VerificarVersion(NombModu,VersModu);
  frm_GeneradorXML.Caption := 'Generaci�n de XML - [Versi�n ' + VersModu + ' ]';
  with TIdIPWatch.Create() do
  begin
    DireccIP  := LocalIP;
    Free;
  end;
  stbInformacion.Panels[0].Text :='Usuario: ' + ParamStr(1);
  stbInformacion.Panels[1].Text :='IP: ' + DireccIP;
  stbInformacion.Panels[2].Text :='Ambiente: ' + DMConexion.Ambiente;
end;

procedure Tfrm_GeneradorXML.btnIniciarClick(Sender: TObject);
begin
  i := 1;
  DMGeneradorXML.CarpetasCaptura(edCodigo.Text, cbbCriterio.ItemIndex);  //Verifica las carpetas que est�n en estado de generaci�n de XML para mostrarlas en el panel de carpetas
  repeat
    MeCarpetas.Lines.Add(DMGeneradorXML.cdsCarpetasCaptura.FieldByName('CodigoCarpeta').AsString);
    DMGeneradorXML.cdsCarpetasCaptura.Next;
  until DMGeneradorXML.cdsCarpetasCaptura.Eof;
  //DMGeneradorXML.AletasFolio(DMGeneradorXML.cdsBuscarCodigo.FieldByName('idCarpeta').AsInteger);    //Busca las aletas que tiene la carpeta
  if NOT DMGeneradorXML.cdsCarpetasCaptura.IsEmpty then
    begin
      DMGeneradorXML.FoliosXML (DMGeneradorXML.cdsCarpetasCaptura.FieldByName('idTipoSerieDocumental').AsInteger, cbbCriterio.ItemIndex);  //Muestra los folios que est�n pendientes para XML en el panel pendientes
      if NOT DMGeneradorXML.cdsFoliosXML.IsEmpty then
        begin
          pbGeneradorXML.Min := i;

          repeat
            MePendientes.Lines.Add(DMGeneradorXML.cdsFoliosXML.FieldByName('CodigoFolio').AsString);
            DMGeneradorXML.cdsFoliosXML.Next;
          until DMGeneradorXML.cdsFoliosXML.Eof;;

          DMGeneradorXML.cdsFoliosXML.First;   //Recorre los folios pendientes para generar el XML
          repeat
            Inc(i);
            case DMGeneradorXML.cdsCarpetasCaptura.FieldByName('idTipoSerieDocumental').AsInteger of
                                1 : HistoriaLaboral;
                                2 : PlanillaNomina;
                                3 : SeguridadSocial;
            end;
            FTP.SubirArchivo(ExtractFilePath(Application.ExeName), Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4)+'.xml',
                             DMGeneradorXML.cdsFoliosXML.FieldByName('RutaFTP').AsString, Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4)+'.xml');
            DMGeneradorXML.cdsFoliosXML.Next;
          until DMGeneradorXML.cdsFoliosXML.Eof;
          ShowMessage('Operaci�n terminada con �xito ...');
          case cbbCriterio.ItemIndex of
                      0 : begin
                             DMGeneradorXML.cdsCarpetasCaptura.First;
                             repeat
                               DMGeneradorXML.CambiarEstado(DMGeneradorXML.cdsCarpetasCaptura.FieldByName('idCarpeta').AsInteger);
                               DMGeneradorXML.cdsCarpetasCaptura.Next;
                             until DMGeneradorXML.cdsCarpetasCaptura.Eof;
                          end;
                      1 : DMGeneradorXML.CambiarEstado(DMGeneradorXML.cdsCarpetasCaptura.FieldByName('idCarpeta').AsInteger);
          end;
          edCodigo.Text := '';
          cbbCriterio.Clear;
          BorrarArchivos(ExtractFilePath(Application.ExeName));
      end else
         ShowMessage('Los folios se encuentran marcados para Firma y Estampa ....');
  end else
     ShowMessage('No se encuentran carpetas disponibles para este  m�dulo ...');
end;

procedure Tfrm_GeneradorXML.HistoriaLaboral;
var
 HistoriaLaboral : IXMLHISTORIA_LABORALType;
 ValorCivil : string;
 Aletas     : integer;
begin
  xmlHistoriaLaboral.Active := True;
  HistoriaLaboral := GetHISTORIA_LABORAL(xmlHistoriaLaboral);
  DMGeneradorXML.DatosPersona(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger);
  DMGeneradorXML.PlanillaIndices(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger, 1);
  with HistoriaLaboral.Contenido.Add do
     begin
       NombreImagen := Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4);
       DMGeneradorXML.cdsPlanillaIndices.First;

       TipoIdentIficacion := QuitarTildes(DMGeneradorXML.cdsPlanillaIndices.FieldByName('DescripcionTipoIdentificacion').AsString);
       Identificacion := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
       if DMGeneradorXML.cdsFoliosXML.FieldByName('Capturable').AsBoolean then
         folio_es_tipoidentificacion := 'SI'
       else
         folio_es_tipoidentificacion := 'NO';
       repeat
         DMGeneradorXML.cdsPlanillaIndices.Next;
         if NOT DMGeneradorXML.cdsPlanillaIndices.Eof then
           begin
             Identificacion_Adicional.AddChild('TipoIdentificacionAdicional').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('DescripcionTipoIdentificacion').AsString;
             Identificacion_Adicional.AddChild('IdentificAcionadicional').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         end;
       until DMGeneradorXML.cdsPlanillaIndices.Eof;
       Tipo_Documental.Tipodocumental := 'HISTORIA LABORAL';
       Titulo_Documento.Titulodocumento := 'HISTORIA LABORAL';
       ValorCivil := BoolToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('ObraCivil').AsBoolean);
       if DMGeneradorXML.cdsFoliosXML.FieldByName('ObraCivil').AsBoolean then
         Titulo_Documento.ContratoCivil := 'SI'
       else
         Titulo_Documento.ContratoCivil := 'NO';
       Aletas := 0;
       DMGeneradorXML.AletasFolio(DMGeneradorXML.cdsFoliosXML.FieldByName('idCarpeta').AsInteger);
       DMGeneradorXML.cdsAletasFolio.First;
       repeat
         Inc(Aletas);
         case Aletas of
                 1 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_1').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 2 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_2').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 3 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_3').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 4 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_4').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 5 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_5').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 6 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Titulo_Documento.AddChild('Seccion_6').Text :=  DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
         end;
         DMGeneradorXML.cdsAletasFolio.Next;
       until DMGeneradorXML.cdsAletasFolio.Eof;
       Autor_Emisorresponsable.Fondo := 'UNIVERSIDAD DE LOS ANDES';
       Autor_Emisorresponsable.Unidad_Responsable := 'DIRECCION DE GESTION HUMANA Y DESARROLLO ORGANIZACIONAL';
       Clasificacion_Acceso.Nivel_Acceso := 'INTERNO';
       Fecha_Creacion.FechaCreacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Folio_Electronico.Folios_Totales := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
       Folio_Electronico.Folio_Actual := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('SecuenciaFolio').AsInteger);
       Tema_Asunto.Tema := 'TALENTO HUMANO';
       DMGeneradorXML.cdsPlanillaIndices.First;
       repeat
         Palabras_Clave.AddChild('Num_id').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         Palabras_Clave.AddChild('Nombres_Apellidos').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerNombre').AsString+','+DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoNombre').AsString+','
                                                              +DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerApellido').AsString+','+DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoApellido').AsString;
         DMGeneradorXML.cdsPlanillaIndices.Next;
       until DMGeneradorXML.cdsPlanillaIndices.Eof;
       Aletas := 0;
       DMGeneradorXML.cdsAletasFolio.First;
       repeat
         Inc(Aletas);
         case Aletas of
                 1 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_1').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 2 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_2').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 3 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_3').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 4 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_4').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 5 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_5').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
                 6 : begin
                       if NOT DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').IsNull then
                         Palabras_Clave.Secciones.AddChild('Seccion_6').Text := DMGeneradorXML.cdsAletasFolio.FieldByName('DescripcionSubSerieDocumental').AsString;
                     end;
         end;
         DMGeneradorXML.cdsAletasFolio.Next;
       until DMGeneradorXML.cdsAletasFolio.Eof;
  end;

  with HistoriaLaboral.Estructura.Add do
     begin
       Descripcion.Descripcion_ := 'EXPEDIENTE QUE CONTIENE TODOS LOS DOCUMENTOS DE CARACTER ADMINISTRATIVO RELACIONADOS CON EL VINCULO LABORAL QUE SE ESTABLECE ENTRE EL COLABORADOR Y LA UNIVERSIDAD';
       Formato.Formato_ := 'PDF/A-3B';
       Proceso_Administrativo.Macroproceso := 'TALENTO HUMANO';
       Proceso_Administrativo.Procesonivel1 := 'ADMINISTRACION Y BIENESTAR DEL TALENTO HUMANO';
       Proceso_Administrativo.Procesonivel2 := 'ADMINISTRACION DE SUELDOS Y PRESTACIONES ADMINISTRACION DE PERSONAL';
       Unidad_Administrativa_Resp.UnidadAdministrativaResp := 'DIRECCION DE GESTION HUMANA Y DESARROLLO ORGANIZACIONAL';
       Perfil_autorizado := 'NULL';
       Serie.Serie_ := 'GESTION DE TALENTO HUMANO';
       Serie.Subserie := 'HISTORIA LABORAL';
       if DMGeneradorXML.cdsFoliosXML.FieldByName('ObraCivil').AsBoolean then
         begin
           Serie.Serie_1 := 'GESTION JURIDICA';
           Serie.Serie_2 := 'CONTRATO CIVIL';
       end;
  end;

  with HistoriaLaboral.Contexto.Add do
     begin
       Juridico_Administrativo.Valores_Primarios := 'LEGALES,ADMINISTRATIVOS,FINANCIEROS';
       Juridico_Administrativo.Valores_Secundarios := 'HISTORICO,CULTURAL';
       Documental := 'LOS DOCUMENTOS CONTENIDOS EN ESTE EXPEDIENTE (HISTORIA LABORAL) REFLEJAN LA TRAYECTORIA PROFESIONAL DE LA PERSONA CONTRATADA,SE ENCUENTRAN EN SOPORTE FISICO Y ELECTRONICO PARA SU CONSERVACION';
       Procedencia := 'DIRECCION DE GESTION HUMANA Y DESARROLLO ORGANIZACIONAL';
       Procedimental := 'ESTE DOCUMENTO ES ORIGINAL,CUENTA CON FIRMA DIGITAL Y UN ESTAMPADO CRONOLOGICO PARA MAYOR SEGURIDAD Y CONFIABILIDAD';
       Tecnologico.Tecnologico_1 := 'NULL';
       Tecnologico.Tipodefirma := 'PADESLTV';
       Autenticidad.Dominio_red := 'THOMASGREG.COM';
       Autenticidad.Ip_usuario := DMGeneradorXML.cdsFoliosXML.FieldByName('ipPublicacion').AsString;
       Autenticidad.MAC_usuario := '08-2E-5F-24-00-D6';
       Digitalizacion.Procesado_por := 'THOMAS MTI';
       Digitalizacion.Fecha_digitalizacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaImagen').AsDateTime);
       if DMGeneradorXML.FolioIndexacion(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger) then
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFolioIndexacion.FieldByName('FechaFolio').AsDateTime)
       else
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Digitalizacion.Resolucion := '300 DPI';
       Digitalizacion.Tamano := '2550*2300 PIXELS';
       Digitalizacion.Software_captura := 'THOMAS MTI';
       Digitalizacion.Color := 'RGB';
       Digitalizacion.Compresion := 'CCIT GRUPO 4';
       Digitalizacion.Folio_inicial := '1';
       Digitalizacion.Folio_final := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
  end;
  DMGeneradorXML.cdsPlanillaIndices.First;
  repeat
    with HistoriaLaboral.Indices.Add do
       begin
         Num_id := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         Prim_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerNombre').AsString;
         Seg_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoNombre').AsString;
         Prim_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerApellido').AsString;
         Seg_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoApellido').AsString;
    end;
    DMGeneradorXML.cdsPlanillaIndices.Next;
  until DMGeneradorXML.cdsPlanillaIndices.Eof;
  xmlHistoriaLaboral.SaveToFile(ExtractFilePath(Application.ExeName) + Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4)+'.xml');
  xmlHistoriaLaboral.XML.Clear;
end;

procedure Tfrm_GeneradorXML.PlanillaNomina;
var
  PlanillaNomina : IXMLPLANILLA_NOMINAType;
begin
  xmlPlanillasNomina.Active := True;
  PlanillaNomina := GetPLANILLA_NOMINA(xmlPlanillasNomina);
  with PlanillaNomina.Contenido.Add do
     begin
       Nombreimagen := Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4);
       Periodo_Nomina := DateToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaNomina').AsDateTime);
       Tipo_Documental.Seriedocumental := 'Listados de nomina';
       Titulo_Documento.Titulodocumento := 'Listados de nomina';
       Autor_Emisorresponsable.Fondo := 'Universidad de los Andes';
       Autor_Emisorresponsable.Unidad_responsable := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Clasificacion_Acceso.Nivel_acceso := 'I';
       Fecha_Creacion.Fechacreacion := DateToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Folio_Electronico.Folios_totales := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
       Folio_Electronico.Folio_actual := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('SecuenciaFolio').AsInteger);
       Tema_Asunto.Tema := 'Talento humano';
       Palabras_Clave := '' // Por definier
  end;
  with PlanillaNomina.Estructura.Add do
     begin
       Descripcion.Descripcion_ := 'Documento que garantiza los pagos efectuados  por la Universidad al empleado mes a mes durante su periodo de permanecio en la entidad';
       Formato.Formato_ := 'PDF/A-3B';
       Estado.Estado_elaboracion := 'INACTIVA'; // ------------------ verificar que es este dato
       Proceso_Administrativo.Macroproceso := 'Talento humano';
       Proceso_Administrativo.Procesonivel1 := 'Administracion y bienestar del talento humano';
       Proceso_Administrativo.Procesonivel2 := 'Administracion de sueldos y prestaciones';
       Unidad_Administrativa_Resp.UnidadAdministrativaResp := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Perfil_Autorizado := 'null';
       Ubicacion := 'Archivo central';
       Serie.Serie_ := 'Gestion de talento humano';
       Serie.Subserie := 'nomina';
  end;
  with PlanillaNomina.Contexto.Add do
     begin
       Juridico_Administrativo.Valores_primarios := 'LEGALES,ADMINISTRATIVOS,FINANCIEROS';
       Juridico_Administrativo.Valores_secundarios := 'HISTORICO,CULTURAL';
       Documental := 'Los documentos contenidos en este expediente  evidencian los pagos  a los empleados de la Universidad se encuentran en soporte fisico y electronico estan  hasta el ano 30/01/1977 - 31/12/2004, en adelante solo estaran en formato electronico';
       Procedencia := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Procedimental := 'Este documento es original, cuenta con firma digital y un estampado cronologico para mayor seguridad y confiabilidad.';
       Tecnologico.Tecnologico_1 := 'null';
       Tecnologico.Tipodefirma := 'PADESLTV';
       Autenticidad.Dominio_red := '';
       Autenticidad.Ip_usuario := DMGeneradorXML.cdsFoliosXML.FieldByName('ipPublicacion').AsString;
       Autenticidad.MAC_usuario := '08-2E-5F-24-00-D6';
       Digitalizacion.Procesado_por := 'THOMAS MTI';
       Digitalizacion.Fecha_digitalizacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaImagen').AsDateTime);
       if DMGeneradorXML.FolioIndexacion(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger) then
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFolioIndexacion.FieldByName('FechaFolio').AsDateTime)
       else
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Digitalizacion.Resolucion := '300 DPI';
       Digitalizacion.Tamano := '2550*2300 pixeles';//IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('TamanoBytes').AsInteger);
       Digitalizacion.Software_captura := 'THOMAS MTI';
       Digitalizacion.Color := 'RGB';
       Digitalizacion.Compresion := 'CCIT GRUPO 4';
       Digitalizacion.Folio_inicial :=  '1';
       Digitalizacion.Folio_final := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
  end;
  DMGeneradorXML.PlanillaIndices(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger, 2); //Esta secci�n se ingresa los datos de captura de las personas
  repeat
    with PlanillaNomina.Indices.Add do
       begin
         Fecha_nomina := DateToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaNomina').AsDateTime);
         Num_id := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         tipo := DMGeneradorXML.cdsPlanillaIndices.FieldByName('DescripcionTipoIdentificacion').AsString;
         Prim_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerNombre').AsString;
         Seg_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoNombre').AsString;
         Prim_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerApellido').AsString;
         Seg_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoApellido').AsString;
    end;
    DMGeneradorXML.cdsPlanillaIndices.Next;
  until DMGeneradorXML.cdsPlanillaIndices.Eof;
  xmlPlanillasNomina.SaveToFile(ExtractFilePath(Application.ExeName) + Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4)+'.xml');
  xmlPlanillasNomina.XML.Clear;
end;

procedure Tfrm_GeneradorXML.SeguridadSocial;
var
  SeguridadSocial    : IXMLSEGURIDAD_SOCIALType;
  PalabrasClave      : IXMLNode;
  ValuePalabrasClave : IXMLNode;
begin
  xmlSeguridadSocial.Active := True;
  SeguridadSocial := GetSEGURIDAD_SOCIAL(xmlSeguridadSocial);
  with SeguridadSocial.Contenido.Add do
     begin
       Nombreimagen := Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4);;
       Entidad := DMGeneradorXML.cdsFoliosXML.FieldByName('DescripcionFondo').AsString;
       Periodo_Cotizacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('PeriodoCotizacion').AsDateTime);
       Tipo_Documental := DMGeneradorXML.cdsFoliosXML.FieldByName('DescripcionSerieDocumental').AsString;
       Titulo_Documento.Titulodocumento := 'Aportes a Seguridad Social';
       Autor_EmisorResponsable.Fondo := 'Universidad de los Andes';
       Autor_EmisorResponsable.Unidad_responsable := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Clasificacion_Acceso.Nivel_acceso := 'I';
       Fecha_Creacion.Fechacreacion := DateToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Folio_Electronico.Folios_totales := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
       Folio_Electronico.Folio_actual := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('SecuenciaFolio').AsInteger);
       Tema_Asunto.Tema := 'Talento humano';
       DMGeneradorXML.PlanillaIndices(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger, 3);//Esta secci�n se ingresa los datos de captura de las personas
       repeat
         Palabras_Clave.AddChild('Prim_apll').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerApellido').AsString;
         Palabras_Clave.AddChild('Seg_apll').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoApellido').AsString;
         Palabras_Clave.AddChild('Prim_nomb').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerNombre').AsString;
         Palabras_Clave.AddChild('Seg_nomb').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoNombre').AsString;
         Palabras_Clave.AddChild('Num_id').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         Palabras_Clave.AddChild('Entidad').Text := DMGeneradorXML.cdsPlanillaIndices.FieldByName('DescripcionFondo').AsString;
         DMGeneradorXML.cdsPlanillaIndices.Next;
       until DMGeneradorXML.cdsPlanillaIndices.Eof;
  end;
  with SeguridadSocial.Estructura.Add do
     begin
       Descripcion.Descripcion_ := 'Documentos que garantizan los pagos efectuados mes a mes a los colaboradores por la Universidad.';
       Formato.Formato_ := 'PDF/A-3B';
       Estado.Estado_elaboracion := 'INACTIVO';
       Proceso_Administrativo.Macroproceso := 'Talento humano';
       Proceso_Administrativo.Procesonivel1 := 'Administracion y bienestar del talento humano';
       Proceso_Administrativo.Procesonivel2 := 'Seguridad Social';
       Unidad_Administrativa_Resp.Unidadadministrativaresp := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Perfil_Autorizado := 'null';
       Ubicacion := 'Archivo de Gestion';
       Serie.Serie_ := 'Gestion de talento humano';
       Serie.Subserie := 'Seguridad Social';
  end;
  with SeguridadSocial.Contexto.Add do
     begin
       Juridico_Administrativo.Valores_primarios := 'LEGALES,ADMINISTRATIVOS,FINANCIEROS';
       Juridico_Administrativo.Valores_secundarios := 'HISTORICO,CULTURAL';
       Documental := 'Los documentos contenidos en este expediente evidencian los aportes a las diferentes entidades promotoras de salud se encuentran en soporte fisico y electronico estan hasta el ano 2006 en adelante solo estaran en formato electronico';
       Procedencia := 'Direccion de Gestion Humana y Desarrollo Organizacional';
       Procedimental := 'Este documento es original, cuenta con firma digital y un estampado cronologico para mayor seguridad y confiabilidad.';
       Tecnologico.Tecnologico_1 := 'null';
       Tecnologico.Tipodefirma := 'PADESLTV V.4';
       Autenticidad.Dominio_red := 'thomasgreg.com';
       Autenticidad.Ip_usuario := DMGeneradorXML.cdsFoliosXML.FieldByName('ipPublicacion').AsString;
       Autenticidad.MAC_usuario := '08-2E-5F-24-00-D6';
       Digitalizacion.Procesado_por := 'THOMAS MTI';
       Digitalizacion.Fecha_digitalizacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaImagen').AsDateTime);
       if DMGeneradorXML.FolioIndexacion(DMGeneradorXML.cdsFoliosXML.FieldByName('idFolio').AsInteger) then
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFolioIndexacion.FieldByName('FechaFolio').AsDateTime)
       else
         Digitalizacion.Fecha_indexacion := DateTimeToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('FechaFolio').AsDateTime);
       Digitalizacion.Resolucion := '300 DPI';
       Digitalizacion.Tamano := '2550*2300 pixeles';//IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('TamanoBytes').AsInteger);
       Digitalizacion.Software_captura := 'THOMAS MTI';
       Digitalizacion.Color := 'RGB';
       Digitalizacion.Compresion := 'CCIT GRUPO 4';
       Digitalizacion.Folio_inicial := '1';
       Digitalizacion.Folio_final := IntToStr(DMGeneradorXML.cdsFoliosXML.FieldByName('CantidadFolios').AsInteger);
  end;
  DMGeneradorXML.cdsPlanillaIndices.First;
  repeat
    with SeguridadSocial.Indices.Add do
       begin
         Entidad := DMGeneradorXML.cdsPlanillaIndices.FieldByName('DescripcionFondo').AsString;
         Periodo_Cotizacion := DateTimeToStr(DMGeneradorXML.cdsPlanillaIndices.FieldByName('PeriodoCotizacion').AsDateTime);
         Fechapago_Banco := DateTimeToStr(DMGeneradorXML.cdsPlanillaIndices.FieldByName('FechaPago').AsDateTime);
         Num_id := DMGeneradorXML.cdsPlanillaIndices.FieldByName('NumeroDocumento').AsString;
         Prim_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerNombre').AsString;
         Seg_nomb := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoNombre').AsString;
         Prim_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('PrimerApellido').AsString;
         Seg_apll := DMGeneradorXML.cdsPlanillaIndices.FieldByName('SegundoApellido').AsString;
    end;
      DMGeneradorXML.cdsPlanillaIndices.Next;
  until DMGeneradorXML.cdsPlanillaIndices.Eof;
  xmlSeguridadSocial.SaveToFile(ExtractFilePath(Application.ExeName) + Copy(DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString, 1, Length (DMGeneradorXML.cdsFoliosXML.FieldByName('NombreImagen').AsString)-4)+'.xml');
  xmlSeguridadSocial.XML.Clear;
end;

procedure Tfrm_GeneradorXML.tmrProgressTimer(Sender: TObject);
begin
  //pbGeneradorXML.Position := i;
end;

Procedure Tfrm_GeneradorXML.VerificarVersion(p_NombModu: string;p_VersModu: string);
begin
  DMAplicacion.VerificarAplicacion(p_NombModu,p_VersModu, 'GENERADOR XML');
end;

end.