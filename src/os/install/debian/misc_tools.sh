#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"


install_package "aria2" "aria2"


install_package "cURL" "curl"


if [ ! -f "$HOME/bin/diff-so-fancy" ]; then
    wget -qO "$HOME/bin/diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
fi
execute "chmod +x '$HOME/bin/diff-so-fancy'" \
        "diff-so-fancy"


if ! package_is_installed "fd"; then

    tmpDir="$(mktemp -d /tmp/XXXXX)"
    downloadUrl="https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb"

    execute "curl -fLo $tmpDir/fd.deb $downloadUrl \
            && sudo dpkg -i $tmpDir/fd.deb" \
        "fd"

else
    print_success "fd"
fi


install_package "ffmpeg" "ffmpeg libav-tools x264 x265"
install_package "htop" "htop"
install_package "ShellCheck" "shellcheck"
install_package "The Silver Searcher (ag)" "silversearcher-ag"
install_package "Vim" "vim"
install_package "xclip" "xclip"


if [ -d "$HOME/.nvm" ]; then

    if ! package_is_installed "yarn"; then

        add_key "https://dl.yarnpkg.com/debian/pubkey.gpg" \
            || print_error "Yarn (add key)"

        add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list" \
            || print_error "Yarn (add to package resource list)"

        update &> /dev/null \
            || print_error "Yarn (resync package index files)"

    fi

    install_package "Yarn" "yarn" "--no-install-recommends"
fi

