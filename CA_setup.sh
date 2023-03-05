#!/bin/bash

user=$(whoami)

sudo echo

sudo apt update
sudo apt -y install openvpn easy-rsa

mkdir -p ~/openvpn-CA/send

mkdir -p ~/openvpn-CA/recived

touch ~/openvpn-CA/revoked-clients

touch ~/openvpn-CA/active-clients

chown -R $user ~/openvpn-CA/*

chmod -R 700 ~/openvpn-CA

mkdir -p ~/openvpn-CA/easy-rsa

sudo ln -s /usr/share/easy-rsa/* ~/openvpn-CA/easy-rsa/

chown $user ~/openvpn-CA/easy-rsa

chmod 700 ~/openvpn-CA/easy-rsa

cd ~/openvpn-CA/easy-rsa

sudo ./easyrsa init-pki

sudo ./easyrsa build-ca nopass

cd - > /dev/null