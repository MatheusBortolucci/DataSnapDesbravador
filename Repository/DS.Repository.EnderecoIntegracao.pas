unit DS.Repository.EnderecoIntegracao;

interface

uses DS.Model.Entidades.EnderecoIntegracao, FireDAC.Comp.Client , FireDAC.Stan.Param,
     FireDac.DApt, Data.DBXPlatform;

type
  TRepositoryEnderecoIntegracao = class
    private
      FDmConexao :  TFDConnection;
      FEnderecoIntegracaoObj :  TEnderecoIntegracaoObj;
      FQuery     :  TFDQuery;
      function GetSqlInsert : String;
      function GetSqlUpdate : String;
      function GetSqlSelect : String;
    public
      constructor Create(ADmConexao : TFDConnection);
      destructor  Destroy; override;
      procedure   Save(AEnderecoIntegracaoObj: TEnderecoIntegracaoObj);
      procedure   Update(AEnderecoIntegracaoObj: TEnderecoIntegracaoObj);
      function   Get(AIdEndereco : Integer = 0) : TFDQuery;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;



{ TRepositoryEnderecoIntegracao }

constructor TRepositoryEnderecoIntegracao.Create(ADmConexao: TFDConnection);
begin
   Self.FDmConexao := ADmConexao;
   Self.FEnderecoIntegracaoObj := TEnderecoIntegracaoObj.Create;
   Self.FQuery := TFDQuery.Create(Nil);
   Self.FQuery.Connection := Self.FDmConexao;
   Self.FQuery.CachedUpdates := True;
end;

destructor TRepositoryEnderecoIntegracao.Destroy;
begin
  Self.FEnderecoIntegracaoObj.Free;
  inherited;
end;


function TRepositoryEnderecoIntegracao.Get(AIdEndereco : Integer = 0) : TFDQuery;
begin
  Result := nil;

  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlSelect;
    Self.FQuery.ParamByName('idendereco').AsInteger := AIdEndereco;
    Self.FQuery.Open;
    Result := Self.FQuery;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Abort;
    end;
  End;
end;

procedure TRepositoryEnderecoIntegracao.Save(AEnderecoIntegracaoObj: TEnderecoIntegracaoObj);
begin
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlInsert;
    Self.FQuery.ParamByName('idendereco').AsInteger   := AEnderecoIntegracaoObj.idEndereco;
    Self.FQuery.ParamByName('dsuf').AsString          := AEnderecoIntegracaoObj.Dsuf;
    Self.FQuery.ParamByName('nmcidade').AsString      := AEnderecoIntegracaoObj.nmCidade;
    Self.FQuery.ParamByName('nmbairro').AsString      := AEnderecoIntegracaoObj.nmBairro;
    Self.FQuery.ParamByName('nmlogradouro').AsString  := AEnderecoIntegracaoObj.nmLogradouro;
    Self.FQuery.ParamByName('dscomplemento').AsString := AEnderecoIntegracaoObj.dsComplemento;
    Self.FQuery.ExecSQL;
    GetInvocationMetadata().ResponseCode := 201;
  except
    on E: Exception do
    begin
      GetInvocationMetadata().ResponseCode := 400;
      ShowMessage(E.Message);
      Abort;
    end;
  End;
end;

procedure TRepositoryEnderecoIntegracao.Update(AEnderecoIntegracaoObj: TEnderecoIntegracaoObj);
begin
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlUpdate;
    Self.FQuery.ParamByName('idendereco').AsInteger   := AEnderecoIntegracaoObj.idEndereco;
    Self.FQuery.ParamByName('dsuf').AsString          := AEnderecoIntegracaoObj.Dsuf;
    Self.FQuery.ParamByName('nmcidade').AsString      := AEnderecoIntegracaoObj.nmCidade;
    Self.FQuery.ParamByName('nmbairro').AsString      := AEnderecoIntegracaoObj.nmBairro;
    Self.FQuery.ParamByName('nmlogradouro').AsString  := AEnderecoIntegracaoObj.nmLogradouro;
    Self.FQuery.ParamByName('dscomplemento').AsString := AEnderecoIntegracaoObj.dsComplemento;
    Self.FQuery.ExecSQL;
    GetInvocationMetadata().ResponseCode := 200;
  except
    on E: Exception do
    begin
      GetInvocationMetadata().ResponseCode := 400;
      ShowMessage(E.Message);
      Abort;
    end;
  End;
end;

function TRepositoryEnderecoIntegracao.GetSqlInsert: String;
begin
  Result := ' INSERT INTO endereco_integracao(idendereco, dsuf, nmcidade, '+
            '             nmbairro, nmlogradouro, dscomplemento)          '+
	          '      VALUES (:idendereco, :dsuf, :nmcidade, :nmbairro,      '+
            '              :nmlogradouro, :dscomplemento);                ';
end;

function TRepositoryEnderecoIntegracao.GetSqlSelect: String;
begin
  Result := 'SELECT * FROM endereco_integracao WHERE IDENDERECO = :IDENDERECO OR :IDENDERECO = 0';
end;

function TRepositoryEnderecoIntegracao.GetSqlUpdate: String;
begin
  Result := 'UPDATE endereco_integracao                                      '+
            '   set dsuf = :dsuf, nmcidade = :nmcidade, nmbairro = :nmbairro,      '+
            '       nmlogradouro = :nmlogradouro, dscomplemento = :dscomplemento '+
            ' WHERE IDENDERECO = :IDENDERECO                           ';
end;

end.

