unit uDsmVenda;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON;

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



