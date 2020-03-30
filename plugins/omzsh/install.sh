_export ZSH $ZDOTBLD/omzsh

[ -d $ZSH ] || {
    echo INSTALLING OMZSH
    $(dirname $(grealpath $0))/vendor/install.sh --unattended
}

source $ZSH/oh-my-zsh.sh
