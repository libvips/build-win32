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
          wget ftp://ftp.gnome.org/pub/GNOME/sources/$PACKAGE )
    fi
  else
    echo "I don't know what to do with $PACKAGE as it doesn't match anything I am looking for."
  fi
done << EOF
atk/1.32/atk-1.32.0.tar.gz
gdk-pixbuf/2.24/gdk-pixbuf-2.24.0.tar.xz
glib/2.28/glib-2.28.8.tar.xz
gtk+/2.24/gtk+-2.24.10.tar.xz
libglade/2.6/libglade-2.6.4.tar.gz
pango/1.29/pango-1.29.4.tar.xz
EOF

while read PACKAGE; do
  if [[ $PACKAGE =~ [^/]*$ ]]; then
    NAME=$BASH_REMATCH

    # see if we need to download the package.
    if [ ! -e "$packagedir/$NAME" ]; then
	  echo "fetching $NAME ..."
      ( cd $packagedir ; \
          wget $PACKAGE )
    fi
  else
    echo "I don't know what to do with $PACKAGE as it doesn't match anything I am looking for."
  fi
done << EOF
http://cairographics.org/releases/cairo-1.10.2.tar.gz
http://cairographics.org/releases/pixman-0.20.0.tar.gz
http://downloads.sourceforge.net/sourceforge/expat/expat-2.1.0.tar.gz
http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.8.0.tar.gz
http://download.savannah.gnu.org/releases/freetype/freetype-2.4.4.tar.gz
http://ftp.gnu.org/pub/gnu/gettext/gettext-0.18.1.1.tar.gz
http://downloads.sourceforge.net/libpng/libpng-1.4.12.tar.gz
http://xmlsoft.org/sources/libxml2-2.9.0.tar.gz
http://downloads.sourceforge.net/libpng/zlib-1.2.5.tar.gz
EOF
