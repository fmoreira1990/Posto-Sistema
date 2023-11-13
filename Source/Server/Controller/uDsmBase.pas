unit uDsmBase;

interface

uses System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, uPostoServerInterface;

type
  TDsmBase = class(TDSServerModule)
    QueryBase: TFDQuery;
    FDSchemaAdapter: TFDSchemaAdapter;
    QueryLista: TFDQuery;
    FDConnection1: TFDConnection;
    FDStanStorageJSONLink2: TFDStanStorageJSONLink;
    FDStanStorageBinLink2: TFDStanStorageBinLink;
  private
    { Private declarations }
    FBusiness: IBusiness;
    function GetBusiness: IBusiness;

    procedure SetBusiness(const Value: IBusiness);

  protected
    procedure AfterConstruction; override;
    function List(const pQuery: TFDQuery): TStream; virtual;
    function Unique(const pID: integer; const pQuery: TFDQuery): TStream; virtual;
    function Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean; virtual;
  public
    property Business: IBusiness read GetBusiness write SetBusiness;

  end;

implementation

{$R *.dfm}

uses System.StrUtils, uDynamicFactory;

procedure TDsmBase.AfterConstruction;
begin
  inherited;

end;

function TDsmBase.GetBusiness: IBusiness;
begin
  Result := FBusiness;
end;

function TDsmBase.List(const pQuery: TFDQuery): TStream;
begin
  // classes filhas
end;

procedure TDsmBase.SetBusiness(const Value: IBusiness);
begin
  FBusiness := Value;
end;

function TDsmBase.Unique(const pID: integer; const pQuery: TFDQuery): TStream;
begin
  // classes filhas
end;

function TDsmBase.Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean;
begin
  // classes filhas
end;

end.



