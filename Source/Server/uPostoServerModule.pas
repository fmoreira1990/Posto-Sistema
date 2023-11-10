unit uPostoServerModule;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TPostoServerModule = class(TDataModule)
    DSServer: TDSServer;
    DSServerBase: TDSServerClass;
    DSServerProduto: TDSServerClass;
    DSServerBomba: TDSServerClass;
    DSServerTanque: TDSServerClass;
    DSServerVenda: TDSServerClass;
    procedure DSServerBaseGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerProdutoGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerBombaGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerTanqueGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerVendaGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

function DSServer: TDSServer;

implementation

{$R *.dfm}

uses
  uDsmBase,
  uDsmProduto,
  uDsmBomba,
  uDsmTanque,
  uDsmVenda;

var
  FModule: TComponent;
  FDSServer: TDSServer;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

constructor TPostoServerModule.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer;
end;

destructor TPostoServerModule.Destroy;
begin
  inherited;
  FDSServer := nil;
end;

procedure TPostoServerModule.DSServerBaseGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uDsmBase.TDsmBase;
end;

procedure TPostoServerModule.DSServerBombaGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uDsmBomba.TDsmBomba;
end;

procedure TPostoServerModule.DSServerProdutoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uDsmProduto.TDsmProduto;
end;

procedure TPostoServerModule.DSServerTanqueGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uDsmTanque.TDsmTanque;
end;

procedure TPostoServerModule.DSServerVendaGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uDsmVenda.TDsmVenda;
end;

initialization
  FModule := TPostoServerModule.Create(nil);
finalization
  FModule.Free;
end.



