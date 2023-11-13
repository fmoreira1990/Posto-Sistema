unit uPostoClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  uBaseIntf;

type
  TPostoClientMain = class(TForm)
    MainMenu: TMainMenu;
    ActionList: TActionList;
    acProdutos: TAction;
    Produtos1: TMenuItem;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    acSair: TAction;
    Sair1: TMenuItem;
    acBomba: TAction;
    Bombas1: TMenuItem;
    acTanque: TAction;
    acTanque1: TMenuItem;
    acVendas: TAction;
    Vender1: TMenuItem;
    acRelatorios: TAction;
    RelatoriodeVendas1: TMenuItem;
    procedure acProdutosExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acSairExecute(Sender: TObject);
    procedure acBombaExecute(Sender: TObject);
    procedure acTanqueExecute(Sender: TObject);
    procedure acVendasExecute(Sender: TObject);
    procedure acRelatoriosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure DoAbrirTela(pView: IView);
  public
    { Public declarations }
  end;

var
  PostoClientMain: TPostoClientMain;

implementation

uses
  uProdutoCad,
  uBombaCad,
  uTanqueCad,
  uVenda,
  uVendaRelatorio;

{$R *.dfm}

procedure TPostoClientMain.acBombaExecute(Sender: TObject);
var
  vView: IView;
begin
  vView := TBombaCad.New;

  DoAbrirTela(vView);
end;

procedure TPostoClientMain.acProdutosExecute(Sender: TObject);
var
  vView: IView;
begin
  vView := TProdutoCad.New;

  DoAbrirTela(vView);
end;

procedure TPostoClientMain.acRelatoriosExecute(Sender: TObject);
var
  vView: IView;
begin
  vView := TVendaRelatorio.New;
  (vView as TVendaRelatorio).DoExecuteReport;
end;

procedure TPostoClientMain.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TPostoClientMain.acTanqueExecute(Sender: TObject);
var
  vView: IView;
begin
  vView := TTanqueCad.New;

  DoAbrirTela(vView);
end;

procedure TPostoClientMain.acVendasExecute(Sender: TObject);
var
  vView: IView;
begin
  vView := TVenda.New;

  DoAbrirTela(vView);
end;

procedure TPostoClientMain.DoAbrirTela(pView: IView);
begin
  pView.SetOnCloseQuery(FormCloseQuery);

  if not pView.GetShowing then
    pView.ShowModal;
end;

procedure TPostoClientMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

end.



