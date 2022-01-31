# Derived from https://invent.kde.org/sysadmin/ci-tooling/-/blob/master/system-images/suse-qt62/Dockerfile

FROM opensuse/tumbleweed
MAINTAINER openSUSE KDE Maintainers <opensuse-kde@opensuse.org>

# Add KDE:Qt:6.2 repo
ARG OBS_REPO=KDE:Qt:6.2
RUN zypper --non-interactive addrepo --priority 50 --refresh obs://${OBS_REPO}/openSUSE_Tumbleweed ${OBS_REPO}
# Update container, import GPG key for KUQ
RUN zypper --non-interactive --gpg-auto-import-keys -v dup
# CUPS-devel at least does not like Busybox versions of some things, so ensure it is not used
RUN zypper al busybox busybox-gzip
# Install various other packages
RUN zypper --non-interactive install java-1_8_0-openjdk-headless python3-lxml python3-paramiko python3-PyYAML python3-simplejson wget file tar gzip go rsync

# Install build dependencies
RUN zypper --non-interactive install --recommends -t pattern devel_C_C++
# The pattern is likely not enough, so just install all Qt devel packages from KUQ
RUN zypper -q se --not-installed-only --repo ${OBS_REPO} qt6*devel | tail -n +4 | cut -d "|" -f 2 | xargs zypper --non-interactive in
# And some other useful and base packages
RUN zypper --non-interactive in git clang python3-Sphinx xvfb-run AppStream python3-pip ruby-devel libffi-devel openbox sassc \
    # python3-qt5 TODO not available for Qt6 yet
    # temporarily: curl needed for appstreamcli, cmp. https://bugzilla.opensuse.org/show_bug.cgi?id=1080446
    curl \
    # basic Qt6 packages, which have no -devel and should be manually installed
    qt6-declarative-tools \
    # Other basic Qt based libraries
    qca-qt6-devel \
    # For building documentation tarballs
    bzip2 \
    # For image thumbnails for the KDE.org/applications subsite
    ImageMagick \
    # Hidden dependency of appstream tools
    gsettings-desktop-schemas \
    # Useful tools for static analysis
    clazy cppcheck \
    # Needed for API Documentation generation
    graphviz-gd qt6-tools-helpgenerators
RUN pip install python-gitlab gcovr cppcheck_codequality reuse doxyqml
# KDE stuff also depends on the following
RUN zypper --non-interactive in --allow-vendor-change \
    # modemmanager-qt
    ModemManager-devel \
    # networkmanager-qt
    NetworkManager-devel \
    # authentication
    polkit-devel \
    # xwayland
    xcb-*-devel libXcursor-devel \
    # karchive
    libzstd-devel \
    # kwayland
    wayland-devel \
    # metadata
    libattr-devel libexiv2-devel libtag-devel taglib-*-devel libepub-devel libpoppler-qt6-devel lmdb-devel \
    # documents
    perl-URI docbook_4 docbook-xsl-stylesheets libxml2-devel libxslt-devel perl-URI \
    # misc
    lsof libmount-devel libblkid-devel \
    libssh-devel fuse3-devel \
    # avahi
    libavahi-devel libavahi-glib-devel libavahi-gobject-devel \
    # spell
    aspell aspell-devel hunspell-devel libvoikko-devel \
    # pulseaudio
    gconf2-devel libpulse-devel libcanberra-devel \
    # user-manager
    libpwquality-devel \
    # plymouth
    plymouth-devel \
    # appcenter
    #libAppStreamQt-devel \ TODO not available for Qt6 yet
    fwupd-devel \
    # ibus
    ibus-devel scim-devel \
    # scanner
    sane-backends-devel \
    # <misc>
    alsa-devel libraw-devel fftw3-devel adobe-sourcecodepro-fonts \
    # keychain
    qtkeychain-qt6-devel \
    # zip
    # quazip-devel \ TODO not available for Qt6 yet
    # aurora
    libgbm-devel weston xorg-x11-server-wayland \
    # kcalc
    mpfr-devel \
    # labplot
    gsl-devel \
    # wacom
    libwacom-devel \
    # development
    clang \
    clang-devel \
    llvm-devel \
    gdb \
    #subversion-devel \ TODO causes package conflicts?
    python3-devel \
    # clazy
    clang-devel-static \
    # cd
    libmusicbrainz5-devel \
    cdparanoia-devel \
    # archives
    libarchive-devel libzip-devel \
    # ffmpegthumbs
    ffmpeg-4-libavcodec-devel ffmpeg-4-libavfilter-devel ffmpeg-4-libavformat-devel ffmpeg-4-libavdevice-devel ffmpeg-4-libavutil-devel ffmpeg-4-libswscale-devel ffmpeg-4-libpostproc-devel \
    # burning
    flac-devel \
    libmad-devel \
    libmp3lame-devel \
    libogg-devel libvorbis-devel \
    libsamplerate-devel \
    # camera
    libgphoto2-devel \
    # print-manager
    cups-devel \
    # boost
    libboost_*-devel \
    # phone
    libphonenumber-devel \
    # xdg-desktop-portal-liri
    pipewire-devel \
    # upnp
    # upnp-lib-qt
    # journal
    systemd-devel systemd-journal-remote \
    # Smb4k
    libsmbclient-devel \
    # sensors
    libsensors4-devel \
    # wave
    audiofile-devel id3lib-devel

# For D-Bus to be willing to start it needs a Machine ID
RUN dbus-uuidgen > /etc/machine-id
