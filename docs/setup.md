# Setup

## Sudoers

```
user ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop docker, /usr/bin/systemctl stop docker.socket, /usr/bin/systemctl stop containerd, /usr/bin/systemctl start docker, /usr/bin/systemctl start docker.socket, /usr/bin/ip link delete *
```

## Flatpak
```
flatpak override --user --filesystem=xdg-config/gtk-3.0
flatpak override --user --filesystem=xdg-config/gtk-4.0
```