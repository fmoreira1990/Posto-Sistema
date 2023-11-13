unit uRN_TB_TANQUE_DAO;

interface

uses
  System.SysUtils,
  System.Classes,
  uRN_BASE_DAO, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

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


