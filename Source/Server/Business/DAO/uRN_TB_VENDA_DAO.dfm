inherited RN_TB_VENDA_DAO: TRN_TB_VENDA_DAO
  OldCreateOrder = True
  Height = 353
  Width = 696
  inherited QueryBase: TFDQuery
    MasterFields = 'ID_VENDA'
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_VENDA'
    UpdateOptions.UpdateTableName = 'TB_VENDA'
    UpdateOptions.KeyFields = 'ID_VENDA'
    UpdateOptions.AutoIncFields = 'ID_VENDA'
    SQL.Strings = (
      'select vv.*,'
      '       pp.descricao as ds_produto,'
      '       bb.numero    as nro_bomba,'
      '       tt.numero    as nro_tanque'
      'from tb_venda vv '
      'inner join tb_produto pp on pp.id_produto = vv.id_produto'
      'inner join tb_bomba   bb on bb.id_bomba   = vv.id_bomba'
      'inner join tb_tanque  tt on tt.id_tanque  = vv.id_tanque'
      'where vv.id_venda = :id_venda')
    ParamData = <
      item
        Name = 'ID_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryBaseID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryBaseID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QueryBaseID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      Required = True
    end
    object QueryBaseID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      Required = True
    end
    object QueryBaseDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object QueryBaseHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object QueryBaseQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
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
    object QueryBaseVR_TOTAL: TFMTBCDField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
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
    object QueryBaseBC_IMPOSTO: TFMTBCDField
      FieldName = 'BC_IMPOSTO'
      Origin = 'BC_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBaseVR_IMPOSTO: TFMTBCDField
      FieldName = 'VR_IMPOSTO'
      Origin = 'VR_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryBaseDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QueryBaseNRO_BOMBA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_BOMBA'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryBaseNRO_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_TANQUE'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  inherited QueryLista: TFDQuery
    SQL.Strings = (
      'select vv.*,'
      '       pp.descricao as ds_produto,'
      '       bb.numero    as nro_bomba,'
      '       tt.numero    as nro_tanque'
      'from tb_venda vv '
      'inner join tb_produto pp on pp.id_produto = vv.id_produto'
      'inner join tb_bomba   bb on bb.id_bomba   = vv.id_bomba'
      'inner join tb_tanque  tt on tt.id_tanque  = vv.id_tanque')
    object QueryListaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryListaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QueryListaID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      Required = True
    end
    object QueryListaID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      Required = True
    end
    object QueryListaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object QueryListaHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object QueryListaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
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
    object QueryListaVR_TOTAL: TFMTBCDField
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
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
    object QueryListaBC_IMPOSTO: TFMTBCDField
      FieldName = 'BC_IMPOSTO'
      Origin = 'BC_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaVR_IMPOSTO: TFMTBCDField
      FieldName = 'VR_IMPOSTO'
      Origin = 'VR_IMPOSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryListaDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QueryListaNRO_BOMBA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_BOMBA'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryListaNRO_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRO_TANQUE'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QueryVendas: TFDQuery
    MasterFields = 'ID_VENDA'
    SQL.Strings = (
      'select vv.data,'
      '       cast(sum(vv.qtde) as FLOAT) as qtde,'
      '       cast(vv.vr_venda as FLOAT)  as vr_venda,'
      '       cast(sum(vv.vr_total) as FLOAT) as vr_total,'
      '       pp.descricao as ds_produto,'
      '       bb.numero    as nro_bomba,'
      '       tt.numero    as nro_tanque'
      'from tb_venda vv '
      'inner join tb_produto pp on pp.id_produto = vv.id_produto'
      'inner join tb_bomba   bb on bb.id_bomba   = vv.id_bomba'
      'inner join tb_tanque  tt on tt.id_tanque  = vv.id_tanque'
      
        'group by vv.data, vv.vr_venda, pp.descricao, bb.numero ,tt.numer' +
        'o'
      'order by vv.data')
    Left = 438
    Top = 177
  end
end
