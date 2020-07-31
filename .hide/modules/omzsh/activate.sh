r20export ZSH $(dirname $(grealpath $0))/__omzsh__
[ -d $ZSH ] || {
    echo INSTALLING OMZSH
    $(dirname $(grealpath $0))/vendor/install.sh --unattended
}
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
#ZSH_THEME="mira"
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh
