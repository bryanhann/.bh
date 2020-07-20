source      $(dirname $(grealpath $0))/functions.sh
_r20_enter  $(basename $0)
_r20_show   PATH
_r20_show   ZDOTDIR
_r20_show   R20
_r20_show   R20_INIT_CFG
_r20_show   R20_INIT_BLD
_r20_show   R20_INIT_URL
_r20_show   R20_ZPROFILE_TMP
_r20_show   R20_ZPROFILE_BIN
source $R20/modules/zjot/activate.sh
source $R20/modules/depth/activate.sh
source $R20/modules/venv/activate.sh
source $R20/modules/dunders/activate.sh
source $R20/modules/bch/activate.sh
source $R20/modules/ws852/activate.sh
source $R20/modules/omzsh/activate.sh
#r20install  omzsh
_r20_exit
#_colors
