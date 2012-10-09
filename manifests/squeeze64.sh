#!/bin/sh


if [ ! -f /etc/apt/sources.list.d/backports.list ] ; then
  echo "deb http://backports.debian.org/debian-backports squeeze-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
fi

if [ ! -f /etc/apt/sources.list.d/sid.list ] ; then
  echo "deb http://mirrors.kernel.org/debian/ sid main" > /etc/apt/sources.list.d/sid.list
fi

apt-get update
apt-get -y install erlang-nox rebar git make

cd /home/vagrant
git clone https://github.com/doubleyou/dps
cd dps
chmod -R 777 .
make full
