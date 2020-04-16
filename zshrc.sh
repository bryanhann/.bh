#echo ++ zshrc.sh $0
_export () {export ${1}=${2};}
_export HERE $(dirname $(grealpath ${0}))

_r20 () {
    local dst=${OHM_BUILD}/r20.activate/${1}
    local src=https://github.com/bryanhann/r20.activate.${1}.git
    if [ ! -d ${dst} ];
        then
            echo '\n>>>>>' cloning ${1} '\n'
            git clone $src $dst
    fi
    source ${dst}/activate.sh
}


source ${HOME}/.config/ohm/activate.sh
#source ${HOME}/.config/ohm/vwrap/activate.sh
#source ${HOME}/.config/ohm/omzsh/activate.sh

_r20 dunders
_r20 venv
_r20 zjot
_r20 vwrap
_r20 omzsh
_r20 bch
#echo -- zshrc.sh
