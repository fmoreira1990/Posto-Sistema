unit uProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, uBaseIntf;

type
  TProdutoCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    class function New: IView; override;
  end;

implementation

uses
  uProdutoDAO,
  uProdutoEdit;

{$R *.dfm}

{ TProdutoCad }

procedure TProdutoCad.AfterConstruction;
begin
  DAO := TProdutoDAO.New;
  PostoClientEdit := TProdutoEdit.New;

  inherited;
end;

class function TProdutoCad.New: IView;
begin
  Result := Self.Create;
end;

end.



