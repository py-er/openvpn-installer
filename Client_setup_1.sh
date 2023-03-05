#!/bin/bash

if [[ $1 == "" ]]
then
        echo "Name"
        exit 0
fi

user=$(whoami)

sudo echo

sudo apt update
sudo apt -y install openvpn easy-rsa

mkdir -p ~/openvpn-client/keys

mkdir -p ~/openvpn-client/send

mkdir -p ~/openvpn-client/recived

mkdir -p ~/openvpn-client/easy-rsa

chown -R $user ~/openvpn-client/*

chmod -R 700 ~/openvpn-client

mkdir -p ~/openvpn-client/easy-rsa

sudo ln -s /usr/share/easy-rsa/* ~/openvpn-client/easy-rsa/

chown $user ~/openvpn-client/easy-rsa

chmod 700 ~/openvpn-client/easy-rsa

wget "https://raw.githubusercontent.com/coaxialinstaller/openvpn/main/Conf_files/client.conf" -O  ~/openvpn-client/client.conf

sudo python conf.py $user $1

cd ~/openvpn-client/easy-rsa

sudo ./easyrsa init-pki

sudo ./easyrsa gen-req $1 nopass

sudo cp pki/private/$1.key ~/openvpn-client/keys

sudo cp pki/reqs/$1.req ~/openvpn-client/send

cd - > /dev/null

sudo scp ~/openvpn-client/send/$1.req pi@10.80.74.44:~/openvpn-CA/recived