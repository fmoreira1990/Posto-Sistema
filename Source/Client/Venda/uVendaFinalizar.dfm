inherited VendaFinalizar: TVendaFinalizar
  Caption = 'Fechamento da Venda - Posto Fortes'
  ClientHeight = 400
  ClientWidth = 600
  ExplicitWidth = 616
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  object lblQtde: TLabel
    Left = 121
    Top = 139
    Width = 103
    Height = 24
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVrVenda: TLabel
    Left = 121
    Top = 187
    Width = 136
    Height = 24
    Caption = 'Valor de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVrTotal: TLabel
    Left = 121
    Top = 235
    Width = 136
    Height = 24
    Caption = 'Total da Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblProd: TLabel
    Left = 16
    Top = 339
    Width = 39
    Height = 16
    Caption = 'lblProd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBomba: TLabel
    Left = 16
    Top = 358
    Width = 52
    Height = 16
    Caption = 'lblBomba'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 635
    object btnConcluir: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Action = acConcluir
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 97
      Top = 9
      Width = 75
      Height = 25
      Action = acCancelar
      TabOrder = 1
    end
  end
  object edtQtde: TDBEdit
    Left = 272
    Top = 136
    Width = 121
    Height = 32
    DataField = 'QTDE'
    DataSource = dsBase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtVrVenda: TDBEdit
    Left = 272
    Top = 184
    Width = 121
    Height = 32
    TabStop = False
    DataField = 'VR_VENDA'
    DataSource = dsBase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtVrTotal: TDBEdit
    Left = 272
    Top = 232
    Width = 121
    Height = 32
    TabStop = False
    DataField = 'VR_TOTAL'
    DataSource = dsBase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 504
    Top = 136
    object acCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
    object acConcluir: TAction
      Caption = 'Concluir - F12'
      ShortCut = 123
      OnExecute = acConcluirExecute
    end
  end
  object dsBase: TDataSource
    DataSet = VendaDAO.memBase
    Left = 416
    Top = 136
  end
  object dsBombas: TDataSource
    DataSet = VendaDAO.memBombaCons
    Left = 416
    Top = 208
  end
end
