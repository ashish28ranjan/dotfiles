#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "brave-browser"; then

    os_codename="$(lsb_release -sc)"

    add_key "https://brave-browser-apt-release.s3.brave.com/brave-core.asc" \
        || print_error "Brave browser (add key)"

    source /etc/os-release &> /dev/null

    add_to_source_list "[arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $os_codename main" "brave-browser-release-$os_codename.list" \
        || print_error "Brave browser (add to package resource list)"

    update &> /dev/null \
        || print_error "Brave browser (resync package index files)"

fi

install_package "Brave (stable)" "brave-browser brave-keyring"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Firefox ESR" "firefox-esr"
