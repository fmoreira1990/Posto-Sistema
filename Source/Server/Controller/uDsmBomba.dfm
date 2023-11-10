inherited DsmBomba: TDsmBomba
  OldCreateOrder = True
  Height = 398
  Width = 787
  inherited Connection: TFDConnection
    Connected = True
  end
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
      '       pp.descricao as ds_prod'
      'from tb_bomba bb'
      'inner join tb_tanque  tt on tt.id_tanque  = bb.id_tanque'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto'
      'where id_bomba = :id_bomba')
    ParamData = <
      item
        Name = 'ID_BOMBA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Top = 208
  end
  inherited FDStanStorageBinLink1: TFDStanStorageBinLink
    Top = 112
  end
  inherited QueryLista: TFDQuery
    MasterFields = 'ID_BOMBA'
    SQL.Strings = (
      'select bb.*,'
      '       bb.numero as nro_bomba,'
      '       tt.numero as nro_tanque,'
      '       pp.id_produto,'
      '       pp.descricao as ds_prod,'
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
  end
  object QueryTanqueCons: TFDQuery
    Connection = Connection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'G_ID_TANQUE'
    UpdateOptions.UpdateTableName = 'TB_TANQUE'
    UpdateOptions.KeyFields = 'ID_TANQUE'
    UpdateOptions.AutoIncFields = 'ID_TANQUE'
    SQL.Strings = (
      'select tt.*,'
      '        pp.descricao as ds_prod'
      'from tb_tanque tt'
      'inner join tb_produto pp on pp.id_produto = tt.id_produto')
    Left = 544
    Top = 280
  end
end
