#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./../nvm.sh

./browsers.sh
./compression_tools.sh
./fonts.sh
./fzf.sh
./git.sh
./gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../npm.sh
./../neovim.sh
./../pyenv.sh
./scripts.sh
./tmux.sh
./../tmuxifier.sh
./video_tools.sh
./web_font_tools.sh

./cleanup.sh
