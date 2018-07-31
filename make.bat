rm Configurator.msi
candle Configurator.wxs
light -ext WixUIExtension -ext WixUtilExtension.dll Configurator.wixobj