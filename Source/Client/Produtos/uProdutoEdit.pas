unit uProdutoEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientEdit, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, uProdutoDAO,
  Data.DB;

type
  TProdutoEdit = class(TPostoClientEdit)
    lblID: TLabel;
    lbldescricao: TLabel;
    lblVrVenda: TLabel;
    lblVrCusto: TLabel;
    lblQtdEstoque: TLabel;
    lblPerImposto: TLabel;
    EdtPerImposto: TDBEdit;
    edtdescricao: TDBEdit;
    edtVrVenda: TDBEdit;
    edtVrCusto: TDBEdit;
    edtQtdEstoque: TDBEdit;
    EdtID: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
