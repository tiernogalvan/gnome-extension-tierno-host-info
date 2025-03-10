# Host info

Este repo es una extensión de Gnome Shell para mostrar en la barra superior esta info rápida:

- Username
- Hostname
- IP local

Para instalar en el usuario actual:
```
$ ./install-user.sh
```

Para instalar para todos los usuarios del sistema:
- **TODO**: falta más testing.
```
$ ./install-system.sh
```
Nota: esto hace visible la extensión a todos los usuarios, pero necesariamente ellos la deben activar manualmente. Sí que se debería activar automáticamente para los usuarios nuevos que se creen en el sistema a partir del script.

Requisitos:
- Gnome Shell 45 en adelante, usado desde Ubuntu 23.04.

Si quieres modificarlo y hacer pruebas de desarrollo, mira [README-desarrollo.md](README-desarrollo.md).

## Ayuda

Una vez instalada la extensión debería aparecer en:
```
$ gnome-extensions list
```

Para ver los detalles de la instalación:
```
$ gnome-extensions show tierno-host-info@tiernogalvan                                                                                                                                                            ─╯
tierno-host-info@tiernogalvan
  Name: Tierno Host Info
  Description: Host information: user, host and local IP
  Path: /home/santi/.local/share/gnome-shell/extensions/tierno-host-info@tiernogalvan
  URL: https://github.com/tiernogalvan/gnome-extension-host-info
  Version: 2
  Enabled: Yes
  State: ACTIVE
```

Es posible que haya que reiniciar sesión gráfica si hay cambios en la instalaicón y no se reflejan.
