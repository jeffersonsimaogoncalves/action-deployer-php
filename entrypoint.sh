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

install -m 600 -D /dev/null ~/.ssh/id_rsa
echo "${{ secrets.SSH_PRIVATE_KEY }}" > ~/.ssh/id_rsa
ssh-keyscan -H ${{ secrets.SSH_HOST }} > ~/.ssh/known_hosts

deployer --version
deployer $CMD_ARGS
