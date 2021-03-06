unit dm_Login;

interface

uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, frm_Login,
  ZAbstractDataset, ZDataset, Forms, Controls, Dialogs, UToolsStrings,
  RegExpr, Menus, ActnList, IniFiles, IWApplication, ActnMan ,
  ZAbstractConnection;

type
  TUserData = Class (TObject)
  Private
    FLoginUser: String;
    FPassUser: String;
    FNameUser: String;
    FTypeId: String;
    FIdentification: String;
    FMailUser: String;
  Public
    Property LoginUser : String Read FLoginUser Write FLoginUser;
    Property PassUser :String Read FPassUser Write FPassUser;
    Property NameUser : String Read FNameUser Write FNameUser;
    Property TypeId : String Read FTypeId Write FTypeId;
    Property Identification : String Read FIdentification Write FIdentification;
    Property MailUser : String Read FMailUser Write FMailUser;
  End;

  TRestrictions = Class (TObject)
  Public
    ActionName : String;
    Modulo : String;
    Constructor Create(ActName, ModAction : String);
  End;

  TdmLogin = class(TDataModule)
    qryLogin: TZQuery;
    dbManagerUser: TZConnection;
    qryConsultas: TZQuery;
    qryParams: TZQuery;
    qryChangePass: TZQuery;
    qryValidPass: TZQuery;
    qryPermitsApps: TZQuery;
    qryFindApplication: TZQuery;
    qryRestrictions: TZQuery;
    qryDisabledUser: TZQuery;
    qryInsertAuditTrack: TZQuery;
    qryListUsersHabilitados: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetNameLogin: String;
    function GetPassUser: String;
    function GetNameUser: String;
    function GetTypeId: String;
    function GetNumIdentification: String;
    function GetMailUser: String;
    function GetVersion: String;
    Function ValideLogin(Log, Pass : String; GetMessage : Boolean = True) : Integer;
    Function OpenUser(Log, Pass : String) : Boolean;
    Function PassVencimiento(Actual, LastChange : TDate) : Boolean;
    Procedure ChangePass(NewPass, User : String);
    Function PassValid(Pass : String; GetMessage : Boolean = True) : Boolean;
    Function FindApplication(App, Version : String; GetMessage : Boolean = True) : Boolean;
    Procedure InsertAuditTrack(ALogin, AClave, ALogState, AApplication : String);
    Procedure OpenListUserActivs(App, Act : String);
    { Private declarations }
  public
    Property NameLogin : String Read GetNameLogin;
    Property PassUser : String Read GetPassUser;
    Property NameUser : String Read GetNameUser;
    Property TypeId : String Read GetTypeId;
    Property MailUser : String Read GetMailUser;
    Property NumIdentification : String Read GetNumIdentification;
    Property Version : String Read GetVersion;
    Procedure Login(NameApp, Title, Version : String);
    Function LoginWeb(NameApp, Version, Login, Pass : String) : Integer;
    Procedure LoadRestrictions(List : TStringList);
    Function PermitsApp : Boolean;
    Procedure DisabledUser(LogUser : String);
    Function ChangePassWeb(NewPass, ConfPass : String) : String;
    Procedure ListarUserActivos(List : Tstrings; App, Act : String);

    { Public declarations }
  end;

  function ExeLogin(NameApp, Title, Version : string; UserData : TUserData = Nil; Restrictions : TStringList = Nil):Boolean;
  Procedure RestrictionsMenus(Actions: TActionManager; Modulo: String; Restrictions : TStringlist; Menu : TMainMenu = Nil);
  Procedure CreateFileActions(Actions: TActionList; Modulo, FileName : String);
  Function GetRestrictions(Modulo : String; Restrictions : TStrings) : String;
  Function SetRestrictions(Usuario, CadRestriction : String; Restrictions : TStrings) : Boolean;
  Procedure ListaUsers(List : TStrings; App, Act : String);



var
  dmLogin: TdmLogin;

implementation

{$R *.dfm}

procedure TdmLogin.ChangePass(NewPass, User : String);
begin
  With qryChangePass Do
  Begin
    Close;
    ParamByName('newpass').AsString := NewPass;
    ParamByName('User').AsString := User;
    ExecSQL;
  End;
end;

function TdmLogin.FindApplication(App, Version: String; GetMessage : Boolean): Boolean;
begin
  Result := True;
  With qryFindApplication do
  Begin
    Close;
    ParamByName('App').AsString := App;
    Open;
    if IsEmpty then
    Begin
      Result := False;
      if GetMessage then
        MessageDlg(Format('La Aplicación %s No Existe! ..', [App]), mtWarning, [mbOK], 0);
      Exit;
    End;
    if CompareText(Version, FieldByName('Version').AsString) <> 0 then
    Begin
      Result := False;
      if GetMessage then
        MessageDlg(Format('Existe Una Versión(%s) Actual Diferente Del Aplicativo %s! ..', [Version, App]), mtWarning, [mbOK], 0);
      Exit;
    End;
  End;
end;

function TdmLogin.GetMailUser: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := qryLogin.FieldByName('MailUser').AsString;
end;

function TdmLogin.GetNameLogin: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := qryLogin.FieldByName('LoginUser').AsString;
end;

function TdmLogin.GetNameUser: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := Format('%s %s', [qryLogin.FieldByName('FirstName').AsString, qryLogin.FieldByName('LastName').AsString]);
end;

function TdmLogin.GetNumIdentification: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := qryLogin.FieldByName('Num_Identification').AsString;
end;

function TdmLogin.GetPassUser: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := qryLogin.FieldByName('LoginUser').AsString;
end;

function TdmLogin.GetTypeId: String;
begin
  Result := '';
  if Not qryLogin.IsEmpty then
   Result := qryLogin.FieldByName('TypeIdent').AsString;
end;

function TdmLogin.GetVersion: String;
begin
  Result := '';
  if Not qryFindApplication.IsEmpty then
   Result := qryFindApplication.FieldByName('Version').AsString;
end;

procedure TdmLogin.InsertAuditTrack(ALogin, AClave, ALogState,
  AApplication: String);
begin
  With qryInsertAuditTrack Do
  Begin
    Close;
    ParamByName('loginuser').AsString := ALogin;
    ParamByName('passuser').AsString := AClave;
    ParamByName('id_logestate').AsString := ALogState;
    ParamByName('id_application').AsString := AApplication;
    ExecSQL;
  End;
end;

function TdmLogin.ChangePassWeb(NewPass, ConfPass: String): String;
begin
  Result := '';
  if CompareText(NewPass, ConfPass) = 0 then
  Begin
    if PassValid(NewPass, False) then
    Begin
      ChangePass(NewPass, qryLogin.FieldByName('Id_User').AsString);
    End
    Else
      Result := Format('%s! ..', [qryValidPass.FieldByName('Message').AsString]);
  End
  Else
    Result := 'No Coincide La Nueva Contraseña Con La Verificación! ..';
end;

procedure TdmLogin.DataModuleCreate(Sender: TObject);
Var
  IniTemp : Tinifile;
  NameFile : String;
begin
  With dbManagerUser Do
  Begin
    Connected := False;
    NameFile := ChangeExtFile(Application.ExeName, 'tmd');
    if FileExists(NameFile) then
    Begin
      IniTemp := TIniFile.Create(NameFile);
      if IniTemp.ReadString(QuitExtFile(ExtractFileName(Application.ExeName)), 'Host', '') <> '' then
      Begin
        HostName := IniTemp.ReadString(QuitExtFile(ExtractFileName(Application.ExeName)), 'Host', '');
        Port := IniTemp.ReadInteger(QuitExtFile(ExtractFileName(Application.ExeName)), 'Port', 0);
      End;
      FreeAndNil(IniTemp);
    End;
    Connected := True;
  End;
end;

procedure TdmLogin.DisabledUser(LogUser: String);
begin
  With qryDisabledUser Do
  Begin
    Close;
    ParamByName('User').AsString := LogUser;
    ExecSQL;
  End;
end;

procedure TdmLogin.ListarUserActivos(List: Tstrings; App, Act: String);
begin
  List.Clear;
  OpenListUserActivs(App, Act);
  With qryListUsersHabilitados Do
  Begin
    While Not Eof do
    Begin
      List.Add(Format('%s-%s %s', [FieldByName('loginuser').AsString, FieldByName('firstname').AsString, FieldByName('lastname').AsString]));
      Next;
    End;
  End;
end;

procedure TdmLogin.LoadRestrictions(List: TStringList);
begin
  if Assigned(List) then
  Begin
    List.Clear;
    With qryRestrictions Do
    Begin
      Close;
      ParamByName('IdxApp').AsString := qryFindApplication.FieldByName('Id_Application').AsString;
      ParamByName('IdxProfile').AsString := qryPermitsApps.FieldByName('Id_Profile').AsString;
      Open;
      First;
      While not Eof Do
      Begin
        List.AddObject(Format('%s-%s',[FieldByName('Name_Action').AsString, FieldByName('Modulo').AsString]), TRestrictions.Create(FieldByName('Name_Action').AsString, FieldByName('Modulo').AsString));
        Next;
      End;
      Close;
    End;
  End;
end;

procedure TdmLogin.Login(NameApp, Title, Version : String);
Var
  fLogin : TfrmLogin;
  Connect : Boolean;
  Intentos : Integer;
  CountFallidos : Integer;
  LogFallido : String;
begin
  If Not FindApplication(NameApp, Version) Then
  Begin
    Application.Terminate;
  End;
  Connect := False;
  Intentos := 0;
  CountFallidos := 0;
  fLogin := TfrmLogin.Create(Self);
  fLogin.Caption := Format(' [ Acceso Unico %s ] ', [Title]);
  while ((Intentos < 3) and (not Connect)) do
  Begin
    Inc(Intentos);
    if fLogin.ShowModal in [mrOk] then
    Begin
      if CompareText(LogFallido, fLogin.Log) <> 0 then
      Begin
        LogFallido := fLogin.Log;
        CountFallidos := 1;
      End
      else
        Inc(CountFallidos);
      if fLogin.edtLogin.Enabled then
      Begin
        case ValideLogin(fLogin.Log, fLogin.Pass) of
          -1: Connect := True;
          1 : Begin
                fLogin.ViewNewPass;
                Intentos := 1;
              End;
          2 : Begin
                Break;
              End;
        end;
      End
      else
      Begin
        Intentos := 1;
        if CompareText(fLogin.NewPass, fLogin.ConfirmPass) = 0 then
        Begin
          if PassValid(fLogin.NewPass) then
          Begin
            ChangePass(fLogin.NewPass, qryLogin.FieldByName('Id_User').AsString);
            Connect := True;
          End;
        End
        Else
          MessageDlg('No Coincide La Nueva Contraseña Con La Verificación! ..', mtWarning, [mbOK], 0);
      End;
    End
    else
      Break;
 End;
 FreeAndNil(fLogin);
 if not Connect then
 Begin
   if CountFallidos = 3 then
     DisabledUser(LogFallido);
   Application.Terminate;
 End;
end;


function TdmLogin.LoginWeb(NameApp, Version, Login, Pass: String): Integer;
begin
  Result := -1; //Version De La Aplicacion No Actualizada
  If Not FindApplication(NameApp, Version, False) Then
    Exit;
  case ValideLogin(Login, Pass, False) of
    -1: Result := 0; //Conexion Exitosa
    0 : Result := 1; //Login o Usuario No Valido
    1 : Result := 2; //Debe Cambiar el Password
    2 : Result := 3; //Usuario Inhabilitado por el sistema
    3 : Result := 4; //Usuario Sin Permisos Para Esta Aplicacion
  end;
end;

procedure TdmLogin.OpenListUserActivs(App, Act: String);
begin
  if not dbManagerUser.Connected then
    dbManagerUser.Connect;
  With qryListUsersHabilitados Do
  Begin
    Close;
    ParamByName('act').AsString := Act;
    ParamByName('app').AsString := App;
    Open;
  End;
end;

Function TdmLogin.OpenUser(Log, Pass: String) : Boolean;
begin
  if not dbManagerUser.Connected then
    dbManagerUser.Connect;
  With qryLogin Do
  Begin
    Close;
    ParamByName('Login').AsString := Log;
    ParamByName('Pass').AsString := Pass;
    Open;
    Result := not IsEmpty;
  End;
end;

function TdmLogin.PassValid(Pass: String; GetMessage : Boolean): Boolean;
Var
  ExpValid : TRegExpr;
  CadTmp : String;
begin
  Result := True;
  ExpValid := TRegExpr.Create;
  With qryValidPass Do
  Begin
    Close;
    Open;
    First;
    While Not Eof do
    Begin
      ExpValid.Expression := FieldByName('expreg').AsString;
      ExpValid.Exec(Pass);
      CadTmp := ExpValid.Match[0];
      if CompareText(FieldByName('must').AsString, 'T') = 0 then
      Begin
        if CompareText(CadTmp, '') = 0 then
          Result := False;
      End
      Else
      begin
        if CompareText(CadTmp, '') <> 0 then
          Result := False;
      end;
      If Not Result then
      Begin
        if GetMessage then
          MessageDlg(FieldByName('Message').AsString, mtWarning, [mbOK], 0);
        Break;
      End;
      Next;
    End;
  End;
  FreeAndNil(ExpValid);
  if Result then
  Begin
    if ContainSucesivos(Pass) then
    Begin
      Result := False;
      MessageDlg('El Password No Puede Contener Caracteres Iguales Seguidos! ..', mtWarning, [mbOK], 0);
      Exit;
    End;
  End;
end;

function TdmLogin.PassVencimiento(Actual, LastChange: TDate): Boolean;
begin
  qryParams.Close;
  qryParams.Open;
  if NumDaysBeetween(Actual, LastChange) > qryParams.FieldByName('beatdaypass').AsInteger then
    Result := True
  else
    Result := False;
end;

function TdmLogin.PermitsApp: Boolean;
begin
  With qryPermitsApps Do
  Begin
    Close;
    ParamByName('User').AsString := qryLogin.FieldByName('Id_user').AsString;
    ParamByName('Application').AsString := qryFindApplication.FieldByName('Id_Application').AsString;
    Open;
    Result := Not IsEmpty;
  End;
end;

Function TdmLogin.ValideLogin(Log, Pass: String; GetMessage : Boolean) : Integer;
begin
  Result := -1;
  if not OpenUser(Log, Pass) then
  Begin
    Result := 0;
    InsertAuditTrack(Log, Pass, '2', qryFindApplication.FieldByName('Id_Application').AsString);
    if GetMessage then
      MessageDlg('El Usuario O La Contraseña No Son Validos! ..', mtWarning, [mbOK], 0);
  End
  else
  if CompareText(qryLogin.FieldByName('Disabled').AsString, 'F') <> 0 then
  Begin
    Result := 2;
    InsertAuditTrack(Log, Pass, '4', qryFindApplication.FieldByName('Id_Application').AsString);
    if GetMessage then
      MessageDlg('El Usuario Se Encuentra Inhabilitado Por El Sistema! ..', mtWarning, [mbOK], 0);
  End
  else
  if Not PermitsApp then
  Begin
    Result := 0;
    InsertAuditTrack(Log, Pass, '5', qryFindApplication.FieldByName('Id_Application').AsString);
    if GetMessage then
      MessageDlg('El Usuario No Tiene Permisos Para Esta Aplicación! ..', mtWarning, [mbOK], 0)
    else
      Result := 3;
  End
  else
  if Not PassValid(Pass, GetMessage) then
  Begin
    Result := 1;
    InsertAuditTrack(Log, Pass, '6', qryFindApplication.FieldByName('Id_Application').AsString);
    if GetMessage then
      MessageDlg('La Contraseña No Cumple Con Las Reglas, Debe Cambiarla! ..', mtWarning, [mbOK], 0)
  End
  else
  Begin
    With qryLogin Do
    Begin
      if PassVencimiento(FieldByName('dateserver').AsDateTime, FieldByName('datelastupd').AsDateTime) then
      Begin
        Result := 1;
        InsertAuditTrack(Log, Pass, '3', qryFindApplication.FieldByName('Id_Application').AsString);
        if GetMessage then
          MessageDlg('La Contraseña Del Usuario A Vencido, Debe Cambiarla! ..', mtWarning, [mbOK], 0)
      End
      else
        InsertAuditTrack(Log, Pass, '1', qryFindApplication.FieldByName('Id_Application').AsString);
    End;
  End;
end;

function ExeLogin(NameApp, Title, Version : string; UserData : TUserData; Restrictions : TStringList):Boolean;
Begin
  Result := False;
  if not Assigned(dmLogin) then
    Application.CreateForm(TdmLogin, dmLogin);
  try
    dmLogin.Login(NameApp, Title, Version);
    With dmLogin do
    Begin
      if Not qryLogin.IsEmpty then
      Begin
        if Assigned(UserData) then
        Begin
          UserData.LoginUser := NameLogin;
          UserData.PassUser := PassUser;
          UserData.NameUser := NameUser;
          UserData.TypeId := TypeId;
          UserData.Identification := NumIdentification;
          UserData.MailUser := MailUser;
        End;
        dmLogin.LoadRestrictions(Restrictions);
        Result := True;
      End;
    End;
    if Assigned(dmLogin) then
    begin
      FreeAndNil(dmLogin);
    end;
  Except
    Application.Terminate;
  end;
End;

Procedure  RestrictionsMenus(Actions: TActionManager; Modulo: String; Restrictions : TStringlist; Menu : TMainMenu);
Var
 I, J : Integer;
 Sw : Boolean;
begin
  for I := 0 to Pred(Actions.ActionCount) do
  Begin
    if Restrictions.IndexOf(Format('%s-%s',[TAction(Actions.Actions[I]).Name, Modulo])) <> -1 then
    Begin
      TAction(Actions.Actions[I]).Enabled := False;
      TAction(Actions.Actions[I]).Visible := False;
    End;
  End;
  if Assigned(Menu) then
  Begin
    For I := 0 To Pred(Menu.Items.Count) Do
    Begin
      Sw := False;
      for J := 0 to Pred(Menu.Items[I].Count) do
      Begin
        if Menu.Items[I].Items[J].Visible then
        Begin
          Sw := True;
          Break;
        End;
      End;
      Menu.Items[I].Visible := Sw or Assigned(Menu.Items[I].Action);
    End;
  End;
End;

  Procedure CreateFileActions(Actions: TActionList; Modulo, FileName : String);
  Var
    I : Integer;
    FileExit : TextFile;
    Line : String;
  Begin
    AssignFile(FileExit, FileName);
    Rewrite(FileExit);
    for I := 0 to Pred(Actions.ActionCount) do
    begin
      Line := Format('%s;%s;%s', [Actions.Actions[I].Name, Modulo, TAction(Actions.Actions[I]).Caption]);
      Writeln(FileExit, Line);
    end;
    Close(FileExit);
  End;

  Function GetRestrictions(Modulo : String; Restrictions : TStrings) : String;
  Var
    I : Integer;
  Begin
    Result := '';
    for I := 0 to Pred(Restrictions.Count) do
    begin
      if CompareText(Modulo, TRestrictions(Restrictions.Objects[I]).Modulo) = 0 then
      Begin
        if CompareText(Result, '') = 0 then
          Result := Restrictions[I]
        else
          Result := Format('%s;%s', [Result, Restrictions[I]]);
      End;
    end;
  End;

  Function SetRestrictions(Usuario, CadRestriction : String; Restrictions : TStrings) : Boolean;
  Var
   I : Integer;
   Tmp : TStringList;
  Begin
    Result := True;
    Restrictions.Clear;
    if CompareText(Usuario, '') <> 0 then
    Begin
      Tmp := TStringList.Create;
      DestroyCad(CadRestriction, ';', Tmp);
      for I := 0 to Pred(Tmp.Count) do
        Restrictions.AddObject(Tmp[I], TRestrictions.Create(Copy(Tmp[I], 1, Pos('-', Tmp[I])-1), Copy(Tmp[I], Pos('-', Tmp[I])-1, Length(Tmp[I]))));
       FreeAndNil(Tmp);
    End
    Else
      Result := False;
  End;

  Procedure ListaUsers(List : TStrings; App, Act : String);
  Var
    DataLogin : TdmLogin;
  Begin
    DataLogin := TdmLogin.Create(Nil);
    DataLogin.ListarUserActivos(List, App, Act);
    FreeAndNil(DataLogin);
  End;

{ TRestrictions }

constructor TRestrictions.Create(ActName, ModAction: String);
begin
  ActionName := ActName;
  Modulo := ModAction;
end;

end.
