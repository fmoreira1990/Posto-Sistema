unit uVendaFinalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, uVendaDAO, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls;

type
  TVendaFinalizar = class(TPostoBase)
    pnlTop: TPanel;
    btnConcluir: TButton;
    btnCancelar: TButton;
    ActionList: TActionList;
    acCancelar: TAction;
    acConcluir: TAction;
    edtQtde: TDBEdit;
    lblQtde: TLabel;
    lblVrVenda: TLabel;
    lblVrTotal: TLabel;
    edtVrVenda: TDBEdit;
    edtVrTotal: TDBEdit;
    dsBase: TDataSource;
    lblProd: TLabel;
    dsBombas: TDataSource;
    lblBomba: TLabel;
    procedure acCancelarExecute(Sender: TObject);
    procedure acConcluirExecute(Sender: TObject);
  private
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

procedure TVendaFinalizar.acCancelarExecute(Sender: TObject);
begin
  inherited;
  if DAO.DoCancelar(dsbase.DataSet) then
  begin
    ShowMessage('Venda abortada com sucesso!');
    Close;
  end;
end;

procedure TVendaFinalizar.acConcluirExecute(Sender: TObject);
begin
  inherited;
  if DAO.DoSalvar(dsbase.DataSet) then
  begin
    ShowMessage('Venda concluída com sucesso!');
    Close;
  end;
end;

procedure TVendaFinalizar.DoShow;
begin
  inherited;
  lblProd.Caption := 'Combustível: ' + dsBombas.DataSet.FieldByName('DS_PRODUTO').AsString;
  lblBomba.Caption := 'Bomba: ' + dsBombas.DataSet.FieldByName('NRO_BOMBA').AsString;

  if edtQtde.CanFocus then
    edtQtde.SetFocus;
end;

end.



