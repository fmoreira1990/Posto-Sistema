unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, uVendaDAo, Data.DB, Vcl.StdCtrls;

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
    procedure ListBombasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CriarLista;
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

uses
  uBaseIntf,
  uVendaFinalizar, FireDAC.Comp.Client;

{$R *.dfm}

procedure TVenda.acFecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TVenda.acVenderExecute(Sender: TObject);
var
  vVendaFinalizar: IView; // TVendaFinalizar;
begin
  inherited;
  if dsBombas.DataSet.Locate('ID_BOMBA', ListBombas.Items[ListBombas.ItemIndex].SubItems[2], []) then
  begin
    if DAO.DoInsert(TFDMemTable(dsBase.DataSet)) then
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

      vVendaFinalizar := TVendaFinalizar.Create;
      vVendaFinalizar.DAO := DAO;
      vVendaFinalizar.ShowModal;
    end;
  end;
end;

procedure TVenda.CriarLista;
var
  ListItem: TListItem;
begin
  dsBombas.DataSet.First;
  while not dsBombas.DataSet.Eof do
  begin
    ListItem := ListBombas.Items.Add;
    ListItem.Caption := dsBombas.DataSet.FieldByName('NRO_BOMBA').AsString;

    ListItem.SubItems.Add(dsBombas.DataSet.FieldByName('DS_PRODUTO').AsString);
    ListItem.SubItems.Add(FloatToStr(dsBombas.DataSet.FieldByName('VR_VENDA').AsFloat));
    ListItem.SubItems.Add(dsBombas.DataSet.FieldByName('ID_BOMBA').AsString);

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

end.



