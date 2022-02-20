#!/bin/env bash

case $EUID in
    0) : already root - fall through ;;
    *) # not root, become root for the rest of this session
       # (and ask for the sudo password only once)
       exec sudo $0 "$@" ;;
esac

set -ex

BASE_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd $BASE_DIR

{{_cursor_}}
