echo "Your dotfiles will be clobbered. Continue? [y/N] \c "; read X
{ [ "$X" == "y" ] || [ "$X" == "Y" ]; } || exit;

HERE=$(dirname $(grealpath $0))
SRC=https://github.com/bryanhann/bch.shell

[ -z "$1"   ] && DST=${HERE}/shell.repo || DST=$1
[ -d ${DST} ] && echo Already cloned $DST || git clone ${SRC} ${DST}

echo Clobbering dot files.

# The bash ~/.dotfiles must call their dot.files with
# the dot.file folder folder as a first argument. The
# zsh dotfiles do not need to do this.``
echo source ${DST}/dot.profile.sh  ${DST} > ~/.profile
echo source ${DST}/dot.bashrc.sh   ${DST} > ~/.bashrc
echo source ${DST}/dot.zprofile.sh          > ~/.zprofile

