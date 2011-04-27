#!/bin/bash

basedir=`pwd`
package=nip2
version=7.24.1

installdir=$basedir/inst
repackagedir=$basedir/$package-$version

echo copying install area $installdir

rm -rf $repackagedir
cp -r $installdir $repackagedir

echo cleaning build $repackagedir

# rename all the i586-pc-mingw32-animate.exe etc. without the prefix
( cd $repackagedir/bin ; for i in i586-pc-mingw32-*; do mv $i `echo $i | sed s/i586-pc-mingw32-//`; done )

( cd $repackagedir/bin ; mkdir poop ; mv *nip2* poop ; mv *.dll poop ; rm -f * ; mv poop/* . ; rmdir poop )

( cd $repackagedir/bin ; rm -f libvipsCC-15.dll run-nip2.sh )

( cd $repackagedir/bin ; strip --strip-unneeded *.exe )

# for some reason we can't strip zlib1
( cd $repackagedir/bin ; mkdir poop ; mv zlib1.dll poop ; strip --strip-unneeded *.dll ; mv poop/zlib1.dll . ; rmdir poop )

( cd $repackagedir/share ; rm -rf aclocal applications glib-2.0 gtk-2.0 gtk-doc ImageMagick-* info jhbuild man mime pixmaps xml goffice)

( cd $repackagedir/share/doc ; mkdir ../poop ; mv nip2 ../poop ; rm -rf * ; mv ../poop/nip2 . ; rmdir ../poop )

( cd $repackagedir/share/doc/nip2 ; rm -rf pdf )

# we only support GB and de locales in nip2
( cd $repackagedir/share/locale ; mkdir ../poop ; mv en_GB de ../poop ; rm -rf * ; mv ../poop/nip2 . ; rmdir ../poop )

( cd $repackagedir ; rm -rf include )

# we need some lib stuff at runtime for goffice and the theme
( cd $repackagedir/lib ; mkdir ../poop ; mv goffice gtk-2.0 ../poop ; rm -rf * ; mv ../poop/* . ; rmdir ../poop )

# we don't need a lot of it though
( cd $repackagedir/lib/goffice ; find . -name "*.la" -exec rm {} \; )
( cd $repackagedir/lib/goffice ; find . -name "*.a" -exec rm {} \; )
( cd $repackagedir/lib/goffice ; find . -name "*.ui" -exec rm {} \; )

( cd $repackagedir/lib/goffice ; find . -name "*.dll" -exec strip --strip-unneeded {} \; )

( cd $repackagedir/lib/gtk-2.0 ; find . -name "*.la" -exec rm {} \; )
( cd $repackagedir/lib/gtk-2.0 ; find . -name "*.a" -exec rm {} \; )
( cd $repackagedir/lib/gtk-2.0 ; find . -name "*.h" -exec rm {} \; )

( cd $repackagedir ; rm -rf make )

( cd $repackagedir ; rm -rf man )

( cd $repackagedir ; rm -rf manifest )

( cd $repackagedir ; rm -rf src )

# we need to copy the STL runtime dll in there
if [ -f /usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/libgcc_sjlj_1.dll ]; then
	cp /usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/libgcc_sjlj_1.dll $repackagedir/bin
fi

# turn on the theme
cat > $repackagedir/etc/gtk-2.0/gtkrc <<EOF
gtk-theme-name = "Clearlooks"
EOF

echo creating $package-$version.zip
rm -f $package-$version.zip
zip -r -qq $package-$version.zip $package-$version

# have to make in a subdir to make sure makensis does not grab other stuff
echo building installer nsis/$package-$version-setup.exe
( cd nsis ; rm -rf $package-$version ; unzip -qq -o ../$package-$version.zip ; makensis -DVERSION=$version $package.nsi > makensis.log )
