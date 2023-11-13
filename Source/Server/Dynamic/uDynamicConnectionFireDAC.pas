unit uDynamicConnectionFireDAC;

interface

uses
  Classes,
  uPostoServerINterface,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBIN;

type
  TDynamicConnectionFireDAC = class(TInterfacedObject, IDynamicConnection)
  strict private
    FRefCount: integer;
  private
    FConnection: TFDConnection;
    function GetConnection: TFDConnection;
  protected
  public
    constructor Create;
    property Connection: TFDConnection read GetConnection;

  end;

implementation

uses
  System.SysUtils,
  FireDAC.Stan.Option;

constructor TDynamicConnectionFireDAC.Create;
begin
  inherited;
  FConnection := TFDConnection.Create(nil);
  FConnection.Name := 'Connection' + IntToStr(Random(100000));
  FConnection.LoginPrompt := False;
  FConnection.ResourceOptions.SilentMode := True;
  FConnection.ResourceOptions.AutoReconnect := True;
  FConnection.ResourceOptions.AutoConnect := True;
  FConnection.FetchOptions.Mode := fmAll;
  FConnection.FetchOptions.CursorKind := ckDefault;
  FConnection.FetchOptions.RowsetSize := 1000;
  FConnection.FetchOptions.DetailOptimize := False;
  FConnection.FormatOptions.StrsEmpty2Null := False;
  FConnection.UpdateOptions.CheckReadOnly := False;
  FConnection.TxOptions.AutoCommit := True;
  FConnection.ResourceOptions.DirectExecute := True;
  FConnection.UpdateOptions.FastUpdates := False;
  FConnection.Params.Add('DriverID=FB');
  FConnection.Params.Add('Database=D:\Posto-Sistema\POSTO.FDB');
  FConnection.Params.Add('Password=masterkey');
  FConnection.Params.Add('Server=localhost');
  FConnection.Params.Add('User_Name=SYSDBA');
end;

function TDynamicConnectionFireDAC.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.



