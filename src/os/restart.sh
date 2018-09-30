#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

isDesktopEnabled=false

is_desktop_enabled "$@" \
    && isDesktopEnabled=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Restart\n\n"

    ask_for_confirmation "Do you want to restart?"
    printf "\n"

    if answer_is_yes; then
        sudo shutdown -r now &> /dev/null
    fi

 }

if [ "$(user_has_sudo)" != "no_sudo" ] && $isDesktopEnabled; then

	main

fi
