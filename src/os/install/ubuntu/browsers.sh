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

if ! package_is_installed "brave-browser"; then

    local os_codename="$(lsb_release -sc)"

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

add_ppa "mozillateam/firefox-next" \
    || print_error "firefox (add ppa)"

update &> /dev/null \
    || print_error "firefox (resync package index files)"

install_package "Firefox (beta)" "firefox"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Flash" "flashplugin-installer"
