unit uRN_TB_TANQUE_DAO;

interface

uses
  System.SysUtils,
  System.Classes,
  uRN_BASE_DAO,
  uPostoServerInterface,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait;

type
  TRN_TB_TANQUE_DAO = class(TRN_BASE_DAO)
    QueryListaID_TANQUE: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaCAPACIDADE: TFMTBCDField;
    QueryListaNUMERO: TIntegerField;
    QueryListaDS_PRODUTO: TStringField;
    QueryBaseID_TANQUE: TIntegerField;
    QueryBaseID_PRODUTO: TIntegerField;
    QueryBaseCAPACIDADE: TFMTBCDField;
    QueryBaseNUMERO: TIntegerField;
    QueryBaseDS_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.


