_export dst ${ZDOTBLD}/r20.activate.dunders
_export src https://github.com/bryanhann/r20.activate.dunders.git
[ -d ${dst}  ] || git clone $src $dst
source ${dst}/activate.sh

