object PostoClientDAO: TPostoClientDAO
  OldCreateOrder = False
  Height = 313
  Width = 910
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 200
    Top = 72
  end
  object memBase: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode, rvStoreMergeData]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = tabBase
    Left = 232
    Top = 144
  end
  object tabBase: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter
    Left = 160
    Top = 144
  end
  object dsBase: TDataSource
    DataSet = memBase
    Left = 160
    Top = 216
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DatasnapContext=datasnap/'
      'Server=localhost'
      'Port=8080'
      'Protocol=http'
      'Filters={ "ZLibCompression": {} }'
      'DriverID=DS')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 200
    Top = 16
  end
  object FDPhysDSDriverLink: TFDPhysDSDriverLink
    Left = 664
    Top = 24
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 776
    Top = 24
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 784
    Top = 88
  end
  object memLista: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 336
    Top = 72
  end
  object dsLista: TDataSource
    DataSet = memLista
    Left = 336
    Top = 136
  end
  object FDStoredProcPost: TFDStoredProc
    Connection = FDConnection
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    Left = 456
    Top = 232
  end
  object FDStoredProcConsulta: TFDStoredProc
    Connection = FDConnection
    Left = 456
    Top = 160
  end
  object FDStoredProcConsultaUnique: TFDStoredProc
    Connection = FDConnection
    Left = 600
    Top = 160
  end
end
