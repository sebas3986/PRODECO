object FrmActualizaModulo: TFrmActualizaModulo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Actualizador de Aplicaciones - UNIANDES'
  ClientHeight = 227
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RpnFondo: TRxPanel
    Left = 0
    Top = 0
    Width = 573
    Height = 227
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 14938339
    Gradient.StartColor = 13033414
    Gradient.Visible = True
    TileImage = False
    object LblMensaje: TLabel
      Left = 24
      Top = 45
      Width = 521
      Height = 81
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 
        'Actualizando M'#243'dulo: [ REPORTES ] .....'#13#10#13#10'Nueva Versi'#243'n: 201608' +
        '11-M01'
      Color = 5341520
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object btnActualizar: TButton
      Left = 16
      Top = 173
      Width = 169
      Height = 36
      Caption = '&Actualizar M'#243'dulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnActualizarClick
    end
    object btnSalir: TButton
      Left = 408
      Top = 173
      Width = 153
      Height = 36
      Caption = '&Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
  object tmrEspera: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmrEsperaTimer
    Left = 312
    Top = 168
  end
end
