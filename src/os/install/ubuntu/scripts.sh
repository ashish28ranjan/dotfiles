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

git-ydiff() {

    local targetFile="$HOME/bin/git-ydiff"
    local sourceFile="$(which ydiff)"

    if [ "$?" -eq 0 ]; then
        execute "unlink $targetFile \
                && create_symlink $sourceFile $targetFile" \
            "git-ydiff"
    else
        print_error "ydiff not found"
    fi

}

main() {

    print_in_purple "\n   Scripts\n\n"

    git-icdiff
    git-ydiff

}

main
