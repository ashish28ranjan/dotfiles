#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

# Install tools for using https in apt sources
install_package "apt-transport-https" "apt-transport-https"

# Install tools for compiling/building software from source.
install_package "Build Essential" "build-essential"

# GnuPG archive keys of the Debian archive.
install_package "GnuPG archive keys" "debian-archive-keyring"

