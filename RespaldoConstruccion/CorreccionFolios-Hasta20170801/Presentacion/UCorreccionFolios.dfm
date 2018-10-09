object FCorrecionFolios: TFCorrecionFolios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Correcci'#243'n Folios 27/05/2016'
  ClientHeight = 300
  ClientWidth = 635
  Color = 16116188
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 42
    Top = 55
    Width = 27
    Height = 13
    Caption = 'Folios'
  end
  object pnl1: TPanel
    Left = 133
    Top = 0
    Width = 502
    Height = 300
    Align = alRight
    TabOrder = 0
    object DBGCarpetaFolios: TDBGrid
      Left = 1
      Top = 1
      Width = 500
      Height = 248
      Align = alTop
      Color = 12582911
      DataSource = DMCorrecionFolios.dsCarpeta
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGCarpetaFoliosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idCarpetaAleta'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DescripcionSubSerieDocumental'
          Title.Alignment = taCenter
          Width = 375
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CantidadFolios'
          Title.Alignment = taCenter
          Width = 75
          Visible = True
        end>
    end
    object btnGuardarCarpeta: TButton
      Left = 350
      Top = 261
      Width = 108
      Height = 25
      Caption = 'Guardar Carpeta'
      Enabled = False
      TabOrder = 1
      OnClick = btnGuardarCarpetaClick
    end
    object btnCancelar: TButton
      Left = 62
      Top = 261
      Width = 131
      Height = 25
      Caption = 'Cancelar/Otra Carpeta'
      Enabled = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object EdtFolios: TEdit
    Left = 71
    Top = 50
    Width = 49
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 2
    OnExit = EdtFoliosExit
    OnKeyPress = EdtFoliosKeyPress
  end
  object PnlCodigoCarpeta: TPanel
    Left = 8
    Top = 152
    Width = 120
    Height = 55
    BevelOuter = bvNone
    TabOrder = 1
    object Lbllbl1: TLabel
      Left = 6
      Top = 6
      Width = 75
      Height = 13
      Caption = 'Codigo Carpeta'
    end
    object EdtCodigoCarpeta: TEdit
      Left = 3
      Top = 22
      Width = 112
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EdtCodigoCarpetaChange
      OnKeyPress = EdtCodigoCarpetaKeyPress
    end
  end
end
