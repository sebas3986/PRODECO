object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 119
  Width = 178
  object ZConexion: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    ClientCodepage = 'LATIN9'
    Catalog = ''
    Properties.Strings = (
      'codepage=LATIN9'
      'AutoEncodeStrings=ON'
      'controls_cp=CP_UTF16')
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'postgresql-9'
    Left = 75
    Top = 38
  end
end
