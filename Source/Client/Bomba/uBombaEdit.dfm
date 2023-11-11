inherited BombaEdit: TBombaEdit
  Caption = 'Edi'#231#227'o - Cadastro de Bombas'
  ClientWidth = 600
  ExplicitWidth = 616
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel [0]
    Left = 24
    Top = 67
    Width = 46
    Height = 13
    Caption = 'ID Bomba'
  end
  object lblTanque: TLabel [1]
    Left = 24
    Top = 135
    Width = 36
    Height = 13
    Caption = 'Tanque'
  end
  object lblNumero: TLabel [2]
    Left = 24
    Top = 99
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  inherited pnlTop: TPanel
    Width = 600
    ExplicitWidth = 600
  end
  object edtId: TDBEdit [4]
    Left = 152
    Top = 64
    Width = 121
    Height = 21
    DataField = 'ID_BOMBA'
    DataSource = dsBase
    ReadOnly = True
    TabOrder = 1
  end
  object edtlkbTanque: TDBLookupComboBox [5]
    Left = 152
    Top = 131
    Width = 250
    Height = 21
    DataField = 'NRO_TANQUE'
    DataSource = dsBase
    KeyField = 'ID_TANQUE'
    ListField = 'NUMERO;DS_PRODUTO'
    ListSource = dsTanque
    TabOrder = 3
  end
  object edtNumero: TDBEdit [6]
    Left = 152
    Top = 96
    Width = 121
    Height = 21
    DataField = 'NUMERO'
    DataSource = dsBase
    TabOrder = 2
  end
  object dsTanque: TDataSource
    DataSet = BombaDAO.memTanqueCons
    Left = 368
    Top = 200
  end
end
