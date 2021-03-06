object dmLogin: TdmLogin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 263
  Width = 338
  object qryLogin: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select '
      'mu_users.id_user, '
      'mu_users.loginuser, '
      'mu_users.passuser, '
      'mu_users.lastname, '
      'mu_users.firstname, '
      'mu_typeidents.typeident,'
      'mu_users.num_identification,'
      'mu_users.datelastupd, '
      'current_timestamp as dateserver,'
      'mu_users.mailuser,'
      'mu_users.disabled'
      'from mu_users'
      
        'inner join mu_typeidents on (mu_users.id_typeident = mu_typeiden' +
        'ts.id_typeident)'
      'where (loginuser = :login)'
      'and (passuser = md5(:pass))')
    Params = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptUnknown
      end>
  end
  object dbManagerUser: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    Catalog = ''
    HostName = '172.17.4.28'
    Port = 5432
    Database = 'manageruser'
    User = 'pgdba'
    Password = 'mtipgsis01'
    Protocol = 'postgresql-7'
    Left = 24
    Top = 24
  end
  object qryConsultas: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select codigo, contrasena, nombre, tipusu from davusuarios'
      'where codigo = :login')
    Params = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptUnknown
      end>
  end
  object qryParams: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select beatdaypass from mu_params')
    Params = <>
    Left = 21
    Top = 76
  end
  object qryChangePass: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'update mu_users set '
      'passuser = md5(:newpass), '
      'datelastupd = Now()'
      'where id_user = :user')
    Params = <
      item
        DataType = ftUnknown
        Name = 'newpass'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'newpass'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryValidPass: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select expreg, must, message from mu_validepass')
    Params = <>
    Left = 112
    Top = 136
  end
  object qryPermitsApps: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      
        'select mu_userapps.id_userapp, mu_userapps.id_profile from mu_us' +
        'erapps'
      'where (mu_userapps.id_user = :user)'
      'and (mu_userapps.id_application = :application)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'application'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'application'
        ParamType = ptUnknown
      end>
  end
  object qryFindApplication: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select id_application, version from mu_applications'
      'where (application = :app)'
      'and (activ = '#39'T'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'app'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'app'
        ParamType = ptUnknown
      end>
  end
  object qryRestrictions: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      
        'select mu_restrictions.id_profile, mu_options.name_action, mu_op' +
        'tions.modulo from mu_restrictions'
      
        'inner join mu_options on (mu_restrictions.id_option = mu_options' +
        '.id_option)'
      'where (mu_options.id_application = :idxapp)'
      'and (mu_restrictions.id_profile = :idxprofile)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idxapp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idxprofile'
        ParamType = ptUnknown
      end>
    MasterFields = 'id_profile'
    LinkedFields = 'id_profile'
    Left = 272
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idxapp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idxprofile'
        ParamType = ptUnknown
      end>
  end
  object qryDisabledUser: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'update mu_users set disabled = '#39'T'#39' where loginuser = :user')
    Params = <
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryInsertAuditTrack: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      
        'insert into mu_audittracks(loginuser, passuser, id_logestate, id' +
        '_application)'
      
        'values (:loginuser, md5(:passuser), :id_logestate, :id_applicati' +
        'on)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'loginuser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'passuser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_logestate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_application'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'loginuser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'passuser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_logestate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_application'
        ParamType = ptUnknown
      end>
  end
  object qryListUsersHabilitados: TZQuery
    Connection = dbManagerUser
    SQL.Strings = (
      'select distinct u.loginuser, u.lastname, u.firstname '
      'from mu_users u'
      'inner join mu_userapps ua on (u.id_user = ua.id_user)'
      'where (ua.id_profile not in '
      '(select distinct p.id_profile from mu_profiles p'
      'inner join mu_restrictions r on (p.id_profile = r.id_profile)'
      'inner join mu_options o on (r.id_option = o.id_option) '
      'where (o.name_action = :act)))'
      
        'and (ua.id_application = (select id_application from mu_applicat' +
        'ions where application = :app))')
    Params = <
      item
        DataType = ftUnknown
        Name = 'act'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'act'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'app'
        ParamType = ptUnknown
      end>
  end
end
