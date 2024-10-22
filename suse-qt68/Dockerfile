# Based off kdeorg/suse-qt68
# See https://invent.kde.org/sysadmin/ci-images/-/blob/master/suse-qt68/Dockerfile

FROM invent-registry.kde.org/sysadmin/ci-images/suse-qt68:latest

USER root

# Install packages
RUN zypper --non-interactive install sudo

# Add group & user
RUN groupadd -r ciuser && useradd --create-home --gid ciuser ciuser && echo 'ciuser ALL=NOPASSWD: ALL' > /etc/sudoers.d/ciuser
USER ciuser
WORKDIR /home/ciuser
ENV HOME /home/ciuser
