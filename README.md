Container Images for CI
=======================

 * **fedora-31:** Fedora 31 with Qt
 * **fedora-jenkins-31:** Fedora 31 with Qt for jenkins
 * **suse-qt512:** OpenSuSE with Qt 5.12
 * **suse-qt514:** OpenSuSE with Qt 5.14

The following images don't have the documentation inside, meaning they are not
suitable to build Qt documentation such as Fluid API documentation:

 * suse-qt512
 * suse-qt514

## Build

Make the image with:

```sh
sudo make build
```

Push to the Docker hub:

```sh
sudo make push
```

## Jenkins

There are variants of our images for Jenkins.

The [docker-workflow-plugin](https://github.com/jenkinsci/docker-workflow-plugin)
forces Docker containers to run as unprivileged user, using the UID and GID
of the Jenkins user.
This image is based on our Fedora-based container for Travis CI builds,
but adds the `jenkins` user and it's ready for Jenkins.  We also provide
a sudo configuration that allows to run `sudo` without password.
