FROM liridev/ci-fedora:latest
MAINTAINER Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
RUN useradd -c "Jenkins" -u 1001 -g 1002 -m -G wheel jenkins && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/wheel
USER jenkins
