unit uRN_TB_VENDA_DAO;

interface

uses
  System.SysUtils,
  System.Classes,
  uRN_BASE_DAO, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TRN_TB_VENDA_DAO = class(TRN_BASE_DAO)
    QueryVendas: TFDQuery;
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
    QueryListaID_VENDA: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaID_TANQUE: TIntegerField;
    QueryListaID_BOMBA: TIntegerField;
    QueryListaDATA: TDateField;
    QueryListaHORA: TTimeField;
    QueryListaQTDE: TFMTBCDField;
    QueryListaVR_VENDA: TFMTBCDField;
    QueryListaVR_CUSTO: TFMTBCDField;
    QueryListaVR_TOTAL: TFMTBCDField;
    QueryListaPER_IMPOSTO: TFMTBCDField;
    QueryListaBC_IMPOSTO: TFMTBCDField;
    QueryListaVR_IMPOSTO: TFMTBCDField;
    QueryListaDS_PRODUTO: TStringField;
    QueryListaNRO_BOMBA: TIntegerField;
    QueryListaNRO_TANQUE: TIntegerField;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRN_TB_VENDA_DAO }

procedure TRN_TB_VENDA_DAO.AfterConstruction;
begin
  inherited;
  QueryVendas.Connection := DynamicFactory.NewConnection.Connection;
end;

end.

