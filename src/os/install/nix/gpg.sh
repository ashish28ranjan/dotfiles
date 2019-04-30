#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   GPG\n\n"

./../gpg.sh

nix_install "GPG" "nixpkgs.gnupg"

case "$(get_os)" in
    macos)
        nix_install "Pinentry Mac" "nixpkgs.pinentry_mac"
        ;;
    *)
        break
        ;;
esac
