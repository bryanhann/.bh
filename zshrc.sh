#echo ++ zshrc.sh $0
#---------------------------------------------------------------------------
_export () {export ${1}=${2};}
bhz_export () {export ${1}=${2};}
bhz_install () { source ${ZDOTDIR}/plugins/${1}/install.sh; }
#---------------------------------------------------------------------------
bhz_install dunders
bhz_install venv
bhz_install vwrap
bhz_install misc
bhz_install zjot
#---------------------------------------------------------------------------
bhz_export ZSH_THEME   gnzh
plugins=(git)
#---------------------------------------------------------------------------
bhz_install omzsh
#---------------------------------------------------------------------------
#echo -- zshrc.sh
