unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, REST.Types, System.StrUtils;

type
  TForm3 = class(TForm)
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    btnBuscar: TButton;
    DBGrid2: TDBGrid;
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses uDmClient;

procedure TForm3.btnBuscarClick(Sender: TObject);
begin
  dmClient.ClientGeral.BaseURL := 'http://localhost:8080/datasnap/rest/tpessoaservice/pessoa/' + ifthen(edtCodigo.Text = EmptyStr, '0', edtCodigo.Text);

  dmClient.reqGeral.Method := rmGET;

  dmClient.restResponse.Dataset := dmClient.cdsPessoa;

  dmClient.reqGeral.Execute;
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
begin
  Self.Close;
end;

end.
