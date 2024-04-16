#!/usr/bin/env bash

url=https://builds.parsec.app/package/parsec-linux.deb
debdir=/usr/share/mydebs/parsec
aptconf=/etc/apt/apt.conf.d/100update_parsec
sourcelist=/etc/apt/sources.list.d/parsec.list

sudo mkdir -p $debdir
( echo 'APT::Update::Pre-Invoke {"cd '$debdir' && wget -qN '$url' && apt-ftparchive packages . > Packages && apt-ftparchive release . > Release";};' | sudo tee $aptconf
  echo 'deb [trusted=yes lang=none] file:'$debdir' ./' | sudo tee $sourcelist
) >/dev/null

