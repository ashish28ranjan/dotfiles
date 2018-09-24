#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

initialize_backup_dir() {

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

    CURRENT_VERSION=$[$LAST_VERSION + 1]

    BACKUP_DIR="$HOME/dotfiles-backup/v$CURRENT_VERSION"

    mkd "$BACKUP_DIR" \
        || ( print_error "Failed to create backup directory" && exit 1 )

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

finish_backup() {

    find "$BACKUP_DIR" -type d -exec rmdir {} \; 2>/dev/null

    if [ -d "$BACKUP_DIR" ]; then
        print_success "Backup created successfully"
    else
        print_success "Backup is not needed, hence v$CURRENT_VERSION has been deleted"
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

        if [[ -e "$sourceFile" && ! -L "$sourceFile" ]]; then

            # If the target file is not a symlink, take a backup
            execute \
                "cp -a $sourceFile $targetFile" \
                "$sourceFile → $targetFile" \
                || print_error "Failed to backup $sourceFile"

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_full_path_backup() {

    declare -a FILES_TO_BACKUP=(

        "gnupg/gpg.conf"
        "gnupg/gpg-agent.conf"

    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_BACKUP[@]}"; do

        sourceFile="$HOME/.$i"
        targetFile="$BACKUP_DIR/.$i"

        if [[ -e "$sourceFile" && ! -L "$sourceFile" ]]; then

            # If the source file is not a symlink, take a backup
            mkdir -p "$(dirname $targetFile)"
            execute \
                "cp -a $sourceFile $targetFile" \
                "$sourceFile → $targetFile" \
                || print_error "Failed to backup $sourceFile"

        fi

    done

}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create backup\n\n"

    initialize_backup_dir

    create_backup

    create_full_path_backup

    finish_backup
}

main
