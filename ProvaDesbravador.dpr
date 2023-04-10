program ProvaDesbravador;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  DS.Model.Entidades.Pessoa in 'Model\Entidades\DS.Model.Entidades.Pessoa.pas',
  DS.Model.Entidades.EnderecoIntegracao in 'Model\Entidades\DS.Model.Entidades.EnderecoIntegracao.pas',
  DS.Model.Entidades.Endereco in 'Model\Entidades\DS.Model.Entidades.Endereco.pas',
  DataSetConverter4D.Helper in 'Helper\DataSetConverter4D.Helper.pas',
  DataSetConverter4D.Impl in 'Helper\DataSetConverter4D.Impl.pas',
  DataSetConverter4D in 'Helper\DataSetConverter4D.pas',
  DataSetConverter4D.Util in 'Helper\DataSetConverter4D.Util.pas',
  DS.Model.Conexao.Firedac in 'Model\Conexao\DS.Model.Conexao.Firedac.pas' {DataModule1: TDataModule},
  DS.Services.Pessoa in 'Services\DS.Services.Pessoa.pas' {PessoaService: TDataModule},
  DS.Repository.Pessoa in 'Repository\DS.Repository.Pessoa.pas',
  DS.Repository.Endereco in 'Repository\DS.Repository.Endereco.pas',
  DS.Services.Endereco in 'Services\DS.Services.Endereco.pas' {EnderecoService: TDataModule},
  DS.Thread.AtualizaCEP in 'Thread\DS.Thread.AtualizaCEP.pas',
  DS.Repository.EnderecoIntegracao in 'Repository\DS.Repository.EnderecoIntegracao.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPessoaService, PessoaService);
  Application.CreateForm(TEnderecoService, EnderecoService);
  Application.Run;
end.
