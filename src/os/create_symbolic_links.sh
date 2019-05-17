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

        "vim/vim"
        "vim/vimrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        create_symlink "$sourceFile" "$targetFile" "$@"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_full_path_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "config/fzf/shell/completion.bash"
        "config/fzf/shell/fzf.bash"
        "config/fzf/shell/key-bindings.bash"
        "config/nixpkgs/config.nix"
        "config/nvim/init.vim"
        "config/redshift.conf"
        "config/z/shell/z.sh"

        "gnupg/gpg.conf"
        "gnupg/gpg-agent.conf"

        "ssh/assh.yml"

    )

    # This will create a file $HOME/.gnupg/gpg.conf
    # and symlink it to dotfiles/src/gnupg/gpg.conf

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$i"

        # Create the full folder structure
        mkdir -p "$(dirname $targetFile)"

        create_symlink "$sourceFile" "$targetFile" "$@"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
    create_full_path_symlinks "$@"
}

main "$@"
