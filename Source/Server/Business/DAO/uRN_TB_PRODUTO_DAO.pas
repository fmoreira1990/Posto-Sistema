unit uRN_TB_PRODUTO_DAO;

interface

uses
  System.SysUtils,
  System.Classes,
  uRN_BASE_DAO, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TRN_TB_PRODUTO_DAO = class(TRN_BASE_DAO)
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
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

