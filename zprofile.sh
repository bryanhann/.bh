#echo ++ zprofile
_export ()          {export ${1}=${2};}
_export HERE        $(dirname $(grealpath ${0}))

source ${HERE}/env/XDG.sh
source ${HERE}/env/pip.sh

_export ZDOTDIR     ${HERE}
_export ZDOTBLD     ${XDG_X_BUILD}/bhzsh
_export PATH        ${PATH}:${HOME}/.local/bin
#echo -- zprofile

