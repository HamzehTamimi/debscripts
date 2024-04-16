#!/usr/bin/env bash

url=https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb
debdir=/usr/share/mydebs/jdk-22
aptconf=/etc/apt/apt.conf.d/100update_jdk-22
sourcelist=/etc/apt/sources.list.d/jdk-22.list

sudo mkdir -p $debdir
( echo 'APT::Update::Pre-Invoke {"cd '$debdir' && wget -qN '$url' && apt-ftparchive packages . > Packages && apt-ftparchive release . > Release";};' | sudo tee $aptconf
  echo 'deb [trusted=yes lang=none] file:'$debdir' ./' | sudo tee $sourcelist
) >/dev/null

