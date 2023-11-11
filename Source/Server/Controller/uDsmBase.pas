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
  FireDAC.Stan.StorageJSON;

type
  TDsmBase = class(TDSServerModule)
    Connection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    QueryBase: TFDQuery;
    FDSchemaAdapter: TFDSchemaAdapter;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    QueryLista: TFDQuery;
    procedure FDSchemaAdapterReconcileRow(ASender: TObject; ARow: TFDDatSRow;
      var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  protected
    function List(const pQuery: TFDQuery): TStream; virtual;
    function Unique(const pID: integer; const pQuery: TFDQuery): TStream; virtual;
    function Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean; virtual;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{$R *.dfm}

uses System.StrUtils;

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

function TDsmBase.EchoString(Value: string): string;
begin
  Result := Value;
end;

procedure TDsmBase.FDSchemaAdapterReconcileRow(ASender: TObject; ARow: TFDDatSRow; var Action: TFDDAptReconcileAction);
var
  oErr: EFDException;
  oExc: EFDDBEngineException;
begin
  inherited;
  oErr := ARow.RowError;
  if oErr <> nil then
  begin
    if oErr is EFDDBEngineException then
    begin
      oExc := EFDDBEngineException(oErr);
      // [FireDAC][Phys][PG]-312. Exact update affected [0] rows, while [1] was requested // tentando deletar no banco de dados registro que foi inserido no fdquery e depois deletado, na verdade, nunca existiu no bd e da essa exception.
      if not (oExc.ErrorCode = 312) then
        raise Exception.Create(oExc.Message + char(13) + char(13) + 'SQL: ' + oExc.SQL + char(13) + 'Parametros: ' + oExc.Params.Text);
    end;
  end;
end;

function TDsmBase.List(const pQuery: TFDQuery): TStream;
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

function TDsmBase.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TDsmBase.Unique(const pID: integer; const pQuery: TFDQuery): TStream;
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

function TDsmBase.Update(const AStream: TStream; const pSchemaAdapter: TFDSchemaAdapter): Boolean;
var
  LMemStream: TMemoryStream;
begin
  try
    QueryBase.Close;
    LMemStream := CopyStream(AStream);
    LMemStream.Position := 0;
    try
      pSchemaAdapter.LoadFromStream(LMemStream, TFDStorageFormat.sfJSON);
      Result := pSchemaAdapter.ApplyUpdates = 0;
      if not Result then
        raise Exception.Create('N�o foi poss�vel salvar as altera��es');

    finally
      LMemStream.Free;
    end;
  except on
    E: Exception do
      raise;
  end;
end;

end.



