unit uTanqueCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TTanqueCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TForm1 }

uses
 uTanqueEdit;

procedure TTanqueCad.AfterConstruction;
begin

  if not Assigned(FPostoClientEdit) then
  begin
    FPostoClientEdit := TTanqueEdit.Create();
  end;

  inherited;
end;

end.
