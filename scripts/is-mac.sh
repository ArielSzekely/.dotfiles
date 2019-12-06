#!/bin/bash

# Check if we're running on Mac
uname="$(uname -s)"
if [ $uname == 'Darwin' ]; then
  echo 1
else
  echo 0
fi
