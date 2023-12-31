inherited VendaDAO: TVendaDAO
  OldCreateOrder = True
  Height = 382
  Width = 946
  inherited memLista: TFDMemTable
    MasterFields = 'ID_VENDA'
    FormatOptions.AssignedValues = [fvRound2Scale]
    FormatOptions.Round2Scale = True
  end
  inherited FDStoredProcPost: TFDStoredProc
    StoredProcName = 'TDsmVenda.updateVendas'
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
    StoredProcName = 'TDsmVenda.RelatorioVendas'
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
  inherited FDStoredProcConsultaUnique: TFDStoredProc
    StoredProcName = 'TDsmVenda.Venda'
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
  object memBombaCons: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 232
  end
  object FDStoredProcBombaCons: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'TDsmBomba.ListBombas'
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
