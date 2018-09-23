#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_backup() {

    # get the version
    LAST_VERSION=$(
        find -iname 'v[[:alnum:]]*' \
        -type d | \
        cut -c 4- | \
        sort -n | \
        tail -1
    )

    CURRENT_VERSION=$[$LAST_VERSION + 1]

    BACKUP_DIR="$HOME/dotfiles-backup/v$CURRENT_VERSION"

    mkd "$BACKUP_DIR" \
        || ( print_error "Failed to create backup directory" && return 0 )

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

        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -L "$targetFile" ]; then

            # If the target file is not a symlink, take a backup
            execute \
                "cp -a $targetFile $BACKUP_DIR" \
                "$targetFile" \
                || print_error "Failed to backup $targetFile"

        fi

    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "ls -A $BACKUP_DIR | wc -m" == "0" ]; then

        # If the backup directory is empty then delete it
        execute "rmdir $BACKUP_DIR >> /dev/null 2>&1" \
            && print_success "Backup is not needed"

    else
        print_success "Backup created successfully"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create backup\n\n"
    create_backup
}

main
