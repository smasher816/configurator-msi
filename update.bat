SET CONFIGURATOR_TAG=0.4.1
SET KIIDRV_TAG=1.5.0
SET BOSSA_TAG=v1.9-kiibohd
SET LIBUSBK_VERSION=3.0.7.0
SET ZADIG_VERSION=2.4

SET CONFIGURATOR_ZIP="https://github.com/kiibohd/configurator/releases/download/v%CONFIGURATOR_TAG%/kiibohd-configurator-%CONFIGURATOR_TAG%-win.zip"
SET KIIDRV32="https://github.com/kiibohd/kiidrv/releases/download/v%KIIDRV_TAG%/kiidrv-Win32-Release.exe"
SET KIIDRV64="https://github.com/kiibohd/kiidrv/releases/download/v%KIIDRV_TAG%/kiidrv-x64-Release.exe"
SET KIIDRV_CONF="https://github.com/kiibohd/kiidrv/releases/download/v%KIIDRV_TAG%/kiibohd.conf"
SET BOSSA="https://github.com/kiibohd/BOSSA/releases/download/%BOSSA_TAG%/bossa-%BOSSA_TAG%.zip"
SET LIBUSBK="https://superb-sea2.dl.sourceforge.net/project/libusbk/libusbK-release/%LIBUSBK_VERSION%/libusbK-%LIBUSBK_VERSION%-bin.7z"
SET DFU32_DIR="http://dfu-util.sourceforge.net/releases/dfu-util-0.8-binaries/win32-mingw32"
SET DFU64_ZIP="http://dfu-util.sourceforge.net/releases/dfu-util-0.9-win64.zip"
SET ZADIG="https://zadig.akeo.ie/downloads/zadig-%ZADIG_VERSION%.exe"

:clean
rd /s /q kiibohd-configurator
rd /s /q dfu-util-0.8-win32
rd /s /q dfu-util-0.9-win64

:update_configurator
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %CONFIGURATOR_ZIP% -OutFile kiibohd-configurator-win.zip"
powershell -Command "Expand-Archive kiibohd-configurator-win.zip -DestinationPath kiibohd-configurator -Force"
rm kiibohd-configurator-win.zip

:update_kiidrv
mkdir kiidrv
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %KIIDRV32% -OutFile kiidrv\kiidrv-Win32-Release.exe"
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %KIIDRV64% -OutFile kiidrv\kiidrv-x64-Release.exe"
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %KIIDRV_CONF% -OutFile kiidrv\kiibohd.conf"

:update_bossa
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %BOSSA% -OutFile bossa.zip"
powershell -Command "Expand-Archive bossa.zip -DestinationPath . -Force"
rm bossa.zip

:update_libusbk
mkdir driver
mkdir driver\x86
mkdir driver\amd64
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %LIBUSBK% -OutFile libusbK-bin.7z"
7z x libusbK-bin.7z

cp libusbK-%LIBUSBK_VERSION%-bin\bin\exe\x86\dpscat.exe  driver\dpscat32.exe
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\x86\libusb0.dll driver\x86\libusb0.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\x86\libusbK.dll driver\x86\libusbK.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\x86\libusb0.sys driver\x86\libusb0.sys
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\x86\libusbK.sys driver\x86\libusbK.sys
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\x86\WdfCoInstaller01009.dll driver\x86\WdfCoInstaller01009.dll

cp libusbK-%LIBUSBK_VERSION%-bin\bin\exe\amd64\dpscat.exe  driver\dpscat64.exe
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\amd64\libusb0.dll driver\amd64\libusb0.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\amd64\libusbK.dll driver\amd64\libusbK.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\amd64\libusb0.sys driver\amd64\libusb0.sys
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\amd64\libusbK.sys driver\amd64\libusbK.sys
cp libusbK-%LIBUSBK_VERSION%-bin\bin\sys\amd64\WdfCoInstaller01009.dll driver\amd64\WdfCoInstaller01009.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\x86\libusb0.dll driver\amd64\libusb0_x86.dll
cp libusbK-%LIBUSBK_VERSION%-bin\bin\dll\x86\libusbK.dll driver\amd64\libusbK_x86.dll
rd /s /q libusbK-%LIBUSBK_VERSION%-bin
rm libusbK-bin.7z

:update_dfu32
mkdir dfu-util-0.8-win32
powershell -Command "Invoke-WebRequest %DFU32_DIR%/dfu-prefix.exe -OutFile dfu-util-0.8-win32\dfu-prefix.exe"
powershell -Command "Invoke-WebRequest %DFU32_DIR%/dfu-suffix.exe -OutFile dfu-util-0.8-win32\dfu-suffix.exe"
powershell -Command "Invoke-WebRequest %DFU32_DIR%/dfu-util-static.exe -OutFile dfu-util-0.8-win32\dfu-util-static.exe"
powershell -Command "Invoke-WebRequest %DFU32_DIR%/dfu-util.exe -OutFile dfu-util-0.8-win32\dfu-util.exe"
powershell -Command "Invoke-WebRequest %DFU32_DIR%/libusb-1.0.dll -OutFile dfu-util-0.8-win32\libusb-1.0.dll"

:update_dfu64
powershell -Command "Invoke-WebRequest %DFU64_ZIP% -OutFile dfu-util-win64.zip"
powershell -Command "Expand-Archive dfu-util-win64.zip -DestinationPath . -Force"
rm dfu-util-win64.zip

:update_zadig
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest %ZADIG% -OutFile zadig-%ZADIG_VERSION%.exe"