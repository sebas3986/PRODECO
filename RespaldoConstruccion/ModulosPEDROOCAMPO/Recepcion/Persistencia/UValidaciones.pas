unit UValidaciones;

interface

uses
  Windows,  SysUtils,  Classes,  Controls,  Forms,  Winsock,  Dialogs,  ExtCtrls,
  StdCtrls,  DBGrids,  Buttons,  IniFiles,  DB;

  const Enter = #10#13;
  procedure Preguntar(Boton: TObject);
  function  CompararData(Obj1,Obj2:TCustomEdit):Boolean;
  procedure ObjetoEnBlanco(Objeto:TWinControl);
  procedure EnabledDisabled(Objeto:TWinControl);
  function  SoloNumeros(Valor:Char):Char;
  function  SoloNumerosAlf(Valor:Char):Char;
  function  LargoText(Valor:String;Longitud:integer):String;
  function  ValoresINI(Section,Key:string):string;
  function  ParamConexion(Value:string):TStringList;
  procedure RespuestasGrilla(Sender: TObject;var Key: Char);
  function  LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;

  function GetIPAddress():String;

implementation

//******************************************************************************
function GetIPAddress():String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of Ansichar;
begin
  if WSAStartup($101,varTWSAData) <> 0 Then
    Result := 'No. IP Address'
  else
    begin
      gethostname(namebuf,sizeof(namebuf));
      varPHostEnt := gethostbyname(namebuf);
      varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
      Result := inet_ntoa(varTInAddr);
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


//******************************************************************************
function LlenarCerosIzquierda(CantidadCeros:string; Valor:Integer):string;
begin
  Result := Format('%0.'+ CantidadCeros + 'd', [Valor]);
end;

//******************************************************************************
procedure RespuestasGrilla(Sender: TObject;var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      if Not (Sender As TDBGrid).DataSource.DataSet.Eof then
        begin
          if not (Sender As TDBGrid).DataSource.DataSet.FieldByName('RTA').IsNull then
            (Sender As TDBGrid).DataSource.DataSet.Next;
      end
  end else
     begin
       (Sender As TDBGrid).DataSource.DataSet.Edit;
        if Key in ['N', 'n'] then
          begin
            (Sender As TDBGrid).DataSource.DataSet.FieldByName('RTA').AsString := 'NO';

            {SIGUIENTE}
            if NOT (Sender As TDBGrid).DataSource.DataSet.Eof then
              (Sender As TDBGrid).DataSource.DataSet.Next;
        end;

        if Key in ['S', 's'] then
          begin
            (Sender As TDBGrid).DataSource.DataSet.FieldByName('RTA').AsString := 'SI';
            if NOT (Sender As TDBGrid).DataSource.DataSet.Eof then
              (Sender As TDBGrid).DataSource.DataSet.Next
        end;
     end;
  Key := #0;
end;

//******************************************************************************
procedure Preguntar(Boton: TObject);
var
  Tarea : string;
begin
  if Boton.ClassName = 'TBitBtn' then
    begin
      Tarea := (Boton as TBitBtn).Hint;
      if Application.MessageBox(PChar('Desea Continuar con la Opcion : ' + Tarea),'Advertencia', MB_ICONQUESTION + MB_YESNO) = ID_NO then
        Abort;
  end;
end;
//******************************************************************************

function SoloNumeros(Valor:Char):Char;
begin
  if not (StrScan('0123456789', Valor) <> nil) and (StrScan(#8, Valor)=nil) then
    Result := #0
  else
    Result := Valor;
end;
//******************************************************************************

function SoloNumerosAlf(Valor:Char):Char;
begin
  if (StrScan('!"�$%&/()=?�*^+`Ǩ��:;.,_-���[]|{}''', Valor) <> nil) and (StrScan(#8, Valor)=nil) then
    Result := #0
  else
    Result := Valor;
end;
//******************************************************************************

function LargoText(Valor:String;Longitud:integer):String;
begin
  if (Length(Valor) < Longitud) then
    Result := Valor
  else
    begin
      ShowMessage('Largo Permitido Excedido');
      Abort;
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

//******************************************************************************
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
procedure EnabledDisabled(Objeto:TWinControl);
begin
  if (Objeto as TWinControl).Enabled then
    (Objeto as TWinControl).Enabled := False
  else
    begin
      (Objeto as TWinControl).Enabled := True;
      (Objeto as TWinControl).SetFocus;
    end;
end;

//******************************************************************************
function CompararData(Obj1,Obj2:TCustomEdit):Boolean;
var
  txt1 : string;
  txt2 : string;
begin
  Result := False;
  txt1 := (Obj1 as TCustomEdit).Text;
  txt2 := (Obj2 as TCustomEdit).Text;
  if txt1 = txt2 then
    Result := True
  else
    begin
      (Obj1 as TCustomEdit).Text := '';
      (Obj2 as TCustomEdit).Text := '';
      (Obj2 as TCustomEdit).Enabled := False;
    end;
end;



end.
