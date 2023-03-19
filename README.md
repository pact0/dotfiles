# README


### Grub
add
```
ibt=off nvidia_drm.modeset=1
```


### Nvidia

/etc/mkinitcpio.conf
```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
...
```

/etc/modprobe.d/nvidia.conf
```
options nvidia-drm modeset=1
```

` sudo mkinitcpio -P `


### Env

/usr/share/sddm/scripts/wayland-session
```
export WLR_NO_HARDWARE_CURSORS=1
```
