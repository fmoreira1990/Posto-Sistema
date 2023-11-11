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
  uDsmVenda in 'Controller\uDsmVenda.pas' {DsmVenda: TDSServerModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'Posto Fortes - Servidor de Aplicação';
  Application.CreateForm(TPostoServerMain, PostoServerMain);
  Application.Run;
end.

