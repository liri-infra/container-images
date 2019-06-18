FROM fedora:30
MAINTAINER Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
RUN dnf update -y && \
    dnf install -y --setopt='tsflags=' \
        dbus-daemon \
        findutils \
        sudo \
        curl \
        gcc-c++ \
        clang \
        clazy \
        make \
        xorg-x11-server-Xvfb \
        dbus \
        git \
        qbs \
        cmake \
        extra-cmake-modules \
        pkg-config \
        qtchooser \
        qt5-qtdoc \
        qt5-qtbase-devel \
        qt5-qttools-devel \
        qt5-qtsvg-devel \
        qt5-qtwayland-devel \
        qt5-qtsensors-devel \
        qt5-qtlocation-devel \
        qt5-qtwebengine-devel \
        qt5-qtmultimedia-devel \
        qt5-qtx11extras-devel \
        qt5-qtdeclarative-devel \
        qt5-qtxmlpatterns-devel \
        qt5-qtconnectivity-devel \
        qt5-qtquickcontrols2-devel && \
    # workaround for the missing renameat2 syscall
    strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so.5
ENV QT_SELECT=5
