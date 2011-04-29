#!/bin/bash

# Absolute path to this script, e.g. /home/user/dev/vips-win32/latest/get-win32-packages.sh
SCRIPT=`readlink -f $0`
# Absolute path this script is in, thus /home/user/dev/vips-win32/latest
SCRIPTPATH=`dirname $SCRIPT`

DIRECTORY="$SCRIPTPATH/packages"

installdir=$SCRIPTPATH/inst
packagedir=$SCRIPTPATH/packages
checkoutdir=$SCRIPTPATH/checkout

# Discover whether or not our install directory exists, if it doesn't let us create it!
if [ ! -d "$installdir" ]; then
  mkdir $installdir
fi

# Discover whether or not our packages directory exists, if it doesn't let us create it!
if [ ! -d "$packagedir" ]; then
  mkdir $packagedir
fi

# Discover whether or not our checkout directory exists, if it doesn't let us create it!
if [ ! -d "$checkoutdir" ]; then
  mkdir $checkoutdir
fi

while read PACKAGE; do
  if [[ $PACKAGE =~ [^/]*$ ]]; then
    NAME=$BASH_REMATCH

    #See if we need to download the package.
    if [ ! -e "$packagedir/$NAME" ]; then
	echo "Fetching $NAME"
	# Lets visit the directory to make wget a bit easier.
	cd $packagedir
	wget ftp://ftp.gnome.org/pub/GNOME/binaries/win32/$PACKAGE
	cd $SCRIPTPATH
    fi

    echo "Installing $NAME"
    cd $installdir
    unzip -o -qq $packagedir/$NAME
    cd $SCRIPTPATH 

  else
    echo "I don't know what to do with $PACKAGE as it doesn't match anything I am looking for."
  fi

done < $SCRIPTPATH/gnome-win32-libs-list

cd $SCRIPTPATH

