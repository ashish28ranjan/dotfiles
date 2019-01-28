#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local sourceFile="$HOME/tools/nvim-linux64/bin/nvim"
    local targetFile="$HOME/bin/nvim"

    if [ ! -f "$sourceFile" ]; then

        local zipFile="$HOME/tools/nvim-linux64.tar.gz"

        execute "wget -qO $zipFile 'https://github.com/neovim/neovim/releases/download/v0.3.4/nvim-linux64.tar.gz' &> /dev/null \
            && tar xzf $zipFile -C '$HOME/tools' \
            && rm $zipFile &> /dev/null" \
            "Download and extract"

    fi

    create_symlink "$sourceFile" "$targetFile"

}

main
