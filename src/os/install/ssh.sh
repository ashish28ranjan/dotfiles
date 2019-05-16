#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Own .ssh folder
    chown -R "$(whoami)" "$HOME/.ssh"

    # Make all files inside .ssh rw-------
    find "$HOME/.ssh" -maxdepth 2 -type f -exec chmod 600 {} ';'

    # Make all directories inside .ssh rwx------
    find "$HOME/.ssh" -maxdepth 2 -type d -exec chmod 700 {} ';'

    # Make .ssh rwx------
    chmod 700 "$HOME/.ssh"

}

main
