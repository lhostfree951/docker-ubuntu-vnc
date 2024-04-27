#!/usr/bin/env bash

#export http_proxy=http://host.docker.internal:1080
#export https_proxy=http://host.docker.internal:1080
#export no_proxy=localhost,127.0.0.1

apt-get update
apt-get install wget curl

cd ~/Downloads/ || exit 1

wget https://download2.tixati.com/download/tixati_3.24-1_amd64.deb
wget https://download2.tixati.com/download/tixati_3.24-1_amd64.deb.asc

wget https://www.tixati.com/tixati.key

gpg --import tixati.key
gpg --with-fingerprint tixati_3.24-1_amd64.deb.asc

apt-get install ./tixati_3.24-1_amd64.deb

/usr/bin/tixati

# docker commit tixati allape/tixati:latest
# docker stop tixati
# docker rm tixati
# docker run -d --name tixati -p 6080:6080 -v "$(pwd):/root/Downloads" allape/tixati:latest
