sudo sysctl -w net.ipv4.ip_forward=1

cd /etc/openvpn/server

sudo openvpn server.conf