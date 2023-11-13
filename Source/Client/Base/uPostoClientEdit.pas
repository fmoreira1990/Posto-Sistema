unit uPostoClientEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, uPostoBase, uBaseIntf;

type
  TPostoClientEdit = class(TPostoBase)
    ActionList: TActionList;
    acSalvar: TAction;
    acCancelar: TAction;
    pnlTop: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    dsBase: TDataSource;
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acSalvarUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function New: IView; override;
    procedure Inicializar; override;
  end;

implementation

{$R *.dfm}

procedure TPostoClientEdit.acCancelarExecute(Sender: TObject);
begin
  if DAO.DoCancelar(dsbase.DataSet) then
    Close
end;

procedure TPostoClientEdit.acSalvarExecute(Sender: TObject);
begin
  if DAO.DoSalvar(dsbase.DataSet) then
    Close;
end;

procedure TPostoClientEdit.acSalvarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DAO.CanPost;
end;

procedure TPostoClientEdit.Inicializar;
begin
  inherited;
  dsBase.DataSet := DAO.DataSet['memBase'];
end;

class function TPostoClientEdit.New: IView;
begin
  Result := Self.Create;
end;

end.



