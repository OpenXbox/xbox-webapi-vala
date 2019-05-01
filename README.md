[![Discord](https://img.shields.io/badge/discord-OpenXbox-blue.svg)](https://discord.gg/E8kkJhQ)
[![Build Status](https://travis-ci.com/OpenXbox/xbox-webapi-vala.svg?branch=master)](https://travis-ci.com/OpenXbox/xbox-webapi-vala)

# xbox-webapi-vala

Xbox WebApi client in Vala

## DISCLAIMER

This is currently a work in progress and it is not stable or much usable in the current form.

## Build

This project requires Meson and Ninja to be build / used. You can install it by running:

* Ubuntu / Debian

```shell
apt install meson ninja
```

### To build:

```shell
meson build
cd build
ninja
```

### How to use this library

This is a static library that should be added as a dependency to you project. To do so, using Meson, just add a subproject 
dependency pointing to this repo:

* Create a `libXboxWebApi.wrap` file on your subprojects folder:

```
[wrap-git]
directory = libXboxWebApi
url = https://github.com/OpenXbox/xbox-webapi-vala.git
revision = master
```

* Add the dependency on your meson.build:

```
# Subprojects
libXboxWebApi_proj = subproject('libXboxWebApi')
libXboxWebApi_dep = libXboxWebApi_proj.get_variable('libXboxWebApi_dep')

# Adding deps
dependencies = [
    ...,
    libXboxWebApi_dep,
]
```

### Dependencies

* glib-2.0
* gobject-2.0,
* libsoup-2.4,
* json-glib-1.0
* gee-0.8

## Acknowledgements

This work is heavily based on the documentation from the [OpenXbox Team](http://openxbox.org) and their C# and Python implementations available at:

* [xbox-webapi-csharp](https://github.com/OpenXbox/xbox-webapi-csharp)
* [xbox-webapi-python](https://github.com/OpenXbox/xbox-webapi-python)

## Credits

Informations on endpoints gathered from:

* [joealcorn/xbox](https://github.com/joealcorn/xbox)
* [XboxLive REST Reference](https://docs.microsoft.com/en-us/windows/uwp/xbox-live/xbox-live-rest/atoc-xboxlivews-reference)
* [XboxLiveTraceAnalyzer APIMap](https://github.com/Microsoft/xbox-live-trace-analyzer/blob/master/Source/XboxLiveTraceAnalyzer.APIMap.csv)
* [Xbox Live Service API](https://github.com/Microsoft/xbox-live-api)

## Disclaimer

Xbox, Xbox One, Smartglass and Xbox Live are trademarks of Microsoft Corporation.
Team OpenXbox is in no way endorsed by or affiliated with Microsoft Corporation, or
any associated subsidiaries, logos or trademarks.
