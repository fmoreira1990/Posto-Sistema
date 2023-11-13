unit uProdutoDAO;

interface

uses
  System.SysUtils, System.Classes, uPostoClientDAO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.Stan.Async,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.DS, FireDAC.Phys.DSDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FireDAC.Phys.TDBXBase,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uBaseIntf;

type
  TProdutoDAO = class(TPostoClientDAO)
  private
  protected
    { Private declarations }

  public
    { Public declarations }
    class function New: IPostoClientDAO; override;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TProdutoDAO }

class function TProdutoDAO.New: IPostoClientDAO;
begin
  Result := Self.Create;
end;

end.
