#!/bin/bash

basedir=/home/john/windows-jhbuild
version=2.2

installdir=$basedir/inst
repackagedir=$basedir/ptmfit-$version

echo copying install area $installdir

rm -rf $repackagedir
cp -r $installdir $repackagedir

echo cleaning build $repackagedir

( cd $repackagedir/bin ; mkdir poop ; mv ptm* poop ; mv *.dll poop ; rm -f * ; mv poop/* . ; rmdir poop )
( cd $repackagedir/bin ; rm -f libatk-1.0-0.dll libcairo-2.dll libgdk_pixbuf-2.0-0.dll libgdk-win32-2.0-0.dll libglade-2.0-0.dll libgtk-win32-2.0-0.dll libpangocairo-1.0-0.dll )

( cd $repackagedir ; rm -rf include )

( cd $repackagedir ; rm -rf etc )

# we don't need any parts of lib, we've built things with modules included
( cd $repackagedir ; rm -rf lib )

( cd $repackagedir ; rm -rf make )

( cd $repackagedir ; rm -rf man )

( cd $repackagedir ; rm -rf manifest )

( cd $repackagedir ; rm -rf share )

( cd $repackagedir ; rm -rf src )


