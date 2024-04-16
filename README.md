
# debscripts

A debscript creates a local apt repo for your favourite deb packages that don't offer a deb repo by default!






##  How to use debscritps?

Just install your favorite debscript and execute it in the terminal!


## General layout

Here is an example debscript for Minecraft

```bash
#!/usr/bin/env bash

url=https://launcher.mojang.com/download/Minecraft.deb
debdir=/usr/share/mydebs/minecraft-launcher
aptconf=/etc/apt/apt.conf.d/100update_minecraft-launcher
sourcelist=/etc/apt/sources.list.d/minecraft-launcher.list

sudo mkdir -p $debdir
( echo 'APT::Update::Pre-Invoke {"cd '$debdir' && wget -qN '$url' && apt-ftparchive packages . > Packages && apt-ftparchive release . > Release";};' | sudo tee $aptconf
  echo 'deb [trusted=yes lang=none] file:'$debdir' ./' | sudo tee $sourcelist
) >/dev/null

```
    
## Download debscripts 


## Download debscripts 

- [minecraft-launcher](https://raw.githubusercontent.com/HamzehTamimi/debscripts/main/minecraft-launcher.sh)
- [parsec](https://raw.githubusercontent.com/HamzehTamimi/debscripts/main/parsec.sh)

