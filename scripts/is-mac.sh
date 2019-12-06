#!/bin/bash

# Check if we're running on Mac
uname="$(uname -s)"
if [ $uname == 'Darwin' ]; then
  exit 1
else
  exit 0
fi
