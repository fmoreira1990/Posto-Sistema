unit RN_BASE;

interface

uses
  Classes,
  uRN_BASE_DAO,
  FireDAC.Comp.Client,
  uPostoServerInterface;

type
  TRN_BASE = class(TInterfacedObject, IBusiness)
  strict private
    FRefCount: integer;
  private
    FDAO: TRN_BASE_DAO;
    function GetDAO: TRN_BASE_DAO;
    procedure SetDAO(const Value: TRN_BASE_DAO);
    function _AddRef: Integer;
    function _Release: Integer;
    function QueryInterface(const IID: TGUID; out Obj): HResult;

  protected

    function List(const pQuery: TFDQuery): TStream; virtual;
    function Unique(const pID: integer; const pQuery: TFDQuery): TStream; virtual;
    function Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean; virtual;
  public
    class function New: IBusiness; virtual;
    procedure BeforeDestruction; override;

    property DAO: TRN_BASE_DAO read GetDAO write SetDAO;
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  FireDAC.Stan.Intf;

function CopyStream(const AStream: TStream): TMemoryStream;
var
  LBuffer: TBytes;
  LCount: Integer;
begin
  Result := TMemoryStream.Create;
  try
    SetLength(LBuffer, 1024 * 32);
    while True do
    begin
      LCount := AStream.Read(LBuffer, Length(LBuffer));
      Result.Write(LBuffer, LCount);
      if LCount < Length(LBuffer) then
        break;
    end;
  except on
    E: Exception do
    begin
      Result.Free;
      raise;
    end;
  end;
end;

function TRN_BASE.List(const pQuery: TFDQuery): TStream;
begin
  try
    pQuery.Close;
    pQuery.Open;
    Result := TMemoryStream.Create;
    pQuery.SaveToStream(Result, TFDStorageFormat.sfJSON);
    Result.Position := 0;
  except on
    E: Exception do
      raise;
  end;
end;

class function TRN_BASE.New: IBusiness;
begin
  Result := Self.Create;
end;

function TRN_BASE.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TRN_BASE.SetDAO(const Value: TRN_BASE_DAO);
begin
  FDAO := Value;
end;

function TRN_BASE.Unique(const pID: integer; const pQuery: TFDQuery): TStream;
begin
  try
    pQuery.Close;
    pQuery.Params[0].AsInteger := pID;
    pQuery.Open;
    Result := TMemoryStream.Create;
    pQuery.SchemaAdapter.SaveToStream(Result, TFDStorageFormat.sfJSON);
    Result.Position := 0;
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_BASE.Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean;
var
  LMemStream: TMemoryStream;
begin
  try
    DAO.QueryBase.Close;
    LMemStream := CopyStream(AStream);
    LMemStream.Position := 0;
    try
      pSchemaAdapter.LoadFromStream(LMemStream, TFDStorageFormat.sfJSON);
      Result := pSchemaAdapter.ApplyUpdates = 0;
      if not Result then
        raise Exception.Create('Não foi possível salvar as alterações');

    finally
      LMemStream.Free;
    end;
  except on
    E: Exception do
      raise;
  end;
end;

function TRN_BASE._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount)
end;

function TRN_BASE._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if fRefCount = 0 then
    Destroy;
end;

procedure TRN_BASE.BeforeDestruction;
begin
  inherited;
  if Assigned(FDAO) then
    FreeAndNil(FDAO);
end;

function TRN_BASE.GetDAO: TRN_BASE_DAO;
begin
  Result := FDAO;
end;

end.



