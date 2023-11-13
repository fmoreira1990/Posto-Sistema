inherited RN_TB_BOMBA_DAO: TRN_TB_BOMBA_DAO
  Height = 283
  Width = 588
  inherited QueryBase: TFDQuery
    MasterFields = 'ID_BOMBA'
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_BOMBA'
    UpdateOptions.UpdateTableName = 'TB_BOMBA'
    UpdateOptions.KeyFields = 'ID_BOMBA'
    UpdateOptions.AutoIncFields = 'ID_BOMBA'
    SQL.Strings = (
      'select bb.*,'
      '       bb.numero as nro_bomba,'
      '       tt.numero as nro_tanque,'
      '       pp.descricao as ds_produto'
      'from tb_bomba bb'
      'inner join tb_tanque  tt on tt.id_tanque  = bb.id_tanque'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto'
      'where id_bomba = :id_bomba')
    ParamData = <
      item
        Name = 'ID_BOMBA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QueryBaseID_BOMBA: TFDAutoIncField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QueryBaseID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      Required = True
    end
    object QueryBaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object QueryBaseNRO_BOMBA: TIntegerField
      FieldName = 'NRO_BOMBA'
      Origin = 'NUMERO'
      ProviderFlags = []
      Required = True
    end
    object QueryBaseNRO_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_TANQUE'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryBaseDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  inherited FDSchemaAdapter: TFDSchemaAdapter
    OnReconcileRow = nil
  end
  inherited QueryLista: TFDQuery
    SQL.Strings = (
      'select bb.*,'
      '       bb.numero as nro_bomba,'
      '       tt.numero as nro_tanque,'
      '       pp.id_produto,'
      '       pp.descricao as ds_produto,'
      '       pp.vr_venda,'
      '       pp.vr_custo,'
      '       pp.per_imposto'
      'from tb_bomba bb'
      'inner join tb_tanque  tt on tt.id_tanque  = bb.id_tanque'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto')
    object QueryListaID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      Required = True
    end
    object QueryListaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object QueryListaNRO_BOMBA: TIntegerField
      FieldName = 'NRO_BOMBA'
      Origin = 'NUMERO'
      ProviderFlags = []
      Required = True
    end
    object QueryListaNRO_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_TANQUE'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryListaID_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryListaDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QueryListaVR_VENDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QueryListaVR_CUSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VR_CUSTO'
      Origin = 'VR_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QueryListaPER_IMPOSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PER_IMPOSTO'
      Origin = 'PER_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
