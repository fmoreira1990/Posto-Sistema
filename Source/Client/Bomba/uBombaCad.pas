unit uBombaCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, uBaseIntf;

type
  TBombaCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    class function New: IView; override;
  end;

implementation

uses
  uBombaEdit,
  uBombaDAO;

{$R *.dfm}

{ TBombaCad }

procedure TBombaCad.AfterConstruction;
begin
  DAO := TBombaDAO.New;
  PostoClientEdit := TBombaEdit.New;

  inherited;
end;

class function TBombaCad.New: IView;
begin
  Result := Self.Create;
end;

end.



