#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

nix_install "Iosevka" "nixpkgs.iosevka-bin"
nix_install "Ubuntu Font Family" "nixpkgs.ubuntu_font_family"
