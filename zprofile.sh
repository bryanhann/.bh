source                          $(dirname $(grealpath $0))/functions.sh
_r20_enter                      $(basename $0)
_r20_export PATH                $(dirname $(grealpath $0))/sbin:$PATH
_r20_export ZDOTDIR             $(dirname $(grealpath $0))
_r20_export R20                 $(dirname $(grealpath $0))
_r20_export R20_INIT_CFG        ${HOME}/.config/r20
_r20_export R20_INIT_BLD        ${R20}/.B
_r20_export R20_INIT_URL        https://github.com/bryanhann
_r20_export R20_ZPROFILE_TMP    /tmp/$$
_r20_export R20_ZPROFILE_BIN    ${R20_ZPROFILE_TMP}/bin
_r20_exit
