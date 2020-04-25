source      $(dirname $(grealpath $0))/functions.sh
r20enter    $(basename $0)
r20export R20_INIT_CFG ${HOME}/.config/r20
r20export R20_INIT_BLD ${R20}/.B
r20export R20_INIT_URL https://github.com/bryanhann

r20.assert-env-vars.sh  R20_ZPROFILE_TMP R20_ZPROFILE_BIN
#source   ${HOME}/.config/r20/activate.sh
r20.assert-env-vars.sh  R20_INIT_BLD R20_INIT_URL R20_INIT_CFG
r20install  dunders #-r
r20install  venv #-r
r20install  bch
r20install  zjot
r20install  omzsh
r20install  libre
r20install  vwrap #-r
r20install  bch.ws852
r20exit
