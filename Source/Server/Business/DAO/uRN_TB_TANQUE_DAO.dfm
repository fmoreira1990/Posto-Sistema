inherited RN_TB_TANQUE_DAO: TRN_TB_TANQUE_DAO
  OldCreateOrder = True
  Height = 265
  Width = 551
  inherited QueryBase: TFDQuery
    MasterFields = 'ID_TANQUE'
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_TANQUE'
    UpdateOptions.UpdateTableName = 'TB_TANQUE'
    UpdateOptions.KeyFields = 'ID_TANQUE'
    UpdateOptions.AutoIncFields = 'ID_TANQUE'
    SQL.Strings = (
      'select tt.*,'
      '       pp.descricao as ds_produto '
      'from tb_tanque tt'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto'
      'where id_tanque = :id_tanque')
    ParamData = <
      item
        Name = 'ID_TANQUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryBaseID_TANQUE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryBaseID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QueryBaseCAPACIDADE: TFMTBCDField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
      Precision = 18
      Size = 2
    end
    object QueryBaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
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
  inherited QueryLista: TFDQuery
    SQL.Strings = (
      'select tt.*,'
      '       pp.descricao as ds_produto '
      'from tb_tanque tt'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto')
    object QueryListaID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QueryListaCAPACIDADE: TFMTBCDField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
      Precision = 18
      Size = 2
    end
    object QueryListaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object QueryListaDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
end
