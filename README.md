PIC32PROG Package
-----------------

This is for building pic32prog for the Dragino so you can program
chipKIT boards direct from the Linux environment.

It contains a script `run-pic32prog` which configures the UART in such
a way that it is possible to use pic32prog to communicate with the bootloader.
The UART is then re-set back to how it was before.

First create a Linino buildroot environment:

* http://wiki.linino.org/doku.php?id=wiki:getstartbuild

Next place these files into the folder

* packages/pic32prog

Enable the package in the configuration:

* make menuconfig
  * Select the package in the Development section
  * Exit and save the configuration

Now you can build the package:

    make package/pic32prog/compile
    make package/pic32prog/install

The package .ipk file will now be in:

* bin/ar71xx/packages
