unit uTanqueCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoClientCad, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, uBaseIntf;

type
  TTanqueCad = class(TPostoClientCad)
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    class function New: IView; override;
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TForm1 }

uses
  uTanqueEdit,
  uTanqueDAO;

procedure TTanqueCad.AfterConstruction;
begin
  DAO := TTanqueDAO.New;
  PostoClientEdit := TTanqueEdit.New;

  inherited;
end;

class function TTanqueCad.New: IView;
begin
  Result := Self.Create;
end;

end.


