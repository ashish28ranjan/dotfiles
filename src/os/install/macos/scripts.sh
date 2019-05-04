#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Scripts\n\n"

execute "create_symlink \"$HOME/bin/ydiff\" \"$HOME/bin/git-ydiff\"" \
    "git-ydiff"
