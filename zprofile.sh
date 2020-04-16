#echo ++ zprofile

_export () {export ${1}=${2};}

_export HERE                $(dirname $(grealpath ${0}))
_export XDG_DATA_HOME       ${HOME}/.local/share
_export XDG_DATA_DIRS       /usr/local/share/:/usr/share/
_export XDG_CONFIG_HOME     ${HOME}/.config
_export XDG_CONFIG_DIRS     ${HOME}/.local./etc/xdg:/etc/xdg
_export XDG_CACHE_HOME      ${HOME}/.cache
_export XDG_RUNTIME_DIR     ${HOME}/.0700
_export XDG_X_ACC           ${HOME}/.acc
_export XDG_X_BUILD         ${HOME}/.build
_export PIP_DOWNLOAD_CACHE  ${XDG_CACHE_HOME}/pip
_export PATH                ${PATH}:${HOME}/.local/bin
_export ZDOTDIR             ${HERE}

#--------------------------------------------------
# ACTIVATE OHM
#--------------------------------------------------

# this is the activation file:
_export src ${HOME}/.config/ohm/activate.sh

# seting OHM_ROOT is precondition.
_export OHM_ROOT  ${HERE}

# activate
source ${src}

# postcondition
[ -z "${OHM_BUILD}" ] && { echo $0: "\$OHM_BUILD: not set by $src"; }

#_export ZDOTBLD             ${OHM_BUILD}

#echo -- zprofile



