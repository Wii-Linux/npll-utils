# Wii-Linux NPLL Utilities

This repository contains multiple utilities for the Wii-Linux bootloader, known as [NPLL](https://github.com/Wii-Linux/NPLL).  
These utilities try to mirror similarly named utilities by [GRUB](https://www.gnu.org/software/grub/), the standard bootloader for x86-based Linux PCs.  
It is based on the legacy [gumboot-utils](https://github.com/Wii-Linux/gumboot-utils).  

The utilities included in this package are as follows.

## npll-mkconfig

A clone of GNU GRUB's `grub-mkconfig`.  It takes the same[^1] arguments, and behaves in the same way.  
It generates a `gumboot.lst` based on the config options specified in `/etc/default/npll`, and `/etc/npll.d`.  

If no arguments are passed, it will print the config to stdout, and log messages to stderr.
If you pass `-o`, it will write to the file path that follows.

## update-npll

A clone of Debian's `update-npll` helper script.  
It makes it possible to update your NPLL config file without needing to memorize the path, or the command line arguments.  
Instead, you can simply run `update-npll` as root, and it handles everything.

## npll-install

A clone of GNU GRUB's `grub-install`.  It takes a few of the same[^1] arguments, and should generally behave in a similar way.  
It takes an install path, which is a critical difference from GRUB's version, which instead takes an install device.  
If you accidentally pass `npll-install` a block device, it will print a warning, and attempt to figure out where you really wanted to install to.  
It will do this by searching your mounted filesystems for the block device that you've provided.  
If found, it will install to the path where the block device is mounted.  

Note that `npll-install` will install NPLL, as well as it's associated fork of [MINI](https://github.com/Wii-Linux/mini) directly.  
It **will overwrite** any existing `npll.elf`, `bootmii/armboot.bin`, and `bootmii/gui.elf`
It will not update `bootmii/ppcboot.elf`.

Note as well that `npll-install`, like `grub-install`, does not generate a configuration file.

## Installation / Building

This doesn't really need to be built, since it's all shell scripts.  
However, it does need to downlad important binaries for NPLL and BootMii.  
You can do that with `make download`, or simply `make`.

After downloaded, you can install to a directory of choice with `make install`.  
By default it'll install to [pwd]/install, but this can be overriden with the `DESTDIR` parameter.  
For example: `make install DESTDIR=/` to install to the local rootfs.  

### Notes

[^1]: Long options (e.g. `--output=/some_file.cfg`) are not supported due to limitations of the builtin `getopt` in POSIX `sh`.
