unit uBombaEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientEdit, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uBombaDAO, Vcl.Mask,
  Vcl.DBCtrls;

type
  TBombaEdit = class(TPostoClientEdit)
    lblID: TLabel;
    edtId: TDBEdit;
    edtlkbTanque: TDBLookupComboBox;
    dsTanque: TDataSource;
    edtNumero: TDBEdit;
    lblTanque: TLabel;
    lblNumero: TLabel;
  private
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

uses
  uBaseIntf;
{$R *.dfm}

procedure TBombaEdit.DoShow;
begin
  inherited;

end;

end.


