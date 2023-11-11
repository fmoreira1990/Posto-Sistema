unit uPostoClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  uBaseIntf,
  uPostoBase,
  uPostoClientDAO;

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
    FViewReport: IView;
    { Private declarations }
    procedure DoAbrirTela(pView: IView; pDAO: IPostoClientDAO);
  public
    { Public declarations }

  end;

var
  PostoClientMain: TPostoClientMain;

implementation

uses
  uProdutoCad,
  uProdutoDAO,
  uBombaCad,
  uBombaDAO,
  uTanqueCad,
  uTanqueDAO,
  uVenda,
  uVendaDAO,
  uVendaRelatorio;

{$R *.dfm}

procedure TPostoClientMain.acBombaExecute(Sender: TObject);
var
  vView: IView;
  vDao: IPostoClientDAO;
begin
  vView := TBombaCad.Create;
  vDao := TBombaDAO.Create;

  DoAbrirTela(vView, vDao);
end;

procedure TPostoClientMain.acProdutosExecute(Sender: TObject);
var
  vView: IView;
  vDao: IPostoClientDAO;
begin
  vView := TProdutoCad.Create;
  vDao := TProdutoDAO.Create;

  DoAbrirTela(vView, vDao);
end;

procedure TPostoClientMain.acRelatoriosExecute(Sender: TObject);
begin
  FViewReport := TVendaRelatorio.Create;
  FViewReport.DAO := TVendaDAO.Create;
  (FViewReport as TVendaRelatorio).DoExecuteReport;
end;

procedure TPostoClientMain.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TPostoClientMain.acTanqueExecute(Sender: TObject);
var
  vView: IView;
  vDao: IPostoClientDAO;
begin
  vView := TTanqueCad.Create;
  vDao := TTanqueDAO.Create;

  DoAbrirTela(vView, vDao);
end;

procedure TPostoClientMain.acVendasExecute(Sender: TObject);
var
  vView: IView;
  vDao: IPostoClientDAO;
begin
  vView := TVenda.Create;
  vDao := TVendaDAO.Create;

  DoAbrirTela(vView, vDao);
end;

procedure TPostoClientMain.DoAbrirTela(pView: IView; pDAO: IPostoClientDAO);
begin
  pView.DAO := pDAO;
  pView.SetOnCloseQuery(FormCloseQuery);

  if not pView.GetShowing then
    pView.ShowModal;
end;

procedure TPostoClientMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

end.



