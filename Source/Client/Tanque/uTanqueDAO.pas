unit uTanqueDAO;

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
  TTanqueDAO = class(TPostoClientDAO)
    memBaseID_TANQUE: TIntegerField;
    memBaseID_PRODUTO: TIntegerField;
    memBaseCAPACIDADE: TFMTBCDField;
    memBaseNUMERO: TIntegerField;
    memBaseDS_PRODUTO: TStringField;
    memProdCons: TFDMemTable;
    FDStoredProcProdCons: TFDStoredProc;
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

{ TTanqueDAO }

procedure TTanqueDAO.AfterConstruction;
begin
  inherited;
  DoConsultar(memProdCons, FDStoredProcProdCons);
end;

class function TTanqueDAO.New: IPostoClientDAO;
begin
  Result := Self.Create;
end;

end.

