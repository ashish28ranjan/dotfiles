#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

if ! package_is_installed "git"; then

  add_ppa "git-core/ppa" \
     || print_error "Git (add ppa)"

fi

update &> /dev/null \
  || print_error "Git (resync package index files)"

install_package "Git" "git"
