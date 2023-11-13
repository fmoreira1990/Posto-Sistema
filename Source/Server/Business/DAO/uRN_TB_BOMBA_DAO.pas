unit uRN_TB_BOMBA_DAO;

interface

uses
  System.SysUtils, System.Classes, uRN_BASE_DAO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TRN_TB_BOMBA_DAO = class(TRN_BASE_DAO)
    QueryBaseID_BOMBA: TFDAutoIncField;
    QueryBaseID_TANQUE: TIntegerField;
    QueryBaseNUMERO: TIntegerField;
    QueryBaseNRO_BOMBA: TIntegerField;
    QueryBaseNRO_TANQUE: TIntegerField;
    QueryBaseDS_PRODUTO: TStringField;
    QueryListaID_BOMBA: TIntegerField;
    QueryListaID_TANQUE: TIntegerField;
    QueryListaNUMERO: TIntegerField;
    QueryListaNRO_BOMBA: TIntegerField;
    QueryListaNRO_TANQUE: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaDS_PRODUTO: TStringField;
    QueryListaVR_VENDA: TFMTBCDField;
    QueryListaVR_CUSTO: TFMTBCDField;
    QueryListaPER_IMPOSTO: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
