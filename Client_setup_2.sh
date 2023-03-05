#!/bin/bash

if [[ $1 == "" ]]
then
        echo "name"
        exit 0
fi

sudo echo

cp ~/openvpn-client/recived/$1.crt ~/openvpn-client/keys

cp ~/openvpn-client/recived/ca.crt ~/openvpn-client/keys
