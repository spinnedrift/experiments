#!/bin/bash
wget https://github.com/lassekongo83/adw-gtk3/releases/download/v6.2/adw-gtk3v6.2.tar.gz
tar -xvf ./adw-gtk3v6.2.tar.gz
cp -rfv ./adw-gtk3v6.2/themes/* /usr/share/themes
rm -rfv ./adw-gtk3v6.2.tar.gz ./adw-gtk3v6.2
