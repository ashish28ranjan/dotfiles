#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   GPG\n\n"

    "./$(get_os)/gpg.sh"

    # CRITICAL: change permissions of the .gnupg folder and contents
    mkdir -p "$HOME/.gnupg"
    chown -R $(whoami) "$HOME/.gnupg"
    chmod 600 "$HOME/.gnupg/*"
    chmod 700 "$HOME/.gnupg"

    printf "\n"
}

main
