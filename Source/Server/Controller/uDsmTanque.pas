unit uDsmTanque;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Phys.IBBase;

type
  TDsmTanque = class(TDsmBase)
    QueryListaID_TANQUE: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaCAPACIDADE: TFMTBCDField;
    QueryListaNUMERO: TIntegerField;
  private
    { Private declarations }

  public
    { Public declarations }
    function Tanque(const pIdTanque: integer): TStream;
    function ListTanques: TStream;
    function updateTanques(const AStream: TStream): Boolean;

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDsmTanque.Tanque(const pIdTanque: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdTanque, QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmTanque.ListTanques: TStream;
begin
  Result := nil;
  try
    Result := List(QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmTanque.updateTanques(const AStream: TStream): Boolean;
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


