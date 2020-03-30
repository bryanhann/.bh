r20_activate () {
    export dst=${ZDOTBLD}/r20.activate.${1}
    export src=https://github.com/bryanhann/r20.activate.${1}.git
    [ -d ${dst} ] || git clone $src $dst
    source ${dst}/activate.sh
}

