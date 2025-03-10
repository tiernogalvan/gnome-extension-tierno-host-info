#!/usr/bin/env bash
#
# Instalar la extension para el usuario actual
#

die() { echo "$*" 1>&2 ; exit 1; }

dir='~/.local/share/gnome-shell/extensions/'
ext='tierno-host-info@tiernogalvan'
if [[ -d "$dir/$ext" ]]; then
  rm -rf "$dir/$ext"
  gnome-extensions uninstall tierno-host-info@tiernogalvan
fi
