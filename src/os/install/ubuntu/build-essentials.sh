#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

# Install tools for using https in apt sources
install_package "apt-transport-https" "apt-transport-https"

# Install tools for compiling/building software from source.
install_package "Build Essential" "build-essential libbz2-dev \
    libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev \
    libreadline-dev libsqlite3-dev libssl-dev llvm make \
    python-openssl tk-dev unzip wget xz-utils zlib1g-dev"

# GnuPG archive keys of the Debian archive.
install_package "GnuPG archive keys" "debian-archive-keyring"

# Software which is not included by default
# in Ubuntu due to legal or copyright reasons.
# install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"
