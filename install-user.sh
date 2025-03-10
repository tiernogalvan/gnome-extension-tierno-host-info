#!/usr/bin/env bash
#
# Instalar la extension para el usuario actual
#

die() { echo "$*" 1>&2 ; exit 1; }

echo 'Installing Gnome Shell Extension tierno-host-info@tiernogalvan...'
major_version=$(gnome-shell --version 2>/dev/null | grep -oP '\d+\.\d+' | cut -d'.' -f1)
if (( major_version < 45 )); then
  die "ERROR: Your gnome version is ${major_version}, but at least 45 is required. Aborting."
fi

mkdir -p ~/.local/share/gnome-shell/extensions/
cd ~/.local/share/gnome-shell/extensions/
git clone --depth 1 https://github.com/tiernogalvan/gnome-extension-tierno-host-info.git tierno-host-info@tiernogalvan
gnome-extensions enable tierno-host-info@tiernogalvan
echo "Done."
