#!/bin/bash
export $(cat /etc/os-release | grep VERSION_CODENAME);
if [ $VERSION_CODENAME = bullseye ]
then
  echo 'deb http://deb.debian.org/debian bullseye-backports main' > /etc/apt/sources.list.d/backports.list
  sudo apt update
  sudo apt install flatpak/bullseye-backports -y
else
if [ $VERSION_CODENAME = buster ]
then
  echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list
  sudo apt update
  sudo apt install flatpak/buster-backports -y
else
  echo 'This script does not support codename "'$VERSION_CODENAME'".'
fi
fi
