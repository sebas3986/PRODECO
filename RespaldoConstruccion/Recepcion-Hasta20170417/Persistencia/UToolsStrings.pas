unit UToolsStrings;

interface

Uses Classes, StrUtils, SysUtils, DateUtils, RegExpr, DB, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP,IdAttachment,IdAttachmentFile, Forms;

  Function NotNullNotEmpty(Value : String) : Boolean;
  Function ValideTypeData(Cad : String; TipoDato : String) : Boolean;
  Function ValideLength(Cad : String; ALength : Integer; ValideMax : Boolean = True) : Boolean;
  Function ValideMinLength(Cad : String; MinLenght : Integer) : Boolean;
  Function ValideMail(Mail : String) : Boolean;
  Procedure DestroyCad(Cad : String; Delimiter : String; ListValues : TStrings);overload;
  function  DestroyCad(Cad : String; Delimiter : String) : TStringList;overload;
  function  DestroyCad(Cad : String; Delimiter : String; bTrim : Boolean) : TStringList;overload;
  procedure WriteToFile(PathFile : String; Line : String);
  Function QuitExtFile (NameFile : String) : String;
  Function RepetWordsInFile(PathFile : String; TextFind : String) : Boolean;
  Function IsNumeric(Val : Char) : Boolean;
  Function ZeroLeft(Cad  : String) : String;
  Function ChangeExtFile( NameFile, NewExt : String) : String;
  Function NumDaysBeetween(DateBegin, DateEnd : TDateTime) : Integer;
  Function ValideCharacters(Cad : String) : Boolean;
  Function ContainNumbers(Cad : String) : Boolean;
  Function IsNumberFirstLast (Cad : String) : Boolean;
  Function ContainSucesivos (Cad : String) : Boolean;
  Function FormatStrDate(FormatOri, FormatDes, Value : String) : String;
  Function IsDate(Value, Ident : String) : Boolean;
  Procedure ExportQryToFile(Qry : TDataSet; Path,Separator : String);
  Function CountLines(FileName : String) : Integer;
  Function AddChar(Value : String; NumLength : Integer; CompletChar : String; AddLeft : Boolean) : String;
  Function FindSeparator(ValueDate : String) : String;
  Function FindFile(const filespec: TFileName; attributes: integer ): TStringList;
  Function ConvertLineDs(Qry : TDataSet; Separator : String) : String;

  Function EnviarEmail(sAlias, sUsuario, sClave, sHost, sAdjunto, sAsunto,sDestino, sMensaje, sAdjunto1: String ) : Boolean;






implementation

//******************************************************************************

  Procedure DestroyCad(Cad : String; Delimiter : String; ListValues : TStrings);
  Begin
    ListValues.Clear;
    While PosEx(Delimiter, Cad) <> 0 do
    Begin
      ListValues.Add(TrimRight(TrimLeft(Copy(Cad, 1, PosEx(Delimiter, Cad) - 1))));
      Cad := Copy(Cad, PosEx(Delimiter, Cad) + Length(Delimiter), Length(Cad));
    end;
    ListValues.Add(TrimRight(TrimLeft(Cad)));
  end;

  function DestroyCad(Cad : String; Delimiter : String) : TStringList;
  Begin
    Result := DestroyCad(Cad, Delimiter, True)
  end;

  function  DestroyCad(Cad : String; Delimiter : String; bTrim : Boolean) : TStringList;
  Begin
    Result := TStringList.Create;
    Result.Clear;
    While PosEx(Delimiter, Cad) <> 0 do
    Begin
      if bTrim then
        Result.Add(TrimRight(TrimLeft(Copy(Cad, 1, PosEx(Delimiter, Cad) - 1))))
      else
        Result.Add(Copy(Cad, 1, PosEx(Delimiter, Cad) - 1));
      Cad := Copy(Cad, PosEx(Delimiter, Cad) + Length(Delimiter), Length(Cad));
    end;
    if Cad <> '' then    
      if bTrim then
        Result.Add(TrimRight(TrimLeft(Cad)))
      else
        Result.Add(Cad);
  end;

//******************************************************************************

  Function ValideTypeData(Cad : String; TipoDato : String) : Boolean;
  Var
   I : Integer;
  Begin
    Result := True;
    If CompareText(TipoDato, 'Numeric') = 0 then
    Begin
      for I := 1 to Length(Cad) do
      begin
        If not IsNumeric(Cad[I]) then
        Begin
          Result := False;
          Break;
        end;
      end;
    end;
  end;

//******************************************************************************

  Function ValideLength(Cad : String; ALength : Integer; ValideMax : Boolean) : Boolean;
  Begin
    Result := True;
    if ValideMax then
    Begin
      If Length(Cad) > ALength then
        Result := False;
    End
    Else
    Begin
      If Length(Cad) <= ALength then
        Result := False;
    End;
  end;

//******************************************************************************

  Function ValideMinLength(Cad : String; MinLenght : Integer) : Boolean;
  Begin
    Result := False;
    If Length(Cad) < MinLenght then
      Result := True;
  End;

//******************************************************************************

  Function ValideMail(Mail : String) : Boolean;
  Var
    Expre : TRegExpr;
  Begin
    Result := False;
    Expre := TRegExpr.Create;
    Expre.Expression := '^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$';
    If Expre.Exec(Mail) Then
      Result := CompareText(Expre.Match[0], '') <> 0;
    FreeAndNil(Expre);
  End;

//******************************************************************************

  Function NotNullNotEmpty(Value : String) : Boolean;
  Begin
    Result := True;
    if Value = '' then
      Result := False;
  End;

//******************************************************************************

  procedure WriteToFile(PathFile : String; Line : String);
  Var
   Tmp : TextFile;
  Begin
     if not DirectoryExists(ExtractFileDir(PathFile)) then
       ForceDirectories(ExtractFileDir(PathFile));
     AssignFile(Tmp, PathFile);
     if FileExists(PathFile) then
       Append(Tmp)
     else
       Rewrite(Tmp);
     Writeln(Tmp, Line);
     CloseFile(Tmp);
  end;

//******************************************************************************

  Function QuitExtFile (NameFile : String) : String;
  Begin
    Result := Copy(NameFile, 1, LastDelimiter('.', NameFile) - 1);

  End;

//******************************************************************************

  Function RepetWordsInFile(PathFile : String; TextFind : String) : Boolean;
  Var
   Tmp : TextFile;
   LineCurrent : String;
   Count : Integer;
  Begin
   Result := False;
   Count := 0;
   AssignFile(Tmp, PathFile);
   Reset(Tmp);
   While not Eof(Tmp) do
   begin
     Readln(Tmp, LineCurrent);
     if PosEx(TextFind, LineCurrent) <> 0 then
       Inc(count);
     if Count > 1 then
     begin
//       CloseFile(Tmp);
       Result := True;
       break;
      end;
   end;
   CloseFile(Tmp);
  end;

//******************************************************************************

  Function IsNumeric(Val : Char) : Boolean;
  Begin
    Result := True;
    if not(Val in ['0','1','2','3','4','5','6','7','8','9']) then
    Begin
      Result := False;
    End;
  End;

//******************************************************************************

  Function ZeroLeft(Cad  : String) : String;
  Begin
    While Cad[1] =  '0' do
    Begin
      Cad := Copy(Cad, 2, Length(Cad));
    End;
    Result := Cad;
  End;

//******************************************************************************

  Function ChangeExtFile( NameFile, NewExt : String) : String;
  Begin
    Result := Format('%s%s', [Copy(NameFile, 1, LastDelimiter('.', NameFile)), NewExt]);
  End;

//******************************************************************************

  Function NumDaysBeetween(DateBegin, DateEnd : TDateTime) : Integer;
  Begin
    Result := Trunc(DaySpan(DateBegin, DateEnd));
  End;

//******************************************************************************

  Function ValideCharacters(Cad : String) : Boolean;
  var
    i: Integer;
  begin
    Result := True;
    for i := 1 to length(Cad) do
    begin
      if not (((UpperCase(Cad[i]) >= 'A') and (UpperCase(Cad[i]) <= 'Z')) or
         ((Cad[i] >= '0') and (Cad[i] <= '9'))) then
      begin
        Result := False;
        Break;
      end;
    end;
  End;

//******************************************************************************

  Function ContainNumbers(Cad : String) : Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to length(Cad) do
    begin
      if (Cad[i] in ['0', '1' .. '8', '9']) then
      begin
        Result := True;
        Break;
      end;
    end;
  End;

//******************************************************************************

  Function IsNumberFirstLast (Cad : String) : Boolean;
  Begin
  Result := False;
  if ((Cad[1] in ['0', '1' .. '8', '9']) or  (Cad[length(Cad)] in ['0', '1' .. '8', '9'])) then
    Result := True;
  End;

//******************************************************************************

  Function ContainSucesivos (Cad : String) : Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to length(Cad) - 1 do
    begin
      if Cad[i] = Cad[i + 1] then
      begin
        Result := True;
        Break;
      end;
    end;
  End;

//******************************************************************************

  Function FormatStrDate(FormatOri, FormatDes, Value : String) : String;
  Var
    DD, MM, YY, HH, NN, SS, Separator : String;
    NumDD, FirstSeparator, LastSeparator : Integer;
  Begin
    If CompareText(FormatOri, FormatDes) <> 0 then
    Begin
      Separator := FindSeparator(Value);
      FirstSeparator := Pos(Separator, Value);
      LastSeparator  := LastDelimiter(Separator, Value);
      if FirstSeparator = 2 then
      Begin
        Value := AddChar(Value, Length(Value) + 1, '0', True);
        FirstSeparator := Pos(Separator, Value);
        LastSeparator  := LastDelimiter(Separator, Value);
      End;
      if (LastSeparator - FirstSeparator) = 2 then
      Begin
        Value := Format('%s0%s', [Copy(Value, 1, FirstSeparator), Copy(Value, LastSeparator - 1, length(Value))]);
        FirstSeparator := Pos(Separator, Value);
        LastSeparator  := LastDelimiter(Separator, Value);
      End;
      if (((Length(Value) - LastSeparator) = 1) or ((pos(' ', Value))- LastSeparator = 2) ) then
        Value := Format('%s0%s', [Copy(Value, 1, LastSeparator), Copy(Value, LastSeparator + 1, length(Value))]);
      DD := Copy(Value, Pos('DD', FormatOri), 2);
      MM := Copy(Value, Pos('MM', FormatOri), 2);
      HH := Copy(Value, Pos('HH', FormatOri), 2);
      NN := Copy(Value, Pos('NN', FormatOri), 2);
      SS := Copy(Value, Pos('SS', FormatOri), 2);
      if Pos('YYYY', FormatOri) <> 0 then
      Begin
        YY := Copy(Value, Pos('YYYY', FormatOri), 4);
        Result := ReplaceStr(FormatDes, 'YYYY', YY);
      End
      else
      Begin
        YY := Copy(Value, Pos('YY', FormatOri), 2);
        Result := ReplaceStr(FormatDes, 'YY', YY);
      End;
      Result := ReplaceStr(Result, 'DD', DD);
      Result := ReplaceStr(Result, 'MM', MM);
      Result := ReplaceStr(Result, 'HH', HH);
      Result := ReplaceStr(Result, 'NN', NN);
      Result := ReplaceStr(Result, 'SS', SS);
    End
    Else
      Result := Value;
  End;

//******************************************************************************

  Function IsDate(Value, Ident : String) : Boolean;
  var
    CountId  : Integer;
  Begin
    CountId := 0;
    While Pos(Ident, Value) <> 0 Do
    Begin
      Inc(CountId);
      Value := Copy(Value, Pos(Ident, Value) + 1, Length(Value));
    End;
    Result := CountId = 2;
  End;

//******************************************************************************

  Procedure ExportQryToFile(Qry : TDataSet; Path,Separator : String);
  Var
    Dat : String;
    I : Integer;
  Begin
    With Qry Do
    Begin
      First;
      Dat := '';
      for  I:=0  to pred(Fields.Count) do
      begin
        If Dat <> '' Then
          Dat := Format('%s%s%s',[Dat,Separator,Fields[I].DisplayLabel])
        Else
           Dat := Fields[I].DisplayLabel;
      end;
      WriteToFile(Path,Dat);
      While Not Eof Do
      Begin
        Dat := '';
        for  I:=0  to pred(Fields.Count) do
        begin
          If Dat <> '' Then
            Dat := Format('%s%s%s',[Dat,Separator,Fields[I].AsString])
          Else
            Dat := Fields[I].AsString;
        end;
        WriteToFile(Path,Dat);
        Next;
      End;
    End;
  End;

//******************************************************************************

  Function CountLines(FileName : String) : Integer;
  Var
   Temp : TextFile;
  begin
    Result := 0;
    if FileExists(FileName) then
    Begin
      AssignFile(Temp, FileName);
      Reset(Temp);
      while not Eof(Temp) do
      Begin
        Readln(Temp);
        Inc(Result);
      End;
      CloseFile(Temp);
    End;
  End;

//******************************************************************************

  Function AddChar(Value : String; NumLength : Integer; CompletChar : String; AddLeft : Boolean) : String;
  Begin
    Result := Value;
    while Length(Result) < NumLength do
    Begin
      if AddLeft then
        Result := Format('%s%s', [CompletChar, Result])
      else
        Result := Format('%s%s', [Result, CompletChar]);
    End;
  End;

//******************************************************************************

  Function FindSeparator(ValueDate : String) : String;
  Var
    I: Integer;
  Begin
    Result := '';
    for I := 1 to Length(ValueDate) do
    begin
      if not IsNumeric(ValueDate[I]) then
      Begin
        Result := ValueDate[I];
        Break;
      End;
    end;
  End;

//******************************************************************************

Function FindFile(const filespec: TFileName; attributes: integer ): TStringList;
var
  spec: string;
  list: TStringList;
procedure RFindFile(const folder: TFileName);
var
  SearchRec: TSearchRec;
begin
  // Busca todos los archivos concordantes
  // en la carpeta actual y agrega sus nombres
  // a la lista
  if FindFirst(folder + spec, attributes,
      SearchRec) = 0 then begin
    try
      repeat
        if (SearchRec.Attr and faDirectory = 0)
           or (SearchRec.Name <> '.')
           and (SearchRec.Name <> '..') then
          list.Add(folder + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    except
      FindClose(SearchRec);
      raise;
    end;
    FindClose(SearchRec);
  end;
  // Ahora busca en las  subcarpetas
  if FindFirst(folder + '*', attributes
      Or faDirectory, SearchRec) = 0 then begin
    try
      repeat
        if ((SearchRec.Attr and faDirectory) <> 0) and
           (SearchRec.Name <> '.') and(SearchRec.Name <> '..') then
          RFindFile(folder + SearchRec.Name + '\');
      until FindNext(SearchRec) <> 0;
    except
      FindClose(SearchRec);
      raise;
    end;
    FindClose(SearchRec);
  end;
end; // procedure RFindFile dentro de FindFile
begin // function FindFile
  list := TStringList.Create;
  try
    spec := ExtractFileName(filespec);
    RFindFile(ExtractFilePath(filespec));
    Result := list;
  except
    list.Free;
    raise;
  end;
End;

//******************************************************************************

Function ConvertLineDs(Qry : TDataSet; Separator : String) : String;
Var
  I : Integer;
Begin
  Result := '';
  if Qry.Active then
  Begin
    for I := 0 to pred(Qry.Fields.Count) do
    begin
      If Result <> '' Then
        Result := Format('%s%s%s',[Result,Separator,Qry.Fields[I].AsString])
      Else
        Result := Qry.Fields[I].AsString;
    end;
  End;
End;

//******************************************************************************
Function EnviarEmail(sAlias, sUsuario, sClave, sHost, sAdjunto, sAsunto, sDestino, sMensaje, sAdjunto1: String ) : Boolean;
var
  SMTP: TIdSMTP;
  Mensaje: TIdMessage;
  Adjunto: TIdAttachmentFile;
  Adjunto1: TIdAttachmentFile;
begin
    Result := True;
    // Creamos el componente de conexión con el servidor
    SMTP := TIdSMTP.Create( nil );
    SMTP.Username := sUsuario;
    SMTP.Password := sClave;
    SMTP.Host := sHost;
    SMTP.Port := 25;
    SMTP.AuthType := atDefault;
    //Creamos el contenido del mensaje
    Mensaje := TIdMessage.Create( nil );
    Mensaje.Clear;
    Mensaje.From.Name := sUsuario;
    Mensaje.Encoding := meMIME;
    Mensaje.CharSet := UTF8Encode('iso-8859-1');
    Mensaje.From.Address := sAlias;
    Mensaje.Subject := sAsunto;
    Mensaje.Body.Text := sMensaje;

    Mensaje.Recipients.Add;
    //Usuario Destino
    Mensaje.Recipients.Items[0].Address := sDestino;
    // Si hay que meter un archivo adjunto lo creamos y lo asignamos al
    //mensaje
    if sAdjunto <> '' then
    begin
      if FileExists( sAdjunto ) then
         Adjunto := TIdAttachmentFile.Create( Mensaje.MessageParts, sAdjunto);
    end
    else
      Adjunto := nil;

    if sAdjunto1 <> '' then
    begin
      if FileExists( sAdjunto1 ) then
           Adjunto1 := TIdAttachmentFile.Create( Mensaje.MessageParts, sAdjunto1);
    end
    else
      Adjunto1 := nil;

   // Conectamos con el servidor SMTP
    try
      SMTP.Connect;
    except
      on E : Exception Do
        raise Exception.Create( 'Error al conectar con el servidor.' );
    end;
    // Si ha conectado enviamos el mensaje y desconectamos
    if SMTP.Connected then
    begin
    try
      SMTP.Send( Mensaje );
    except
      on E :Exception do
        raise Exception.Create( 'Error al enviar el mensaje. '+E.Message );
    end;
    try
      SMTP.Disconnect;
    except
      raise Exception.Create( 'Error al desconectar del servidor.' );
    end;
    end;
    // Liberamos los objetos creados
    if Adjunto <> nil then FreeAndNil( Adjunto );
    if Adjunto1 <> nil then FreeAndNil( Adjunto1 );
    FreeAndNil( Mensaje );
    FreeAndNil( SMTP );
//    Application.MessageBox( 'Mensaje enviado correctamente.',
//    'Fin de proceso',MB_ICONINFORMATION );
end;

//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************

end.
