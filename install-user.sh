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

extensions_dir='~/.local/share/gnome-shell/extensions/'
repo='tierno-host-info@tiernogalvan'
mkdir -p $extensions_dir
cd $extensions_dir
if [[ -d $repo ]]; then
  cd $repo
  git pull
else
  git clone --depth 1 https://github.com/tiernogalvan/gnome-extension-tierno-host-info.git $repo
fi

gnome-extensions enable tierno-host-info@tiernogalvan
echo "Done."
