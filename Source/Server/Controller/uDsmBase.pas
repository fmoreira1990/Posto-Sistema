unit uDsmBase;

interface

uses System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer, Datasnap.DSAuth,
  uPostoServerInterface;

type
  TDsmBase = class(TDSServerModule)
  private
    { Private declarations }
    FBusiness: IBusiness;
    function GetBusiness: IBusiness;

    procedure SetBusiness(const Value: IBusiness);

  protected
    procedure AfterConstruction; override;
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

procedure TDsmBase.SetBusiness(const Value: IBusiness);
begin
  FBusiness := Value;
end;

end.



