unit uTanqueEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientEdit, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, uTanqueDAO;

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
  protected
    procedure DoShow; override;
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TTanqueEdit }

procedure TTanqueEdit.DoShow;
begin
  inherited;

end;

end.
