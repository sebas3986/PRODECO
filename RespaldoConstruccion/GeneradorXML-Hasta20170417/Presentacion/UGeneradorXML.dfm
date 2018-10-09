object frm_GeneradorXML: Tfrm_GeneradorXML
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Generaci'#243'n de XML'
  ClientHeight = 678
  ClientWidth = 1514
  Color = 15919327
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1514
    Height = 659
    Align = alClient
    Color = 15919327
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object grp1: TGroupBox
      Left = 1
      Top = 46
      Width = 1512
      Height = 612
      Align = alBottom
      Caption = '  XML '
      TabOrder = 0
      object lblPorcentaje: TLabel
        Left = 1121
        Top = 31
        Width = 12
        Height = 16
        Caption = '%'
        Visible = False
      end
      object pbGeneradorXML: TProgressBar
        Left = 380
        Top = 22
        Width = 734
        Height = 31
        TabOrder = 0
        Visible = False
      end
      object grp2: TGroupBox
        Left = 2
        Top = 564
        Width = 1508
        Height = 46
        Align = alBottom
        TabOrder = 1
        object btnReporte: TButton
          Left = 641
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Reporte'
          TabOrder = 0
        end
        object btnIniciar: TButton
          Left = 786
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Iniciar'
          TabOrder = 1
          OnClick = btnIniciarClick
        end
      end
      object grp3: TGroupBox
        Left = 2
        Top = 64
        Width = 1508
        Height = 500
        Align = alBottom
        TabOrder = 2
        object spl1: TSplitter
          Left = 502
          Top = 18
          Height = 480
          ExplicitLeft = 929
          ExplicitTop = 243
          ExplicitHeight = 100
        end
        object spl2: TSplitter
          Left = 1005
          Top = 18
          Height = 480
          ExplicitLeft = 1079
          ExplicitTop = 183
          ExplicitHeight = 100
        end
        object grpCarpetas: TGroupBox
          Left = 2
          Top = 18
          Width = 500
          Height = 480
          Align = alLeft
          Caption = ' CARPETAS '
          TabOrder = 0
          object MeCarpetas: TMemo
            Left = 2
            Top = 18
            Width = 496
            Height = 460
            Align = alClient
            ReadOnly = True
            TabOrder = 0
          end
        end
        object grpFoliosPendientes: TGroupBox
          Left = 505
          Top = 18
          Width = 500
          Height = 480
          Align = alLeft
          Caption = ' FOLIOS PENDIENTES '
          TabOrder = 1
          object MePendientes: TMemo
            Left = 2
            Top = 18
            Width = 496
            Height = 460
            Align = alClient
            ReadOnly = True
            TabOrder = 0
          end
        end
        object grpBusqueda: TGroupBox
          Left = 1104
          Top = 150
          Width = 325
          Height = 209
          Caption = ' B'#250'squeda '
          TabOrder = 2
          object lblCriterio: TLabel
            Left = 30
            Top = 32
            Width = 42
            Height = 16
            Caption = 'Criterio'
          end
          object lblCodigo: TLabel
            Left = 75
            Top = 97
            Width = 39
            Height = 16
            Caption = 'C'#243'digo'
          end
          object cbbCriterio: TComboBox
            Left = 94
            Top = 29
            Width = 118
            Height = 24
            TabOrder = 0
            Items.Strings = (
              'Caja'
              'Carpeta'
              'Folio')
          end
          object edCodigo: TEdit
            Left = 71
            Top = 115
            Width = 180
            Height = 24
            TabOrder = 1
          end
        end
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1512
      Height = 45
      Align = alClient
      Caption = ' Generaci'#243'n de XML'
      Color = 15919327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object stbInformacion: TStatusBar
    Left = 0
    Top = 659
    Width = 1514
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
  object xmlHistoriaLaboral: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 201
    Top = 186
    DOMVendorDesc = 'MSXML'
  end
  object xmlPlanillasNomina: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 203
    Top = 245
    DOMVendorDesc = 'MSXML'
  end
  object xmlSeguridadSocial: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 204
    Top = 306
    DOMVendorDesc = 'MSXML'
  end
  object tmrProgress: TTimer
    Interval = 1
    OnTimer = tmrProgressTimer
    Left = 312
    Top = 186
  end
end
