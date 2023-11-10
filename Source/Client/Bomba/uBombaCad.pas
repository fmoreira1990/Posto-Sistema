unit uBombaCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TBombaCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

implementation

uses
  uBombaEdit;

{$R *.dfm}

{ TBombaCad }

procedure TBombaCad.AfterConstruction;
begin
  inherited;

  if not Assigned(FPostoClientEdit) then
  begin
    FPostoClientEdit := TBombaEdit.Create();
  end;

  inherited;
end;

end.


