VIPS WIN32
==========

We use jhbuilder to git, mingw to compile, and good old zip to package the vips source code for WIN32. 

[JHBuild] (http://live.gnome.org/Jhbuild)
-----------------------------------------

JHBuild is a tool designed to ease building collections of source packages, called “modules”. JHBuild uses “module set” files to describe the modules available to build. The “module set” files include dependency information that allows JHBuild to discover what modules need to be built and in what order. 

[MinGW](http://www.mingw.org/)
-----------------------------

MinGW, a contraction of "Minimalist GNU for Windows", is a minimalist development environment for native Microsoft Windows applications.

MinGW provides a complete Open Source programming tool set which is suitable for the development of native MS-Windows applications, and which do not depend on any 3rd-party C-Runtime DLLs. (It does depend on a number of DLLs provided by Microsoft themselves, as components of the operating system; most notable among these is MSVCRT.DLL, the Microsoft C runtime library. Additionally, threaded applications must ship with a freely distributable thread support DLL, provided as part of MinGW itself).

PREREQUISITES
=============
[Ubuntu Desktop 10.10 x32] (http://www.ubuntu.com/desktop/get-ubuntu/download) - This doesn't mean you can't get the process to work on anything else. This is simply what we are using and know to work.

OPTIONAL
========
[VMware Player] (http://www.vmware.com/products/player/) - Bubba runs his Ubuntu Desktop in a VMWare Player on a Windows 7 Ultimate x64 Desktop host.

[DEPENDENCIES] (http://xkcd.com/754/)
==============
It is possible that you already have some of these installed on your Ubuntu Desktop; however, it is not likely that you have all of them. Better safe than sorry, install them all. You might even want to update the whole kit, just for the heck of it.

Build/Tool Related Dependencies
-------
    sudo apt-get install build-essential \
	wine \
	mingw32 \
	jhbuild \
	autoconf \
	automake1.4 \
	automake1.7 \
	automake1.9 \
	autotools-dev \
	docbook-utils \
	docbook2x \
	gtk-doc-tools

Library Dependencies
-------
	sudo apt-get install libatk1.0-0 \
	libatk1.0-dev \
	libglib2.0-0 \
	libglib2.0-dev \
	libgtk2.0-0 \
	libgtk2.0-dev \
	libglade2-0 \
	libglade2-dev \
	libgsf-1-114 \
	libgsf-gnome-1-dev \
	libpango1.0-0 \
	libpango1.0-dev \
	libcairo2 \
	libcairo2-dev \
	libexpat1 \
	libexpat1-dev \
	libfontconfig1 \
	libfontconfig1-dev \
	libfreetype6 \
	libfreetype6-dev \
	gettext \
	libpng12-0 \
	libpng12-dev \
	libxml2 \
	libxml2-dev \
	tango-icon-theme \
	libcxxtools6 \
	libcxxtools-dev \
	zlib1g \
	zlib1g-dev \
	zlibc 

SUMMARY
=======
Check specific build folders for further instructions.