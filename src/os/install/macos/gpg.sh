#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   GPG\n\n"

./../gpg.sh

brew_install "GPG" "gpg"
brew_install "GPG 2" "gpg2"

# gpg-agent is removed because it is redundant without gnupg2
# https://github.com/Homebrew/homebrew-core/commit/965e130e04e5900e35bf1f0b6ebad9d1c2f680a7

# brew_install "GPG Agent" "gpg-agent"

brew_install "Pinentry" "pinentry-mac"
