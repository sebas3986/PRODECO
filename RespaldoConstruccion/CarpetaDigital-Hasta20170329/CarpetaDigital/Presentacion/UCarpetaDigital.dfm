object frmCarpetaDigital: TfrmCarpetaDigital
  Left = 0
  Top = 0
  Caption = 'Carpeta Digital - [ Versi'#243'n  ]'
  ClientHeight = 742
  ClientWidth = 1283
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1283
    Height = 73
    Align = alTop
    Caption = 'CARPETA DIGITAL '
    Color = 15259846
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object stbBarraEstado: TStatusBar
    Left = 0
    Top = 716
    Width = 1283
    Height = 26
    Panels = <
      item
        Bevel = pbRaised
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 400
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
    Top = 663
    Width = 1283
    Height = 53
    Align = alBottom
    Color = 14995646
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      1283
      53)
    object spbSalir: TSpeedButton
      Left = 1156
      Top = 4
      Width = 113
      Height = 45
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spbSalirClick
    end
  end
  object RpnCaptura: TRxPanel
    Left = 0
    Top = 73
    Width = 1283
    Height = 264
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Gradient.Direction = fdBottomToTop
    Gradient.EndColor = 12885363
    Gradient.StartColor = 16315117
    Gradient.Visible = True
    TileImage = False
    object RpnCriteriosBusqueda: TRxPanel
      Left = 0
      Top = 0
      Width = 1283
      Height = 264
      Align = alClient
      BevelOuter = bvNone
      Color = 15655895
      ParentBackground = False
      TabOrder = 0
      Gradient.Direction = fdBottomToTop
      Gradient.EndColor = 12885363
      Gradient.StartColor = 15786969
      Gradient.Visible = True
      TileImage = False
      object GrpCriteriosPersona: TGroupBox
        Left = 0
        Top = 65
        Width = 1283
        Height = 199
        Align = alClient
        BiDiMode = bdLeftToRight
        Caption = 'Criterios de B'#250'squeda Persona '
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        object LblNUmeroIdentificacion: TLabel
          Left = 380
          Top = 36
          Width = 171
          Height = 19
          Caption = 'N'#250'mero de Documento:'
        end
        object LblPrimerApellido: TLabel
          Left = 657
          Top = 119
          Width = 116
          Height = 19
          Caption = 'Primer Apellido:'
        end
        object LblPrimerNombre: TLabel
          Left = 23
          Top = 119
          Width = 115
          Height = 19
          Caption = 'Primer Nombre:'
        end
        object LblSegundoApellido: TLabel
          Left = 975
          Top = 119
          Width = 131
          Height = 19
          Caption = 'Segundo Apellido:'
        end
        object LblSegundoNombre: TLabel
          Left = 338
          Top = 119
          Width = 130
          Height = 19
          Caption = 'Segundo Nombre:'
        end
        object LblTipoIdentificacion: TLabel
          Left = 23
          Top = 36
          Width = 159
          Height = 19
          Caption = 'Tipo de Identificaci'#243'n:'
        end
        object EdtNumeroDocumento: TEdit
          Left = 380
          Top = 60
          Width = 163
          Height = 27
          Color = 9882571
          MaxLength = 20
          TabOrder = 1
          OnChange = EdtNumeroDocumentoChange
          OnKeyPress = EdtNumeroDocumentoKeyPress
        end
        object EdtPrimerApellido: TEdit
          Left = 657
          Top = 143
          Width = 280
          Height = 27
          Color = 9882571
          MaxLength = 40
          TabOrder = 4
          OnChange = EdtPrimerApellidoChange
          OnExit = EdtPrimerApellidoExit
          OnKeyPress = EdtPrimerApellidoKeyPress
        end
        object EdtPrimerNombre: TEdit
          Left = 23
          Top = 143
          Width = 280
          Height = 27
          Color = 9882571
          MaxLength = 40
          TabOrder = 2
          OnChange = EdtPrimerNombreChange
          OnExit = EdtPrimerNombreExit
          OnKeyPress = EdtPrimerNombreKeyPress
        end
        object EdtSegundoApellido: TEdit
          Left = 975
          Top = 143
          Width = 280
          Height = 27
          MaxLength = 40
          ReadOnly = True
          TabOrder = 5
          OnChange = EdtSegundoApellidoChange
          OnExit = EdtSegundoApellidoExit
        end
        object EdtSegundoNombre: TEdit
          Left = 338
          Top = 143
          Width = 280
          Height = 27
          TabStop = False
          MaxLength = 40
          ReadOnly = True
          TabOrder = 3
          OnChange = EdtSegundoApellidoChange
          OnExit = EdtSegundoApellidoExit
        end
        object dblTipoIdentificacion: TDBLookupComboBox
          Left = 23
          Top = 60
          Width = 313
          Height = 26
          Color = 9882571
          DropDownRows = 8
          DropDownWidth = 400
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnCloseUp = dblTipoIdentificacionCloseUp
          OnEnter = dblTipoIdentificacionEnter
        end
        object RpnErrorPersona: TRxPanel
          Left = 654
          Top = 91
          Width = 443
          Height = 27
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'EL EMPLEADO NO TIENE INFORMACI'#211'N DE IM'#193'GENES ...'
          Color = 1185180
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
          Visible = False
          TileImage = False
        end
      end
      object GrpCriteriosGenerales: TGroupBox
        Left = 0
        Top = 0
        Width = 1283
        Height = 65
        Align = alTop
        Caption = 'Criterios de B'#250'squeda Generales '
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        object LblTipoBusqueda: TLabel
          Left = 20
          Top = 27
          Width = 159
          Height = 23
          Caption = 'Tipo de B'#250'squeda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbxTipoBusqueda: TComboBox
          Left = 185
          Top = 23
          Width = 279
          Height = 28
          Style = csOwnerDrawVariable
          CharCase = ecUpperCase
          Color = 50319311
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ItemHeight = 22
          ParentCtl3D = False
          ParentFont = False
          Sorted = True
          TabOrder = 0
          OnChange = cbxTipoBusquedaChange
          OnEnter = cbxTipoBusquedaEnter
          Items.Strings = (
            'CARPETA'
            'EMPLEADO'
            'SERIE DOCUMENTAL')
        end
        object PnlSeleccionSerieDocu: TPanel
          Left = 499
          Top = 20
          Width = 686
          Height = 43
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          DesignSize = (
            686
            43)
          object LblSerieDocumental: TLabel
            Left = 22
            Top = 7
            Width = 161
            Height = 23
            Anchors = []
            Caption = 'Serie Documental: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = -1
          end
          object dblSerieDocumental: TDBLookupComboBox
            Left = 182
            Top = 1
            Width = 500
            Height = 30
            Color = 50319311
            DropDownRows = 8
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial Rounded MT Bold'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TabStop = False
            OnClick = dblSerieDocumentalClick
            OnEnter = dblSerieDocumentalEnter
          end
        end
        object PnlSeleccionCarpeta: TPanel
          Left = 498
          Top = 20
          Width = 790
          Height = 43
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          DesignSize = (
            790
            43)
          object spbConsultarCarpeta: TSpeedButton
            Left = 383
            Top = -2
            Width = 195
            Height = 38
            Caption = 'Consultar Im'#225'genes Car&peta'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              9E0D0000424D9E0D000000000000360000002800000033000000160000000100
              180000000000680D000000000000000000000000000000000000FFFFFFFDFFFE
              FDFDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2C8B2A69F74B1A579B1A379B1A479
              B1A479B1A479B1A479B1A479B1A479B1A479B1A479B1A479B1A479B1A479B1A4
              79B1A479B2A478A89D75CAC4AAFFFFFFFDFEFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFD2C8B2A69F74B1A579B1A379B1A479B1A479B1A479B1A479B1A479B1A479
              B1A479B1A479B1A479B1A479B1A479B1A479B1A479B2A478A89D75CAC4AAFFFF
              FFFFFFFFFFFFFFC9CACF8B7A46664F0076520073540174550074550074550074
              5500745500745500745500745500745500745500745500745500745500745500
              735500795500674C00A3965EFFFFFF000000FFFFFFFFFFFFC9CACF8B7A46664F
              0076520073540174550074550074550074550074550074550074550074550074
              5500745500745500745500745500745500735500795500674C00A3965EFFFFFF
              D5D6D6C6C7D07C65157B62098265127F66117F66107F66117F66117F66117F66
              117F66117F66117F66117F66117F66117F66117F66117F66117F66117E661182
              66107D5F0B846C24F1EFEC000000FFFFFFD5D6D6C6C7D07C65157B6209826512
              7F66117F66107F66117F66117F66117F66117F66117F66117F66117F66117F66
              117F66117F66117F66117F66117E66118266107D5F0B846C24FFFFFFC1C1C1DE
              E0E4765C0C866B0D896713866A14866A12866A12866A12866A12866A12866A12
              866A12866A12866A12866A12866A12866A12866A12866A12866A128868138467
              0C836E1DF0EEEA000000FFFFFFC1C1C1DEE0E4765C0C866B0D896713866A1486
              6A12866A12866A12866A12866A12866A12866A12866A12866A12866A12866A12
              866A12866A12866A12866A1288681384670C836E1DFFFFFFC3C3C3DDDEE67E62
              0C94740E92701491721491721391721391721391721391721391721391721391
              72139172139172139172139172139172139172139172139372138E6E0E8E7220
              EFEDE8000000FFFFFFC3C3C3DDDEE67E620C94740E9270149172149172139172
              1391721391721391721391721391721391721391721391721391721391721391
              72139172139172139372138E6E0E8E7220FFFFFFC2C2C2DEDFE78164109B7A10
              9878159778149878149878149878149878149878149878149878149878149878
              14987814987814987814987814987814987814977814967610917423F0EDE900
              0000FFFFFFC2C2C2DEDFE78164109B7A10987815977814987814987814987814
              9878149878149878149878149878149878149878149878149878149878149878
              14987814977814967610917423FFFFFFC3C3C2E0E1E7846710A982139E811AA3
              8118A18118A18118A18118A18118A18118A18118A18118A18118A18118A18118
              A18118A18118A18118A18118A18118A18019A27F10937924EEECEA000000FFFF
              FFC3C3C2E0E1E7846710A982139E811AA38118A18118A18118A18118A18118A1
              8118A18118A18118A18118A18118A18118A18118A18118A18118A18118A18118
              A18019A27F10937924FFFFFFC3C3C3E0E3EB886B0FB28B17A9871CAD881BAB88
              1AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB
              881AAB881AAB881AAB881AAB891CAE87149A7D25EEECE9000000FFFFFFC3C3C3
              E0E3EB886B0FB28B17A9871CAD881BAB881AAB881AAB881AAB881AAB881AAB88
              1AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB881AAB891CAE
              87149A7D25FFFFFFC2C2C3E1E3ED8A6F0EBD9619B5901BB78F1BB68F1BB68F1B
              B68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F
              1BB68F1BB68F1BB58F1DB69015A08226EDEBE8000000FFFFFFC2C2C3E1E3ED8A
              6F0EBD9619B5901BB78F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1B
              B68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB68F1BB58F1DB69015A082
              26FFFFFFC2C2C2E2E3EF8E720FC39F1CBF9920C29921BF9820BF9820BF9820BF
              9820BF9820BF9820BF9820C0981FC09821BF981FC09720C09820BF981FBF981F
              BF981FC0981FC39919A38627ECEAE7000000FFFFFFC2C2C2E2E3EF8E720FC39F
              1CBF9920C29921BF9820BF9820BF9820BF9820BF9820BF9820BF9820C0981FC0
              9821BF981FC09720C09820BF981FBF981FBF981FC0981FC39919A38627FFFFFF
              C2C2C2E5E7EE946E0FD3A51DC79E23CA9F23CC9F21CC9F21CC9F21CC9F21CC9F
              21CC9F21CA9F21CE9F21C99F20C8A01FC89F23C89F21C89F20C89F20C89F20C6
              9F22CBA01BA88929EAE9E8000000FFFFFFC2C2C2E5E7EE946E0FD3A51DC79E23
              CA9F23CC9F21CC9F21CC9F21CC9F21CC9F21CC9F21CA9F21CE9F21C99F20C8A0
              1FC89F23C89F21C89F20C89F20C89F20C69F22CBA01BA88929FFFFFFC2C2C2E5
              E8EEA89545DBAD12D9AE16D2AC1DD5AC1CD5AC1CD5AC1CD5AC1CD5AC1CD5AC1C
              D5AC1CD3AB21D2B11CDDAD22D8AB20D1A824D3A724D3A824D3A824D2A725D6A9
              1FAD8C2AE9E9E8000000FFFFFFC2C2C2E5E8EEA89545DBAD12D9AE16D2AC1DD5
              AC1CD5AC1CD5AC1CD5AC1CD5AC1CD5AC1CD5AC1CD3AB21D2B11CDDAD22D8AB20
              D1A824D3A724D3A824D3A824D2A725D6A91FAD8C2AFFFFFFC1C1C1E5E5EDD6D6
              C9B19E5EBCA83FBDA843BDA743BDA743BDA743BDA743BDA743BDA743BDA743BE
              A742B8AA44C29A26DDB123DBAE2ADCAE25DCAE25DCAE26DDAF24E0AF21B3902A
              EAE8E6000000FFFFFFC1C1C1E5E5EDD6D6C9B19E5EBCA83FBDA843BDA743BDA7
              43BDA743BDA743BDA743BDA743BDA743BEA742B8AA44C29A26DDB123DBAE2ADC
              AE25DCAE25DCAE26DDAF24E0AF21B3902AFFFFFFC1C1C1E2E5E2EFEDF2ECEAF4
              E1E3EBE3E5EDE3E5ECE3E5ECE3E5ECE2E5ECE3E5ECE3E5ECE3E5ECE2E4EFE3E9
              F6A38941E2B115E4AF2AE0AF27E1AF28E0AF28E0B026E8B422B6932AE7E7E400
              0000FFFFFFC1C1C1E2E5E2EFEDF2ECEAF4E1E3EBE3E5EDE3E5ECE3E5ECE3E5EC
              E2E5ECE3E5ECE3E5ECE3E5ECE2E4EFE3E9F6A38941E2B115E4AF2AE0AF27E1AF
              28E0AF28E0B026E8B422B6932AFFFFFFC1C1C1E5E4E5EBEBEBEBEBEBEBEBEBEC
              ECEDECECECECECEDECEBEDEBECECEDEDEDEBEBEBEBECECEEEBEDF2F0FCA89C61
              E8B711FCD92DFCD52CFCD52CFBD329F6D72FF9C814AB9442F7F8FA000000FFFF
              FFC1C1C1E5E4E5EBEBEBEBEBEBEBEBEBECECEDECECECECECEDECEBEDEBECECED
              EDEDEBEBEBEBECECEEEBEDF2F0FCA89C61E8B711FCD92DFCD52CFCD52CFBD329
              F6D72FF9C814AB9442FFFFFFC1C1C1E6E6E6ECECECECECECEBEBEBEBEBEBEBEB
              EBECECECEAEAEAEAEAEAEAEAEAECECECEBEBEBEBEFE9EEEFF1DADCDAB09A4C94
              84109585129383109A8916938512A59538E8DFD7FFFFFF000000FFFFFFC1C1C1
              E6E6E6ECECECECECECEBEBEBEBEBEBEBEBEBECECECEAEAEAEAEAEAEAEAEAECEC
              ECEBEBEBEBEFE9EEEFF1DADCDAB09A4C9484109585129383109A8916938512A5
              9538E8DFD7FFFFFFC0C0C0EAEAEAEEEEEEEDEDEDEEEEEEEEEEEEEEEEEEEEEEEE
              F4F4F4E9E9E9E8E8E8E7E7E7E8E8E8E7E6E8E7E6E7EBE9ECE9ECF6EBEDF8ECED
              F8ECEDF8F0F1FCCECFDCFAFDFFFFFFFFFBFBFB000000FFFFFFC0C0C0EAEAEAEE
              EEEEEDEDEDEEEEEEEEEEEEEEEEEEEEEEEEF4F4F4E9E9E9E8E8E8E7E7E7E8E8E8
              E7E6E8E7E6E7EBE9ECE9ECF6EBEDF8ECEDF8ECEDF8F0F1FCCECFDCFAFDFFFFFF
              FFFFFFFFC2C2C2EFEFEFF3F3F3ECECECEDEDEDEDEDEDEDEDEDF7F7F7D7D7D7C6
              C6C6CECECECDCDCDCFCECECECDCECCCCCBCFCDD0CACCD1CECECFCFCECFCFCDCF
              D0CFD0EDEDEDFFFFFFFCFEFDFBFDFC000000FFFFFFC2C2C2EFEFEFF3F3F3ECEC
              ECEDEDEDEDEDEDEDEDEDF7F7F7D7D7D7C6C6C6CECECECDCDCDCFCECECECDCECC
              CCCBCFCDD0CACCD1CECECFCFCECFCFCDCFD0CFD0EDEDEDFFFFFFFCFEFDFFFFFF
              E9E9E9BDBDBDF9F9F9F5F5F5F5F5F5F5F5F5F6F6F6EDEDEDBBBBBBFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFEFFFFFEFFFF000000FFFFFFE9E9E9BDBDBDF9F9F9F5F5F5F5F5F5
              F5F5F5F6F6F6EDEDEDBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFEFFFFFFEF
              EFEFBEBEBEBDBDBDBDBDBDBDBDBDBCBCBCC2C2C2F5F5F5FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FEFEFEFFFFFFEFEFEFBEBEBEBDBDBDBDBDBDBDBDBDBC
              BCBCC2C2C2F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000}
            NumGlyphs = 2
            ParentFont = False
            Spacing = 3
            Transparent = False
            OnClick = spbConsultarCarpetaClick
          end
          object LblEme: TLabel
            Left = 215
            Top = 5
            Width = 19
            Height = 25
            Anchors = [akLeft]
            Caption = 'M'
            Color = clBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LblCodigoCarpeta: TLabel
            Left = 27
            Top = 7
            Width = 182
            Height = 23
            Caption = 'C'#243'digo de la Carpeta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdtCodigoCarpeta: TEdit
            Left = 237
            Top = 2
            Width = 117
            Height = 30
            Color = 50319311
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial Rounded MT Bold'
            Font.Style = []
            MaxLength = 8
            ParentFont = False
            TabOrder = 0
            OnChange = EdtCodigoCarpetaChange
            OnKeyPress = EdtCodigoCarpetaKeyPress
          end
        end
      end
      object GrpOpcionesBusqueda: TGroupBox
        Left = 654
        Top = 108
        Width = 609
        Height = 45
        TabOrder = 2
        object spbCancelarLimpiar: TSpeedButton
          Left = 395
          Top = 3
          Width = 208
          Height = 37
          Caption = '&Limpiar Criterios/Otra Consulta'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
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
          Spacing = 5
          Transparent = False
          OnClick = spbCancelarLimpiarClick
        end
        object spbConsultarPersona: TSpeedButton
          Left = 188
          Top = 3
          Width = 202
          Height = 37
          Caption = '&Consultar Im'#225'genes Persona'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            86080000424D8608000000000000360400002800000030000000170000000100
            0800000000005004000000000000000000000001000000000000000000000000
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF6641AB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6641AB5FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66C1A1A1AB6FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF66C1A1A1AB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08
            631A22231A11B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08631A22231A11B6FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6631A232323231A2207F6FFFFFFFFFFFFFF
            FFFFFFFFFFFFF6631A232323231A2207F6FFFFFFFFFFFFFFFFFFFFFFFFF66C22
            2323232323232222B5FFFFFFFFFFFFFFFFFFFFFFFFF66C222323232323232222
            B5FFFFFFFFFFFFFFFFFFFFFFF66C2323236363636363236323B6FFFFFFFFFFFF
            FFFFFFFFF66C2323236363636363236323B6FFFFFFFFFFFFFFFFFFFF64236363
            63636363636363636323B6FFFFFFFFFFFFFFFFFF642363636363636363636363
            6323B6FFFFFFFFFFFFFFFF64236B636363636B6B6B636363636B23B5F6FFFFFF
            FFFFFF64236B636363636B6B6B636363636B23B5F6FFFFFFFFFF6C236B6B6B6B
            6B6C23636C6B6B6B6B6B6B2307FFFFFFFFFF6C236B6B6B6B6B6C23636C6B6B6B
            6B6B6B2307FFFFFFFFFFAD236C6C6C6C6C236C08236C6C6C6C6C6C6C5A07FFFF
            FFFFAD236C6C6C6C6C236C08236C6C6C6C6C6C6C5A07FFFFFFFFFFAC236C6C6C
            236CF6FFF6236C6C6C6C6C6C6C5A07FFFFFFFFAC236C6C6C236CF6FFF6236C6C
            6C6C6C6C6C5A07FFFFFFFFFFAC6B7463ACF6FFFFFFF6236C6C6C6C6C6C6C6207
            FFFFFFFFAC6B7463ACF6FFFFFFF6236C6C6C6C6C6C6C6207FFFFFFFFFFAC236C
            F6FFFFFFFFFF0823746C6C6C6C6C6C6307FFFFFFFFAC236CF6FFFFFFFFFF0823
            746C6C6C6C6C6C6307FFFFFFFFF608F6FFFFFFFFFFFFFF0823746C6C6C6C7474
            6307FFFFFFF608F6FFFFFFFFFFFFFF0823746C6C6C6C74746307FFFFFFFFFFFF
            FFFFFFFFFFFFFFFF086B7474747474746C23FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            086B7474747474746C23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086B7475747474
            6CB4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086B74757474746CB4FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF076C74B5BD2BB4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF076C74B5BD2BB4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF076C756CB6
            F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF076C756CB6F6FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF086CB4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF086CB4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentFont = False
          Spacing = 3
          Transparent = False
          OnClick = spbConsultarPersonaClick
        end
        object bbtConsultarBD: TBitBtn
          Left = 7
          Top = 3
          Width = 176
          Height = 37
          Caption = 'Consultar &Base de Datos'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = bbtConsultarBDClick
        end
      end
      object RpnErrorCarpeta: TRxPanel
        Left = 713
        Top = 62
        Width = 500
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = ' LA CARPETA NO EXISTE ....'
        Color = 1185180
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        TileImage = False
      end
    end
  end
  object RpnOtrosCriterios: TRxPanel
    Left = 793
    Top = 337
    Width = 490
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 12885363
    Gradient.StartColor = 15192512
    Gradient.Visible = True
    TileImage = False
    object GrpCiteriosAdicionales: TGroupBox
      Left = 0
      Top = 0
      Width = 490
      Height = 326
      Align = alClient
      Caption = 'Criterios Adicionales '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object PnlCriteriosPlanillas: TPanel
        Left = 13
        Top = 123
        Width = 468
        Height = 190
        BevelInner = bvLowered
        TabOrder = 2
        Visible = False
        DesignSize = (
          468
          190)
        object LblFechaNominaFinal: TLabel
          Left = 6
          Top = 96
          Width = 168
          Height = 20
          Margins.Left = 15
          Caption = 'FECHA DE N'#211'MINA FINAL:'
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
        end
        object LbLFechaNominaInicial: TLabel
          Left = 6
          Top = 59
          Width = 177
          Height = 20
          Margins.Left = 15
          Caption = 'FECHA DE N'#211'MINA INICIAL:'
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
        end
        object mkeFechaNominaInicial: TMaskEdit
          Left = 198
          Top = 51
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
          TabOrder = 0
          Text = '  /  /    '
          TextHint = 'a'#241'o mes'
          OnChange = mkeFechaNominaInicialChange
          OnExit = mkeFechaNominaInicialExit
        end
        object mkeFechaNominaFinal: TMaskEdit
          Left = 198
          Top = 93
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
          TabOrder = 1
          Text = '  /  /    '
          TextHint = 'a'#241'o mes'
          OnChange = mkeFechaNominaFinalChange
          OnExit = mkeFechaNominaFinalExit
        end
      end
      object PnlMensajeAdicionales: TPanel
        Left = 13
        Top = 22
        Width = 468
        Height = 91
        BevelInner = bvLowered
        TabOrder = 0
        Visible = False
        object LblMensajeAdicionales: TLabel
          Left = 5
          Top = 5
          Width = 458
          Height = 80
          Margins.Left = 15
          Caption = 
            'NOTA: en este tipo de consulta puede ingresar informaci'#243'n en Cri' +
            'terios de B'#250'squeda Persona y tambi'#233'n en Citerios Adicionales.'#13#10'S' +
            'i escoge alg'#250'n rango de fecha o per'#237'odo es obligatorio proporcio' +
            'nar los dos valores.'
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          WordWrap = True
        end
      end
      object PnlCriteriosAportes: TPanel
        Left = 13
        Top = 119
        Width = 468
        Height = 195
        BevelInner = bvLowered
        TabOrder = 1
        Visible = False
        object LblFondo: TLabel
          Left = 24
          Top = 144
          Width = 50
          Height = 20
          Margins.Left = 15
          Caption = 'FONDO:'
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
        end
        object GrpFechaPago: TGroupBox
          Left = 24
          Top = 5
          Width = 436
          Height = 57
          Caption = 'Fecha de pago'
          Enabled = False
          TabOrder = 1
          DesignSize = (
            436
            57)
          object LblFechaPagoInicial: TLabel
            Left = 7
            Top = 24
            Width = 103
            Height = 20
            Margins.Left = 15
            Caption = 'FECHA  INICIAL:'
            Color = clMoneyGreen
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
          end
          object LblFechaPagoFinal: TLabel
            Left = 230
            Top = 23
            Width = 90
            Height = 20
            Margins.Left = 15
            Caption = 'FECHA FINAL:'
            Color = clMoneyGreen
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
          end
          object mkeFechaPagoInicial: TMaskEdit
            Left = 118
            Top = 16
            Width = 104
            Height = 29
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
            TabOrder = 0
            Text = '  /  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkeFechaNominaFinalChange
            OnExit = mkeFechaNominaFinalExit
          end
          object mkeFechaPagoFinal: TMaskEdit
            Left = 326
            Top = 18
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
            TabOrder = 1
            Text = '  /  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkeFechaNominaInicialChange
            OnExit = mkeFechaNominaInicialExit
          end
        end
        object GrpPeriodoCotizacion: TGroupBox
          Left = 24
          Top = 70
          Width = 436
          Height = 57
          Caption = 'Periodo Cotizaci'#243'n'
          Enabled = False
          TabOrder = 3
          DesignSize = (
            436
            57)
          object LblPeriodoInicial: TLabel
            Left = 7
            Top = 20
            Width = 115
            Height = 20
            Margins.Left = 15
            Caption = 'PERIODO INICIAL:'
            Color = clMoneyGreen
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
          end
          object LblPeriodoFinal: TLabel
            Left = 228
            Top = 18
            Width = 106
            Height = 20
            Margins.Left = 15
            Caption = 'PERIODO FINAL:'
            Color = clMoneyGreen
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
          end
          object mkePeriodoInicial: TMaskEdit
            Left = 134
            Top = 16
            Width = 76
            Height = 29
            Alignment = taCenter
            Anchors = []
            AutoSelect = False
            AutoSize = False
            Color = 50319311
            EditMask = '!00/9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            Text = '  /    '
            TextHint = 'a'#241'o mes'
            OnChange = mkeFechaNominaFinalChange
            OnExit = mkeFechaNominaFinalExit
          end
          object mkePeriodoFinal: TMaskEdit
            Left = 345
            Top = 16
            Width = 76
            Height = 29
            Alignment = taCenter
            Anchors = []
            AutoSelect = False
            AutoSize = False
            Color = 50319311
            EditMask = '!00/9999;1;_'
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
            OnChange = mkeFechaNominaFinalChange
            OnExit = mkeFechaNominaFinalExit
          end
        end
        object dblFondo: TDBLookupComboBox
          Left = 80
          Top = 139
          Width = 380
          Height = 30
          Color = 50319311
          DropDownRows = 8
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          TabStop = False
          OnCloseUp = dblFondoCloseUp
          OnEnter = dblFondoEnter
        end
        object chkPeriodo: TCheckBox
          Left = 7
          Top = 93
          Width = 17
          Height = 17
          TabOrder = 2
          OnClick = chkPeriodoClick
        end
        object chkFechaPago: TCheckBox
          Left = 5
          Top = 33
          Width = 17
          Height = 17
          TabOrder = 0
          OnClick = chkFechaPagoClick
        end
      end
    end
  end
  object RpnInformacionImagen: TRxPanel
    Left = 0
    Top = 337
    Width = 793
    Height = 326
    Align = alLeft
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Gradient.Direction = fdTopToBottom
    Gradient.EndColor = 12885363
    Gradient.StartColor = 15192512
    Gradient.Visible = True
    TileImage = False
    object GrpBaseDatos: TGroupBox
      Left = 0
      Top = 0
      Width = 793
      Height = 326
      Align = alClient
      Caption = 'Selecci'#243'n de Persona - Base de Datos'
      Color = clWhite
      DoubleBuffered = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      object LblPersonas: TLabel
        Left = 2
        Top = 20
        Width = 789
        Height = 43
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taCenter
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
        Layout = tlCenter
        ExplicitLeft = 354
        ExplicitTop = 21
        ExplicitWidth = 479
      end
      object LblCantidadRegistros: TLabel
        Left = 2
        Top = 48
        Width = 202
        Height = 14
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Alignment = taCenter
        Caption = 'Registro:  [1.100.000 de 1.100.000]'
        Color = 47031
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object RpnBusqueda: TRxPanel
        Left = 2
        Top = 63
        Width = 789
        Height = 261
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        TileImage = False
        object dbgPersonas: TDBGrid
          Left = 0
          Top = 0
          Width = 789
          Height = 261
          Align = alClient
          Color = clInactiveBorder
          DrawingStyle = gdsGradient
          FixedColor = clInactiveCaption
          GradientEndColor = clBtnText
          GradientStartColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
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
              DropDownRows = 6
              Expanded = False
              FieldName = 'nombres'
              Title.Alignment = taCenter
              Title.Caption = 'NOMBRES'
              Title.Color = clRed
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Color = 14671805
              DropDownRows = 6
              Expanded = False
              FieldName = 'apellidos'
              Title.Alignment = taCenter
              Title.Caption = 'APELLIDOS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Color = 13355926
              DropDownRows = 6
              Expanded = False
              FieldName = 'numerodocumento'
              Title.Alignment = taCenter
              Title.Caption = 'NRO. DOCUM.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Color = 14671805
              DropDownRows = 6
              Expanded = False
              FieldName = 'descripciontipoidentificacion'
              Title.Alignment = taCenter
              Title.Caption = 'TIPO DOCUMENTO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end>
        end
        object RpnBuscando: TRxPanel
          Left = 229
          Top = 164
          Width = 356
          Height = 27
          BevelOuter = bvNone
          Caption = 'Consultando Informaci'#243'n .....'
          Color = clBlue
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
          Gradient.StartColor = clBlue
          Gradient.Visible = True
          TileImage = False
        end
      end
      object RpnMensajePersonas: TRxPanel
        Left = 241
        Top = 202
        Width = 339
        Height = 78
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 4
        BorderStyle = bsSingle
        Color = 1514433
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
        Gradient.StartColor = clMoneyGreen
        Gradient.StepCount = 63
        TileImage = False
        object rxlMensajePersonas: TRxLabel
          Left = 4
          Top = 4
          Width = 327
          Height = 66
          Align = alClient
          Alignment = taCenter
          Caption = 'NO EXISTEN COINCIDENCIAS'#13#10'PARA LOS CRITERIOS SELECCIONADOS'
          Color = 8289584
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowColor = clNone
          WordWrap = True
          ExplicitLeft = -2
          ExplicitTop = 52
        end
      end
    end
  end
end