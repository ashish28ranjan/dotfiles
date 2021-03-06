#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

basic_setup() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add pyenv to path

    local sourceFile="$(cd ../.. && pwd)/config/fzf/bin/fzf-tmux"
    local targetFile="$HOME/bin/fzf-tmux"

    create_symlink "$sourceFile" "$targetFile"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    basic_setup

}

main
