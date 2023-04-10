unit DS.Model.Entidades.Pessoa;

interface

type
  TPessoaObj = class
    private
      FidPessoa   : Integer;
      FlNatureza  : Integer;
      FdsDocumento: String;
      FnmPrimeiro : String;
      Fnmsegundo  : String;
      FdtRegistro : TDate;
    procedure SetIdPessoa(const Value: Integer);
    procedure SetlNatureza(const Value: Integer);
    procedure SetDsDocumento(const Value: String);
    procedure SetDtRegistro(const Value: TDate);
    procedure SetNmPrimeiro(const Value: String);
    procedure SetNmsegundo(const Value: String);
    public
      property idPessoa    : Integer  read FidPessoa    write SetIdPessoa;
      property lNatureza   : Integer  read FlNatureza   write SetlNatureza;
      property dsDocumento : String   read FdsDocumento write SetDsDocumento;
      property nmPrimeiro  : String   read FnmPrimeiro  write SetNmPrimeiro;
      property nmsegundo   : String   read Fnmsegundo   write SetNmsegundo;
      property dtRegistro   : TDate   read FdtRegistro  write SetDtRegistro;

  end;

implementation

{ TPessoaObj }

procedure TPessoaObj.SetDsDocumento(const Value: String);
begin
  FdsDocumento := Value;
end;

procedure TPessoaObj.SetDtRegistro(const Value: TDate);
begin
  FdtRegistro := Value;
end;

procedure TPessoaObj.SetIdPessoa(const Value: Integer);
begin
  FidPessoa := Value;
end;

procedure TPessoaObj.SetlNatureza(const Value: Integer);
begin
  FlNatureza := Value;
end;

procedure TPessoaObj.SetNmPrimeiro(const Value: String);
begin
  FnmPrimeiro := Value;
end;

procedure TPessoaObj.SetNmsegundo(const Value: String);
begin
  Fnmsegundo := Value;
end;

end.
