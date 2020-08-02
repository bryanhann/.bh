if [[ ! "$1" == "--recur" ]] ; then
    cd $ZDOTDIR
    echo "[++.zshrc]"
    source functions.sh
    .source .zshrc --recur
    echo "type '.help' for help"
    echo "[++.zshrc]"
    #echo
    #echo
else
    .log
    .log $(date)
    .log
    [[ -z "$BORG" ]] && { for script in $(ls [0]*.sh   | sort); do .source $script; done; }
    [[ true       ]] && { for script in $(ls [1-9]*.sh | sort); do .source $script; done; }
fi


