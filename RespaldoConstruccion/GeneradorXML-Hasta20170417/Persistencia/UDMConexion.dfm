object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 113
  Width = 130
  object ZConexion: TZConnection
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
    Protocol = 'postgresql-7'
    Left = 51
    Top = 33
  end
end
