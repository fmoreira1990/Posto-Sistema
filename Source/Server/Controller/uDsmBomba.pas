unit uDsmBomba;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.IBBase;

type
  TDsmBomba = class(TDsmBase)
    QueryListaID_BOMBA: TIntegerField;
    QueryListaID_TANQUE: TIntegerField;
    QueryListaNUMERO: TIntegerField;
    QueryTanqueCons: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListTanques: TStream;
    function ListBombas: TStream;
    function Bombas(const pIdBomba: integer): TStream;

    function updateBombas(const AStream: TStream): Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDsmBomba }

function TDsmBomba.Bombas(const pIdBomba: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdBomba, QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmBomba.ListBombas: TStream;
begin
  Result := nil;
  try
    Result := List(QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmBomba.ListTanques: TStream;
begin
  Result := nil;
  try
    Result := List(QueryTanqueCons);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmBomba.updateBombas(const AStream: TStream): Boolean;
begin
  Result := False;
  try
    Result := Update(AStream, FDSchemaAdapter);
  except on
    E: Exception do
      raise;
  end;
end;

end.



