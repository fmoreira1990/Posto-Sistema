unit uRN_BASE_DAO;

interface

uses
  System.SysUtils, System.Classes, uPostoServerInterface, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TRN_BASE_DAO = class(TDataModule)
    QueryBase: TFDQuery;
    FDSchemaAdapter: TFDSchemaAdapter;
    QueryLista: TFDQuery;
    procedure FDSchemaAdapterReconcileRow(ASender: TObject; ARow: TFDDatSRow; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
    FDynamicFactory: IDynamicFactory;
    function GetDynamicFactory: IDynamicFactory;
  public
    { Public declarations }
    procedure AfterConstruction; override;

    property DynamicFactory: IDynamicFactory read GetDynamicFactory;

  end;

implementation

uses
  uDynamicFactory;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRN_BASE_DAO }

procedure TRN_BASE_DAO.AfterConstruction;
begin
  inherited;
  QueryBase.Connection := DynamicFactory.NewConnection.Connection;
  QueryLista.Connection := DynamicFactory.NewConnection.Connection;
end;

procedure TRN_BASE_DAO.FDSchemaAdapterReconcileRow(ASender: TObject; ARow: TFDDatSRow; var Action: TFDDAptReconcileAction);
var
  oErr: EFDException;
  oExc: EFDDBEngineException;
begin
  inherited;
  oErr := ARow.RowError;
  if oErr <> nil then
  begin
    if oErr is EFDDBEngineException then
    begin
      oExc := EFDDBEngineException(oErr);
      // [FireDAC][Phys][PG]-312. Exact update affected [0] rows, while [1] was requested // tentando deletar no banco de dados registro que foi inserido no fdquery e depois deletado, na verdade, nunca existiu no bd e da essa exception.
      if not (oExc.ErrorCode = 312) then
        raise Exception.Create(oExc.Message + char(13) + char(13) + 'SQL: ' + oExc.SQL + char(13) + 'Parametros: ' + oExc.Params.Text);
    end;
  end;
end;

function TRN_BASE_DAO.GetDynamicFactory: IDynamicFactory;
begin
  if not Assigned(FDynamicFactory) then
    FDynamicFactory := TDynamicFactory.New;
  Result := FDynamicFactory;
end;

end.



