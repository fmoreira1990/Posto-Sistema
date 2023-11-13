unit uDsmTanque;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  uDsmBase;

type
  TDsmTanque = class(TDsmBase)
  private
    { Private declarations }
  protected
    procedure AfterConstruction; override;

  public
    { Public declarations }
    function Tanque(const pIdTanque: integer): TStream;
    function ListTanques: TStream;
    function updateTanques(const AStream: TStream): Boolean;

  end;

implementation

uses
  RN_TB_TANQUE,
  uPostoServerInterface;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDsmTanque.Tanque(const pIdTanque: integer): TStream;
begin
  Result := (Business as IBusinessTbTanque).Tanque(pIdTanque);
end;

procedure TDsmTanque.AfterConstruction;
begin
  inherited;
  Business := TRN_TB_TANQUE.New;
end;

function TDsmTanque.ListTanques: TStream;
begin
  Result := (Business as IBusinessTbTanque).ListTanques;
end;

function TDsmTanque.updateTanques(const AStream: TStream): Boolean;
begin
  Result := (Business as IBusinessTbTanque).updateTanques(AStream);
end;

end.



