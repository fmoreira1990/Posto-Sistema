unit uVendaRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPostoBase, Data.DB, RLReport,
  uBaseIntf;

type
  TVendaRelatorio = class(TPostoBase)
    Report_Venda_Detalhe_Ord_Data_Hora: TRLReport;
    RLBand1: TRLBand;
    dsVendas: TDataSource;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand6: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLBand7: TRLBand;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel9: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoExecuteReport;
    class function New: IView; override;
    procedure AfterConstruction; override;

  end;

implementation

uses
  uVendaDAO;

{$R *.dfm}

{ TVendaRelatorio }

procedure TVendaRelatorio.AfterConstruction;
begin
  DAO := TVendaDAO.New;
  inherited;
end;

procedure TVendaRelatorio.DoExecuteReport;
begin
  DAO.DoConsultar;
  Report_Venda_Detalhe_Ord_Data_Hora.PreviewModal();
end;

class function TVendaRelatorio.New: IView;
begin
  Result := Self.Create;
end;

end.



