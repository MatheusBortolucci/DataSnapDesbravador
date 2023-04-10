unit DS.Model.Entidades.EnderecoIntegracao;

interface

Type
  TEnderecoIntegracaoObj = class(TObject)
    private
      FIdEndereco   : Integer;
      FDsUF         : String;
      FnmCidade     : String;
      FnmBairro     : String;
      FnmLogradouro : String;
      FdsComplemento: String;
    procedure SetDsComplemento(const Value: String);
    procedure SetDsuf(const Value: String);
    procedure SetIdEndereco(const Value: Integer);
    procedure SetNmBairro(const Value: String);
    procedure SetNmCidade(const Value: String);
    procedure SetNmLogradouro(const Value: String);
    public
      property idEndereco    : Integer read FidEndereco    write SetIdEndereco;
      property Dsuf          : String  read FDsuf          write SetDsuf;
      property nmCidade      : String  read FnmCidade      write SetNmCidade;
      property nmBairro      : String  read FnmBairro      write SetNmBairro;
      property nmLogradouro  : String  read FnmLogradouro  write SetNmLogradouro;
      property dsComplemento : String  read FdsComplemento write SetDsComplemento;
  end;

implementation

{ TEnderecoIntegracaoObj }

procedure TEnderecoIntegracaoObj.SetDsComplemento(const Value: String);
begin
  FdsComplemento := Value;
end;

procedure TEnderecoIntegracaoObj.SetDsuf(const Value: String);
begin
  FDsuf := Value;
end;

procedure TEnderecoIntegracaoObj.SetIdEndereco(const Value: Integer);
begin
  FidEndereco := Value;
end;

procedure TEnderecoIntegracaoObj.SetNmBairro(const Value: String);
begin
  FnmBairro := Value;
end;

procedure TEnderecoIntegracaoObj.SetNmCidade(const Value: String);
begin
  FnmCidade := Value;
end;

procedure TEnderecoIntegracaoObj.SetNmLogradouro(const Value: String);
begin
  FnmLogradouro := Value;
end;

end.
