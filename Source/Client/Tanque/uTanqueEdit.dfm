inherited TanqueEdit: TTanqueEdit
  Caption = 'TanqueEdit'
  ClientHeight = 299
  ExplicitHeight = 338
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 67
    Width = 50
    Height = 13
    Caption = 'ID Tanque'
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 170
    Width = 99
    Height = 13
    Caption = 'Produto Arnazenado'
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 99
    Width = 56
    Height = 13
    Caption = 'Capacidade'
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 133
    Width = 91
    Height = 13
    Caption = 'Numero do Tanque'
  end
  object DBEdit1: TDBEdit [5]
    Left = 152
    Top = 64
    Width = 121
    Height = 21
    DataField = 'ID_TANQUE'
    DataSource = dsBase
    ReadOnly = True
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox [6]
    Left = 152
    Top = 166
    Width = 273
    Height = 21
    DataField = 'DS_PRODUTO'
    DataSource = dsBase
    KeyField = 'ID_PRODUTO'
    ListField = 'ID_PRODUTO;DESCRICAO'
    ListSource = dsProdCons
    TabOrder = 4
  end
  object DBEdit2: TDBEdit [7]
    Left = 152
    Top = 96
    Width = 121
    Height = 21
    DataField = 'CAPACIDADE'
    DataSource = dsBase
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [8]
    Left = 152
    Top = 130
    Width = 121
    Height = 21
    DataField = 'NUMERO'
    DataSource = dsBase
    TabOrder = 3
  end
  object dsProdCons: TDataSource
    DataSet = TanqueDAO.memProdCons
    Left = 528
    Top = 200
  end
end
