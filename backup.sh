#!/usr/bin/env bash
if [[ ! -f "./lib/functions.sh" ]]; then
    echo -e "\e[91mError! The functions.sh file isn't present"
fi
source "./lib/functions.sh"