#echo ++ zshrc.sh $0

_r20 () {
    local dst=${R20_OHM_CONFIG_BUILD}/r20.activate/${1}
    local src=https://github.com/bryanhann/r20.activate.${1}.git
    [ -d ${dst} ] || echo '\n>>>>>' cloning ${1} '\n'
    [ -d ${dst} ] || git clone $src $dst
    source ${dst}/activate.sh
}

#_r20 core
echo 76
_r20 dunders
_r20 venv
_r20 zjot
_r20 vwrap
_r20 omzsh
_r20 bch
_r20 libre
_r20 bch.ws852

#echo -- zshrc.sh

