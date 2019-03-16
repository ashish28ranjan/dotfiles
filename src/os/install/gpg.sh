#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   GPG\n\n"

    "./$(get_os)/gpg.sh"

    # CRITICAL: change permissions of the .gnupg folder and contents
    mkdir -p "$HOME/.gnupg"

    # Own .gnupg folder
    chown -R "$(whoami)" "$HOME/.gnupg"

    # Make all files inside .gnupg rw-------
    find "$HOME/.gnupg" -maxdepth 2 -type f -exec chmod 600 {} ';'

    # Make all directories inside .gnupg rwx------
    find "$HOME/.gnupg" -maxdepth 2 -type d -exec chmod 700 {} ';'

    # Make .gnupg rwx------
    chmod 700 "$HOME/.gnupg"

}

main
