#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

nix_install "Coreutils" "nixpkgs.coreutils-full"
nix_install "GNU Compiler Collection" "nixpkgs.gcc-unwrapped"
nix_install "OpenSSH" "nixpkgs.openssh"
nix_install "Wget" "nixpkgs.wget"
