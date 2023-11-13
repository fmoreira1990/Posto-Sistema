unit RN_TB_VENDA;

interface

uses
  Classes,
  RN_BASE,
  uPostoServerInterface;

type
  TRN_TB_VENDA = class(TRN_BASE, IBusinessTbVenda)
  strict private
  private
  protected
  public
    procedure AfterConstruction; override;

    function ListVenda: TStream;
    function updateVendas(const AStream: TStream): Boolean;
    function Venda(const pIdVenda: integer): TStream;
    function RelatorioVendas: TStream;
  end;

implementation

uses
  uRN_TB_VENDA_DAO,
  System.SysUtils;

procedure TRN_TB_VENDA.AfterConstruction;
begin
  inherited;
  DAO := TRN_TB_VENDA_DAO.Create(nil);
end;

function TRN_TB_VENDA.ListVenda: TStream;
begin
  Result := nil;
  try
    Result := List(DAO.QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_VENDA.RelatorioVendas: TStream;
begin
  Result := nil;
  try
    Result := List((DAO as TRN_TB_VENDA_DAO).QueryVendas);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_VENDA.updateVendas(const AStream: TStream): Boolean;
begin
  Result := False;
  try
    Result := Update(AStream, DAO.FDSchemaAdapter);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_VENDA.Venda(const pIdVenda: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdVenda, DAO.QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

end.



