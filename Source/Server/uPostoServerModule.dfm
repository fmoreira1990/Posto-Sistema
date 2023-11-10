object PostoServerModule: TPostoServerModule
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer: TDSServer
    Left = 96
    Top = 11
  end
  object DSServerBase: TDSServerClass
    OnGetClass = DSServerBaseGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 200
    Top = 11
  end
  object DSServerProduto: TDSServerClass
    OnGetClass = DSServerProdutoGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 200
    Top = 104
  end
  object DSServerBomba: TDSServerClass
    OnGetClass = DSServerBombaGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 296
    Top = 104
  end
  object DSServerTanque: TDSServerClass
    OnGetClass = DSServerTanqueGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 296
    Top = 168
  end
  object DSServerVenda: TDSServerClass
    OnGetClass = DSServerVendaGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 200
    Top = 168
  end
end
