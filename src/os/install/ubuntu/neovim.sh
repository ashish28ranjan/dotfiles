#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ! -f "$HOME/bin/nvim" ]; then

    execute "wget -qO '$HOME/bin/nvim' 'https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage' &> /dev/null \
        && chmod +x '$HOME/bin/nvim'" \
        "Neovim"

else

    execute "chmod +x '$HOME/bin/nvim'" \
            "Neovim"

fi
