#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

isDesktopEnabled=false

is_desktop_enabled "$@" \
    && isDesktopEnabled=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if $isDesktopEnabled; then

    ./privacy.sh
    ./terminal.sh
    ./ui_and_ux.sh

fi
