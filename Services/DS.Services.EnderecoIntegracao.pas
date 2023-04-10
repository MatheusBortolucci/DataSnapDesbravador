unit DS.Services.EnderecoIntegracao;

interface

uses
  System.SysUtils, System.Classes, System.JSON, DS.Repository.Endereco,
  DS.Model.Conexao.Firedac, DataSetConverter4D.Helper, DataSetConverter4D.Impl,
  Datasnap.DBClient, DS.Model.Entidades.EnderecoIntegracao, REST.Json, Data.DBXPlatform;
type
  TEnderecoService = class(TDataModule)
  private
    { Private declarations }
  public
    function Endereco (AIdEndereco: Integer) : TJsonArray;
    procedure acceptEndereco(jObject: TJSONObject);
    procedure updateEndereco(jObject: TJSONObject);
    procedure cancelEndereco(AIdEndereco: Integer);
  end;
{$METHODINFO OFF}
var
implementation

end.
