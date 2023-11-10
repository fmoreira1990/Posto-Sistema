unit uProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, uProdutoDAO, uProdutoEdit;

type
  TProdutoCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;

    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TProdutoCad }

procedure TProdutoCad.AfterConstruction;
begin
  if not Assigned(FPostoClientEdit) then
  begin
    FPostoClientEdit := TProdutoEdit.Create();
  end;

  inherited;
end;

end.


