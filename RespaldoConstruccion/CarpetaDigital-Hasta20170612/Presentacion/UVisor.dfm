object FrmVisor: TFrmVisor
  Left = 0
  Top = 0
  Caption = 'Visor de Im'#225'genes'
  ClientHeight = 654
  ClientWidth = 1202
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RpnVisor: TRxPanel
    Left = 0
    Top = 0
    Width = 1202
    Height = 654
    Align = alClient
    Alignment = taLeftJustify
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 12885363
    Gradient.StartColor = 16315117
    Gradient.Visible = True
    TileImage = False
    object RpnVisorFolio: TRxPanel
      Left = 401
      Top = 96
      Width = 797
      Height = 554
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      TileImage = False
      DesignSize = (
        797
        554)
      object LblDivisor: TLabel
        Left = 0
        Top = 431
        Width = 797
        Height = 16
        Align = alBottom
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Archivo XML :[]'
        Color = 10907648
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
        ExplicitWidth = 102
      end
      object apdVisorPDF: TAcroPDF
        Left = 0
        Top = 57
        Width = 797
        Height = 366
        Align = alClient
        TabOrder = 0
        ExplicitTop = 429
        ExplicitHeight = 372
        ControlData = {000A00005F520000D4250000}
      end
      object imsVisorTif: TImageScrollBox
        Left = 0
        Top = 57
        Width = 797
        Height = 366
        HorzScrollBar.Tracking = True
        HorzScrollBar.Visible = False
        VertScrollBar.Tracking = True
        VertScrollBar.Visible = False
        ZoomPercent = 100.000000000000000000
        MouseHandlerOwnership = True
        Align = alClient
        TabOrder = 2
        Visible = False
      end
      object rspDivisor: TRxSplitter
        Left = 0
        Top = 423
        Width = 797
        Height = 8
        ControlFirst = imsVisorTif
        ControlSecond = redVisorXml
        Align = alBottom
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 8410624
        TopLeftLimit = 30
        BottomRightLimit = 200
        Visible = False
        OnPosChanged = rspDivisorPosChanged
      end
      object RpnMensajeImagen: TRxPanel
        Left = 251
        Top = 219
        Width = 297
        Height = 138
        Anchors = [akLeft, akRight]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 6
        BorderStyle = bsSingle
        Color = 1514433
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        Visible = False
        Gradient.Direction = fdRightToLeft
        Gradient.EndColor = clBlack
        Gradient.StartColor = clMoneyGreen
        Gradient.StepCount = 63
        TileImage = False
        object rxlMensajeImagen: TRxLabel
          Left = 6
          Top = 6
          Width = 281
          Height = 122
          Align = alClient
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          ShadowColor = clNone
          WordWrap = True
          ExplicitWidth = 6
          ExplicitHeight = 15
        end
      end
      object RpnEncabezadoVisorTIF: TRxPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        TileImage = False
        object LblZoomPredefinido: TLabel
          Left = 12
          Top = 8
          Width = 145
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
          Left = 186
          Top = 6
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
        object spbLupa: TSpeedButton
          Left = 288
          Top = 8
          Width = 105
          Height = 43
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
        object cbxZoomPredefinido: TComboBox
          Left = 12
          Top = 28
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'Ajustar al Ancho'
          OnSelect = cbxZoomPredefinidoSelect
          Items.Strings = (
            'Tama'#241'o Original'
            'P'#225'gina Completa'
            'Ajustar al Ancho'
            'Ajustar al Alto'
            'Ajustar a la P'#225'gina')
        end
        object rseZoom: TRxSpinEdit
          Left = 186
          Top = 28
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
          TabOrder = 1
          OnChange = rseZoomChange
        end
        object chkVisuzalizarXml: TCheckBox
          Left = 664
          Top = 22
          Width = 121
          Height = 17
          Caption = 'Visualizar &Xml'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = chkVisuzalizarXmlClick
        end
      end
      object redVisorXml: TRxRichEdit
        Left = 0
        Top = 447
        Width = 797
        Height = 107
        DrawEndPage = False
        Align = alBottom
        Color = 13884610
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        Title = 'xml'
        LangOptions = [rlAutoKeyboard, rlAutoFont]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
        WordWrap = False
      end
      object RpnMensajeXml: TRxPanel
        Left = 251
        Top = 456
        Width = 297
        Height = 91
        Anchors = [akLeft, akRight]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 6
        BorderStyle = bsSingle
        Color = 1514433
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        Visible = False
        Gradient.Direction = fdRightToLeft
        Gradient.EndColor = clBlack
        Gradient.StartColor = clMoneyGreen
        Gradient.StepCount = 63
        TileImage = False
        object rxlMensajeXml: TRxLabel
          Left = 6
          Top = 6
          Width = 281
          Height = 75
          Align = alClient
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          ShadowColor = clNone
          WordWrap = True
          ExplicitLeft = 14
          ExplicitTop = 41
          ExplicitHeight = 70
        end
      end
    end
    object RpnInformacionImagen: TRxPanel
      Left = 0
      Top = 96
      Width = 401
      Height = 554
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      Gradient.Direction = fdTopToBottom
      Gradient.EndColor = 12885363
      Gradient.StartColor = 15192512
      Gradient.Visible = True
      TileImage = False
      object GrpInformacionImagen: TGroupBox
        Left = 0
        Top = 0
        Width = 401
        Height = 554
        Align = alLeft
        Caption = 'Selecci'#243'n de Im'#225'genes'
        Color = clWhite
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          401
          554)
        object TrvSeleccionImagen: TTreeView
          Left = 9
          Top = 33
          Width = 382
          Height = 516
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoExpand = True
          Color = 50319311
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          HideSelection = False
          Indent = 19
          ParentFont = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          OnChange = TrvSeleccionImagenChange
        end
        object RpnMensajeArbol: TRxPanel
          Left = 15
          Top = 193
          Width = 367
          Height = 165
          Anchors = []
          BevelInner = bvRaised
          BevelOuter = bvNone
          BevelWidth = 6
          BorderStyle = bsSingle
          Color = 5382781
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          Visible = False
          Gradient.Direction = fdRightToLeft
          Gradient.EndColor = clBlack
          Gradient.StartColor = clMoneyGreen
          Gradient.StepCount = 63
          TileImage = False
          object rxlMensajeArbol: TRxLabel
            Left = 6
            Top = 6
            Width = 351
            Height = 149
            Align = alClient
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Arial Rounded MT Bold'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentFont = False
            ShadowColor = clNone
            WordWrap = True
            ExplicitLeft = 78
            ExplicitTop = 54
          end
        end
      end
    end
    object RpnTitulo: TRxPanel
      Left = 0
      Top = 0
      Width = 1198
      Height = 96
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      Gradient.Direction = fdTopToBottom
      Gradient.EndColor = 12885363
      Gradient.StartColor = 15192512
      Gradient.Visible = True
      TileImage = False
      object LblImagen: TLabel
        Left = 890
        Top = 33
        Width = 308
        Height = 63
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Color = 10907648
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 776
        ExplicitWidth = 422
      end
      object LblTitulo: TLabel
        Left = 0
        Top = 0
        Width = 1198
        Height = 33
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Color = 13010432
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        WordWrap = True
      end
      object rgrVisor: TRadioGroup
        Left = 825
        Top = 33
        Width = 65
        Height = 63
        Align = alLeft
        Caption = 'Visor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        Items.Strings = (
          'TIF'
          'PDF')
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = rgrVisorClick
      end
      object RpnBaseEncabezado: TRxPanel
        Left = 0
        Top = 33
        Width = 825
        Height = 63
        Align = alLeft
        BevelOuter = bvNone
        Color = 10907648
        ParentBackground = False
        TabOrder = 1
        TileImage = False
        object LblEncabezado: TLabel
          AlignWithMargins = True
          Left = 15
          Top = 0
          Width = 795
          Height = 63
          Margins.Left = 15
          Margins.Top = 0
          Margins.Right = 15
          Margins.Bottom = 0
          Align = alClient
          AutoSize = False
          Color = 10907648
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitLeft = -609
          ExplicitWidth = 794
          ExplicitHeight = 41
        end
        object btn1: TButton
          Left = 624
          Top = 16
          Width = 75
          Height = 25
          Caption = 'btn1'
          TabOrder = 0
          OnClick = btn1Click
        end
      end
    end
  end
end
