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

r20install  dunders #-r
r20install  venv #-r
r20install  bch
r20install  zjot
r20install  omzsh
r20install  libre
r20install  vwrap #-r
r20install  ws852
_r20_exit
#_colors
