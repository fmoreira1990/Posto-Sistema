unit uDynamicFactory;

interface

uses
  Classes,
  uPostoServerInterface;

type
  TDynamicFactory = class(TInterfacedObject, IDynamicFactory)
  strict private
    FRefCount: integer;
    FConnection: IDynamicConnection;
  private
    function NewConnection: IDynamicConnection;

  public
    class function New: IDynamicFactory; virtual;

  end;

implementation

uses
  uDynamicConnectionFireDAC;

class function TDynamicFactory.New: IDynamicFactory;
begin
  Result := Self.Create;
end;

function TDynamicFactory.NewConnection: IDynamicConnection;
begin
  if not Assigned(FConnection) then
    FConnection := TDynamicConnectionFireDAC.Create();
  Result := FConnection;
end;

end.



