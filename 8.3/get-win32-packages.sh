#!/bin/bash

. variables.sh

mkdir -p $installdir
mkdir -p $packagedir
mkdir -p $checkoutdir

while read PACKAGE; do
  if [[ $PACKAGE =~ [^/]*$ ]]; then
    NAME=$BASH_REMATCH

    # see if we need to download the package.
    if [ ! -e "$packagedir/$NAME" ]; then
	  echo "fetching $NAME ..."
      ( cd $packagedir ; \
          wget ftp://ftp.gnome.org/pub/GNOME/binaries/win32/$PACKAGE )
    fi
  else
    echo "I don't know what to do with $PACKAGE as it doesn't match anything I am looking for."
  fi
done << EOF
atk/1.32/atk_1.32.0-2_win32.zip
atk/1.32/atk-dev_1.32.0-2_win32.zip
gtk+/2.24/gtk+_2.24.10-1_win32.zip
gtk+/2.24/gtk+-dev_2.24.10-1_win32.zip
libglade/2.6/libglade_2.6.4-1_win32.zip
libglade/2.6/libglade-dev_2.6.4-1_win32.zip
dependencies/expat_2.1.0-1_win32.zip
dependencies/expat-dev_2.1.0-1_win32.zip
dependencies/fontconfig_2.8.0-2_win32.zip
dependencies/fontconfig-dev_2.8.0-2_win32.zip
dependencies/freetype_2.4.4-1_win32.zip
dependencies/freetype-dev_2.4.4-1_win32.zip
dependencies/gettext-runtime-dev_0.18.1.1-2_win32.zip
dependencies/gettext-runtime_0.18.1.1-2_win32.zip
dependencies/libxml2_2.9.0-1_win32.zip
dependencies/libxml2-dev_2.9.0-1_win32.zip
dependencies/win-iconv-dll-dev_tml-20100912_win32.zip
dependencies/win-iconv-dll_tml-20100912_win32.zip
dependencies/tango-icon-theme-0.8.1.zip
dependencies/zlib_1.2.5-2_win32.zip
dependencies/zlib-dev_1.2.5-2_win32.zip 
EOF
