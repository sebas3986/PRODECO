object frmBusquedaCarpeta: TfrmBusquedaCarpeta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Buscar Carpeta'
  ClientHeight = 408
  ClientWidth = 709
  Color = 15919327
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 129
    Align = alTop
    TabOrder = 0
    object lblIdentificacion: TLabel
      Left = 346
      Top = 35
      Width = 64
      Height = 13
      Caption = 'Identificaci'#243'n'
    end
    object lblNombresApellidos: TLabel
      Left = 13
      Top = 73
      Width = 96
      Height = 13
      Caption = 'Nombres y Apellidos'
    end
    object lblIdentificacionL: TLabel
      Left = 357
      Top = 73
      Width = 64
      Height = 13
      Caption = 'Identificaci'#243'n'
    end
    object lblTipoIdentificacion: TLabel
      Left = 524
      Top = 73
      Width = 87
      Height = 13
      Caption = 'Tipo Identificaci'#243'n'
    end
    object dbedtNombresApellidos: TDBEdit
      Left = 10
      Top = 88
      Width = 325
      Height = 19
      Color = clInfoBk
      Ctl3D = False
      DataField = 'NonmbresApellidos'
      DataSource = DMRecepcion.dsBuscarCarpeta
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtIdentificacion: TDBEdit
      Left = 353
      Top = 88
      Width = 150
      Height = 19
      Color = clInfoBk
      Ctl3D = False
      DataField = 'NumeroDocumento'
      DataSource = DMRecepcion.dsBuscarCarpeta
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbedtTipoId: TDBEdit
      Left = 522
      Top = 88
      Width = 175
      Height = 19
      Color = clInfoBk
      Ctl3D = False
      DataField = 'DescripcionTipoIdentificacion'
      DataSource = DMRecepcion.dsBuscarCarpeta
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtIdentificacion: TEdit
      Left = 413
      Top = 32
      Width = 193
      Height = 21
      TabOrder = 3
    end
    object btnBuscar: TButton
      Left = 616
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 4
      OnClick = btnBuscarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 129
    Width = 709
    Height = 279
    Align = alClient
    TabOrder = 1
    object dbgrdCarpetas: TDBGrid
      Left = 1
      Top = 1
      Width = 707
      Height = 277
      Align = alClient
      DataSource = DMRecepcion.dsBuscarCarpeta
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgrdCarpetasCellClick
      OnDblClick = dbgrdCarpetasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idCaja'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idSerieDocumental'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idTipoCarpeta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescripcionSerieDocumental'
          Title.Alignment = taCenter
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoCarpeta'
          Title.Alignment = taCenter
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NonmbresApellidos'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NumeroDocumento'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'idTipoIdentificacion'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DescripcionTipoIdentificacion'
          Title.Alignment = taCenter
          Visible = False
        end>
    end
  end
end
