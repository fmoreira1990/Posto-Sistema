program PostoClient;

uses
  Vcl.Forms,
  uPostoClientMain in 'uPostoClientMain.pas' {PostoClientMain},
  uPostoClientCad in 'Base\uPostoClientCad.pas' {PostoClientCad},
  uPostoClientDAO in 'Base\uPostoClientDAO.pas' {PostoClientDAO: TDataModule},
  uPostoClientEdit in 'Base\uPostoClientEdit.pas' {PostoClientEdit},
  uProdutoCad in 'Produtos\uProdutoCad.pas' {ProdutoCad},
  uProdutoDAO in 'Produtos\uProdutoDAO.pas' {ProdutoDAO: TDataModule},
  uProdutoEdit in 'Produtos\uProdutoEdit.pas' {ProdutoEdit},
  uBaseIntf in 'Base\uBaseIntf.pas',
  uPostoBase in 'Base\uPostoBase.pas' {PostoBase},
  uBombaCad in 'Bomba\uBombaCad.pas' {BombaCad},
  uBombaDAO in 'Bomba\uBombaDAO.pas' {BombaDAO: TDataModule},
  uBombaEdit in 'Bomba\uBombaEdit.pas' {BombaEdit},
  uTanqueCad in 'Tanque\uTanqueCad.pas' {TanqueCad},
  uTanqueEdit in 'Tanque\uTanqueEdit.pas' {TanqueEdit},
  uTanqueDAO in 'Tanque\uTanqueDAO.pas' {TanqueDAO: TDataModule},
  uVenda in 'Venda\uVenda.pas' {Venda},
  uVendaDAO in 'Venda\uVendaDAO.pas' {VendaDAO: TDataModule},
  uVendaFinalizar in 'Venda\uVendaFinalizar.pas' {VendaFinalizar},
  uVendaRelatorio in 'Venda\uVendaRelatorio.pas' {VendaRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Posto Fortes - Sistema de Gest�o para Postos de Combust�veis';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPostoClientMain, PostoClientMain);
  Application.Run;
end.


