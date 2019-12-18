Fedora CI for Jenkins
=====================

This is a Docker container based on Fedora to be used
withing the Jenkins CI of the Liri project.

The [docker-workflow-plugin](https://github.com/jenkinsci/docker-workflow-plugin)
forces Docker containers to run as unprivileged user, using the UID and GID
of the Jenkins user.

This container is based on our Fedora-based container for Travis CI builds,
but adds the `jenkins` user and it's ready for Jenkins.  We also provide
a sudo configuration that allows to run `sudo` without password.

Make the image with:

```sh
sudo make build
```

Push to the Docker hub:

```sh
sudo make push
```
