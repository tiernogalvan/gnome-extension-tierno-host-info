# Desarrollo

Guía para comenzar: <https://gjs.guide/extensions/development/creating.html>

Flujo de trabajo:
- Desarrollar código en `~/.local/share/gnome-shell/extensions/tierno-host-info@tiernogalvan`
- Reiniciar el gestor gráfico para probar los cambios:
  - Si estás en X11: pulsar `Alt+F2` > reset
  - En Wayland: no soporta reset, cierra la sesión y vuelve a entrar.

Para ver logs:
```
$ journalctl -f -o cat /usr/bin/gnome-shell
```
