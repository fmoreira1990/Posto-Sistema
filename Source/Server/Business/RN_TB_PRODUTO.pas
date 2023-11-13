unit RN_TB_PRODUTO;

interface

uses
  Classes,
  RN_BASE,
  uPostoServerInterface;

type
  TRN_TB_PRODUTO = class(TRN_BASE, IBusinessTbProduto)
  strict private
  private
  protected
  public
    procedure AfterConstruction; override;

    function ListProdutos: TStream;
    function Produtos(const pIDProduto: integer): TStream;
    function updateProdutos(const AStream: TStream): Boolean;
  end;

implementation

uses
  uRN_TB_PRODUTO_DAO, System.SysUtils;

procedure TRN_TB_PRODUTO.AfterConstruction;
begin
  inherited;
  DAO := TRN_TB_PRODUTO_DAO.Create(nil);
end;

function TRN_TB_PRODUTO.ListProdutos: TStream;
begin
  Result := nil;
  try
    Result := List(DAO.QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_PRODUTO.Produtos(const pIDProduto: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIDProduto, DAO.QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_PRODUTO.updateProdutos(const AStream: TStream): Boolean;
begin
  Result := False;
  try
    Result := Update(AStream, DAO.FDSchemaAdapter);
  except on
    E: Exception do
      raise;
  end;
end;

end.



