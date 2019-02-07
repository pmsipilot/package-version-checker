#!/bin/bash

function check-yarn {
    ERROR='\033[0;31m'
    INFO='\033[0;34m'
    RESET='\033[0m'

    if [ -z $1 ]; then
        echo -e "${INFO}Default to current path${RESET}"
        DIR_FRONTEND=$(pwd)
    else
        DIR_FRONTEND="$1"
    fi

    pushd $DIR_FRONTEND
    RESULT=0
    for DEP in $(jq -r '.dependencies | keys | .[]' package.json)
    do
        COUNT=$(cat yarn.lock | grep -c $DEP@)
        if [ $COUNT -gt 1 ]; then
            echo -e "${ERROR}The dependency ${DEP} is installed in ${COUNT} different versions${RESET}"
            RESULT=1
        fi
    done

    popd

    return $RESULT
}



if [[ "$_" = "$0" ]]; then
    check-yarn $1
fi
