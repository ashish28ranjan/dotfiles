#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Neovim\n\n"

    "./$(get_os)/neovim.sh"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Spacevim

    execute \
        "curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim \
            > /dev/null 2>&1" \
        "SpaceVim (installing only for neovim)"

    printf "\n"
}

main
