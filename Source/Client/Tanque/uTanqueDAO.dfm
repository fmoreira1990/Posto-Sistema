inherited TanqueDAO: TTanqueDAO
  OldCreateOrder = True
  Height = 390
  Width = 923
  inherited memBase: TFDMemTable
    MasterFields = 'ID_TANQUE'
    UpdateOptions.AssignedValues = [uvGeneratorName, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'G_ID_TANQUE'
    UpdateOptions.UpdateTableName = 'TB_TANQUE'
    UpdateOptions.KeyFields = 'ID_TANQUE'
    UpdateOptions.AutoIncFields = 'ID_TANQUE'
    object memBaseID_TANQUE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_TANQUE'
    end
    object memBaseID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object memBaseCAPACIDADE: TFMTBCDField
      FieldName = 'CAPACIDADE'
    end
    object memBaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memBaseDS_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_PRODUTO'
      LookupDataSet = memProdCons
      LookupKeyFields = 'ID_PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_PRODUTO'
      Size = 50
      Lookup = True
    end
  end
  inherited tabBase: TFDTableAdapter
    UpdateTableName = 'tb_tanque'
    DatSTableName = 'tb_tanque'
  end
  inherited memLista: TFDMemTable
    MasterFields = 'ID_TANQUE'
  end
  inherited FDStoredProcPost: TFDStoredProc
    StoredProcName = 'TDsmTanque.updateTanques'
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
    StoredProcName = 'TDsmTanque.ListTanques'
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
  inherited FDStoredProcConsultaUnique: TFDStoredProc
    StoredProcName = 'TDsmTanque.Tanque'
    ParamData = <
      item
        Name = 'pIdTanque'
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
  object memProdCons: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 312
  end
  object FDStoredProcProdCons: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'TDsmProduto.ListProdutos'
    Left = 600
    Top = 232
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
end
