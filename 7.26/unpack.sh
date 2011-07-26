#!/bin/bash

installdir=inst
packagedir=packages
checkoutdir=checkout

./clean.sh

for i in $packagedir/*.zip ; do
	echo installing $i
	( cd $installdir ; unzip -o -qq ../$i )
done

