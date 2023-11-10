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
    object memBaseDS_PROD: TStringField
      FieldName = 'DS_PROD'
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
    object memTanqueConsDS_PROD: TStringField
      FieldName = 'DS_PROD'
      Size = 50
    end
    object memTanqueConsCAPACIDADE: TFMTBCDField
      FieldName = 'CAPACIDADE'
      Size = 0
    end
  end
  object FDStoredProcTaqueCons: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'TDsmBomba.ListTanques'
    Left = 720
    Top = 232
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
        Value = 
          '{"FDBS":{"Version":15,"Manager":{"UpdatesRegistry":true,"TableLi' +
          'st":[{"class":"Table","Name":"QueryTanqueCons","SourceName":"tb_' +
          'tanque","SourceID":1,"TabID":0,"EnforceConstraints":false,"Minim' +
          'umCapacity":50,"ColumnList":[{"class":"Column","Name":"ID_TANQUE' +
          '","SourceName":"ID_TANQUE","SourceID":1,"DataType":"Int32","Sear' +
          'chable":true,"AllowNull":true,"AutoInc":true,"Base":true,"AutoIn' +
          'crementSeed":-1,"AutoIncrementStep":-1,"OAllowNull":true,"OInUpd' +
          'ate":true,"OInWhere":true,"OInKey":true,"OAfterInsChanged":true,' +
          '"OriginTabName":"TB_TANQUE","OriginColName":"ID_TANQUE","SourceG' +
          'enerator":"G_ID_TANQUE"},{"class":"Column","Name":"ID_PRODUTO","' +
          'SourceName":"ID_PRODUTO","SourceID":2,"DataType":"Int32","Search' +
          'able":true,"Base":true,"OInUpdate":true,"OInWhere":true,"OriginT' +
          'abName":"TB_TANQUE","OriginColName":"ID_PRODUTO","SourceGenerato' +
          'r":"G_ID_TANQUE"},{"class":"Column","Name":"CAPACIDADE","SourceN' +
          'ame":"CAPACIDADE","SourceID":3,"DataType":"FmtBCD","Precision":1' +
          '8,"Scale":2,"Searchable":true,"AllowNull":true,"Base":true,"OAll' +
          'owNull":true,"OInUpdate":true,"OInWhere":true,"OriginTabName":"T' +
          'B_TANQUE","OriginColName":"CAPACIDADE","SourcePrecision":18,"Sou' +
          'rceScale":2,"SourceGenerator":"G_ID_TANQUE"},{"class":"Column","' +
          'Name":"NUMERO","SourceName":"NUMERO","SourceID":4,"DataType":"In' +
          't32","Searchable":true,"Base":true,"OInUpdate":true,"OInWhere":t' +
          'rue,"OriginTabName":"TB_TANQUE","OriginColName":"NUMERO","Source' +
          'Generator":"G_ID_TANQUE"},{"class":"Column","Name":"DS_PROD","So' +
          'urceName":"DS_PROD","SourceID":5,"DataType":"AnsiString","Size":' +
          '50,"Searchable":true,"AllowNull":true,"Default":true,"OAllowNull' +
          '":true,"OReadOnly":true,"OAfterInsChanged":true,"OAfterUpdChange' +
          'd":true,"OriginTabName":"TB_PRODUTO","OriginColName":"DESCRICAO"' +
          ',"SourceSize":50,"SourceGenerator":"G_ID_TANQUE"}],"ConstraintLi' +
          'st":[],"ViewList":[],"RowList":[{"RowID":0,"Original":{"ID_TANQU' +
          'E":1,"ID_PRODUTO":1,"CAPACIDADE":5000,"NUMERO":1,"DS_PROD":"GASO' +
          'LINA"}}]}],"RelationList":[],"UpdatesJournal":{"Changes":[]}}}}'
      end>
  end
end
