object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 248
  object ZConexion: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    ClientCodepage = 'LATIN9'
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=ON'
      'codepage=LATIN9')
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'postgresql-9'
    Left = 93
    Top = 28
  end
  object conBDANI: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    ClientCodepage = 'LATIN9'
    Catalog = ''
    Properties.Strings = (
      'codepage=LATIN9')
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'postgresql-9'
    Left = 93
    Top = 84
  end
end
