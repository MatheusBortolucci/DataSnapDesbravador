object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/tpessoaservice/pessoa'
    ContentType = 'application/json'
    Params = <>
    Left = 48
    Top = 24
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvAccept, rvAcceptCharset, rvAcceptEncoding, rvConnectTimeout, rvReadTimeout]
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    AcceptEncoding = ''
    Client = RESTClient1
    Method = rmPUT
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body0707C5690FD54097816533CF694AFF8D'
        Value = 
          '{'#13#10#9'"flnatureza":12312,'#13#10#9'"dsdocumento":"aaaaa",'#13#10#9'"nmprimeiro":' +
          '"bbbbb",'#13#10#9'"nmsegundo":"ccccc"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = RESTResponse1
    Left = 48
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 48
    Top = 160
  end
end
