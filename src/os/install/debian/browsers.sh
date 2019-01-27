#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "brave-browser"; then

    add_key "https://brave-browser-apt-release.s3.brave.com/brave-core.asc" \
        || print_error "Brave browser (add key)"

    add_to_source_list "[arch=amd64] https://brave-browser-apt-release.s3.brave.com/ `lsb_release -sc` main" "brave-browser-release-`lsb_release -sc`.list" \
        || print_error "Brave browser (add to package resource list)"

    update &> /dev/null \
        || print_error "Brave browser (resync package index files)"

fi

install_package "Brave browser" "brave-browser brave-keyring"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Firefox ESR" "firefox-esr"
