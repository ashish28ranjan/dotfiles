#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_spacevim() {

  execute \
    "git clone https://github.com/liuchengxu/space-vim.git $HOME/.space-vim \
      && cd $HOME/.space-vim \
      && make neovim" \
    "Space-Vim (installing only for neovim)"

}

main() {

    print_in_purple "\n   Neovim\n\n"

    "./$(get_os)/neovim.sh"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Space-vim
    install_spacevim

    unset -f install_spacevim

}

main
