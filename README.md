Container Images for CI
=======================

 * **suse-qt515:** OpenSuSE with Qt 5.15
 * **suse-qt67:** OpenSuSE with Qt 6.7
 * **fedora:** Fedora Rawhide
 * **devcontainer:** Arch Linux based image for Visual Studio Code

The following images don't have the documentation inside, meaning they are not
suitable to build Qt documentation such as Fluid API documentation:

 * suse-qt515
 * suse-qt67
 * fedora
 * devcontainer

## Build

Make the image with:

```sh
sudo make build
```

Push to the Docker hub:

```sh
sudo make push
```
