object DsmBase: TDsmBase
  OldCreateOrder = False
  Height = 481
  Width = 784
  object Connection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=D:\Posto\POSTO.FDB'
      'Password=masterkey'
      'Server=localhost'
      'User_Name=SYSDBA')
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvRound2Scale]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        PrecMax = 20
        PrecMin = 0
        ScaleMax = 8
        ScaleMin = 0
        SourceDataType = dtFmtBCD
        TargetDataType = dtBCD
      end>
    FormatOptions.Round2Scale = True
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 392
    Top = 112
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 544
    Top = 112
  end
  object QueryBase: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SchemaAdapter = FDSchemaAdapter
    Left = 392
    Top = 200
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 544
    Top = 200
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 232
    Top = 192
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 232
    Top = 96
  end
  object QueryLista: TFDQuery
    Connection = Connection
    Left = 392
    Top = 280
  end
end
