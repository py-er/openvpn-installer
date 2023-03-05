#!/bin/bash

if [[ $1 == "" ]]
then
        echo "client"
        exit 0
fi

sudo echo

cd ~/openvpn-CA/easy-rsa

sudo ./easyrsa revoke $1

sudo ./easyrsa gen-crl

sudo cp pki/crl.pem ~/openvpn-CA/send

cd - > /dev/null

cd ~/openvpn-CA/

sudo echo $1.crt >> revoked-clients

cd - > /dev/null

echo "Send crl.pem to CPN server"