object frmCaptura: TfrmCaptura
  Left = 0
  Top = 0
  Caption = 'Captura de Informaci'#243'n por Demanda - [ Versi'#243'n 20160621 ]'
  ClientHeight = 961
  ClientWidth = 1916
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1916
    961)
  PixelsPerInch = 96
  TextHeight = 13
  object rxlBuscando: TRxLabel
    Left = 138
    Top = 131
    Width = 145
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = 'Buscando .....'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akRight, akBottom]
    Layout = tlCenter
    ParentColor = False
    ParentFont = False
    ShadowColor = clNone
    Visible = False
  end
  object PnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1916
    Height = 73
    Align = alTop
    Caption = 'CAPTURA DE INFORMACI'#211'N POR DEMANDA'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 11794687
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object stbBarraEstado: TStatusBar
    Left = 0
    Top = 935
    Width = 1916
    Height = 26
    Panels = <
      item
        Bevel = pbRaised
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 200
      end
      item
        Bevel = pbRaised
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 150
      end>
  end
  object GrpPie: TGroupBox
    Left = 0
    Top = 874
    Width = 1916
    Height = 61
    Align = alBottom
    Color = 14995646
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      1916
      61)
    object spbSalir: TSpeedButton
      Left = 1789
      Top = 11
      Width = 113
      Height = 44
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spbSalirClick
      ExplicitLeft = 1556
    end
    object spbCancelar: TSpeedButton
      Left = 1455
      Top = 12
      Width = 232
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = '&Terminar/Escoger Otro Folio'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spbCancelarClick
    end
    object spbSiguiente: TSpeedButton
      Left = 1208
      Top = 12
      Width = 200
      Height = 41
      Anchors = [akTop, akRight]
      Caption = '&Siguiente Folio'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spbSiguienteClick
    end
    object RpnMensajeGrabar: TRxPanel
      Left = 758
      Top = 14
      Width = 289
      Height = 41
      Anchors = []
      BevelInner = bvRaised
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'FOLIO  GUARDADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      Gradient.Direction = fdTopToBottom
      Gradient.EndColor = clSilver
      Gradient.StartColor = 16754856
      Gradient.Visible = True
      TileImage = False
    end
  end
  object RpnVisor: TRxPanel
    Left = 0
    Top = 73
    Width = 1497
    Height = 583
    Align = alLeft
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 12885363
    Gradient.StartColor = 16315117
    Gradient.Visible = True
    TileImage = False
    DesignSize = (
      1493
      579)
    object LblZoomPredefinido: TLabel
      Left = 18
      Top = 7
      Width = 120
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Zoom Predefinido'
      Color = 10907648
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object LblZoomPorcentaje: TLabel
      Left = 192
      Top = 5
      Width = 73
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Zoom %'
      Color = 10907648
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object spbRegla: TSpeedButton
      Left = 295
      Top = 9
      Width = 105
      Height = 41
      Caption = 'Activar &Regla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D760100000000000076000000280000001E000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333330033333333333333333333333333333300333333333333
        3333333333333333330003030303030303030303030303030300300000000000
        0000000000000000330000A00A00A00A00A00A00A00A00A0030030A00A00A00A
        00A00A00A00A00A0330000A00000A00000A00000A00000A0030030A00000A000
        00A00000A00000A0330000000000000000000000000000000300300000000000
        0000000000000000330003030303030303030303030303030300333333333333
        3333333333333333330033333333333333333333333333333300333333333333
        3333333333333333330033333333333333333333333333333300}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = spbReglaClick
    end
    object spbLupa: TSpeedButton
      Left = 431
      Top = 9
      Width = 105
      Height = 41
      Caption = 'Activar L&upa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7727474C6C7C7FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7
        C64D504F328DB3436674FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97C687D8EF6493A5FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97
        C687D8EF6493A5FF00FFFF00FFFF00FFFF00FFE8E2DECDBAAD937C6B77584477
        58439C7D6BABADAC2D34422B97C687D8EF6493A5FF00FFFF00FFFF00FFFF00FF
        DED6D08668549D8165BFA27ED0AD87B495739375596E54404F809187D8EF6493
        A5FF00FFFF00FFFF00FFFF00FFF7F5F3896E5CC1AB8BECD1AAEED2AEECCFA7E7
        C79ED8B28AA181627256426493A5FF00FFFF00FFFF00FFFF00FFFF00FFC5B7AE
        B09981F2DFBAF3E1C1F2E1C1F0DEBBEDD8B2E7CBA3D3AD879273576D665DFF00
        FFFF00FFFF00FFFF00FFFF00FFB19E91CDBCA4F4E8CCF6EED7F7EFDAF4EAD2F2
        E2C5ECD5B3E3C39DB59472886E5EFF00FFFF00FFFF00FFFF00FFFF00FF978171
        E3DAC4F7F1DEFAF6EBFBF8EEF9F3E6F4E9D3EFDCBEE7CAA5CCA68272543FFF00
        FFFF00FFFF00FFFF00FFFF00FFBFB0A6CFC4B6F9F5EAFCFAF3FCFBF4FBF6EEF6
        EDDAF0DEC1ECCFA9C0A27D795C48FF00FFFF00FFFF00FFFF00FFFF00FFE1DAD6
        C1B4A8F0EBE3FBFAF4FBF9F1FAF5EAF5EDD7F1DFBFE6CBA49E8568B6A79CFF00
        FFFF00FFFF00FFFF00FFFF00FFF3F0EEC1B3A9D1C6BEF6F4EAF9F6E6F6F2DEF4
        EACEE5D4B2B59E807A5E4AEBE7E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        E7E0DCC0B2A9CABFB3D6CBBBDED4BBC3B298A590768D735FD4CAC2FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7F5F4E0D9D3C7B9AFB7A69AA4
        9182BAAA9DF2E7E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = spbLupaClick
    end
    object scrlbx1: TScrollBox
      Left = 2216
      Top = 481
      Width = 185
      Height = 41
      TabOrder = 1
    end
    object cbxZoomPredefinido: TComboBox
      Left = 18
      Top = 27
      Width = 145
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Ajustar al Ancho'
      OnChange = cbxZoomPredefinidoChange
      Items.Strings = (
        'Tama'#241'o Original'
        'P'#225'gina Completa'
        'Ajustar al Ancho'
        'Ajustar al Alto'
        'Ajustar a la P'#225'gina')
    end
    object rseZoom: TRxSpinEdit
      Left = 192
      Top = 27
      Width = 73
      Height = 24
      CheckOnExit = True
      Decimal = 0
      Increment = 10.000000000000000000
      MaxValue = 100.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 3
      OnChange = rseZoomChange
    end
    object RpnVisorFolio: TRxPanel
      Left = 16
      Top = 56
      Width = 1460
      Height = 409
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      TileImage = False
      DesignSize = (
        1460
        409)
      object imsFolio: TImageScrollBox
        Left = 0
        Top = 0
        Width = 1460
        Height = 409
        HorzScrollBar.Range = 973
        HorzScrollBar.Tracking = True
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 721
        VertScrollBar.Tracking = True
        VertScrollBar.Visible = False
        AntiAliased = True
        ZoomMode = zmFitWidth
        ZoomPercent = 100.000000000000000000
        MouseHandlerOwnership = True
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object RpnRegla: TRxPanel
        Left = 2
        Top = 224
        Width = 189
        Height = 58
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 4
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clTeal
        ParentBackground = False
        TabOrder = 1
        Visible = False
        OnMouseDown = RpnReglaMouseDown
        OnMouseMove = RpnReglaMouseMove
        OnMouseUp = RpnReglaMouseUp
        OnResize = RpnReglaResize
        Gradient.Direction = fdTopToBottom
        Gradient.EndColor = 10463550
        Gradient.StartColor = 10930928
        TileImage = False
        DesignSize = (
          185
          54)
        object rslAnchoRegla: TRxSlider
          Left = 111
          Top = 11
          Width = 63
          Height = 31
          BevelStyle = bvRaised
          Increment = 1
          EdgeSize = 1
          TabOrder = 0
          Anchors = [akRight, akBottom]
          OnChanged = rslAnchoReglaChanged
        end
        object ccbColorRegla: TColorComboBox
          Left = 42
          Top = 16
          Width = 58
          Height = 20
          ColorValue = clOlive
          DisplayNames = False
          Anchors = [akRight, akBottom]
          TabOrder = 1
          OnChange = ccbColorReglaChange
        end
      end
    end
    object RpnAsociados: TRxPanel
      Left = 450
      Top = 474
      Width = 1029
      Height = 100
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 4
      TileImage = False
      object dbgAsociados: TDBGrid
        Left = 0
        Top = 0
        Width = 1029
        Height = 100
        Align = alClient
        Color = clHotLight
        DrawingStyle = gdsClassic
        FixedColor = clInactiveCaption
        GradientEndColor = clTeal
        GradientStartColor = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnMouseUp = dbgAsociadosMouseUp
        Columns = <
          item
            Color = 16571047
            Expanded = False
            FieldName = 'nombres'
            Title.Caption = 'NOMBRES'
            Title.Color = clTeal
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 260
            Visible = True
          end
          item
            Color = 16640718
            Expanded = False
            FieldName = 'apellidos'
            Title.Caption = 'APELLIDOS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 269
            Visible = True
          end
          item
            Color = 16571047
            Expanded = False
            FieldName = 'numerodocumento'
            Title.Caption = 'N'#218'MERO DOCUMENTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 137
            Visible = True
          end
          item
            Color = 16640718
            Expanded = False
            FieldName = 'descripciontipoidentificacion'
            Title.Caption = 'TIPO DOCUMENTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 310
            Visible = True
          end>
      end
    end
    object RpnInformacion: TRxPanel
      Left = 16
      Top = 475
      Width = 405
      Height = 100
      Anchors = []
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TileImage = False
      object LblInformacion: TLabel
        Left = 0
        Top = 0
        Width = 405
        Height = 100
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMACION CAPTURADA'
        Color = clGradientActiveCaption
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        WordWrap = True
        ExplicitTop = 1
      end
    end
  end
  object RpnInformacionImagen: TRxPanel
    Left = 1497
    Top = 73
    Width = 419
    Height = 583
    Align = alClient
    Alignment = taLeftJustify
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 12885363
    Gradient.StartColor = 16315117
    Gradient.Visible = True
    TileImage = False
    DesignSize = (
      415
      579)
    object PnlSerieDocumental: TPanel
      Left = 0
      Top = 0
      Width = 415
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        415
        105)
      object spbNuevoFolio: TSpeedButton
        Left = 308
        Top = 16
        Width = 95
        Height = 68
        Anchors = [akTop, akRight]
        Caption = '&Buscar Folio'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          0E100000424D0E100000000000003600000028000000340000001A0000000100
          180000000000D80F0000120B0000120B00000000000000000000FF00FFFF00FF
          8080808080808080808080808080808080808080808080808080808080808080
          80808080808080808080808080808080808080808080808080808080808080FF
          00FFFF00FFFF00FFFF00FFFF00FF808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080808080808080
          80808080808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000
          FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF00FFFF00
          FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FF
          FF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF
          00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF8080
          80FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF8080
          80FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FF
          FF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF0080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFF
          FFFFFF00FFFF0080800080800080800080800080800080800080800080800080
          8000808000808000808000808000FFFFFFFFFF00FFFF808080FF00FFFF00FFFF
          00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00
          FFFF00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF
          808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF
          00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000
          FFFFFFFFFF00FFFF008080008080008080008080008080008080008080008080
          00808000808000808000808000808000FFFFFFFFFF00FFFF808080FF00FFFF00
          FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF00808000808000808000
          808000808000808000808000808000808000808000808000808000808000FFFF
          FFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FF
          FF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF
          00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF8080
          80FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF8080
          80FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FF
          FF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF0080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFF
          FFFFFF00FFFF0080800080800080800080800080800080800080800080800080
          8000808000808000808000808000FFFFFFFFFF00FFFF808080FF00FFFF00FFFF
          00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00
          FFFF00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF
          808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FF
          00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FF80808000
          FFFFFFFFFF00FFFF00808000808000808000808000808000808000808000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FF00FFFF00
          FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF00808000808000808000
          808000808000808000808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFF00808000FFFF00808000FFFF008080000000FF00FFFF00FFFF00FF
          FF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00808000FFFF00808000FFFF00
          8080000000FF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF8080
          80808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00FFFF
          00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
          FFFFFF00FFFFFFFFFF00FFFF8080808080808080808080808080808080808080
          80FF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FFFFFF
          FFFFFFFFFFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8080
          80FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF808080FFFFFFFFFFFFFF
          FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF00FFFF808080FFFFFFFFFFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080FFFFFFFFFFFF808080FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
          808080FFFFFFFFFFFF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
          FFFFFFFFFF00FFFFFFFFFF00FFFF808080FFFFFF808080FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808000FFFFFFFFFF00FFFFFFFF
          FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF808080FF
          FFFF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
          FFFFFFFF00FFFFFFFFFF808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808080808080FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080
          8080808080808080808080808080808080808080808080808080808080808080
          808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF80808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        OnClick = spbNuevoFolioClick
      end
      object Lbl1: TLabel
        Left = 14
        Top = 41
        Width = 81
        Height = 17
        Caption = 'C'#243'digo Folio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object EdtCodigoFolio: TEdit
        Left = 109
        Top = 37
        Width = 188
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnChange = EdtCodigoFolioChange
      end
    end
    object GrpInformacionImagen: TGroupBox
      Left = 4
      Top = 107
      Width = 395
      Height = 432
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Informaci'#243'n de la Imagen'
      DoubleBuffered = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        395
        432)
      object LblTiempoCaptura: TLabel
        Left = 136
        Top = 181
        Width = 126
        Height = 18
        Caption = 'Tiempo de Captura'
      end
      object LblRegistrosIngresados: TLabel
        Left = 29
        Top = 244
        Width = 137
        Height = 18
        Caption = 'Registros Ingresados'
      end
      object LblObservacionFolio: TLabel
        Left = 10
        Top = 354
        Width = 178
        Height = 16
        Alignment = taCenter
        Caption = 'OBSERVACIONES DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12016384
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblNovedadesSinCap: TLabel
        Left = 220
        Top = 247
        Width = 153
        Height = 18
        Caption = 'Novedades siin Captura'
      end
      object stgInfoImagen: TStringGrid
        Left = 10
        Top = 23
        Width = 373
        Height = 153
        Color = clMenuHighlight
        ColCount = 2
        Ctl3D = True
        DoubleBuffered = False
        DrawingStyle = gdsClassic
        Enabled = False
        FixedCols = 0
        RowCount = 6
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientEndColor = 4227327
        GradientStartColor = clBlue
        Options = [goVertLine, goHorzLine, goFixedHotTrack]
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnDrawCell = stgInfoImagenDrawCell
      end
      object PnlTiempoCaptura: TPanel
        Left = 105
        Top = 200
        Width = 202
        Height = 41
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = 14666419
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object PnlRegistrosIngresados: TPanel
        Left = 24
        Top = 266
        Width = 153
        Height = 32
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = 14666419
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object redObservacionFolio: TRxRichEdit
        Left = 10
        Top = 368
        Width = 373
        Height = 44
        DrawEndPage = False
        Anchors = [akLeft, akTop, akBottom]
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 500
        ParentFont = False
        TabOrder = 3
        WantReturns = False
        OnChange = redObservacionFolioChange
        OnKeyDown = redObservacionFolioKeyDown
      end
      object chkObservacionFolio: TCheckBox
        Left = 10
        Top = 325
        Width = 199
        Height = 17
        Caption = 'Documento con Novedad'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = chkObservacionFolioClick
      end
      object PnlNovedadesSinCap: TPanel
        Left = 220
        Top = 266
        Width = 153
        Height = 32
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = 14666419
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object PnlFolioNoCap: TPanel
        Left = 220
        Top = 304
        Width = 163
        Height = 60
        BevelInner = bvLowered
        Color = 1540344
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
        DesignSize = (
          163
          60)
        object rxlFolioNoCap: TRxLabel
          Left = 26
          Top = 4
          Width = 124
          Height = 54
          AutoSize = False
          Caption = 'MARCAR COMO'#13#10'FOLIO'#13#10'NO-CAPTURABLE'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -15
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Anchors = []
          ParentFont = False
          ShadowColor = clNone
          ShadowSize = 0
          ShadowPos = spRightTop
          WordWrap = True
          ExplicitLeft = 21
          ExplicitTop = 6
        end
        object chkFolioNoCap: TRxCheckBox
          Left = 6
          Top = 23
          Width = 17
          Height = 23
          DoubleBuffered = False
          Enabled = False
          ParentDoubleBuffered = False
          TabOrder = 0
          WordWrap = True
          OnClick = chkFolioNoCapClick
          HorizontalAlignment = taLeftJustify
          VerticalAlignment = taAlignTop
          Style = vsNormal
        end
      end
    end
  end
  object RpnCaptura: TRxPanel
    Left = 0
    Top = 656
    Width = 1916
    Height = 218
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Gradient.Direction = fdBottomToTop
    Gradient.EndColor = 12885363
    Gradient.StartColor = 16315117
    Gradient.Visible = True
    TileImage = False
    object RpnCapturaDatos: TRxPanel
      Left = 0
      Top = 0
      Width = 1448
      Height = 218
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Color = 15655895
      ParentBackground = False
      TabOrder = 0
      Gradient.Direction = fdBottomToTop
      Gradient.EndColor = 12885363
      Gradient.StartColor = 15786969
      Gradient.Visible = True
      TileImage = False
      object RpnRegistroGuardado: TRxPanel
        Left = 1232
        Top = 41
        Width = 210
        Height = 41
        BevelOuter = bvNone
        Caption = 'REGISTRO GUARDADO'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8451071
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        Gradient.Direction = fdTopToBottom
        Gradient.EndColor = 8488756
        Gradient.StartColor = 10463550
        Gradient.Visible = True
        TileImage = False
      end
      object GrpGeneralesHistorias: TGroupBox
        Left = 0
        Top = 0
        Width = 1448
        Height = 65
        Align = alClient
        Caption = #9632
        Color = 15655895
        DoubleBuffered = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        DesignSize = (
          1448
          65)
        object LblTituloHistorias: TLabel
          Left = 26
          Top = 27
          Width = 1416
          Height = 23
          Alignment = taCenter
          Anchors = []
          AutoSize = False
          Caption = 'INFORMACI'#211'N PROCESO DE CAPTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object GrpGeneralesNomina: TGroupBox
        Left = 0
        Top = 0
        Width = 1448
        Height = 65
        Align = alClient
        Caption = 'Informaci'#243'n General N'#243'mina'
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        DesignSize = (
          1448
          65)
        object spbCancelarFechaNomina: TSpeedButton
          Left = 991
          Top = 18
          Width = 94
          Height = 41
          Anchors = []
          Caption = 'Cancelar Cambio'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            DA060000424DDA06000000000000360000002800000021000000110000000100
            180000000000A406000000000000000000000000000000000000FDFDFDFFFFFE
            FFFFFFD0D5F1C6CAEAFFFFFFFFFFFEFEFFFFFFFCFCFCFDFCFFFFFEE0E7F4B8BE
            E6FFFFFDFFFFFCFDFCFCFEFEFFFDFDFDFFFFFEFFFFFFC2C8ECD6D9F0FFFFFFFF
            FFFEFEFFFFFEFCFCFDFEFCFFFFFFD2DAEFC2C5E9FFFFFEFDFEFAFDFDFE00FBFE
            FDFFFFFFC8D4EE0119B70006AEA0B0E1FFFFFFFFFEFCFCFBFBFFFFFFD7DFF122
            3CBD0000A88298DBFFFFFDFFFFFEFCFAFCFDFFFEFFFFFFAAB9E60000AE0920B6
            B9C5E9FFFFFFFDFDFCFDFDFCFFFFFFC0CBEB031EB40002AEA5B6E4FFFFFEFEFF
            FE00FFFFFFCAD0EF243FBE0019BB001DBF0828BAA5B2E4FFFFFFFFFFFFEAECF5
            3448C10014BA0022BD0220BC8D9DDCFFFFFFFFFFFEFFFFFFAEB8E7102EB9001C
            BC0019BB1937BDC6CFEDFFFFFFFFFFFFCBD1EB1D34BD0016BC0022BD112CBDAA
            B6E6FFFFFF00CFD7F21333BE001FBC062FC00630C10020C00126BBB2BEE6F8FA
            F8304AC1001ABA0530BE0A30C00026BF001EB97990D7FFFFFFA0AFE50929BC00
            24C00530BF062EC1001CBF0F35BED9DEF1D9E0EF1935BE001EBD0632BF0930C0
            0023BE0020B9AFBFE6007181D50003BE0438C30B36C50B35C4083AC4002DC208
            32BF1438BF0025C00837C50A36C50635C70A39C40020C9001CB7FFFFFE374AC7
            0013C00539C30D34C50A35C3083AC30028C11038BF0C32BF002AC30938C50936
            C60635C70939C40013C8364EC000E8EDF53860DB002ED30B3EC40D3DC80D3CC9
            0D3FCA0738C80335C80D3FCA0B3BC90B3CC80F3DC50034CE0D3FD4B1BBE8FFFF
            FBC6D2EE234DDA0031D00D3FC40D3DCA0C3CC90D3ECA0536C70538C80E3FCA0B
            3BC90B3DC80E3CC60031CF1E49D5DCDEF100FFFFFFDBE2F14067D90039D91244
            C91045CC1045CD0F45CD1147CF1244CD1045CA1046C9023DD60C45D7ABB9E8FF
            FFFFFFFFFBFFFFFEC7D0EC2354D8003AD61145C91045CC1045CD0F45CD1147CF
            1244CD0F46C91045CA003AD72253D8C4CDEDFFFFFF00F9FBFCFFFFFEEAEBF039
            64DD0749DB134DD1134CD1134CD1134DD2144DD20F4FCD0B4BD8154BE0B3BDE3
            FFFFFEFFFFFDFAFBFCFBFCFBFFFFFED2D5EB1E52DE0A4CD9134CD1134CD1134C
            D1134CD2124DD10F4FCE0849DB2857E0D0D4EAFFFFFEFEFDFC00FEFCFCFCFDFC
            FFFFFFE1DAEA0036CB1457DA1755D51756D61554D41756D41456D60045D26E84
            D3FFFFFFFFFFFDFBFBFBFEFFFDFDFCFDFDFEFDFFFFFFB2B3DF003CD11657D817
            55D41756D61754D41756D51557D6003FD09CA4DBFFFFFFFDFEFCFBFCFC00F9FA
            FBFFFFFDEBE7F33B66CA0D53D41B5EDB195ED8195ED9195DD7195FD81A5ED917
            5AD8164ECDB1BEE4FFFFFEFFFFFDFEFEFFFAFBFAFFFFFDD2D3EB1F57C81357D6
            1A5EDA195ED8195ED91A5DD81A5FD91B5ED91457D72A59CECFD5ECFFFFFFFFFF
            FE00FFFFFCDADEF0466DCE0254D92168DE1D65DD1C65DE1D65DC1D64DC1D66DC
            1D65DC1F68DD0B61DC1A51CCADB8E5FFFFFFFFFFFEFFFFFCC6CDEA2C5CCD0459
            DC2368DD1B66DE1C65DD1C65DC1D64DC1D66DB1E66DB1E67DE065BD92E5DCDC5
            CBEBFFFFFF00E9ECF6426DCF0C58DB216DE6216EDF206CE3216BE11C71E41D72
            EC246DE01F6CDF216CE2226FE41563E11A54CDB1B9E7FFFFFFC9D1EC2F60CE10
            5FDF236EE5216DE0216CE2216CE11A71E61F71EA226DDF1F6BE0226CE22270E3
            105DDD2758CBD9DCF300718FD80049E0247BE52675E42472E32575DF1E79ED1A
            67E6215DDB1B76F42676E02277E22576E32276E7106CE80040CBFFFEF93666D3
            035BE42677E42674E32472E22576E01B78F21D63DE1D60E21D76F12476DE2377
            E22575E32578E70363E7325ECD00D0D5E9226AE11B7CF0297CE8277BE61D7EF0
            196BE8B4BAE3F3E8EE3971DC0F78F5287DE7297AE42281EE136CE97195E1FFFF
            FFA4B4E31D6CE51E7FEF2A7CE6277BE7197CF3256CE2D7D5EAD5D1E7266CE216
            7BF4287DE5297CE61F81F11164E4A4B8E700FFFFFEC8CBE93574DF2182F22685
            F42071E6A5B0E0FFFFFEFFFFFFE1DCEA3A76E11B7EF12B8CF41F72E9849FDFFF
            FEFCFFFFFEFFFFFCADB6E32671E32787F41F81F42C73E2C4C5E5FFFFFFFFFFFE
            C4C7E42A71E42084F32888F42671E5A0B1E1FFFFFF00FDFEFAFFFFFEC7C8E810
            62DC0662E4A2AFE2FFFFF7FFFFFCFBFCFCFFFFFDD4D3EC3174DF005DE4819BDF
            FDF9F9FFFFFEFFFEFDFEFFFBFFFFFCAAB3E30059DE1B6AE2BBC1E6FFFFF9FFFE
            FDFCFDFDFFFFFCBEC3E81869E00262E3A0AFE3FFFDFBFFFFFE00FDFDFEFDFDFC
            FFFFFDCCD4F1C3CEEBFFFFFCFFFFFCFEFAFDFAFDFAFDFEFBFFFFFCE1E4F4B4C5
            E9FFFFF8FFFFFCFBFCFAFFFFFFFCFBFDFEFEFCFFFFFDBFCBECD1D9EEFFFFFCFF
            FFFBFEF9FEFAFDFAFFFEFBFFFFFDD3DAF0BDCBEBFFFFFAFFFFFBFDFEFC00}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          Spacing = 1
          Transparent = False
          OnClick = spbCancelarFechaNominaClick
        end
        object RpnRealizadosNomina: TRxPanel
          Left = 881
          Top = 18
          Width = 210
          Height = 41
          BevelOuter = bvNone
          Caption = 'CAMBIO REALIZADO'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          Visible = False
          Gradient.Direction = fdTopToBottom
          Gradient.EndColor = 10053171
          Gradient.StartColor = 9247509
          Gradient.Visible = True
          TileImage = False
        end
        object bbtGuardarFechaNomina: TBitBtn
          Left = 891
          Top = 18
          Width = 94
          Height = 41
          Anchors = []
          Caption = 'Guardar Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFCECF
            C36465AA5556A452539F4F509A4D4D944A4A8F4747894444834141783B3C783B
            3C7239396E3637FF00FFFF00FFEFCECFC36465AA5556A452539F4F509A4D4D94
            4A4A8F4747894444834141783B3C783B3C7239396E3637FF00FFFF00FFCF6B6C
            F38E8FE68081AA4424473221C3B4ABC6BBB3CAC1BCCEC8C4564D489E3E339C3D
            36983931723939FF00FFFF00FFCF6B6CF38E8FE68081AA4424473221C3B4ABC6
            BBB3CAC1BCCEC8C4564D489E3E339C3D36983931723939FF00FFFF00FFD16F70
            FF999AEC8687E68081715B4B473C348D7868EDE0D8F1E7E08F7F73A34135A242
            3C9C3D35783B3CFF00FFFF00FFD16F70FF999AEC8687E68081715B4B473C348D
            7868EDE0D8F1E7E08F7F73A34135A2423C9C3D35783B3CFF00FFFF00FFD47576
            FF9FA0F59091EC8687715B4B000000473C34E9D9CEECDDD4857467AE4B43AA49
            44A3423C7D3E3EFF00FFFF00FFD47576FF9FA0F59091EC8687715B4B00000047
            3C34E9D9CEECDDD4857467AE4B43AA4944A3423C7D3E3EFF00FFFF00FFD77B7C
            FFA9AAFB9FA0F59394715B4B715B4B715B4B715B4B7662527D6A5BBA5654B24F
            4CAA4944834141FF00FFFF00FFD77B7CFFA9AAFB9FA0F59394715B4B715B4B71
            5B4B715B4B7662527D6A5BBA5654B24F4CAA4944834141FF00FFFF00FFDB8384
            FFB3B4FFADAEFCA3A4F48E8FEC8687E68081DF797AD77172D16B6CC15D5CBA56
            54B2504C894444FF00FFFF00FFDB8384FFB3B4FFADAEFCA3A4F48E8FEC8687E6
            8081DF797AD77172D16B6CC15D5CBA5654B2504C894444FF00FFFF00FFDF8A8B
            FFBBBCFFB6B7C96360C45E56BE584BB8523FB34D34AD4728A7411CA13B11C15D
            5CBA56548F4747FF00FFFF00FFDF8A8BFFBBBCFFB6B7C96360C45E56BE584BB8
            523FB34D34AD4728A7411CA13B11C15D5CBA56548F4747FF00FFFF00FFE29192
            FFBDBECC6667FFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6E1CABDA13B
            11C25D5C944A4AFF00FFFF00FFE29192FFBDBECC6667FFFFFFFFFFFFFBF8F6F6
            EEEAF0E5DEEADBD2E5D1C6E1CABDA13B11C25D5C944A4AFF00FFFF00FFE59798
            FFBDBED36D6EFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6A741
            1CCC67679A4D4DFF00FFFF00FFE59798FFBDBED36D6EFFFFFFFFFFFFFFFFFFFB
            F8F6F6EEEAF0E5DEEADBD2E5D1C6A7411CCC67679A4D4DFF00FFFF00FFE99E9F
            FFBDBEDC7677FFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2AD47
            28D771729F4F50FF00FFFF00FFE99E9FFFBDBEDC7677FFFFFFFFFFFFFFFFFFFF
            FFFFFBF8F6F6EEEAF0E5DEEADBD2AD4728D771729F4F50FF00FFFF00FFEDA6A7
            FFBDBEE68081FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D
            34DF797AA45253FF00FFFF00FFEDA6A7FFBDBEE68081FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D34DF797AA45253FF00FFFF00FFF0ACAD
            FFBDBEEF898AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAB852
            3F673333AA5556FF00FFFF00FFF0ACADFFBDBEEF898AFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFBF8F6F6EEEAB8523F673333AA5556FF00FFFF00FFF3B2B3
            FFBDBEF89293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6BE58
            4BB05859B05859FF00FFFF00FFF3B2B3FFBDBEF89293FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBF8F6BE584BB05859B05859FF00FFFF00FFF5B6B7
            F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E79A9BE49394E08E8FDD8788DA8081D67A
            7BD37475D16F70FF00FFFF00FFF5B6B7F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E7
            9A9BE49394E08E8FDD8788DA8081D67A7BD37475D16F70FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = bbtGuardarFechaNominaClick
        end
        object PnlDatosNomina: TPanel
          Left = 563
          Top = 18
          Width = 312
          Height = 41
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            312
            41)
          object LblFechaNomina: TLabel
            Left = 6
            Top = 7
            Width = 174
            Height = 23
            Anchors = []
            Caption = 'Fecha de la N'#243'mina:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 15
          end
          object mkeFechaNomina: TMaskEdit
            Left = 188
            Top = 3
            Width = 110
            Height = 31
            Alignment = taCenter
            Anchors = []
            AutoSelect = False
            AutoSize = False
            Color = 50319311
            EditMask = '!00/00/0000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Text = '  /  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkeFechaNominaChange
            OnExit = mkeFechaNominaExit
          end
        end
        object bbtCambiarFechaNomina: TBitBtn
          Left = 877
          Top = 21
          Width = 214
          Height = 35
          Anchors = []
          Caption = 'Cambiar Fecha &N'#243'mina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
          OnClick = bbtCambiarFechaNominaClick
        end
      end
      object GrpGeneralesAportes: TGroupBox
        Left = 0
        Top = 0
        Width = 1448
        Height = 65
        Align = alClient
        Caption = 'Informaci'#243'n General Aportes'
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        DesignSize = (
          1448
          65)
        object spbCancelarCambiosAportes: TSpeedButton
          Left = 1290
          Top = 18
          Width = 103
          Height = 41
          Anchors = []
          Caption = 'Cancelar Cambios'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            DA060000424DDA06000000000000360000002800000021000000110000000100
            180000000000A406000000000000000000000000000000000000FDFDFDFFFFFE
            FFFFFFD0D5F1C6CAEAFFFFFFFFFFFEFEFFFFFFFCFCFCFDFCFFFFFEE0E7F4B8BE
            E6FFFFFDFFFFFCFDFCFCFEFEFFFDFDFDFFFFFEFFFFFFC2C8ECD6D9F0FFFFFFFF
            FFFEFEFFFFFEFCFCFDFEFCFFFFFFD2DAEFC2C5E9FFFFFEFDFEFAFDFDFE00FBFE
            FDFFFFFFC8D4EE0119B70006AEA0B0E1FFFFFFFFFEFCFCFBFBFFFFFFD7DFF122
            3CBD0000A88298DBFFFFFDFFFFFEFCFAFCFDFFFEFFFFFFAAB9E60000AE0920B6
            B9C5E9FFFFFFFDFDFCFDFDFCFFFFFFC0CBEB031EB40002AEA5B6E4FFFFFEFEFF
            FE00FFFFFFCAD0EF243FBE0019BB001DBF0828BAA5B2E4FFFFFFFFFFFFEAECF5
            3448C10014BA0022BD0220BC8D9DDCFFFFFFFFFFFEFFFFFFAEB8E7102EB9001C
            BC0019BB1937BDC6CFEDFFFFFFFFFFFFCBD1EB1D34BD0016BC0022BD112CBDAA
            B6E6FFFFFF00CFD7F21333BE001FBC062FC00630C10020C00126BBB2BEE6F8FA
            F8304AC1001ABA0530BE0A30C00026BF001EB97990D7FFFFFFA0AFE50929BC00
            24C00530BF062EC1001CBF0F35BED9DEF1D9E0EF1935BE001EBD0632BF0930C0
            0023BE0020B9AFBFE6007181D50003BE0438C30B36C50B35C4083AC4002DC208
            32BF1438BF0025C00837C50A36C50635C70A39C40020C9001CB7FFFFFE374AC7
            0013C00539C30D34C50A35C3083AC30028C11038BF0C32BF002AC30938C50936
            C60635C70939C40013C8364EC000E8EDF53860DB002ED30B3EC40D3DC80D3CC9
            0D3FCA0738C80335C80D3FCA0B3BC90B3CC80F3DC50034CE0D3FD4B1BBE8FFFF
            FBC6D2EE234DDA0031D00D3FC40D3DCA0C3CC90D3ECA0536C70538C80E3FCA0B
            3BC90B3DC80E3CC60031CF1E49D5DCDEF100FFFFFFDBE2F14067D90039D91244
            C91045CC1045CD0F45CD1147CF1244CD1045CA1046C9023DD60C45D7ABB9E8FF
            FFFFFFFFFBFFFFFEC7D0EC2354D8003AD61145C91045CC1045CD0F45CD1147CF
            1244CD0F46C91045CA003AD72253D8C4CDEDFFFFFF00F9FBFCFFFFFEEAEBF039
            64DD0749DB134DD1134CD1134CD1134DD2144DD20F4FCD0B4BD8154BE0B3BDE3
            FFFFFEFFFFFDFAFBFCFBFCFBFFFFFED2D5EB1E52DE0A4CD9134CD1134CD1134C
            D1134CD2124DD10F4FCE0849DB2857E0D0D4EAFFFFFEFEFDFC00FEFCFCFCFDFC
            FFFFFFE1DAEA0036CB1457DA1755D51756D61554D41756D41456D60045D26E84
            D3FFFFFFFFFFFDFBFBFBFEFFFDFDFCFDFDFEFDFFFFFFB2B3DF003CD11657D817
            55D41756D61754D41756D51557D6003FD09CA4DBFFFFFFFDFEFCFBFCFC00F9FA
            FBFFFFFDEBE7F33B66CA0D53D41B5EDB195ED8195ED9195DD7195FD81A5ED917
            5AD8164ECDB1BEE4FFFFFEFFFFFDFEFEFFFAFBFAFFFFFDD2D3EB1F57C81357D6
            1A5EDA195ED8195ED91A5DD81A5FD91B5ED91457D72A59CECFD5ECFFFFFFFFFF
            FE00FFFFFCDADEF0466DCE0254D92168DE1D65DD1C65DE1D65DC1D64DC1D66DC
            1D65DC1F68DD0B61DC1A51CCADB8E5FFFFFFFFFFFEFFFFFCC6CDEA2C5CCD0459
            DC2368DD1B66DE1C65DD1C65DC1D64DC1D66DB1E66DB1E67DE065BD92E5DCDC5
            CBEBFFFFFF00E9ECF6426DCF0C58DB216DE6216EDF206CE3216BE11C71E41D72
            EC246DE01F6CDF216CE2226FE41563E11A54CDB1B9E7FFFFFFC9D1EC2F60CE10
            5FDF236EE5216DE0216CE2216CE11A71E61F71EA226DDF1F6BE0226CE22270E3
            105DDD2758CBD9DCF300718FD80049E0247BE52675E42472E32575DF1E79ED1A
            67E6215DDB1B76F42676E02277E22576E32276E7106CE80040CBFFFEF93666D3
            035BE42677E42674E32472E22576E01B78F21D63DE1D60E21D76F12476DE2377
            E22575E32578E70363E7325ECD00D0D5E9226AE11B7CF0297CE8277BE61D7EF0
            196BE8B4BAE3F3E8EE3971DC0F78F5287DE7297AE42281EE136CE97195E1FFFF
            FFA4B4E31D6CE51E7FEF2A7CE6277BE7197CF3256CE2D7D5EAD5D1E7266CE216
            7BF4287DE5297CE61F81F11164E4A4B8E700FFFFFEC8CBE93574DF2182F22685
            F42071E6A5B0E0FFFFFEFFFFFFE1DCEA3A76E11B7EF12B8CF41F72E9849FDFFF
            FEFCFFFFFEFFFFFCADB6E32671E32787F41F81F42C73E2C4C5E5FFFFFFFFFFFE
            C4C7E42A71E42084F32888F42671E5A0B1E1FFFFFF00FDFEFAFFFFFEC7C8E810
            62DC0662E4A2AFE2FFFFF7FFFFFCFBFCFCFFFFFDD4D3EC3174DF005DE4819BDF
            FDF9F9FFFFFEFFFEFDFEFFFBFFFFFCAAB3E30059DE1B6AE2BBC1E6FFFFF9FFFE
            FDFCFDFDFFFFFCBEC3E81869E00262E3A0AFE3FFFDFBFFFFFE00FDFDFEFDFDFC
            FFFFFDCCD4F1C3CEEBFFFFFCFFFFFCFEFAFDFAFDFAFDFEFBFFFFFCE1E4F4B4C5
            E9FFFFF8FFFFFCFBFCFAFFFFFFFCFBFDFEFEFCFFFFFDBFCBECD1D9EEFFFFFCFF
            FFFBFEF9FEFAFDFAFFFEFBFFFFFDD3DAF0BDCBEBFFFFFAFFFFFBFDFEFC00}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          Spacing = 1
          Transparent = False
          OnClick = spbCancelarCambiosAportesClick
        end
        object RpnRealizadosAportes: TRxPanel
          Left = 1181
          Top = 18
          Width = 210
          Height = 41
          BevelOuter = bvNone
          Caption = 'CAMBIOS REALIZADOS'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          Visible = False
          Gradient.Direction = fdTopToBottom
          Gradient.EndColor = 10053171
          Gradient.StartColor = 9247509
          Gradient.Visible = True
          TileImage = False
        end
        object bbtGuardarCambiosAportes: TBitBtn
          Left = 1181
          Top = 18
          Width = 103
          Height = 41
          Anchors = []
          Caption = 'Guardar Cambios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFCECF
            C36465AA5556A452539F4F509A4D4D944A4A8F4747894444834141783B3C783B
            3C7239396E3637FF00FFFF00FFEFCECFC36465AA5556A452539F4F509A4D4D94
            4A4A8F4747894444834141783B3C783B3C7239396E3637FF00FFFF00FFCF6B6C
            F38E8FE68081AA4424473221C3B4ABC6BBB3CAC1BCCEC8C4564D489E3E339C3D
            36983931723939FF00FFFF00FFCF6B6CF38E8FE68081AA4424473221C3B4ABC6
            BBB3CAC1BCCEC8C4564D489E3E339C3D36983931723939FF00FFFF00FFD16F70
            FF999AEC8687E68081715B4B473C348D7868EDE0D8F1E7E08F7F73A34135A242
            3C9C3D35783B3CFF00FFFF00FFD16F70FF999AEC8687E68081715B4B473C348D
            7868EDE0D8F1E7E08F7F73A34135A2423C9C3D35783B3CFF00FFFF00FFD47576
            FF9FA0F59091EC8687715B4B000000473C34E9D9CEECDDD4857467AE4B43AA49
            44A3423C7D3E3EFF00FFFF00FFD47576FF9FA0F59091EC8687715B4B00000047
            3C34E9D9CEECDDD4857467AE4B43AA4944A3423C7D3E3EFF00FFFF00FFD77B7C
            FFA9AAFB9FA0F59394715B4B715B4B715B4B715B4B7662527D6A5BBA5654B24F
            4CAA4944834141FF00FFFF00FFD77B7CFFA9AAFB9FA0F59394715B4B715B4B71
            5B4B715B4B7662527D6A5BBA5654B24F4CAA4944834141FF00FFFF00FFDB8384
            FFB3B4FFADAEFCA3A4F48E8FEC8687E68081DF797AD77172D16B6CC15D5CBA56
            54B2504C894444FF00FFFF00FFDB8384FFB3B4FFADAEFCA3A4F48E8FEC8687E6
            8081DF797AD77172D16B6CC15D5CBA5654B2504C894444FF00FFFF00FFDF8A8B
            FFBBBCFFB6B7C96360C45E56BE584BB8523FB34D34AD4728A7411CA13B11C15D
            5CBA56548F4747FF00FFFF00FFDF8A8BFFBBBCFFB6B7C96360C45E56BE584BB8
            523FB34D34AD4728A7411CA13B11C15D5CBA56548F4747FF00FFFF00FFE29192
            FFBDBECC6667FFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6E1CABDA13B
            11C25D5C944A4AFF00FFFF00FFE29192FFBDBECC6667FFFFFFFFFFFFFBF8F6F6
            EEEAF0E5DEEADBD2E5D1C6E1CABDA13B11C25D5C944A4AFF00FFFF00FFE59798
            FFBDBED36D6EFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6A741
            1CCC67679A4D4DFF00FFFF00FFE59798FFBDBED36D6EFFFFFFFFFFFFFFFFFFFB
            F8F6F6EEEAF0E5DEEADBD2E5D1C6A7411CCC67679A4D4DFF00FFFF00FFE99E9F
            FFBDBEDC7677FFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2AD47
            28D771729F4F50FF00FFFF00FFE99E9FFFBDBEDC7677FFFFFFFFFFFFFFFFFFFF
            FFFFFBF8F6F6EEEAF0E5DEEADBD2AD4728D771729F4F50FF00FFFF00FFEDA6A7
            FFBDBEE68081FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D
            34DF797AA45253FF00FFFF00FFEDA6A7FFBDBEE68081FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D34DF797AA45253FF00FFFF00FFF0ACAD
            FFBDBEEF898AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAB852
            3F673333AA5556FF00FFFF00FFF0ACADFFBDBEEF898AFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFBF8F6F6EEEAB8523F673333AA5556FF00FFFF00FFF3B2B3
            FFBDBEF89293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6BE58
            4BB05859B05859FF00FFFF00FFF3B2B3FFBDBEF89293FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBF8F6BE584BB05859B05859FF00FFFF00FFF5B6B7
            F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E79A9BE49394E08E8FDD8788DA8081D67A
            7BD37475D16F70FF00FFFF00FFF5B6B7F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E7
            9A9BE49394E08E8FDD8788DA8081D67A7BD37475D16F70FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = bbtGuardarCambiosAportesClick
        end
        object bbtCambiarInformacionAportes: TBitBtn
          Left = 1175
          Top = 21
          Width = 250
          Height = 35
          Anchors = []
          Caption = 'Cambiar Informaci'#243'n &Aportes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = bbtCambiarInformacionAportesClick
        end
        object PnlDatosAportes: TPanel
          Left = 10
          Top = 17
          Width = 1150
          Height = 41
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            1150
            41)
          object LblPeriodoCotizacion: TLabel
            Left = 526
            Top = 9
            Width = 158
            Height = 23
            Anchors = []
            Caption = 'Periodo Cotizaci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LblFondoEntidad: TLabel
            Left = 11
            Top = 9
            Width = 130
            Height = 23
            Anchors = []
            Caption = 'Fondo/Entidad:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LblFechaPagoBanco: TLabel
            Left = 836
            Top = 10
            Width = 181
            Height = 23
            Anchors = []
            Caption = 'Fecha Pago al Banco:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 797
          end
          object EdtTemporal: TEdit
            Left = 758
            Top = 7
            Width = 11
            Height = 26
            TabOrder = 3
            Text = 'EdtTemporal'
            OnEnter = EdtTemporalEnter
          end
          object mkeFechaPagoBanco: TMaskEdit
            Left = 1033
            Top = 7
            Width = 104
            Height = 31
            Alignment = taCenter
            Anchors = []
            AutoSelect = False
            AutoSize = False
            Color = 50319311
            EditMask = '!00/00/9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 2
            Text = '  /  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkeFechaPagoBancoChange
            OnExit = mkeFechaPagoBancoExit
          end
          object mkePeriodoCotizacion: TMaskEdit
            Left = 700
            Top = 6
            Width = 77
            Height = 31
            Alignment = taCenter
            Anchors = []
            AutoSelect = False
            AutoSize = False
            Color = 50319311
            EditMask = '00/0000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 1
            Text = '  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkePeriodoCotizacionChange
            OnExit = mkePeriodoCotizacionExit
          end
          object dblFondoEntidad: TDBLookupComboBox
            Left = 153
            Top = 7
            Width = 315
            Height = 27
            Color = 50319311
            DropDownRows = 6
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = dblFondoEntidadClick
            OnEnter = dblFondoEntidadEnter
          end
        end
      end
      object GrpDatosParticulares: TGroupBox
        Left = 0
        Top = 65
        Width = 1448
        Height = 153
        Align = alBottom
        BiDiMode = bdLeftToRight
        Caption = 'Informaci'#243'n Personal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          1448
          153)
        object LblObservacionesRegistro: TLabel
          Left = 1029
          Top = 47
          Width = 163
          Height = 16
          Alignment = taCenter
          Caption = 'OBSERVACIONES REGISTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12016384
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object GrpOpcionesGuardar: TGroupBox
          Left = 1337
          Top = 20
          Width = 105
          Height = 127
          TabOrder = 3
          DesignSize = (
            105
            127)
          object spbCancelarLimpiar: TSpeedButton
            Left = 4
            Top = 43
            Width = 95
            Height = 40
            Anchors = []
            Caption = 'Cancelar/&Limpiar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              DA060000424DDA06000000000000360000002800000021000000110000000100
              180000000000A406000000000000000000000000000000000000FDFDFDFFFFFE
              FFFFFFD0D5F1C6CAEAFFFFFFFFFFFEFEFFFFFFFCFCFCFDFCFFFFFEE0E7F4B8BE
              E6FFFFFDFFFFFCFDFCFCFEFEFFFDFDFDFFFFFEFFFFFFC2C8ECD6D9F0FFFFFFFF
              FFFEFEFFFFFEFCFCFDFEFCFFFFFFD2DAEFC2C5E9FFFFFEFDFEFAFDFDFE00FBFE
              FDFFFFFFC8D4EE0119B70006AEA0B0E1FFFFFFFFFEFCFCFBFBFFFFFFD7DFF122
              3CBD0000A88298DBFFFFFDFFFFFEFCFAFCFDFFFEFFFFFFAAB9E60000AE0920B6
              B9C5E9FFFFFFFDFDFCFDFDFCFFFFFFC0CBEB031EB40002AEA5B6E4FFFFFEFEFF
              FE00FFFFFFCAD0EF243FBE0019BB001DBF0828BAA5B2E4FFFFFFFFFFFFEAECF5
              3448C10014BA0022BD0220BC8D9DDCFFFFFFFFFFFEFFFFFFAEB8E7102EB9001C
              BC0019BB1937BDC6CFEDFFFFFFFFFFFFCBD1EB1D34BD0016BC0022BD112CBDAA
              B6E6FFFFFF00CFD7F21333BE001FBC062FC00630C10020C00126BBB2BEE6F8FA
              F8304AC1001ABA0530BE0A30C00026BF001EB97990D7FFFFFFA0AFE50929BC00
              24C00530BF062EC1001CBF0F35BED9DEF1D9E0EF1935BE001EBD0632BF0930C0
              0023BE0020B9AFBFE6007181D50003BE0438C30B36C50B35C4083AC4002DC208
              32BF1438BF0025C00837C50A36C50635C70A39C40020C9001CB7FFFFFE374AC7
              0013C00539C30D34C50A35C3083AC30028C11038BF0C32BF002AC30938C50936
              C60635C70939C40013C8364EC000E8EDF53860DB002ED30B3EC40D3DC80D3CC9
              0D3FCA0738C80335C80D3FCA0B3BC90B3CC80F3DC50034CE0D3FD4B1BBE8FFFF
              FBC6D2EE234DDA0031D00D3FC40D3DCA0C3CC90D3ECA0536C70538C80E3FCA0B
              3BC90B3DC80E3CC60031CF1E49D5DCDEF100FFFFFFDBE2F14067D90039D91244
              C91045CC1045CD0F45CD1147CF1244CD1045CA1046C9023DD60C45D7ABB9E8FF
              FFFFFFFFFBFFFFFEC7D0EC2354D8003AD61145C91045CC1045CD0F45CD1147CF
              1244CD0F46C91045CA003AD72253D8C4CDEDFFFFFF00F9FBFCFFFFFEEAEBF039
              64DD0749DB134DD1134CD1134CD1134DD2144DD20F4FCD0B4BD8154BE0B3BDE3
              FFFFFEFFFFFDFAFBFCFBFCFBFFFFFED2D5EB1E52DE0A4CD9134CD1134CD1134C
              D1134CD2124DD10F4FCE0849DB2857E0D0D4EAFFFFFEFEFDFC00FEFCFCFCFDFC
              FFFFFFE1DAEA0036CB1457DA1755D51756D61554D41756D41456D60045D26E84
              D3FFFFFFFFFFFDFBFBFBFEFFFDFDFCFDFDFEFDFFFFFFB2B3DF003CD11657D817
              55D41756D61754D41756D51557D6003FD09CA4DBFFFFFFFDFEFCFBFCFC00F9FA
              FBFFFFFDEBE7F33B66CA0D53D41B5EDB195ED8195ED9195DD7195FD81A5ED917
              5AD8164ECDB1BEE4FFFFFEFFFFFDFEFEFFFAFBFAFFFFFDD2D3EB1F57C81357D6
              1A5EDA195ED8195ED91A5DD81A5FD91B5ED91457D72A59CECFD5ECFFFFFFFFFF
              FE00FFFFFCDADEF0466DCE0254D92168DE1D65DD1C65DE1D65DC1D64DC1D66DC
              1D65DC1F68DD0B61DC1A51CCADB8E5FFFFFFFFFFFEFFFFFCC6CDEA2C5CCD0459
              DC2368DD1B66DE1C65DD1C65DC1D64DC1D66DB1E66DB1E67DE065BD92E5DCDC5
              CBEBFFFFFF00E9ECF6426DCF0C58DB216DE6216EDF206CE3216BE11C71E41D72
              EC246DE01F6CDF216CE2226FE41563E11A54CDB1B9E7FFFFFFC9D1EC2F60CE10
              5FDF236EE5216DE0216CE2216CE11A71E61F71EA226DDF1F6BE0226CE22270E3
              105DDD2758CBD9DCF300718FD80049E0247BE52675E42472E32575DF1E79ED1A
              67E6215DDB1B76F42676E02277E22576E32276E7106CE80040CBFFFEF93666D3
              035BE42677E42674E32472E22576E01B78F21D63DE1D60E21D76F12476DE2377
              E22575E32578E70363E7325ECD00D0D5E9226AE11B7CF0297CE8277BE61D7EF0
              196BE8B4BAE3F3E8EE3971DC0F78F5287DE7297AE42281EE136CE97195E1FFFF
              FFA4B4E31D6CE51E7FEF2A7CE6277BE7197CF3256CE2D7D5EAD5D1E7266CE216
              7BF4287DE5297CE61F81F11164E4A4B8E700FFFFFEC8CBE93574DF2182F22685
              F42071E6A5B0E0FFFFFEFFFFFFE1DCEA3A76E11B7EF12B8CF41F72E9849FDFFF
              FEFCFFFFFEFFFFFCADB6E32671E32787F41F81F42C73E2C4C5E5FFFFFFFFFFFE
              C4C7E42A71E42084F32888F42671E5A0B1E1FFFFFF00FDFEFAFFFFFEC7C8E810
              62DC0662E4A2AFE2FFFFF7FFFFFCFBFCFCFFFFFDD4D3EC3174DF005DE4819BDF
              FDF9F9FFFFFEFFFEFDFEFFFBFFFFFCAAB3E30059DE1B6AE2BBC1E6FFFFF9FFFE
              FDFCFDFDFFFFFCBEC3E81869E00262E3A0AFE3FFFDFBFFFFFE00FDFDFEFDFDFC
              FFFFFDCCD4F1C3CEEBFFFFFCFFFFFCFEFAFDFAFDFAFDFEFBFFFFFCE1E4F4B4C5
              E9FFFFF8FFFFFCFBFCFAFFFFFFFCFBFDFEFEFCFFFFFDBFCBECD1D9EEFFFFFCFF
              FFFBFEF9FEFAFDFAFFFEFBFFFFFDD3DAF0BDCBEBFFFFFAFFFFFBFDFEFC00}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            Spacing = 1
            Transparent = False
            OnClick = spbCancelarLimpiarClick
          end
          object spbNuevaPersona: TSpeedButton
            Left = 4
            Top = 83
            Width = 95
            Height = 41
            Anchors = []
            Caption = 'Nueva &Persona'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              E2060000424DE206000000000000360400002800000023000000130000000100
              080000000000AC02000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              F6F6F6F6F6F6FFFFFFFFFFFFFFFFFFFFFFF6F6F6F6F6F6FFFFFFFFFFFF00FFFF
              FFFFFFF6631911111164FFFFFFFFFFFFFFFFFFFFFF641111111963F6FFFFFFFF
              FF00FFFFFFFFFFF6632222221A6CF6FFFFFFFFFFFFFFFFFFF66C1A22222263F6
              FFFFFFFFFF00FFFFFFFFFFF6632323231A6CF6FFFFFFFFFFFFFFFFFFF66C1A23
              232363F6FFFFFFFFFF00FFFFFFFFFFF663232323226CF6FFFFFFFFFFFFFFFFFF
              F66C1A2323236BF6FFFFFFFFFF00FFF6F6F6F6F66B23232322ACF6F6F6F6FFFF
              FFF6F6F6F6AC222323236BF6F6F6F6F6FF00F66C6464646C6263636363236D64
              6464ACFFAC6464646D2363636363636D6464646CF600F61A2323236363636363
              6363232B2B231AF61A2323232B636363636363632B2B2B1AF600F6626B6B6B6B
              6B6B6B6B6B6B6B6B6B6B22F6226B6B6B6B6B6B6B6B6B6B6B6B6B6B62F600F66A
              6C6C6C6C6C6B6C6C6C6C6C6C6C6B63F66A6B6C6C6C6C6B6C6C6C6C6C6C6C6C63
              F600F6236C6C6C6C6C6C6C6C6C6C6C6C6C6C23F6236C6C6C6C6C6C6C6C6C6C6C
              6C6C6C2BF600F66C6C6D6CB46C6C6C6C6C6CB46D6D6C6BFF6C6C6D6DB46C6C6C
              6C6C6CB46C6D6C6BF600FFF6F6F6F6086C6C6C6C6CADF6F6F6F6F6FFF6F6F6F6
              F6AD6C6C6C6C6C08F6F6F6F6FF00FFFFFFFFFFF66C7474746C6DF6FFFFFFFFFF
              FFFFFFFFF6AD747474746CF6FFFFFFFFFF00FFFFFFFFFFF66C757475756CF6FF
              FFFFFFFFFFFFFFFFF66C757474756CF6FFFFFFFFFF00FFFFFFFFFFF674B57575
              7574F6FFFFFFFFFFFFFFFFFFF674B575757574F6FFFFFFFFFF00FFFFFFFFFFF6
              6C74747474B4F6FFFFFFFFFFFFFFFFFFF6AC747474746CF6FFFFFFFFFF00FFFF
              FFFFFFFF08080808BE08FFFFFFFFFFFFFFFFFFFFFF08BE08080808FFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            Spacing = 1
            Transparent = False
            OnClick = spbNuevaPersonaClick
          end
          object spbGuardarRegistro: TSpeedButton
            Left = 4
            Top = 3
            Width = 95
            Height = 40
            Anchors = []
            Caption = '&Guardar Registro'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFCECF
              C36465AA5556A452539F4F509A4D4D944A4A8F4747894444834141783B3C783B
              3C7239396E3637FF00FFFF00FFEFCECFC36465AA5556A452539F4F509A4D4D94
              4A4A8F4747894444834141783B3C783B3C7239396E3637FF00FFFF00FFCF6B6C
              F38E8FE68081AA4424473221C3B4ABC6BBB3CAC1BCCEC8C4564D489E3E339C3D
              36983931723939FF00FFFF00FFCF6B6CF38E8FE68081AA4424473221C3B4ABC6
              BBB3CAC1BCCEC8C4564D489E3E339C3D36983931723939FF00FFFF00FFD16F70
              FF999AEC8687E68081715B4B473C348D7868EDE0D8F1E7E08F7F73A34135A242
              3C9C3D35783B3CFF00FFFF00FFD16F70FF999AEC8687E68081715B4B473C348D
              7868EDE0D8F1E7E08F7F73A34135A2423C9C3D35783B3CFF00FFFF00FFD47576
              FF9FA0F59091EC8687715B4B000000473C34E9D9CEECDDD4857467AE4B43AA49
              44A3423C7D3E3EFF00FFFF00FFD47576FF9FA0F59091EC8687715B4B00000047
              3C34E9D9CEECDDD4857467AE4B43AA4944A3423C7D3E3EFF00FFFF00FFD77B7C
              FFA9AAFB9FA0F59394715B4B715B4B715B4B715B4B7662527D6A5BBA5654B24F
              4CAA4944834141FF00FFFF00FFD77B7CFFA9AAFB9FA0F59394715B4B715B4B71
              5B4B715B4B7662527D6A5BBA5654B24F4CAA4944834141FF00FFFF00FFDB8384
              FFB3B4FFADAEFCA3A4F48E8FEC8687E68081DF797AD77172D16B6CC15D5CBA56
              54B2504C894444FF00FFFF00FFDB8384FFB3B4FFADAEFCA3A4F48E8FEC8687E6
              8081DF797AD77172D16B6CC15D5CBA5654B2504C894444FF00FFFF00FFDF8A8B
              FFBBBCFFB6B7C96360C45E56BE584BB8523FB34D34AD4728A7411CA13B11C15D
              5CBA56548F4747FF00FFFF00FFDF8A8BFFBBBCFFB6B7C96360C45E56BE584BB8
              523FB34D34AD4728A7411CA13B11C15D5CBA56548F4747FF00FFFF00FFE29192
              FFBDBECC6667FFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6E1CABDA13B
              11C25D5C944A4AFF00FFFF00FFE29192FFBDBECC6667FFFFFFFFFFFFFBF8F6F6
              EEEAF0E5DEEADBD2E5D1C6E1CABDA13B11C25D5C944A4AFF00FFFF00FFE59798
              FFBDBED36D6EFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2E5D1C6A741
              1CCC67679A4D4DFF00FFFF00FFE59798FFBDBED36D6EFFFFFFFFFFFFFFFFFFFB
              F8F6F6EEEAF0E5DEEADBD2E5D1C6A7411CCC67679A4D4DFF00FFFF00FFE99E9F
              FFBDBEDC7677FFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEEADBD2AD47
              28D771729F4F50FF00FFFF00FFE99E9FFFBDBEDC7677FFFFFFFFFFFFFFFFFFFF
              FFFFFBF8F6F6EEEAF0E5DEEADBD2AD4728D771729F4F50FF00FFFF00FFEDA6A7
              FFBDBEE68081FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D
              34DF797AA45253FF00FFFF00FFEDA6A7FFBDBEE68081FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFBF8F6F6EEEAF0E5DEB34D34DF797AA45253FF00FFFF00FFF0ACAD
              FFBDBEEF898AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6F6EEEAB852
              3F673333AA5556FF00FFFF00FFF0ACADFFBDBEEF898AFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFBF8F6F6EEEAB8523F673333AA5556FF00FFFF00FFF3B2B3
              FFBDBEF89293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F6BE58
              4BB05859B05859FF00FFFF00FFF3B2B3FFBDBEF89293FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFBF8F6BE584BB05859B05859FF00FFFF00FFF5B6B7
              F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E79A9BE49394E08E8FDD8788DA8081D67A
              7BD37475D16F70FF00FFFF00FFF5B6B7F5B6B7F3B2B3F1ADAEEEA7A8EAA1A2E7
              9A9BE49394E08E8FDD8788DA8081D67A7BD37475D16F70FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            Spacing = 1
            Transparent = False
            OnClick = spbGuardarRegistroClick
          end
        end
        object GrpDatosPersona: TGroupBox
          Left = 9
          Top = 21
          Width = 1004
          Height = 127
          Enabled = False
          TabOrder = 0
          object LblTipoIdentificacion: TLabel
            Left = 11
            Top = 20
            Width = 143
            Height = 18
            Caption = 'Tipo de Identificaci'#243'n:'
          end
          object LblNUmeroIdentificacion: TLabel
            Left = 495
            Top = 20
            Width = 158
            Height = 18
            Caption = 'N'#250'mero de Documento:'
          end
          object LblPrimerNombre: TLabel
            Left = 11
            Top = 60
            Width = 103
            Height = 18
            Caption = 'Primer Nombre:'
          end
          object LblSegundoNombre: TLabel
            Left = 535
            Top = 60
            Width = 118
            Height = 18
            Caption = 'Segundo Nombre:'
          end
          object LblPrimerApellido: TLabel
            Left = 11
            Top = 97
            Width = 98
            Height = 18
            Caption = 'Primer Apellido:'
          end
          object LblSegundoApellido: TLabel
            Left = 535
            Top = 97
            Width = 113
            Height = 18
            Caption = 'Segundo Apellido:'
          end
          object rlbTipoIdentificacion: TRxDBLookupCombo
            Left = 160
            Top = 16
            Width = 305
            Height = 25
            DropDownCount = 8
            Color = 9882571
            TabOrder = 0
            OnChange = rlbTipoIdentificacionChange
          end
          object EdtNumeroDocumento: TEdit
            Left = 660
            Top = 15
            Width = 163
            Height = 26
            Color = 9882571
            MaxLength = 20
            TabOrder = 1
            OnChange = rlbTipoIdentificacionChange
            OnKeyPress = EdtPrimerNombreKeyPress
          end
          object EdtPrimerNombre: TEdit
            Left = 160
            Top = 57
            Width = 332
            Height = 26
            Color = 9882571
            MaxLength = 40
            TabOrder = 2
            OnChange = EdtPrimerNombreChange
            OnExit = EdtPrimerNombreExit
            OnKeyPress = EdtPrimerNombreKeyPress
          end
          object EdtSegundoNombre: TEdit
            Left = 660
            Top = 57
            Width = 332
            Height = 26
            MaxLength = 40
            TabOrder = 3
            OnChange = EdtSegundoNombreChange
            OnExit = EdtSegundoNombreExit
            OnKeyPress = EdtSegundoNombreKeyPress
          end
          object EdtPrimerApellido: TEdit
            Left = 160
            Top = 94
            Width = 332
            Height = 26
            Color = 9882571
            MaxLength = 40
            TabOrder = 4
            OnChange = EdtPrimerApellidoChange
            OnExit = EdtPrimerApellidoExit
            OnKeyPress = EdtPrimerApellidoKeyPress
          end
          object EdtSegundoApellido: TEdit
            Left = 660
            Top = 94
            Width = 332
            Height = 26
            MaxLength = 40
            TabOrder = 5
            OnChange = EdtSegundoApellidoChange
            OnExit = EdtSegundoApellidoExit
            OnKeyPress = EdtSegundoApellidoKeyPress
          end
          object GrpOpcionesBusqueda: TGroupBox
            Left = 844
            Top = 4
            Width = 149
            Height = 49
            TabOrder = 6
            DesignSize = (
              149
              49)
            object spbBuscarMti: TSpeedButton
              Left = 75
              Top = 3
              Width = 71
              Height = 44
              Anchors = []
              Caption = 'Buscar &MTI'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                96090000424D9609000000000000360000002800000028000000140000000100
                1800000000006009000000000000000000000000000000000000FFFFFFBBECD2
                7CDEAA8CE1B48BE2B58AE2B48AE0B38BE1B488E0B194E3B9D2F3E288E1B18AE0
                B38BE2B48AE0B28BE0B28CE2B48AE1B47FDEABB9EDD1FFFFFFBBECD27CDEAA8C
                E1B48BE2B58AE2B48AE0B38BE1B488E0B194E3B9D2F3E288E1B18AE0B38BE2B4
                8AE0B28BE0B28CE2B48AE1B47FDEABB9EDD1FFFFFF7DDCA904C15C20C8701EC6
                6E1CC76C1CC66C1EC76F19C56A31CB7AA5E6C41DC86D1FC56F1FC76D1DC56B1A
                C56B1FC76D20C77009C36078DCA7FFFFFF7DDCA904C15C20C8701EC66E1CC76C
                1CC66C1EC76F19C56A31CB7AA5E6C41DC86D1FC56F1FC76D1DC56B1AC56B1FC7
                6D20C77009C36078DCA7FFFFFF8CE1B321C76E3ACE8134CC7B81DEAD5CD59533
                CD7C34CC7B49D089B2E8CD36CD7D39CC802CCA7762D69997E4BC21C7703CCE81
                25C97188E0B2FFFFFF8CE1B321C76E3ACE8134CC7B81DEAD5CD59533CD7C34CC
                7B49D089B2E8CD36CD7D39CC802CCA7762D69997E4BC21C7703CCE8125C97188
                E0B2FFFFFF8BE0B31EC66D39CE802ECB77B7EBCF76DCA62DCB7833CC7B47D087
                B1E8CC34CC7B37CD7F22C97083DFAFE6F7EE0BC2623CCE8122C97086E0B1FFFF
                FF8BE0B31EC66D39CE802ECB77B7EBCF76DCA62DCB7833CC7B47D087B1E8CC34
                CC7B37CD7F22C97083DFAFE6F7EE0BC2623CCE8122C97086E0B1FFFFFF8BE0B3
                1EC66D39CD7E2CCB78B0E9CB71DBA42DCB7732CC7B47D087B1E8CC34CC7C38CE
                7F22C9707EDEABDDF6E80CC2623DCF8122C97086E0B1FFFFFF8BE0B31EC66D39
                CD7E2CCB78B0E9CB71DBA42DCB7732CC7B47D087B1E8CC34CC7C38CE7F22C970
                7EDEABDDF6E80CC2623DCF8122C97086E0B1FFFFFF8BE0B31DC66C31CB7A25C9
                72AAE8C86ADA9E25C8702CCA7747D087B1E8CC34CC7C38CE7F22C9707DDEACDC
                F5E80CC2623DCF8122C97086E0B1FFFFFF8BE0B31DC66C31CB7A25C972AAE8C8
                6ADA9E25C8702CCA7747D087B1E8CC34CC7C38CE7F22C9707DDEACDCF5E80CC2
                623DCF8122C97086E0B1FFFFFF89DFB11FC66E6CD99F62D79BCAF0DD99E4BD67
                D99B50D38E41CF84B1E8CC34CC7B37CD7F22C76F85DFB0ECF9F108C1613BCE81
                22C97086E0B1FFFFFF89DFB11FC66E6CD99F62D79BCAF0DD99E4BD67D99B50D3
                8E41CF84B1E8CC34CC7B37CD7F22C76F85DFB0ECF9F108C1613BCE8122C97086
                E0B1FFFFFF88DFB024C772B4EBCDB1EACCB7ECCFB2EBCDBBEED37BDDAA3DCE81
                B2E8CD35CD7D39CC7F2BC97569D89FAAE8C71CC76C3BCD8124C97188E0B1FFFF
                FF88DFB024C772B4EBCDB1EACCB7ECCFB2EBCDBBEED37BDDAA3DCE81B2E8CD35
                CD7D39CC7F2BC97569D89FAAE8C71CC76C3BCD8124C97188E0B1FFFFFF80DDAC
                08C25F25C97220C76E1DC66D1FC76D22C8701CC76D35CC7DA8E7C724CA7227C7
                7226CA7322C87121C76F27CA7327C87310C4647DDDA9FFFFFF80DDAC08C25F25
                C97220C76E1DC66D1FC76D22C8701CC76D35CC7DA8E7C724CA7227C77226CA73
                22C87121C76F27CA7327C87310C4647DDDA9FFFFFFACE9C860D59770D9A26FD9
                A16FD9A16ED9A16ED9A16BD99E7DDDABC1EDD553D49056D29055D39155D29054
                D28F55D39156D29145CF8598E3BCFFFFFFACE9C860D59770D9A26FD9A16FD9A1
                6ED9A16ED9A16BD99E7DDDABC1EDD553D49056D29055D39155D29054D28F55D3
                9156D29145CF8598E3BCFFFEFFD0F2E1A3E7C2B1EBCCB0EBCCB0EBCCB0EACCB1
                EBCCACEACAADEAC9EFFAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFEFFD0F2E1A3E7C2B1EBCCB0EBCCB0EBCCB0EACCB1EBCCACEA
                CAADEAC9EFFAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF79DCA900BE5517C46919C56B1AC66A19C46B18C66B0EC36219C56A
                C5F0D9FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFF
                FF79DCA900BE5517C46919C56B1AC66A19C46B18C66B0EC36219C56AC5F0D9FF
                FFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFF88DFB1
                77DDA649D08936CC7C2BCA7633CB7A29CA748DE1B45DD696C2EFD7FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88DFB177DDA649
                D08936CC7C2BCA7633CB7A29CA748DE1B45DD696C2EFD7FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84DEAFC2EFD753D49120C6
                6E73DAA450D28C11C465DBF5E77BDEABB9EDD1FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84DEAFC2EFD753D49120C66E73DAA4
                50D28C11C465DBF5E77BDEABB9EDD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF83DDAEBBEDD23ED08248D088FFFFFFD0F2E000
                BE58D3F2E377DCA7BAECD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF83DDAEBBEDD23ED08248D088FFFFFFD0F2E000BE58D3F2
                E377DCA7BAECD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF83DDAEB9EDD239CC7EFFFEFF42CF86B1EBCC75DBA4B4EDCD79DCA9
                BAECD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF83DDAEB9EDD239CC7EFFFEFF42CF86B1EBCC75DBA4B4EDCD79DCA9BAECD1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84DEAE
                AEEACAFBFCFD7ADCA914C4671DC56CDCF4E8F2FAF573DBA4B9EDD1FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84DEAEAEEACAFB
                FCFD7ADCA914C4671DC56CDCF4E8F2FAF573DBA4B9EDD1FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89E0B17CDDA9B9EDD318C5
                6A3CCE7F29CA734ED28DBEEED45ED696C0EFD7FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89E0B17CDDA9B9EDD318C56A3CCE7F
                29CA734ED28DBEEED45ED696C0EFD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF7FDDAB09C15F1AC66C1FC76F23C87124C87218
                C56B1CC66D24C870C7F0DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF7FDDAB09C15F1AC66C1FC76F23C87124C87218C56B1CC6
                6D24C870C7F0DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFB4EACF6EDAA07FDFAC80DFAD80DFAC80DFAC80DFAD7ADEA77FDFAB
                E0F5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFB4EACF6EDAA07FDFAC80DFAD80DFAC80DFAC80DFAD7ADEA77FDFABE0F5E9FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentFont = False
              Spacing = 1
              Transparent = False
              OnClick = spbBuscarMtiClick
            end
            object spbBuscarAndes: TSpeedButton
              Left = 4
              Top = 3
              Width = 71
              Height = 44
              Anchors = []
              Caption = 'Buscar &Andes'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                4E070000424D4E07000000000000360400002800000024000000160000000100
                08000000000018030000C40E0000C40E00000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                08BFBFADA407FFFFFFFFFFFFFFFFFFFFFFFF08BFBFADED07FFFFFFFFFFFFFFFF
                F6BF7FFBFBFBFB003F3F130AEDF6FFFFFFFFF6083FFBFBFBFB00FB2D125207FF
                FFFFFF075BFBFBFBFBFBFB1B37FBFBFB1240EEFFFF071BFBFBFBFBFBFB13FBFB
                FB3F124907FF080025FBFBFBFBFBFBFB0AFBFBFBFB2500AC070036FBFBFBFBFB
                FBFB12FBFBFBFB1B00075B4037FBFBFBFBFBFBFB5B03FBFBFBFB495249407FFB
                FBFBFBFBFBFB4936FBFBFB3F40525B4077FBFBFBFBFBFBFB1203FBFBFBFB4952
                52407FFBFBFBFBFBFBFB402DFBFBFB3F40525B4076FBFBFB3FFBFBFB1264FBFB
                FBFB495252407FFBFBFB3FFBFBFB406DFBFBFB3F40525B4076FBFBFB3F3FFBFB
                0A1CFBFBFBFB495152407FFBFBFB36FBFBFB406DFBFBFB3F40525B4076FBFBFB
                3F76FBFB491CFBFBFBFB495252407FFBFBFB763FFBFB4065FBFBFB3F40525B40
                76FBFBFBFB2DFBFB4103FBFBFBFB495252407FFBFBFB7636FBFB406DFBFBFB3F
                40525B4076FBFBFBFB03FBFB402DFBFBFBFB495252407FFBFBFB3F65FBFB4037
                FBFBFB3F40525B4076FBFBFBFB1BFBFB4136FBFBFBFB495252407FFBFBFBFB1B
                FBFB00FBFBFBFB3F40525B4076FBFBFBFB52FB7F00FBFBFBFBFB495252407FFB
                FBFBFB13FB3700FBFBFBFB3F40525B4076FBFBFBFB12FB3600FBFBFBFBFB4952
                52407FFBFBFBFB11FB2513FBFBFBFB3F40525B4076FBFBFBFB0AFB6413FBFBFB
                FBFB495252407FFBFBFBFB0AFB1B1CFBFBFBFB3F40525B4076FBFBFBFB1BFB0A
                6CFBFBFBFBFB495252407FFBFBFBFB13FB0A75FBFBFBFB3F40525B4076FBFBFB
                FB037E0A3FFBFBFBFBFB495252407FFBFBFBFB137F00FBFBFBFBFB3F40525B40
                76FBFBFBFB365C0AFBFBFBFBFBFB4A5252407FFBFBFBFB1C6C0AFBFBFBFBFB3F
                40525B407FFBFBFBFBFB0053FBFBFBFBFBFB495252497FFBFBFBFB3F0065FBFB
                FBFBFB3F40525B48253FFBFBFBFB0A3FFBFBFBFBFB2E4951494925FBFBFBFBFB
                00FBFBFBFBFB3F2549529B000000000A0336767F2E03130A0000405252000000
                0A132537767F2D030A000000409BFFFFFFF6EDF7A49B93939BA4F7EDF6FFFFFF
                FFFFF608EEA4A49B93939BA4EDEDF6FFFFFF}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentFont = False
              Spacing = 1
              Transparent = False
              OnClick = spbBuscarAndesClick
            end
          end
        end
        object redObservacionRegistro: TRxRichEdit
          Left = 1029
          Top = 66
          Width = 291
          Height = 81
          DrawEndPage = False
          AutoURLDetect = False
          AutoVerbMenu = False
          Anchors = [akLeft, akTop, akBottom]
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 300
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 2
          WantReturns = False
          WordSelection = False
          OnChange = redObservacionRegistroChange
          OnKeyDown = redObservacionRegistroKeyDown
        end
        object chkObservacionRegistro: TCheckBox
          Left = 1084
          Top = 21
          Width = 186
          Height = 20
          Caption = 'Registro con Novedad'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = chkObservacionRegistroClick
        end
      end
    end
    object RpnBusqueda: TRxPanel
      Left = 1448
      Top = 0
      Width = 468
      Height = 218
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      TileImage = False
      object GrpBusquedaPersonas: TGroupBox
        Left = 0
        Top = 9
        Width = 467
        Height = 209
        Enabled = False
        TabOrder = 0
        DesignSize = (
          467
          209)
        object LblPersonas: TLabel
          Left = 64
          Top = 11
          Width = 341
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taCenter
          Anchors = []
          AutoSize = False
          Caption = 'BASE DE DATOS PERSONAS'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          ExplicitLeft = 40
          ExplicitTop = 12
        end
        object dbgPersonas: TDBGrid
          Left = 7
          Top = 32
          Width = 452
          Height = 171
          Color = clNone
          FixedColor = clInactiveCaption
          GradientEndColor = clTeal
          GradientStartColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDblClick = dbgPersonasDblClick
          Columns = <
            item
              ButtonStyle = cbsNone
              Color = 13355926
              Expanded = False
              FieldName = 'nombres'
              Title.Caption = 'NOMBRES'
              Title.Color = clRed
              Width = 100
              Visible = True
            end
            item
              Color = 14671805
              Expanded = False
              FieldName = 'apellidos'
              Title.Caption = 'APELLIDOS'
              Width = 100
              Visible = True
            end
            item
              Color = 13355926
              Expanded = False
              FieldName = 'numerodocumento'
              Title.Caption = 'NRO. DOCUM.'
              Width = 80
              Visible = True
            end
            item
              Color = 14671805
              Expanded = False
              FieldName = 'descripciontipoidentificacion'
              Title.Caption = 'TIPO DOCUMENTO'
              Width = 120
              Visible = True
            end>
        end
      end
      object RpnBuscando: TRxPanel
        Left = 141
        Top = 120
        Width = 185
        Height = 41
        BevelOuter = bvNone
        Caption = 'Buscando ......'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        Visible = False
        Gradient.Direction = fdRightToLeft
        Gradient.EndColor = clBlack
        Gradient.StartColor = clBlue
        Gradient.Visible = True
        TileImage = False
      end
    end
  end
  object tmrTiempoFolio: TTimer
    Enabled = False
    OnTimer = tmrTiempoFolioTimer
    Left = 1528
    Top = 320
  end
end
