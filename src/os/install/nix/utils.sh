#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_collect_garbage() {

    # Delete all the store directories which are not being used
    # in any other profiles or generations

    execute \
        "nix-store --gc" \
        "Collect garbage"

}

nix_install() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    local installedFlag="$(nix-env -qasA $PACKAGE | cut -c1)"

    if [ "$installedFlag" == "I" ]; then
        print_success "$PACKAGE_READABLE_NAME"
    else
        execute \
            "nix-env --install --attr $PACKAGE" \
            "$PACKAGE_READABLE_NAME"
    fi

}

nix_optimize() {

    # Reduce Nix storage space by hard linking identical files

    execute \
        "nix-store --optimise" \
        "Optimize nix store"

    nix_collect_garbage

}

update() {

    # Resynchronize the Nix expressions of all subscribed channels.

    execute \
        "nix-channel --update" \
        "Nix (update)"

}

upgrade() {

    # Install the newest versions of all packages installed.

    execute \
        "nix-env --upgrade" \
        "Nix (upgrade)"

}
