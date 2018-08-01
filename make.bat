rm Configurator.msi
candle Configurator.wxs
light -ext WixUIExtension -ext WixUtilExtension.dll Configurator.wixobj
if %ERRORLEVEL% EQU 204 exit 0
