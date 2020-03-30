#echo ++ zshrc.sh $0
#---------------------------------------------------------------------------
source ${ZDOTDIR}/tools/bhz.sh
source ${ZDOTDIR}/tools/r20.sh

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
