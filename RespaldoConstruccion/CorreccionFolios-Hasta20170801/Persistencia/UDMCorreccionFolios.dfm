object DMCorrecionFolios: TDMCorrecionFolios
  OldCreateOrder = False
  Height = 99
  Width = 314
  object ZQCarpeta: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 32
    Top = 28
  end
  object dsCarpeta: TDataSource
    DataSet = cdsCarpeta
    Left = 158
    Top = 29
  end
  object cdsCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 28
    object intgrfldCarpetaidCarpetaAleta: TIntegerField
      FieldName = 'idCarpetaAleta'
    end
    object strngfldCarpetaDescripcionSubSerieDocumental: TStringField
      FieldName = 'DescripcionSubSerieDocumental'
      Size = 100
    end
    object intgrfldCarpetaCantidadFolios: TIntegerField
      FieldName = 'CantidadFolios'
    end
    object intgrfldCarpetaidSerieSubSerie: TIntegerField
      FieldName = 'idSerieSubSerie'
    end
  end
  object ZQActualizarFolios: TZQuery
    Connection = DMConexion.ZConexion
    Params = <>
    Left = 234
    Top = 29
  end
end
