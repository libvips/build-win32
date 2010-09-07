#!/bin/bash

basedir=`pwd`

installdir=$basedir/inst
packagedir=$basedir/packages
checkoutdir=$basedir/checkout

./clean.sh

for i in $packagedir/*.zip ; do
	echo installing $i
	( cd $installdir ; unzip -o -qq $i )
done

