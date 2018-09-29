#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

if [ "$(user_has_sudo)" == "no_sudo" ]; then
    print_warning "The current user does not have sudo access, \
hence no softwares will be installed"
else
    "./$(get_os)/main.sh" "$@"
fi
