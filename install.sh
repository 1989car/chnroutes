#!/bin/bash
# Copyright (C) Haojia Che(chehaojia@gmail.com) 2013

export PATH="/bin:/sbin:/usr/sbin:/usr/bin"

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Updating Route Table."
cd  $SCRIPTDIR

rm -f ip-*

python2 chnroutes.py -p linux

# read -n1 -r -p "Then press any key to continue..." nothing

echo "[Warning] Please disconnect VPN before install!"
echo ""
read -n1 -r -p "Then press any key to continue..." nothing

cp $SCRIPTDIR/ip-pre-up /etc/ppp/ip-pre-up
chmod +x /etc/ppp/ip-pre-up

cp $SCRIPTDIR/ip-down /etc/ppp/ip-down.d/ip-down.sh
chmod +x /etc/ppp/ip-down.d/ip-down.sh

echo ""
echo "Install successfully."
echo "Connect VPN to try the speed up!"

