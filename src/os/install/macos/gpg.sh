#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "GPG" "gpg"
brew_install "GPG 2" "gpg2"
brew_install "GPG Agent" "gpg-agent"
brew_install "Pinentry" "pinentry-mac"
