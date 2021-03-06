#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

init_backup() {

    mkdir -p "$HOME/dotfiles-backup"

    # get the version
    LAST_VERSION=$(
        find "$HOME/dotfiles-backup" -iname 'v[[:alnum:]]*' \
        -type d | \
        sed "s/.*\///" | \
        cut -c 2- | \
        sort -n | \
        tail -1
    )

    CURRENT_VERSION=$(($LAST_VERSION + 1))

    BACKUP_DIR="$HOME/dotfiles-backup/v$CURRENT_VERSION"

    mkd "$BACKUP_DIR" \
        || ( print_error "Failed to create backup directory" && exit 1 )

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

finish_backup() {

    # https://unix.stackexchange.com/questions/8430/how-to-remove-all-empty-directories-in-a-subtree
    find "$BACKUP_DIR" -type d -empty -delete > /dev/null 2>&1

    # The following rmdir command is added as hack to delete the topmost
    # directory on MacOS. The exact bug is mentioned in the link.
    # https://unix.stackexchange.com/questions/497666/relative-path-potentially-not-safe-error-with-find-delete-on-macos
    rmdir "$BACKUP_DIR" > /dev/null 2>&1

    if [ -d "$BACKUP_DIR" ]; then
        print_success "Backup created successfully"
    else
        print_success "Backup is not needed, hence v$CURRENT_VERSION has been deleted"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_file() {

    if [[ -e "$1" && ! -L "$1" ]]; then

        # If the source file is not a symlink, take a backup
        execute \
            "cp -a $1 $2" \
            "$1 → $2" \
            || print_error "$1 → $2"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_backup() {

    declare -a FILES_TO_BACKUP=(

        "shell/aliases/bash_aliases"
        "shell/autocomplete/$(get_os)/bash_autocomplete"
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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_BACKUP[@]}"; do

        sourceFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
        targetFile="$BACKUP_DIR/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        copy_file "$sourceFile" "$targetFile"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_full_path_backup() {

    declare -a FILES_TO_BACKUP=(

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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_BACKUP[@]}"; do

        sourceFile="$HOME/.$i"
        targetFile="$BACKUP_DIR/.$i"

        mkdir -p "$(dirname $targetFile)"

        copy_file "$sourceFile" "$targetFile"

    done

}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create backup\n\n"

    init_backup

    create_backup

    create_full_path_backup

    finish_backup
}

main
