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

deployer --version
deployer $CMD_ARGS
