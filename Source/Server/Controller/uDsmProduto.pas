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
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, uPostoServerInterface,
  RN_TB_PRODUTO;

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
  protected
    procedure AfterConstruction; override;
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

procedure TDsmProduto.AfterConstruction;
begin
  inherited;
  Business := TRN_TB_PRODUTO.New;
end;

function TDsmProduto.ListProdutos: TStream;
begin
  Result := (Business as IBusinessTbProduto).ListProdutos();
end;

function TDsmProduto.Produtos(const pIDProduto: integer): TStream;
begin
  Result := (Business as IBusinessTbProduto).Produtos(pIDProduto);
end;

function TDsmProduto.updateProdutos(const AStream: TStream): Boolean;
begin
  Result := (Business as IBusinessTbProduto).updateProdutos(AStream);
end;

end.



