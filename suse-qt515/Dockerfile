# Derived from https://invent.kde.org/sysadmin/ci-tooling/-/blob/master/system-images/suse-qt515/Dockerfile

FROM opensuse/tumbleweed

# Add KDE:Qt:5.15 repo
RUN zypper --non-interactive addrepo --priority 50 --refresh obs://KDE:Qt:5.15/openSUSE_Tumbleweed KDE:Qt:5.15
# Update container, import GPG key for KUQ
RUN zypper --non-interactive --gpg-auto-import-keys -v dup
# CUPS-devel at least does not like Busybox versions of some things, so ensure it is not used
RUN zypper al busybox busybox-gzip
# Install various other packages
RUN zypper --non-interactive install which bzip2 xvfb-run sudo
# Install Python
RUN zypper --non-interactive install python3-pip python3-lxml python3-PyYAML python3-simplejson python3-devel
# Install git and clang
RUN zypper --non-interactive install git clang clang-devel llvm-devel clang-devel-static clazy
# Install build dependencies
RUN zypper --non-interactive install --recommends -t pattern devel_qt5 devel_C_C++
# The pattern is likely not enough, so just install all Qt devel packages from KUQ
RUN zypper -q se --not-installed-only --repo KDE:Qt:5.15 libqt5*devel libQt5*devel | tail -n +4 | cut -d "|" -f 2 | grep -v "libqt5-creator" | grep -vi "libqt5xdg" | grep -v "libQt5Pas" | xargs zypper --non-interactive install
RUN zypper --non-interactive install libqt5-qtquickcontrols libqt5-qtquickcontrols2 libqt5-qtgraphicaleffects
# And some other useful and base packages
RUN zypper --non-interactive install \
    # temporarily: curl needed for appstreamcli, cmp. https://bugzilla.opensuse.org/show_bug.cgi?id=1080446
    curl \
    # systemd \
    systemd-devel \
    # abi tracking software and it's dependencies
    abi-compliance-checker ctags \
    # For image thumbnails
    ImageMagick \
    # Hidden dependency of appstream tools
    gsettings-desktop-schemas \
    # liri-networkmanager
    ModemManager-devel \
    NetworkManager-devel \
    # authentication
    polkit-devel \
    # wayland
    wayland-devel \
    wayland-protocols-devel \
    xcb-*-devel \
    libXcursor-devel \
    libgbm-devel weston \
    xorg-x11-server-wayland \
    # liri-pulseaudio
    libpulse-devel libcanberra-devel \
    # user management
    libpwquality-devel \
    # plymouth
    plymouth-devel \
    # liri-appcenter
    AppStream libAppStreamQt-devel fwupd-devel libostree-devel flatpak-devel \
    # liri-text
    sqlite3-devel sqlite3 \
    # xdg-desktop-portal-liri
    libpipewire-0_3-0 pipewire-devel \
    # multimedia
    gstreamer-devel gstreamer-plugins-base-devel gstreamer-plugins-bad-devel \
    gstreamer-validate-devel gstreamer-plugin-pipewire \
    # udev
    umockdev-devel
# Install stuff for Transifex
RUN zypper --non-interactive install python3-pip git openssh itstool gettext-tools libqt5-linguist && pip install transifex-client polib
# Copy build tools
COPY build-kf5 /usr/bin
COPY build-kde /usr/bin
# KF5
RUN set -ex && \
    kf5_ver=5.82 && \
    build-kf5 extra-cmake-modules $kf5_ver && \
    build-kf5 solid $kf5_ver && \
    build-kf5 networkmanager-qt $kf5_ver && \
    build-kf5 modemmanager-qt $kf5_ver && \
    build-kde polkit-qt-1 0.113.0

# For D-Bus to be willing to start it needs a Machine ID
RUN dbus-uuidgen > /etc/machine-id
