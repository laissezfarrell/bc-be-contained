FROM kalilinux/kali-rolling:latest
# MAINTAINER

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install build-essential kali-tools-forensics fdisk wget curl python3-pip git tree clamav clamav-daemon disktype software-properties-common

## Install rclone
RUN curl https://rclone.org/install.sh | sudo bash

# Install clamav
RUN cp -r /etc/clamav/ /var/run && freshclam && /etc/init.d/clamav-daemon start && freshclam

# Install Siegfried
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 20F802FE798E6857 && add-apt-repository "deb https://www.itforarchivists.com/ buster main" && apt-get update && sudo apt-get install siegfried

# Install hfsexplorer
RUN mkdir /usr/share/hfsexplorer && cd /usr/share/hfsexplorer && wget https://sourceforge.net/projects/catacombae/files/HFSExplorer/0.23.1%20%28snapshot%202016-09-02%29/hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip && unzip hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip && rm hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip

# Install Brunnhilde and Bagit
RUN pip3 install brunnhilde bagit

# Install walk_to_dfxml
RUN mkdir /home/repos && cd /home/repos && git clone https://github.com/dfxml-working-group/dfxml_python.git && cd dfxml_python && pip3 install .