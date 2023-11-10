unit uProduto;

interface

type
  TProduto = class

  strict private
    FIdProduto: integer;
    FVrVenda: Double;
    FPerImposto: Double;
    FQtdeEstoque: Double;
    FVrCusto: Double;

  private
    function GetIdProduto: integer;
    function GetVrVenda: Double;
    function GetPerImposto: Double;
    function GetQtdeEstoque: Double;
    function GetVrCusto: Double;

    procedure SetIdProduto(const Value: integer);
    procedure SetVrvenda(const Value: Double);
    procedure SetPerImposto(const Value: Double);
    procedure SetQtdeEstoque(const Value: Double);
    procedure SetVrCusto(const Value: Double);

  published
    property IdProduto: integer read GetIdProduto write SetIdProduto;
    property VrVenda: Double read GetVrVenda write SetVrvenda;
    property VrCusto: Double read GetVrCusto write SetVrCusto;
    property QtdeEstoque: Double read GetQtdeEstoque write SetQtdeEstoque;
    property PerImposto: Double read GetPerImposto write SetPerImposto;
  end;

implementation

{ TProduto }

function TProduto.GetIdProduto: integer;
begin
  Result := FIdProduto;
end;

function TProduto.GetPerImposto: Double;
begin
  Result := FPerImposto;
end;

function TProduto.GetQtdeEstoque: Double;
begin
  Result := FQtdeEstoque;
end;

function TProduto.GetVrCusto: Double;
begin
  Result := FVrCusto;
end;

function TProduto.GetVrVenda: Double;
begin
  Result := FVrVenda;
end;

procedure TProduto.SetIdProduto(const Value: integer);
begin
  FIdProduto := Value;
end;

procedure TProduto.SetPerImposto(const Value: Double);
begin
  FPerImposto := Value;
end;

procedure TProduto.SetQtdeEstoque(const Value: Double);
begin
  FQtdeEstoque := Value;
end;

procedure TProduto.SetVrCusto(const Value: Double);
begin
  FVrCusto := Value;
end;

procedure TProduto.SetVrvenda(const Value: Double);
begin
  FVrVenda := Value;
end;

end.



