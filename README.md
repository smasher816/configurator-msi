Configurator-msi
================

This creates a windows installer for the Input Club [Kiibohd Configurator](https://github.com/kiibohd/configurator).

The installer will isntall the configurator, along with libusbK drivers for the devices in kiibohd.conf, and a generic WCID driver for future devices

Development
-----
 * Run `update.bat` to grab the dependencies
 * Run `make.bat` to create the msi
 * Run `install.bat` to install the package with debugging info printed to `install.log`

