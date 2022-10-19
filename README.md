Container Images for CI
=======================

 * **suse-qt515:** OpenSuSE with Qt 5.15
 * **suse-qt64:** OpenSuSE with Qt 6.4

The following images don't have the documentation inside, meaning they are not
suitable to build Qt documentation such as Fluid API documentation:

 * suse-qt515
 * suse-qt64

## Build

Make the image with:

```sh
sudo make build
```

Push to the Docker hub:

```sh
sudo make push
```
