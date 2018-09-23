#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Neovim\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "neovim"; then

    add_ppa "neovim-ppa" \
        || print_error "Neovim (add ppa)"

    update &> /dev/null \
        || print_error "Neovim (resync package index files)"

fi

install_package "Neovim" "neovim"
