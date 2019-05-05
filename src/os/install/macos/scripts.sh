#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

    git-ydiff

}

main
