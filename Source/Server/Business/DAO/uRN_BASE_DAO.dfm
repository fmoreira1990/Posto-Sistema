object RN_BASE_DAO: TRN_BASE_DAO
  OldCreateOrder = False
  Height = 401
  Width = 787
  object QueryBase: TFDQuery
    CachedUpdates = True
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
    Left = 263
    Top = 177
  end
end
