unit uDsmTanque;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, uDsmBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON;

type
  TDsmTanque = class(TDsmBase)
    QueryListaID_TANQUE: TIntegerField;
    QueryListaID_PRODUTO: TIntegerField;
    QueryListaCAPACIDADE: TFMTBCDField;
    QueryListaNUMERO: TIntegerField;
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



