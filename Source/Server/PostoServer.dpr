program PostoServer;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uPostoServerMain in 'uPostoServerMain.pas' {PostoServerMain},
  uDsmBase in 'Controller\uDsmBase.pas' {DsmBase: TDSServerModule},
  uPostoServerModule in 'uPostoServerModule.pas' {PostoServerModule: TDataModule},
  uPostoWebModule in 'uPostoWebModule.pas' {PostoWebModule: TWebModule},
  uDsmProduto in 'Controller\uDsmProduto.pas' {DsmProduto: TDSServerModule},
  uDsmBomba in 'Controller\uDsmBomba.pas' {DsmBomba: TDSServerModule},
  uDsmTanque in 'Controller\uDsmTanque.pas' {DsmTanque: TDSServerModule},
  uDsmVenda in 'Controller\uDsmVenda.pas' {DsmVenda: TDSServerModule},
  uPostoServerInterface in 'uPostoServerInterface.pas',
  uDynamicFactory in 'Dynamic\uDynamicFactory.pas',
  uDynamicConnectionFireDAC in 'Dynamic\uDynamicConnectionFireDAC.pas',
  RN_TB_BOMBA in 'Business\RN_TB_BOMBA.pas',
  RN_BASE in 'Business\RN_BASE.pas',
  uRN_BASE_DAO in 'Business\DAO\uRN_BASE_DAO.pas' {RN_BASE_DAO: TDataModule},
  uRN_TB_BOMBA_DAO in 'Business\DAO\uRN_TB_BOMBA_DAO.pas' {RN_TB_BOMBA_DAO: TDataModule},
  RN_TB_TANQUE in 'Business\RN_TB_TANQUE.pas',
  uRN_TB_TANQUE_DAO in 'Business\DAO\uRN_TB_TANQUE_DAO.pas' {RN_TB_TANQUE_DAO: TDataModule},
  RN_TB_PRODUTO in 'Business\RN_TB_PRODUTO.pas',
  uRN_TB_PRODUTO_DAO in 'Business\DAO\uRN_TB_PRODUTO_DAO.pas' {RN_TB_PRODUTO_DAO: TDataModule},
  uRN_TB_VENDA_DAO in 'Business\DAO\uRN_TB_VENDA_DAO.pas' {RN_TB_VENDA_DAO: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'Posto Fortes - Servidor de Aplicação';
  Application.CreateForm(TPostoServerMain, PostoServerMain);
  Application.CreateForm(TRN_TB_VENDA_DAO, RN_TB_VENDA_DAO);
  Application.Run;
end.

