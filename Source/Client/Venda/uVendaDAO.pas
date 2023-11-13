unit uVendaDAO;

interface

uses
  System.SysUtils, System.Classes, uPostoClientDAO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.DS, FireDAC.Phys.DSDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FireDAC.Phys.TDBXBase,
  Data.DB, FireDAC.Comp.DataSet, uBaseIntf;

type
  TVendaDAO = class(TPostoClientDAO, IPostoClientDAO)
    memBombaCons: TFDMemTable;
    FDStoredProcBombaCons: TFDStoredProc;
  private
    { Private declarations }
  protected
    procedure DoChange(Sender: TField); override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
    class function New: IPostoClientDAO; override;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TVendaDAO }

procedure TVendaDAO.AfterConstruction;
begin
  inherited;
  DoConsultar(memBombaCons, FDStoredProcBombaCons);
end;

procedure TVendaDAO.DoChange(Sender: TField);
begin
  inherited;
  if Sender.DataSet = memBase then
  begin
    if Sender.FieldName.ToUpper = 'QTDE' then
    begin
      memBase.FieldByName('VR_TOTAL').AsFloat := memBase.FieldByName('QTDE').AsFloat * memBase.FieldByName('VR_VENDA').AsFloat;
    end
    else if Sender.FieldName.ToUpper = 'VR_TOTAL' then
    begin
      memBase.FieldByName('BC_IMPOSTO').AsFloat := memBase.FieldByName('VR_TOTAL').AsFloat;
    end
    else if Sender.FieldName.ToUpper = 'BC_IMPOSTO' then
    begin
      memBase.FieldByName('VR_IMPOSTO').AsFloat := memBase.FieldByName('BC_IMPOSTO').AsFloat * (memBase.FieldByName('PER_IMPOSTO').AsFloat / 100);
    end;
  end;
end;

class function TVendaDAO.New: IPostoClientDAO;
begin
  Result := Self.Create;
end;

end.



