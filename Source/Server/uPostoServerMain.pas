unit uPostoServerMain;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, IdGlobal, Web.HTTPApp,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TPostoServerMain = class(TForm)
    EditPort: TEdit;
    lblPort: TLabel;
    ApplicationEvents: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    TrayIcon: TTrayIcon;
    PopupMenuTray: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Iniciar1: TMenuItem;
    Parar1: TMenuItem;
    N2: TMenuItem;
    Fechar1: TMenuItem;
    ActionList: TActionList;
    acAbrir: TAction;
    acFechar: TAction;
    acIniciar: TAction;
    acParar: TAction;
    btnOpcoes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure acIniciarExecute(Sender: TObject);
    procedure acAbrirExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure acPararExecute(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  PostoServerMain: TPostoServerMain;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TPostoServerMain.acAbrirExecute(Sender: TObject);
begin
  Self.Show;
  Self.WindowState := wsNormal;
end;

procedure TPostoServerMain.acFecharExecute(Sender: TObject);
begin
  acParar.Execute;
  Application.Terminate;
end;

procedure TPostoServerMain.acIniciarExecute(Sender: TObject);
begin
  StartServer;
  acIniciar.Enabled := False;
  acParar.Enabled := True;
end;

procedure TPostoServerMain.acPararExecute(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
  acIniciar.Enabled := True;
  acParar.Enabled := False;
end;

procedure TPostoServerMain.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  EditPort.Enabled := not FServer.Active;
end;

procedure TPostoServerMain.btnOpcoesClick(Sender: TObject);
var
  pnt: TPoint;
begin
  if GetCursorPos(pnt) then
    PopupMenuTray.Popup(pnt.X, pnt.Y);
end;

procedure TPostoServerMain.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
    nil,
    PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TPostoServerMain.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TPostoServerMain.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TPostoServerMain.DoShow;
begin
  inherited;
  StartServer;
end;

procedure TPostoServerMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Self.Hide;
end;

procedure TPostoServerMain.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TPostoServerMain.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
    TrayIcon.Visible := True;
  end;
end;

procedure TPostoServerMain.TrayIconClick(Sender: TObject);
begin
  Self.Show;
  Self.WindowState := wsNormal;
end;

end.



