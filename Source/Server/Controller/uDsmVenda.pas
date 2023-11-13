unit uDsmVenda;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  uDsmBase;

type
  TDsmVenda = class(TDsmBase)
  private
    { Private declarations }
  protected
    procedure AfterConstruction; override;
  public
    { Public declarations }

    function ListVenda: TStream;
    function updateVendas(const AStream: TStream): Boolean;
    function Venda(const pIdVenda: integer): TStream;
    function RelatorioVendas: TStream;
  end;

implementation

uses
  RN_TB_VENDA,
  uPostoServerInterface;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDsmVenda.Venda(const pIdVenda: integer): TStream;
begin
  Result := (Business as IBusinessTbVenda).Venda(pIdVenda);
end;

procedure TDsmVenda.AfterConstruction;
begin
  inherited;
  Business := TRN_TB_VENDA.New;
end;

function TDsmVenda.ListVenda: TStream;
begin
  Result := (Business as IBusinessTbVenda).ListVenda;
end;

function TDsmVenda.RelatorioVendas: TStream;
begin
  Result := (Business as IBusinessTbVenda).RelatorioVendas;
end;

function TDsmVenda.updateVendas(const AStream: TStream): Boolean;
begin
  Result := (Business as IBusinessTbVenda).updateVendas(AStream);
end;

end.



