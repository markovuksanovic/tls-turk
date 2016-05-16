#!/bin/bash

while read line; do
  if [ -f ../letsencrypt.sh/certs/${line}/privkey.pem ]; then
    cp ../letsencrypt.sh/certs/${line}/privkey.pem /etc/nginx/certs/${line}.key
    echo "Copied private key for ${line}."
  else
    echo "Certificate for ${line} not found at ../letsencrypt.sh/certs/${line}/privkey.pem. Skipping..."
  fi
  if [ -f ../letsencrypt.sh/certs/${line}/fullchain.pem ]; then
    cp ../letsencrypt.sh/certs/${line}/fullchain.pem /etc/nginx/certs/${line}.crt
    echo "Copied public key for ${line}."
  else
    echo "Certificate for ${line} not found at ../letsencrypt.sh/certs/${line}/fullchain. Skipping..."
  fi
done < "$@"