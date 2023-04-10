unit uDmClient;

interface

uses
  System.SysUtils, System.Classes, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, REST.Response.Adapter, Data.DB,
  Datasnap.DBClient;

type
  TdmClient = class(TDataModule)
    ClientGeral: TRESTClient;
    reqGeral: TRESTRequest;
    resGeral: TRESTResponse;
    restResponse: TRESTResponseDataSetAdapter;
    dtsEndereco: TDataSource;
    cdsEndereco: TClientDataSet;
    dtsEnderecoIntegracao: TDataSource;
    cdsEnderecoIntegracao: TClientDataSet;
    dtsPessoa: TDataSource;
    cdsPessoa: TClientDataSet;
    cdsPessoaflnatureza: TFloatField;
    cdsPessoadsdocumento: TWideStringField;
    cdsPessoanmprimeiro: TWideStringField;
    cdsPessoanmsegundo: TWideStringField;
    cdsEnderecoIntegracaonmLogradouro: TWideStringField;
    cdsEnderecoIntegracaonmBairro: TWideStringField;
    cdsEnderecoIntegracaonmCidade: TWideStringField;
    cdsEnderecoIntegracaoDsuf: TWideStringField;
    cdsEnderecoIntegracaodsComplemento: TWideStringField;
    cdsPessoaidpessoa: TFloatField;
    cdsPessoadtregistro: TDateField;
    cdsPessoaAux: TClientDataSet;
    FloatField2: TFloatField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    cdsEnderecoAux: TClientDataSet;
    cdsEnderecoAuxidpessoa: TFloatField;
    cdsEnderecoAuxdscep: TWideStringField;
    RESTClientEndereco: TRESTClient;
    RESTRequestEndereco: TRESTRequest;
    RESTResponseEndereco: TRESTResponse;
    RESTResponseDataSetAdapterEndereco: TRESTResponseDataSetAdapter;
    cdsEnderecoidpessoa: TIntegerField;
    cdsEnderecodscep: TStringField;
    cdsEnderecoidendereco: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClient: TdmClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
