_export dst     ${ZDOTBLD}/zjot
_export src     https://github.com/bryanhann/rhino-zjot.git
#(dirname $(grealpath $0))/zjot
#_export dst     $(dirname $(grealpath $0))/zjot

[ -d ${dst}  ] || {
    git clone $src $dst
}

source ${dst}/zjot.sh

