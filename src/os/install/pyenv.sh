#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   pyenv\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Sync source code

    if command -v pyenv 1>/dev/null 2>&1; then

        execute \
            "cd $(pyenv root) && git pull" \
            "Update pyenv repository"

        execute \
            "cd $(pyenv root)/plugins/pyenv-virtualenv && git pull" \
            "Update pyenv-virtualenv repository"

    else

        execute \
            "git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv" \
            "Download pyenv repository"

        execute \
            "git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv" \
            "Download pyenv-virtualenv repository"

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add pyenv to path

    local sourceFile="$HOME/.pyenv/bin/pyenv"
    local targetFile="$HOME/bin/pyenv"

    create_symlink "$sourceFile" "$targetFile"

}

main

