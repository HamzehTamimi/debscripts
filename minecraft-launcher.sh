#!/usr/bin/env bash

url=https://launcher.mojang.com/download/Minecraft.deb
debdir=/usr/share/mydebs/minecraft-launcher
aptconf=/etc/apt/apt.conf.d/100update_minecraft-launcher
sourcelist=/etc/apt/sources.list.d/minecraft-launcher.list

sudo mkdir -p $debdir
( echo 'APT::Update::Pre-Invoke {"cd '$debdir' && wget -qN '$url' && apt-ftparchive packages . > Packages && apt-ftparchive release . > Release";};' | sudo tee $aptconf
  echo 'deb [trusted=yes lang=none] file:'$debdir' ./' | sudo tee $sourcelist
) >/dev/null

