unit uPostoClientDAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.Param, FireDAC.Stan.Error, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS, FireDAC.Phys.DSDef,
  FireDAC.VCLUI.Wait, FireDAC.Phys.TDBXBase, DSHTTPLayer,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, Vcl.AppEvnts, uBaseIntf;

type
  TPostoClientDAO = class(TDataModule, IPostoClientDAO)
    FDSchemaAdapter: TFDSchemaAdapter;
    memBase: TFDMemTable;
    tabBase: TFDTableAdapter;
    dsBase: TDataSource;
    FDConnection: TFDConnection;
    FDPhysDSDriverLink: TFDPhysDSDriverLink;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    memLista: TFDMemTable;
    dsLista: TDataSource;
    FDStoredProcPost: TFDStoredProc;
    FDStoredProcConsulta: TFDStoredProc;
    FDStoredProcConsultaUnique: TFDStoredProc;
  private
    { Private declarations }
    FRefCount: integer;
    function DoConnectionError(pError: string): Boolean;
    procedure DoException(Sender: TObject; E: Exception);
  protected
    function DoConsultar: Boolean; overload; virtual;
    function DoConsultar(const pDataSet: TFDMemTable; pStoredProcConsulta: TFDStoredProc): Boolean; overload; virtual;
    function DoConsultar(const pIDProduto: integer): Boolean; overload; virtual;
    function DoSalvar(const pDataSet: TFDMemTable): Boolean; virtual;
    function DoEdit(const pDataSet: TFDMemTable): Boolean; virtual;
    function DoCancelar(const pDataSet: TFDMemTable): Boolean; virtual;
    function DoDelete(const pDataSet: TFDMemTable): Boolean; virtual;
    function DoInsert(const pDataSet: TFDMemTable): Boolean; virtual;
    function DoOpen(const pDataSet: TFDMemTable): Boolean; overload; virtual;
    function DoOpen(const pID: Integer): Boolean; overload; virtual;
    function CanPost: Boolean; virtual;
    procedure DoBeforePost(pDataSet: TDataSet); virtual;
    procedure DoAfterOpen(pDataSet: TDataSet); virtual;
    procedure DoChange(Sender: TField); virtual;
  public
    { Public declarations }
    AppEvent: TApplicationEvents;

    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    constructor Create; overload;

  end;

implementation

uses
  System.Variants, Vcl.Dialogs, RegExpr, Winapi.Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TPostoClientBaseDAO }

function Concatena(vTexto: string; Tam: Integer; const SP: string): string;
begin
  if Length(vTexto) = Tam then
  begin
    Result := vTexto;
    exit;
  end;
  if Length(vTexto) < Tam then
  begin
    repeat
      VTexto := vTexto + SP;
    until Length(vTexto) >= Tam;
    Result := vTexto;
    exit;
  end
  else
  begin
    Result := Copy(vTexto, 1, Tam);
  end;
end;

function ErrorInRegEx(const pMensagem, pExpressao: string): Boolean;
var
  vExp: TRegExpr;
begin
  vExp := TRegExpr.Create;
  try
    vExp.Expression := pExpressao;
    Result := vExp.Exec(pMensagem);
  finally
    vExp.Free
  end;
end;

function TPostoClientDAO.CanPost: Boolean;
var
  I: Integer;
  LDataSet: TFDAdaptedDataSet;
begin
  Result := (FDSchemaAdapter <> nil);
  if Result then
  begin
    Result := False;
    for I := 0 to FDSchemaAdapter.Count - 1 do
    begin
      LDataSet := FDSchemaAdapter.DataSets[I];
      if (LDataSet.ChangeCount > 0) or (LDataSet.State in dsEditModes) then
      begin
        Result := True;
        break;
      end;
    end;
  end;
end;

constructor TPostoClientDAO.Create;
begin
  inherited Create(nil);
end;

procedure TPostoClientDAO.AfterConstruction;
var
  i: integer;
begin
  inherited;
  AppEvent := TApplicationEvents.Create(Self);
  AppEvent.OnException := DoException;

  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TFDMemTable then
    begin
     // if Components[I] <> memLista then
      begin
        TFDMemTable(Components[I]).BeforePost := DoBeforePost;
        TFDMemTable(Components[I]).AfterOpen := DoAfterOpen;
      end;
    end;
  end;
end;

procedure TPostoClientDAO.BeforeDestruction;
begin
  inherited;
  //FDConnection.Connected := False;
end;

function TPostoClientDAO.DoConsultar: Boolean;
var
  LStringStream: TStream;
begin
  Result := False;
  memLista.Close;
  FDStoredProcConsulta.ExecProc;
  LStringStream := TStringStream.Create(FDStoredProcConsulta.Params[0].AsBlob);
  try
    if LStringStream <> nil then
    begin
      LStringStream.Position := 0;
      memLista.LoadFromStream(LStringStream, TFDStorageFormat.sfJSON);
      Result := True;
    end;
  finally
    LStringStream.Free;
  end;
end;

function TPostoClientDAO.DoCancelar(const pDataSet: TFDMemTable): Boolean;
begin
  Result := False;
  pDataSet.Adapter.SchemaAdapter.CancelUpdates;
  Result := True;
end;

procedure TPostoClientDAO.DoChange(Sender: TField);
begin
  //
end;

function TPostoClientDAO.DoConsultar(const pIDProduto: integer): Boolean;
var
  LStringStream: TStream;
begin
  Result := False;
  memBase.Close;

  FDStoredProcConsultaUnique.Params[0].AsInteger := pIDProduto;
  FDStoredProcConsultaUnique.ExecProc;

  LStringStream := TStringStream.Create(FDStoredProcConsultaUnique.Params[1].AsBlob);
  try
    if LStringStream <> nil then
    begin
      LStringStream.Position := 0;
      memBase.LoadFromStream(LStringStream, TFDStorageFormat.sfJSON);
      Result := memBase.RecordCount > 0;
    end;
  finally
    LStringStream.Free;
  end;
end;

function TPostoClientDAO.DoDelete(const pDataSet: TFDMemTable): Boolean;
begin
  Result := False;
  if memLista.Active then
  begin
    if DoOpen(memLista.FieldByName(memLista.MasterFields).AsInteger) then
    begin
      pDataSet.Delete;
      Result := True;
    end;
  end;
end;

function TPostoClientDAO.DoEdit(const pDataSet: TFDMemTable): Boolean;
begin
  Result := False;
  if memLista.Active then
  begin
    if DoOpen(memLista.FieldByName(memLista.MasterFields).AsInteger) then
    begin
      pDataSet.Edit;
      Result := True;
    end;
  end;
end;

procedure TPostoClientDAO.DoException(Sender: TObject; E: Exception);
begin
  if DoConnectionError(E.Message) then
  begin
    if MessageDlg('Deseja reconectar com o servidor?', mtCustom, [mbYes, mbNo], 1) = 6 then
    begin
      try
        FDConnection.Close;
      finally
        FDConnection.Open;
        if FDConnection.Connected then
          ShowMessage('Conex�o reestabelecida com sucesso!')
        else
          ShowMessage('N�o foi poss�vel reestabelecer a conex�o!' + #13 + 'Verifique o servidor de aplica��o.');
      end;
    end;
  end
  else
    ShowMessage(E.Message);
end;

function TPostoClientDAO.DoConnectionError(pError: string): Boolean;
var
  vExpression: TStrings;
  vI: Integer;
begin
  Result := False;

  vExpression := TStringList.Create;
  try
    vExpression.Add('([r|R](eading|EADING))+.*([S|s](ocket|OCKET))+');
    vExpression.Add('([u|U](nable|UNABLE))+.*([n|N](etwork|ETWORK))+');
    vExpression.Add('([u|U](navailable|NAVAILABLE))+.*([d|D](atabase|ATABASE))+');
    vExpression.Add('([s|S](ocket|OCKET))+.*([e|E](rror|RROR))+');
    vExpression.Add('([e|E](rror|RROR))+.*([s|S](ocket|OCKET))+');
    vExpression.Add('([n|N](ao|�o|AO|�O))+.*([s|S](oquete|OQUETE))+');
    vExpression.Add('([s|S](ervidor|ERVIDOR))+.*(rpc|RPC)+.*([n|N](ao|�o|AO|�O))+.*([d|D](ispon�vel))+');
    vExpression.Add('((cds|CDS)(metadata|MetaData|METADATA))+.*((ds|DS)[_]?(provider|PROVIDER))+');
    vExpression.Add('([d|D](ata|ATA))+.*([c|C](onnection|ONNECTION))+');
    vExpression.Add('([f|F](alha|ALHA))+.*([s|S](ervidor|ERVIDOR))+');
    vExpression.Add('([c|C](onnection|ONNECTION))+.*([c|C](losed|LOSED))+.*');
    vExpression.Add('([c|C](onnection|ONNECTION))+.*([l|L](ost|OST))+.*');
    vExpression.Add('([c|C](onnection|ONNECTION))+.*([a|A](bort|BORT))+.*');
    vExpression.Add('([c|C](onnect|ONNECT))+.*([t|T](imed|IMED))+.*([o|O](ut|UT))+.*');
    vExpression.Add('(DBX)+.*([e|E](rror|RROR))+.*([v|V](endor|ENDOR))+.*');
    vExpression.Add('([c|C](onnection|ONNECTION))+.*([p|P](ool|OOL))+.*([t|T](imeout|IMEOUT))+.*');
    vExpression.Add('([s|S](ession|ESSION))+.*([e|E](xpired|XPIRED))+.*');

    for vI := 0 to vExpression.Count - 1 do
      if ErrorInRegEx(pError, vExpression.Strings[vI]) then
      begin
        Result := True;
        Break;
      end;

  finally
    vExpression.Free;
  end;
end;

function TPostoClientDAO.DoConsultar(const pDataSet: TFDMemTable; pStoredProcConsulta: TFDStoredProc): Boolean;
var
  LStringStream: TStream;
begin
  Result := False;
  pDataSet.Close;
  pStoredProcConsulta.ExecProc;
  LStringStream := TStringStream.Create(pStoredProcConsulta.Params[0].AsBlob);
  try
    if LStringStream <> nil then
    begin
      LStringStream.Position := 0;
      pDataSet.LoadFromStream(LStringStream, TFDStorageFormat.sfJSON);
      Result := True;
    end;
  finally
    LStringStream.Free;
  end;
end;

function TPostoClientDAO.DoInsert(const pDataSet: TFDMemTable): Boolean;
begin
  Result := False;
  DoOpen(0);
  pDataSet.Append;
  Result := True;
end;

function TPostoClientDAO.DoOpen(const pID: Integer): Boolean;
begin
  Result := DoConsultar(pID);
end;

function TPostoClientDAO.DoOpen(const pDataSet: TFDMemTable): Boolean;
begin
  if pDataSet.Active then
    pDataSet.Close;

  if pDataSet = memBase then
    DoOpen(memLista.FieldByName(memLista.MasterFields).AsInteger)
  else
    pDataSet.Open;
end;

function TPostoClientDAO.DoSalvar(const pDataSet: TFDMemTable): Boolean;
var
  LMemStream: TMemoryStream;
  I: integer;
  LDataSet: TDataSet;
begin
  Result := False;

  for I := 0 to pDataSet.Adapter.SchemaAdapter.Count - 1 do
  begin
    LDataSet := pDataSet.Adapter.SchemaAdapter.DataSets[I];
    if LDataSet <> nil then
      if LDataSet.State in dsEditModes then
        LDataSet.Post;
  end;

  LMemStream := nil;
  LMemStream := TMemoryStream.Create;
  try
    try
      pDataSet.Adapter.SchemaAdapter.ResourceOptions.StoreItems := [siDelta, siMeta];
      pDataSet.Adapter.SchemaAdapter.SaveToStream(LMemStream, TFDStorageFormat.sfJSON);
      LMemStream.Position := 0;

      FDStoredProcPost.Params[0].asStream := LMemStream;
      FDStoredProcPost.ExecProc;

      Result := FDStoredProcPost.Params[1].AsBoolean;
      if Result then
      begin
        DoConsultar;
      end;
    finally
      //FreeAndNil(LMemStream);
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TPostoClientDAO.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TPostoClientDAO._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount)
end;

function TPostoClientDAO._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if fRefCount = 0 then
    Destroy;
end;

procedure TPostoClientDAO.DoAfterOpen(pDataSet: TDataSet);
var
  vField: TField;
  vMask: string;
begin
  //if pDataSet <> memLista then
  begin
    for vField in pDataSet.Fields do
    begin
      vField.OnChange := DoChange;

      if (vField is TIntegerField) or
        (vField is TLargeintField) or
        (vField is TSmallintField) then
      begin
        if TLargeintField(vField).DisplayFormat = EmptyStr then
          TLargeintField(vField).DisplayFormat := '########0';
      end
      else if (vField is TFMTBCDField) or
        (vField is TBCDField) or
        (vField is TFloatField) then
      begin
        vMask := '###,###,##0.00';
        if TFloatField(vField).Size > 0 then
          vMask := '###,###,##0.' + Concatena('0', TFloatField(vField).Size, '0');
        if (TFloatField(vField).EditFormat = EmptyStr) then
          TFloatField(vField).EditFormat := vMask;
        if (TFloatField(vField).DisplayFormat = EmptyStr) then
          TFloatField(vField).DisplayFormat := vMask;
      end
      else if vField is TDateField then
      begin
        if (TDateField(vField).EditMask = EmptyStr) then
          TDateField(vField).EditMask := '!99/99/9999;1;_';
        if (TDateField(vField).DisplayFormat = EmptyStr) then
          TDateField(vField).DisplayFormat := 'dd/mm/yyyy';
      end
      else if (vField is TTimeField) or
        (vField is TSQLTimeStampField) then
      begin
        if (TTimeField(vField).EditMask = EmptyStr) then
          TTimeField(vField).EditMask := '!99:99:99;1;_';
        if (TTimeField(vField).DisplayFormat = EmptyStr) then
          TTimeField(vField).DisplayFormat := 'hh:mm:ss';
      end;
    end;
  end;
end;

procedure TPostoClientDAO.DoBeforePost(pDataSet: TDataSet);
var
  vField: TField;
  vFields: string;
begin
  vFields := EmptyStr;

  if pDataSet.State in dsEditModes then
    for vField in pDataSet.Fields do
    begin
      if vField.Required and vField.IsNull then
        vFields := vFields + ':. ' + vField.DisplayLabel + #13;
    end;

  if vFields <> EmptyStr then
    raise Exception.Create('Campos obrigat�rios n�o est�o preenchidos.' + #13 + vFields);
end;

end.


