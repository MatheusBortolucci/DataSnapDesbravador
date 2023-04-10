unit ClientDataSnap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient,
  DataSetConverter4D.Helper, DataSetConverter4D.Impl,
  Vcl.Grids, Vcl.DBGrids, System.JSON, REST.Response.Adapter;

type
  TForm2 = class(TForm)
    btnSalvar: TButton;
    lblCódigo: TLabel;
    lblNome: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    lblNatureza: TLabel;
    DBEdit3: TDBEdit;
    lblDocumento: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    dbEditCodigo: TDBEdit;
    dataRegistro: TDateTimePicker;
    btnBuscarCEP: TButton;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    lblLogradouro: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    lblCEP: TLabel;
    edtCEP: TDBEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit2, uDmClient, Unit3;

procedure TForm2.btnBuscarCEPClick(Sender: TObject);
begin
  if edtCEP.Text = EmptyStr then
  begin
    ShowMessage('É necessario informar o CEP!');
    exit;
  end;

  dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/tEnderecoService/GetDadosCEP/' + edtCEP.Text;

  dmClient.reqGeral.Method := rmGET;

  dmClient.restResponse.Dataset := dmClient.cdsEnderecoIntegracao;

  dmClient.reqGeral.Execute;
end;

procedure TForm2.btnSalvarClick(Sender: TObject);
begin
  if edtCEP.Text <> EmptyStr then
  begin
    dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/tpessoaservice/pessoa';

    dmClient.reqGeral.Method := rmPUT;
    dmClient.restResponse.Dataset := dmClient.cdsPessoa;

    dmClient.cdsPessoaAux.Append;
    dmClient.cdsPessoaAux.FieldByName('flnatureza').AsFloat := dmClient.cdsPessoa.FieldByName('flnatureza').AsFloat;
    dmClient.cdsPessoaAux.FieldByName('dsdocumento').AsString := dmClient.cdsPessoa.FieldByName('dsdocumento').AsString;
    dmClient.cdsPessoaAux.FieldByName('nmprimeiro').AsString  := dmClient.cdsPessoa.FieldByName('nmprimeiro').AsString;
    dmClient.cdsPessoaAux.FieldByName('nmsegundo').AsString  := dmClient.cdsPessoa.FieldByName('nmsegundo').AsString;
    dmClient.cdsPessoaAux.Post;

    dmClient.reqGeral.AddBody(dmClient.cdsPessoaAux.AsJSONObject.ToJSON, ContentTypeFromString('application/json'));
    dmClient.reqGeral.Execute;


    //inserindoendereco
    dmClient.cdsEnderecoAux.Append;
    dmClient.cdsEnderecoAux.FieldByName('idpessoa').AsFloat :=  dmClient.cdspessoa.FieldByName('idpessoa').AsFloat;
    dmClient.cdsEnderecoAux.FieldByName('dscep').AsString :=  dmClient.cdsEndereco.FieldByName('dscep').AsString ;
    dmClient.cdsEnderecoAux.Post;

    dmClient.RESTRequestEndereco.Method := rmPUT;
    dmClient.RESTRequestEndereco.AddBody(dmClient.cdsEnderecoAux.AsJSONObject.ToJSON, ContentTypeFromString('application/json'));
    dmClient.RESTRequestEndereco.Execute;


    dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/TEnderecoService/enderecointegracao/' + dmClient.cdsEndereco.FieldByName('idendereco').AsString;

    dmClient.reqGeral.Method := rmGET;

    dmClient.restResponse.Dataset := dmClient.cdsEnderecoIntegracao;

    dmClient.reqGeral.Execute;
  end
  else
  begin
    ShowMessage('Não é permitido cadastrar uma endereco sem endereço!');
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/TEnderecoService/pessoa/' + dbEditCodigo.Text;

  dmClient.reqGeral.Method := rmDELETE;

  dmClient.restResponse.Dataset := dmClient.cdsPessoa;

  dmClient.reqGeral.Execute;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  formBusca : TForm3;
begin
  formBusca := TForm3.Create(Application);
  try
    formBusca.ShowModal;
  finally
    formBusca.Free;
    dataRegistro.Date := dmClient.cdsPessoa.FieldByName('dtregistro').AsDateTime;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if edtCEP.Text = EmptyStr then
  begin
    ShowMessage('É necessario informar o CEP!');
    exit;
  end;

  if dbEditCodigo.Text = EmptyStr then
  begin
    ShowMessage('É necessário selecionar uma pessoa!');
  end
  else
  begin
    dmClient.cdsPessoa.Post;
    dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/tpessoaservice/pessoa';

    dmClient.reqGeral.Method := rmPost;
    dmClient.restResponse.Dataset := dmClient.cdsPessoa;
    dmClient.reqGeral.AddBody(dmClient.cdsPessoa.AsJSONObject.ToJSON, ContentTypeFromString('application/json'));
    dmClient.reqGeral.Execute;

    dmClient.RESTRequestEndereco.Method := rmPost;
    dmClient.RESTRequestEndereco.AddBody(dmClient.cdsEndereco.AsJSONObject.ToJSON, ContentTypeFromString('application/json'));
    dmClient.RESTRequestEndereco.Execute;

    dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/TEnderecoService/enderecointegracao/' + dmClient.cdsEndereco.FieldByName('idendereco').AsString;

    dmClient.reqGeral.Method := rmGET;

    dmClient.restResponse.Dataset := dmClient.cdsEnderecoIntegracao;

    dmClient.reqGeral.Execute;
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  dmClient.cdsPessoa.EmptyDataSet;
  dmClient.cdsEndereco.EmptyDataSet;
  dmClient.cdsEnderecoIntegracao.EmptyDataSet;
end;

end.
