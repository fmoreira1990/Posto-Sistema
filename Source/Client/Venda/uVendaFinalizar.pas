unit uVendaFinalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, uVendaDAO, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls;

type
  TVendaFinalizar = class(TPostoBase)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ActionList: TActionList;
    acCancelar: TAction;
    acConcluir: TAction;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dsBase: TDataSource;
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

uses
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TVendaFinalizar.acCancelarExecute(Sender: TObject);
begin
  inherited;
  if DAO.DoCancelar(TFDMemTable(dsbase.DataSet)) then
  begin
    ShowMessage('Venda abortada com sucesso!');
    Close;
  end;
end;

procedure TVendaFinalizar.acConcluirExecute(Sender: TObject);
begin
  inherited;
  if DAO.DoSalvar(TFDMemTable(dsbase.DataSet)) then
  begin
    ShowMessage('Venda concluída com sucesso!');
    Close;
  end;
end;

procedure TVendaFinalizar.DoShow;
begin
  inherited;
  if DBEdit1.CanFocus then
    DBEdit1.SetFocus;
end;

end.



