unit DS.Model.Entidades.Endereco;

interface

Type
  TEnderecoObj = class(TObject)
    private
      FIdEndereco: Integer;
      FIdPessoa  : Integer;
      FDsCep     : String;
    procedure SetDsCep(const Value: String);
    procedure SetIdEndereco(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    public
      property IdEndereco : Integer  read FIdEndereco write SetIdEndereco;
      property IdPessoa   : Integer  read FIdPessoa   write SetIdPessoa;
      property DsCep   : String  read FDsCep   write SetDsCep;
  end;

implementation

{ TEnderecoObj }

procedure TEnderecoObj.SetDsCep(const Value: String);
begin
  FDsCep := Value;
end;

procedure TEnderecoObj.SetIdEndereco(const Value: Integer);
begin
  FIdEndereco := Value;
end;

procedure TEnderecoObj.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

end.
