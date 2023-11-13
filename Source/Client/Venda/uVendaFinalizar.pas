unit uVendaFinalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, uBaseIntf;

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
    { Private declarations }
  protected
    procedure DoShow; override;
  public
    { Public declarations }
    class function New: IView; override;
    procedure Inicializar; override;


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

procedure TVendaFinalizar.Inicializar;
begin
  inherited;
  dsBombas.DataSet := DAO.DataSet['memBombaCons'];
  dsBase.DataSet := DAO.DataSet['memBase'];
end;

class function TVendaFinalizar.New: IView;
begin
  Result := Self.Create;
end;

end.



