_export () {export ${1}=${2};}

_export HERE $(dirname $(grealpath ${0}))


_r20 () {
    export dst=${ZDOTBLD}/r20.activate.${1}
    export src=https://github.com/bryanhann/r20.activate.${1}.git
    if [ ! -d ${dst} ];
        then
            echo '\n>>>>>' cloning ${1} '\n'
            git clone $src $dst
    fi
    source ${dst}/activate.sh
}
