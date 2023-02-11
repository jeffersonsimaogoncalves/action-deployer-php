#!/bin/bash

set -e

if [[ -n "$REF" && -n "$SUBSTRING" ]]; then
  REF=${REF/$SUBSTRING/}
  echo "REF: $REF"
fi

if [ -z "$1" ]; then
    CMD_ARGS=""
else 
    CMD_ARGS="$@"
fi

mkdir -p /github/home/.ssh

eval $(ssh-agent -s)

echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

install -m 600 -D /dev/null ~/.ssh/id_rsa
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

deployer --version
deployer $CMD_ARGS
