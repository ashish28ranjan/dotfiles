#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

nix_install "Wget" "nixpkgs.wget"
nix_install "gcc" "nixpkgs.gcc-unwrapped"
nix_install "OpenSSH" "nixpkgs.openssh"
