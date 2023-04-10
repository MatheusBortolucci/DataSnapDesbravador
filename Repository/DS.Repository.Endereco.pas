unit DS.Repository.Endereco;

interface

uses DS.Model.Entidades.Endereco, FireDAC.Comp.Client , FireDAC.Stan.Param,
     FireDac.DApt, Data.DBXPlatform;

type
  TRepositoryEndereco = class
    private
      FDmConexao :  TFDConnection;
      FEnderecoObj :  TEnderecoObj;
      FQuery     :  TFDQuery;
      function GetSqlInsert : String;
      function GetSqlUpdate : String;
      function GetSqlDelete : String;
      function GetSqlSelect : String;
    public
      constructor Create(ADmConexao : TFDConnection);
      destructor  Destroy; override;
      function   Save(AEnderecoObj: TEnderecoObj): TFDQuery;
      function   Update(AEnderecoObj: TEnderecoObj): TFDQuery;
      procedure   Delete(AIdEndereco: Integer);
      function    Get(AIdEndereco : Integer = 0) : TFDQuery;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;



{ TRepositoryEndereco }

constructor TRepositoryEndereco.Create(ADmConexao: TFDConnection);
begin
   Self.FDmConexao := ADmConexao;
   Self.FEnderecoObj := TEnderecoObj.Create;
   Self.FQuery := TFDQuery.Create(Nil);
   Self.FQuery.Connection := Self.FDmConexao;
   Self.FQuery.CachedUpdates := True;
end;

destructor TRepositoryEndereco.Destroy;
begin
  Self.FEnderecoObj.Free;
  inherited;
end;


function TRepositoryEndereco.Get(AIdEndereco : Integer = 0) : TFDQuery;
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

procedure TRepositoryEndereco.Delete(AIdEndereco: Integer);
begin
   Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.SQL.Text := Self.GetSqlDelete;
    Self.FQuery.ParamByName('idendereco').AsInteger := AIdEndereco;
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

function TRepositoryEndereco.Save(AEnderecoObj: TEnderecoObj): TFDQuery;
var
  vSQL: String;
  vIdEndereco: integer;
begin
  vSQL := Self.GetSqlInsert;
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    vSQL := vSQL.Replace(':idpessoa', AEnderecoObj.idPessoa.ToString);
    vSQL := vSQL.Replace(':dscep', QuotedStr(AEnderecoObj.DsCep));
    Self.FQuery.Open(vSQL);
    vIdEndereco := Self.FQuery.FieldByName('idendereco').AsInteger;
    Result := Self.Get(vIdEndereco);
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

function TRepositoryEndereco.Update(AEnderecoObj: TEnderecoObj) : TFDQuery;
var
  vSQL: String;
  videndereco : Integer;
begin
  vSQL := Self.GetSqlUpdate;
  Try
    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    vSQL := vSQL.Replace(':dscep', QuotedStr(AEnderecoObj.DsCep));
    vSQL := vSQL.Replace(':idendereco', AEnderecoObj.IdEndereco.ToString);
    Self.FQuery.Open(vSQL);
    videndereco := Self.FQuery.FieldByName('idendereco').AsInteger;
    Result := Self.Get(videndereco);
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

function TRepositoryEndereco.GetSqlDelete: String;
begin
  Result := 'DELETE FROM ENDERECO WHERE IDENDERECO = :IDENDERECO';
end;

function TRepositoryEndereco.GetSqlInsert: String;
begin
  Result := 'INSERT INTO ENDERECO                  ' +
            '(idpessoa, dscep)                     ' +
	          'VALUES(:idpessoa, :dscep)             ' +
            'RETURNING cast(idendereco as Integer) ';
end;

function TRepositoryEndereco.GetSqlSelect: String;
begin
  Result := 'SELECT * FROM ENDERECO WHERE IDENDERECO = :IDENDERECO OR :IDENDERECO = 0';
end;

function TRepositoryEndereco.GetSqlUpdate: String;
begin
  Result := 'UPDATE ENDERECO                                 '+
	'             SET dscep= :dscep       '+
	'           WHERE idendereco = :idendereco                 '+
  '           RETURNING cast(idendereco as Integer)          ';
end;

end.

