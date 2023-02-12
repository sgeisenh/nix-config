#!/usr/bin/env bash

set -e

arch=$(uname)

if [ "$arch" == 'Darwin' ];
then
system=mac
else
echo "System with arch $arch not yet supported..."
exit 1
fi

home-manager switch --flake ".#sgeisenh-$system"
