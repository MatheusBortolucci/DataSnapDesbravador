object EnderecoService: TEnderecoService
  Height = 480
  Width = 640
  object RESTClient1: TRESTClient
    BaseURL = 'https://viacep.com.br/ws'
    Params = <>
    SynchronizedEvents = False
    Left = 136
    Top = 136
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 136
    Top = 208
  end
  object RESTResponse1: TRESTResponse
    Left = 136
    Top = 296
  end
end
