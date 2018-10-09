unit UToolsMenu;

interface

uses Windows,SysUtils, IniFiles,Forms, Classes,ExtCtrls, Controls,Buttons, RegExpr, WinSock, IdHttp, WinInet;

  const Enter = #10#13;
  function ValoresINI(Section,Key:string):string;
  function ParamConexion(Value:string):TStringList;
  function LocalIP: string;
  function LeerUsuarioWindows: string;
  function LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;
  function SoloNumeros(Valor:Char):Char;

implementation



//******************************************************************************
function SoloNumeros(Valor:Char):Char;
begin
  if not (StrScan('0123456789', Valor) <> nil) and (StrScan(#8, Valor)=nil) then
    Result := #0
  else
    Result := Valor;
end;
//******************************************************************************
function  LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;
begin
  Result := Format('%0.'+ CantidadCeros + 'd', [Valor]);
end;

function LeerUsuarioWindows: string;
var
  sNombreUsuario: String;
  dwLongitudNombre: DWord;
begin
  dwLongitudNombre := 255;
  SetLength( sNombreUsuario, dwLongitudNombre );

  if GetUserName( PChar( sNombreUsuario ), dwLongitudNombre ) Then
    Result := Copy( sNombreUsuario, 1, dwLongitudNombre - 1 )
  else
    Result := 'Desconocido';
end;

function LocalIP: string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of Char;
  I: Integer;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(buffer);
  if phe = nil then Exit;
  pPtr := PaPInAddr(phe^.h_addr_list);
  I := 0;
  while pPtr^[I] <> nil do
     begin
       Result := inet_ntoa(pptr^[I]^);
       Inc(I);
  end;
  WSACleanup;
end;


//******************************************************************************
procedure ObjetoEnBlanco(Objeto:TWinControl);
begin
  if (Objeto as TLabeledEdit).Text = '' then
    begin
      Application.MessageBox('Por Favor Digite Informacion...!', 'Advertencia', MB_ICONQUESTION+ MB_OK );
      (Objeto as TLabeledEdit).SetFocus;
      Abort;
  end;
end;

//*****************************************************************************
function ParamConexion(Value:string):TStringList;
var
  I        : Integer;
  FirstPos : Integer;
  Data     : TStringList;
  Valor    : string;
begin
  try
    FirstPos := 1;
    Data     := TStringList.Create;
    Data.Clear;
    for I := 0 to Length(Value) do
      begin
        if Value[I] = '|' then
          begin
            Valor := Copy(Value, FirstPos, I-FirstPos);
            Data.Add(Valor);
            FirstPos := I + 1;
        end;
    end;
    Result := Data;
  except
    on E : Exception do
      raise Exception.Create('Error Al Leer Parametros de Conexion. Fuente Del Error :'+ E.Message);
  end;
end;

//******************************************************************************
function  ValoresINI(Section,Key:string):string;
var
  FileINI : TIniFile;
  Ruta    : string;
begin
  try
    try
      Result  := '';
      Ruta    := ChangeFileExt(Application.ExeName,'.ini');
      FileINI := TIniFile.Create(Ruta);
      Result  := FileINI.ReadString(Section,Key,'');
      if Result = '' then
        raise Exception.Create('No Se ha encontrado Valor en el Archivo Inicial' + Enter + 'Section: ' + Section + Enter + 'Key : ' + Key );
    except
      on E : Exception do
        raise Exception.Create('Error al Leer Parametros Iniciales, Fuente Del Error :' + E.Message);
    end;
  finally
    FileINI.Free;
  end;
end;


end.
