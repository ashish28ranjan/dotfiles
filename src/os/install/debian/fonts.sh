#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"


localFontPath="$HOME/.local/share/fonts"
downloadPath="$HOME/tools"


if [ ! -f "$localFontPath/UbuntuMono-R.ttf" ]; then

    execute "wget -qO $downloadPath/ubuntu-font-family-0.83.zip \
                'https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip' &> /dev/null \
            && unzip -qq -o -d $downloadPath \
                $downloadPath/ubuntu-font-family-0.83.zip \
            && cp -f --preserve $downloadPath/ubuntu-font-family-0.83/*.ttf \
                $localFontPath" \
        "Ubuntu"

else

    print_success "Ubuntu"

fi


execute "chmod 644 $localFontPath/*.ttf \
        && fc-cache -f $localFontPath" \
    "Update font cache"
