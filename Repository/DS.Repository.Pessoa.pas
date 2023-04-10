unit DS.Repository.Pessoa;

interface

uses DS.Model.Entidades.Pessoa, FireDAC.Comp.Client , FireDAC.Stan.Param,
     FireDac.DApt, Data.DBXPlatform;

type
  TRepositoryPessoa = class
    private
      FDmConexao :  TFDConnection;
      FPessoaObj :  TPessoaObj;
      FQuery     :  TFDQuery;
      function GetSqlInsert : String;
      function GetSqlUpdate : String;
      function GetSqlDelete : String;
      function GetSqlSelect : String;
    public
      constructor Create(ADmConexao : TFDConnection);
      destructor  Destroy; override;
      function   Save(APessoaObj: TPessoaObj): TFDQuery;
      procedure   Update(APessoaObj: TPessoaObj);
      procedure   Delete(AIdPessoa: Integer);
      function   Get(AIdPessoa : Integer = 0): TFDQuery;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;



{ TRepositoryPessoa }

constructor TRepositoryPessoa.Create(ADmConexao: TFDConnection);
begin
   Self.FDmConexao := ADmConexao;
   Self.FPessoaObj := TPessoaObj.Create;
   Self.FQuery := TFDQuery.Create(Nil);
   Self.FQuery.Connection := Self.FDmConexao;
   Self.FQuery.CachedUpdates := True;
end;

destructor TRepositoryPessoa.Destroy;
begin
  Self.FPessoaObj.Free;
  inherited;
end;


function TRepositoryPessoa.Get(AIdPessoa : Integer = 0) : TFDQuery;
begin
  Result := nil;

  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlSelect;
    Self.FQuery.ParamByName('IDPESSOA').AsInteger := AIdPessoa;
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

procedure TRepositoryPessoa.Delete(AIdPessoa: Integer);
begin
   Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlDelete;
    Self.FQuery.ParamByName('idpessoa').AsInteger := AIdPessoa;
    Self.FQuery.ExecSQL;
    GetInvocationMetadata().ResponseCode := 200;
  except
    on E: Exception do
    begin
      GetInvocationMetadata().ResponseCode := 200;
      ShowMessage(E.Message);
      Abort;
    end;
  End;
end;

function TRepositoryPessoa.Save(APessoaObj: TPessoaObj): TFDQuery;
var
  vIDPessoa: Integer;
  vSQL : String;
begin
  vSQL := Self.GetSqlInsert;
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    vSQL := vSQL.Replace(':flnatureza', APessoaObj.lNatureza.ToString);
    vSQL := vSQL.Replace(':dsdocumento', QuotedStr(APessoaObj.dsDocumento));
    vSQL := vSQL.Replace(':nmprimeiro',  QuotedStr(APessoaObj.nmPrimeiro)) ;
    vSQL := vSQL.Replace(':nmsegundo',  QuotedStr(APessoaObj.nmsegundo));
    Self.FQuery.Open(vSQL);
    vIDPessoa := Self.FQuery.FieldByName('idpessoa').AsInteger;
    Result := Self.Get(vIDPessoa);
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

procedure TRepositoryPessoa.Update(APessoaObj: TPessoaObj);
begin
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlUpdate;
    Self.FQuery.ParamByName('idpessoa').AsInteger   := APessoaObj.idPessoa;
    Self.FQuery.ParamByName('flnatureza').AsInteger := APessoaObj.lNatureza;
    Self.FQuery.ParamByName('dsdocumento').AsString := APessoaObj.dsDocumento;
    Self.FQuery.ParamByName('nmprimeiro').AsString  := APessoaObj.nmPrimeiro;
    Self.FQuery.ParamByName('nmsegundo').AsString   := APessoaObj.nmsegundo;
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

function TRepositoryPessoa.GetSqlDelete: String;
begin
  Result := 'DELETE FROM PESSOA WHERE IDPESSOA = :IDPESSOA';
end;

function TRepositoryPessoa.GetSqlInsert: String;
begin
  Result := 'INSERT INTO PESSOA ' +
            '(flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro)             ' +
	          'VALUES(:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, CURRENT_DATE) ' +
            'RETURNING cast(idpessoa as Integer)                        ' ;
end;

function TRepositoryPessoa.GetSqlSelect: String;
begin
  Result := 'SELECT * FROM PESSOA WHERE IDPESSOA = :IDPESSOA OR :IDPESSOA = 0';
end;

function TRepositoryPessoa.GetSqlUpdate: String;
begin
  Result := 'UPDATE PESSOA                                               '+
	'             SET flnatureza= :flnatureza, dsdocumento= :dsdocumento,  '+
  '                 nmprimeiro=:nmprimeiro, nmsegundo=:nmsegundo         '+
	'           WHERE idpessoa = :idpessoa                                 ';
end;

end.

