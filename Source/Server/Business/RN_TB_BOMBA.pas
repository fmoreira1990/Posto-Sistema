unit RN_TB_BOMBA;

interface

uses
  Classes,
  RN_BASE,
  uPostoServerInterface;

type
  TRN_TB_BOMBA = class(TRN_BASE, IBusinessTbBomba)
  strict private
  private
  protected
  public
    procedure AfterConstruction; override;

    function ListBombas: TStream;
    function Bombas(const pIdBomba: integer): TStream;
    function updateBombas(const AStream: TStream): Boolean;
  end;

implementation

uses
  uRN_TB_BOMBA_DAO, System.SysUtils;

function TRN_TB_BOMBA.ListBombas: TStream;
begin
  Result := nil;
  try
    Result := List(DAO.QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_BOMBA.updateBombas(const AStream: TStream): Boolean;
begin
  Result := False;
  try
    Result := Update(AStream, DAO.FDSchemaAdapter);
  except on
    E: Exception do
      raise;
  end;
end;

procedure TRN_TB_BOMBA.AfterConstruction;
begin
  inherited;
  DAO := TRN_TB_BOMBA_DAO.Create(nil);
end;

function TRN_TB_BOMBA.Bombas(const pIdBomba: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdBomba, DAO.QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

end.



