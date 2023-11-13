unit RN_TB_TANQUE;

interface

uses
  Classes,
  RN_BASE,
  uPostoServerInterface;

type
  TRN_TB_TANQUE = class(TRN_BASE, IBusinessTbTanque)
  strict private
  private
  protected
  public
    procedure AfterConstruction; override;

    function Tanque(const pIdTanque: integer): TStream;
    function ListTanques: TStream;
    function updateTanques(const AStream: TStream): Boolean;
  end;

implementation

uses
  uRN_TB_TANQUE_DAO, System.SysUtils;

function TRN_TB_TANQUE.ListTanques: TStream;
begin
  Result := nil;
  try
    Result := List(DAO.QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_TB_TANQUE.updateTanques(const AStream: TStream): Boolean;
begin
  Result := False;
  try
    Result := Update(AStream, DAO.FDSchemaAdapter);
  except on
    E: Exception do
      raise;
  end;
end;

procedure TRN_TB_TANQUE.AfterConstruction;
begin
  inherited;
  DAO := TRN_TB_TANQUE_DAO.Create(nil);
end;

function TRN_TB_TANQUE.Tanque(const pIdTanque: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdTanque, DAO.QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

end.



