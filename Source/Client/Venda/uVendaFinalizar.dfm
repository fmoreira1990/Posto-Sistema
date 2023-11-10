inherited VendaFinalizar: TVendaFinalizar
  Caption = 'VendaFinalizar'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 121
    Top = 99
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
  object Label2: TLabel
    Left = 121
    Top = 147
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
  object Label3: TLabel
    Left = 121
    Top = 195
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = -335
    ExplicitWidth = 970
    object Button1: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Action = acConcluir
      TabOrder = 0
    end
    object Button2: TButton
      Left = 97
      Top = 9
      Width = 75
      Height = 25
      Action = acCancelar
      TabOrder = 1
    end
  end
  object DBEdit1: TDBEdit
    Left = 272
    Top = 96
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
  object DBEdit2: TDBEdit
    Left = 272
    Top = 144
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
  object DBEdit3: TDBEdit
    Left = 272
    Top = 192
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
end
