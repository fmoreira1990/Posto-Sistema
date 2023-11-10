unit uDsmVenda;

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
  TDsmVenda = class(TDsmBase)
    QueryBaseID_VENDA: TIntegerField;
    QueryBaseID_PRODUTO: TIntegerField;
    QueryBaseID_TANQUE: TIntegerField;
    QueryBaseID_BOMBA: TIntegerField;
    QueryBaseDATA: TDateField;
    QueryBaseHORA: TTimeField;
    QueryBaseQTDE: TFMTBCDField;
    QueryBaseVR_VENDA: TFMTBCDField;
    QueryBaseVR_CUSTO: TFMTBCDField;
    QueryBaseVR_TOTAL: TFMTBCDField;
    QueryBasePER_IMPOSTO: TFMTBCDField;
    QueryBaseBC_IMPOSTO: TFMTBCDField;
    QueryBaseVR_IMPOSTO: TFMTBCDField;
    QueryBaseDS_PRODUTO: TStringField;
    QueryBaseNRO_BOMBA: TIntegerField;
    QueryBaseNRO_TANQUE: TIntegerField;
    FDVendas: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListVenda: TStream;
    function updateVendas(const AStream: TStream): Boolean;
    function Venda(const pIdTanque: integer): TStream;
    function RelatorioVendas: TStream;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDsmVenda.Venda(const pIdTanque: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIdTanque, QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmVenda.ListVenda: TStream;
begin
  Result := nil;
  try
    Result := List(QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmVenda.RelatorioVendas: TStream;
begin
  Result := nil;
  try
    Result := List(FDVendas);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmVenda.updateVendas(const AStream: TStream): Boolean;
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


