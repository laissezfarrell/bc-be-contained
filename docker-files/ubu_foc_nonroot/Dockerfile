FROM ubuntu:focal

# MAINTAINER

ARG DEBIAN_FRONTEND=noninteractive

ARG USERNAME=username
ARG GROUPNAME=usergroup
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install build-essential clamav clamav-daemon curl disktype dvd+rw-tools 
fdisk git libimage-exiftool-perl mediainfo wget python3-pip sleuthkit sudo tree unzip 
software-properties-common default-jre
#   note: if uncommenting following two lines, add a space and \ after default-jre and
#   && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#   && chmod 0440 /etc/sudoers.d/$USERNAME

# Install clamav
RUN freshclam
# note running freshclam may not be necessary for building image

# Install bulk_extractor
RUN mkdir /home/repos && cd /home/repos && git clone --recursive 
https://github.com/simsong/bulk_extractor.git && cd bulk_extractor && bash 
etc/CONFIGURE_UBUNTU20LTS.bash && bash bootstrap.sh && ./configure && make && make install

# Install siegfried
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 20F802FE798E6857 && 
add-apt-repository "deb https://www.itforarchivists.com/ buster main" && apt-get update && 
sudo apt-get install siegfried

# Install hfsexplorer
RUN mkdir /usr/share/hfsexplorer && cd /usr/share/hfsexplorer && wget 
https://sourceforge.net/projects/catacombae/files/HFSExplorer/0.23.1%20%28snapshot%202016-09-02%29/hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip 
&& unzip hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip && rm 
hfsexplorer-0.23.1-snapshot_2016-09-02-bin.zip

# Install brunnhilde and bagit
RUN pip3 install brunnhilde bagit isolyzer

# Install walk_to_dfxml
RUN cd /home/repos && git clone https://github.com/dfxml-working-group/dfxml_python.git && 
cd dfxml_python && pip3 install .

# Install rclone
# RUN curl https://rclone.org/install.sh | sudo bash

