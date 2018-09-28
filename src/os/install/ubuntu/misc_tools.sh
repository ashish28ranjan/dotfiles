#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

install_package "cURL" "curl"
install_package "ShellCheck" "shellcheck"
install_package "xclip" "xclip"
install_package "The Silver Searcher (ag)" "silversearcher-ag"
install_package "htop" "htop"


if ! package_is_installed "ffmpeg"; then

    add_ppa "jonathonf/ffmpeg-3" \
        || print_error "ffmpeg (add ppa)"

    update &> /dev/null \
        || print_error "ffmpeg (resync package index files)"

fi
install_package "ffmpeg" "ffmpeg libav-tools x264 x265"


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


if [ ! -f "$HOME/bin/diff-so-fancy" ]; then
    wget -qO "$HOME/bin/diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
fi
execute "chmod +x '$HOME/bin/diff-so-fancy'" \
        "diff-so-fancy"


if ! package_is_installed "redshift"; then

    add_ppa "dobey/redshift-daily" \
        || print_error "Redshift (add ppa)"

    update &> /dev/null \
        || print_error "Redshift (resync package index files)"

fi
install_package "Redshift" "redshift redshift-gtk"
