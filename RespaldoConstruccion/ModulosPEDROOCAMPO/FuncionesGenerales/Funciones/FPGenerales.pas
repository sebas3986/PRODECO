unit FPGenerales;

interface
uses
  Windows,  System.Types,  controls,  IdSMTP,  IdMessage,  IdAttachmentFile,  SysUtils,
  StrUtils,  Classes,  StdCtrls,  IniFiles,  Mask,  ExtCtrls,  Forms,  IdText,  Graphics,
  EnImgScr,  DateUtils,  EnDiGrph,  EnTransf,  EnBlowupForm,  RxRichEd;

  Function LeeVariableIni (NombreTag, NombreVariable, RutaArchivoIni:string) : TStringList;
  Function NormalizaDireccion(Direccion:string):string;
  Function ReemplazarTexto(CadenaOrigen:string; CadenaReemplaza: String; CadenaPor: string;  PalabraCompleta: boolean) : string;

  procedure EnviarEmail(sUsuario, sClave, sHost : string; sPuerto : Integer;
                        sAsunto, sMensaje, sTipodestino: String;
                        sDestino, sConcopia, sResponder, sAdjunto: TStringList;
                        var CodigoErr: string; var EmailErr : TStringList);
  function GeneraNombreMes (p_NumeMess :Int16;p_CantCara : Int16;p_MayuMinu:string):string;
  procedure  QuitaEspaciosObjtxt(var Objeto : Tobject; EspIni : Boolean);

  {DECLARACION DE FUNCIONES PARA MANEJO DEL OBJETO TIMAGESCROLLBOX}
  procedure CambiarModo(var ImgDocumento:TImageScrollBox;Modo:Integer);
  procedure CambiarPagina(var ImgDocumento:TImageScrollBox;FileName:string;
                          Pagina:Integer;ZoomImagen:Single);
  procedure CentrarZona(var ImgDocumento:TImageScrollBox;ZoomImagen:Single);
  Function EjecutarProceso(NombreProceso: String; EsperaFinal: Boolean) : Boolean;
  function EnEjecucion(Aplicacion: string): Boolean;
  procedure GraficarZona(var ImgDocumento:TImageScrollBox;Izquierda,Superior,
                        Ancho,Alto,AnchoOriginal,AltoOriginal,Pagina:Integer;
                        FileName:string;ColorZona:TColor;ZoomImagen:Single);
  procedure GirarImagen(var ImgDocumento:TImageScrollBox);
  procedure ZoomEmergente(var p_Emergente:TBlowupForm;var p_ImgDocumento:TImageScrollBox;
                        p_TituForm: string; p_ObjetoPadre : TWinControl;
                        p_Ancho,p_Alto:Integer;P_Mostrar:Boolean);
  procedure ZoomPorcentaje(var ImgDocumento:TImageScrollBox;ZoomImagen:Single);
  function ValidaFecha (Fecha:string; p_formfech: string):string;
  function ZoomInstruccion(var ImgDocumento:TImageScrollBox;Modo:Integer):Single;

  {DECLARACION DE FUNCIONES PARA ARCHIVOS Y DIRECTORIOS}


implementation

{$REGION 'FUNCIONES PARA ARCHIVOS Y DIRECTORIOS'}
{$ENDREGION}


{$REGION 'PROCEDIMIENTO PARA ENVIO DE CORREO ELECTRONICO' }
{ Procedimiento EnviarEmail para enviar E-Mail
  Fecha Creación: 2014-12-04     Por: GUSTAVO VEGA ROZO
  sMensaje     : contiene el mensaje que va en el cuerpo del correo. Este mensaje puede enviarse en formato texto o
                  html. Si viene en formato texto se le dará tratamiento de un archivo html, se convierten los
                  caracteres de salto de linea (#13) en una etiqueta <br>.
  sTipodestino : vale 'G'  (grupo) si se envía el correo a todos los destinatarios al tiempo,
                      'U'  (uno por uno) si se envía el correo a cada destinatario por separado
  sConcopia : es una lista de los correos a los cuales se va a copiar el mensaje enviado. El correo
              con copia solamente va con el primero de los que se envíe.
  sResponder : es una lista de los correos a los cuales el destinatario debe responder.
  CodigoErr y EmailErr se envían por referencia para ser devueltas en caso de fallo
  EL PROCEDIMIENTO DEVUELVE EN LA VARIABLE CodigoErr UN ERROR EN CASO DE NO PODERSE CONECTAR AL SERVIDOR SMTP
  O DE NO PODER ENVIAR EL CORREO. SI OCURRE UNA DE ESTAS SITUACIONES DEVUELVE EN LA VARIABLE EmailErr LA LISTA
  DE LOS CORREOS QUE NO SE PUDIERON ENVIAR.
}

Procedure EnviarEmail(sUsuario, sClave, sHost : string; sPuerto : Integer;
                        sAsunto, sMensaje, sTipodestino: String;
                        sDestino, sConcopia, sResponder, sAdjunto: TStringList;
                        var CodigoErr: string; var EmailErr : TStringList);
var
  SMTP     : TIdSMTP;
  Email    : TIdMessage;
  CuerpoMsg: TIdText;
  I        :Integer;
//  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;//JOLMOS    //se añaden estas clases para que funcione el correo @thomasgreg.com  2014-11-19

begin
  {SE INICIALIZAN LAS VERIABLES QUE CONTROLAN LOS ERRORES}
  CodigoErr := '';
  EmailErr:= TStringList.Create;
  EmailErr.Clear;
    ////////////////////////se añaden estas clases para que funcione el correo @thomasgreg.com
//  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create( nil);//JOLMOS
//  IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;//JOLMOS
//  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;//JOLMOS

  // Creamos el componente de conexión con el servidor
  SMTP := TIdSMTP.Create( nil );
  with SMTP do
  begin
    Username := sUsuario;
    Password := sClave;
    Host := sHost;
    Port := sPuerto;
    ////////////////////////se añaden estas clases para que funcione el correo @thomasgreg.com  2014-11-19
//    IOHandler := IdSSLIOHandlerSocket;//JOLMOS
//    AuthType:= atDefault;//JOLMOS
//    UseTLS := utUseRequireTLS;//JOLMOS
  end;

  //Creamos el objeto que va a manejar el Email
  Email := TIdMessage.Create( nil );

  with Email do
  begin
    Clear;
    From.Name    := sUsuario;
    From.Address := sUsuario;
    Subject      := sAsunto;

    // Se agregan los correos a los que se les envía copia.
    CCList.Clear;
    if sConcopia <> nil then
      for I := 0 to sConcopia.Count - 1 do
        CCList.Add.Address :=  sConcopia[I];

    // Se agregan los correos a los que se les debe responder.
    ReplyTo.clear;
    if sResponder <> nil then
      for I := 0 to sResponder.Count - 1 do
        ReplyTo.Add.Address := sResponder[I];

    ContentType := 'multipart/mixed';

    CuerpoMsg:= TIdText.Create(Email.MessageParts);

    // El tipo de contenido del correo va a ser texto o html
    CuerpoMsg.ContentType:= 'text/html';
    // Se coloca tipo de letra por defecto y se reemplazan #13 po <br>
    CuerpoMsg.Body.Text := '<FONT FACE="arial"> ' + StringReplace(sMensaje,#13,'<br>',[rfReplaceAll]) + '</FONT> ';

    // se adjuntan los archivos
    if sAdjunto <> nil then
      for I := 0 to sAdjunto.Count - 1 do
      begin
        if sAdjunto[I] <> '' then
          if FileExists( sAdjunto[I] ) then
          begin
             TIdAttachmentFile.Create( Email.MessageParts, sAdjunto[I]);
          end;
      end;
  end;

  // Conectamos con el servidor SMTP
  try
    SMTP.Connect;
    SMTP.Authenticate;
  except
    CodigoErr :=  'CONEXION';
    EmailErr := sDestino;
  end;
  if  CodigoErr = '' then
  begin
  // Si ha conectado enviamos el Email para el grupo o de a uno en uno
    if SMTP.Connected then
    begin
      if UpperCase(sTipodestino) = 'G' then
      begin
        Email.Recipients.Clear;
        for I := 0 to sDestino.Count - 1 do
          Email.Recipients.Add.Address := sDestino[I] ;
        try
          SMTP.Send( Email );
        except
          { SI HAY ERROR ENVIANDO EL CORREO GRUPAL, DEVUELVE LA LISTA DE LOS CORREOS A LOS
            QUE NO SE LES PUDO ENVIAR }
          CodigoErr :=  'ENVIO';
          EmailErr := sDestino;
        end;
      end
      else
      begin
        for I := 0 to sDestino.Count - 1 do
        begin
          Email.Recipients.Clear;
          Email.Recipients.EMailAddresses := sDestino[I];
          try
            SMTP.Send( Email );
            // para envio de correo uno a uno el primer correo es el que envia las copias los otros no
            // por esa razón se elimina la lista de correos a copiar.
            Email.CCList.Clear;
          except
            CodigoErr :=  'ENVIO';
            EmailErr.Add(sDestino[I]) ;
          end;
        end;
      end;
      // se seconecta el servidor SMTP
      try
        SMTP.Disconnect;
      except
        codigoerr :=  'DESCONEXION';
        EmailErr := sDestino;
      end;
    end;
  end;
  // Liberamos los objetos creados
  FreeAndNil( Email );
  FreeAndNil( SMTP );
end;

{$ENDREGION}

{$REGION 'FUNCIONES PARA PROCESAMIENTO DE ARCHIVOS .INI' }
{ Funcion LeeVariableIni para leer una variable de un archivo .INI dando el nombre del tag y
                          la ruta del archivo .ini tomando como referencia la ruta del archivo
                          ejecutable
  Fecha Creación: 2014-12-04     Por: GUSTAVO VEGA ROZO
}

Function LeeVariableIni (NombreTag, NombreVariable, RutaArchivoIni:string) : TStringList;
var
  CorreosINI : TIniFile;
  ListaResu  : TStringList;
begin
  //CONFIG INICIAL
  try
    ListaResu := TStringList.Create();
    CorreosINI := TIniFile.Create(RutaArchivoIni);
    ListaResu.CommaText := CorreosINI.ReadString(NombreTag,NombreVariable,'');
    Result := ListaResu;
  except
    raise exception.create('No existe archivo de Configuración de Correos de envío.');
  end;
end;
{$ENDREGION}

{$REGION 'FUNCIONES PARA CADENAS DE TEXTO' }

{ Funcion QuitaEspaciosObjtxt  para NO permitir que en un objeto que maneja texto se acepte más de un
                                espacio en blanco entre palabra y palabra.
  Fecha Creación: 2014-12-04     Por: GUSTAVO VEGA ROZO
  Parámetros: Objeto [puede ser un TEdit, TMaskEdit, TLabeledEdit, etc. ]
              EspIni [indica si se permite espacio al comienzo del texto o no]
  Condiciones: se debe usar en conjunto con el evento OnChange del objeto
}

procedure  QuitaEspaciosObjtxt(var Objeto : Tobject; EspIni : Boolean);
var
  posi : Integer;
  tama : Integer;


begin
  {Se verifica si el objeto es un TEdit}
  if (Objeto is TEdit) or (Objeto is TMaskEdit) or (Objeto is TLabeledEdit) or
      (Objeto is TRxRichEdit)then
  begin
    {se guarda posición del cursor y tamaño de la cadena}
    posi := TEdit(Objeto).SelStart;
    tama := Length(TEdit(Objeto).Text);
    {reemplaza dos espacios por uno en toda la cadena}
    TEdit(Objeto).Text := StringReplace (TEdit(Objeto).Text,'  ',' ',[rfReplaceAll]);
    {se ajusta posición del cursor de acuerdo con los reemplazos que se hicieron}
    TEdit(Objeto).SelStart := posi - tama + Length(TEdit(Objeto).Text);

    {se controla si la primera posición puede contener ' ' }
    if (not EspIni) and (Length(TEdit(Objeto).Text) > 0) and (TEdit(Objeto).Text [1] = ' ')  then
      TEdit(Objeto).Text :=   StuffString(TEdit(Objeto).Text,1,1,'');
  end;
end;

{ Funcion ReemplazarTexto: reemplaza en una cadena de texto, una lista de palabras cada una de ellas por por una misma cadena.

  Fecha Creación: 2015-06-24     Por: GUSTAVO VEGA ROZO
  Parámetros: CadenaOrigen [Es la cadena original, la que contiene el texto en donds se va a efectuar el reemplazo]
              CadenaReemplaza [Contiene la lista de palabras que se quieren reemplazar en CadenaOriginal.Cada palabra debe estar
                                separada por el símbolo '|' ]
              CadenaPor [Es la cadena por la cual se va a reemplazar cada una de las palabras de CadenaReemplaza en la CadenaOrigen]
              TipoReemplazo [cuando es 'true' cambiar la palabra únicamente si está completa (si no hace parte de una cadena).
                             cuando es 'false' se reemplaza cada palabra sin importar si está completa o si hace  parte de una cadena.]

}
function ReemplazarTexto(CadenaOrigen:string; CadenaReemplaza: String; CadenaPor: string; PalabraCompleta: boolean) : string;
var
  CadeReem : TStringList;
  I : integer;
  PalaCamb : string;
  PalaPorr : string;
begin
  CadeReem := TstringList.Create;
  { strictdelimiter activa únicamente el delimitador que se coloca en Delimiter ya que por defecto el delimitador es espacio en blanco }
  CadeReem.StrictDelimiter := true;
  CadeReem.Delimiter := '|';
  CadeReem.delimitedtext := CadenaReemplaza;
  for I := 0 to CadeReem.Count - 1 do
  begin
    if (PalabraCompleta) and (LeftStr(CadenaReemplaza,1) <> ' ') and
                             (RightStr(CadenaReemplaza,1) <> ' ') then
    begin
      PalaCamb :=  ' ' + cadereem[I] +' ';
      PalaPorr :=  ' ' + CadenaPor + ' ';
    end
    else
    begin
      PalaCamb :=  cadereem[I];
      PalaPorr :=  CadenaPor;
    end;

    while (Pos(PalaCamb,CadenaOrigen)> 0) do
      cadenaorigen:= stringreplace(cadenaorigen, PalaCamb,PalaPorr,[rfreplaceall]);
  end;
  result:= CadenaOrigen;
end;
{$ENDREGION}

{$REGION 'FUNCION PARA NORMALIZACIÓN DE DIRECCIÓN}

{ Funcion NormalizaDireccion:  para validaciòn de los campos de direcciòn, de tal manera que se reemplacen los posibles errores por
                              convenciones o abreviaturas aceptadas. Iguelmente las palabras bien escritas se cambian por su
                              correspondiente abreviatura.

  Fecha Creación: 2015-06-24  Por: GUSTAVO VEGA ROZO
  Parámetros: Direccion [es el texto de la direcciòn que se desea normalizar]
  Resultado : [cadena de texto Condiciones: se debe usar en conjunto con el evento OnChange del objeto
}
Function NormalizaDireccion(Direccion:string):string;
  var
    Dire:string;
    I: Integer;
begin
  Dire := ' ' + AnsiUpperCase(Direccion) + ' ';

  {Se reemplazan ordinales por números}
  Dire := ReemplazarTexto(Dire,'1ª|1°|1º', '1', false);
  Dire := ReemplazarTexto(Dire,'2ª|2°|2º', '2', false);
  Dire := ReemplazarTexto(Dire,'3ª|3°|3º', '3', false);
  Dire := ReemplazarTexto(Dire,'4ª|4°|4º', '4', false);
  Dire := ReemplazarTexto(Dire,'5ª|5°|5º', '5', false);
  Dire := ReemplazarTexto(Dire,'6ª|6°|6º', '6', false);
  Dire := ReemplazarTexto(Dire,'7ª|7°|7º', '7', false);
  Dire := ReemplazarTexto(Dire,'8ª|8°|8º', '8', false);
  Dire := ReemplazarTexto(Dire,'9ª|9°|9º', '9', false);
  Dire := ReemplazarTexto(Dire,'N°|Nº', ' ', true);
  {Se reemplazan caracteres especiales para letras}
  Dire := ReemplazarTexto(Dire,'Á|À|Â|Ã|Ä', 'A', false);
  Dire := ReemplazarTexto(Dire,'Ë|É|È|Ê', 'E', false);
  Dire := ReemplazarTexto(Dire,'Í|Ì|Ï|Î', 'I', false);
  Dire := ReemplazarTexto(Dire,'Ó|Ò|Ô|Õ|Ö', 'O', false);
  Dire := ReemplazarTexto(Dire,'Ú|Ù|Û|Ü', 'U', false);
  Dire := ReemplazarTexto(Dire,'Ð', 'D', false);
  Dire := ReemplazarTexto(Dire,'Ñ', 'N', false);
  Dire := ReemplazarTexto(Dire,'Çç', 'C', false);

  {Se reemplazan los caracteree que no sean letras ni nùmeros por nulo}
  for I := 1 to StrLen(PAnsiChar(Dire)) do
  begin
    if not (Dire[I] in ['A'..'Z','0'..'9',' ']) then
      Dire[I]:=' ';
  end;

  {Se reemplazan las posibles cadenas que se escriban en la direcciòn por las correspondientes
   abreviaturas}
  Dire := ReemplazarTexto(Dire,'APARTADO AEREO', 'AA', true);
  Dire := ReemplazarTexto(Dire,'AVENIDA CALLE','AC', true);
  Dire := ReemplazarTexto(Dire,'AVENIDA CARRERA','AK', true);
  Dire := ReemplazarTexto(Dire,'CENTRO ADMINISTRATIVO','CAN', true);
  Dire := ReemplazarTexto(Dire,'CENTRO COMERCIAL', 'CCO', true);
  Dire := ReemplazarTexto(Dire,'CENTRO','CEN', true);
  Dire := ReemplazarTexto(Dire,'CIRCULAR','CIR', true);
  Dire := ReemplazarTexto(Dire,'NORTE','NTE', true);
  Dire := ReemplazarTexto(Dire,'GARAGE SOTANO', 'GS', true);
  Dire := ReemplazarTexto(Dire,'UNIDAD RESIDENCIAL','UR', true);
  Dire := ReemplazarTexto(Dire,'AGRUPACI�N|AGRUPACI�N|AFRUPACION|AGRPUACION|AGRUAPCION|AGRUPACIOM|AGRUPACION|AGRUPACOIN|' +
                          'AGRUPAVION|AGRUPAXION|AGUPRACION|AGURPACION|AHRUPACION|ARGUPACION|GARUPACION|AGRPACION|AGRUACION|' +
                          'AGRUPACIO|AGUPACION|AGRUPAC|AGRUPON|AGRPAC|AGRUPA|AGRUP|AGRU|AGP|AGR', 'AG', true);
  Dire := ReemplazarTexto(Dire,'APARTAMENTO|APARATAMENTO|AOARTAMENTO|APAETAMENTO|APARATMENTO|APARTAEMNTO|APARTAMEMTO|' +
                          'APARTANENTO|APARTEMANTO|APARTMAENTO|APATRAMENTO|APRATAMENTO|APSRTAMENTO|APZRTAMENTO|ARPATAMENTO|'+
                          'ATARPAMENTO|ATARPANEMTO|APARTAMENT|APATAMENTO|APRATAMNTO|APRTAMENTO|APARTAMEN|APARTMENT|APTAMENTO|' +
                          'APARTEMENTO|ATPAMENTO|APTMENTO|APARTAM|APARTA|APARTO|APART|APRTO|APAR|APTO|ATPO|APA|API', 'AP', true);
  Dire := ReemplazarTexto(Dire,'AUTOPISTA|ATUOPISTA|AUROPISTA|AUTOIPSTA|AUTOPITSA|AUTOPSITA|AUTPOISTA|AYTOPISTA|UATOPISTA|' +
                          'AUTOISTA|AUTOPIST|AUTOPITA|UTOPISTA|AUTOPIS|AUTOPTA|UTOPITA|AUTOPI|AUTPTA|AUTO|AUT|AU', 'AUTOP', true);
  Dire := ReemplazarTexto(Dire,'AVENIDA|AVENIDAD|ABENIDA|AVEINDA|AVENDIA|AVENIAD|AVNEIDA|VAENIDA|AVENID|VENIDA|AVENI|AVEN|' +
                          'AEV|AVE', 'AV', true);
  Dire := ReemplazarTexto(Dire,'BODEGA|BDOEGA|BODEAG|BODGEA|BOEDGA|OBDEGA|BODEG|BODE|BDO|BOD|BO|GB', 'BG', true);
  Dire := ReemplazarTexto(Dire,'BLOQUE|BLOQEU|BLOUQE|BLQOUE|LBOQUE|BLOQU|BLOQ|BLO|BLQ|BOL|BQL|LBQ|LB', 'BL', true);
  Dire := ReemplazarTexto(Dire,'BARRIO|BARROI|BRARIO|BARIO|BARRI|BARR|BAR|BRA|BA|BR', 'BRR', true);
  Dire := ReemplazarTexto(Dire,'CELULA|CELUAL|CLEULA|ECLULA|CELUL|CEULA|CELU|CEUL|CLE|CE|EC', 'CEL', true);
  Dire := ReemplazarTexto(Dire,'CALLE|ACLLE|CAELL|CALE|CALL|CLLE|CAL|CLA|CLL', 'CL', true);
  Dire := ReemplazarTexto(Dire,'COJNUNTO|CNOJUNTO|COMJUNTO|CONJNUTO|CONJUMTO|CONJUNOT|CONJUNTO|CONJUTNO|CONUJNTO|CNJUNTO|' +
                          'CONJNTO|CONJUNO|CONJUNT|CONJUN|CONJU|COJN|OCNJ|CJT|CON', 'CONJ', true);
  Dire := ReemplazarTexto(Dire,'CONSULTORIO|CNOSULTORIO|CONSLUTORIO|CONSULOTRIO|CONSULTOIRO|CONSULTOROI|CONSULTROIO|CONSUTLORIO|' +
                          'COSNULTORIO|OCNSULTORIO|CNOSULROIO|CNSULTORIO|CONSLTORIO|CONSULTORI|CONSULTRIO|CONSULTOR|CONSULTO|' +
                          'CONSULT|CONSUL|CONSU|CN|CO', 'CONS', true);
  Dire := ReemplazarTexto(Dire,'CASA|ACSA|CAAS|CAS|CSA|CA', 'CS', true);
  Dire := ReemplazarTexto(Dire,'CARRETERA|ACRRETERA|AKRRETERA|CARRETEAR|CARRETREA|KARRETEAR|KARRETERA|KARRETREA|CARETERA|' +
                          'CARRETER|CARRTERA|KARETERA|KARRETER|KARRTERA|CARRETE|KARRETE|CARRET|KARRET|CRTR|KRTR|CRT|KRT|TC', 'CT', true);
  Dire := ReemplazarTexto(Dire,'DIAGONAL|DAIGONAL|DIAGNOAL|DIAGOANL|DIAGONLA|DIAOGNAL|DIGAONAL|IDAGONAL|DAGONAL|DIAGNAL|DIAGONA|' +
                          'DIAGONL|DIGONAL|DIAGON|DIAGO|DIAG|DGN', 'DG', true);
  Dire := ReemplazarTexto(Dire,'DEPOSITO|DEPOISTO|DEPOSIOT|DEPOSTIO|DEPSOITO|DPEOSITO|EDPOSITO|DEPOITO|DEPOSIT|DEPSITO|DPOSITO|' +
                          'DEPOSI|DEPOS|DPSTO|DEPO|DPST|DEP|DST', 'DP', true);
  Dire := ReemplazarTexto(Dire,'EDIFICIO|DEIFICIO|EDIFICOI|EIDFICIO|DEFICIO|EDFICIO|EDIFCIO|EDIFICI|EDIFICO|EDIFIC|EDIFI|EDIF|EDF','ED', true);
  Dire := ReemplazarTexto(Dire,'ENTRADA|ENTRADAD|ENTARDA|ETNRADA|NETRADA|ENTRAD|ENTRDA|NTRADA|ENTRA|ENTRD|NTRDA|ENTR', 'ENT', true);
  Dire := ReemplazarTexto(Dire,'ESTE|SETE|ETE|STE|ES|ST', 'EST', true);
  Dire := ReemplazarTexto(Dire,'ESQUINA|EQSUINA|ESQIUNA|ESQUIAN|ESQUNIA|SEQUINA|EQUINA|ESQINA|ESQUIN|ESQUNA|SQUINA|ESQUI|ESQU|EQN','ESQ', true);
  Dire := ReemplazarTexto(Dire,'ETAPA|EATPA|TEAPA|ETAP|ETPA|TAPA|ETA|ETP', 'ET', true);
  Dire := ReemplazarTexto(Dire,'GARAJE|AGRAJE|GARAEJ|GARJAE|ARAJE|GARAE|GARAJ|GARJE|GRAJE|GARA|GRJE|GAR|GA|GR', 'GJ', true);
  Dire := ReemplazarTexto(Dire,'INTERIOR|INETRIOR|INTEIROR|INTERIRO|INTREIOR|ITNERIOR|NITERIOR|INTERIO|INTEROR|INTRIOR|NTERIOR|' +
                          'INTERI|INTER|INTE|INTR|IN', 'INT', true);
  Dire := ReemplazarTexto(Dire,'KILOMETRO|IKLOMETRO|KILMOETRO|KILOEMTRO|KILOMERTO|KILOMETOR|KILOMTERO|KIOLMETRO|KLIOMETRO|ILOMETRO|' +
                          'KILOETRO|KILOMERO|KILOMETO|KILOMETR|KILOMTRO|KIOMETRO|KLOMETRO|KILOMET|KILOME|KILOMT|KILOM|KIL|KLM|KL', 'KM', true);
  Dire := ReemplazarTexto(Dire,'CARRERA|ACRRERA|AKRRERA|CARREAR|KARREAR|KARRERA|CAERRA|CARERA|CARRER|KAERRA|KARERA|KARRER|CARRE|KARRE|' +
                          'CAR|CRA|KAR|KRA|CR', 'KR', true);
  Dire := ReemplazarTexto(Dire,'LOCAL|LCOAL|LOACL|LOCLA|OLCAL|LCAL|LOAL|LOCA|LOCL|OCAL|LCL|LOC', 'LC', true);
  Dire := ReemplazarTexto(Dire,'LOTE|LOET|OLTE|LOE|LOT|OTE', 'LT', true);
  Dire := ReemplazarTexto(Dire,'SUPER MANZANA|SUPERMANZANA|SPUERMANZANA|SUEPRMANZANA|SUPEMRANZANA|SUPERAMNZANA|SUPERMANAZNA|'+
                          'SUPERMAZNANA|SUPERMNAZANA|SUPREMANZANA|USPERMANZANA|SPERMANZANA|SUERMANZANA|SUPEMANZANA|SUPERANZANA|' +
                          'SUPERMANANA|SUPERMANZAA|SUPERMANZAN|SUPERMANZNA|SUPERMAZANA|SUPERMNZANA|UPERMANZANA|SUPER MZN|SMANZANA|' +
                          'SUPER MZ|SUPERMZN|SUP MAN|SUPER M|SUPERMZ|SUPERM|SUPMAN|SMANZ|SPMZN|SPMZ', 'SPM', true);
  Dire := ReemplazarTexto(Dire,'MODULO|MDOULO|MODLUO|MODUKO|MODUOL|MOUDLO|NODULO|OMDULO|MDULO|MODLO|MODUL|MODUO|MOULO|ODULO|MODU|' +
                          'MDL|MOL|MD', 'MOD', true);
  Dire := ReemplazarTexto(Dire,'MEZZANINE|EMZANNINE|EMZZANINE|MEAZNNINE|MEAZZNINE|MEZANINNE|MEZANNIEN|MEZANNINE|MEZNANINE|MEZZANIEN|' +
                          'MEZZNAINE|MZEANNINE|MZZEANINE|EMZANINE|MEANNINE|MEAZNINE|MEZAINNE|MEZANIEN|MEZANINE|MEZNAINE|MEZNNINE|' +
                          'MEZZAINE|MEZZANIN|MEZZNINE|MZANNINE|MZEANINE|MZZANINE|MEANINE|MEZAINE|MEZANIN|MEZNINE|MZANINE|MEZANI|' +
                          'MEZAN|MEZNN|MEZA|MEZN|MEZ|MN', 'MEZZ', true);
  Dire := ReemplazarTexto(Dire,'MUNICIPIO|MUNICIPI|MUNICIP|MUNICI|MUNIC|MUNI|MUN', 'MCP', true);
  Dire := ReemplazarTexto(Dire,'MANZANA|AMNZANA|MANAZNA|MAZNANA|MNAZANA|MANANA|MANZAN|MANZNA|MAZANA|MNZANA|MANZA|MZANA|MANZ|MZNA|' +
                          'MNZ|MZN', 'MZ', true);
  Dire := ReemplazarTexto(Dire,'OCCIDENTE|COCIDENTE|OCCDIENTE|OCCIDENET|OCCIDETNE|OCCIDNETE|OCCIEDNTE|OICCDENTE|CCIDENTE|OCCDENTE|' +
                          'OCCIDENE|OCCIDENT|OCCIDETE|OCCIDNTE|OCCIENTE|OCIDENTE|CIDENTE|OCCIDEN|OCIDENT|OCCDTE|OCCIDE|OCCDT|OCCID|' +
                          'OCCD|OCCI', 'OCC', true);
  Dire := ReemplazarTexto(Dire,'OESTE|EOSTE|OESET|OSETE|OESE|OEST|OETE|OSTE|OES', 'OE', true);
  Dire := ReemplazarTexto(Dire,'OFICINA|FOICINA|OFCIINA|OFICIAN|OFICNIA|OFIICNA|OIFCINA|FICINA|OFCINA|OFICIA|OFICIN|OFICNA|OFIINA|OICINA|' +
                          'OFICI|OFINA|OFCN|OFIC|OFNA|OFI', 'OF', true);
  Dire := ReemplazarTexto(Dire,'PARCELA|APRCELA|PACRELA|PARCEAL|PARCLEA|PARECLA|PRACELA|PACELA|PARCEA|PARCEL|PARCLA|PARELA|PRCELA|' +
                          'PARCE|PARC|PAR|PCL', 'PA', true);
  Dire := ReemplazarTexto(Dire,'PREDIO|PERDIO|PRDEIO|PREDOI|PREIDO|RPEDIO|PEDIO|PRDIO|PREDI|PREDO|PREIO|REDIO|PRDO|PRED|PRD|PRE', 'PD', true);
  Dire := ReemplazarTexto(Dire,'PENTHOUSE|EPNTHOUSE|PENHTOUSE|PENTHOSUE|PENTHOUES|PENTHUOSE|PENTOHUSE|PETNHOUSE|PNETHOUSE|ENTHOUSE|' +
                          'PENHAUSE|PENHOUSE|PENTHOSE|PENTHOUE|PENTHOUS|PENTHUSE|PENTOUSE|PNTHOUSE|PENTHOS|PENTHOU|PENTH|PENT|PHTS|' +
                          'PHT', 'PH', true);
  Dire := ReemplazarTexto(Dire,'PISO|IPSO|PIOS|PSIO|PIO|PIS|PSO', 'PI', true);
  Dire := ReemplazarTexto(Dire,'PUENTE|PEUNTE|PUENET|PUETNE|PUNETE|UPENTE|PENTE|PUENE|PUENT|PUETE|PUNTE|UENTE|PUEN|PUE|PN', 'PTE', true);
  Dire := ReemplazarTexto(Dire,'APSEO|PAESO|PASOE|PSAEO|ASEO|PASE|PSEO|PAS|PS', 'PASEO', true);
  Dire := ReemplazarTexto(Dire,'PUESTO|PEUSTO|PUESOT|PUETSO|PUSETO|UPESTO|PESTO|PUESO|PUEST|PUSTO|UESTO|PSTO|PUES|PST|PTO|PT', 'PTO', true);
  Dire := ReemplazarTexto(Dire,'SALON COMUNAL|ASLON COMUNAL|SALNO COMUNAL|SALON CMOUNAL|SALON COMNUAL|SALON COMUANL|SALON COMUNLA|' +
                          'SALON COUMNAL|SALON OCMUNAL|SAOLN COMUNAL|SLAON COMUNAL|ALON COMUNAL|SALN COMUNAL|SALO COMUNAL|SALON CMUNAL|' +
                          'SALON COMNAL|SALON COMUAL|SALON COMUNA|SALON COMUNL|SALON COUNAL|SALON OMUNAL|SAON COMUNAL|SLON COMUNAL|' +
                          'SALON COMN|SL COMUNAL|S COMUNAL|SALON COM|SAL COM|SLN COM|SALCOM|SA CO|SACO', 'SC', true);
  Dire := ReemplazarTexto(Dire,'SOLAR|OSLAR|SLOAR|SOALR|SOLRA|OLAR|SLAR|SOAR|SOLA|SOLR|SLR|SOL', 'SL', true);
  Dire := ReemplazarTexto(Dire,'SECTOR|ESCTOR|SCETOR|SECOTR|SECTRO|SETCOR|ECTOR|SCTOR|SECOR|SECTO|SECTR|SETOR|SCT|SEC|STR|SR', 'SECT', true);
  Dire := ReemplazarTexto(Dire,'SEMISOTANO|ESMISOTANO|SEIMSOTANO|SEMIOSTANO|SEMISOATNO|SEMISOTAON|SEMISOTNAO|SEMISTOANO|SEMSIOTANO|' +
                          'SMEISOTANO|EMISOTAMO|SEISOTANO|SEMIOTANO|SEMISOANO|SEMISOTAN|SEMISOTAO|SEMISTANO|SEMSOTANO|SMISOTANO|' +
                          'SEMISOT|SEMISTN|SEMIST|SEMIS|SMST', 'SS', true);
  Dire := ReemplazarTexto(Dire,'SOTANO|OSTANO|SOATNO|SOTAON|SOTNAO|STOANO|OTANO|SOANO|SOTAN|SOTAO|STANO|SOTN|STNO|SOT|STN', 'ST', true);
  Dire := ReemplazarTexto(Dire,'USR|SU', 'SUR', true);
  Dire := ReemplazarTexto(Dire,'TORRE|OTRRE|ORRE|TORE|TORR|TOE|TOR|TO', 'TRR', true);
  Dire := ReemplazarTexto(Dire,'TRANSVERSAL|RTANSVERSAL|TARNSVERSAL|TRANSEVRSAL|TRANSVERASL|TRANSVERSLA|TRANSVESRAL|TRANSVRESAL|' +
                          'TRANVSERSAL|TRASNVERSAL|TRNASVERSAL|RANSVERSAL|TANSVERSAL|TRANSERSAL|TRANSVERAL|TRANSVERSA|TRANSVERSL|' +
                          'TRANSVESAL|TRANSVRSAL|TRANVERSAL|TRASVERSAL|TRNSVERSAL|TRANSVERS|TRANSVER|TRANSVS|TRANSV|TRANS|TRAN|TRVS|' +
                          'TRV|TR', 'TV', true);
  Dire := ReemplazarTexto(Dire,'UNIDAD|NUIDAD|UINDAD|UNDIAD|UNIADD|NIDAD|UIDAD|UNDAD|UNIAD|UNIDA|UNIDD|UNID|UND|UNI', 'UN', true);
  Dire := ReemplazarTexto(Dire,'URBANIZACION|RUBANIZACION|UBRANIZACION|URABNIZACION|URBAINZACION|URBANIAZCION|URBANISACION|' +
                          'URBANIZACINO|URBANIZACOIN|URBANIZAICON|URBANIZASION|URBANIZCAION|URBANZIACION|URBNAIZACION|URVANIZACION|' +
                          'RBANIZACION|UBANIZACION|URANIZACION|URBAIZACION|URBANIACION|URBANIZACIN|URBANIZACIO|URBANIZACON|' +
                          'URBANIZAION|URBANIZCION|URBANZACION|URBNIZACION|URBANIZACI|URBANIZAC|URBANIZA|URBANIZ|URBANI|URBAN|' +
                          'URBA', 'URB', true);
  Dire := ReemplazarTexto(Dire,'EVREDA|VEERDA|VERDEA|VEREAD|VREEDA|EREDA|VERDA|VEREA|VERED|VREDA|VERE|VER|VE', 'VEREDA', true);
  Dire := ReemplazarTexto(Dire,'ZONA|OZNA|SONA|ZOAN|ONA|ZOA|ZON|ZO|Z', 'ZN', true);
  Dire := ReemplazarTexto(Dire,'NUMERO|NMUERO|NUEMRO|NUMEOR|NUMREO|UNMERO|NMERO|NUERO|NUMEO|NUMER|NUMRO|UMERO|NUME|NRO|NUM|NO|NU', '', true);
  Dire := ReemplazarTexto(Dire,'  ', ' ', true);
  Dire := Trim(Dire);
  result:=Dire;

end;


{$ENDREGION}

{$REGION 'FUNCIONES TIMAGESCROLLBOX' }

{ Procedimiento para Cambiar Modo del mouse en el componente TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              Modo [Entero que indica el modo de uso para el mouse]
                    0: Arrastrar Imagen con el mouse (Manita)
                    1: Selección rapida
                    2: Selección
                    3: Modo Dibujo de anotaciones
                    4: Modo Usuario}
procedure CambiarModo(var ImgDocumento:TImageScrollBox;Modo:Integer);
begin
  case Modo of
    0:  ImgDocumento.MouseMode := mmDrag;
    1:  ImgDocumento.MouseMode := mmQuickSelect;
    2:  ImgDocumento.MouseMode := mmSelect;
    3:  ImgDocumento.MouseMode := mmAnnotate;
    4:  ImgDocumento.MouseMode := mmUser;
  end;
end;

{ Procedimiento para Cambiar pagina o graficar Formulario en el componente TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              FileName  [Nombre o ruta de la imagen de tipo string]
              Pagina  [Pagina que desea cargar en el documento de tipo entero]
              Zoom  [Nivel de Zoom en el que desea cargar la imagen de tipo Single, tambien recibe enteros]}
procedure CambiarPagina(var ImgDocumento:TImageScrollBox;FileName:string;Pagina:Integer;ZoomImagen:Single);
begin
  ImgDocumento.LoadFromFile(FileName,Pagina);
  ImgDocumento.ZoomPercent := ZoomImagen;
  ImgDocumento.MouseMode := mmAnnotate;
  ImgDocumento.Annotations := '';
  ImgDocumento.MouseMode := mmDrag;
end;

{ Procedimiento para Centrar una zona en el componente TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              Zoom [Nivel de Zoom de la Imagen de tipo Sigle o Entero]
  Condiciones: Para invocar esta funcion el componente debe contener una zona}
procedure CentrarZona(var ImgDocumento:TImageScrollBox;ZoomImagen:Single);
var
  I : Integer;
  Valor : string;
  Anotaciones : array of Integer;
  Parametros : string;
begin
  SetLength(Anotaciones, 10);
    Parametros := AnsiReplaceStr(ImgDocumento.Annotations, '(', '');
  for I := 0 to 10 do
  begin
    Valor := AnsiLeftStr( Parametros, AnsiPos( ')', Parametros ));
    Anotaciones[I] := StrToInt(AnsiReplaceStr(Valor, ')', ''));
    Parametros := AnsiRightStr(Parametros, (Length(Parametros)-AnsiPos( ')', Parametros)));
  end;
  ImgDocumento.VertScrollBar.Position := Round(((Anotaciones[3]+((Anotaciones[5]-Anotaciones[3])/2))*ZoomImagen/100)-((ImgDocumento.Height)/2));
  ImgDocumento.HorzScrollBar.Position := Round(((Anotaciones[2]+((Anotaciones[4]-Anotaciones[2])/2))*ZoomImagen/100)-((ImgDocumento.Width)/2));
  ImgDocumento.MouseMode := mmDrag;
end;

{ Procedimiento para Girar la imagen del componente 90º TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              Izquierda [Coordenada en x de la esquiza superior Izquierda de la Zona en pixeles como Entero]
              Superior  [Coordenada en y de la esquiza superior Izquierda de la Zona en pixeles como Entero]
              Ancho [Ancho de la Zona en pixeles como Entero]
              Alto  [Alto de la Zona en pixeles como Entero]
              AnchoOriginal [Ancho de la Imagen en la que se zonifico en pixeles como Entero]
              AltoOriginal  [Anto de la Imagen en la que en pixeles como Entero]
              Pagina  [Numero de Pagina de la Zona como Entero]
              FileName  [Nombre o Ruta de la Imagen a Cargar]
              ColorZona [Color de la Zona de Tipo TColor]
              ZoomImagen  [Zoom de la Imagen de Tipo Single o Entero]}
procedure GraficarZona(var ImgDocumento:TImageScrollBox;Izquierda,Superior,Ancho,Alto,AnchoOriginal,AltoOriginal,Pagina:Integer;FileName:string;ColorZona:TColor;ZoomImagen:Single);
var
  AnchoActual,AltoActual,Derecha,Inferior : Integer;
  vIzquierda,vSuperior,vDerecha,vInferior : string;
begin
  Derecha := Izquierda + Ancho;
  Inferior := Superior + Alto;
  AnchoActual := ImgDocumento.Graphic.Width;
  AltoActual := ImgDocumento.Graphic.Height;
  ImgDocumento.ZoomPercent := ZoomImagen;
  vIzquierda := IntToStr(Round((AnchoActual/AnchoOriginal)*Izquierda));
  vSuperior := IntToStr(Round((AltoActual/AltoOriginal)*Superior));
  vDerecha := IntToStr(Round((AnchoActual/AnchoOriginal)*Derecha));
  vInferior := IntToStr(Round((AltoActual/AltoOriginal)*Inferior));
  ImgDocumento.MouseMode := mmAnnotate;
	ImgDocumento.LoadFromFile(FileName,Pagina+1);	
	ImgDocumento.Annotations :=  '(1)(2)'+'('+vIzquierda+')'+'('+vSuperior+')'+'('+vDerecha+')'+'('+vInferior+')'+'(1)('+IntToStr(ColorToRGB(ColorZona))+')(1)(1)(4)';
	ImgDocumento.VertScrollBar.Position := Round(((StrToInt(vSuperior)+((StrToInt(vInferior)-StrToInt(vSuperior))/2))*ZoomImagen/100)-((ImgDocumento.Height)/2));
	ImgDocumento.HorzScrollBar.Position := Round(((StrToInt(vIzquierda)+((StrToInt(vDerecha)-StrToInt(vIzquierda))/2))*ZoomImagen/100)-((ImgDocumento.Width)/2));
	ImgDocumento.AlwaysShowAnnotations := True;
	ImgDocumento.MouseMode := mmDrag;
end;

{ Procedimiento para Girar la imagen del componente 90º TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]}
procedure GirarImagen(var ImgDocumento:TImageScrollBox);
var
  FBlowupForm : TBlowupForm;
  FUndoGraphic : TDibGraphic;
  Transform : TRotateTransform;
begin
  FUndoGraphic := TDibGraphic.Create;
  FUndoGraphic.Assign(ImgDocumento.Graphic);
  Transform := TRotateTransform.Create;
  try
    Transform.Angle := 90;
    Transform.ApplyOnDest(FUndoGraphic, ImgDocumento.Graphic);
  finally
    Transform.Free;
  end;
  ImgDocumento.Redraw(True);
end;

{ Procedimiento para Generar un formulario emergente de zoom basado en la imagen
  del componente TImageScrollBox de manera predeterminada
  Fecha Creación    : 2014-12-05     Por: José Andrés Olmos Martin
  Fecha Modificacion: 2016-06-14     Por: Gustavo Vega Rozo
                      Se agrega parámetro del Formulario Padre
  Parámetros: Emergente  [Formulario de tipo TBlowupForm]
              ImgDocumento  [Componente de Tipo TImageScrollBox]
              Ancho [Ancho del formulario Emergente de tipo entero]
              Alto  [Alto del formulario Emergente de tipo entero]
              Mostrar [Boolean para validar si se muestra el emergente]}
procedure ZoomEmergente(var p_Emergente:TBlowupForm;var p_ImgDocumento:TImageScrollBox;
                        p_TituForm: string; p_ObjetoPadre : TWinControl;
                        p_Ancho,p_Alto:Integer;P_Mostrar:Boolean);
begin
  if not p_Mostrar then
  begin
    p_Emergente.Free
  end else
  begin
    Application.CreateForm(TBlowupForm, p_Emergente);
    with p_Emergente do
    begin
      Caption             := p_TituForm;
      Height              := p_Alto;
      Width               := p_Ancho;
      Top                 := 50;
      Left                := 50;
      Panel.Source        := p_ImgDocumento;
      p_Emergente.Parent  := p_ObjetoPadre;
      Show;
    end;
  end;
end;

{ Funcion para Realizar el zoom en el componente TImageScrollBox de manera predeterminada
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              Modo [Modo de Zoom para la imagen de tipo entero]
                    0: Imagen Original
                    1: Imagen a Pantalla Completa
                    2: Ajustar al Ancho de la Pantalla
                    3: Ajustar a la Altura de la Pantalla
                    4: Ajustar a la Pantalla
  Resultado: Zoom en número de tipo Single para referencia del Zoom}
function ZoomInstruccion(var ImgDocumento:TImageScrollBox;Modo:Integer):Single;
begin
  case Modo of
    0:  ImgDocumento.ZoomMode := zmOriginalSize;
    1:  ImgDocumento.ZoomMode := zmFullPage;
    2:  ImgDocumento.ZoomMode := zmFitWidth;
    3:  ImgDocumento.ZoomMode := zmFitHeight;
    4:  ImgDocumento.ZoomMode := zmFitToPage;
  end;
  Result := ImgDocumento.ZoomPercent;
end;

{ Procedimiento para Modificar el zoom de la imagen en el componente TImageScrollBox
  Fecha Creación: 2014-12-05     Por: José Andrés Olmos Martin
  Parámetros: ImgDocumento  [Componente de Tipo TImageScrollBox]
              Zoom [Nivel de Zoom de la Imagen de tipo Sigle o Entero]}
procedure ZoomPorcentaje(var ImgDocumento:TImageScrollBox;ZoomImagen:Single);
begin
  ImgDocumento.ZoomPercent := ZoomImagen;
end;

{$ENDREGION}

{$REGION 'FUNCIONES PARA FECHAS'}

{ Funcion ValidaFecha para verificar que una fecha dada sea válida teniendo en cuenta los tamaños de los meses,
      años bisiestos.
  Fecha Creación: 2014-12-05     Por: DIANA LISETH CARREÑO
  Parámetros: Fecha  [una cadena con estructura AAAA/MM/DD]
  Resultado:  La funcion devuelve una cadena CON 'V' que indica que la fecha está vacía, 'D' error en el día,
              'M' error en el mes y 'A' error en el año.
  Condiciones: se debe usar en conjunto con el evento OnChange del objeto
}

function ValidaFecha (Fecha:string; p_formfech: string):string;
var
Dia, Mes, Anio : Integer;
begin
  if p_formfech = 'dd/mm/aaaa' then
  begin
    Dia := StrToInt(Copy(Fecha, 1,2));
    Mes := StrToInt(Copy(Fecha, 4,2));
    Anio := StrToInt(Copy(Fecha, 7,4));
  end
  else
  begin
    Dia := StrToInt(Copy(Fecha, 9,2));
    Mes := StrToInt(Copy(Fecha, 6,2));
    Anio := StrToInt(Copy(Fecha, 1,4));
  end;
  Result:='';
  If (anio=0)  or (Mes =0) or (Dia = 0) Then
    begin
      Result := ('V');
    end
  else
  begin
    if (Dia > (DaysInAMonth(Anio, Mes))) then
    begin
      Result := ('D');
    end;

    if Mes > 12 then
    begin
      Result := ('M');
    end;

    if (Anio > CurrentYear) or (Anio < (CurrentYear -90))  then
    begin
      Result := ('A');
    end;
  end;
end;

function GeneraNombreMes (p_NumeMess :Int16;p_CantCara : Int16;p_MayuMinu:string):string;
const
  NombMess    : array [1..12] of string = ('Enero','Febrero','Marzo','Abril','Mayo','Junio',
                                          'Julio','Agosto','Septiembre','Octubre','Noviembre',
                                          'Diciembre');
begin
  if (p_NumeMess >= 1) AND (p_NumeMess <= 12) then
  begin
    if p_CantCara <= 2 then
    begin
      case p_NumeMess of
        5: Result:= 'My';
        7: Result:= 'Jl';
      else
           Result:= AnsiLeftStr(NombMess[p_NumeMess],2);
      end;
    end
    else
      Result:= AnsiLeftStr(NombMess[p_NumeMess],p_CantCara);

    if p_MayuMinu = 'MY' then
      Result:= UpperCase(Result)
    else
      if p_MayuMinu = 'MN' then
        Result:= LowerCase(Result)
      else
        if p_MayuMinu =  'PM' then
          Result:= Result
        else
          raise Exception.Create('Incorrecta la forma de presentar el nombre del mes. '
                              + 'Valores válidos: MY(todo en mayúsculas), MN(todo en '
                              + 'minúsculas), PM(primera en mayúscula).');
  end
  else
    raise Exception.Create('Número de mes incorrecto. Valores válidos: entre 1 y 12.');
end;

{$ENDREGION}

{$REGION 'FUNCION EJECUCIÓN DE PROCESOS DEL SISTEMA OPERATIVO EN BACGROUND'}
Function EjecutarProceso(NombreProceso: String;
                        EsperaFinal: Boolean) : Boolean;
(*
  FUNCION PARA CONTROLAR LA EJECUCION DE UN ARCHIVO (.EXE O .BAT). NombreProceso
  CONTIENE EL NOMBRE DEL ARCHIVO EJECUTABLE CON SU RUTA. EsperaFinal INDICA SI
  SE VA O NO A ESPERAR A QUE FINALICE LA EJECUCIÓN DEL PROCESO (INTERRUMPIR O
  NO LA EJECUCION DEL PROGRAMA LLAMADOR). LA FUNCION RETORNA true SI LA EJECUCION
  FUE EXITOSA Y false SI NO LO FUE
*)

var
  DatosInicio:  TStartupInfo;
  DatosProceso: TProcessInformation;
   l: Integer;
   buffer: TByteDynArray;
begin
  l := (Length(NombreProceso)+1)*sizeof(Char);
  SetLength(buffer, l);
  Move(NombreProceso[1], buffer[0], l);
  // SE INICIALIZAN LAS VARIABLES MANEJADORAS DEL PROCESO
  DatosInicio:=default(TStartupInfo);
  DatosInicio.cb := SizeOf(DatosInicio);
  // SE ORDENA LA EJECUCION DEL PROCESO. EL PARAMETRO CREATE_NO_WINDOW ES PARA
  // QUE EJECUTE EN SEGUNDO PLANO
  if CreateProcess(PChar(nil),@buffer[0], nil,nil,False,CREATE_NO_WINDOW,nil,
                    PChar(nil),DatosInicio,DatosProceso) then
    begin
      if EsperaFinal then
        // SI SE DESEA ESPERAR HASTA LA FINALIZACION DE LA EJECUCION DEL
        // PROCESO
        WaitForSingleObject(DatosProceso.hProcess, INFINITE);
      result:=true;
    end
  else
    begin
      result:=false;
    end;
  //Application.ProcessMessages();
  CloseHandle(DatosProceso.hProcess);
  CloseHandle(DatosProceso.hThread);
end;
{$ENDREGION}

{$REGION 'FUNCION PARA VERIFICAR SI UN MÓDULO YA SE ENCUENTRA EN EJECUCIÓN'}
function EnEjecucion(Aplicacion: string): Boolean;
{
  FUNCION PARA VERIFICAR QUE UN MÓDULO EJECUTABLE O APLICACIÓN YA SE ENCUENTRE EN
  MEMORIA EN EJECUCIÓN. Aplicacion  CONTIENE EL NOMBRE DEL ARCHIVO EJECUTABLE
  INCLUYENDO LA EXTENSIÓN. LA FUNCION RETORNA true SI Aplicacion SE ESTÁ
  EJECUTANDO EN MEMORIA Y false SI NO LO ESTÁ
}
var
  Estado : Thandle;
begin
  Estado := CreateMutex(nil, true, pchar(Aplicacion));
  if Estado = 0 then
    result := false
  else
    if GetLastError = ERROR_ALREADY_EXISTS then
      result := true
    else
      result := false;
end;
{$ENDREGION}
end.

