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

nix build --no-link ".#homeConfigurations.sgeisenh-$system.activationPackage"
"$(nix path-info .#homeConfigurations.sgeisenh-$system.activationPackage)"/activate
./apply.sh
