
_export dst $ZDOTBLD/dunders
_export src https://github.com/bryanhann/bch.dunders.git

[ -d ${dst} ] || {
    echo CLONING DUNDERS
    git clone $src $dst
}

source $dst/dunders.sh
