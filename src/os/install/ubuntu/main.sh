#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
./bash.sh
./../nvm.sh

./browsers.sh
./compression_tools.sh
./git.sh
./../gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../npm.sh
./tmux.sh
./../neovim.sh
./../tmuxifier.sh

./cleanup.sh
