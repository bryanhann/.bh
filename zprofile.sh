#echo ++ zprofile

#----------------------------------------------------------------------
# SET PATH
#----------------------------------------------------------------------

export PATH=${PATH}:$(dirname $(grealpath $0))/sbin
export PATH=${PATH}:${HOME}/.local/bin

#----------------------------------------------------------------------
# SET ZDOTDIR
#
# When zsh is invoked it tries to source an rcfile named [.zshrc]. By
# default zsh expects this file to be in the folder [~]. We override
# this default by setting the environment variable [$ZDOTDIR], which
# causes zsh to look for the file in the directory [$ZDOTDIR] instead.
#----------------------------------------------------------------------

export ZDOTDIR=$(dirname $(grealpath ${0}))

#----------------------------------------------------------------------
# SET OHM_ROOT
# SOURCE OHM/ACTIVATE => SET OHM_BUILD
#
# We assume the existence of file [~/.config/ohm/activate.sh]
# and attempt to source it. The file expects [$OHM_ROOT] to be
# set, and it will set [$OHM_BUILD]. Since the file is not under
# our control we will test whether sourcing it sets it.
#----------------------------------------------------------------------

export OHM_ROOT=$(dirname $(grealpath $0))
source ${HOME}/.config/ohm/activate.sh
[ -z "${OHM_BUILD}" ] && { echo $0: "\$OHM_BUILD: not set by $src"; }

#echo -- zprofile
