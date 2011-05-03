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

CONFIGURATION
=============
You will need to first check out this repository, if you haven't already. For the sake of this README we will assume that everything is done in a dev directory within your home directory '~/dev'.

git This
--------
	mkdir ~/dev
	cd ~/dev
	git clone https://bubba-h57@github.com/bubba-h57/vips-win32.git
	cd ~/dev/vips-win32/7.24

GNOME win32 Packages
---------
As we are building a win32 executable, we need some DLL's to link against, and the GNOME project kindly provides us with a large number of these ready to use! Just create a package directory, download them to that directory, and run the script. Something like this:

	~/dev/vips-win32/latest/get-win32-packages.sh


If you desire to modify the packages used, just open up the gnome-win32-libs-list and go to it! This is completely optional though, as the ones checked out "should" work just fine for you needs.

	vi ~/dev/vips-win32/latest/gnome-win32-libs-list

JHBUILD VERIFICATION
====================
We just want to make sure that jhbuild has everything it needs. If all steps have been properly followed up to this point, this should be a no brainer.
	
	~/dev/vips-win32/latest/jhbuild --file=jhbuildrc sanitycheck

This will most likely complain that it couldn't find automake-1.8 which is fine, we didn't install that. If it complains about anything else, let me know.


BUILD
=====
	~/dev/vips-win32/7.24/jhbuild --file=jhbuildrc --moduleset=vips.modules build libvips

PACKAGE
=======
	~/dev/vips-win32/7.24/package-vipsdev.sh

UPLOAD YOUR PACKAGE
===================
Assuming everything has worked perfectly up to this point, you will find vips-dev-7.24.5.zip all packaged up and ready to go. You might upload it to your favorite server via scp like this:
	scp ~/dev/vips-win32/7.24/vips-dev-7.24.5.zip <YOURID>@<YOURSERVER>:/your/favorite/directory

CLEAN UP
========
It is always good to clean up after yourself. Be careful though, this command will delete the package you just created! You did upload it to your favorite server didn't you?
	~/dev/vips-win32/7.24/clean.sh

OTHER NOTES
===========
Version Numbers
---------------
The scripts currently default to a versioning system of package-major.minor.micro-release like so 7.24.5-1 in order to make everything drop dead simple.

However, it is really preferred for you to version your own package micro-releases.

You can modify the versions by editing these scripts:
	clean.sh
	package-vipsdev.sh


Patching
--------
A primary reason one might desire to build their own executable, you simply want 
to make a few changes to the code, or otherwise control how it was compiled. First
clean it all up:
    
    ~/dev/vips-win32/7.24/clean.sh

Remember that after cleaning, we need to redo the packages:

    ~/dev/vips-win32/7.24/package-vipsdev.sh

Then we tell jhbuild to simply download and set up the environment, but not actually
build anything:

    ~/dev/vips-win32/7.24/jhbuild --file=jhbuildrc --moduleset=vips.modules update libvips

Now you are all set to open your favorite editor, apply someone elses patch, etc.
Once you are done, you want to build without resetting the environment, the 
--no-network flag is key in this next command, otherwise, your changes will be
overwritten.

    ~/dev/vips-win32/7.24/jhbuild --file=jhbuildrc --moduleset=vips.modules build libvips --no-network

You should find your executable built with all your changes. Congratulations.