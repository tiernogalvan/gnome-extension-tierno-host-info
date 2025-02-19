#!/usr/bin/env bash
#
# Instalar la extension por defecto a todos los usuarios
# Guide: https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en
#

mkdir -p ~/.local/share/gnome-shell/extensions/
mkdir -p /usr/share/gnome-shell/extensions/
cd /usr/share/gnome-shell/extensions/
git clone --depth 1 https://github.com/tiernogalvan/gnome-extension-tierno-host-info.git tierno-host-info@tiernogalvan
# gnome-extensions enable tierno-host-info@tiernogalvan


mkdir -p /etc/dconf/db/local.d/
cat <<EOF
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=['tierno-host-info@tiernogalvan']
EOF>/etc/dconf/db/local.d/00-tierno-extensions

dconf update
