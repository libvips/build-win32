VIPS WIN32
==========

We use jhbuilder to git, compile, and package the vips source code for WIN32. 

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
	autotools-dev

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

CONFIGURATION
=============
You will need to first check out this repository, if you haven't already. For the sake of this README we will assume that everything is done in a dev directory within your home directory '~/dev'.

git This
--------
	mkdir ~/dev
	cd ~/dev
	git clone https://bubba-h57@github.com/bubba-h57/vips-win32.git
	cd ~/dev/build-win32/7.24

GNOME win32 Packages
---------
As we are building a win32 executable, we need some DLL's to link against, and the GNOME project kindly provides us with a large number of these ready to use! Just create a package directory, download them to that directory, and run the script. Something like this:

	mkdir packages
	cd packages 
	wget ftp://ftp.gnome.org/pub/GNOME/binaries/win32/atk/1.30/atk_1.30.0-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/atk/1.30/atk-dev_1.30.0-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/glib/2.24/glib_2.24.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/glib/2.24/glib-dev_2.24.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/gtk+/2.20/gtk+_2.20.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/gtk+/2.20/gtk+-dev_2.20.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/libglade/2.6/libglade_2.6.4-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/libglade/2.6/libglade-dev_2.6.4-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/libgsf/1.14/libgsf_1.14.17-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/libgsf/1.14/libgsf-gnome-dev_1.14.17-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/pango/1.28/pango_1.28.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/pango/1.28/pango-dev_1.28.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/cairo_1.8.10-3_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/cairo-dev_1.8.10-3_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/expat_2.0.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/expat-dev_2.0.1-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/fontconfig_2.8.0-2_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/fontconfig-dev_2.8.0-2_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/freetype_2.3.12-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/freetype-dev_2.3.12-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/gettext-runtime-0.17-1.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/gettext-runtime-dev-0.17-1.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/libpng_1.4.0-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/libpng-dev_1.4.0-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/libxml2_2.7.7-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/libxml2-dev_2.7.7-1_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/tango-icon-theme-0.8.1.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/win-iconv-dll-dev_tml-20090213_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/win-iconv-dll_tml-20090213_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/zlib_1.2.4-2_win32.zip \
	ftp://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/zlib-dev_1.2.4-2_win32.zip 

Edit the ~/dev/build-win32/7.24/clean.sh script and update the versions for nip2 and vips. They currently default to 7.24.5-1 run

	cd ~/dev/build-win32/7.24/
	~/dev/build-win32/7.24/unpack.sh
	
BUILD
=====
	~/dev/build-win32/7.24/jhbuild --file=jhbuildrc --moduleset=vips.modules build libvips

PACKAGE
=======
	~/dev/build-win32/7.24/package-vipsdev.sh

UPLOAD YOUR PACKAGE
===================
Assuming everything has worked perfectly up to this point, you will find vips-dev-7.24.5-1.zip all packaged up and ready to go. You might upload it to your favorite server via scp like this:
	scp ~/dev/build-win32/7.24/vips-dev-7.24.5-1.zip <YOURID>@<YOURSERVER>:/your/favorite/directory

CLEAN UP
========
It is always good to clean up after yourself!
	~/dev/build-win32/7.24/clean.sh

OTHER NOTES
===========
Version Numbers
---------------
The scripts currently default to a versioning system of package-major.minor.micro-release like so 7.24.5-1 in order to make everything drop dead simple.

However, it is really preferred for you to version your own package micro-releases.

You can modify the versions by editing these scripts:
	clean.sh
	package-vipsdev.sh