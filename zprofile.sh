#echo ++ zprofile
source $(dirname $(grealpath ${0}))/init.sh
source ${HERE}/env/XDG.sh
source ${HERE}/env/pip.sh

export ZDOTDIR=${HERE}
export ZDOTBLD=${XDG_X_BUILD}/bhzsh
export PATH=${PATH}:${HOME}/.local/bin

#echo -- zprofile

