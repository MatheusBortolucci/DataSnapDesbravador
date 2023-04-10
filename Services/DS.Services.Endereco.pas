unit DS.Services.Endereco;

interface

uses
  System.SysUtils, System.Classes, DS.Repository.Endereco,
  DS.Model.Conexao.Firedac, DataSetConverter4D.Helper, DataSetConverter4D.Impl,
  Datasnap.DBClient, DS.Model.Entidades.Endereco, REST.Json, Data.DBXPlatform,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  DS.Model.Entidades.EnderecoIntegracao, System.JSON, DS.Repository.EnderecoIntegracao;

{$METHODINFO ON}
type
  TEnderecoService = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    function Endereco (AIdEndereco: Integer) : TJsonArray;
    function acceptEndereco(jObject: TJSONObject) :TJsonArray;
    function updateEndereco(jObject: TJSONObject): TJsonArray;
    procedure cancelEndereco(AIdEndereco: Integer);
    function GetDadosCEP(ACEP: String) :TJsonArray;
    function ToEnderecoIntegracaoObj(AIdEndereco: Integer; AJSONObject :TJSONObject) :TEnderecoIntegracaoObj;
    function ToEnderecoIntegracaoJSON(AJSONObject :TJSONObject): TJsonArray;
    function EnderecoIntegracao (AIdEndereco: Integer) : TJsonArray;
  end;
{$METHODINFO OFF}
var
  EnderecoService: TEnderecoService;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DS.Thread.AtualizaCEP, Vcl.Dialogs;

{$R *.dfm}

{ TEnderecoService }

function TEnderecoService.acceptEndereco(jObject: TJSONObject): TJsonArray;
var
  FRepositoryEndereco : TRepositoryEndereco;
  jsonValue: TJSONValue;
  idendereco : integer;
  vCEP: String;
  objEnderecoIntegracao: TEnderecoIntegracaoObj;
begin
  FRepositoryEndereco := TRepositoryEndereco.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryEndereco.Save(TJson.JsonToObject<TEnderecoObj>(jObject)).AsJSONArray;

    jsonValue := Result.Items[0];

    idendereco :=  jsonValue.GetValue<Integer>('idendereco');

    vCEP := jsonValue.GetValue<String>('dscep');

    objEnderecoIntegracao := ToEnderecoIntegracaoObj(idendereco, TJSONObject.ParseJSONValue(Self.GetDadosCEP(vCEP).Items[0].ToString) as TJSONObject);

    TAtualizaCEP.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1,
                        acInsert,
                        objEnderecoIntegracao
                        ).Execute;
  finally
    FRepositoryEndereco.Free;
  end;
end;

function TEnderecoService.updateEndereco(jObject: TJSONObject): TJsonArray;
var
  FRepositoryEndereco : TRepositoryEndereco;
  jsonValue: TJSONValue;
  idendereco : integer;
  vCEP: String;
  objEnderecoIntegracao: TEnderecoIntegracaoObj;
begin
  FRepositoryEndereco := TRepositoryEndereco.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryEndereco.Update(TJson.JsonToObject<TEnderecoObj>(jObject)).AsJSONArray;

    jsonValue := Result.Items[0];

    idendereco :=  jsonValue.GetValue<Integer>('idendereco');

    vCEP := jsonValue.GetValue<String>('dscep');

    objEnderecoIntegracao := ToEnderecoIntegracaoObj(idendereco, TJSONObject.ParseJSONValue(Self.GetDadosCEP(vCEP).Items[0].ToString) as TJSONObject);

    TAtualizaCEP.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1,
                        AcUpdate,
                        objEnderecoIntegracao
                        ).Execute;
  finally
    FRepositoryEndereco.Free;
  end;
end;

procedure TEnderecoService.cancelEndereco(AIdEndereco: Integer);
var
  FRepositoryEndereco : TRepositoryEndereco;
begin
  FRepositoryEndereco := TRepositoryEndereco.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    FRepositoryEndereco.Delete(AIdEndereco);
  finally
    FRepositoryEndereco.Free;
  end;
end;

function TEnderecoService.Endereco(AIdEndereco: Integer): TJsonArray;
var
  FRepositoryEndereco : TRepositoryEndereco;
begin
  Result := nil;

  FRepositoryEndereco := TRepositoryEndereco.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryEndereco.Get(AIdEndereco).AsJSONArray;
  finally
    FRepositoryEndereco.Free;
  end;
end;

function TEnderecoService.EnderecoIntegracao(AIdEndereco: Integer): TJsonArray;
var
  FRepositoryEnderecoIntegracao : TRepositoryEnderecoIntegracao;
begin
  Result := nil;
  FRepositoryEnderecoIntegracao := TRepositoryEnderecoIntegracao.Create(ds.Model.Conexao.Firedac.DataModule1.FDConnection1);
  try
    Result := FRepositoryEnderecoIntegracao.Get(AIdEndereco).AsJSONArray;
  finally
    FRepositoryEnderecoIntegracao.Free;
  end;
end;

function TEnderecoService.GetDadosCEP(ACEP: String): TJsonArray;
begin
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
  RESTRequest1.Method := rmGET;
  RESTRequest1.Resource := ACEP + '/json/';
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTRequest1.Execute;

  Result := ToEnderecoIntegracaoJSON(
             TJSONObject.ParseJSONValue(RESTResponse1.Content) as TJSONObject
            );
end;

function TEnderecoService.ToEnderecoIntegracaoJSON(
  AJSONObject: TJSONObject): TJsonArray;
var
  LJSON: TJSONObject;
begin
  LJSON := TJSONObject.Create;
  Result := TJsonArray.Create;

  LJson.AddPair(TJSONPair.Create('nmLogradouro', TJSONString.Create(AJSONObject.GetValue('logradouro').value)));
  LJson.AddPair(TJSONPair.Create('nmBairro', TJSONString.Create(AJSONObject.GetValue('bairro').value)));
  LJson.AddPair(TJSONPair.Create('nmCidade', TJSONString.Create(AJSONObject.GetValue('localidade').value)));
  LJson.AddPair(TJSONPair.Create('Dsuf', TJSONString.Create(AJSONObject.GetValue('uf').value)));
  LJson.AddPair(TJSONPair.Create('dsComplemento', TJSONString.Create(AJSONObject.GetValue('complemento').value)));

  Result.Add(LJson);
end;

function TEnderecoService.ToEnderecoIntegracaoObj(AIdEndereco: Integer;
  AJSONObject :TJSONObject): TEnderecoIntegracaoObj;
begin
  Result := TEnderecoIntegracaoObj.Create;
  Result.idEndereco := AIdEndereco;
  Result.nmLogradouro := AJSONObject.GetValue('nmLogradouro').Value;
  Result.nmBairro := AJSONObject.GetValue('nmBairro').Value;
  Result.nmCidade := AJSONObject.GetValue('nmCidade').Value;
  Result.Dsuf := AJSONObject.GetValue('Dsuf').Value;
  Result.dsComplemento := AJSONObject.GetValue('dsComplemento').Value;
end;



end.
