#!/bin/bash

if [ $# -eq 0 ]; then
	SUB=$(gum choose "Font" "Update" "Install" "Uninstall" "Manual" "Quit" --height 9 --header "" | tr '[:upper:]' '[:lower:]')
else
	SUB=$1
fi

[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $BTW_PATH/bin/btw-sub/$SUB.sh
