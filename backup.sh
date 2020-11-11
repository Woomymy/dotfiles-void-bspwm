#!/usr/bin/env bash
if [[ ! -f "./lib/functions.sh" && ! -f "./lib/colors.sh" ]]; then
    echo -e "\e[91mError! The functions files aren't present"
fi
source "./lib/functions.sh"
main