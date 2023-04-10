unit DS.Services.Pessoa;

interface

uses
  System.SysUtils, System.Classes, System.JSON, DS.Repository.Pessoa,
  DS.Model.Conexao.Firedac, DataSetConverter4D.Helper, DataSetConverter4D.Impl,
  Datasnap.DBClient, DS.Model.Entidades.Pessoa, REST.Json, Data.DBXPlatform;

{$METHODINFO ON}

type
  TPessoaService = class(TDataModule)
  private

  public
    { Public declarations }
    function Pessoa (AIdPessoa: Integer) : TJsonArray;
    function acceptPessoa(jObject: TJSONObject): TJsonArray;
    procedure updatePessoa(jObject: TJSONObject);
    procedure cancelPessoa(AIdPessoa: Integer);
  end;
{$METHODINFO OFF}
var
  PessoaService: TPessoaService;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TPessoaService }

function TPessoaService.acceptPessoa(jObject: TJSONObject): TJsonArray;
var
  FRepositoryPessoa : TRepositoryPessoa;
begin
  FRepositoryPessoa := TRepositoryPessoa.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryPessoa.Save(TJson.JsonToObject<TPessoaObj>(jObject)).AsJSONArray;
  finally
    FRepositoryPessoa.Free;
  end;
end;

procedure TPessoaService.cancelPessoa(AIdPessoa: Integer);
var
  FRepositoryPessoa : TRepositoryPessoa;
begin
  FRepositoryPessoa := TRepositoryPessoa.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    FRepositoryPessoa.Delete(AIdPessoa);
  finally
    FRepositoryPessoa.Free;
  end;
end;

function TPessoaService.Pessoa(AIdPessoa: Integer): TJsonArray;
var
  FRepositoryPessoa : TRepositoryPessoa;
begin
  Result := nil;

  FRepositoryPessoa := TRepositoryPessoa.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryPessoa.Get(AIdPessoa).AsJSONArray;
  finally
    FRepositoryPessoa.Free;
  end;
end;

procedure TPessoaService.updatePessoa(jObject: TJSONObject);
var
  FRepositoryPessoa : TRepositoryPessoa;
begin
  FRepositoryPessoa := TRepositoryPessoa.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    FRepositoryPessoa.Update(TJson.JsonToObject<TPessoaObj>(jObject));
  finally
    FRepositoryPessoa.Free;
  end;
end;

end.


