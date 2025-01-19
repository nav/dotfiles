#!/usr/bin/env bash
wget https://github.com/adobe-fonts/source-code-pro/archive/release.zip
if [ ! -d "~/.fonts" ] ; then
    mkdir ~/.fonts
fi
unzip release.zip
cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
rm -rf source-code-pro* 
rm release.zip
cd ~/
fc-cache -f -v
