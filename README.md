Configurator-msi
================

[![Build status](https://ci.appveyor.com/api/projects/status/c48yj34wv54tcx69?svg=true)](https://ci.appveyor.com/project/smasher816/configurator-msi)

This creates a windows installer for the Input Club [Kiibohd Configurator](https://github.com/kiibohd/configurator).

The installer will install the configurator, along with libusbK drivers for the devices in kiibohd.conf, and a generic WCID driver for future devices

Development
-----
 * Run `update.bat` to grab the dependencies
 * Run `make.bat` to create the msi
 * Run `install.bat` to install the package with debugging info printed to `install.log`

wix's [heat](http://wixtoolset.org/documentation/manual/v3/overview/heat.html) is useful for updating the install files list in `Configurator.wxs`

Versioning
----------
See http://wixtoolset.org/documentation/manual/v3/howtos/updates/major_upgrade.html
