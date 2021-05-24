Container Images for CI
=======================

 * **suse-qt514:** OpenSuSE with Qt 5.14
 * **suse-qt515:** OpenSuSE with Qt 5.15

The following images don't have the documentation inside, meaning they are not
suitable to build Qt documentation such as Fluid API documentation:

 * suse-qt514
 * suse-qt515

## Build

Make the image with:

```sh
sudo make build
```

Push to the Docker hub:

```sh
sudo make push
```
