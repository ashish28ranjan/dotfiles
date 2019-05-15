#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

git-icdiff() {

    if [ ! -f "$HOME/bin/git-icdiff" ]; then
        wget -qO "$HOME/bin/git-icdiff" "https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.9.4/git-icdiff" &> /dev/null
    fi
    execute "chmod +x '$HOME/bin/git-icdiff'" \
            "git-icdiff"

}

main() {

    print_in_purple "\n   Scripts\n\n"

    git-icdiff

}

main
