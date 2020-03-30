_export dst ${ZDOTBLD}/r20.activate.zjot
_export src https://github.com/bryanhann/r20.activate.zjot.git
[ -d ${dst}  ] || git clone $src $dst
source ${dst}/activate.sh

