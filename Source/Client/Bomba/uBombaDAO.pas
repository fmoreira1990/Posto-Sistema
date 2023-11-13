unit uBombaDAO;

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
  TBombaDAO = class(TPostoClientDAO)
    memTanqueCons: TFDMemTable;
    FDStoredProcTaqueCons: TFDStoredProc;
    memTanqueConsID_TANQUE: TIntegerField;
    memBaseID_TANQUE: TIntegerField;
    memBaseID_BOMBA: TIntegerField;
    memBaseNUMERO: TIntegerField;
    memTanqueConsID_PRODUTO: TIntegerField;
    memTanqueConsNUMERO: TIntegerField;
    memTanqueConsDS_PRODUTO: TStringField;
    memTanqueConsCAPACIDADE: TFMTBCDField;
    memBaseNRO_BOMBA: TIntegerField;
    memBaseNRO_TANQUE: TIntegerField;
    memBaseDS_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    class function New: IPostoClientDAO; override;
  end;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TBombaDAO }

procedure TBombaDAO.AfterConstruction;
begin
  inherited;
  DoConsultar(memTanqueCons, FDStoredProcTaqueCons);
end;

class function TBombaDAO.New: IPostoClientDAO;
begin
  Result := Self.Create;
end;

end.



