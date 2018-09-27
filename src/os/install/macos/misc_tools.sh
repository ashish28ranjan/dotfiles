#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"
brew_install "The Silver Searcher (ag)" "the_silver_searcher"

if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
