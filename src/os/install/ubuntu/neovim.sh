#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "neovim"; then

    add_ppa "neovim-ppa/stable" \
        || print_error "Neovim (add ppa)"

    update &> /dev/null \
        || print_error "Neovim (resync package index files)"

fi

install_package "Neovim" "neovim"
