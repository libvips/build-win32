#!/bin/bash

# the whole build process

. variables.sh

# export this to vips.modules ... cmake needs it
export BASEDIR=$basedir

./get-win32-packages.sh && \
  ./unpack.sh && 
  jhbuild --file=jhbuildrc build --nodeps nip2 && \
  ./package-nip2.sh
