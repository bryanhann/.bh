#echo ++ zprofile
_export () {export $1=$2;}

_export OHM     $(dirname $(grealpath $0))
_export PATH    ${PATH}:${OHM}/sbin

source ${HOME}/.config/r20/ohm/activate.sh

[ -z "${R20_OHM_CONFIG_BUILD}" ] && ohm-exc-undefined $0 R20_OHM_CONFIG_BUILD
[ -z "${R20_OHM_CONFIG_BIN}"   ] && ohm-exc-undefined $0 R20_OHM_CONFIG_BIN

mkdir -p ${R20_OHM_CONFIG_BIN}
_export PATH    ${PATH}:${R20_OHM_CONFIG_BIN}


export ZDOTDIR=${OHM}
export PATH=${PATH}:${HOME}/.local/bin

#echo -- zprofile
