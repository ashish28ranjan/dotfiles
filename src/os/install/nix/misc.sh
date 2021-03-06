#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

nix_install "Filezilla" "nixpkgs.filezilla"
nix_install "Meld" "nixpkgs.gnome3.meld"
nix_install "Redshift" "nixpkgs.redshift"
nix_install "Sxiv" "nixpkgs.sxiv"
nix_install "VLC" "nixpkgs.libsForQt5.vlc"
