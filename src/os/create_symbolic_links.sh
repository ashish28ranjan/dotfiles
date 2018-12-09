#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/aliases/bash_aliases"
        "shell/bash_autocomplete"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_logout"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"

        "tmux/tmux.conf"

        "vim/vimrc"
        "vim/spacevim"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        create_symlink "$sourceFile" "$targetFile"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_full_path_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "gnupg/gpg.conf"
        "gnupg/gpg-agent.conf"

        "config/redshift.conf"
    )

    # This will create a file $HOME/.gnupg/gpg.conf
    # and symlink it to dotfiles/src/gnupg/gpg.conf

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$i"

        # Create the full folder structure
        mkdir -p "$(dirname $targetFile)"

        create_symlink "$sourceFile" "$targetFile"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
    create_full_path_symlinks "$@"
}

main "$@"
