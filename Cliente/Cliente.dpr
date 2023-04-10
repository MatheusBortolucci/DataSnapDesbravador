program Cliente;

uses
  Vcl.Forms,
  ClientDataSnap in 'ClientDataSnap.pas' {Form2},
  DataSetConverter4D.Helper in 'Helper\DataSetConverter4D.Helper.pas',
  DataSetConverter4D.Impl in 'Helper\DataSetConverter4D.Impl.pas',
  DataSetConverter4D in 'Helper\DataSetConverter4D.pas',
  DataSetConverter4D.Util in 'Helper\DataSetConverter4D.Util.pas',
  uDmClient in 'uDmClient.pas' {dmClient: TDataModule},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmClient, dmClient);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
