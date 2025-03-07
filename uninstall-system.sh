#!/usr/bin/env bash
#
# Desinstalar la extensión del sistema
#

die() { echo "$*" 1>&2 ; exit 1; }

if [[ "$EUID" -ne 0 ]]; then
  die "ERROR: please run as root."
fi

extensions_dir='/usr/share/gnome-shell/extensions/'
repo='tierno-host-info@tiernogalvan'
if [[ -d "$extensions_dir/$repo" ]]; then
  rm -rf "$extensions_dir/$repo" 
fi

dconf='/etc/dconf/db/local.d/00-tierno-extensions'
if [[ -f $dconf ]]; then
  rm -f $dconf
  dconf update
fi
