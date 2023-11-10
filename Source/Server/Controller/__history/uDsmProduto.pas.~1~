unit uDsmProduto;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, System.JSON, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TDsmProduto = class(TDsmBase)
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaVR_VENDA: TFMTBCDField;
    QueryListaVR_CUSTO: TFMTBCDField;
    QueryListaQTDE_ESTOQUE: TFMTBCDField;
    QueryListaPER_IMPOSTO: TFMTBCDField;
    QueryListaDESCRICAO: TStringField;
    QueryBaseID_PRODUTO: TIntegerField;
    QueryBaseVR_VENDA: TFMTBCDField;
    QueryBaseVR_CUSTO: TFMTBCDField;
    QueryBaseQTDE_ESTOQUE: TFMTBCDField;
    QueryBasePER_IMPOSTO: TFMTBCDField;
    QueryBaseDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListProdutos: TStream;
    function Produtos(const pIDProduto: integer): TStream;

    function updateProdutos(const AStream: TStream): Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDsmProduto }

function TDsmProduto.ListProdutos: TStream;
begin
  Result := nil;
  try
    Result := List(QueryLista);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmProduto.Produtos(const pIDProduto: integer): TStream;
begin
  Result := nil;
  try
    Result := Unique(pIDProduto, QueryBase);
  except on
    E: Exception do
      raise;
  end;
end;

function TDsmProduto.updateProdutos(const AStream: TStream): Boolean;
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



