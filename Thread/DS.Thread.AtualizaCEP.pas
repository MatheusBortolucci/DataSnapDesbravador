unit DS.Thread.AtualizaCEP;

interface

uses
  System.Classes, FireDAC.Comp.Client,FireDAC.Stan.Param,
     FireDac.DApt, DS.Model.Entidades.EnderecoIntegracao;
type
  TAction = (acInsert, AcUpdate);

type
  TAtualizaCEP = class(TThread)
  protected
    private
      FAcao: TAction;
      FDmConexao : TFDConnection;
      FEnderecoIntegracaoObj : TEnderecoIntegracaoObj;
    public
      constructor Create(ADmConexao: TFDConnection; AAcao: TAction; AEnderecoIntegracaoObj : TEnderecoIntegracaoObj);
      destructor Destroy; override;
       procedure Execute; override;
  end;

implementation

{ TAtualizaCEP }

uses DS.Repository.EnderecoIntegracao;


constructor TAtualizaCEP.Create(ADmConexao: TFDConnection; AAcao: TAction; AEnderecoIntegracaoObj : TEnderecoIntegracaoObj);
begin
  inherited Create(True);
  Self.FDmConexao := ADmConexao;
  Self.FAcao := AAcao;
  Self.FEnderecoIntegracaoObj :=  AEnderecoIntegracaoObj;
end;

destructor TAtualizaCEP.Destroy;
begin
  inherited;
end;

procedure TAtualizaCEP.Execute;
var
  vRepositoryEnderecoIntegracao : TRepositoryEnderecoIntegracao;
begin
  case FAcao of
    acInsert:
      begin
        vRepositoryEnderecoIntegracao := TRepositoryEnderecoIntegracao.Create(Self.FDmConexao);
        try
          vRepositoryEnderecoIntegracao.Save(Self.FEnderecoIntegracaoObj)
        finally
          vRepositoryEnderecoIntegracao.Free;
        end;
      end;

    AcUpdate:
      begin
        vRepositoryEnderecoIntegracao := TRepositoryEnderecoIntegracao.Create(Self.FDmConexao);
        try
          vRepositoryEnderecoIntegracao.Update(Self.FEnderecoIntegracaoObj)
        finally
          vRepositoryEnderecoIntegracao.Free;
        end;
      end

    else Exit;
  end;
end;

end.
