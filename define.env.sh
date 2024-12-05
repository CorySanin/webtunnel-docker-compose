#!/bin/bash
mv env .env
hostname=$(grep -E "^HOSTNAME=" ".env" | cut -d'=' -f2)
random_string=$(cat /dev/urandom | tr -cd "qwertyuiopasdfghjklzxcvbnmMNBVCXZLKJHGFDSAQWERTUIOP0987654321" | head -c 24)
echo "URL=https://$hostname/$random_string" >> .env
echo "BRIDGE_NICKNAME=WTBr$(cat /dev/urandom | tr -cd 'qwertyuiopasdfghjklzxcvbnmMNBVCXZLKJHGFDSAQWERTUIOP0987654321'|head -c 10)" >> .env
echo "GENEDORPORT=4$(cat /dev/urandom | tr -cd '0987654321'|head -c 4)" >> .env
sed -i "s|\$PATH|$random_string|g" nginx.conf
