object PostoWebModule: TPostoWebModule
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 333
  Width = 414
  object DSHTTPWebDispatcher: TDSHTTPWebDispatcher
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 208
    Top = 123
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'templates/serverfunctioninvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 56
    Top = 184
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates/reversestring.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 208
    Top = 184
  end
  object WebFileDispatcher: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = WebFileDispatcherBeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    VirtualPath = '/'
    Left = 56
    Top = 120
  end
  object DSProxyGenerator: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider
    Writer = 'Java Script REST'
    Left = 48
    Top = 248
  end
  object DSServerMetaDataProvider: TDSServerMetaDataProvider
    Left = 208
    Top = 248
  end
end
