inherited DsmTanque: TDsmTanque
  OldCreateOrder = True
  Height = 367
  Width = 711
  inherited QueryBase: TFDQuery
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
  end
end
