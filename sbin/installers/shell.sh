SRC=https://github.com/bryanhann/bch.shell
DST=${HOME}/.local/bch/shell
[ -d ${DST} ] || git clone ${SRC} ${DST}
echo Clobbering dot files.
# The bash ~/.dotfiles must call their dot.files with
# the dot.file folder folder as a first argument. The
# zsh dotfiles do not need to do this.``
echo source ${DST}/dot.profile.sh  ${DST} > ~/.profile
echo source ${DST}/dot.bashrc.sh   ${DST} > ~/.bashrc
echo source ${DST}/dot.zprofile.sh          > ~/.zprofile

