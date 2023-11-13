unit uPostoClientCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  uPostoBase, uBaseIntf;

type
  TPostoClientCad = class(TPostoBase)
    pnlTop: TPanel;
    Grid: TDBGrid;
    ActionList: TActionList;
    acConsultar: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acIncluir: TAction;
    btnConsultar: TButton;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    acFechar: TAction;
    dsLista: TDataSource;
    dsBase: TDataSource;
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure acConsultarExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPostoClientEdit: IView;
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    procedure AfterConstruction; override;
    class function New: IView; override;
    procedure Inicializar; override;
    { Public declarations }
    property PostoClientEdit: IView read FPostoClientEdit write FPostoClientEdit;
  end;

implementation

{$R *.dfm}

procedure TPostoClientCad.acConsultarExecute(Sender: TObject);
begin
  DAO.DoConsultar;
end;

procedure TPostoClientCad.acExcluirExecute(Sender: TObject);
begin
  if DAO.DoDelete(dsBase.DataSet) then
    DAO.DoSalvar(dsBase.DataSet);
end;

procedure TPostoClientCad.acFecharExecute(Sender: TObject);
begin
  if FPostoClientEdit.GetShowing then
    FPostoClientEdit.Close;
  Close;
end;

procedure TPostoClientCad.acEditarExecute(Sender: TObject);
begin
  if DAO.DoEdit(dsBase.DataSet) then
    FPostoClientEdit.ShowModal;
end;

procedure TPostoClientCad.acIncluirExecute(Sender: TObject);
begin
  if DAO.DoInsert(dsBase.DataSet) then
    FPostoClientEdit.ShowModal;
end;

procedure TPostoClientCad.AfterConstruction;
begin
  inherited;
  if Assigned(FPostoClientEdit) and Assigned(DAO) then
  begin
    FPostoClientEdit.Dao := DAO;
    FPostoClientEdit.Inicializar;
  end;
end;

procedure TPostoClientCad.DoShow;
begin
  inherited;
  acConsultar.Execute;
end;

procedure TPostoClientCad.GridDblClick(Sender: TObject);
begin
  acEditar.Execute;
end;

procedure TPostoClientCad.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    acEditar.Execute;
end;

procedure TPostoClientCad.Inicializar;
begin
  inherited;
  dsBase.DataSet := DAO.DataSet['memBase'];
  dsLista.DataSet := DAO.DataSet['memLista'];
end;

class function TPostoClientCad.New: IView;
begin
  Result := Self.Create;
end;

end.



