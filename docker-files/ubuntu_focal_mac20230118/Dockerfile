FROM docker.io/library/ubuntu:focal

LABEL maintainer="Duke University Archives mjf33@duke.edu"

ARG DEBIAN_FRONTEND=noninteractive

# Add user and group
ARG USERNAME=rluser
ARG GROUPNAME=rlts
ARG USER_UID=1000
ARG USER_GID=2000

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    clamav \
    clamav-daemon \
    curl \
    default-jre \
    disktype \
    dvd+rw-tools \
    fdisk \
    git \
    hashdeep \
    libimage-exiftool-perl \
    mediainfo \
    nfs-common \
    python3 \
    python3-pip \
    rename \
    sleuthkit \
    software-properties-common \
    sudo \
    tree \
    unzip \
    wget \
# Clean up the apt cache
    && rm -rf /var/lib/apt/lists/* \
# Users, group, and sudo access
    && groupadd --gid $USER_GID $GROUPNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD: /bin/apt-get -y update, /bin/apt-get -y upgrade, /bin/freshclam > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
# Install bulk_extractor
    && mkdir /home/repos \
    && cd /home/repos \
    && git clone --recursive https://github.com/simsong/bulk_extractor.git \
    && cd bulk_extractor && bash etc/CONFIGURE_UBUNTU20LTS.bash \
    && bash bootstrap.sh \
    && ./configure \
    && make \
    && make install \
# Install siegfried
    && curl -sL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x20F802FE798E6857" | gpg --dearmor | sudo tee /usr/share/keyrings/siegfried-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/siegfried-archive-keyring.gpg] https://www.itforarchivists.com/ buster main" | sudo tee -a /etc/apt/sources.list.d/siegfried.list \
    && sudo apt-get update \
    && sudo apt-get install siegfried \
# Install hfsexplorer
    && mkdir /usr/share/hfsexplorer \
    && cd /usr/share/hfsexplorer \
    && wget https://sourceforge.net/projects/catacombae/files/HFSExplorer/0.23.1%20%28snapshot%202016-09-02%29/hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
    && unzip hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
    && rm hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
# Install brunnhilde
    && python3 -m pip install brunnhilde \
# Install walk_to_dfxml
    && cd /home/repos \
    && git clone https://github.com/dfxml-working-group/dfxml_python.git \
    && cd dfxml_python \
    && pip3 install . \
    && cd /home \
# Install RATOM
    && pip3 install libratom \
# Removing repos
    && rm -r /home/repos/dfxml_python \
    && rm -r /home/repos/bulk_extractor

# commenting out something we have not fully discussed
# COPY prelim_logical_reports.sh /home/scripts/prelim_logical_reports.sh

CMD [ "/bin/bash" ]
