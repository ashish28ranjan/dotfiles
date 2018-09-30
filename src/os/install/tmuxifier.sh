#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Tmuxifier\n\n"

    execute \
        "git submodule foreach git pull origin master > /dev/null 2>&1" \
        "Update Tmuxifier"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local sourceFile="$(cd ../.. && pwd)/tmuxifier/bin/tmuxifier"
    local targetFile="$HOME/bin/tmuxifier"

    create_symlink "$sourceFile" "$targetFile"

    declare -a FILES_TO_COPY=(

        "tmuxifier/examples/example.session.sh"
        "tmuxifier/examples/example.window.sh"

    )

    local i=""
    local sourceFile=""
    local targetFile=""

    for i in "${FILES_TO_COPY[@]}"; do

        sourceFile="$(cd ../.. && pwd)/$i"
        targetFile="$HOME/.config/tmuxifier/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        create_symlink "$sourceFile" "$targetFile"

    done

}

main
