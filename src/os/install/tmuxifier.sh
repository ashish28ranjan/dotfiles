#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Tmuxifier\n\n"

    execute \
        "git submodule update --recursive --remote > /dev/null 2>&1" \
        "Tmuxifier source repository updated"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local -r sourceFile="$(cd ../.. && pwd)/tmuxifier/bin/tmuxifier"
    local -r targetFile="$HOME/bin/tmuxifier"

    create_symlink "$sourceFile" "$targetFile"

    printf "\n"
}

main
