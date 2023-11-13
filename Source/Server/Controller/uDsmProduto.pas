unit uDsmProduto;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  System.JSON, uDsmBase, uPostoServerInterface;

type
  TDsmProduto = class(TDsmBase)
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

uses
  RN_TB_PRODUTO;

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



