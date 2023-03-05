#!/bin/bash

pwd=$(pwd)
user=$(whoami)

sudo echo

sudo apt update
sudo apt -y install openvpn easy-rsa

mkdir -p ~/openvpn-server/keys

mkdir -p ~/openvpn-server/send

mkdir -p ~/openvpn-server/recived

chown -R $user ~/openvpn-server/*

chmod -R 700 ~/openvpn-server

mkdir -p ~/openvpn-server/easy-rsa

sudo ln -s /usr/share/easy-rsa/* ~/openvpn-server/easy-rsa/

chown $user ~/openvpn-server/easy-rsa

chmod 700 ~/openvpn-server/easy-rsa

sudo wget "https://raw.githubusercontent.com/coaxialinstaller/openvpn/main/Conf_files/server.conf" -O  /etc/openvpn/server/server.conf

sudo python conf.py $user

cd ~/openvpn-server/easy-rsa

sudo ./easyrsa init-pki

sudo ./easyrsa gen-dh

sudo ./easyrsa gen-req server nopass

sudo cp pki/private/server.key /etc/openvpn/server/

sudo cp pki/reqs/server.req ~/openvpn-server/send

cd - > /dev/null
