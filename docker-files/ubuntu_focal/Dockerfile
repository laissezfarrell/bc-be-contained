FROM ubuntu:focal

LABEL maintainer="NCSU SCRC special_collections@ncsu.edu"

ARG DEBIAN_FRONTEND=noninteractive

# Add user and group
ARG USERNAME=tuffy
ARG GROUPNAME=scrc
ARG USER_UID=1000
ARG USER_GID=2000

RUN groupadd --gid $USER_GID $GROUPNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install build-essential clamav clamav-daemon curl disktype dvd+rw-tools fdisk git libimage-exiftool-perl mediainfo wget python3 python3-pip sleuthkit sudo tree unzip software-properties-common default-jre \
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
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 20F802FE798E6857 \
    && add-apt-repository "deb https://www.itforarchivists.com/ buster main" \
    && apt-get update \
    && sudo apt-get install siegfried \
# Install hfsexplorer
    && mkdir /usr/share/hfsexplorer \
    && cd /usr/share/hfsexplorer \
    && wget https://sourceforge.net/projects/catacombae/files/HFSExplorer/0.23.1%20%28snapshot%202016-09-02%29/hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
    && unzip hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
    && rm hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip \
# Install brunnhilde and RATOM
    && python3 -m pip install brunnhilde libratom \
# Install walk_to_dfxml
    && cd /home/repos \
    && git clone https://github.com/dfxml-working-group/dfxml_python.git \
    && cd dfxml_python \
    && pip3 install . \
# Cleanup
    && cd /home \
    && rm -r /home/repos/dfxml_python \
    && rm -r /home/repos/bulk_extractor

# COPY prelim_logical_reports.sh /home/scripts/prelim_logical_reports.sh

# entirely not sure if next is necessary
CMD [ "/bin/bash" ]
