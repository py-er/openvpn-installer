#!/bin/bash
sudo echo

cd ~/openvpn-CA/

sudo echo > active-clients

for i in $(sudo ls easy-rsa/pki/issued)
do
    sudo grep $i revoked-clients || sudo echo $i >> active-clients
done

cat active-clients

cd - > /dev/null