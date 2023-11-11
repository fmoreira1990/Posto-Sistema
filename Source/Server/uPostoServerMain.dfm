object PostoServerMain: TPostoServerMain
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Servidor de Aplica'#231#227'o - Posto Fortes'
  ClientHeight = 235
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenuTray
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPort: TLabel
    Left = 8
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object EditPort: TEdit
    Left = 8
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 8
    Top = 8
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 1
    OnClick = ButtonOpenBrowserClick
  end
  object btnOpcoes: TButton
    Left = 120
    Top = 8
    Width = 107
    Height = 25
    Caption = 'Op'#231#245'es'
    DropDownMenu = PopupMenuTray
    TabOrder = 2
    OnClick = btnOpcoesClick
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 256
    Top = 24
  end
  object TrayIcon: TTrayIcon
    PopupMenu = PopupMenuTray
    OnClick = TrayIconClick
    Left = 291
    Top = 80
  end
  object PopupMenuTray: TPopupMenu
    Left = 291
    Top = 144
    object Abrir1: TMenuItem
      Action = acAbrir
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Iniciar1: TMenuItem
      Action = acIniciar
    end
    object Parar1: TMenuItem
      Action = acParar
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Fechar1: TMenuItem
      Action = acFechar
    end
  end
  object ActionList: TActionList
    Left = 192
    Top = 144
    object acAbrir: TAction
      Caption = 'Abrir'
      OnExecute = acAbrirExecute
    end
    object acFechar: TAction
      Caption = 'Fechar'
      OnExecute = acFecharExecute
    end
    object acIniciar: TAction
      Caption = 'Iniciar'
      OnExecute = acIniciarExecute
    end
    object acParar: TAction
      Caption = 'Parar'
      OnExecute = acPararExecute
    end
  end
end
