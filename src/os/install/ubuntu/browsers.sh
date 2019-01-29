#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "google-chrome-stable"; then

    add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
        || print_error "Google Chrome (add key)"

    add_to_source_list "[arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" "google-chrome.list" \
        || print_error "Google Chrome (add to package resource list)"

    update &> /dev/null \
        || print_error "Google Chrome (resync package index files)"

fi

install_package "Google Chrome" "google-chrome-stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ppa "mozillateam/firefox-next" \
    || print_error "firefox (add ppa)"

update &> /dev/null \
    || print_error "firefox (resync package index files)"

install_package "Firefox (beta)" "firefox"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Flash" "flashplugin-installer"
