#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

nix_install "Brave (stable)" "nixpkgs.brave"
nix_install "Chrome (beta)" "nixpkgs.google-chrome-beta"
nix_install "Firefox (beta)" "nixpkgs.firefox-beta-bin"
