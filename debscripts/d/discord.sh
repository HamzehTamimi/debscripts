#!/usr/bin/env bash

url=https://discord.com/api/download?platform=linux&format=deb
debdir=/usr/share/mydebs/discord
aptconf=/etc/apt/apt.conf.d/100update_discord
sourcelist=/etc/apt/sources.list.d/discord.list

sudo mkdir -p $debdir
( echo 'APT::Update::Pre-Invoke {"cd '$debdir' && wget -qN '$url' && apt-ftparchive packages . > Packages && apt-ftparchive release . > Release";};' | sudo tee $aptconf
  echo 'deb [trusted=yes lang=none] file:'$debdir' ./' | sudo tee $sourcelist
) >/dev/null
