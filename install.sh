#!/usr/bin/env bash

set -e

nix build --no-link .#homeConfigurations.sgeisenh.activationPackage
"$(nix path-info .#homeConfigurations.sgeisenh.activationPackage)"/activate
./apply.sh
