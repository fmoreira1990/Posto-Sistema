object RN_BASE_DAO: TRN_BASE_DAO
  OldCreateOrder = False
  Height = 401
  Width = 787
  object QueryBase: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SchemaAdapter = FDSchemaAdapter
    Left = 359
    Top = 176
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    OnReconcileRow = FDSchemaAdapterReconcileRow
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
    LoginPrompt = False
    Left = 264
    Top = 104
  end
end
