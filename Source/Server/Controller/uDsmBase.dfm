object DsmBase: TDsmBase
  OldCreateOrder = False
  Height = 481
  Width = 784
  object QueryBase: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SchemaAdapter = FDSchemaAdapter
    Left = 359
    Top = 176
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 359
    Top = 105
  end
  object QueryLista: TFDQuery
    Connection = FDConnection1
    Left = 263
    Top = 177
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Server=localhost'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=D:\Posto-Sistema\POSTO.FDB')
    Connected = True
    LoginPrompt = False
    Left = 264
    Top = 104
  end
  object FDStanStorageJSONLink2: TFDStanStorageJSONLink
    Left = 504
    Top = 312
  end
  object FDStanStorageBinLink2: TFDStanStorageBinLink
    Left = 656
    Top = 304
  end
end
