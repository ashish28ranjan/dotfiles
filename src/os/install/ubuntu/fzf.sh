#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fzf\n\n"

    ./../fzf.sh

    if ! cmd_exists "fzf"; then

        tmpDir="$(mktemp -d /tmp/XXXXX)"
        downloadUrl="https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz"

        execute "curl -fLo $tmpDir/fzf.tgz $downloadUrl \
                && tar -xf $tmpDir/fzf.tgz -C $tmpDir \
                && cp $tmpDir/fzf $HOME/bin" \
            "fzf"

    else

        print_success "fzf"

    fi

}

main
