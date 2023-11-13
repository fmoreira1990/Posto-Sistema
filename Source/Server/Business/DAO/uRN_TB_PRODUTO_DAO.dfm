inherited RN_TB_PRODUTO_DAO: TRN_TB_PRODUTO_DAO
  OldCreateOrder = True
  Height = 318
  Width = 552
  inherited QueryBase: TFDQuery
    MasterFields = 'ID_PRODUTO'
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_PRODUTO'
    UpdateOptions.UpdateTableName = 'TB_PRODUTO'
    UpdateOptions.KeyFields = 'ID_PRODUTO'
    UpdateOptions.AutoIncFields = 'ID_PRODUTO'
    SQL.Strings = (
      'select * from tb_produto'
      'where id_produto = :id_produto')
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryBaseID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryBaseVR_VENDA: TFMTBCDField
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBaseVR_CUSTO: TFMTBCDField
      FieldName = 'VR_CUSTO'
      Origin = 'VR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBaseQTDE_ESTOQUE: TFMTBCDField
      FieldName = 'QTDE_ESTOQUE'
      Origin = 'QTDE_ESTOQUE'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBasePER_IMPOSTO: TFMTBCDField
      FieldName = 'PER_IMPOSTO'
      Origin = 'PER_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBaseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  inherited QueryLista: TFDQuery
    MasterFields = 'ID_PRODUTO'
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_PRODUTO'
    UpdateOptions.UpdateTableName = 'TB_PRODUTO'
    UpdateOptions.KeyFields = 'ID_PRODUTO'
    UpdateOptions.AutoIncFields = 'ID_PRODUTO'
    SQL.Strings = (
      'select * from tb_produto')
    object QueryListaID_PRODUTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaVR_VENDA: TFMTBCDField
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaVR_CUSTO: TFMTBCDField
      FieldName = 'VR_CUSTO'
      Origin = 'VR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaQTDE_ESTOQUE: TFMTBCDField
      FieldName = 'QTDE_ESTOQUE'
      Origin = 'QTDE_ESTOQUE'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaPER_IMPOSTO: TFMTBCDField
      FieldName = 'PER_IMPOSTO'
      Origin = 'PER_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
end
