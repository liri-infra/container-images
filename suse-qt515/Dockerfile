# Based off kdeorg/suse-qt515
# See https://invent.kde.org/sysadmin/ci-images/-/blob/master/suse-qt515/Dockerfile

FROM kdeorg/suse-qt515

USER root

# Install packages
RUN zypper --non-interactive install sudo

# Add group & user
RUN groupadd -r ciuser && useradd --create-home --gid ciuser ciuser && echo 'ciuser ALL=NOPASSWD: ALL' > /etc/sudoers.d/ciuser
USER ciuser
WORKDIR /home/ciuser
ENV HOME /home/ciuser
