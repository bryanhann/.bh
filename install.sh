source  ./config.sh

[[ "$1" == "--clean" ]]  && rm -rf $HOME/.local/__BCH__

for ARG in $* ; do
   XX=${HOME}/.local/__BCH__/${ARG}
   [ -d ${XX} ] &&  echo REMOVING: ${XX} && rm -rf ${XX}
done

DOTFILES_install
DUNDER_install
DUNDER_activate
VENV_install
VENV_activate
VWRAP_install
VWRAP_activate
ZSH_install
OMZSH_install

#source ${BCHCFG_DUNDERS_ACT}
__DOC__
#source ${BCHCFG_VENV_ACT}
python -c "import sys;print(sys.executable)"
