inherited PostoClientCad: TPostoClientCad
  Caption = 'Cadastro Principal'
  ClientHeight = 419
  ClientWidth = 812
  Position = poOwnerFormCenter
  ExplicitWidth = 828
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 651
    object btnConsultar: TButton
      Left = 10
      Top = 10
      Width = 75
      Height = 25
      Action = acConsultar
      TabOrder = 0
    end
    object btnIncluir: TButton
      Left = 91
      Top = 10
      Width = 75
      Height = 25
      Action = acIncluir
      Caption = 'Incluir'
      TabOrder = 1
    end
    object btnEditar: TButton
      Left = 172
      Top = 10
      Width = 75
      Height = 25
      Action = acEditar
      TabOrder = 2
    end
    object btnExcluir: TButton
      Left = 253
      Top = 10
      Width = 75
      Height = 25
      Action = acExcluir
      TabOrder = 3
    end
    object btnFechar: TButton
      Left = 334
      Top = 10
      Width = 75
      Height = 25
      Action = acFechar
      TabOrder = 4
      Visible = False
    end
  end
  object Grid: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 806
    Height = 372
    Align = alClient
    DataSource = dsLista
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
  end
  object ActionList: TActionList
    Left = 248
    Top = 128
    object acConsultar: TAction
      Caption = 'Consultar'
      OnExecute = acConsultarExecute
    end
    object acEditar: TAction
      Caption = 'Editar'
      OnExecute = acEditarExecute
    end
    object acExcluir: TAction
      Caption = 'Excluir'
      OnExecute = acExcluirExecute
    end
    object acIncluir: TAction
      Caption = 'acIncluir'
      OnExecute = acIncluirExecute
    end
    object acFechar: TAction
      Caption = 'Fechar'
      OnExecute = acFecharExecute
    end
  end
  object dsLista: TDataSource
    DataSet = PostoClientDAO.memLista
    Left = 432
    Top = 200
  end
  object dsBase: TDataSource
    DataSet = PostoClientDAO.memBase
    Left = 432
    Top = 272
  end
end
