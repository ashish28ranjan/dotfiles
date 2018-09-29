#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Tmuxifier\n\n"

    execute \
        "git submodule update --init --force --remote > /dev/null 2>&1" \
        "Update Tmuxifier"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local sourceFile="$(cd ../.. && pwd)/tmuxifier/bin/tmuxifier"
    local targetFile="$HOME/bin/tmuxifier"

    create_symlink "$sourceFile" "$targetFile"

    execute "export TMUXIFIER_LAYOUT_PATH='$HOME/.config/tmuxifier'" \
            "Layout path: '$HOME/.config/tmuxifier'"

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

        if [ -f $targetFile ]; then
            print_success "Created: $targetFile"
        else
            execute "cp -a $sourceFile $targetFile" \
                "Created: $targetFile"
        fi

    done

    printf "\n"
}

main
