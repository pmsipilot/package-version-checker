#!/bin/bash

ERROR='\033[0;31m'
INFO='\033[0;34m'
RESET='\033[0m'

ORIGINAL_DIR="$(pwd)"
if [ -z $1 ]; then
    echo -e "${INFO}Default to current path${RESET}"
    DIR_FRONTEND=$ORIGINAL_DIR
else
    DIR_FRONTEND="$1"
fi

cd $DIR_FRONTEND
RESULT=0
for DEP in $(cat package.json | jq ".dependencies" | jq keys | jq -r '.[]')
do
    COUNT=$(cat yarn.lock | grep -c $DEP@)
    if [ $COUNT -gt 1 ]; then
        echo -e "${ERROR}The dependency ${DEP} is installed in ${COUNT} different versions"
        RESULT=1
    fi
done

cd $ORIGINAL_DIR

return $RESULT
