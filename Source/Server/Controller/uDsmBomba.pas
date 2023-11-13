unit uDsmBomba;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase;

type
  TDsmBomba = class(TDsmBase)
  private
    { Private declarations }
  protected
    procedure AfterConstruction; override;

  public
    { Public declarations }
    function ListBombas: TStream;
    function Bombas(const pIdBomba: integer): TStream;
    function updateBombas(const AStream: TStream): Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDsmBomba }

uses
  RN_TB_BOMBA,
  uPostoServerInterface;

procedure TDsmBomba.AfterConstruction;
begin
  inherited;
  Business := TRN_TB_BOMBA.New;
end;

function TDsmBomba.Bombas(const pIdBomba: integer): TStream;
begin
  Result := (Business as IBusinessTbBomba).Bombas(pIdBomba);
end;

function TDsmBomba.ListBombas: TStream;
begin
  Result := (Business as IBusinessTbBomba).ListBombas();
end;

function TDsmBomba.updateBombas(const AStream: TStream): Boolean;
begin
  Result := (Business as IBusinessTbBomba).updateBombas(AStream);
end;

end.



