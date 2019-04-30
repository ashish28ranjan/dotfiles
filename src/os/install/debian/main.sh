#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

isDesktopEnabled=false

is_desktop_enabled "$@" \
    && isDesktopEnabled=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
./../nvm.sh

./compression_tools.sh
./fzf.sh
./git.sh
./gpg.sh
./misc_tools.sh
./../npm.sh
./../neovim.sh
./../pyenv.sh
./tmux.sh
./../tmuxifier.sh

if $isDesktopEnabled; then

	./browsers.sh
    ./fonts.sh
	./image_tools.sh
	./misc.sh

fi

./cleanup.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


