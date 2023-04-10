object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Busca Pessoa'
  ClientHeight = 504
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblCodigo: TLabel
    Left = 32
    Top = 22
    Width = 42
    Height = 15
    Caption = 'C'#243'digo:'
  end
  object edtCodigo: TEdit
    Left = 80
    Top = 19
    Width = 153
    Height = 23
    TabOrder = 0
  end
  object btnBuscar: TButton
    Left = 266
    Top = 18
    Width = 105
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 112
    Width = 689
    Height = 392
    Align = alBottom
    DataSource = dmClient.dtsPessoa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'idpessoa'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flnatureza'
        Title.Caption = 'Natureza'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsdocumento'
        Title.Caption = 'Documento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmprimeiro'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmsegundo'
        Title.Caption = 'Segundo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtregistro'
        Title.Caption = 'Data Registro'
        Width = 80
        Visible = True
      end>
  end
end
