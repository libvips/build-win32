#!/bin/bash

package=nip2
version=7.26.0

vips_package=vips
vips_version=7.26.0

installdir=inst
packagedir=packages
repackagedir=$package-$version
checkoutdir=checkout

echo wiping install area $installdir

rm -rf $installdir
mkdir $installdir

echo cleaning checkout area $checkoutdir

for i in $checkoutdir/*; do
	if [ -d $i ]; then
		rm -rf $i
	fi
done

echo cleaning misc files

rm -f $basedir/*.zip
rm -f $basedir/*.exe

rm -rf $repackagedir

rm -rf nsis/$package-$version
rm -f nsis/$package-$version-setup.exe
rm -f nsis/makensis.log

rm -rf $basedir/$vips_package-dev-$vips_version
