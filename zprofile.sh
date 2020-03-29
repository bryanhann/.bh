#echo ++ zprofile

_export () {export ${1}=${2};}

_export HERE                $(dirname $(grealpath ${0}))
_export ZDOTDIR             ${HERE}
_export ZDOTBLD             ~/.local/bhzsh
_export XDG_CONFIG_HOME     ${HOME}/.config
_export XDG_CACHE_HOME      ${HOME}/.cache
_export PIP_DOWNLOAD_CACHE  ${HOME}/.cache/pip
_export PATH                ${PATH}:~/.local/bin

#echo -- zprofile

