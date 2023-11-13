unit uPostoBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseIntf;

type
  TPostoBase = class(TForm, IView)
  private
    { Private declarations }
    FDAO: IPostoClientDAO;
    FRefCount: integer;
  public
    { Public declarations }
    constructor Create;
    class function New: IView; virtual;

    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function GetOnCloseQuery: TCloseQueryEvent; virtual;
    function GetShowing: Boolean; virtual;
    function GetDAO: IPostoClientDAO; virtual;
    function ShowModal: Integer; reintroduce; virtual;

    procedure Inicializar; virtual;
    procedure SetAlign(const Value: TAlign); reintroduce; virtual;
    procedure SetOnCloseQuery(const Value: TCloseQueryEvent); virtual;
    procedure SetDAO(const Value: IPostoClientDAO); virtual;
    procedure Close; virtual;

    property DAO: IPostoClientDAO read GetDAO write SetDAO;
  end;

implementation

{$R *.dfm}

{ TPostoBase }

procedure TPostoBase.Close;
begin
  inherited Close;
end;

constructor TPostoBase.Create;
begin
  inherited Create(nil);
end;

function TPostoBase.GetDAO: IPostoClientDAO;
begin
  Result := FDAO;
end;

function TPostoBase.GetOnCloseQuery: TCloseQueryEvent;
begin
  Result := OnCloseQuery;
end;

function TPostoBase.GetShowing: Boolean;
begin
  Result := Showing;
end;

procedure TPostoBase.Inicializar;
begin
  //
end;

class function TPostoBase.New: IView;
begin
  Result := Self.Create;
end;

function TPostoBase.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TPostoBase.SetAlign(const Value: TAlign);
begin
  Align := Value;
end;

procedure TPostoBase.SetDAO(const Value: IPostoClientDAO);
begin
  FDAO := Value;
  Inicializar;
end;

procedure TPostoBase.SetOnCloseQuery(const Value: TCloseQueryEvent);
begin
  OnCloseQuery := Value;
end;

function TPostoBase.ShowModal: Integer;
begin
  Result := inherited ShowModal;
end;

function TPostoBase._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount)
end;

function TPostoBase._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if fRefCount = 0 then
    Destroy;
end;

end.



