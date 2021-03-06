VIPS WIN32
==========

We use jhbuilder to git, mingw to compile, and good old zip to package the
vips source code for WIN32.

[JHBuild] (http://live.gnome.org/Jhbuild)
-----------------------------------------

JHBuild is a tool designed to ease building collections of source packages,
called “modules”. JHBuild uses “module set” files to describe the
modules available to build. The “module set” files include dependency
information that allows JHBuild to discover what modules need to be built
and in what order.

The jhbuild in Ubuntu is fine.

[MinGW](http://www.mingw.org/)
------------------------------

MinGW, a contraction of "Minimalist GNU for Windows", is a minimalist
development environment for native Microsoft Windows applications.

MinGW provides a complete Open Source programming tool set which is suitable
for the development of native MS-Windows applications, and which do not depend
on any 3rd-party C-Runtime DLLs (it does depend on a number of DLLs provided
by Microsoft themselves as components of the operating system; most notable
among these is MSVCRT.DLL, the Microsoft C runtime library. Additionally,
threaded applications must ship with a freely distributable thread support
DLL, provided as part of MinGW itself).

Debian has two main mingw packages. The more modern one, gcc-mingw-w64, is
regular gcc, built as a cross-compiler, with the normal gcc tools all able to
build win32 binaries. We use this. 

PREREQUISITES
=============
[Ubuntu Desktop] (http://www.ubuntu.com/desktop/get-ubuntu/download)
- This doesn't mean you can't get the process to work on anything else. This
is simply what we are using and know to work. Tested on 14.04 and 14.10.

OPTIONAL
========
[VMware Player] (http://www.vmware.com/products/player/) - Bubba runs his
Ubuntu Desktop in a VMWare Player on a Windows 7 Ultimate x64 Desktop host.

[DEPENDENCIES] (http://xkcd.com/754/)
==============
It is possible that you already have some of these installed on your Ubuntu
Desktop; however, it is not likely that you have all of them. Better safe
than sorry, install them all. You might even want to update the whole kit,
just for the heck of it.

Build/Tool Related Dependencies
-------------------------------
    sudo apt-get install build-essential \
	wine \
	mingw-w64 mingw-w64-tools \
	cmake \
	jhbuild \
	autotools-dev \
	docbook-utils \
	docbook2x \
	gtk-doc-tools \
	nasm \
	bison \
	flex

Library Dependencies
--------------------
    sudo apt-get install libatk1.0-0 \
	libatk1.0-dev \
	libglib2.0-dev \
	libgtk2.0-dev \
	libglade2-dev \
	libgsf-1-dev \
	libpango1.0-dev \
	libcairo2-dev \
	libexpat1-dev \
	libfontconfig1-dev \
	libfreetype6-dev \
	gettext \
	libpng12-dev \
	libxml2-dev \
	tango-icon-theme \
	zlib1g-dev 

These are Ubuntu binaries and of course we will be building a Windows
binary. However, some of the packages we build are not very good at
cross-compiling and builds can fail unless they can find a native library as
well.

CONFIGURATION
=============
You will need to first check out this repository, if you haven't already. 

git This
--------
	mkdir ~/dev
	cd ~/dev
	git clone git://github.com/jcupitt/build-win32.git
	cd build-win32/8.7

Check versions
--------------
The variables.sh script defines some common variables (eg. vips version
number) used by the other scripts. Check they are all OK, and that the version
numbers in vips.modules are up to date too.

JHBUILD VERIFICATION
====================
We just want to make sure that jhbuild has everything it needs. If all steps
have been properly followed up to this point, this should be a no brainer.

	jhbuild --file=jhbuildrc sanitycheck

This will most likely complain that it couldn't find automake-1.8 which
is fine, we didn't install that. If it complains about anything else,
let me know.

Binary packages
===============
Some packages don't build well on 32-bit systems. We download binary zips for
these. Run

  ./get-win32-packages.sh 

Building
========

  ./unpack.sh
	export BASEDIR=$(pwd)
	jhbuild --file=jhbuildrc --moduleset=vips.modules build --nodeps nip2
	./package-nip2.sh

Many servers will block direct downloads of .exe files. You might need to put
the .exe in a zip file.
