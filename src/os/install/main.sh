#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

if [ "$(user_has_sudo)" == "no_sudo" ]; then
    print_warning "The current user does not have sudo access, \
hence no softwares will be installed"
else

    if ! cmd_exists "nix"; then
        sh <(curl https://nixos.org/nix/install) --daemon
    fi

    if cmd_exists "nix"; then
        ./nix/main.sh
    else
        "./$(get_os)/main.sh" "$@"
    fi

fi
