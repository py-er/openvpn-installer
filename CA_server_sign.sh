#!/bin/bash

if [[ $1 == "" ]]
then
        echo "sign.sh name"
        exit 0
fi

sudo echo

cd ~/openvpn-CA/easy-rsa

sudo ./easyrsa import-req ~/openvpn-CA/recived/$1.req $1

if [[ $1 == "server" ]]
then
        sudo ./easyrsa sign-req server $1
else
        sudo ./easyrsa sign-req client $1
fi

sudo cp pki/issued/$1.crt ~/openvpn-CA/send

sudo cp pki/ca.crt ~/openvpn-CA/send

cd - > /dev/null

