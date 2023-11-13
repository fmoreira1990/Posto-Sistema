unit uPostoServerInterface;

interface

uses
  FireDAC.Comp.Client, System.Classes;

type

  IBusiness = interface
    ['{8C488B4C-11F5-4CC7-B8C0-CD346737036A}']

  end;

  IBusinessTbBomba = interface(IBusiness)
    ['{8C488B4C-11F5-4CC7-B8C0-CD346737036A}']
    function ListBombas: TStream;
    function Bombas(const pIdBomba: integer): TStream;
    function updateBombas(const AStream: TStream): Boolean;
  end;

  IBusinessTbTanque = interface(IBusiness)
    ['{2A46EF2C-EADA-4284-8D54-A9AE628031F2}']
    function Tanque(const pIdTanque: integer): TStream;
    function ListTanques: TStream;
    function updateTanques(const AStream: TStream): Boolean;
  end;

  IBusinessTbProduto = interface(IBusiness)
    ['{E5E5794E-C1EA-4557-A0E0-F792E6BA8323}']
    function ListProdutos: TStream;
    function Produtos(const pIDProduto: integer): TStream;
    function updateProdutos(const AStream: TStream): Boolean;
  end;

  IBusinessTbVenda = interface(IBusiness)
    ['{15A754D1-4F2F-4E16-81E3-E808286A4585}']
    function ListVenda: TStream;
    function updateVendas(const AStream: TStream): Boolean;
    function Venda(const pIdVenda: integer): TStream;
    function RelatorioVendas: TStream;
  end;

  IDynamicConnection = interface
    ['{44C642CB-7FA5-4968-B42E-49F7A6B95C85}']
    function GetConnection: TFDConnection;
    property Connection: TFDConnection read GetConnection;
  end;

  IDynamicFactory = interface
    ['{E69424B2-C9BD-4BEC-8901-198E1078BA37}']
    function NewConnection: IDynamicConnection;
  end;

implementation

end.



