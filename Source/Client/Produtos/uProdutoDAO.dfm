inherited ProdutoDAO: TProdutoDAO
  OldCreateOrder = True
  Height = 367
  Width = 908
  inherited memBase: TFDMemTable
    MasterFields = 'ID_PRODUTO'
  end
  inherited tabBase: TFDTableAdapter
    UpdateTableName = 'tb_produto'
    DatSTableName = 'tb_produto'
  end
  inherited memLista: TFDMemTable
    MasterFields = 'ID_PRODUTO'
  end
  inherited FDStoredProcPost: TFDStoredProc
    StoredProcName = 'TDsmProduto.updateProdutos'
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
    StoredProcName = 'TDsmProduto.ListProdutos'
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftBlob
        ParamType = ptResult
      end>
  end
  inherited FDStoredProcConsultaUnique: TFDStoredProc
    StoredProcName = 'TDsmProduto.Produtos'
    ParamData = <
      item
        Name = 'pIDProduto'
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
end
