unit uBombaEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientEdit, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uBombaDAO, Vcl.Mask,
  Vcl.DBCtrls, uBaseIntf;

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
    class function New: IView; override;
    { Public declarations }

  end;

implementation
{$R *.dfm}

procedure TBombaEdit.DoShow;
begin
  inherited;

end;

class function TBombaEdit.New: IView;
begin
  Result := Self.Create;
end;

end.


