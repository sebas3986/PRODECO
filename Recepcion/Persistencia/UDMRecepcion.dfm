object DMRecepcion: TDMRecepcion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 529
  Width = 952
  object ZQSerieDocumental: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 46
    Top = 28
  end
  object cdsSerieDocumental: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSerieDocumental'
    Left = 155
    Top = 81
    object intgrfldSerieDocumentalidSerieDocumental: TIntegerField
      FieldName = 'idSerieDocumental'
    end
    object strngfldSerieDocumentaldescripcionseriedocumental: TStringField
      FieldName = 'DescripcionSerieDocumental'
      Size = 100
    end
    object strngfldSerieDocumentalDescripcionTipoSerieDocumental: TStringField
      FieldName = 'DescripcionTipoSerieDocumental'
    end
  end
  object dspSerieDocumental: TDataSetProvider
    DataSet = ZQSerieDocumental
    Left = 151
    Top = 28
  end
  object dsSerieDocumental: TDataSource
    DataSet = cdsSerieDocumental
    Left = 47
    Top = 81
  end
  object ZQCaja: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 59
    Top = 267
  end
  object ZQSubSerie: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 56
    Top = 148
  end
  object dsSubSerie: TDataSource
    DataSet = cdsSubSerie
    Left = 57
    Top = 202
  end
  object cdsSubSerie: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubSerie'
    Left = 132
    Top = 201
    object intgrfldSubSerieidSerieSubSerie: TIntegerField
      FieldName = 'idSerieSubSerie'
    end
    object intgrfldSubSerieidTipoCarpeta: TIntegerField
      FieldName = 'idTipoCarpeta'
    end
    object strngfldSubSerieDescripcionTipoCarpeta: TStringField
      FieldName = 'DescripcionTipoCarpeta'
      Size = 100
    end
    object intgrfldSubSerieCantidadDivisiones: TIntegerField
      FieldName = 'CantidadDivisiones'
    end
    object intgrfldSubSerieidSerieDocumental: TIntegerField
      FieldName = 'idSerieDocumental'
    end
    object intgrfldSubSerieidSubSerieDocumental: TIntegerField
      FieldName = 'idSubSerieDocumental'
    end
    object cdsSubSerieDescripcionSubSerieDocumental: TStringField
      FieldName = 'DescripcionSubSerieDocumental'
      Size = 100
    end
    object cdsSubSerieCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
  end
  object dspSubSerie: TDataSetProvider
    DataSet = cdsSubSerie
    Left = 128
    Top = 148
  end
  object cdsCaja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaja'
    Left = 137
    Top = 331
    object intgrfldCajaidCaja: TIntegerField
      FieldName = 'idCaja'
    end
    object strngfldCajaCodigoCaja: TStringField
      FieldName = 'CodigoCaja'
      Size = 4
    end
    object strngfldCajaPrecintoUno: TStringField
      FieldName = 'PrecintoUno'
      Size = 15
    end
    object strngfldCajaPrecintoDos: TStringField
      FieldName = 'PrecintoDos'
      Size = 15
    end
    object cdsCajaCerrada: TBooleanField
      FieldName = 'Cerrada'
    end
    object strngfldCajaCodigoMCaja: TStringField
      DisplayWidth = 10
      FieldName = 'CodigoMCaja'
      Size = 10
    end
    object cdsCajaFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object cdsCajacodPreImpreso: TStringField
      FieldName = 'codPreImpreso'
      Size = 10
    end
  end
  object dsCaja: TDataSource
    DataSet = cdsCaja
    Left = 61
    Top = 328
  end
  object dspCaja: TDataSetProvider
    DataSet = ZQCaja
    Left = 135
    Top = 267
  end
  object ZQCarpeta: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 271
    Top = 29
  end
  object dsCarpeta: TDataSource
    DataSet = cdsCarpeta
    Left = 273
    Top = 81
  end
  object cdsCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarpeta'
    Left = 351
    Top = 80
    object intgrfldCarpetaidCarpeta: TIntegerField
      FieldName = 'idCarpeta'
    end
    object cdsCarpetaidSerieDocumental: TIntegerField
      FieldName = 'idSerieDocumental'
    end
    object intgrfldCarpetaSecuenciaCarpeta: TIntegerField
      FieldName = 'SecuenciaCarpeta'
    end
    object strngfldCarpetaCodigoCarpeta: TStringField
      DisplayWidth = 20
      FieldName = 'CodigoCarpeta'
    end
    object strngfldCarpetaCodigoMCarpeta: TStringField
      DisplayWidth = 20
      FieldName = 'CodigoMCarpeta'
    end
    object cdsCarpetaSecuenciaClase: TIntegerField
      FieldName = 'SecuenciaClase'
    end
    object cdsCarpetaClaseCarpeta: TStringField
      FieldName = 'ClaseCarpeta'
      Size = 2
    end
  end
  object dspCarpeta: TDataSetProvider
    DataSet = cdsCarpeta
    Left = 347
    Top = 29
  end
  object ZQCarpetaAleta: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 270
    Top = 144
  end
  object dsCarpetaAleta: TDataSource
    DataSet = cdsCarpetaAleta
    Left = 273
    Top = 207
  end
  object cdsCarpetaAleta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarpetaAleta'
    Left = 358
    Top = 206
    object intgrfldCarpetaAletaidCarpeta: TIntegerField
      FieldName = 'idCarpeta'
    end
    object intgrfldCarpetaAletaidSerieSubSerie: TIntegerField
      FieldName = 'idSerieSubSerie'
    end
    object strngfldCarpetaAletaCodigoCarpetaAleta: TStringField
      FieldName = 'CodigoCarpetaAleta'
      Size = 10
    end
    object intgrfldCarpetaAletaCantidadFolios: TIntegerField
      FieldName = 'CantidadFolios'
    end
    object strngfldCarpetaAletaCodigoMCarpetaAleta: TStringField
      DisplayWidth = 16
      FieldName = 'CodigoMCarpetaAleta'
      Size = 16
    end
  end
  object dspCarpetaAleta: TDataSetProvider
    DataSet = ZQCarpetaAleta
    Left = 356
    Top = 145
  end
  object dsCarpetasRadicadas: TDataSource
    DataSet = cdsCarpetasRadicadas
    Left = 249
    Top = 329
  end
  object cdsCarpetasRadicadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarpetasRadicadas'
    Left = 369
    Top = 328
    object intgrfldCarpetasRadicadasTotalFolios: TIntegerField
      FieldName = 'TotalFolios'
    end
    object intgrfldCarpetasRadicadasidCaja: TIntegerField
      FieldName = 'idCaja'
    end
    object intgrfldCarpetasRadicadasidCarpeta: TIntegerField
      FieldName = 'idCarpeta'
    end
    object strngfldCarpetasRadicadasCodigoCaja: TStringField
      DisplayWidth = 4
      FieldName = 'CodigoCaja'
      Size = 4
    end
    object strngfldCarpetasRadicadasCodigoCarpeta: TStringField
      FieldName = 'CodigoCarpeta'
      Size = 8
    end
    object cdsCarpetasRadicadasObraCivil: TBooleanField
      FieldName = 'ObraCivil'
      DisplayValues = 'SI;NO'
    end
    object strngfldCarpetasRadicadasPrecintoUno: TStringField
      FieldName = 'PrecintoUno'
      Size = 15
    end
    object strngfldCarpetasRadicadasPrecintoDos: TStringField
      FieldName = 'PrecintoDos'
      Size = 15
    end
    object cdsCarpetasRadicadasFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object cdsCarpetasRadicadascodPreimpreso: TStringField
      FieldName = 'codPreimpreso'
    end
  end
  object dspCarpetasRadicadas: TDataSetProvider
    DataSet = ZQCarpetasRadicadas
    Left = 364
    Top = 267
  end
  object ZQCarpetasRadicadas: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 246
    Top = 268
  end
  object ZQCantidadFolios: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 462
    Top = 26
  end
  object dsCantidadFolios: TDataSource
    DataSet = ZQCantidadFolios
    Left = 464
    Top = 82
  end
  object cdsCantidadFolios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCantidadFolios'
    Left = 572
    Top = 81
    object intgrfldCantidadFoliosTotalFolios: TIntegerField
      FieldName = 'TotalFolios'
    end
  end
  object dspCantidadFolios: TDataSetProvider
    DataSet = ZQCantidadFolios
    Left = 567
    Top = 26
  end
  object fdbSticker: TfrxDBDataset
    UserName = 'frxDBDCaja'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PrecintoUno=PrecintoUno'
      'CodigoMCaja=CodigoMCaja')
    DataSet = cdsStickerCaja
    BCDToCurrency = False
    Left = 559
    Top = 155
  end
  object frxSticker: TfrxReport
    Version = '4.12.13'
    DataSet = fdbSticker
    DataSetName = 'frxDBDCaja'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42323.709064317100000000
    ReportOptions.LastChange = 42339.701875682900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 477
    Top = 156
    Datasets = <
      item
        DataSet = fdbSticker
        DataSetName = 'frxDBDCaja'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 1.500000000000000000
      BottomMargin = 10.000000000000000000
      object BarCode1: TfrxBarCodeView
        Left = 0.842563500000000000
        Top = 13.456710000000000000
        Width = 123.000000000000000000
        Height = 39.685039370000000000
        ShowHint = False
        BarType = bcCode128A
        DataField = 'CodigoMCaja'
        DataSet = fdbSticker
        DataSetName = 'frxDBDCaja'
        Rotation = 0
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo1: TfrxMemoView
        Left = 1.779530000000000000
        Top = 1.779530000000000000
        Width = 147.401670000000000000
        Height = 11.338590000000000000
        ShowHint = False
        DataField = 'PrecintoUno'
        DataSet = fdbSticker
        DataSetName = 'frxDBDCaja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        LineSpacing = 1.000000000000000000
        Memo.UTF8W = (
          '[frxDBDCaja."PrecintoUno"]')
        ParentFont = False
      end
    end
  end
  object fdbCarpeta: TfrxDBDataset
    UserName = 'frxDBCarpeta'
    CloseDataSource = False
    DataSet = cdsCarpeta
    BCDToCurrency = False
    Left = 560
    Top = 217
  end
  object frxCarpeta: TfrxReport
    Version = '4.12.13'
    DataSet = fdbCarpeta
    DataSetName = 'frxDBCarpeta'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42325.418634247700000000
    ReportOptions.LastChange = 42824.600002523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 474
    Top = 216
    Datasets = <
      item
        DataSet = fdbCarpeta
        DataSetName = 'frxDBCarpeta'
      end
      item
        DataSet = fdbSerieDocumental
        DataSetName = 'frxDBDSerieDocumental'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 1.500000000000000000
      BottomMargin = 10.000000000000000000
      object BarCode1: TfrxBarCodeView
        Left = 2.000000000000000000
        Top = 12.183364290000000000
        Width = 123.000000000000000000
        Height = 22.677165350000000000
        ShowHint = False
        BarType = bcCode128A
        DataField = 'CodigoCarpeta'
        DataSet = fdbCarpeta
        DataSetName = 'frxDBCarpeta'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
      end
      object frxDBDSerieDocumentalDescripcionSerieDocumental: TfrxMemoView
        Left = 2.000000000000000000
        Top = 0.779530000000000000
        Width = 226.771800000000000000
        Height = 11.338590000000000000
        ShowHint = False
        DataField = 'DescripcionSerieDocumental'
        DataSet = fdbSerieDocumental
        DataSetName = 'frxDBDSerieDocumental'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDSerieDocumental."DescripcionSerieDocumental"]')
        ParentFont = False
      end
      object Memo1: TfrxMemoView
        Left = 11.559060000000000000
        Top = 36.133890000000000000
        Width = 200.315090000000000000
        Height = 15.118120000000000000
        ShowHint = False
        DataField = 'CodigoMCarpeta'
        DataSet = fdbCarpeta
        DataSetName = 'frxDBCarpeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBCarpeta."CodigoMCarpeta"]')
        ParentFont = False
      end
    end
  end
  object frxCarpetaAleta: TfrxReport
    Version = '4.12.13'
    DataSetName = 'frxDBDCarpetaAleta'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42325.430021620400000000
    ReportOptions.LastChange = 42802.667502384260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 473
    Top = 285
    Datasets = <
      item
        DataSet = fdbSerieSubSerie
        DataSetName = 'frxDBDSerieSubSerie'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 5.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 1.500000000000000000
      BottomMargin = 10.000000000000000000
      object BarCode1: TfrxBarCodeView
        Top = 12.677180000000000000
        Width = 123.000000000000000000
        Height = 26.456692910000000000
        ShowHint = False
        BarType = bcCode128A
        DataField = 'CodigoMCarpetaAleta'
        DataSet = fdbSerieSubSerie
        DataSetName = 'frxDBDSerieSubSerie'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo1: TfrxMemoView
        Left = -1.000000000000000000
        Top = 0.779527560000000000
        Width = 241.889920000000000000
        Height = 11.338590000000000000
        ShowHint = False
        DataField = 'DescripcionSubSerieDocumental'
        DataSet = fdbSerieSubSerie
        DataSetName = 'frxDBDSerieSubSerie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDSerieSubSerie."DescripcionSubSerieDocumental"]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 8.559059999999999000
        Top = 38.354360000000000000
        Width = 196.535560000000000000
        Height = 15.118120000000000000
        ShowHint = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDSerieSubSerie."CodigoMCarpetaAletaI"]')
        ParentFont = False
      end
    end
  end
  object ZQSerieSubSerie: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 61
    Top = 401
  end
  object dsSerieSubSerie: TDataSource
    DataSet = ZQSerieSubSerie
    Left = 62
    Top = 465
  end
  object dspSerieSubSerie: TDataSetProvider
    DataSet = ZQSerieSubSerie
    Left = 162
    Top = 397
  end
  object cdsSerieSubSerie: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSerieSubSerie'
    Left = 163
    Top = 464
    object intgrfldSerieSubSerieidSerieSubSerie: TIntegerField
      FieldName = 'idSerieSubSerie'
    end
    object intgrfldSerieSubSerieidSerieDocumental: TIntegerField
      FieldName = 'idSerieDocumental'
    end
    object intgrfldSerieSubSerieidSubSerieDocumental: TIntegerField
      FieldName = 'idSubSerieDocumental'
    end
    object intgrfldSerieSubSerieOrden: TIntegerField
      FieldName = 'Orden'
    end
    object strngfldSerieSubSerieDescripcionSubSerieDocumental: TStringField
      FieldName = 'DescripcionSubSerieDocumental'
      Size = 100
    end
    object strngfldSerieSubSerieCodigoMCarpetaAleta: TStringField
      FieldName = 'CodigoMCarpetaAleta'
    end
    object cdsSerieSubSerieCodigoMCarpetaAletaI: TStringField
      FieldName = 'CodigoMCarpetaAletaI'
    end
  end
  object fdbSerieSubSerie: TfrxDBDataset
    UserName = 'frxDBDSerieSubSerie'
    CloseDataSource = False
    DataSet = cdsSerieSubSerie
    BCDToCurrency = False
    Left = 566
    Top = 282
  end
  object ZQStickerCaja: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 279
    Top = 398
  end
  object dsStickerCaja: TDataSource
    DataSet = ZQStickerCaja
    Left = 276
    Top = 463
  end
  object cdsStickerCaja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStickerCaja'
    Left = 380
    Top = 461
    object strngfldStickerCajaPrecintoUno: TStringField
      FieldName = 'PrecintoUno'
      Size = 15
    end
    object strngfldStickerCajaCodigoMCaja: TStringField
      FieldName = 'CodigoMCaja'
      Size = 10
    end
  end
  object dspStickerCaja: TDataSetProvider
    DataSet = ZQStickerCaja
    Left = 379
    Top = 398
  end
  object fdbSerieDocumental: TfrxDBDataset
    UserName = 'frxDBDSerieDocumental'
    CloseDataSource = False
    DataSet = cdsSerieDocumental
    BCDToCurrency = False
    Left = 644
    Top = 217
  end
  object fdbCarpetasRadicadas: TfrxDBDataset
    UserName = 'frxDBDCarpetasRadicadas'
    CloseDataSource = False
    DataSet = cdsCarpetasRadicadas
    BCDToCurrency = False
    Left = 574
    Top = 346
  end
  object frxActaRelevo: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42325.713947604200000000
    ReportOptions.LastChange = 43378.679412754630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 474
    Top = 345
    Datasets = <
      item
        DataSet = fdbCarpetasRadicadas
        DataSetName = 'frxDBDCarpetasRadicadas'
      end
      item
        DataSet = fdbTotales
        DataSetName = 'frxDBDTotales'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 30.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 30.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 66.031540000000000000
        Top = 18.897650000000000000
        Width = 627.024027000000000000
        object Picture2: TfrxPictureView
          Left = 531.134200000000000000
          Top = 12.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Picture.Data = {
            0A544A504547496D616765341F0000FFD8FFE000104A46494600010101004800
            480000FFDB00430006040506050406060506070706080A100A0A09090A140E0F
            0C1017141818171416161A1D251F1A1B231C1616202C20232627292A29191F2D
            302D283025282928FFDB0043010707070A080A130A0A13281A161A2828282828
            2828282828282828282828282828282828282828282828282828282828282828
            28282828282828282828282828FFC0001108004C017303012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00D9B5
            F1278BE2F88DE25B5F0A426F6496EE4578A45DE8811D941C92027E60576305E7
            C5C90166D3B488BD9D939FC9CD5EF839A6CD0DC78AB53BA82586E2F7537C0963
            285914960403D8976FCABD3481F856718DD5EE79387C2CA70E794E4AEDE89F99
            E2DE21F177C49F0CE95F6CD574DD14DAA10AD28CB1049E320483F415CD59FC6B
            F15DD5CC36F6D65A434D3388E35F29C6589C01FEB2BD27E3D8C7C38BBFFAEB17
            FE862BE77F038FF8AD7C3DFF00611B7FFD1AB59CDB8CAC99C78CA95A8D754A13
            76763DE9AFBE2CCB18FF008956850B75E1F27E9CC84550BAD4FE2EDBA48E748D
            3E54419FDD796C48F61BF27E98CD7B2515AF2F99EABC237FF2F25F7AFF0023C6
            7F67DD56FB55BBF13DD6A73492CF24B0B306E02B1F33200E83E83D2BD9857987
            C2CD327D37C65E3B59ADE48A192F239216642AAEACD2B7CBD88191D2BD3C714E
            1B0602328D14A5BDDFE6C5A28A2A8ED0A28A2800A28A2800A28A2800A28A2800
            A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
            A28A28012BCFFE225EDCDB5FDAADBDC4F0A942488DCA8273ED5E815C1F8E71FF
            00092E8E08E0B2FF00E862BCDCD2FF00577676D57E673E26FECF438DFED7D47F
            E7FEEFFEFF003FF8D1FDADA8FF00CFFDDFFDFE7FF1AF43F12E9D67AB992C61D9
            1EA30209633803703DBE9C7E1C57994D13C52BC52A94910956523907D2BE6B19
            4ABE1656E76D77FCD1E7568D4A4F7BA2D0D5B511D2FEEFFEFF003FF8D6EF82B5
            0BCB8F11411CF757124655F2AF23303F29EC4D6BF8634BB6D192DE5D480FB7DE
            B048E36E4A2F5E9FCFF014D8142FC509428006DE807FD3115D9470F5693A5567
            3D5C92B76BEBAFF91AC69CE2E3293EAB43BDA28A2BEACF5028A28A0028A28A00
            28A28A00F38F8F9FF24DEEFF00EBAC5FFA18AF9DBC0BFF0023AE81FF00611B6F
            FD1AB5F44FC7CFF926F77FF5D62FFD0C57CEDE05FF0091D740FF00B08DB7FE8D
            5AE7A9F19F3799FF00BDC7E5F99F68514515D07D2104EC6385D82B3B00480BD4
            FB0AF2DD4BE30C1A4989753F0DEB766CE094FB44623DD8EB8CF5ED5EAF9FFEB5
            785FED36A3CBF0EB6795373FFB4AA26DA5747063EA4E8D27560ED6F2EED236F4
            CF8C96BA94ED069BE1ED66EE655DCC96E8B210B9EA403D390335E9BA6DD1BEB0
            B6B96865B669A2590C330C3C648076B0EC4670457857ECD31AFF006D6B6C47CC
            B0C601F4049FF015F409E7DE8A6DB5761809D4AB4954A92BDFC8E13C59E3D6F0
            D5E5C4771E1DD62E2D600ACD790C59870403F7BDB38E7BD7309F1E3476215748
            D49989C000A124FE75E81F10901F02F88781C69F71D7DA36C57C95E18FF919B4
            9FFAFC87FF0043151524E2F438F1F89AF879A8C65A3F247D6DE11F104BAF413C
            9368FA8E97E5B05097D17965F233951E95D17D2931C7BD79B7C68F1A4BE16D16
            2B5D39F6EA77D958DBFE7920FBCFF5E401F89ED5AB7CAAECF5275150A6E751DE
            C6A78B7E22685E18CC37970D717A319B5B7C3C8BFEF7202FE273F5AC0D37E217
            89F5DB7F3B42F04CEF6C7949A7BA11ABAFB6E500FE04D795FC1EF0BC7E2BF17B
            CDA9AB4B65683CF9F7FCDE6B93F2AB1F73927D7691DEBEA50BB502A00AA38007
            415116E7A9C386A95B169D472E58F44AD7FBDDCF2897E2F4BA45EADBF8AFC2FA
            8698587CAEAE250DEA4642823E84D7A1787F5FD37C45622EB48BC8EE61E8DB78
            287D194F2A7EB5178B7C3B67E26D127D3750895D2404A49FC513F675F71FAF43
            C135F2B689ABEABE07F15C8F6F2ECBBB499A09E2CFC92856C3237A8E3AF6E08A
            529383D7626AE26AE0E6BDABE683EBD57DC7D88393C76EB5C1F8BBE21AF866FA
            E21B8D03579ADA0DB9BC8E1C407700701CF1DF1F5AEABC39AB5BEB7A2D9EA766
            49B7B98C48A0F55F507DC1C83EE2B2BE2860FC3EF106EC63EC8FD7E9572DAE8E
            EAD293A4E74E56D2FDFA1E7D73F1EAC15336BA35DBBFA492AA0FCC035E9BE0FD
            7ADFC4BE1EB3D56D13624CB968C9C947070CB9EF820F3DF835F397C49F0E359E
            89E15D6E05261BFD32DE394F612242A01FC571C7FB26BABFD9CFC4623D42F740
            B86C2CF9B9B7C9FE3030EA3EAB83FF0001359C66F9ACCF330F8DAAB11ECAB3D1
            FF004BEF3DFF0002AA5FDC41636535DDCB848604692463D954649FC855BC76AF
            38F8C77D34FA669FE1BB06DB7BAE5C2C008CFC912905D8FB74FC335AB76573D6
            AF53D95373FEAFD3F1313FE17C68F8CFF64EA3CFBA7F8D6FF85FE250F10DD5B2
            5978735916B33F97F6B31030A7A92C38C0AF09F8B7616DA6F8FAFEC6CD765B5B
            C70451AFA010462BDF7E0791FF000AC34700F4F381FF00BFCF59427272B33CAC
            2622BD5C44A8CE5F0DFA76763BEA28A6B3055258E00E493DAB63DB38AF89BE33
            87C1BA209916397509CECB781CF04F766C73B47B772077ADCF07EB71788BC37A
            7EAB08005CC419947F038E197F06047E15F33FC4BB9BFF0011DFCFE282AC7489
            6E5ACAD49CF0B18054E0F40D963F5DD5DDFECDFE20C1D434099F9FF8FA801FC1
            5C7FE8271FEF1AC94EF2B1E351C7B9E2B91FC2F6FF003F99EEC467F1A36D2839
            15CAFC4BD666D07C11AB6A16BC5C471048DBBAB3B2A06FC0B67F0AD5BB6A7AB5
            26A9C1CDECB5317C65F14F46F0DDD359471C9A96A4A76B416EC308DFDD66EC7D
            8027D40AAF6DE32F1ADD45F6A83C0730B6C6764978A921FA06507FF1DAF26F81
            8B6571F11226D51834BE4C925B990E774FC7AF53B4B9FA8F5AFA8FB1079359C5
            B9EB73CEC254A98A8BAAE5CAAFA256FC6E99E629F17B4DB659E2D7F4CD4348D4
            2289A416F3A12242070AAD81C9C704803DEBBFD13514D5B46B2D462468A3BA81
            27446EA1594119C7D6B97F8B5A2C3AD78235257B6F36EEDA3335BED4DCEAE307
            0B8E790307EB5B1E068A483C17A1433A324B1D8C08E8C30548450411D8D5ABDE
            CCE8A4EB46ABA751DD5AE9DADF79D00E86B84F1C7FC8CDA37FBCBFFA18AEEFD6
            BCFBE21CC6DF5BD3A603718C6FC7AE0E715E766AD2C3B6FBAFCCD312ED4FEE2A
            F8E6EA5B2F154371036C9122420FAF278FA56B472E8F7E91F88AE7092C0B8923
            1DDC7DDE3B9F4FC3D2B8DF10EACDACDF8B9788444204DA1B3D33CFEB59BB8852
            B93B49C919E09FF24D7CF3C7A8569CA2B9A2DDD5FBF4670BC45A726B54CE934D
            D4E5D57C6369733F1990045CF0ABCE00ADB519F8A528FF0067FF00688AE274BB
            B361A84374103989B7052719AE9BC37A81D53C76B7AC82332AB7CA0E7188F1FD
            2AB0B8853508C9DE4EA2614EA73D937AF3267A6514515F627AE1451450014514
            5001451450079C7C7CFF00926F77FF005D62FF00D0C57CEDE05FF91D740FFB08
            DB7FE8D5AFA27E3E7FC937BBFF00AEB17FE862BE76F02FFC8EBA07FD846DBFF4
            6AD73D4F8CF9BCCFFDEE3F2FCCFB428A28AE83E904EF5E1BFB4F7FAAF0E7FBD7
            1FCA3AF72EF5E1BFB4F7FAAF0E7FBD71FCA3ACEA7C2CF3F34FF759FCBF34731F
            033C4FA47866FB55935CBB16A971146B1931BBEE209CFDD07D6BD83FE16B7833
            1FF21A5CFF00D7BCDFFC457977ECEB63697BA8EB42F2DA1B9548A32A268C305F
            99BA66BDD4787B47C63FB26C323FE9DD3FC2952BF2E873E5EABBA11E46ADAEE9
            F7F54705E30F891E14BFF0A6B16569ABAC97373673451279128DEC5080325703
            923AD7CF5E18057C4FA503FF003F90FF00E862BEA5F1D689A5C3E0AD7E48B4DB
            14912C276575B7405488DB041C75AF967C2FFF00232E95FF005F90FF00E862A2
            A5EEAE71666A6AA43DA34FD15BAFAB3ED815F2CFC7ABC92EBE255E42DF76D618
            614FA140FF00CDCD7D4C2BE59F8F56725AFC4ABC99BEEDD430CC9F40813F9A1A
            AABF09DD9C5FD82B77FD19E83FB345AAAF87B57BBC0DF2DD8889EFF2203FFB39
            AF636EA2BC73F668BB56F0FEAF660FCF15D0948F674007FE8B35EC6DD455D3F8
            51D1975BEAD0B7F5A8FAF92FE345BA41F13358588055668E4207AB4484FEA49F
            C6BEB4AF92BE335CA5CFC4BD65E2395568E3CFBAC6AA7F506A2B7C272E75FC18
            FAFE8CF5BFD9C6F1E7F065DDBC8CCC2DAED827A056556C0FC771FC6BA7F8BC71
            F0E35DCFFCF11FFA1AD731FB3959BC1E0DBBB891597ED376C53D0AAAAAE47E21
            87E15D0FC69E7E18EB9FEEC5FF00A392AA3F01AD36D602EFF95FE4CCDBCF0E8F
            11FC17D3F4F440D72BA6C12DB7A89563057E99E57E8C6BE6ED07559F45D72CF5
            1B5C89EDA55900C91BB07953EC4641F635F5F78107FC513A01FF00A7083FF401
            5F36FC65F0F7F6078DEE9A0522D2F7FD2A238E016277AFE0D9E3B022A2B2D9A3
            8B31A2D429D78EE925FE47D45A65F41A8E9B6B7D6A4B417312CD192392AC323F
            9D79E784F1E29F8A7ACF88186EB1D217FB3ACCE382FCEF607BF56FC1C570BE00
            F883FD91F0BF59B279717D6436D88CFCCC253818F5D8C598FB115EBBF0DF42FF
            00846FC1DA7D9326DBA64F3AE33D4CADC907E9C2E7D145689F358EEA55962DD3
            B6CB57EBB25F7DDFC8F9F3E38823E28EB24F7107FE898EBDAFE01FFC937B3FFA
            ED37FE866BC5FE39FF00C950D5BFDD87FF0044A57B27C02757F8756C14E4A4F2
            AB0F7DD9FE445670F8D9C3817FEDD53FEDEFCCF476EC7B7AD79FFC65D665D3FC
            30BA75882FA96B127D8E045FBD86E188FC085FAB0AF406E7007E55E15AAFF6F7
            8E3E25DDDEF85A4B248340220864BCC98CB9C866002B64E7383E8AA7D2B59BD2
            C7A98DA8E34F923BCB4D37F3FC0EDF5FF04C32FC2C6F0E5AA879AD6DC340C060
            B4CBF3647A6E6C83FEF1AF9B7C21AD3F877C4FA76A88188B794191475287871F
            8A922BE811A77C56273FDADE1EE7BED3FF00C6EBC27C7FE1FD53C3FE23961D67
            ECCD73703ED3BEDB3E59DC4E76E40C7208C62B1ABD1A4791982B3855841C7974
            D7CB63EC08278EE2049A075789D432B29C8607A1FA573FF10F4497C45E0DD4F4
            AB6204F3C60C79E016560E01F4C95C66B9AF811E20FED7F052594CC5AE74C6F2
            1B2724C7D633F4C6547FB95E960838AD97BC8F72128E228A7D24BFE1CF871D6E
            2C6F0ACBE6DB5DC0FC839478D81FCC106BD2BC31F19F5FD2A3487548E2D56D97
            8DD21F2E5C7FBE383F8824FAD7B6F8BBC05A178A8799A9DA15BB0302E616D920
            1EE7A1FC41C76AF1FF0012FC0ED5ACB7CDA15DC7A8C639F2A41E549F41CED3F5
            C8FA561C928EB13C2960B15856E549DD797F97FC39EA3E0FF89BE1FF0013CC96
            F14ED697CC702DEE70A58FA29E8DF4CE7DABBB3823DABE1CBBB79ED2EA482EA1
            92DEE626DAC92295643EE0F22BE9FF00829E23B9F11783D4DFBB49796721B679
            18E5A40002AC7DF0704F538CF7AD29D4E6D19DB80CC255E5ECAA2D4F45C715C6
            F8DA0D264BAB63AA5D4F03EC21446BB8119FA1AEC8D79C7C4E18D42CFF00EB99
            FE75C59A4F930F26D27B6FEA7A18A76A6DDAE50FB1F85FFE8277BFF7EBFF00B1
            A3EC7E17FF00A09DEFFDFAFF00EC699A6784AFF52B28AE6096D82480901D981E
            A4765F6AB5FF000816A9FF003DACFF00EFB6FF00E26BC08D1AF24A51A0ACFC9F
            F99C2A9CDABA82FEBE641F63F0BFFD04EF7FEFD7FF00635ABE16B7D122D6626B
            0BCB996E30DB5244C03C1CF38F4ACEB8F046A5042F23CD69B54124076CE00FF7
            6A0F001C789EDC9FEEBFFE826AA973D2AF4E352928DDAEFDFD470BC671528A5F
            D7A9DB378C745562A6E1F20E0FEE9BFC28FF0084CF45FF009F87FF00BF4DFE15
            E5771FEBE4FF0078FF003A6C31996648D7019D828CF4E69FF6E626F6497DCFFC
            C5F5DA97B591EADFF099E8BFF3F127FDFA6FF0A3FE133D17FE7E24FF00BF4DFE
            15E6FACE953E917496F72D1B394120D84918C91DC0F4359F57533AC553938CA2
            935E4FFCCA9632AC5D9A47B0C3E24D3A689648E52558647C868AE3341FF904C1
            FF0002FF00D08D15DB0CD2B38A7646CB132B1E9B473DFA51595AFE9CFABE953D
            9457B7362F295C5C5ABEC913041E0FBE31F435EF1D926D26D2B9C5FC7D603E1D
            DD648199A203DFE615F3C782DD63F18E82ECD8097F0313E8048B5EF5A87C1F8B
            52455D4BC4FAEDDA2F413CC24C7E79F535447C07D181046AFA883EB84FF0AC25
            1949DEC7858AC2E22BD655546D6B7547B1608A776AF3DD1FE1D4DA75F5A4EBE2
            CF104D14122C9F6792E0F96E01CED23D0F715E84A302B64DF53DAA729C97BF1B
            7CEE201EFF004AF0AFDA6D808FC3A3FBC6E4FF00E8AFF1AF709D4C90BA866462
            08057A8F715E5DA8FC1E835668DF53F126B578C8084FB44824DA0F5033D2A669
            B56472E3E9CEB5274E0AF7F3ECD3393FD9A645FED9D6D49F98C31903D4027FC4
            57D05F438AF26D3BE0D5A69B7066D37C45ACDA4A57697B7711B11E8481D3A715
            E9BA6DAB5969F6F6CD34B70D0C4B199A6397908006E63DC9C649A29A69598602
            9D4A54BD9D48DADE664FC42703C0DE20E463FB3EE073FF005CDB15F257863FE4
            65D23FEBF21FFD0C57D3BE2BF00B7892F6E249FC43AC5B5B4EAAAD670CD88400
            00FBBD39C67EB5CB47F02F46570D0EB3A88743D5766548E7D383D2A2A45C9E87
            1E3F0D5F113528C745E68F63CF1EF5E6DF1A3C17278A7448AEB4F40DA9D96E68
            D71CC887EF27D78047D08EF5D4784FC3F368104D1CFAC6A3AA1918307BD97CC2
            981D16BA2FA56AD732B33D49D355E9B84D5AE7CA9F083C503C27E3068F522D0D
            9DD0FB3DC6FCAF94E0FCACC3D8E41F40C7D2BEA4571222BC4E19586411C822B9
            0F187C3BD0BC524CD7B6CD6F7A719BAB7C248DFEF70437E233F4AE7B4EF875E2
            3D060F2B41F1B5CC56C384826B50EA839E9962075EC054453869B9C386A75B08
            9D3E5E68F4B5AFF733B7F197892CFC33A15C6A57CE06D044516EC34AFD947D7F
            41935F2BE85A2EABE34F143C56EA64BABA95A6B8988F9630CD9676F41C9FAF41
            5EDB27C1E7D56FC5CF8A7C4DA86A840F9544623DBCF40496C0F60057A0E83A06
            9BE1CB0169A3D9476D0F56DBC973EACC7963F5A4E0E6F5D89AD86AB8C9A75572
            C174DDBFB897C3BA4DBE87A2D9E976608B7B58C46A4F56F527DC9C93EE6B98F8
            E07FE2D7EB40FF00D30C7FDFF8EBBA1C1E7BD79D78A3E1A8F125DDC497DE21D6
            3ECD349E60B412830A1EC154F1C5692DAC8ECC4C25EC5D3A71BDD5BD343A8F02
            1FF8A2B40C7FCF8419FF00BE05723F1E340FED7F073DEC51EEB9D31BCF5C0E7C
            B38120FCB0DFF00AD5F08F81A4F0E5EC32A788358BBB686331ADADC4D9840C60
            617B63B62BB1BA863B8B7960B9412432294746E8CA46083EDCD26B99598BD9BA
            B41D39AB696FF827CA3F07FC3C35FF001CD8A48336D687ED7371C6148DA3F16D
            A31E99AFACC1C28C715CA7807C1D63E0ED29ED2CC996699CBCD70CA033F3F283
            EC076FA9EF5A9E26D224D6B4B36916A379A73970DE7DA3EC9303B67D29423CA8
            CB0586961A8EAAF27AFF00C03E6CF8E8B8F89BA99C83B9213807A7EE9473F957
            AEFECF5CF8038E7FD2E4FE42A85E7C12D3EF6E5EE6F35DD5AE2E1FEF49332BB3
            76E491935A7E1DF85D1F87EEA07D3FC47AD470473ACED6CB2858A520824328E0
            820007DAA2319295EC7261F0D5A9626555C7477EABAB36FE28788BFE11AF07DE
            DE2385BB907936DCF3E637008FA0CB7FC06ABFC24F0FFF00C23FE0AB385D4FDA
            EE47DA6E33D7730181F82ED1F81ACAF12FC2A83C47A8CB73A8EBDABBA9959D20
            670D1C218E76A02381DBF0ADDF0B784A6F0FDEB5C3F88758D4A3319884379317
            45E41DC07AF18FA1357AF35D9D918D4957F6938E89596AB4EECEC2BC97F684D0
            45FF0085E1D5615FF48D3A4CB7BC4E403F91DA7D86EAF5A6E95E79E25F872DAF
            5DDE4975E25D6D2D6E5B26D166FDCA8F40BD314E4AEAC6D8CA72A949C231BDCF
            19F825E201A278DADA295B6DA6A23ECD264F0189F90E3D7771F4635EEFF16CB8
            F877ADB46CEAEB0860C84A918753D4571BFF000A2346C63FB5F51C7FBA9FE15D
            DE91E148ED7C3D79A3EA5A85F6AF6F745B7BDE4C59F6150BB03039038CFD49A8
            A719256670E12857852950A8B477B3BF719F0D7595D6BC13A4DD2C865996058A
            625B2DE620DAD9F72467F1AEAC93CE39AF2893E0DDBD95CB5CF86FC41AA69331
            E32ADBC63D382A48F624D5A97C1DE3178FECF378FA616DD03AD9AA4849ED90C0
            FF00E3D549B4B547552A95A31519C2ED766B5FBDA3CEBF68892C25F185A2DBED
            FB6456C05C15C71C92A0FBE327E8457A47C09D02E345F05F997C8D1CF7D31B80
            8C30553002E47B804FE34DF0A7C25D1348BC17FA84936AD7E1B7EFB9FB81BAEE
            DBDCFF00BC4FF5AF4DC7B528C7DEE666385C249559622AAB37B2EC2D79C7C4FF
            00F90859FF00D723FCEBD1EBCE3E27FF00C842CFFEB91FE75E7671FEE92F97E6
            75E2FF0084CE316591461646007606BB3D2DDCFC3BD498BB6E1275CF3D56B8AA
            ECF49FF9273A9FFD74FEAB5F3B9737CD3FF0CBF23CFC33D5FA338F334BDE47FF
            00BE8D6FFC3FFF0091A2DBFDD7FF00D04D73B5D17C3FFF0091A2DBFDD7FF00D0
            4D61826DE269DFBAFCC8A3FC48FA98371FEBE4FF0078FF003A92C3FE3FEDBFEB
            A2FF003151DC7FAF93FDE3FCEA4B0FF8FF00B6FF00AE8BFCC562BE35EA66BE23
            A4F899FF00230C5FF5EEBFFA1357275D67C4CFF91862FF00AF75FF00D09AB93A
            EACCFF00DEA7EA6B89FE2C8EBB41FF00904C1FF02FFD08D14683FF0020983FE0
            5FFA11A2BD2A1FC38FA2345B1D378ADF541A9690BA3C8EB27992BB21FB92854C
            847F407A03D89CF6A8B41BAD5AEBC4F3CBA8ACB05BCD64B2C5687A43F3900376
            2E4727D338ED5D6D15F507AE72179E22BD8B5ECA5A4EDA3C520B796510920939
            0D206F456DAB8C73F31EC2ADEAFA8EAB6BAF470D85B25D5A2DA99A58BA3B10E0
            611BA6EC1E87AFA8AE928A00E527D62FCF81AE35486374BD02468D5E22080242
            172BFEE81563C217D717D6F335DDE25C4CA465123DA23EB8E70339FA718AE8E8
            A00E6B46D7DB56D6634B64992D3EC665916588ABC72EF002B1E99C678AC7BFF1
            05EC31EA656EDD2FA0B978EDECFECD9122060179C64E47BD77B450015CB78FA1
            9C683717765717B15D421420B799941CBA8395079E09AEA68A00E7B5BF3F44F0
            C5F4BA6C93CD711AEF8CCEED31CE40EF93F8541E0899E4B39D64B98E5903EF68
            D13010B1624EEC0DC58F26BA8A28038CF0EEB5737B71A7ADCDEB9B995A4135AF
            D9480980C40DD81B7A0E4E7D3BD49A8EB3AC59EA1AC14B3373616CA813CA53E6
            A131E7701D1D73D40E47BD75F4500615DDFDE4769A1C91AFEF2E678927F93A2B
            212DF4E40AA1AF6AF3DA6B52DBBDE359DB2D9ACB1BADBF99E64859C11D0F40AB
            C71D6BACA28039AD6F52B9B5D234CB88A568FCE96259E6F20E510A925B673B79
            C70738CD3FC35A94D7D7BA9466E1AEAD21F2FC99DA1F2F7160770E801C607E75
            D151400570D63AF5FCB35BA89DE7BB7BE6824B3FB31012112B2EFDC0718401B2
            4E0F4EF5DCD1401C678A358D42CFC456D696F7096D64D02C8F2B47BB04B9071F
            29CF03A715D65A36FB785BCCF30B203BF18DDC75C76CF5C54F4500656B977736
            AFA68B519135E2452FCB9C210C4FD3A0E6B3751D4F54B4F10CB1DADA7DAB4F8A
            D239A4441FBD2CCF20250F462028F97F2F43D3D1401CA5DEA9A99F03DBDFDB29
            FED39441F298FA179154FCA7A704F5E956DE4D56C7C33A85D4F279FA825BC92C
            71F963E570A485F97EF738AE828A00E434AD667B8D6AC2082F9EF6296291AE03
            5BECF2880BB7900772477AA7AF6B1ADDBDF6AA2CD1C4104D1C50BF94A635DD1A
            3664FE2DBB98E48E95DDD1401CF788350D46CAFAC7FB3EDFED30159649E355CB
            BAAECFB87A6EF98903BE314685A8DF4EFAB1D5E25B75B695762A8CED4312BE09
            FE22324123B838AE868A00E4BC3DAEDFDD6AAD0EA3693DBC1740BDA9780A6CC1
            3F231EE4AE1B3C73B87A543A96B77306ADA94125F3DAF912C6B6D1AD9997CD52
            8849F53CB30E08E95D9D1401957775711F8874EB58C7FA2CD04EF29DB9F994C7
            B79EDF79BFC8AE675FD4E58F50D57CEBA6825B03BEC22FB36F1213083BB38393
            B99973DB9AEEE8A00E6F58BFD562B0D19B4F8A2FB5DCCC8B324AA42E0C4EC41C
            72BCA819EDEF563C3DA95D6A136A1F6AB59AD7C9956358A55C15F914B73D1864
            9C11DAB728A00435E6FF001373FDA1699FF9E67F9D7A41A0A86EA2B971786FAD
            5174EF6B9956A5ED23CAD9E094F12C82331891C467AA82707F0AF78028C0AF15
            70FDBFE5E7E1FF0004E2FA8FF7BF0FF827825743E013B7C4F6E7FD97FF00D04D
            7AC826835A50C8FD8548CFDA5ECEFB7FC1348607924A5CDB791E1371FEBE4FF7
            8FF3A8C120E4707DABDEF0293159BE1FD6FED3F0FF008267F51FEF7E1FF04F07
            9259256DD2BB3B018CB1C9A6D7BDE0518143E1FBFF00CBCFC3FE087D47FBDF87
            FC13CCB41FF904C1FF0002FF00D08D15E998A2BA565492B737E1FF0004DBEA9E
            67FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          Left = 137.874103500000000000
          Top = 19.677180000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'ACTA DE RELEVO DE RESPONSABILIDAD DOCUMENTAL')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 627.024027000000000000
        DataSet = fdbCarpetasRadicadas
        DataSetName = 'frxDBDCarpetasRadicadas'
        RowCount = 0
        object frxDBDCarpetasRadicadasCodigoCaja: TfrxMemoView
          Left = 217.535513500000000000
          Top = 3.779530000000022000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CodigoCaja'
          DataSet = fdbCarpetasRadicadas
          DataSetName = 'frxDBDCarpetasRadicadas'
          Memo.UTF8W = (
            '[frxDBDCarpetasRadicadas."CodigoCaja"]')
        end
        object frxDBDCarpetasRadicadasCodigoCarpeta: TfrxMemoView
          Left = 307.023763500000000000
          Top = 3.779530000000022000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CodigoCarpeta'
          DataSet = fdbCarpetasRadicadas
          DataSetName = 'frxDBDCarpetasRadicadas'
          Memo.UTF8W = (
            '[frxDBDCarpetasRadicadas."CodigoCarpeta"]')
        end
        object frxDBDCarpetasRadicadasTotalFolios: TfrxMemoView
          Left = 415.023918500000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TotalFolios'
          DataSet = fdbCarpetasRadicadas
          DataSetName = 'frxDBDCarpetasRadicadas'
          Memo.UTF8W = (
            '[frxDBDCarpetasRadicadas."TotalFolios"]')
        end
        object frxDBDCarpetasRadicadasPrecintoUno: TfrxMemoView
          Left = 137.000000000000000000
          Top = 2.322510000000022000
          Width = 233.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PrecintoUno'
          DataSet = fdbCarpetasRadicadas
          DataSetName = 'frxDBDCarpetasRadicadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDCarpetasRadicadas."PrecintoUno"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 332.598640000000000000
        Top = 147.401670000000000000
        Width = 627.024027000000000000
        object Memo2: TfrxMemoView
          Left = 2.559060000000000000
          Top = 9.118120000000005000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Fecha y Hora : ')
        end
        object Memo3: TfrxMemoView
          Left = 1.559060000000000000
          Top = 72.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Se'#241'ores')
        end
        object Memo4: TfrxMemoView
          Left = 1.559060000000000000
          Top = 92.606370000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PRODECO')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 2.000000000000000000
          Top = 206.433210000000000000
          Width = 619.842920000000000000
          Height = 94.488250000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'De acuerdo al convenio suscrito entre PRODECO y Thomas MTI; por ' +
              'medio de este documento se hace constar el relevo de responsabil' +
              'idad sobre las siguientes unidades documentales y su contenido, ' +
              'despu'#233's del punteo f'#237'sico entre las partes involucradas.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.000000000000000000
          Top = 113.283550000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Gesti'#243'n Documental')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 205.181200000000000000
          Top = 310.141930000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'C'#243'digo Caja')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 287.110390000000000000
          Top = 310.141930000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'C'#243'digo Carpeta')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 387.866420000000000000
          Top = 310.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Total Planillas')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 120.000000000000000000
          Top = 310.141930000000000000
          Width = 82.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'PrecintoUno')
          ParentFont = False
        end
        object frxDBDCarpetasRadicadasFecha: TfrxMemoView
          Left = 107.000000000000000000
          Top = 9.598330000000004000
          Width = 226.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Fecha'
          DataSet = fdbCarpetasRadicadas
          DataSetName = 'frxDBDCarpetasRadicadas'
          Memo.UTF8W = (
            '[frxDBDCarpetasRadicadas."Fecha"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 309.677180000000000000
        Top = 585.827150000000000000
        Width = 627.024027000000000000
        object Memo11: TfrxMemoView
          Left = -2.000000000000000000
          Top = 71.086270000000010000
          Width = 623.622450000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'MTI a partir de la fecha se har'#225' responsable del adecuado uso y ' +
              'tratamiento de la documentaci'#243'n e informaci'#243'n contenida.')
          ParentFont = False
        end
        object frxDBDTotalesToalCarpetas1: TfrxMemoView
          Left = 337.756030000000000000
          Top = 24.172850000000040000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'ToalCarpetas'
          DataSet = fdbTotales
          DataSetName = 'frxDBDTotales'
          Memo.UTF8W = (
            '[frxDBDTotales."ToalCarpetas"]')
        end
        object frxDBDTotalesTotalFolios: TfrxMemoView
          Left = 415.141930000000000000
          Top = 24.172850000000040000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'TotalFolios'
          DataSet = fdbTotales
          DataSetName = 'frxDBDTotales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDTotales."TotalFolios"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 289.000000000000000000
          Top = 3.172850000000040000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Total Carpetas')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 385.385900000000000000
          Top = 3.172850000000040000
          Width = 85.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Total Planillas')
          ParentFont = False
        end
        object Picture3: TfrxPictureView
          Left = 3.714285710000000000
          Top = 141.601421430000000000
          Width = 230.202535710000000000
          Height = 78.897650000000000000
          ShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D494844520000014A0000
            006E0802000001B906FD50000077DE4944415478DAEC1D075C4D6FFBCCDB6D2F
            6D15217B646FB2C7DF5E85488512B2570865642533337B84EC3DB2F78844D2A0
            22A5BD6EF79EF5BDEF39B72B9524191F3DDFEFF3AFDB3DE71DCF7EDEE77D1E94
            6559E4F7015A3EFC1F363C8AA08C340BDBBA6EBF96A1F2FBD858315961D2EC61
            1CC715FFAE0F71C981FB2F8C9F31B4A83F8267B94573D6376C51B966AD3AB783
            AE8E1CED045E987F780E4531FF1DDB468C70C4F0824F83AFE13856FC045014DD
            B46ABBF31487029F332C8D20188E61F93F7CF326A15A3503F9F02887221852CC
            FAC09FF819E05FFB02189BE364348D12045168EEE0E55FBC9965191C27E4AB5F
            B978C7347707A45858B5E4C0D439B6F966C382ADCAFF8576F55A5D7D7AE3CBF9
            71108F9F1F417C97AD98347B3A189D61501C47F96573528E238B1998E598674F
            A3AC1A562BB056ABAAF5468E987EE5C2CE93B7AF30340D165D60F33884461122
            FF23E0DFA0538F5A756E4428C9E70586E7F23F063603C330B82DFCB70303AEF7
            19D01AAC092E1720AF107246F41DB3FBF896BCCDE70434812F83BDA569198E93
            C226BC78F6B25E83DA0CCD62FCA2C137FA76B0391174A828CA4791A73713AA37
            5451555567186E74FFC9FD87DBECDCBCEDF0A5ADF6BDC7EC3AB56D508791755A
            68196B77739ADAAD4F878127AE1E119E7B7233AE616B131E279048C1FC856550
            14356FD60A2FEF19855153787840A50478263B3BD76B96E72857971993671E3B
            BB679EDB52AFB5EEC2FAF885B26177526AB4D4DDB1618F83AB1D4B330841D052
            FA4D585C45437D0D03B1FFC63D43870F156B1080A601FEDEC6C71AEB1A2A2989
            14C3CC749DB16CBD77D162A765ADE67742EEF4B61E72FCDA91E9CEEE2B377B2E
            9EBB2EE17DC2FA5D4B5E8505C7BCC9E8DCB3F5B2B91B662F1E7FFBC6D3566DAD
            16CC5C55B182A5B1995E779B165326BBACF1D924700AC6331BC41BCEF1FB8186
            3F4DAD6021D2505105848F7C4DEAA12CC261080D288AE6944478DCBB54D34ABA
            F9689841519C61006A450C035808475994C3BE21948A84DF2974CBC7FE711078
            ECC7C686EA06797CEB6DE0F143952A1B5132B67193964D5B572B5EC7006ADEBA
            63CB18C7B145FE9561D89BE79FDDB87B61F43887B898C8B9533D2FDC3EFB796C
            F0EA170FA3EB35B3285AD3700C82E25F1F1A49FC90A367A48C16B5F0B1769337
            F8AF28AC7B84B199B933E62E58B29820B0AFBD3AE17D868189463163C7447E88
            8A8E6DDFA95981CF291A2589828BC94A63D5B430303643331C8163C5BC174519
            304334DFBA15F21FE1D50F8E8135311C57F025112109956B5510C46A528244CF
            50054A1E0A4509A01BA19804CFA0C50E0CBF03C475814F3D676E8B8E7836D8A9
            47B72E5D501C2F8CA9BBD71E6665709D7B3715100A4410D8E1B0E0C4DA8DF5C1
            5230F05E966315CA4A504D1C2036A0EE807043B1A4C4145D3D6DF0A795F3774C
            5B2457FC0A9189E4D1F684B11EEB362F44E4BA022C0DC13074D6A8AEDAE6DD67
            784C8E8B4CD635522550965456968FC442D5F3059DF31A11F9AF6B1F0BE34A03
            6CDCDA74360704D2BF73BFC04B81E78EEFEDD8C9CE71E8983D27B780270F1FDB
            3DB0FF7061C2E0FFDE4B7D66CE9EFC2E221D6573CDAB1B720805946A4E86D46D
            CCD4CDFBD70ACA3EFE7D9691899A62AC833B8F7C31364D03358C766ADE4E8330
            387AF30050C6406283255EBB1562DDA69E7C57793C5352841009260DCA3F08FE
            05B21DDDB52970E4D8FEA860A8A0A8FD400747575712576BD6C672446F87DD27
            77E4ED1C07BE5C047FBB8D76731CE754BF614D0481636724D39A15486193B7AF
            3FE838DE86A6289C20184E46604AC284681661B2D0051E33AAD7ADD1A869CD9A
            351A1284889F37A4507E7EBC51C521DBD6053A4DEC07C686B456786C40122C0E
            114E534C424CA241A50A045EBC9925C35011F2FDF09B9D87DF08E52BFFF7E0BB
            570E243C837004F81F0A452F0BB91CE5E52BC7B054F13C5972005A2A3D1ED131
            21BEE92017090C47E3406B419DC181396208C172BC1E0322344F6317B772E14F
            4013DEBBF1FCF0E1806973DD8C0CF458FE53203C299A25A00B0A0083020C45A4
            9434332DF775706CAB4EB5D1EFB2A20A8CCBD07326CD5BE2BB3860E7691B87DE
            25C307D4C9B4145BB46091A7F77CA8173956D8B5FC9E1F40D0F8B163366CDE5C
            70E5C0A200BE3470E517CDF39C36779A1229063E06866125195B01F2314A852B
            FE4176A2D3B475DB5683FD2CE17BC0B4BD17AF993EDBAD88E040819723ACFB54
            AF25ABE67F5E39CBB0ABBC764CF718CDBB3CDFB7D42F26C1312F8223EB36A856
            3A9C8335B0328C24B0478F1ED66F5C9F20BEC13B428C42E199E7FB1CA8538262
            684211E4C99B90E29B2858EA76BFA3A3C6F6C231A5522F18BC0D984C4702CE0C
            18D43D7F28A400D0B4F4F8DEAB03EDBBC3D1F94973BCA506A8EA5570E22A9F39
            DB766D3BB4FBC460BB6F5078FCBB24E34A7A600DCF1FBEAFD7C4A4E06410194B
            93C002E7842005C704ECBB613BA223F074F3870650603781BDFE5E92CE5B3098
            357AF1E4F32EBDEB014242789B195A8E7087D1C25F961B5C80A5500A03561481
            2D59B072C6DC49E02F60A280FAAE5E78D2AE535D92542A72ACCF563A4B7B2F5A
            397BC1ACA3BB2F0C18D135EF430E2038F245FCB1C0231D3AB7791AF2C6C96108
            CD01930B3C284A4BCB9C3A79EA7F9DEDFADAB6127003FC00192525454ADF60A7
            9953A72F5DBE028672502E31367B9EBBFB72DF65AAEAC0CB1076910F7A705C54
            C4C72A161533B2A51A9A22884EC18C4679F98F7072532E9F83603FD87967809F
            626DC3078DDA7764278F3716E55506C660535DDDFA0CEDD6B65DF7A737DEB2B9
            F49E234B576DD97C60C7FE610E76AEF65337EE5A3D66901B8233CD1AF51E39D9
            1A6C276F39A20522759F7790E55AD5EF702724A838D91E1B95703728E4DCE580
            D6EDAD567B2F7E19FD1EE8861E2D9B9DBDFB64FFF6530307745FEDE9A76590AB
            A95F6B987D0F8072DBDE8E7B4F6F077EE8D1BD57068FECC253139395864D701E
            D7DBA6E3E5A3B737EE5D092694938EAA69601CC601D42D98E6B168F562392F30
            D4FD9B21CA224344141DF336BB63CF764B662CB7EED4A2736FEB894E73D66E5B
            0AB903EE1E27CBA5959449B0534E83DC36EEF511411201F210DDBBF5C8F03103
            294ABA72CEF659CB5D8A5C14455373272FF55E37BFA4FA7C9AF3D4559B57A77E
            CC0ED8769E5192DCBC75E9C0895DE96994A616E93A7CEA1AFF65316F23CC2B5B
            6C59B947C7D078C0F0CE0A5A90E6D0CA6AA4244BB6C2633DAAF1719EC7F2D4F7
            326D13114FBDDCC31B218DDBD4138648CFA05F043F6FD1BA2E0AFC4D9E3E3A37
            FBAF71B36623C60DAD59C342C0E1D963E7BAF7ED8672E8F2650BA7CE9C3BD671
            E6E6EDDE807B2739CF58E3B71C8A4794E47910534423799283A6C789804B2DAC
            EB68696AB1AC08F07B49573EC365C6340F0F032335E15D6386386F39E4279521
            248600B5FE2A34AA6E6D0B406659D9B96AAA62F04E922479DE633848B66C7C5C
            4A45735DC1793EB0E3B8AD435FE1AF13464FD8B07D23C2B3C4B239EBA77BBA40
            DB00081D0AE170B92326C4BB8B556F8C2059680E63198AC080C800AB65A0FA06
            B4858A78762B08A5B15E698E265042C19CBC52A1398E289594CC0F6C41FFFF67
            C23F6AB7972FFB5F82F265FF4B50BEEC3F0978BF02FD61A55866CB86EE3DC3B0
            38822318302A805D050F48106868707C64BF6CC22FC01C78FD2CCDA2B62A8113
            A5789C4118E0FC80C5313487E2C0542259680601CB9D46F9986CC9960D1D2E18
            E006AB0B791CF5E85E18C251F1493196352AA6A7E6A6A6A4A6A666D6ACD960F0
            D0AE981285C173DE1F5932B4CA5AD4B2BC1FF6463845FF8E276198894DF994F9
            F06668E4BBA8AC9C0F2D5B373532AE482891B76F0445BC0AEBD6D2A169F7AA18
            8115B76C78D081631883CE9BE3DDA95B9B262DAD9479C78DE5A07B053681A359
            0658A80021A8E0966233262E58EEBB80CD0BF3976ED1C18FC3EA37A985722C86
            62255F361871EBDA638D5B55B46AD8840F01CA8FD215AF4579887B9F6962AC56
            C4B261981FB87F2C3975EA42F7852EDA6AFAC073E2D86F7BE9FC14D1090E537D
            B7AFC4B1522E1B6CD9EAC51BA6CC19C77B945C09D93B393197144B34D4B4E0C1
            53B13B7EE9CAADCE1D5B17383802E63BF2FA59D2CBA86BFDFA0D862769F9DCFD
            12E18A65BC16F8CC5E38B574840EE32334428A308665967B6E9D31D711C3BE15
            39035BCDA00889B08CEC9B92451102942F9B83CE2B1DFC28D6D84C454B4B03BC
            86200945CAC5F74C9CB974E15EC72E2DB152611BB0CF64E7393E7E8BCE06BEE8
            DAB70E86A0C5641C29D67D36F06CE7BE5DC96F0B3F6EC38AEDCE5346F179137C
            B819C5D0E55EBED3E74C4450AE9808D937E16548548D5AE63851BA0038CC1771
            193DAEAA49E3A99EA339786E581C89F34340628C7E1359B95A6504C97772CC30
            18413014F837EF2895457C7C764C99E2202C0E05EA0708AD5C4E2A22C81F9143
            F059E0EBB234063C64B4E8EF08E70D450DC2F1E7865C78684A784450EFFF86B0
            7831429113F43AA0433A0B2154E1E1288A12F9FE8A66A5A57769DAEACEAB1004
            47F91026BBD927C071D200122384D7A2344D67A66669EA1677C0FFCD5583F724
            7ECC36305263C0B2BF92A700267AFBEA9D369D5AF32BE405499EB005E0E9BEDD
            CEA1EDFB18498BD635D16223E1E03DFBB79FB775E802AC99270F5F346A52B7C0
            5C5E3E4BB4ACAD8BA10C8A034482B1F05B41CF9AB7A9C34731F2CE4CB6FA058C
            1CD58F20BFC5425F5D319062C85EFF1BF6A3DBB02C5A0CBDF0D8E6AE059DBA7A
            FABD92B218E39067C1D754D472E7FA2CAE6C62C9D232A013278DF1F0DDBA182B
            365B09A0F9E983D00640C36148EC9B74B36A5A5F0E822E9CB57AE1F289084226
            25CA4EEC3F3DCCA1BF18E214D019A03506E3A354687AAA4C551D2BAC9C4A26CF
            389AC282CE5FB3EEDE8620806824104161A25F7D1B200796C3518CC2391186A3
            69698C0610A0409EA230BA7868CFE941C3FA1044516CF059A770116F3E54B5AC
            0836FC4374AA71651DF9175804BC70AA93F7B3D0139E8BFD45EA4CA32635699A
            220868965D09BA7ED4FFF8C6DD3EF299247CC8D4D5572EBC6CF60B452DA46260
            027AE1FC11362D39F7D2E55B8387746260249C13BECC4AD19B979FB4ED51371F
            B3159EB71CC0AF6999520D5511C79F46C1F81405B6EE33AAF3F23FF8A4258E13
            C28960626F5EC756AB698E219C348B26550848701CBB74CEF2A99ED35544C4E6
            5587C7B80D06932DB0F9E045EF3FC6BE7E9CDCBE673D68FDC1E342A438760213
            72779FE1E9B50C81A6187E6CFFDD3449F828C791308886F1F90C823905638688
            BFDF2107E7FE1C5C36AF14F89353215113850163FE5807916765D03442105F50
            964205F0271088C7D4CD62ED8F1862307B9EC3A3AB498107772DDE3A77AFDF11
            9BD1FD495ECEEFF03B7BEEC04E33CB2ADE1B3C1020B8310C301D46305F5B915C
            A47DDD38E5D1C3532D78D7E0FF068995F44CCD0877AFB560AB945561BA1110CC
            B72E862F5B38475357FDC0A93D535C665954AAE23465948864C70D5B9A99F6AA
            4D877ECE538764A667CBA4D8C299BECD3AEBC57FFC346DCA548E85F62C988134
            971529C9492057422BAB10C04AC3103C70EFFDFE76CD80B8BD7D3CBA4DFFAA1E
            D3972F5C3E89DF5C1CCC69EC88899B77ADC170E2D1FD08AB3A557115F8384D33
            404281E5C86494584C7E3D69897BF322EEABCB066FBF74FCA9BFBF5FA56ADAA3
            26388F1BE874E6EE459F05FB9DA7F7B7FB6FE8C99B271E05BD9937CBD5EFE42E
            735D2316632F9E3EDDE1BFEE18DC70DC6584CBBA1D6B3194A064AC9232DEBE41
            8733572FA8EA9030790BE17A34B53EFB20086C6544D8FB6AB54C91BCC8F6B3A7
            11568DAA0CE969336B919B6185DA6AAA62F50ACAD35CC6ADDCB491852160A0A5
            B0CC0C5A5D83E8D3B9FF894B47303E26BF68F6F2D98BA601A326270B7970FB96
            75B73601072F0CB1ED56A4E1003EFB189FA96B242AFEF41B1EB2B05054E0ADEA
            B7BA78EBBA9A3A01482F26E28399A5F192E9FE73560C070253F866727CA69EB1
            5A5A5AAEDBE8593B0EAC453039B74B2452919268FEB4950B574D273134FC45DA
            7AEF453EFEDE28865F3C7BAB73CF5618223F9D1E39D8959664EE3CB28310E17C
            F098BD7EFEF987B897B1EFDF4E99338D1411026F03A61CD667C4BE937B784EE1
            4E1C3CD97B700FB0DB7DDB773D7AE10C2E22B2B2246AEA2A48A165835180FCD6
            D61523085532C713455BD4AADDB2755FFB9113B76CD8625EDD60BAC718DB1E8E
            BB4F6D42E07100BAD127C065F2E0E837496655344F1D3CDF6B50379CD7BD803F
            470F1FEFB773FDBA153BCF1FF13B7C3348535969AAD38CE55B57833DF19CBF7A
            B6C74482CF520793DAB07A63A3BA2D1B77AC4FE050BCE564C994D5951E048535
            6B5D0325398645012F6767CB9495897123C7ADDBB3964444C28EBB4D72B41D36
            BC59A3B61C34660968358185C1ACE0CF32542693AE5FB9DD6DE658305CB624B7
            44CB064F3731AB88AB627743636860F2C948B12AD2BFC3F0239776EED81C1815
            F6D1CBD7114144CF1EBE6BD0D8C2B6DFA0EDBB8FAA6AC25CB379B3A625A7B35B
            77AC7C74FD45C39675506823A139398CB212C49BDBA8993E3BBC305C7E8E9396
            963EB86BDFA3172F8B507C9AEBB2757B66016527E1B8801DEB863A8E53C2098A
            CA8567E27C86193CE983473F34CCDD905F1610CC6A2ECFBA4625D9ECD5334F18
            EC43AF81BD6906217118201168B084D866FB75EC8370150E5FD8420836AC0C71
            18E6BCE3E0BAA9E397AED830AB4BA33E979E9C015A04833993B8604BC3700603
            DE4FC1B4BACDA7ECC7F4854A05A86E0E862280AD76EDF2BDB69D1A1098325876
            4E76AE8ABA124B7304B0A5810867B270025023FE4DF3413052C1E23948100450
            D440C2331402735A801E4739692EA324260B2DA804CB66E082A03C2778ADC232
            349F7FC05214939DC5AAA9E37B761D1C693F14FDAAD7C5291251C1C3C05CC279
            6F49185A38AF7B171D6F5649FF9B6E6659C1778710698641604445BE7F107B7C
            7E10C7A7CF967A1EBCC58297CA6FFB25CB2E87FF6B28C7F7BF05E5F8FEB7A01C
            DFFF1694E3FBDF82727CFF5B508EEF5200D8331AC34A737DEBB7C3CFC6371F55
            E618E07AF3C3D01C8C848AE57FA311E1EC35DF351CE0D1532489B1F0FCF9D765
            66960484884EC706BD33329E3BCD985641AD4A5FDB4EBF2C5C0001A51906ECA4
            089E8BA038254331191215FE9650528B8C8CCA4A05B3234CCCC48686FABAC61A
            4ACA30EB8661A405E8B26CF0CD72F08ABE08267D6319C9D4E3FB2FE2E23E3E7F
            1A6CD5B83A854AEAD5AF63686CA0AEAEA6AC2CE6033F7C36318760F27460347F
            DE6D5A6A465A6A665454DCA57317B535751D1C4769E9130401BE5ACA53BB1F07
            E184194371FB0113566DF3D4D5D1E2106EC7FA238EE307FDB4380907514B202C
            4D3E79F4FAC1F5FBEF332247DADBEAEBEB6B69CA0FC3E8BC2A1BC28553216608
            3E14A25700F90C47CD9FB9545F5CD975D1103CAFA84769F0CDC19B5D3074FCFE
            75CAA390D78F1EDDA9A0AFDAB079A35A356BEA6AAB09B7577EE4DE58BE5D86B1
            37A7112EAEE3A6D46D5C09D668F981FB4D3F0260394EC3266CDBB98EC6689C27
            59CF19CBE62D9F55B6F886B840115686F97AEDD6AD286EDFAB7665933AFC815A
            E937F3C5AB984BE7AF4C9E3C4ABE906FE23BEFF49EC130F24D488ADF86F56255
            DAC5CDB9A299B130C51F476D312084D51D878FDBBE77230D79FC17C51DF30358
            E0BCC95ECE93461B99EAF1F8654382A3F40D340C8DF5CB70EDE04DE18F3EED38
            E4B56CC55A86A131AC6CE4D9B963D7DA776FAD2C96EB9DA2F1CDDFF982F72411
            06D9BDE3446454781FDBCE0DEBD5A1284E482812AEE5E597243F0DE061F7220F
            9FF90B27FFC09DCBD28ECD87FBEFDD78969C9ADAA34F3B98B383617BFDCF76E9
            DA58CFD090DFA2B2583B9F48357BC2228F15B371114B94EA227F61A029E6ECB1
            A0765D5AA96B900A3BA320BE390E501699189BB366ED3AEB4E8D3A77EDC4321C
            FA3B84A8429EFBADDFE7EC3A0C083AA1E0C3AF9C03D81B1C4707FC37E4E8E943
            E0D7ABA7C39F479E99E436195E1B2ED34D411174A7DF8991CEBD85A24D3FB671
            B0DE1186921BD7EF9D30C9B640A193CFF8A6590AA108AF79CBED9C8656B534A5
            7873E0576E6EC1697334CA91BECB774E9A6D8FFC72D696DF0243E90B876FDDBC
            7D3B212161DEB2C966A695CA4A80C32BA40C54D61801E525C3B028020C83E2D7
            C8DCBA18BD7FAB7F42D2FB80333B7065B4F0B91C873218426CD978C4715C7F46
            066FFE16E010886FFE9C56B4C26BDBF4B94E42B6C5AFDCD9227619A1688968D9
            F21513274DD0D42CE57D6CA091EE5D7BD5B2633506380225E31821910785E575
            88630141870EED69DFB1F983A0BB3B0EFBFF20B5C154611A187A24BCB3898984
            A4BC130107954415BBF56D5D82C72960421D3B7AB9EF800E5229929414AFAF67
            981F977C3A31FAFAC5C7D057AFFA0F6A2B933185312D004AD1528E16ADF0F69D
            3D7F3CC2FD369797CF5080F757C3423F3C79FC6AE888CE1425FBE61DFF625F08
            0DBD05F3A7A4C7A8FAECF4A4986C12578507F71C246E98C4CA91AC14494E9452
            1476E1D4E547C13772A42903ECBA76EFDA93C095F82C3FD2CB7DDDD8F1C3B52A
            A808197FA59F0C6F8E1D0FB8F4293EDE7E9C2D4990C042BA77FD958AAA72FD26
            16DF7C1CF0C0FAE53BED460F525513C31377F83A9852C1279E928FEF45444444
            0E18D205C31914FD869507CDAED8774926A63AC8F7A6969719C03B1A5919EC9A
            557E4EE3861B1968F3D2AECC6622246D4A659952A94CACA40AF42EAC04008C14
            92B4ED67BB64D54AF34A46E057FE26032AAF51C53BDC542EEB366E86DF4E1F45
            D6F08F00CBD2B1EF3EADF5DEB4C2CF0383B1046EEF9663C6A6461DBAB7286E67
            109A470A39A887CD94E90BEEDF7E15F3F66E4A4AA22447AAAA86566D608E72CA
            32262B25258BCEC5B23229268B69D8A8B9C3685B2D1355A94C82A204F9A55246
            8139969D45ABAA7F9FF5CF6756D2C2F5EBEFBB77212FACC5401F8FC34E04DE88
            088FB073E85F414FBD480B88E54B6BC251E459BEDF1E0B669E94C0B2035F1B35
            C06189DF2A7D1D2D7E62CC17752E5074D1FCE5BDFAFC57DFAAC6F7B241E19A22
            7CFC848E7AF361EB720FEF2DBB503EF3D66FD5B6EEBDBB9B573351EC0CCC2DE5
            CBE1016ABC7529F8D28593CDDB74323631090B7F13B07DFB928DCB2A55365612
            911CCC97FA463A6D4E66A6FB5C8FD468C98A0D6B2A98628AEF03FD4DC7446555
            34D78465447E8CA96896BE75F6B9B57523999284C495917CB7E9F9F47A0AC394
            5E3E8BBF7C31283327C56668EF2AD5CC288AFABA55C87CFA20B5B1B19E3D67F6
            DA55FE47CE058A0041E065E8EFA2CE23C7AFDCE0ABA222CF0D2EF05717FB896B
            B7F914530D50D0CA244900E5F0FE4DDA9963E70C8D8D7A0E6D07ACF798B789B7
            AE3D494E0C0EBA7665F830CF81F64D1014BF7AFCDEAD3B373D56CC44F90B5C53
            C6CC59BD6509036F18E69250C508CA8B494E4DD1D5D6033B03BE2327410E7DFC
            30BC7133CB529811E025DDDAB559B7F1A0B9A51649A89465FC1CBC7AD5A26D55
            CCEBF61E591D43B4380A79F726E564E0C517A1F7B5F454060CEDDCB4597B7EB8
            BC147558F90E380F5218131642292810BF14F4B851E2538C54AF220164B1C7F8
            A51A46C454F7E9E0590E61F9FD27600819FE2003DB94FC29FBE9A3D75BFC36CD
            9C3BB95E836A407A03CBE8C4BEDB514F23C41A2AADAC1BD76B5389660B920A98
            EDF07E23771FD98516BAD20083481CEE3ACE6DD316DFCFE9E0F03A058D1360C7
            600A29CBDFE1F370F7193B71A0B1A12994282836C575D6BC25EE5AEA1A349375
            EBD6D566ADBA8BC508C6F1514F045B306B89C3981126E60638019336A7B9CCF6
            F65D3A79BCEB9C451E8686FA0201AD59EF7360CB2E3D6D23AF151BAD9A9A0B7A
            8D2F490BF60A138AC67E3F5E9079D3E7B9B84E3432D72B0DBE19303847C3BA37
            700F21555239EC9B176F77FA07DCB8BC97552117AFF031AF64666959094C75B3
            F799A3873CF58C0D9555CCB705AC6768190AE3E6347FA58DE8D7BABF9A8ED4DD
            7B5D8D9A72B365D3FAAD772F05EF3EB1413E183C6E618500FBEDCBCFFDF7AC76
            F75A56C5DC584840BD7BEBD1B347610E63861F3B78638843DB1D1BF7B5EDD0FE
            4D707852F6473B475B9683259B018D4C1835C2C17181554B330E516C179396CC
            8C771AB1EFF821AE889C653AE14356D0956B4347F665D83449AA56D4AB98E7CF
            C37A0F6F2FA592EE5C7B72FBDCF3E57EEE1C91EB3ED1E3FC99234F2223C1FC42
            1F47474786F71AD4959F2DCACB67A1162821546EEAD5A9FFA98B81020601BEFB
            75EA7BECF2719A424E1DBED1C7A625C70905BD391AA86C5C7AEFFA737D0373CB
            5A060C9F2779FFCE6B80AA3A0DABAAA9299704470A8059AB8468CAC479ABD779
            16284FFE5DC01630050545DEC0A276E5AA96C72E1C6358EEE2F16B018776F907
            ECA4007371D483DBCFC68EB06BDAA8E5BBA477BAFA9ABBF607063F086EDEDA0A
            B0F4A2C97EF356B8F0F749185E8B618E43C7F9EDF64D7C97A9A1AFA5A6CA2D98
            B9222B3B71D5C6D54821479C0FF0C96B10311CB573E3D19A352D9AB5B7C2F85D
            067CC8D7C1130FE9677730700FC25208267C8E5C3A77FBE2990B2BD67B16F03F
            79DC203E5E5B6D9C0644BC88BB7FEFE6B4B9E381359777CA033C1F385EC08133
            6D5AB44A4D4B0DBA72CE75AA93DF9A801EFDAC8D0C0C08A5CFDB72FE7850ED46
            F54C4D75C15B25598CABA3CB8E435BF3780E75B173DDB4671D78DFF0BEA3F61E
            F7072A9EE30F8D584EF6EAE9C7718E03AF3C7CA0D075AF5EBE59E5B16AFB91CD
            2517E9405303526364A8FDC0E1FB4EEF156C9A323D0F45D181DDFAC7BD8BBCFF
            EAD9F2855B7AFCD7AAA245252D2D5578618AA5D81CE509AEAE5B76F92238613F
            CC69B1B7B781913A2FC991313613B71C5C0B7C538E1125BCCF3E796AAFCB0458
            6FD8AEAFE39EE3DB1FDC7875FEFCF1F94B6609D547F30F08DE4CE0A4E7EC0DF3
            96B8523425C966967BADF65A39479A823CBAF57A83AF9F582FB38975E55E5D86
            6F5AB77DF1CA45DC679382F5DF1AA8A3A906D811FBF2623414E6386E3F60D478
            B719082969D4AC360B93AF3F6B71C1B0F25BB97B887D1FDFA53B3AFF67BD75B3
            FFCE83BE793590589E04A1FB3BDB6DD152DFF9BC344672B36473A77AF86C5BC6
            D114C7FF75D47037FFBDBEFCF92FD9A17937EF85DEF55BD4BF7FE3D18E3DFEDB
            0F6DE060E100182643844B5B343AC2D669CFE1ADC5380A8A847518C260B1D327
            AEBF7CF96C86FB44F0E1DAA5BB00EE27CC1A56C6FA7B8AF3E453017B6E3C793F
            BC57D71C4946C55A5AF6A39DBBFFD70FCCFB7D4CEAA19D7B5C678C5212AB4F76
            9C397FD5420D3512E8DA88B08F37826EF5ECDD8D20E90A063A82810A8447F0C3
            E86B97AFB9CDB23F71ECDCB50B0F7CB72C6259298A8AE405A6103E4C8429DDBF
            1CFEE4F9DD316EC381B879F9346289C7425B8781BDFAF657F001500797026FA5
            E6240E1ADA0FBC5630DBC154A78F99E738D1A17A1D5384FB525021DCA513F728
            22B776ADBAE70F9F1E3D7300476BC00121D664244EC646E4AC5EB5C067DD6AC0
            8DC37A8DAADDB0B1DB545749AE34F8FA8BFBB75EDDBEBD53B542FA48D7597AC6
            16CD1A5B09F7FD3FDF1514980C5215708B249414D5D15356901AFF85129D94C0
            802EC631346C63801114CB9049F1B9AF42231353636BD5AA6A59B3B25007ABB0
            30284B7CB32833D775DEF90B27C74F9FBC6FDB8E4B776E2BB201E04A28A45FE7
            7E27AE1C038819DEDB7EF7899D28205A9C70B19BB9698F7744588CC388A157AF
            DFE2080A83E7BE082D4536FAEE9E32CB81E3AF202EF25878EBE63DD38A163959
            5960A8361DDA77EFDEB572958A60E5E1E191356A00DB9579F9222A370BB36A66
            8642B6E014432FF3583F6BE1F8FC8B073FFB2CDFD2BD73CF2A752B8ABE0CEA80
            EF8F1B3675E3BE55C2AFCB962C7CF238B48E659D464D1A69192BB76A6E0D130F
            2816CF7783535ED3BAB4A7C08A07D3D3B3DEC725043F88044CAFAAAE265616AB
            A96A01FF05C7728D8D8D125312AA57AF1611166D6666962149D6ADA0A3A5A52C
            C47218862A61E645D9F237B2C6CB57AD02E1E43C7E8CEDE82DBBB73238AB9096
            C0EFC84CCBE8D3A9FBC5FBD706761878E4CA711CA7CE1EBC9D41A70C19D60728
            60B02CE7E12E9EAB7C742AA894AA5009DC7789845252C20B3B5742E5F102BBAC
            2844A700A03B5F86BCD354573732D52388DF9661F1F3E057E4AFC163070AC145
            34821461E209CC01CB2B70D4ED6B4FCDCC0CCCAA56C4BE1517FC7900E33A4058
            E2CCAF2C75F7CBA03C5FF1DF82727CFF5B508EEF7F0BCAF1FD6F4139BEFF2D28
            C7F7BF05E5F8FEB7A01CDFFF1694E3FBDF82727CFF5B508EEF7F0BCAF1FD6F41
            39BEBF1B60A949EC87CA65FF4628C7F7F7019FEB4FA33F78C5EBF7C1CFC5375F
            8C11668DC36E1E1C8160420D481636118337A8F80662883CC99F4FAEE2F8CE8A
            1C9FF2F767ED292BB42147B1E0BBEF1B343761B832BBB25B12A0591AA6E6C82F
            00C12C72B04122D89D9A8257A0388281ED14693EF542A8358CC13AAA68D1FDDE
            7F1670F232D034CB6038C90FC4805D22E5754E595E28E6E543F03826598E6219
            58A000267EFF49229361D9A00B8FBDDC6C4DEAD52239F35D47D7FFF8A593EF19
            5D8AC0ADC2F9D6E27C4E701622CD92C6BC4F023FBF094D045B8A8B52AB5BD6D0
            37AB4012988AD6CFCC67123A22C3C2D818BC8ECA722821A4D7B048FC87B4DC4C
            E6F9B337C99F3E86BF0EB7EEDCE15D4C58568E545387D454D3D2D1D24B48F8F8
            F163828EAE5E66467A6E0E5EA3463516C51B37AB696CAA01C80487295D8870E7
            FC976D6EE1F50969801D9AB58B791F19111727C9963EB8F5B26D97063F6D4498
            7FCD828513401852184746867C4AFCF4E9E193472CC326A7C6696BAB1B57D257
            5756D53334D1D6D602725459595926C9097BFDEAC3DB5849AE243C2C26F16D46
            C0955D054AB89411BE1158301E5ECDA290AC64FACAE51BEF621273323F699928
            55AB5ACDC4CCC0D4D4544545592892CB5F30106E7D5279972AE4E60FC330B1B1
            1F3F7E488E8C887E17FEA68A45ED210EDD610D7B04FB3D57DB84C9C1B2F6F8DB
            F0C495DECB37ED5C4D51148E93BBB61C1EE53CF0A75D5246594E8A634A3485AC
            9CBD59CD0837B6D068D0C0CAA272B5BC29C9EFB90959598A069B42E5166143DF
            C7C6AEF1583E7FB1AFBA61BE54BBD2E15B681802ABFDF33768E36332EEDE7B70
            F1DCF9AEDDAC0DCD0D2C2D2B69EA5450A80E9A6361BE129F4D8C03BE4761FD66
            0CC7F8CFE0B589BC8BB8A8D04B9866290C17014DE5BBDAEF538CCC6BD9449684
            AAE877A19C034A08259C874C5EBAD14343530DE1AFF91CF03F61635FA29EE4DF
            B5ABB0BF29C711041EFF4EEAE535A776DD2A8E1347131C89099DCE708CCEBB97
            AFA8ACF13913575E135C8E780E47B3A599361DFB9DBF1DF4B9F37569F00DF34A
            49260BB97EF551C8EBD75A3A2A1A3A98A985A5559D1AF9AF58FEE06D538172EF
            DDB9B375DDA1ED077C055228DBFD2D21D0B4EC537CD6EE1DFED3E74D16B63827
            5576EFFE9D0EDDDA97F95860D3EE5C0AD9B56B8BA39B5DD3264D65329990595C
            EAD7F5696D7DF2D6F7E09BEF6F003BEB42930A658090498B9706041C4354B39A
            B7A85BD3B20949620CC5E1245A20E1F707F12DD02FC3227EAB7D7B0DB0AB68AE
            F14B8B9D7DB16BDCDCC9CB662C9AACAA22C2F994D6C03DD7FA0C6E4388CB663E
            C25E512C2DC2499F053BD40CB8D12E8E5959192A2A6A02D197FACD3447DBF518
            76F07CC077E19B066E004E70B21CE2E2C98797AE1CB6193AA071EB8680EE8ABD
            DD593600D8FAC9BD901C29D5C6BA09F26395E54B0D8909E9DEF397AEDEE20D7E
            16AE83B84FF55ABC6A6E5995189157AA6131CFD9AB078EEA5DA366D5B22AB101
            C868FE8C258B96CFF906BEA1F0845735E1E6029D9193C62D5DBCC2C004EF3B64
            B09191294B51B05506BC23FFD30BE880994484BD9348E83A0DAB60BF3C419867
            2F7485A75FD316F5DA74680E6B02E05C6C64864C9656A5865959C91BA161D0C1
            5D576B5819D4AD55836FF1F4A39EBDD0D9EDF489075A1A4C1BEB969FC7FA0A7F
            B3C00BE258FCC5F377ABBCBC47B90DB26E678D6280D13F5FF02FE1B5FA1F9D37
            4B5FBE70C7AA617D5D3DD55F6FB23108F43AC6394EDEB8DD07468210192B152D
            F55E39CF639A50EEA04C46E1183A2626F5C2B993635D1DCAAAB0057F4B52B47A
            E5E629D3C6E6974345E01B5888803CA439E4D180C36919318EAE6ECA040A3B29
            71288EE7B59D44BFF8E16780A24BA1E742DFF90BDDE0AC7E397F0353599AC58D
            B61FB53F7037B0796929BADA7BD3AC052E655B2C0A58DE278E5FEED5A71B87D0
            6571A94570D2D0ADBE0176CEFD44E4178D220BE29B666424A6B47DCB718934CE
            DE618C58592861F91BB4263461282A2931EB454868A76EAD7E4BD128E0799F3D
            7E2FEE4398F3F8D15426B266FD0EC73183B475D4CA7614202AF6EF3A3DD2A95F
            19F920348A9241979FD6AC55C9C048ABC0DFBEC4376C341DEBBFD9BFFBE08E6D
            DBB4E2508A637F5BC952BE602CB179DD91B1E3077265E4E3951CF8C83F0A4C14
            57C7859E2B664685C49D3D736ABAE7383129E6ABFDFCE834F89A4188805DF0F3
            9993277AF5EB877C1DDF7CBC83E157CF3BDF45C97D562E759847F7DE88C454DD
            7AB50B6B9CCFF8062FB87AE256A64CD2B75F67A028CBAAECED0F00FDE86634AA
            4C356E52FB6757692D0CC05665395892AB5F47BB460D1BA31A12F779B3CAD05E
            61699A92214A2A10790CDFDDAB78E666D82C4EAAEEBB7CDFF37BB7EBD6AE35C9
            DB9928844B299D2DC254C243133225A94D9AD52A72D35021160396F1E846787C
            C6BB5EFF75A6614109546194FDCA5D46F25D5A0F7E12F53E26AE47EF76C024E6
            C9F9BBAA4009A731386CE959E225401381133AB78209E45212E5E5CBD63E7F78
            7E73C07E2D350DD8828D654BE77F0AAD4079FB23CFDAE568EF853B662E941B53
            7C01FDA2DFCCD7EE045B805EBD78AB5D9766CD2C6AD94D1D3F61A20B8E905F2E
            0C56687C7C27225B96D8D6BA053C73428AF0DDF9FA8A9CF463B4E4ECE5332347
            0D86D5867EDFC9445E44903A71EC566A6AAAFDA8FE1C521A95068D4B29969B2B
            53D66050445CC21740B242181C23933F4916CC5BAEA9C3247D4C1F3172488B76
            2D4AF4FCD78161281C152118231C2909A72FED9AB4BAFEF0F6374D3FFEEFD247
            F7229BB604728EBA7EFDAEB5755BE4CBB32F1401AE1379E6F4ED060D6B9854D4
            2D461CCA0B0AF05DD597D0605ABF298625AFA409AB2160C702EE366A666E5EC9
            989F5BA9F889AF8FE330C86547C02656389245F87A4E798D26791982F0277A38
            DFF3177E989AC0DCB91DB277DFEA2EDD5BDB8D1C439088E390895B0FAC45D11F
            B515510609BAF85047CFA456035D82806745001DBD3BD99FBCBCAB04F886D541
            9E3F8CABDB580F9E713304037B1A32BCA4E1F85A18E48B27310F1E063B8CED0D
            084BF062BEA677E0D985DFDA401BBB4E9A5A9A3F1BA9DF5818AC122ADAEB7FA9
            77BFF6EA9A3F447682868AFF94E034C0CE6BD926AB9695855DA011195F4B3517
            43602FE1B7AF93F52B68DFBFF3E6D9F33BAFC35F1855170F1F3AD2A29225D0D3
            605BD293645E8B16FA6C5CF1E3DE17CDB02481F76C35F8CC6D79681350772FEB
            DE67824E7EF3E5805E5929B7D473EDFC2593F3AA1552F0BA3C2B2370B5A40FB2
            C74F9F5A58EA57B3AC5C9279A25209B772E5D2E933A7FC6089D0D2E3863FEBC5
            502EFC655A50D0B54136ED3534D5397846F403E704C22E4B73511139DE6EF8FB
            38ACAD75CFECEC4C531383C4C4141CA342439F66A624A466BCEB327068F7BED6
            552AD55557558247F7742E862BF17205391978D9C4D0A851CBDA7CB4EB87741C
            50FD04863B0C72DA71789BC2401939D87157C0F6629024947803F8FE189B72F3
            EAED8123BA10B8BC1817B0F512A2D2AE5DBBA9676450AF6E3D7D53B1A2070CCD
            9B9A08AC6157C49CD1D877A926A61ABCB9FF7BD436104D384E1CDD1FA469A0DC
            A94373966390323DED06E60E4E201495969DCDA8AAAAE7E6E68AC5CA244986BE
            783D7FF6FCA3A70E098E082F1238A16E1ADC170CF55EB4CEC66E80A9993E90F9
            DF652D1606A186EB585BD765EB5668E9429C81DD6EDBB0F58D27B78AC137CDCA
            48783C835D397B2F39399596A9063FBC909E919AF229515D4313D560AA57AFC4
            70644A4A3CCAA8C57F48926550BA3A464E4E768DDAD76351190A2C86C2F92DCF
            9F46D76D60AE5867491790DF58F8CEFAA9BC9E4684A24540EA26C4D0070FED1F
            6CD3A582892EC137CE00BCFDF9957CA705DE66C36061906FED7BE17E0B344263
            08C9C2B2FD328C1103538E2060F1D7B4F4ECF53E5BE72D9CC4B7E7853B2364D1
            088DA681D9E83074CA8EFDAB0547FCBBB6A5F086007EC33174B48DABDFDE7518
            2E777C3AB5E872F9EEC57CF51B859DE1BBF7A02C6C172F452E1CBF7B21E8B024
            23BD45FB460D6A5B3F7DF142575FAB7B8796624D55FE11864F2A004B23855ED8
            AFC3238E1F0B087D14655EB1C5B4D94334F5545898A3F07943D0C8F094CA5535
            85A6D825C49CC22F2F457947A11415C749704CE55D64F2ED5B4F3574B91E3D3B
            F3382D827A60712E9A856155B444919F92F7D7F8F021D16BEEE24DFE6BF95A7A
            2C5FB0F2F35A32D2B29C474F3A7064FBF7B281A2D347A17523237B0DF2DDB055
            D35493FF263A76E8B8AD073716783FC3E510AC72560AB67CF9122333F3FAF51A
            A427675DBB79B966C36A1DDBB7353535E4501A61F162C85E4A536252B4FFC8BE
            D3BB2F356DDA79D2DC615F3067C4EB64806F7E46258D24087BAAA8E7AB581BC7
            17FA44B8CFDEBBFCFB1CDFFD81A75CF83987DEBE1EF12CE48955038B966D9B42
            7EC200F5176C57C1F20526EF5F080F0D0D1DEAF21F41027C7C5BA32B527CBEF9
            CD37E1B1EB56F8ADDBB6045665450A62E86D44D2B1A3E7A6CC1A518C6FA348F2
            E1D3DBC01A099AA2719CEF9C86718AFE6970F9080EBE38A073CF15CBDD2B3780
            DE1D20B2B1C35DB71FDCC89FF1F267911846D3E025B2233B6FBD7A7B7BE6BCB9
            045F2E17D0E29347910DEA5902F9849324DC46B4381F956268F0202D65442AE4
            34D7D104576BD9C6C91C273F7D402919171D9554A9B2165F42F0C7AC121A797E
            2DAA61E72A00EBBCDF93F7363E4B072C0741944E04DC0B7EF6A8767DB35E7DBB
            8B48BC18B9025B408D706AD6BCE195A0F3DD3AD80D1FD30F2FD3FCDFB8988FBB
            771E70F798522446439E87873E89B41DD5A338FDCA001204CF12198974F48B98
            07F7EF0E751DA2A282710CB673DB09033DCAC76765ED9A1D172C5BA0A5836004
            B974F6DA995E1385F2BC34C5CD98E0BE6AD362609065CB32D544DA79397CC8A7
            E4C40A3A7A8A2A7D0C2B8D8FCB3035D7A7280612D3F7A0083C7FE1D4C9AD6B4F
            055EDE26770B006E80B187C2B65AC40F065A92E3939BB4B2887893C1C21E02BC
            0E4661D007A190A78F62F7EDDDAD6F84B568DBA54D9B46E053807D0665F232B0
            E4D58E11DEFF16DCE3B888D48A16BAE0B7B464E9DE9D7B5DA73AC8BBD371C24A
            84EDE178066305375D1E1B861F2102877382D0E1B07CE2460EAF42DF9E3B7971
            EA9CB145468E2F5FBA959D42F719D23EFFEEE56184E39BC0809732F7AEBDF35D
            3AA76A7D330333B31AD56B267E900D1A664D30E499A32F75D44439928C4D9B16
            AD3FB0515FDF1827C85EEDBB9FBA764EC0A22C979EE9366FCD9665A98932CF59
            9E59E929E93939C6C606624C65FAFCB93AA69F730B689ACA136CDF6E5F5000A4
            5229418AF76CF54E4ED0993ADF0929DBFC734AC2CD745EE2BD652E466613B86A
            6E067778F7B590909B1F923FB4B1AE3E78A883B6B626BF00F9C931DC658C8152
            1E782BB0D8B2F01A064C293319D1D4838B0C7BF4DE7DE684E55B7CCDCD8D0902
            67600D4D0466B542270EB8A160FEE8EB900FD76FDC0A7F11BC66AB378C9031D2
            B424648FEFE1CCF4B4BA8DEA76EAD752591350B3B8C06C6FDF7812151E3E62B4
            4D010616D4C11EFFE34D9B36B6AC65F2F9735EE2C2BB130C06ED290C7B191C77
            E3CE45E7710E90D438A92403993165F2BAAD1B11967AF93258A4A661625C5955
            2CE2CB7853D24C6CF430FB7DA7F709F88E7F9F7AFAC8496D55934FB2903163A6
            08BEE7AD7B3703F707BC7E1E51BD46EB15EBDD85F635423267FC87447D035DBC
            5475080129B7AAD7F2F6F33BA5AC8F2CF0162A942B975F0F81B9C86FDF7E741C
            3C7CB1F7DA270F5EDFBD7BC1CC54A37597661DBA0E7C1B9A2B91A65835AFC8EB
            278EE745612574623C73E1E0F9F3E74F66D38915F42A686B56F2F07657D726DE
            BC8C5CBD649D58A4A66342B8CD18AF22D606FA1B48CE8B279FEDDFBA2D4792A0
            A4A66D6A626E3F7EAC654D4DDEAA53DABE61FD83DBF19BF72F7E763F6EF14227
            DBD143B3B3B33191EAF3EB11B3E67B68EA61798135C1F542776D0F8C7DFB76AE
            E7D4A20A2E637EEBF6DAD80ED4AAC05389C0D439E8BA55471BB5AEDFAC65558C
            90F3DCC2F1EBDDD78C4701E53148E4CB8FC18F1F0FB0EB89E19018617F145890
            9B9737281DFCE0F5A51367672D95B7248C7E9370FFE6FD46D696950D6B922A0C
            4571BCC582112202D0F3CDA06BAFC3929C5C06F08E03A4BFB414194D4975F5BF
            FB285608CF0DEB3372DF895DA5C437AC010B0C499455747E95A651A78FDDD9BB
            CBE745D803BB71CED61DBBB569D514367FCDC40675EAC7AAA5AB887557AEF633
            AAAA01A52046CBA81C82507FF63072F2C881AEF3170E1CDA5F28464F316CD796
            3D664CF7EAD8A73EC6E74CC9B31639198E8A86FFE7D4A8539DB12EE394944482
            2C18D063E8D1B3FB4F1F7ADAAD8F556E0E3B6DF264BF5DBEB6BDECF79DD80943
            D6E079147D191A316DACDBD99B6728469E6D078C06202A164CF7EC67635BAF61
            9582AB6361F6F1CC49F3172D5BA0A40CA395CF6E467D8C4FD5A9A455AD864E52
            FAA759A3BC66CC756FD2A61ACD715DAC9A4C5DE4D3B5774B12259D864FD9BC7B
            B5A09E018A6956029680F1CDE30095DF097A73E7CEE5A9735C04CBE66ED01389
            34BD63F7F65BD71F1E3D7E086F4F41FDC7D0283C2A435067BBE99BF7AC10DA03
            702CFE3E3E75A5D7D2B59B977F97BFC01FC3E09404DDB061F3E4E9CEA5C47746
            6A7A445862EAC7AC0B174F7F4AFFA8A1293235D76DD5D2BA828551EF064D9F45
            27A3620A2559690AD1B76BF771B3ECFAF7B38B8C7EEFD46B68D0ABEB804E6222
            922F1FBF7DEFE1A56C699CC394491DADDB1FDA7D76C0D02E30631AB8A924D6C5
            AAE9F11B777031946304DFAC333D8D1E33C469C9E60555CC2B33FC7523041A40
            C8ABE064CB061A07B65DDAB1796DF5EAA6BE3B36EEF2396D69A5DFAE7373A823
            301A388C18812D9AB4B069BB4EDD7AB750B43F01EFB4F96FF88E7D7B95350A17
            BB072A86983A61CEEA0D4BC0DF668C5E62521BEBDCA9E3BBE8F89C0CB25FBF4E
            AC88F49E3FAF6FFF51751A5BF4EDD0637BC0014D1DD5DBA75FA4D349BDFB5BF3
            C69FC0D5DCDBA84F952CF4052B7E89C7965EBDDBD56E5005E54D8DB0E0E8B4B4
            CCE6EDEB2D74F79E3D7FA69298151AC30199979D89A86B92DD5BF53977FB849C
            FE30DC77E12E0493B8CD1B5B4274E7EB13433A0F75F3DB2F2FD75D3AFD2D147F
            FFC2E7A128EAE3874FDDDBB579F12692C1189CC3FB7619B8C27749B5BA96028F
            0EED35F0C983C7CD5B75CDC6E3EB566D327DFE1C20284831FB3E226DFFCEC0D9
            4BC7F0B20B90391EB0EBD800DBDEA498B87AFE69876EF5D392B39D47BAF86E5E
            6E60622CCC56615BE5E5D0E1C207922C7ACEC4D93E3B567CAE3FCDE5B22C7EEB
            FA93B4F8E4DE36DDF2628CB063468F56FF1DBB745AA45CD0B7018FCAB2B919D3
            27ADF55B3B7DA2D7B4D9CE064615783F8213CC25C1FF5AEEE93773BEB3BD8DCB
            8E039B6459C8C2458BBD96CCC6BE2C9A6CDBCFF1C031DE8347B9D91317B87BCD
            5385F2185AB2678F5ED3AB60D0A44DF5773109678F5C729A34143641E6AD7102
            17F769D9DBBC9ED15A3F58DD5EC8FB983676DA405B9B66ED1A96D48782D5F381
            C1C11EF20F32ABA9DBACA9959C0A4BD3CF8286EFC309860F907DBE97969E96D5
            A456CDFB4FC334F5C58B67ADAF6CA935DC69446E0E438A3060A0CD709CE6E9BB
            4CAC4EC487E7AC5AB562E5E679140DD41B1E11FE313434B8FF40C1F381F273D1
            1CDFB94BDDB293646B56FACEF674DDE77F1641B36C470C2349BC70456320EC24
            12A9AAAA8A8CA29F3E0C95A4D1ADBB5BE1729A4093139967B7C2CDCD744E5F3E
            E13ADD11FFDC3705EBD0A4FDD587D70ABD0DE2323E36E9E4B9D3DACAFAA99FDE
            3B4D72847DFFE08914C7DF2C815F03D3983EDE7BC5FA99DD5BF63F772770ECD0
            D92B372E54514361DA36220F024AA5CCC6351BA6CC9A08E91865DD272E9CE335
            5FACCC0AE702E78FDD68D4A84905130268ECFE9DFA065E3E0EDB7640558D0FEA
            32D2AA439539B3E6E71D8D83CFB131B6A3172D5B6C6CA1570CBEF3C52E814523
            05DA76E5E2834686D936A3EC59483464A9F9BB68C8CC90B46FD070D3EE7DB5EB
            5B2D5FB074D16AF7B43489BABA12D0BF008BD3C7CE99387D7A450B8D909791BE
            9EABB61FDA2C4CF1D6C527C695F42B5733841D5F387CE9E2D52EAECEDABAA22B
            A7EE8B35B0B61D5A0CEDE3B479CF261555A4F0D92887D0974EDD5755556BD511
            5EDD9B3066A6D792B95A5AEAB1A1A9A74F5E3B1CB8BB5127235B9B61DAEA1523
            2262DA776E9E97AD0025B66DAF21074E1F2A101886CA8261AF5F7921C94A3A1C
            7862D7FEF5057287E49203C19C474CDEBCD767CC5097114EE37191AC45AB061C
            4F7CC28D5840DF69A9592F9E86B5EED05878F562F765EEEEB3688C026E089846
            F0D3973A5A7A6695F5C0FE873C7BB86FC3C5A59BE61334E234C2AD79B7264E4E
            C3152D4A85540837C7C90B562CD2D6512F66FF8526611C272509D5F7EF52162E
            F09A386D6CCD9AD53E44646CDCB079C6A2B15A9A5A65896F40D11DAC1AAEF3DB
            16F3211B4152CD2A354B8D4E7CFCE4E1BB4F9FEA5999BD7EF162ACAB6B95FAC6
            1F5E27AD5BE7B362A3B7B08BCB176C1C38B48F85A571F8EB8F8931B1AD3B3715
            7AA68EB75FB06EAB074AA203BB8F3C726E972242A490D542586B86DB8251A36C
            ABD5AE0C95DCCAADDD3AF49B3DC1C1A0363AD46E8AB575078477FF268F9A3D6F
            99BB8EA15A5EC486CDCE62273A8ED971C83FFF9D5E413BE0383B75C2EA05DED3
            470FB43F787637EFFEF25C2B6F8601ADE529A397B4E954B37DE7EECB17786467
            90BE3BBD84E8A28021F97D1119B7DB7FA7E3D851E05719959B109D346F81FDE2
            D5BB4D0C4D005964A64B82835FB56E6B05282397426EDD3CB975D5BEE16387B7
            6ED7464B53953FC0C1859804C3C8806143929C548A8844C4979CAC080CCA0F23
            C04F291FB2D6F8AEAD51AFE6D0613D1878984A464725696A29E9EB6B41D62FCB
            7AF72C5AC7B4727F9B5191911F52A3C392A984FEC3FADB398E3236AA0AFE3AD9
            798ACFC6D58023EFDE7C7EFCE8A925ABE601E71B7835539CE78D9F32454525B7
            82810141627C7E15BCE430B2BFEBB6831B4811D2A57DDF43078E681AB07C330B
            5688D6C25BB20C9D162FF659BD7AA6E764B1185E309FE6320B23A5333CE654D0
            D543F27A9303B01F30C6FFC896BC103D8CC6A4A5E44C7371DB7E781BDF13A520
            9738DB4F5FB765C5A861E3F61CDE082FD4F3CDDA583417B0354E29AD5FBDBB6A
            2DDDEEBD7A3EBF17B66FE741438B4AA39C464812D3AF5D7CBEC7DF57AC196F5A
            BBC630FB71B56BD5575115C9532B50542A952A2929817F4522F9B973D0D5BB1D
            3AB6E46BBFF3750F3816F8AB25CB9762F9E45D3EF78AC8E2583536078F7DFF29
            F0C4714D4DA54136BDB4B4B491BCE853C1D2FF65D9CF8246DA5B354A4F4E54D3
            544F90A54546C5735045C3C602C062F3725F3AC47654ADFA265B371D48FAF469
            FADCF180F764B9A211FD0757AE56BF658B4EFD8637E34D3639BEEDFABA6C3BB0
            0127D1A70F9ECC99E836DC79D148276B85F67A7433E6CCE99DA6354C0001D4AD
            D9D6AAA9298E2A8DB79FB671CF4A9686A966B065111FA99565D23E3E5B677938
            F33617CFDF2C979A22711A62177835B0D09D3704B0FECAA52B172C9915B0EFE8
            AE759B36F89F303052059C96F43E75FFDED3A1A18FA6788CAC65D510582FC999
            A908855C0A3A1DFCE041AD3AE63DFBDA57D0D2033E37D009B09005BC954F03D7
            0EA6D2F16744C29484B168D8A80E1734859C2E855360C55984409A79010E8585
            2AFC273949826413CF9EBD56D796BE7C11DBB6470B5535524F57434671C0ACE4
            DBE1A045B5392C5BFE46D026B5AB2D58E0BD66CD3A27D7D1036D6C843C2121BE
            B172916F9FBE3616B50C8E1D3D939D2E19396610454B3F44A75F3C777AF44487
            696EB334C4FAF3BDA7008784A74AC27DCAB2854B67E12238E3FB77EEF8AC5E6B
            6468919A9A929A986856B572CFDEFF75EADC066E198244477E3433D7079CE13E
            75D9E255B38466F58AAD79FDF29D58A4645ED550314F20B465526EB48DCBD6FD
            DB94D5BEC037BC911AF41427F0266DEA02FA888A78337BD64C7DCD8A0DAC1AD4
            6E5ED5A29285918139CB20055AD4C9BB1AFDD0A13D4A5374569634F841544C6C
            AC5925F3ACAC2C254205D813289255A972654C841238A12A56CBC8CC14A9709A
            5ADACA2A9492089AFB0C50F0258EB39625BE190A6DD9B0FA83276123874F749B
            3CA11EE0393E8A29F0CDCB90F03D1B8F2EF3733F73FCF285B397D76E59C672CC
            0ACFAD36B67D8DAB6A91A8B87B9B9E13667874EE6685C0236A11D06092CC5C65
            3531C69B9BF9BD3F4011AC3407C548789F1C85D118D8A507C306F5191D7072BB
            1064507CF9755864358B2AF94A1C00DE022E1C3166D8B0452B97199B98E6EF6C
            038CE4151EDBC64F1AA9AC4572B07111AE1897632886815E3FF765E516610381
            402E35CAA1D900EFDFA27C673A98640EEB63C06532F020008A3CD8E695EF470E
            3F01F6041C8BA7398E2180EC2979927499D66FE1D00ECD9A073DB8F73A24ECC9
            C390C1A306E43FCD01D39DE4ECFA292175AE87BBA7C7CA3DC7B7E328D6BFF3D0
            C04BFBE1B93DCB6626663B0C1F1B78653F57AAB6D440886765666B69AB171662
            BC5EC40B7D9FE1B3A63EEB4B4028C09E58BD64E39439E37E717BF95F0665896F
            5ACA9062424651B0813149CAA43429FA7CC60A7B26E12286A6808CC709929151
            B888DCBA6197BDD3488CA078DD468CE8E3B0EBC4E6E29BDF7E0D8025C8D0A8D0
            64333F1681F0E6EBDC14CCCE13F258F29F94F379FFC4E33B21F59AD4FCD9F79C
            7F17FC8AFA6BCF9F24D6A9AF87156AED2BA83D44EE5C41636AB5E78629F35C7F
            2F6FC1702AC6FEB666E83F197E05BE698E820658A17A6AF93364F8AEA8B00719
            224FF8F88D20EF55F65722BCBCBE623994C35F0BE5EC5D0EE5F0D742397B9743
            39FCB550CEDEE5500E7F2D94B3773994C35F0BE5EC5D0EE5F0D742397B974339
            FCB550CEDEE5500E7F2D94B3773994C35F0BE5EC5D0EE5F0D742397B974339FC
            B550CEDEE5F07341B84296077F615EF79F0CE5EC5D0E3F17E42546E14D7BAE04
            458ECBA12CE16F616FC59578F96F1C2AEF23FEF923A1C45EDE8779E5300BB632
            937F98EF6B48B9CEF901E0F85A8C8AFBB87FEB55DBC2EBCE5FAD012DF051E12F
            29E893FF251F7D7279851EF255852F3941FE5FB337CBDF2E84D53B39048375C1
            508E674A58219FE62BB1211C4B730C2CA185B238865294148355D13041A3F055
            755814C7C0B784DBC0187FC99FA1690C36CBC4C13B607F6B1616C8C45012C5E4
            9DE1FECACB8365051CCB311C8B1118C260174FDEBE72FEE2A7D88FA9E9A986E6
            E61D5A77EFF05F037D532DB0A1C4EFEAE7FD9381E1EF387380AD3014612982C0
            69583A0661390A8384CA41B24345388A53948C2461BBA27C9D03689E75F1423C
            4C09FA06564660A40421061B0C681F27BE41877F1A7B73F95AA7E4D39CF917CB
            C98B60737CC5C07CD28F13AA7C50B908604D8A62B3B37395C5625284BD0C7D93
            2BC94D49CED0D234C8CA4A0B0B7B2D12913ABA3A7171718D1B37045B2C12293D
            7AF8585945D9C8505F4B5B333525D5D0D890A629131303750DB1588D80EC2DAF
            AE4FF105D8C80293E6E7FC1D62F5EF05A100159693C33A0C19111BFA524595A0
            55454B7C56B668D13C60EFD1E8C864BB11838DCDD5B9123754F8F3E033651628
            9DCEFF4C23F9EEBAD339F04A7B4E4E6EC4EB588A966664E4242525454646EAE9
            E8BE78F65C4B5323252BCDC8D8489293C3D06C7ACE5B0227014BAA6B68705251
            7A7A3A45511A9A1A2A22ADDCDCDC949494BAF5EA356CD84A46A5B5EBD454594B
            E99BD6D01FC4DE429D79BE8E20CA978F1266CEF285A948D88E4C06B56C760E13
            1B1D97929801E61E11F92A2B4B2222C9F4CC341ACDD5D7D32308A282BEAE442A
            D1D5D5611856554515EC1DC7315A5A6A0CCB0146D6D4D0E02B77704989099A1A
            BA3219929A964A129CAA9A1A9842AE8402B801B38879F72EE153124DC9929252
            452295A4C4A4C48F093A3A152AE8E84B72728D0C75AD9AD635B5305416E360C2
            E0CD3C56E41D8D7EF746FE16DCB10CCBB748808D78E01EECDB12783430A066A3
            CA4D9BB568DBA68DB6B6365FFB15DDB1FE40B62467E24C471CFBFF33D4F9C664
            793E1EECBB8CF3B5E248A05124D9B2C8F00F2F43C2425FDC156A1D82E5556950
            C9C8D01890A2BEBE815496A5A2AC626068089E2708F29B2D56B83C1B9DA62886
            AFC807683B233D2D3236FED9939BC91F5212A225F51AB66AD4BC6AADFA165289
            442416177EC91FC2DE702D2CB4A2A1D8A36448ECDBC4F4A4AC6C89243B33372E
            3E8620D1D49464C0EA062615C4AA22652551ED1A550D4D8C499152DEF33068C3
            77AA837D61586092F3DE0A2C98056BF302AB8606462306DBC440F35BA88C0A06
            85B693BC8821A7A874CAD712013F00635E06BB3DF232992FD987C9A4547454CC
            D327C1097149926CDA50DFB846ED1ACD5BD684BA1DD8A4729CFD734CCE57C007
            720E966502ABDFB074CF9933C75DA78FEDD9B78BA26110504438416E5BBB1738
            3BCE9347A1FF0F7EF817CA59302CF95F539225D1AFE2839F3D0B7BF54A4F5F8F
            50C9ECD0A19DA68EBAB191BE929226C3970C04E6374DB1282CDB0FEC700AD64F
            C47045BB2C7957C9BC826045D6BE5474B7CADF640B165166599220C3A322776D
            59177C3DD2C96562AF119D89A2F6F317B1370B7949DE9F956F17C741D70BA05C
            C6A527E6C6C4BC4FF8989CF8313921319EE672B5749595946155FAEA96D51B34
            A8AFA2AAC4C9BBD6E42D9AFF8FD08742DEDD4B60A7AF748952442DF28C7EEECB
            E89A3C1487C89B6A082DA5E4AF93877C0B564487F49A999971F9F29503FE87CC
            CD6BF5E8D9D3BA6B23199D4BF2CD5F4BDEF4ECEF00A16F12EC8DC7916B576E8F
            7C153C60D8A0B65DDAB2C0F852D49206823587F35EB45E5D5775C274873F99B9
            05BA126A9E72B48C54520693CFCA605F3C8D080D098B8F8FCCC88CACDBAC59B7
            AEDD2AE856F85C9E38DF0B4A22DFBFD9A2B1C016E56B6427848EE03FA7CE5D5B
            36C565D6B22DBDFAB4F9B9C5528B5908DF3E00CE272D21F75D5CFCF3A7A1A14F
            9FE53294695593B6ED1A6666A69B54D43737ABACA4A40AB625976245A4BC3C65
            FEDE8AC2DA7E7B584B817B61CB710CBB7DEDFADA159BDAB6EDE63CD51E4165B0
            330D90DDFF10770B7D6C81B8C58F1FBD7CFAC449DB51361D3BB6E47517A32851
            0F362DF451F4B9D3276D470E34A96CF267B2B74261000B0E5A22C05F4B451F3D
            7E72FAC4291515E5169DABD4ACD9A8A249250A9693A300FB03DD5BC266863F03
            58848989C9F49CE4D2F2BF3E4E8EB63F8BBD6920E14892A2657CE744442A9312
            A488C0488EC2A222DF4785C7A5A564A4A5A648991CF32A267A065A356B5B8A44
            4ACACACA8A3D2DB8C5F90EAC14D2F12B6D387F27C048018CB7638FEF3FDFBD63
            AF9DBD5DE316753968A673F8BF74C6CBF1CDA9AE1EBF137830A09F4DB76EFDBA
            F19B03CB9803FA22081641F1EC74FAD09EA3C69574BBFFD719384425E9FCFA2B
            4130B8F87685480E2D512554E2C253F61D3C9545BF6BDAA469AFFFBAF1EE9FFC
            10FFCF904D50675E3E71D77BC5AAADFB7C2B999BFC14F6E660E70F20ED30E0C7
            4AB3D9D72F631213122323DE2624C56AEB297308D5B66DAB4AE6665A5A7A08AF
            C0299A026E301007C2D0FFD7462CEF16C16E33E1A1517E1BB6F6EEDFA77DA7E6
            1CEF20616CFEB3CABF1C00C5075D7CB067FBF6868D1B8E9E305A498C094DD2F8
            23220E2770F0E3D95377B3D21207DBF56111295FFCFE0F3A181334301F7B81BD
            F0E2DFA65F3C73E54362D480113D2CABD402628A6664B05FC09F749807F6FC63
            7CD69EADFEA6664636F6038B9438DFC1DE7C4F09A123040C0D7272DE44931272
            92E3A5B48C3A78709FBE61052D23B5AAD52AD4AC515753530BCD7722FF7978D8
            2014130206C8FF397BC32623185820F1F0DEB3F3E7AF0F1B3EC0A2AA09CB527C
            4CF58FB233CA1EA0050BE4184B9384383E2679CDEA75DABABA231D8719196BF3
            1D4810D8D80E6C054ECBD295977AAEAA54D960E4B821384A308CD00BE0CFC23B
            C7500881B3147EFEF0EDEB0F2FD4A85DC36E842D87324A04FE27686A05E4D232
            3189B334F62E2269A5CF9A662D1ADA0EED0B5C04B428715902F6FE6C2573005B
            180A63FA2C855CBF1C121515151B1357BFB1C1A7F4F016CDBB55B3AC25168929
            0A9AE81405FB160315AD881022F9CC6CEC6F616F04F696C080C43B1A700148BA
            5E7D3B13243C3E017BFD77F336C237608389077CA3C1352B36DDBD7375CEFC05
            8D9AD66668198A8938448A632269367A27E8D9C3E05BADAD1B356DDE103618C0
            B07C591C7F0C0065C57228419C3B7DE3ECD1236326BAD4B5AA49010F9BE0882F
            731C7E3BB0B017B628253EFBF081C3755BD669D9A231CB43915BFA0DF6666006
            920C080BBE9F2D96F22133FE7DCECBD0D0B884D856ED9B181A898D8CCC4812B6
            84F89A37A2F83CBF2EFBD35CE8EF02456730DE0763680AB91514F22632AC63A7
            E616D5CCF885FE785BA2FF03807D2E111A88F277E1A95E8B166A69E9BA7B4CD6
            D2D3A4C1E670984CCADEB9F9ECE9E310913A356CF8104D2D15D821E24F32C80B
            00EC0486938FEE8710A85283E6963CDDC246A608F2FBE74C33B90441D0344712
            444E1672F6F44D496E66EFFED69A1AAAC547018A666FC551108700C6C6533F4A
            5F04BF0E8F7843A154D56A261D3A35074E087048F28898CBDF86E95F00218C0F
            7BFFB14860C0E5F71FDE0D1AD2DBC8440FF932D4FF7773386F8501F39C5CB260
            73C8CBEB635C5DACADDB48B3E8B4A49C17C16137EFDCAF5AD7C8C6EE3F02110B
            81E83F4E637F0930FD0123ECED9C1A35683271C6D81F64EF2F13CD3F1BC0DF97
            13A1706C111A6161CFFAA0A0C751D1110DADEA5935AAC930320CFB866551047B
            33348D72B03114CD70A98992CB17AE45C7BCB2B2AA6156D9AC469D5A7C0B64EE
            AFA7DD62804F7A6181344D4D901C3B7A59D748A34BD756CA2A2285C6CEEF89FC
            65002D178E82091AC041E358606AC7BCFE346BFAEC6A752CC68F9D15FA22ECF6
            AD8B1F13A3A6CC9F5AD9DC02811957344EFC415C2D4F11C1110C05FE232D74C2
            168061690227737380078AAAAAFD48681C0C011D1360D900EB3E3349929C9A95
            43D3F5EA1AB1223EF5894550E2DB4C2E0513A181E72F42F946C4612FDEBF0A7F
            53B95A859A96559594C445A6C114862FD83B2F0F8EC310ECC19D3737AE5DD2D1
            57EBDDB757053D6D20DB147D98149DA27E37B27E3A7C6E302D64C5F1C21485C1
            602C2A2C3DEC6568FDFA554CAB1AF00DA921163894FD85A761BF38374E71E78E
            E69BF6C288495AA2649AAB5B74F49BC62D9A29A9A8B468DDB07DC776CA2AEA0A
            E20316EFAF6ECFF7C5AE14DC228E3F9FBF7EE57174D43BFB3183F81CAB2FBE00
            262CB85DA51E1E364FE494CE9CBC959596191A71F9F6A54B2825E548D6D4D87A
            D39E35620D11CEE15FA392FC5A9EE568788B89461E3F7C999A92ADAC216AD1BA
            BE94C911E3CAE0CF259CA79CBDA136C6589AA2485CF9E983A8438101CD5BD6E9
            DDBB07CB7038F145E8EBCF3C7FFE19A0080122FC2D287882CBE5E088C6A3076F
            DFBE8DE6909CAEDDDB6969AB0924C25F85417E2A6FF339ED1843CB0894FCF431
            93102969EBE314BC28A744947574529EA00B4170BE804602CE08D475D9295CC8
            B3B03BB7EF6566A7BD7C733F232E71F0283BFBB1A38443128EBFDBF35B4EFCF9
            19CB10983E85F2F7B5A05881B29865F21D68C1B3E23D1B8E9C0C3CB9C1DF47DF
            4CB74C9C296827F31A1966677268747892BAB68A918918A0E6FEDDC76E8E638D
            F5D466AF5AD9A47163244F8214F91E96A6318241E18D31323929F77AD0E38CCC
            F45A750DEB37A8A524120BB9D2DF158A56686F8643B0E48F92C08093EA9AE236
            1D9A9A9A19E4BDED2F67E3AF8122494E487878179D703DE89192326659DDA49A
            6575555525403ABC81F78BB493C071001D2C85061E3867666ED0AC5D4396A110
            8C6FC8F9F90E02FF65F84FFE6C6905C3A185DF9BF759FE6BC92C87D21802136C
            A5123AF469ECC58B975353523325294695296BEB8E2D9A768E894A5FBAC0CBB2
            5665B7A9AE980870D5EF3F01E168A017F1D72FDFC5C67E6CD2B2BE968E123070
            51964471362F31191E6B878786AF5AB66680CDD02E3D5B9741820A6C460C9C35
            8A6131021785BF48C4952455AA99002D0E7895E3480A9830607F58E8CE084FE4
            A59D0B69CF7988E1536AD253E9470F4264524ADF44AD76EDEA62651CC82C8E25
            01DE815CE0AF2C7F073F8267C02C001DE3B1D1A9FEFEFE5DBBB769D6A209DF63
            FB8F3AEDFB65C0F1F7C960AC90053FC16BC9CA9919D4B5AB0F3954DAB0611DB3
            4A5FC4CF7E31C833AB50343B3BC3DB6BC9EBC71F7BF6EA3FC0AEA7AA16CE00F5
            0A7992233812500C9F2ECDE0F02C13F6BBE6605219F03905AF8A375101EDF13A
            8D437251789116FC8C65252371B1EF7372E8A78F5F863C7B181717695659DFB2
            662573CBCA0D1A5819191A21D047A5500E6372F1DDFE8723DF06DB8D74AC59D7
            E27FED5D075C14D7BE9EBEBBC0167AEF0A22A860C31E7B891A353751134DEC9A
            D82B166245C48A0AC6167B8F0D3596C424764545EC804A91DECB020B5BA6BD73
            66288BA2E6DE147DEFBEC92F86E0969973FEE5FBB7EF30E0FF31C9FBDE3B8445
            50DAA067F5E8AF17AEA9B3CBFEF5455FB98D8466F5245175DEB7982ABEF1DBA3
            8D1B562C5FB9DEDBCFE12FD94A08F4508C679035615BE39F26042F9DD5D0C785
            15268C6AB2D42C0411D5F3661C1CA08213E03870B0248613E56A2626FA79E2CB
            78E056DBB56F2557C800F4069BF82721326A602A01207F99A8FE61FB96566D7D
            067D3A109EB98EBFFF62C0FBBA388EC1A03A5085F986C2A2821789892525C56D
            DBB6F0F67105101D3241C0457F0F9EAAE67C6CD18D13045E5E59B47BEB8EDF4F
            DF50283C3B7CD4AE7DC7F64E6E8E04C5809750244990084E21EA621DB0DD5209
            89724876B69A65194D992625E1655252F2BD98D80A6DA9A9254749259ACA0A13
            3393468D1A346DE6AB5499F8346A6C69ED4C0AA01F88293017D55000983F8624
            25776F3CFA61CBFEA6CDBD274F1FCB000F89A01F420A8D0351144B9384E4C6E5
            D8CDE111DD7A751E337914749EB56018D6EAEFDF4A0C0D59302F7859EB0E3E7F
            5ABDC5B60E38C2AC2E2ADFB9F93049E1DFCE1809201DC7D701D21C2F5289E035
            1406860AFED1C3E70989F1C03477EAD8DAC5DD9A24653C2C1F62C23D137C75DE
            1D7D3D9BF0C7122F30684C7F59722F36BA6B8F762AA54A2C60FC9764CEC40B7A
            3D6827B50059B12C466BF887779FDD88BD63E3ACF276776EDEA2B94442BE255E
            FA27AF5A59ACDA9E2A435358981B7B3FFADEDD4709712972B98AC0312B1B0B27
            27C72275B985B94AABD5312CADD595AA94E6F6F6F62425511794FE7EFE17A0D2
            C1218BFCFD9B184B0AC789E94371C6F35519101A2840CC86EFF87ECF8D1B77E6
            2E9AD1B4A90F07D59B006EE83D8FC1F2902905C3008225E39E24AF58B0A44FBF
            C1C3C6F4075B8AA37562EFE37B7E3B7460C7C290B080B6EEFFA17AF33C83B100
            2D60D043630C524A12AA27B1897BF7EEEDD8A9D380013DC1879696684B72D0D2
            B212BDAE922071755E41CCDD27003025A7C495179418F8420097EC6DBDCBCB0D
            6A751E70FE76762E52958D958DD2D1C9CAC5D5466A2AB3B5B7B2B1B134B39008
            3A2E100B80A52648211CA0E100F8BBFA08003867139EA639B938A8CC25344D93
            24C9421AA3BFDE3BD55B2EFA675274AF7CB5117195382040C30A8ECEE4F1FDAC
            6709CF0D4C71035FD7C0C0E624810B055BE0AC5000A4DED423CDD71FCEFEC569
            B6B72C94487003593060C90538305C4CF2833D64183D016400C5051E02BC2627
            9A959D1FBA3044AEB49ABF78814A4988565E3061B58300A891BA0A018BF83307
            5E93965CB87DCB2E85423265F644994C68D5E609002CDEFF943B07FE814F91FE
            3267F5E255264A93A5618B28530AAB9DFC856149D4C15F76EFDCB43A7C53237F
            B7B7B763A146FF8AEF87175A450E294CD220C579E5A91905BC81484B4D0E5F1B
            D6BA532045614A73A9B98519855A9495AA0108373591A12AC2D9C9DDC6C6C2DE
            D152C2CB952A054C5A83D0C840CB2404C333151A9A200CC5C5EAB2526D56566E
            5E46A25A5D9E98F83227279F2E52484DA9AE3DBA07B66BEDEA65ABB224051E31
            0660A6B77B719431F0E9696A4727152515477CF8BFC37BD70CCD811F0C0603EC
            CD27081129FCAD1A6EFCE1E2D02222E430588683857D0352985B19179F9C9C92
            C8705A1757877EFDBA2068EDBB0459AFCE3BD5778F10A80B191241C57860CF71
            0CD84714C7D0BFA4480696082C974422F9039BF26ED6C79A64A1BA44B76072B0
            DC5219BC62BEC214363888660AC378313DFB967C2178ACA33F9EDFB7EFE0AC59
            93BAF468F7B702BD774E44BFB60218583082A05E3C4B5B1F1A69628687AD5BC5
            925A2961C46482A251074EEFDF7D70FD9670372FA77AD5BB8EB872065C988582
            A885D29388597E56D9ADEB8FF4958CD404B97DF74A8B967E9C0169D9AE4DD4F1
            A86B172EF51938D8DEDE393D3DC5C5CDDADCDE4EA930F56AE42E93918255E091
            1AAE82B76DA0683E6A5FA2A30DC98989F1714F1312E2931FE700FD77716AF0F5
            D7235A74704348E09A0C0C6F909066AFE7CB50DAC03F884DF4F07430B7940033
            2FEED65FBE61B56D5ED52D3135A5977F1329BCD55ABD41C28D1F876390E7CF33
            33D2B2B3B3B27272B3FCFC7C9BB76A62EF688E414308E36A31BE7DFD8DF55E28
            8AD45738C5AA1960FE8275AB9A64AAE63CF9F39F091EEA656AD6BAC5AB49A974
            6EE87C3B2B9551EB0367FCB27ADF5E5AACDDB7F7471CC3878F18A23497FCA91E
            27BE6E821FA953F9157BDD906A09A9FBECBC71079151708A8AEAFD3C213564D6
            547359C9E0E1733A0CF84424E7ABFE2A74C5C2352F135FAEDEB8D2DC565153FA
            16354FE0FC81EC5F88605B81BB03C03E2FB3A25CAD33E834478F9C2AD7163BBB
            DBB8B8D9CB4CCC753AADBDBD23454A9C9CCCA5666617CF5F3C73F4C4E6FDBB14
            66140B9B7F48A10F17C0220E20A73F332107071B8434BBD0E3CF000FBF7FC7C1
            E86BB758866ADAACCDD86F47DBBBCA78947F3D1B0EB3A89A32F6E9A3D446BEAE
            0A20E490080E870FF53758E457FACFDFD2DD05130C10511122F1A6507E072E17
            9248D61B02C30659E82D612334DC2110A208E54F8CC731962A2ED2263C4DBF13
            7DB7BCB28427D9C6CDBC3B760AB4B7B130E67BA916AE7797F4599EA7595646E2
            B1D7E2F76CF93133ED81812D03BFB7B1F15810B6B2A19F2D2469E5F00FB6BD1A
            3C5DEACB8CC5F3167A35F69B317BBA89292E8E7021481543D85B1E1FFC554A72
            56C49AF57E7E6DC64EFE4CE8D0FA4F749B17670F61861FEE1A30A8606321FE01
            7013F681E250AF794889C9707A21870CF6054E1C5794D30F639F1B8AB95B7762
            8026B76913E0D7D2C7DA5E494A599A862695E55902234FEDFFF9E8F17D1E5E5E
            CB562D81E96B8EAB663741817D5FB938FC45E28B6D07222514C7D0140FD10A43
            3350BC08611C12252860A6C1EDA018B84FB6BC80387EF894470379FB6E9D6512
            59CD43544B0B62A02B28D2ECCAE57BF1F14913270E2D2BD3299452A399F6BF8C
            4EDBD8B9816731B0FAFDBB0F9CD87BCA045744EEDD66EF6AC6301A1E05A8BF0A
            ADA070F9504A53CEA6BECCF4F4709499122CC7BCF71E7270EB69899993C7CFCE
            4BCB9E3C7BCAB0F19F03BB2CA22F585BA8899EAB3B7A610C84B255694916CFCF
            D6C5C43C4A7B999599932A95B3B6B616CE2E363E8D1BDBD93BC92412C8730CB7
            0E151DC26BF0D2D806D693A584E56E1D7AFB561C8F1637F4B1B7B76B08543E2B
            3B7BFDAA2DBA727AD6C2E9EEEE8E2C6DC060C3236F9CE944EA0FC8EB6DB37A8D
            00AA366150F76E5EE1D3FE030955187B6714AD095DA354A9662F982B57D49213
            BCCBB4C1358BB9FB68CDF2D51F75EA3371F6F037F2A5191378F335EB68FC4BF0
            511C2CD7F3484921FDE04E7C4AD2CB5BD7A30D3A9D5E9F55589C2E91C8504431
            7B4948D76EFE42EA93AD28E11E3F8AB7B33773F1B44428738A40337373529293
            8E7F7F14A52C02BB040C1B31900741178061287EFDC2BD83FB0F366CEC31EBBB
            2975F6171299A293C7CE36939BAE8A5CCA895331428190D321E9A945718F920A
            F38A2CAC942C6790995056D6E60A0BB9AB9B33658AD02C2D9612C5FAB3319A60
            391A98A4CCF45C855C616125678137C245DEC5BFD7C683B515724364F4EDAB0B
            262F6EE8D572EBAEB5284923350C391C002082C8D6F6BB7F084480285AAC295B
            BF3A1CA7D171E3C63B79D8D3061D411100E7A004060C3558681C56EF045EBBEC
            8AE2C2B2C4848CE8E85B39B9A9345AD638C0B76143AF36816D2C2D5524057419
            AFA616E0844715FE111506D24E835F1BC04A40C645962548095812103C33340B
            011566E0781284ED38CEC0A20B660622F64A8656C81106EC1F649AC62AF3F0AD
            DFEF66C9CACF870F74737584CE1013C41A17601EF03B10A4094C6410FD7322D7
            B5001BA01915FA0E00E0E03082D255B08C9E333323790A812D0900C660380C1C
            405C0FD36628891274250269823088A485990206E1197149389416EBDE6F5D5A
            F4FA953BAB96840CFBFAAB2F460F1143929ABF7AD3BB6A460ECF465D3979EAF0
            C891E33B7569F1A6C01592D8E034C7825B2461B00E9BD4E15E71908E4D200F04
            6E598FDEBBF96CE3CA35720BA675CFD6DD3A0FB0B2B4A12488444A819BD09521
            B367CC3395918B572F26A588904A22CF9C3ABF63EBDEC2A2122F2FB74E9D7A94
            A8D319B4A84940A7CE9D3F9249A4306F86D23842811FD6857D7FF7CAD5B1B326
            F6E8DDD9D88083FF00983D77DA6C1777CF794B6600A770F597F85FCE9E5797A5
            5878D875E9D2112758B81D0636FA56ECCDAB0FADACEC544AB39749A94A539B8E
            ED3AF7F8AC83938B35100ABD5E4F5154BD4BC4818DE47540307856FA4FA51BA1
            D92D56AB870D1A2AC5C903C78F99AAA455D0F87D30A5F2489DB6AA574F184184
            E6F6BCECAC395383129FBE6CE0D564E18AC55E7E0E088D6465AA939E67DEBFFB
            405DA4CECE4ECDCE4FB677B2B1B235776B60DDA2751357A766367676D56BCD57
            178A591173C21E15A37A3EE4EE657992147E43239A729A36189EC7A53EB8FB12
            2770AD56D7C0DBA17D671F95AD0296532176804C16572EC6FC7EE1C6E0C19F2A
            15AAE292E28A8ACAD3274F3CB8FFABA7AFDBC29050476717E81078488B09F411
            1768434B0A0CD9E9B9D9D905E04E34E595C092D83B5ABB7B38DAD8AB4839F86E
            46AF6773738AD52585144502639C989878FBF21D4FF7267D07F6B677B3140A4E
            E011C8E78F8B8FEC397DE9D2314A520EB543C7CB4C4C110C972BAD03DB741DF2
            E527CE0DACC1332128C6236FAB8D82C7F829EAF2C943875BB76D3B66E2284AFA
            EE2E9DEA8C0C42D3FCB143E79E273E1A3162BC27F8BAFAD8DDA14582252389D0
            9FCA089E8415C6C3C1CB29217DCB692BF569C9F9A565E596E696DE4D1C1121D0
            85FB058C28A3A30899BE820D5FB3B1ACB460D6C2B956962A8E6658D12C54B94C
            9686D01D077B4A627875D99217101C999890B66CE1728CD6876F8FB0B455BDA2
            DEC92FB2D72E5FDDB255A077D326F76FDEE9FF7947670F07023713A7A62185AE
            30532521491C824136B720FFC2B9F3962AF382FCFC989B294A95E5F849A33CBD
            6C5E493A40C740100683213FAFD4C9D11A16BD71381AFB8FD597C19D1CDC7970
            CFF6BD61E1E12DDBFBFDA3EA2DC6C602892BF0A19024954118E0E14084CCC263
            42C43661108601670831B35AADBF73E3E1DAE5F3D4A5052632959B8BAFD444A6
            AEC8B577B27072F6ECD2A39BA59DA58BA30386E00C8BDCB9FC3CEAC0B1ECF464
            BD3A8F21D16EFD064C99379E2781AFE5603C470A4D4230C4830795C0260DA0A6
            0424A98DDA7DE9E2F90BD939CF3052874951FF762DFBF4ED6F67EB5051514133
            7476664E61AEE6D4A9F381ADBBF4ECDEBD791B4716C68192B8C7A951A70E02C5
            6EDDBA55E72E9D01CC1338F7E04421CC3CF3E035528EC6EF5E7D7EE9F73BCF13
            6F629262B9A9A5BBBB8757236F2B4B0B1DAF056BAED711577EBD81684C464F18
            D9A8850DADA3318ECCCE2D5558514A05995B58B878E69CC467992B37AC6FDDCE
            BF24AD6253E4E6E4CCA77D3FFFA4578FBE0A451D46EBB272FD86F0B5CFAFA5F6
            FFD7678346F4C2800397A082E2E1C6C52D21DB07A99F81F3DFB06ADD6FBF9E1B
            3262C288098309E4DDCC61B0DC0A59A541E86B58BB62B5A777A3E12307833817
            7C26D4679487D5371A47814630C09CD1577F8F49CB7890959D5CAED1619809AA
            E53CBD7D878EFAD2DE45C603C51488D9709ED8150EE4F107A9191114BAB94BD7
            A60C0A5BEB08943394490EEC3A1697707FF4E4B17E4D3C05C5A7719C42AA8B14
            62CC2F8656AFCC9083CD7D129BBD7DEB5AFF80D663260E8543E990E88DABE6BD
            459FC5667E173CE3CB11C33F1E38402A83B58EBBB792183DDEAEBB3B0D201081
            71AC716C2AD2668ADF856968E4C4BEE3714FE28397CE552A61979E98FF13078D
            A0098ECF53992B8AD30B2E9C3D3F69FA188925F9B736380A1D07B01A0853773C
            15B97177F4AD1B5BB76C5058CAFF69EF2D367B55417FC106AB4B7465C5E53999
            85595979858525596939457985798549E5E5599E8DBD8008445FFE05AC9DA593
            FBC9F33FA9540AA43A78E078036C8706186CF90FD72F5CD231999D7A06F6FAE4
            13736B9BC484F4D3FBCF393ABA4DFD6E8ADC1C08A01EE16180875346D9040679
            10FBE2F8FE9F9EDC8F6EDECAC7CED3D6B779A06F637FB91C767A7142B656B0CC
            F07002464F5FFAE5B79D9BF794E4198243BFEBD8AB398FEA5184124BC1A8C094
            8A5423528220D54586DFCEFE7E26EA8C8E537F336D78BB4E5D2952065D13B873
            9823E2611B220FBC0D41D35CC49A6DCD5BB5EAD2A325083A22D7FEC018087FBF
            D6776EC53068B14C45FA34F6F9B857CFC7B12FB67DFFBDDC52B6307491526522
            8C58A2626F02068773C1CF08002577AE5EDDBD751F08185744ACB47634136B9C
            75BAA6A08C4265C8CA506FDB10C1329AA045A1269628C1BF23CF22488848C245
            A4BCC85AB97CD5C79FF41FF8590FD8CE8DC27680F27CDD815D276E465F512ACD
            4B4BD5003F3835F46E131818D8A6B993B3496505929894989FF5FCCEF5EBC989
            FA51E34677EAD594A6CB4952BE7DFDE6A307F71595E68786EFF8B87F57160EDE
            E19806D9B5F770526AD2CC99D3AC1D14F5F5590185050240701C21EA55D56F61
            A91F16B68F1DBAB47757C4D7A3460EFE6A20CF33707DAAF3B150F9EF3DDB141E
            F9CDF46F035AFB81C89436F0DFCD0FE9D0EEA30183BBB02C0D6513443746A09A
            651021498642778E2277AEC4AE5B15F9CDD4895DFBB446AA4B42C0E1C343AB78
            3236F6058951710F1F3F4B7A121C122425FF66F5E60D40BC612A10C7A27FBDBF
            75C70F13A78F0F6C1B509BC3FE67D41BEC42719106F84C9D56FBE24502873099
            9959C5C5C5AEAE2E18CA3BBBB8D8D9D99B999999989862D5BB585258FAF147DD
            0A8A721B7A35893A775E2A47AB66B3802BD6217BB6EC3D7FFA0443B0F3167DD7
            AE4B5B44E858102C3B1E1ABCFCEAE90B4D5A76ECD0B12F46488BF2B2EE465F4D
            4A8C65B94A10092A1DCC6DAC2C3C3C1A0E1F3BD9D9D14E907F2855C971058929
            71DDFB752050A25A98385E4CE6098870EA84E92F1E3F3F14754865A7022600BC
            0C0E91E1084703C70234872ACBD7EFD976E4D79FCF78F8B9CC5830C3CDD50511
            30DB2B159DDA54180C7901A02045D1048A919C921C13734F6BD0F6EED5CDC7AB
            09F8FD8B4769DB36FC6061673B69E65895B584E76BDE2B309D41798522CE091D
            E507F6EDDBB36BF7A44941FF1AD607C4FF183023288E56ABA818A1803FEF453F
            5917B2DAAF45CB798BA6A1245CD07755CBAB849837E087F644DDBA7179D4D4AF
            02DBB4D257F2B76FC4451DD9AB7234F972F4B086AE5EAF3C6871B106841BA672
            12E1C4800BCBCB2FF9FDE7ABE64A8B3E1F7702F1F4B3F88C15CB9737F4F29C17
            1C84931A0C31CB4A2FDCB1E38054C68D1A3DC2C6C6B29E528FF0D1E0A3348586
            870F9F35F075B3B3575497C784084C47AC5ABEEAC9A3472B376D7077B7651883
            D0CF53756790F2F1FC9DFDBBB78F1E3FA5430F7F384885A3572FDF3D7FFCECE0
            21239B77F2601186673802276B9F9D05815931499AE4E4E9939E169D3814F1E4
            E9832DBB0F7B377678A5800AFEDCF1C3AED8AB77550AABAEBDBBF5F8A4CBDFA1
            DB42C64E4CBDF2B0754D823095C48E90A33105BFCF9B13E4EDED29E497AAD1CA
            3FE5BD79B0D0C0B9C11E319A15722D58F530165ED34E635C09CFCACC1BD4A3A7
            56AB71726E08D55B214EB9A07969A5CBE62E2AAACC9BBB2428A07973209C34CD
            08C75AF1829A91B7AEDE0B5BBCA8425BD6AF5FAFA6FE2D7189898D93CAC2D231
            36FAC9E91367A6CE9FD6A4B15B7656B1BD9D05106D86D5932475E3F7DB3327CE
            1C34A4DFBC25F351783FBC707A012B5454A1E107C27970F7E9068DBD5AB5F661
            593D814AF66D3FC92158F7BE9D9D5DCD1084888D8EFF7EE3663305327F71B0BD
            A33D076343CCF80C8AB7F0D4C3BF822522886D18E86C389280285F5346AF0D8D
            B0B1544E9D3381466978DA052F88A9303182D4B2110AD4AC08FE22FED98AA521
            BD7B7D3E78E440782410ACEBD401AE005F00D470F9E2ED35CB96B5E9D8E9BBE5
            F3849C63FDEA5D135856A567098231F09BC2775672857382E697151936AFDF94
            53903166E29880E67E358DD102870F0C52C4C35E844D268C3FF0FA950717CF5F
            19FEE5606F7FC7D33FFEBE73DBF62F870D1C3AE60BF082CB171E1F3DB2ABF7C0
            FE030675A3F57A200804557FE6197CCE91BD513FFD7466DBDEAD66F0940BB81A
            42C692A32BD0154BC2CA4A4BC222D6921427E6E745F517D1D6C9033F1F3EB83B
            74D57AAFA6368C81C12929AD6317CEFEAEA4B064FDF648530509241531EA5107
            480147A5EA2CEDAAB0B0CBBF1EF368E63B6B6E508B16AD8D55B7466E9393D297
            CF5B52A9D187AD0BF3F075E1DF653ADFA133AF0C5F8B2D31282C5D730C429058
            41B67AFFCE63F7EFC70C1CDAEDB3214360E21962194ECCD8C337BE9F4388AAB3
            6935EB6E5C7F16CBF7C5C5659FF6EA5F9297656E657BF0C429477738AA75F7DA
            B3F0B52196F6F2A5A1215656D69A321D25C160FF2F4690140529A97069417645
            E49AF51AAD2668FE3C3B5715F85B10D0FD76FAA7EFE6CF45288B151BD675ED16
            C842BB47D6AC60ECF56791E11BBF1C3BA447DFCE20CCE3859E045648CC01F757
            9AC7AD5BB3D3C645357EC2E700BD6328999D52B23838B865C7D6E3278D048652
            5786CC9A1E54A4CE5912B6BC918F2B04841C22D2DA206F4E47F3B073588B2392
            F212F6EC89EB1CAE1D32AC1746F1C25C110E9CC6EE1F0E2525A54D9834DACD53
            C5C10E440A86D3E0FB19445D40C73F49DEBB63A7465DA6D5569496156324EFEC
            E14C6092C04EADBE1A3D142886383D2A7E97600E38A86C08BE63EB91A3FB777E
            09C0EB375FD61DB7A82358357497D083712C58DEF887999B37860FFF768C83CA
            257C558897B7EDA86953604325D0079EC4EB6320110DB7C01306695B8019FB2D
            EAF6D1234727CD1ED5AC55932DAB8EDE8C3EDFEF5F03070C1CB83372FFCDD82B
            6111CBDC1C6BF9BA210951F55A099495555785865EBB6C93ABA7EBC8099F1A57
            F580DC70067EE7F7BB93935297442C243006844E1C03C2698E2449F1BDD13762
            F6EF3BB978E97C5B7BB9C875009EB4AC4C3D63DC540FCF16C1A1D3C04300E342
            4A781A0108439A96903F67DE6C8262FAF6E9D9FB932F2CAD24C231782C6244B1
            28E42660AC54525C3A65F87496C0B7EC859682F8130566710B04138903102E7A
            474460D200AB7DE95CECC913519548E1D02F86F6ECD91981ED185AE066400CC1
            303015227401E01FC81963AF5E22E95ED0C4D9D72F5F043679E5DA8D9D3FEEF2
            24367D5BC4161DAD59B17A89D45445609C89B27A8959182301A05256ACCF4829
            DCBA29BCB8B468F1B2502F5F079A6781E8E5E49685AF5CAF34A16606CFC72996
            2238782CA1B88C1CBA33F2F0CD6BD75746ACB0B45362A8B0201C9E959EFFE451
            8206F61ED29DBA062AE4E61C4CF090DA52246C59B8BEB264DED259E6362A20D1
            3F9FBA75F4F0A1C076CDC74C1C0D938655135DD516B4B6D79D37667C10FBC031
            1E0B0DD9989D9E1D347FBA6B437B063C0664ECC433D37223376C05E1FFB2D0E0
            F222CD81DD479212D29EC7276AD96C895CD3B24D33FF566D3A76EE6965E52C91
            080FC220116B0E3F7A7877E6BC89BE010D85AE0CBC6E931BEC4A07C21CB961F7
            B30731D366CFF16AE20E9002F606D75DA5DEBC9810657844F2E3819F1FDCF9F5
            9B2953D25E66449D3937F19B71BECD3D85E016E83049104656BBEEECB8D8FB01
            0CD38B27795B23376A19CDEAC830830E9DFDED5C4A629815B4E4F0FE23721BD9
            CC39DFB00C6FAC119CC0876EDC0020AE674E4ED1D2F94B7AF5E93968487FE331
            1B9DB652263339B2EBE899A8B376D69EE6D656CDDB04F4E9D70E0440D5049858
            A5869E3D73F1F809A3FC5B7889A1132451244920413B36EF8E3A10A529D6741F
            F8A9DCC42C35E9456646A283ABD367C33FEFD2BD233C5C12025F58B01436D738
            AF2126535892241EDC7F80A06440801F2B0C7CD759D49AC68777D69EABDB1CAA
            848761110CCF4C2DB874F9465CC20B8EAFF00F683474E817385175CE26007D0F
            A31F1B58C3F5EBD7ECEC6C3FFBF233535313F8191FA67A0B0D4D484870C899A3
            870DB46665C48E4E5D7A46AEDF9C9192F2719F41894F9FDFBC7C91A0F8FCE242
            9ED09999133EFEBE6D3AB537B7503A3B357816977E70D75E95A9F9B235ABACEC
            2861A1C898DB8FD62F5FEFE6D560DE92B97239C93200EB0259076095CA4C2D0E
            5DBAC644211B336E8C54A86656E899EC821C7B7B955723570CCE63B0F0DC4178
            6A3814FA848799116B370476683F72FC20442842FD78E8E4BE9D47070C1C347E
            CA1080F601280611B5D04357DBBB2E9E1F0EB4450FE956602D1BC489382929CA
            AF5CBB6EAD85A56AECD851E61626BC90CB01EA9D9154B87ECD06756E3EAAE713
            B31E37F26F3462FC9846BE4D15D5897AD18840A02E8C23A627E42C5A10DCAC65
            9349336748A5F0346910EED4A1E280BE0D2D2FA5C31684E90D6563A74DF1F173
            6541688AD74FC76704CE81FAA2490F3337446C6AD7ADDDD75F0F3A7FE1EA96F0
            4D0B8282DAF668C5D21C8C62103D4A9A541114000FC38B408C136E0F420E7D29
            7960E7D91367D60CF87CF0A8B1E3281995F42C2374614893A6010A6BCB8AA2D2
            69C1E3047274D83D26216067185F81243D2A888EBE9790F04C57A925189DDCD6
            2A20B06593965E2E5E56C010403523612B5BCD3D8B1532B0CE5A9D562695D53C
            B87868A42057E00BB8BB771FDCBC1E3B7BCE0454005855C81172B0557D546979
            B14EABB5B571AC598A3F2CB96F525C1E3649E08880C260EE0086A590AC8AAD09
            808028569D45CF63248617E5949596E9D352B332D2323372B3CC2DA4AD027DDD
            DCEDADAD1C916AF537BAB13A43CA350C421FB07AB3C8ACC9B3AE5E3CAF29296A
            D1B64BE36681B7AEFC5659960DB650CBD0F356CCEF3F60A044A2125F0FBB2AC1
            1EF2901CAF24DFB02A74A9A1829DB328D8C1550EB61308C1C573374EEC3FC691
            68C8DAA576B64A868693F4088FD306ECDCE9DFF66EDBD2A7FF80D66D3AD8D85A
            3879A884A881868E8B27848C00F87C03C0E4426E9C78FE247B537864B300FFB1
            538640548611B9D9851BC2D7C7DC7A30A8EFA7E3278F91285141E5AA4C759DB8
            031E4FCA7334919741DFBB9D70E19723286AB0B2B6902B2DC74C1C6961250122
            0BDE08ACC38DCBB78F1F3CFE51D7F67D3FEF4D41AA694C4C08D4349FD7A81F5C
            2A03BA73D3A1A49749E3A78E6ED0D08961F40065089C0D5C4D095CA82A634505
            1521412169A92FBE5BB5BC45EBC61C4BA36FE8AC32CE0B00813C7BE24AD4A993
            E3A78E0C6CDD3C2B4BBD725958694EE98CA045016D1D4058015C1F89D4A819F8
            46A920D1486141E5E3DB7131F71F9B2AD1AEBD5AF8F836A30D343CCF9924EEDC
            BC1F3C7BDE8851A37534177D36C6CCCC8CD1713A9D2EBDF0258B94DB3A496C1D
            CD9DFCDD9A356EE9EBD38220A41672339294D2C239F6C0BEC1EA390BB61B374E
            6B88C22C66DA5F9971A87E2844F83DA6D51A8464786D5EC078D64038CF941571
            7B150383D121936205BD26ED87D674B423D54366B5EB60DCD321D43250D8D2C3
            835D16591C410CCD120C8DA424959457A84B8A4B7272B29C9C1CE50A53CA0C75
            767294CA48998C12CE0C87C7DD0A9458B87030CEDB723AB577F061AA37B82F46
            87CFFA76DAB51B67389A0A68EEABE5F4E949A9050519FE6DDB1F3E729692409A
            B157E246F151591DB26AE99A87F762576F8A74F3B6E620AE41F6EC3874EEF8D9
            5EFDFA8E9A380CA803260CF371BC0E674D572DD99A96113775FE94F8A709572F
            5F4B7A9EE6A06CB42262A1B513251E240CA117013699103AA3F1674F93D6856C
            7476770D5A38033620C3B3843902274E479D38B263576181568A5BB5EFD8D3CC
            DC06089FB5B58D890C6374FAEC9C7C574F775246A4E725AB2CE4F6B6161E9E6E
            E62A2529415EA664EDD8B1AB63878F7A7FDC092005E0FF2594C9D5CBB70FED3B
            F1D5B0111DBA8B300F87381AABA77B1436F0BE2C58B5645DC7AE8143BE1E0069
            435EF33635DD8B6A7545E8B2D56909713383E6067ED48A0196A63EEA8E570EE5
            29CA2A0F9EBD28B073DB11E3068B6798B31C7BE8E0C17D915B2B34BAC096BD7D
            7D022BE9D2ACCC2C807EF4063AE17942A1FA85772357DF267EFEED9AB6086867
            616E2574DC7046875BBE3E8AF3EAD90F7C4D03D46B37283EFA3B51EE1F1E7781
            4F0C42744D45A55261969B53FAE8617C53FFC62585E5261429954A490A373531
            C54898FED4EA58B5BA542E972A1426159506922025125438011A1E410FAC4265
            4525093B94D8CA122DD838A94C929196ADD123EA9212602C54E61695FA22A542
            91999909FED7A3819399A9A9444A5958589264EDDD543D65EDD9B6552DEE489D
            A342DFA9461FA47AF3288B7144D0A4A09F7F3982A38A3317CE01C4BA266C8DDC
            44BE727D084AC17176A101C6A8FFA04A22E151C1DF6FD87E6CDF91D0151BDAF7
            6E2AD47BD11F0F9E3ABCE360E75EDDA7CF9B0099B1803F160AB9678E5D3A1B75
            7ED28C71CD5A798B9FF3E2C58B05F367A73F530FFA64C49C90310401369D131B
            EDC0EBC57CD5EDE887470E1F1F33F2AB26CDBD453250065E2C01DC018E55684B
            34E515450560378BC5065880299C9C9DE42AA5D24C8940334C0B8D19ACD8572B
            540A30F13EC1A78007011F93935574E6F8C566CD02DA74867C09824E60085A8F
            38836DBE7239FAFCC95F162D9B6F6A4E207CFD53656284097E885CBF2BFAD76B
            EEDEDE43BF1EDC24C0F32D03CF551ACEA17BB61E4F8C4F98B370BA859DBCA6E0
            5F3301AED11614E497E82B190707479989940416AB3A2E8519318EADF9867A27
            DEEA25E7FCE7B93A85B365D0AA84BFD806C38B15354E5BA9052B6F3040A49692
            92A2D7EB6DED6C4D6466E0FE542A95E0F62B01E0827E5EA8A78ADAC842AA531C
            AD02355C4D2A4E08DD4986AE0AC52119168A89DB8AFFD52C491FA87AC3922E83
            8EFD7C5246EA53276F87BD3F1ED66AE9B0F9DF3D8979EAEAE5B36A631866021D
            F02BDEBB4A26049B7E74EFA99D9BF78E1832AE7BDF4E76DEF21B976EED8FDC43
            2954211121A60A12430C382B4D7C901F11B186304756AC5C299140362C82A468
            5A4F9192B347CE44846F747669F8C3E1AD34A7A1483311821941E23A07A7D541
            80F5113C54FF51EF0C78DDA912E1657A9D6E63C4E6962D033A77E940E0E45B58
            32E15172B905E0073B3BEB2A0FF9668F26DEBBBAB4D4CCCC14F8ED37B1D054F5
            8DC33E7C496A72F6B64D3B3A746EDF774037964130A323B7AAF8A18D99FAAB9D
            B3D14CCCBF37C3F0BE58E26B8753F9DA9ACE6B77F257CF63BC7AF6FC5F7C7DA0
            EA2D3001610559D969992F5BB60DC41092A3598CC4D3D2D22942026C2770DB7A
            BD81A26AD342461C2CA2A7222A2A4B0BF2726D6DEC08D214E0E45FCEFEECE6D6
            C0ABA997E0B9416C8CEFDB7AE4F8B16393664EE9DCAD332961E1EC0746D0B441
            08C9B09DDFEFDABD65DFBA6D9B02DBFBFD7952BB7FE3D905C2230CCECCC0F605
            BA2A4F5BD59A52DFEB79A130838AC4D71C87FC915B153FED2D3CE4300904BB6E
            24F7EFC5DDBE7E7BE4E8AFA47212F693BFEF69C2FFBFFEF8F581AAF7EB579537
            301A6CAB6BF318449C2181D914EC9D02FE4AC3660D8D869065059A0C47380EEF
            3E75F5E7CB5F8DFFA27DB7360C4FE33CF1FE07E9FEF10BB62119E8FC02ADA383
            C07C80092CABFF7DEBF0BFF4FA5FA3DE6F7F0A04D53E8ABBE5E7D316614D6090
            8ABFBB5BA8E62440633408225F0191C266CFD87B71F9B959DD7B76C370D116FC
            170B757577EEDFC4C3F7FFD7DF74FDDF50EFAA67F90FB8D9DF1AE9BD4295F0DF
            7BD5C4A5FF0DA7D3FC5FBAFE072227C10485C195110000000049454E44AE4260
            82}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo12: TfrxMemoView
          Left = 1.142857140000000000
          Top = 213.458564290000000000
          Width = 268.346630000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Memo.UTF8W = (
            'NORA PATRICIA MORILLO BARRERA'
            'Supervisora MTI'
            'Bodega de California Cra 34 No 17- 43'
            'Tel'#233'fono: 3759270 Ext: 13232')
        end
      end
    end
  end
  object fpdfExportar: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 668
    Top = 347
  end
  object ZQTotales: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 478
    Top = 400
  end
  object dsTotales: TDataSource
    DataSet = cdsTotales
    Left = 481
    Top = 458
  end
  object dspTotales: TDataSetProvider
    DataSet = ZQTotales
    Left = 575
    Top = 399
  end
  object cdsTotales: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotales'
    Left = 578
    Top = 459
    object intgrfldTotalesToalCarpetas: TIntegerField
      FieldName = 'ToalCarpetas'
    end
    object intgrfldTotalesTotalFolios: TIntegerField
      FieldName = 'TotalFolios'
    end
  end
  object fdbTotales: TfrxDBDataset
    UserName = 'frxDBDTotales'
    CloseDataSource = False
    DataSet = cdsTotales
    BCDToCurrency = False
    Left = 666
    Top = 455
  end
  object ZQBuscarCarpeta: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 750
    Top = 24
  end
  object dsBuscarCarpeta: TDataSource
    DataSet = cdsBuscarCarpeta
    Left = 752
    Top = 80
  end
  object cdsBuscarCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscarCarpeta'
    Left = 856
    Top = 80
    object cdsBuscarCarpetaidCaja: TIntegerField
      FieldName = 'idCaja'
    end
    object cdsBuscarCarpetaidSerieDocumental: TIntegerField
      FieldName = 'idSerieDocumental'
    end
    object cdsBuscarCarpetaidTipoCarpeta: TIntegerField
      FieldName = 'idTipoCarpeta'
    end
    object cdsBuscarCarpetaDescripcionSerieDocumental: TStringField
      FieldName = 'DescripcionSerieDocumental'
      Size = 100
    end
    object cdsBuscarCarpetaCodigoCarpeta: TStringField
      FieldName = 'CodigoCarpeta'
      Size = 8
    end
    object cdsBuscarCarpetaNonmbresApellidos: TStringField
      FieldName = 'NonmbresApellidos'
      Size = 100
    end
    object cdsBuscarCarpetaNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
    end
    object cdsBuscarCarpetaidTipoIdentificacion: TIntegerField
      FieldName = 'idTipoIdentificacion'
    end
    object cdsBuscarCarpetaDescripcionTipoIdentificacion: TStringField
      FieldName = 'DescripcionTipoIdentificacion'
      Size = 50
    end
    object cdsBuscarCarpetaSecuenciaCarpeta: TIntegerField
      FieldName = 'SecuenciaCarpeta'
    end
    object cdsBuscarCarpetaFoliada: TBooleanField
      FieldName = 'Foliada'
    end
    object cdsBuscarCarpetaCerrada: TBooleanField
      FieldName = 'Cerrada'
    end
  end
  object dspBuscarCarpeta: TDataSetProvider
    DataSet = ZQBuscarCarpeta
    Left = 856
    Top = 24
  end
  object ZQValidarProceso: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 752
    Top = 144
  end
  object ZQCarpetaCerrada: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 864
    Top = 144
  end
  object ZQFolio: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 751
    Top = 221
  end
  object ZQBuscarCodPreImpreso: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 863
    Top = 221
  end
end
