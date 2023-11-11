inherited BombaDAO: TBombaDAO
  OldCreateOrder = True
  Height = 339
  Width = 893
  inherited memBase: TFDMemTable
    MasterFields = 'ID_BOMBA'
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    UpdateOptions.AssignedValues = [uvGeneratorName, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'G_ID_BOMBA'
    UpdateOptions.UpdateTableName = 'TB_BOMBA'
    UpdateOptions.KeyFields = 'ID_BOMBA'
    UpdateOptions.AutoIncFields = 'ID_BOMBA'
    StoreDefs = True
    object memBaseID_BOMBA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object memBaseID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
    object memBaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memBaseNRO_BOMBA: TIntegerField
      FieldName = 'NRO_BOMBA'
    end
    object memBaseNRO_TANQUE: TIntegerField
      FieldKind = fkLookup
      FieldName = 'NRO_TANQUE'
      LookupDataSet = memTanqueCons
      LookupKeyFields = 'ID_TANQUE'
      LookupResultField = 'NUMERO'
      KeyFields = 'ID_TANQUE'
      Lookup = True
    end
    object memBaseDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Size = 50
    end
  end
  inherited tabBase: TFDTableAdapter
    UpdateTableName = 'tb_bomba'
    DatSTableName = 'tb_bomba'
  end
  inherited memLista: TFDMemTable
    MasterFields = 'ID_BOMBA'
  end
  inherited FDStoredProcPost: TFDStoredProc
    StoredProcName = 'TDsmBomba.updateBombas'
    ParamData = <
      item
        Name = 'AStream'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Position = 1
        Name = 'ReturnValue'
        DataType = ftBoolean
        ParamType = ptResult
      end>
  end
  inherited FDStoredProcConsulta: TFDStoredProc
    StoredProcName = 'TDsmBomba.ListBombas'
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
  inherited FDStoredProcConsultaUnique: TFDStoredProc
    StoredProcName = 'TDsmBomba.Bombas'
    ParamData = <
      item
        Name = 'pIdBomba'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 1
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
  object memTanqueCons: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 232
    object memTanqueConsID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
    object memTanqueConsID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object memTanqueConsNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memTanqueConsDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Size = 50
    end
    object memTanqueConsCAPACIDADE: TFMTBCDField
      FieldName = 'CAPACIDADE'
      Size = 0
    end
  end
  object FDStoredProcTaqueCons: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'TDsmTanque.ListTanques'
    Left = 720
    Top = 232
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
end
