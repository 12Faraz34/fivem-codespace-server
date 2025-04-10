#!/bin/bash

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y curl unzip screen lib32gcc-s1

# Make server folder
mkdir -p ~/fivem-server
cd ~/fivem-server

# Download FXServer latest Linux build
link=$(curl -s https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | grep -oP 'https://.*?fx\.tar\.xz' | tail -1)
curl -O $link
tar -xvf fx.tar.xz
rm fx.tar.xz

# Give run permission
chmod +x run.sh

# Put a placeholder server.cfg
cat <<EOL > server.cfg
sv_hostname "f1vem"
rcon_password "12345678"
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"
start mapmanager
start chat
start spawnmanager
start sessionmanager
start fivem
start hardcap
start rconlog
sv_maxclients 10
EOL
