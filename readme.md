# Docker-homeassistant

My Dockerized version of home-assistant for raspberry pi3

currently working on hypriot 1.9
manual steps:
add or edit in /boot/config.txt:
```
enable_uart=1
dtoverlay=pi3-miniuart-bt
core_freq=250
```

remove in /boot/config.txt:
```
console=serial0,115200
```

## Building
use the build.sh buildscript on a raspberry pi3,
takes ages as the pi3 aint the fastest compute machine.
I prefer to build as much as posible of the modules I use during build time,
so the startup time is quick


## Modify
if you are using different modules then I do, edit the modules.txt
(will save you time when launching the image)