unit uDsmBase;

interface

uses System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer, Datasnap.DSAuth,
  uPostoServerInterface, FireDAC.Comp.Client;

type
  TDsmBase = class(TDSServerModule)
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



