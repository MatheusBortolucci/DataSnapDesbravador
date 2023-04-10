object dmClient: TdmClient
  Height = 480
  Width = 640
  object ClientGeral: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TEnderecoService/endereco'
    Params = <>
    SynchronizedEvents = False
    Left = 72
    Top = 104
  end
  object reqGeral: TRESTRequest
    Client = ClientGeral
    Params = <>
    Response = resGeral
    SynchronizedEvents = False
    Left = 72
    Top = 184
  end
  object resGeral: TRESTResponse
    Left = 72
    Top = 264
  end
  object restResponse: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Response = resGeral
    TypesMode = JSONOnly
    Left = 72
    Top = 344
  end
  object dtsEndereco: TDataSource
    DataSet = cdsEndereco
    Left = 384
    Top = 48
  end
  object cdsEndereco: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD01000000180000000300000000000300000058000A696465
      6E64657265636F0400010000000000086964706573736F610400010000000000
      05647363657001004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idendereco'
        DataType = ftInteger
      end
      item
        Name = 'idpessoa'
        DataType = ftInteger
      end
      item
        Name = 'dscep'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 48
    object cdsEnderecoidendereco: TIntegerField
      FieldName = 'idendereco'
    end
    object cdsEnderecoidpessoa: TIntegerField
      FieldName = 'idpessoa'
    end
    object cdsEnderecodscep: TStringField
      FieldName = 'dscep'
    end
  end
  object dtsEnderecoIntegracao: TDataSource
    DataSet = cdsEnderecoIntegracao
    Left = 384
    Top = 120
  end
  object cdsEnderecoIntegracao: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 120
    object cdsEnderecoIntegracaonmLogradouro: TWideStringField
      FieldName = 'nmLogradouro'
      Size = 100
    end
    object cdsEnderecoIntegracaonmBairro: TWideStringField
      FieldName = 'nmBairro'
      Size = 50
    end
    object cdsEnderecoIntegracaonmCidade: TWideStringField
      FieldName = 'nmCidade'
      Size = 100
    end
    object cdsEnderecoIntegracaoDsuf: TWideStringField
      FieldName = 'Dsuf'
      Size = 2
    end
    object cdsEnderecoIntegracaodsComplemento: TWideStringField
      FieldName = 'dsComplemento'
      Size = 100
    end
  end
  object dtsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 384
    Top = 200
  end
  object cdsPessoa: TClientDataSet
    PersistDataPacket.Data = {
      CB0000009619E0BD010000001800000007000100000003000000C8000576616C
      756502004A000000010005574944544802000200FE01086964706573736F6108
      000400000000000A666C6E61747572657A6108000400000000000B6473646F63
      756D656E746F01004A00000001000557494454480200020064000A6E6D707269
      6D6569726F01004A000000010005574944544802000200C800096E6D73656775
      6E646F01004A000000010005574944544802000200C8000A6474726567697374
      726F0400060000000000000000AA2A}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'value'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idpessoa'
        DataType = ftFloat
      end
      item
        Name = 'flnatureza'
        DataType = ftFloat
      end
      item
        Name = 'dsdocumento'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'nmprimeiro'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'nmsegundo'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'dtregistro'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 200
    object cdsPessoaidpessoa: TFloatField
      FieldName = 'idpessoa'
    end
    object cdsPessoaflnatureza: TFloatField
      FieldName = 'flnatureza'
    end
    object cdsPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Size = 50
    end
    object cdsPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Size = 100
    end
    object cdsPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Size = 100
    end
    object cdsPessoadtregistro: TDateField
      FieldName = 'dtregistro'
    end
  end
  object cdsPessoaAux: TClientDataSet
    PersistDataPacket.Data = {
      8A0000009619E0BD0100000018000000040000000000030000008A000A666C6E
      61747572657A6108000400000000000B6473646F63756D656E746F01004A0000
      0001000557494454480200020064000A6E6D7072696D6569726F01004A000000
      010005574944544802000200C800096E6D736567756E646F01004A0000000100
      05574944544802000200C8000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'flnatureza'
        DataType = ftFloat
      end
      item
        Name = 'dsdocumento'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'nmprimeiro'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'nmsegundo'
        DataType = ftWideString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 280
    object FloatField2: TFloatField
      FieldName = 'flnatureza'
    end
    object WideStringField1: TWideStringField
      FieldName = 'dsdocumento'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'nmprimeiro'
      Size = 100
    end
    object WideStringField3: TWideStringField
      FieldName = 'nmsegundo'
      Size = 100
    end
  end
  object cdsEnderecoAux: TClientDataSet
    PersistDataPacket.Data = {
      450000009619E0BD010000001800000002000000000003000000450008696470
      6573736F61080004000000000005647363657001004A00000001000557494454
      480200020010000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idpessoa'
        DataType = ftFloat
      end
      item
        Name = 'dscep'
        DataType = ftWideString
        Size = 8
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 280
    object cdsEnderecoAuxidpessoa: TFloatField
      FieldName = 'idpessoa'
    end
    object cdsEnderecoAuxdscep: TWideStringField
      FieldName = 'dscep'
      Size = 8
    end
  end
  object RESTClientEndereco: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TEnderecoService/endereco'
    Params = <>
    Left = 232
    Top = 64
  end
  object RESTRequestEndereco: TRESTRequest
    Client = RESTClientEndereco
    Params = <>
    Response = RESTResponseEndereco
    Left = 232
    Top = 152
  end
  object RESTResponseEndereco: TRESTResponse
    Left = 232
    Top = 232
  end
  object RESTResponseDataSetAdapterEndereco: TRESTResponseDataSetAdapter
    Active = True
    Dataset = cdsEndereco
    FieldDefs = <>
    Response = RESTResponseEndereco
    TypesMode = JSONOnly
    Left = 232
    Top = 312
  end
end
