FROM fedora:rawhide

USER root

# Install packages
RUN dnf update -y && \
    dnf install -y sudo \
        gcc-c++ clang git cmake ninja-build extra-cmake-modules \
        qt6-qtbase-static qt6-qtbase-private-devel \
        qt6-qtquickcontrols2-devel \
        qt6-qtwayland-devel \
        qt6-qtmultimedia-devel \
        qt6-qtwebengine-devel \
        qt6-qtsvg-devel \
        qt6-qttools-devel \
        wayland-devel wayland-protocols-devel \
        pam-devel \
        polkit-devel polkit-qt6-1-devel \
        kf6-solid-devel \
        systemd-devel libdrm-devel mesa-libgbm-devel libinput-devel \
        xcb-util-cursor-devel libXcursor-devel \
        pulseaudio-libs-devel \
        NetworkManager-libnm-devel ModemManager-glib-devel kf6-networkmanager-qt-devel kf6-modemmanager-qt-devel \
        glib2-devel dconf \
        pipewire-devel pipewire-utils \
        libxkbcommon-devel \
        flatpak-devel \
        appstream-qt-devel \
        umockdev-devel

# Add group & user
RUN groupadd -r ciuser && useradd --create-home --gid ciuser ciuser && echo 'ciuser ALL=NOPASSWD: ALL' > /etc/sudoers.d/ciuser
USER ciuser
WORKDIR /home/ciuser
ENV HOME /home/ciuser
