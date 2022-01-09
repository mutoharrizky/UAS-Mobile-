object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      MethodType = mtGet
      Name = 'view'
      PathInfo = '/view'
      OnAction = WebModule1viewAction
    end
    item
      MethodType = mtGet
      Name = 'WebActionItem1'
      PathInfo = '/post'
    end>
  Height = 230
  Width = 415
  object UniConnection1: TUniConnection
    ProviderName = 'mySQL'
    Port = 3306
    Database = 'perpus'
    Username = 'root'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 320
    Top = 24
  end
  object spex: TUniStoredProc
    Connection = UniConnection1
    Left = 320
    Top = 104
  end
  object qex: TUniQuery
    Connection = UniConnection1
    Left = 320
    Top = 168
  end
end
