object PostoClientMain: TPostoClientMain
  Left = 0
  Top = 0
  Caption = 'Posto Fortes'
  ClientHeight = 561
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Posto Fortes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 41
    Width = 984
    Height = 520
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlCenter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowCaption = False
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Left = 320
    Top = 176
    object Sair1: TMenuItem
      Action = acSair
    end
    object Produtos1: TMenuItem
      Action = acProdutos
    end
    object Bombas1: TMenuItem
      Action = acBomba
    end
    object acTanque1: TMenuItem
      Action = acTanque
    end
    object Vender1: TMenuItem
      Action = acVendas
    end
    object RelatoriodeVendas1: TMenuItem
      Action = acRelatorios
    end
  end
  object ActionList: TActionList
    Left = 416
    Top = 176
    object acProdutos: TAction
      Caption = 'Produtos'
      OnExecute = acProdutosExecute
    end
    object acSair: TAction
      Caption = 'Sair'
      OnExecute = acSairExecute
    end
    object acBomba: TAction
      Caption = 'Bombas'
      OnExecute = acBombaExecute
    end
    object acTanque: TAction
      Caption = 'Tanque'
      OnExecute = acTanqueExecute
    end
    object acVendas: TAction
      Caption = 'Vender'
      OnExecute = acVendasExecute
    end
    object acRelatorios: TAction
      Caption = 'Relatorio de Vendas'
      OnExecute = acRelatoriosExecute
    end
  end
end
