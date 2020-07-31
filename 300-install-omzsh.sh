[[ -d $ZSH ]] || {
    $BORGHOME/vendor/omzsh/install.sh --unattended ;
}

.remove-omzsh () {
    rm -rf $ZSH
}

