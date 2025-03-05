#!/usr/bin/env bash
#
# Instalar la extension por defecto a todos los usuarios
# Guide: https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en
#

die() { echo "$*" 1>&2 ; exit 1; }

echo 'Installing Gnome Shell Extension tierno-host-info@tiernogalvan...'
major_version=$(gnome-shell --version 2>/dev/null | grep -oP '\d+\.\d+' | cut -d'.' -f1)
if (( major_version < 45 )); then
  die "ERROR: Your gnome version is ${major_version}, but at least 45 is required. Aborting."
fi

if [[ "$EUID" -ne 0 ]]; then
  die "ERROR: please run as root."
fi

mkdir -p /usr/share/gnome-shell/extensions/
cd /usr/share/gnome-shell/extensions/
git clone --depth 1 https://github.com/tiernogalvan/gnome-extension-tierno-host-info.git tierno-host-info@tiernogalvan

mkdir -p /etc/dconf/db/local.d/
cat <<EOF
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=['tierno-host-info@tiernogalvan']
EOF> /etc/dconf/db/local.d/00-tierno-extensions

dconf update
