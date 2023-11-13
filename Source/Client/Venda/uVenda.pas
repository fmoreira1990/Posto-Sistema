unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls, uBaseIntf;

type
  TVenda = class(TPostoBase)
    pnlCenter: TPanel;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    acVender: TAction;
    ListBombas: TListView;
    ImageList: TImageList;
    dsBombas: TDataSource;
    Vender1: TMenuItem;
    pnlTop: TPanel;
    btnVender: TButton;
    btnFechar: TButton;
    acFechar: TAction;
    dsBase: TDataSource;
    procedure acVenderExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure ListBombasDblClick(Sender: TObject);
    procedure ListBombasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure CriarLista;
  protected
    procedure DoShow; override;
  public
    { Public declarations }
    class function New: IView; override;
    procedure AfterConstruction; override;
    procedure Inicializar; override;

  end;

implementation

uses
  uVendaFinalizar,
  uVendaDAo;

{$R *.dfm}

procedure TVenda.acFecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TVenda.acVenderExecute(Sender: TObject);
var
  vVendaFinalizar: IView;
begin
  inherited;
  if ListBombas.ItemIndex >= 0 then
  begin
    if dsBombas.DataSet.Locate('ID_BOMBA', ListBombas.Items[ListBombas.ItemIndex].SubItems[2], []) then
    begin
      if DAO.DoInsert(dsBase.DataSet) then
      begin
        dsBase.DataSet.FieldByName('ID_PRODUTO').AsInteger := dsBombas.DataSet.FieldByName('ID_PRODUTO').AsInteger;
        dsBase.DataSet.FieldByName('ID_TANQUE').AsInteger := dsBombas.DataSet.FieldByName('ID_TANQUE').AsInteger;
        dsBase.DataSet.FieldByName('ID_BOMBA').AsInteger := dsBombas.DataSet.FieldByName('ID_BOMBA').AsInteger;
        dsBase.DataSet.FieldByName('VR_CUSTO').AsFloat := dsBombas.DataSet.FieldByName('VR_CUSTO').AsFloat;
        dsBase.DataSet.FieldByName('VR_VENDA').AsFloat := dsBombas.DataSet.FieldByName('VR_VENDA').AsFloat;
        dsBase.DataSet.FieldByName('PER_IMPOSTO').AsFloat := dsBombas.DataSet.FieldByName('PER_IMPOSTO').AsFloat;
        dsBase.DataSet.FieldByName('QTDE').AsFloat := 1;
        dsBase.DataSet.FieldByName('DATA').AsDateTime := Date;
        dsBase.DataSet.FieldByName('HORA').AsDateTime := Time;
        dsBase.DataSet.Post;

        vVendaFinalizar := TVendaFinalizar.New;
        vVendaFinalizar.DAO := DAO;
        vVendaFinalizar.ShowModal;
      end;
    end;
  end;
end;

procedure TVenda.AfterConstruction;
begin
  DAO := TVendaDAO.New;

  inherited;
end;

procedure TVenda.CriarLista;
var
  vListItem: TListItem;
begin
  dsBombas.DataSet.First;
  while not dsBombas.DataSet.Eof do
  begin
    vListItem := ListBombas.Items.Add;
    vListItem.Caption := dsBombas.DataSet.FieldByName('NRO_BOMBA').AsString;

    vListItem.SubItems.Add(dsBombas.DataSet.FieldByName('DS_PRODUTO').AsString);
    vListItem.SubItems.Add(FloatToStr(dsBombas.DataSet.FieldByName('VR_VENDA').AsFloat));
    vListItem.SubItems.Add(dsBombas.DataSet.FieldByName('ID_BOMBA').AsString);

    dsBombas.DataSet.Next;
  end;
end;

procedure TVenda.DoShow;
begin
  inherited;
  CriarLista;
  if ListBombas.CanFocus then
  begin
    ListBombas.SetFocus;
    if ListBombas.Items.Count > 0 then
      ListBombas.ItemIndex := 0;
  end;
end;

procedure TVenda.Inicializar;
begin
  inherited;
  dsBombas.DataSet := DAO.DataSet['memBombaCons'];
  dsBase.DataSet := DAO.DataSet['memBase'];
end;

procedure TVenda.ListBombasDblClick(Sender: TObject);
begin
  inherited;
  acVender.Execute;
end;

procedure TVenda.ListBombasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    acVender.Execute;
end;

class function TVenda.New: IView;
begin
  Result := Self.Create;
end;

end.



