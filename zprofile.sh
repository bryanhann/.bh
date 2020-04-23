export    HERE=$(dirname $(grealpath $0))
source    ${HERE}/functions.sh
r20enter  $(basename $0)
r20export R20 $(dirname $(grealpath $0))
r20export R20_ZPROFILE_TMP /tmp/$$
r20export R20_ZPROFILE_BIN ${R20_ZPROFILE_TMP}/bin
r20export ZDOTDIR ${HERE}
r20export PATH ${HERE}/sbin:${PATH}
r20exit   $0
