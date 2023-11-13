unit uDsmBomba;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TDsmBomba = class(TDsmBase)
    QueryBaseID_BOMBA: TFDAutoIncField;
    QueryBaseID_TANQUE: TIntegerField;
    QueryBaseNUMERO: TIntegerField;
    QueryBaseNRO_BOMBA: TIntegerField;
    QueryBaseNRO_TANQUE: TIntegerField;
    QueryBaseDS_PRODUTO: TStringField;
    QueryListaNRO_BOMBA: TIntegerField;
    QueryListaNRO_TANQUE: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaDS_PRODUTO: TStringField;
    QueryListaVR_VENDA: TFMTBCDField;
    QueryListaVR_CUSTO: TFMTBCDField;
    QueryListaPER_IMPOSTO: TFMTBCDField;
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



