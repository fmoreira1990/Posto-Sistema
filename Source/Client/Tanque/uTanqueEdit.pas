unit uTanqueEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientEdit, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, uBaseIntf;

type
  TTanqueEdit = class(TPostoClientEdit)
    lblID: TLabel;
    edtID: TDBEdit;
    edtckbProd: TDBLookupComboBox;
    edtCapacidade: TDBEdit;
    lblProd: TLabel;
    lblCapacidade: TLabel;
    edtNumero: TDBEdit;
    lblNumero: TLabel;
    dsProdCons: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New: IView; override;
  end;

implementation

{$R *.dfm}

{ TTanqueEdit }

class function TTanqueEdit.New: IView;
begin
  Result := Self.Create;
end;

end.
