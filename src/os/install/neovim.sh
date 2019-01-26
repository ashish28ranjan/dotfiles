#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_neovim_python() {

    if cmd_exists "pyenv"; then

        pyenv versions | grep "^[* ]*neovim2" > /dev/null
        if [ $? -eq 1 ]; then

            pyenv versions | grep "^[* ]*2.7.15" > /dev/null
            if [ $? -eq 1 ]; then
                execute \
                    "pyenv install 2.7.15" \
                    "Install python 2.7.15"
            fi

            execute \
                "pyenv virtualenv 2.7.15 neovim2" \
                "Virtualenv neovim2 (2.7.15)"

        fi

        pyenv versions | grep "^[* ]*neovim3" > /dev/null
        if [ $? -eq 1 ]; then

            pyenv versions | grep "^[* ]*3.6.8" > /dev/null
            if [ $? -eq 1 ]; then
                execute \
                    "pyenv install 3.6.8" \
                    "Install python 3.6.8"
            fi

            execute \
                "pyenv virtualenv 3.6.8 neovim3" \
                "Virtualenv neovim3 (3.6.8)"

        fi

        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

        execute \
            "pyenv activate neovim2 \
                && pip install --upgrade pip \
                && pip install neovim \
                && pyenv deactivate" \
            "Python2 for neovim"

        execute \
            "pyenv activate neovim3 \
                && pip install --upgrade pip \
                && pip install neovim \
                && pyenv deactivate" \
            "Python3 for neovim"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Neovim\n\n"

    "./$(get_os)/neovim.sh"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_neovim_python

}

main
