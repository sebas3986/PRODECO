object Frm_Recepcion: TFrm_Recepcion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' '
  ClientHeight = 800
  ClientWidth = 1365
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEncabezado: TPanel
    Left = 0
    Top = 0
    Width = 1365
    Height = 41
    Align = alTop
    Caption = 'RECEPCI'#211'N'
    Color = 15259846
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object stbInformacion: TStatusBar
    Left = 0
    Top = 781
    Width = 1365
    Height = 19
    Panels = <
      item
        Bevel = pbRaised
        Width = 200
      end
      item
        Bevel = pbRaised
        Width = 200
      end
      item
        Bevel = pbRaised
        Width = 150
      end>
  end
  object grp1: TGroupBox
    Left = 0
    Top = 41
    Width = 603
    Height = 740
    Align = alLeft
    Color = 15919327
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 2
    object lbl1: TLabel
      Left = 49
      Top = 23
      Width = 83
      Height = 13
      Caption = 'Serie Documental'
    end
    object rlbSerieDocumental: TRxDBLookupCombo
      Left = 140
      Top = 19
      Width = 285
      Height = 21
      DropDownCount = 8
      LookupField = 'idSerieDocumental'
      LookupDisplay = 'DescripcionSerieDocumental'
      LookupSource = DMRecepcion.dsSerieDocumental
      TabOrder = 0
      OnClick = rlbSerieDocumentalClick
    end
    object grpPrecinto: TGroupBox
      Left = 86
      Top = 143
      Width = 430
      Height = 105
      Caption = ' Precinto '
      Enabled = False
      TabOrder = 1
      object lblPrecinto1: TLabel
        Left = 23
        Top = 29
        Width = 76
        Height = 13
        Caption = 'PRECINTO UNO'
      end
      object lblPrecinto2: TLabel
        Left = 23
        Top = 67
        Width = 75
        Height = 13
        Caption = 'PRECINTO DOS'
      end
      object lblCofirmarPrecinto: TLabel
        Left = 273
        Top = 60
        Width = 121
        Height = 16
        Caption = 'Confirmar Precinto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object edPrecinto1: TEdit
        Left = 104
        Top = 22
        Width = 150
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edPrecinto1Change
        OnKeyPress = edPrecinto1KeyPress
      end
      object edPrecinto2: TEdit
        Left = 104
        Top = 58
        Width = 150
        Height = 25
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = edPrecinto2Change
        OnKeyPress = edPrecinto2KeyPress
      end
      object chkDoblePrecinto: TCheckBox
        Left = 294
        Top = 25
        Width = 90
        Height = 17
        Caption = 'Doble Precinto'
        TabOrder = 2
      end
    end
    object grpDatosCarpeta: TGroupBox
      Left = 86
      Top = 378
      Width = 430
      Height = 342
      Caption = ' Datos Carpeta '
      Color = 15919327
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object rgpGrFoliacion: TRadioGroup
        Left = 35
        Top = 44
        Width = 361
        Height = 58
        Caption = ' Foliaci'#243'n '
        Columns = 2
        Enabled = False
        Items.Strings = (
          'Carpeta Foliada'
          'Carpeta SIN Foliar')
        TabOrder = 0
        OnClick = rgpGrFoliacionClick
      end
      object rgpTipoCarpeta: TRadioGroup
        Left = 156
        Top = 127
        Width = 118
        Height = 105
        Caption = ' Tipo Carpeta '
        Enabled = False
        Items.Strings = (
          '6 Aletas'
          '4 Aletas'
          'SIN Aletas')
        TabOrder = 1
        OnClick = rgpTipoCarpetaClick
      end
      object rgpGrContratoCivil: TRadioGroup
        Left = 35
        Top = 256
        Width = 361
        Height = 51
        Caption = ' Contrato Civil '
        Columns = 2
        Enabled = False
        Items.Strings = (
          'Posee Contrato Civil'
          'SIN Contrato Civil')
        TabOrder = 2
      end
    end
    object grp4: TGroupBox
      Left = 86
      Top = 265
      Width = 430
      Height = 95
      TabOrder = 3
      object lbl3: TLabel
        Left = 47
        Top = 43
        Width = 26
        Height = 13
        Caption = 'CAJA'
      end
      object lbl4: TLabel
        Left = 224
        Top = 43
        Width = 46
        Height = 13
        Caption = 'CARPETA'
      end
      object lbl5: TLabel
        Left = 81
        Top = 24
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object lbl6: TLabel
        Left = 166
        Top = 24
        Width = 32
        Height = 13
        Caption = 'TOTAL'
      end
      object btnCarpeta: TSpeedButton
        Left = 360
        Top = 38
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          BA060000424DBA06000000000000360400002800000019000000170000000100
          0800000000008402000000000000000000000001000000000000000000000000
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFF6F6
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFF6641AB5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF66C1A1A1AB6FFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFF08631A22231A11B6FFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFF6631A232323231A2207F6FFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFF66C222323232323232222B5FFFFFFFFFFFFFFFFFFFF000000FFFF
          F66C2323236363636363236323B6FFFFFFFFFFFFFFFFFF000000FFFF64236363
          63636363636363636323B6FFFFFFFFFFFFFFFF000000FF64236B636363636B6B
          6B636363636B23B5F6FFFFFFFFFFFF0000006C236B6B6B6B6B6C23636C6B6B6B
          6B6B6B2307FFFFFFFFFFFF000000AD236C6C6C6C6C236C08236C6C6C6C6C6C6C
          5A07FFFFFFFFFF000000FFAC236C6C6C236CF6FFF6236C6C6C6C6C6C6C5A07FF
          FFFFFF000000FFFFAC6B7463ACF6FFFFFFF6236C6C6C6C6C6C6C6207FFFFFF00
          0000FFFFFFAC236CF6FFFFFFFFFF0823746C6C6C6C6C6C6307FFFF000000FFFF
          FFF608F6FFFFFFFFFFFFFF0823746C6C6C6C74746307FF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFF086B7474747474746C23F6000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF086B74757474746CB4FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF076C74B5BD2BB4F6FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07
          6C756CB6F6FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086CB4F6
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Visible = False
        OnClick = btnCarpetaClick
      end
      object edCaja: TEdit
        Left = 79
        Top = 40
        Width = 75
        Height = 19
        Color = clInfoBk
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edCarpeta: TEdit
        Left = 275
        Top = 40
        Width = 75
        Height = 19
        Color = clInfoBk
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edTotalCaja: TEdit
        Left = 164
        Top = 40
        Width = 50
        Height = 19
        Alignment = taRightJustify
        Color = clInfoBk
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object btnInsercion: TButton
      Left = 487
      Top = 19
      Width = 67
      Height = 25
      Caption = 'Inserci'#243'n'
      TabOrder = 4
      OnClick = btnInsercionClick
    end
    object grpDatosPersona: TGroupBox
      Left = 86
      Top = 56
      Width = 430
      Height = 73
      Caption = ' Datos Persona '
      TabOrder = 5
      object lblNombresApellidos: TLabel
        Left = 15
        Top = 24
        Width = 96
        Height = 13
        Caption = 'Nombres y Apellidos'
      end
      object lblIdentificacion: TLabel
        Left = 296
        Top = 24
        Width = 64
        Height = 13
        Caption = 'Identificaci'#243'n'
      end
      object edtNombresApellidos: TEdit
        Left = 15
        Top = 41
        Width = 273
        Height = 19
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtIdentificacion: TEdit
        Left = 294
        Top = 41
        Width = 121
        Height = 19
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object grpDerecho: TGroupBox
    Left = 603
    Top = 41
    Width = 762
    Height = 740
    Align = alClient
    Color = 16116188
    Ctl3D = True
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 3
    object lblNumeroAletas: TLabel
      Left = 75
      Top = 363
      Width = 92
      Height = 13
      Caption = 'N'#250'mero de Aletas :'
    end
    object grp3: TGroupBox
      Left = 73
      Top = 65
      Width = 630
      Height = 257
      Caption = ' Tipolog'#237'as '
      TabOrder = 0
      object DBGCarpeta: TDBGrid
        Left = 2
        Top = 15
        Width = 626
        Height = 240
        Align = alClient
        Ctl3D = True
        DataSource = DMRecepcion.dsSubSerie
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGCarpetaKeyDown
        OnKeyPress = DBGCarpetaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DescripcionSubSerieDocumental'
            Title.Alignment = taCenter
            Title.Caption = 'SubSerie Documental'
            Width = 500
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cantidad'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idSerieSubSerie'
            Visible = False
          end>
      end
    end
    object grpRadicadas: TGroupBox
      Left = 2
      Top = 414
      Width = 758
      Height = 324
      Align = alBottom
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object grpCarpetasRadicadas: TGroupBox
        Left = 89
        Top = 34
        Width = 632
        Height = 195
        Caption = ' Carpetas Radicadas '
        TabOrder = 0
        object DBGCarpetasRadicadas: TDBGrid
          Left = 2
          Top = 15
          Width = 628
          Height = 178
          Align = alClient
          Ctl3D = True
          DataSource = DMRecepcion.dsCarpetasRadicadas
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CodigoCaja'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodigoCarpeta'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ObraCivil'
              Title.Alignment = taCenter
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalFolios'
              Title.Alignment = taCenter
              Width = 75
              Visible = True
            end>
        end
      end
      object btnCerrarCaja: TButton
        Left = 377
        Top = 263
        Width = 75
        Height = 25
        Caption = 'Cerrar Caja'
        Enabled = False
        TabOrder = 1
        OnClick = btnCerrarCajaClick
      end
      object btnReimpresion: TButton
        Left = 613
        Top = 264
        Width = 105
        Height = 25
        Caption = 'Reimpresion Acta'
        TabOrder = 2
        OnClick = btnReimpresionClick
      end
    end
    object btnGuardarCarpeta: TButton
      Left = 341
      Top = 358
      Width = 95
      Height = 25
      Caption = 'Guardar Carpeta'
      Enabled = False
      TabOrder = 2
      OnClick = btnGuardarCarpetaClick
    end
  end
end