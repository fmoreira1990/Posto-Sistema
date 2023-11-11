inherited ProdutoEdit: TProdutoEdit
  Caption = 'Edi'#231#227'o - Cadastro de Produto'
  ClientWidth = 600
  ExplicitWidth = 616
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel [0]
    Left = 24
    Top = 67
    Width = 52
    Height = 13
    Caption = 'ID Produto'
  end
  object lbldescricao: TLabel [1]
    Left = 24
    Top = 107
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblVrVenda: TLabel [2]
    Left = 24
    Top = 147
    Width = 47
    Height = 13
    Caption = 'Vr. Venda'
  end
  object lblVrCusto: TLabel [3]
    Left = 24
    Top = 187
    Width = 45
    Height = 13
    Caption = 'Vr. Custo'
  end
  object lblQtdEstoque: TLabel [4]
    Left = 24
    Top = 227
    Width = 66
    Height = 13
    Caption = 'Qtde Estoque'
  end
  object lblPerImposto: TLabel [5]
    Left = 24
    Top = 267
    Width = 62
    Height = 13
    Caption = 'Per. Imposto'
  end
  inherited pnlTop: TPanel
    Width = 600
  end
  object EdtPerImposto: TDBEdit [7]
    Left = 152
    Top = 264
    Width = 121
    Height = 21
    DataField = 'PER_IMPOSTO'
    DataSource = dsBase
    TabOrder = 6
  end
  object edtdescricao: TDBEdit [8]
    Left = 152
    Top = 104
    Width = 121
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsBase
    TabOrder = 2
  end
  object edtVrVenda: TDBEdit [9]
    Left = 152
    Top = 144
    Width = 121
    Height = 21
    DataField = 'VR_VENDA'
    DataSource = dsBase
    TabOrder = 3
  end
  object edtVrCusto: TDBEdit [10]
    Left = 152
    Top = 184
    Width = 121
    Height = 21
    DataField = 'VR_CUSTO'
    DataSource = dsBase
    TabOrder = 4
  end
  object edtQtdEstoque: TDBEdit [11]
    Left = 152
    Top = 224
    Width = 121
    Height = 21
    DataField = 'QTDE_ESTOQUE'
    DataSource = dsBase
    TabOrder = 5
  end
  object EdtID: TDBEdit [12]
    Left = 152
    Top = 64
    Width = 121
    Height = 21
    DataField = 'ID_PRODUTO'
    DataSource = dsBase
    ReadOnly = True
    TabOrder = 1
  end
  inherited dsBase: TDataSource
    Left = 472
  end
end
