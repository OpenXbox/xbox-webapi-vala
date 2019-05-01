project('XboxWebApi', 'vala', 'c', version: '0.0.1')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('libsoup-2.4'),
    dependency('json-glib-1.0'),
    dependency('gee-0.8'),
]


sources = files(
    'src/Authentication/WindowsLiveConstants.vala',
    'src/Authentication/AuthenticationService.vala',
    'src/Authentication/Model/WindowsLiveAuthenticationQuery.vala',
    'src/Authentication/Model/WindowsLiveRefreshQuery.vala',
    'src/Authentication/Model/WindowsLiveResponse.vala',
    'src/Authentication/Model/XASDRequest.vala',
    'src/Authentication/Model/XASResponse.vala',
    'src/Authentication/Model/XASTRequest.vala',
    'src/Authentication/Model/XASURequest.vala',
    'src/Authentication/Model/XboxUserInformation.vala',
    'src/Authentication/Model/XSTSRequest.vala',
    'src/Authentication/Token/AccessToken.vala',
    'src/Authentication/Token/BaseAuthToken.vala',
    'src/Authentication/Token/DeviceToken.vala',
    'src/Authentication/Token/RefreshToken.vala',
    'src/Authentication/Token/TitleToken.vala',
    'src/Authentication/Token/UserToken.vala',
    'src/Authentication/Token/XToken.vala',
)

include_dir = include_directories('.')
libXboxWebApi = static_library('XboxWebApi',
              sources,
              dependencies: dependencies,
              install: true)

libXboxWebApi_dep = declare_dependency(
   link_with : libXboxWebApi,
   include_directories: include_dir,
)
