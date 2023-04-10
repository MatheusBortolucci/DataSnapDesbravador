object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 482
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblCódigo: TLabel
    Left = 80
    Top = 32
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 86
    Top = 111
    Width = 33
    Height = 15
    Caption = 'Nome'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 58
    Top = 150
    Width = 61
    Height = 15
    Caption = 'Sobrenome'
    FocusControl = DBEdit2
  end
  object lblNatureza: TLabel
    Left = 72
    Top = 72
    Width = 47
    Height = 15
    Caption = 'Natureza'
    FocusControl = DBEdit3
  end
  object lblDocumento: TLabel
    Left = 315
    Top = 72
    Width = 63
    Height = 15
    Caption = 'Documento'
    FocusControl = DBEdit4
  end
  object Label1: TLabel
    Left = 291
    Top = 32
    Width = 86
    Height = 15
    Caption = 'Data de Registro'
  end
  object Label3: TLabel
    Left = 315
    Top = 266
    Width = 14
    Height = 15
    Caption = 'UF'
    FocusControl = DBEdit6
  end
  object Label4: TLabel
    Left = 82
    Top = 265
    Width = 37
    Height = 15
    Caption = 'Cidade'
    FocusControl = DBEdit7
  end
  object Label5: TLabel
    Left = 88
    Top = 307
    Width = 31
    Height = 15
    Caption = 'Bairro'
    FocusControl = DBEdit8
  end
  object lblLogradouro: TLabel
    Left = 57
    Top = 352
    Width = 62
    Height = 15
    Caption = 'Logradouro'
    FocusControl = DBEdit9
  end
  object Label8: TLabel
    Left = 42
    Top = 391
    Width = 77
    Height = 15
    Caption = 'Complemento'
    FocusControl = DBEdit10
  end
  object lblCEP: TLabel
    Left = 98
    Top = 223
    Width = 21
    Height = 15
    Caption = 'CEP'
    FocusControl = edtCEP
  end
  object btnSalvar: TButton
    Left = 131
    Top = 432
    Width = 96
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = btnSalvarClick
  end
  object DBEdit1: TDBEdit
    Left = 125
    Top = 108
    Width = 416
    Height = 23
    DataField = 'nmprimeiro'
    DataSource = dmClient.dtsPessoa
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 125
    Top = 147
    Width = 416
    Height = 23
    DataField = 'nmsegundo'
    DataSource = dmClient.dtsPessoa
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 125
    Top = 69
    Width = 148
    Height = 23
    DataField = 'flnatureza'
    DataSource = dmClient.dtsPessoa
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 387
    Top = 69
    Width = 154
    Height = 23
    DataField = 'dsdocumento'
    DataSource = dmClient.dtsPessoa
    TabOrder = 2
  end
  object dbEditCodigo: TDBEdit
    Left = 125
    Top = 29
    Width = 49
    Height = 23
    DataField = 'idpessoa'
    DataSource = dmClient.dtsPessoa
    Enabled = False
    TabOrder = 7
  end
  object dataRegistro: TDateTimePicker
    Left = 387
    Top = 29
    Width = 104
    Height = 23
    Date = 45024.000000000000000000
    Time = 0.438476284725766200
    Enabled = False
    TabOrder = 8
  end
  object btnBuscarCEP: TButton
    Left = 313
    Top = 219
    Width = 105
    Height = 25
    Caption = 'Buscar CEP'
    TabOrder = 6
    OnClick = btnBuscarCEPClick
  end
  object DBEdit6: TDBEdit
    Left = 337
    Top = 263
    Width = 81
    Height = 23
    DataField = 'Dsuf'
    DataSource = dmClient.dtsEnderecoIntegracao
    Enabled = False
    TabOrder = 9
  end
  object DBEdit7: TDBEdit
    Left = 125
    Top = 263
    Width = 161
    Height = 23
    DataField = 'nmCidade'
    DataSource = dmClient.dtsEnderecoIntegracao
    Enabled = False
    TabOrder = 10
  end
  object DBEdit8: TDBEdit
    Left = 125
    Top = 304
    Width = 161
    Height = 23
    DataField = 'nmBairro'
    DataSource = dmClient.dtsEnderecoIntegracao
    Enabled = False
    TabOrder = 11
  end
  object DBEdit9: TDBEdit
    Left = 125
    Top = 349
    Width = 293
    Height = 23
    DataField = 'nmLogradouro'
    DataSource = dmClient.dtsEnderecoIntegracao
    Enabled = False
    TabOrder = 12
  end
  object DBEdit10: TDBEdit
    Left = 125
    Top = 388
    Width = 293
    Height = 23
    DataField = 'dscomplemento'
    DataSource = dmClient.dtsEnderecoIntegracao
    Enabled = False
    TabOrder = 13
  end
  object edtCEP: TDBEdit
    Left = 125
    Top = 221
    Width = 155
    Height = 23
    DataField = 'dscep'
    DataSource = dmClient.dtsEndereco
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = -7
    Top = 182
    Width = 616
    Height = 24
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    Caption = 'Endere'#231'o Cliente'
    TabOrder = 14
  end
  object Button1: TButton
    Left = 364
    Top = 432
    Width = 105
    Height = 25
    Caption = 'Apagar'
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 483
    Top = 432
    Width = 105
    Height = 25
    Caption = 'Buscar'
    TabOrder = 16
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 244
    Top = 432
    Width = 105
    Height = 25
    Caption = 'Alterar'
    TabOrder = 17
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 432
    Width = 96
    Height = 25
    Caption = 'Novo'
    TabOrder = 18
    OnClick = Button4Click
  end
end
