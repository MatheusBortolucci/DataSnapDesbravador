unit DS.Services.Pessoa;

interface

uses
  System.SysUtils, System.Classes, System.JSON, DS.Repository.Pessoa,
  DS.Model.Conexao.Firedac, DataSetConverter4D.Helper, DataSetConverter4D.Impl,
   Datasnap.DBClient;

{$METHODINFO ON}

type
  TPessoaService = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FRepositoryPessoa : TRepositoryPessoa;
  public
    { Public declarations }
    procedure acceptPessoa(jObject: TJSONObject);
  end;
{$METHODINFO OFF}
var
  PessoaService: TPessoaService;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TPessoaService }

procedure TPessoaService.acceptPessoa(jObject: TJSONObject);
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(nil);
  cds.CreateDataSet;
  cds.FromJSONObject(jObject);
end;


procedure TPessoaService.DataModuleCreate(Sender: TObject);
begin
  Self.FRepositoryPessoa := TRepositoryPessoa.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
end;

procedure TPessoaService.DataModuleDestroy(Sender: TObject);
begin
  FRepositoryPessoa.Free;
end;

end.

