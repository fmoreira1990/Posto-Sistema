unit uBaseIntf;

interface

uses
  Vcl.Controls, Vcl.Forms, FireDAC.Comp.Client, Data.DB;

type

  IPostoClientDAO = interface
    ['{1746E4AC-1FD2-4BE0-BB53-16573EFDD34B}']
    function CanPost: Boolean;
    function DoConsultar(const pDataSet: TFDMemTable; pStoredProcConsulta: TFDStoredProc): Boolean; overload;
    function DoConsultar: Boolean; overload;
    function DoConsultar(const pIDProduto: integer): Boolean; overload;
    function DoSalvar(const pDataSet: TFDMemTable): Boolean;
    function DoEdit(const pDataSet: TFDMemTable): Boolean;
    function DoCancelar(const pDataSet: TFDMemTable): Boolean;
    function DoDelete(const pDataSet: TFDMemTable): Boolean;
    function DoInsert(const pDataSet: TFDMemTable): Boolean;
    function DoOpen(const pDataSet: TFDMemTable): Boolean; overload;
    function DoOpen(const pID: Integer): Boolean; overload;
    procedure DoBeforePost(pDataSet: TDataSet);
    procedure DoAfterOpen(pDataSet: TDataSet);
    procedure DoChange(Sender: TField);

  end;

  IView = interface
    ['{FA0BFEC6-CE29-48CC-9802-D7D911C17632}']
    procedure SetAlign(const Value: TAlign);
    procedure SetOnCloseQuery(const Value: TCloseQueryEvent);
    procedure SetDAO(const Value: IPostoClientDAO);
    procedure Close;

    function GetOnCloseQuery: TCloseQueryEvent;
    function GetShowing: Boolean;
    function ShowModal: Integer;
    function GetDAO: IPostoClientDAO;

    property DAO: IPostoClientDAO read GetDAO write SetDAO;
  end;

implementation

end.


