
[[ -d $ZSH ]] && {
    .note omzsh is already installed
}|| {
    .note installing omzsh
    $BORGHOME/vendor/omzsh/install.sh --unattended ;
}

.note defining function .remove-omzsh
.remove-omzsh () {
    rm -rf $ZSH
}

