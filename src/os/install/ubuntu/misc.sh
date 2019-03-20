#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"


install_package "Meld" "meld"

if ! package_is_installed "redshift"; then

    add_ppa "dobey/redshift-daily" \
        || print_error "Redshift (add ppa)"

    update &> /dev/null \
        || print_error "Redshift (resync package index files)"

fi
install_package "Redshift" "redshift redshift-gtk"


install_package "Transmission" "transmission"
install_package "VLC" "vlc"
