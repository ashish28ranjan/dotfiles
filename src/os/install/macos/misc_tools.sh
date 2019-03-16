#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


brew_install "aria2" "aria2"

brew_install "bat" "bat"

if [ ! -f "$HOME/bin/diff-so-fancy" ]; then
    wget -qO "$HOME/bin/diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
fi
execute "chmod +x '$HOME/bin/diff-so-fancy'" \
        "diff-so-fancy"


brew_install "fd" "fd"

brew_install "glances" "glances"

brew_install "htop" "htop"

brew_install "iTerm2" "iterm2" "caskroom/cask" "cask"


if [ ! -f "$HOME/bin/prettyping" ]; then
    wget -qO "$HOME/bin/prettyping" "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping" &> /dev/null
fi
execute "chmod +x '$HOME/bin/prettyping'" \
        "prettyping"


brew_install "Python3" "python3"

execute "sudo -H pip3 install --upgrade pip" \
        "Pip3 upgrade"

execute "pip3 install --user pipenv" \
        "Pipenv"


brew_install "ripgrep (rg)" "ripgrep"

brew_install "ShellCheck" "shellcheck"
brew_install "The Silver Searcher (ag)" "the_silver_searcher"
brew_install "tree" "tree"


if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
