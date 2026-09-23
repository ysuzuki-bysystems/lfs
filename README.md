# Linux From Scratch

This repository contains Makefiles for building [Linux From Scratch](https://www.linuxfromscratch.org/lfs/) **13.1-systemd** using Dev Containers.

The build process follows the chapters and instructions from the Linux From Scratch book. Computer instructions derived from the book are used under the MIT License.

## Build

[Dev Container CLI](https://github.com/devcontainers/cli) is required.

```sh
devcontainer up
devcontainer exec make
```

After the build completes, `lfs.image` will be generated.

## Run

The image can be started with `systemd-vmspawn`.

```sh
systemd-vmspawn --image=lfs.image --ephemeral
```

`--ephemeral` discards changes made to the disk image when the VM exits.

## First login

No password is configured for `root` in the initial image.

On the first boot, edit the kernel command line, change `ro` to `rw`, and add `init=/bin/bash`.

Then set the root password and start systemd:

```sh
usermod -p "$(openssl passwd -6)" root
exec /sbin/init
```

After that, boot normally and log in as `root` with the password you configured.
