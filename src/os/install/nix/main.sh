#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./browsers.sh
./compression_tools.sh
./fonts.sh
./fzf.sh
./git.sh
./gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../neovim.sh
./../tmuxifier.sh

./cleanup.sh
