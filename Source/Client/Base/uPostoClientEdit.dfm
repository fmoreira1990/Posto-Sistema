inherited PostoClientEdit: TPostoClientEdit
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Edi'#231#227'o do Cadastro'
  ClientHeight = 400
  ClientWidth = 700
  ExplicitWidth = 716
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnSalvar: TButton
      Left = 21
      Top = 9
      Width = 75
      Height = 25
      Action = acSalvar
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 102
      Top = 9
      Width = 75
      Height = 25
      Action = acCancelar
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 464
    Top = 120
    object acSalvar: TAction
      Caption = 'Salvar'
      OnExecute = acSalvarExecute
      OnUpdate = acSalvarUpdate
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
      OnUpdate = acSalvarUpdate
    end
  end
  object dsBase: TDataSource
    Left = 464
    Top = 200
  end
end
