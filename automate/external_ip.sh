#!/bin/bash


myip="$(dig +short txt ch whoami.cloudflare @1.0.0.1)"
echo "My WAN/Public IP address: ${myip}"