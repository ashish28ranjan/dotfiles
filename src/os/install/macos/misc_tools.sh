#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


brew_install "aria2" "aria2"


if [ ! -f "$HOME/bin/diff-so-fancy" ]; then
    wget -qO "$HOME/bin/diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
fi
execute "chmod +x '$HOME/bin/diff-so-fancy'" \
        "diff-so-fancy"


brew_install "fd" "fd"

brew_install "htop" "htop"

brew_install "iTerm2" "iterm2" "caskroom/cask" "cask"


brew_install "Python3" "python3"

execute "sudo -H pip3 install --upgrade pip" \
        "Pip3 upgrade"


brew_install "ShellCheck" "shellcheck"
brew_install "The Silver Searcher (ag)" "the_silver_searcher"


if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
