#!/bin/zsh
source ${ZDOTDIR}/functions

bh0export __BH0__           ${ZDOTDIR}

bh0export __BH0_ACC__       ${HOME}/.bh0.acc
bh0export __BH0_RAW__       ${HOME}/.bh0.raw
bh0export __BH0_LOCAL__     ${HOME}/.bh0.local
bh0export __BH0_HTTP__      ${HOME}/.bh0.http

bh0export __BH0_URL_GH__    https://github.com
bh0export __BH0_DST_GH__    ${__BH0_HTTP__}/github.com
bh0export __BH0_URL_BH__    ${__BH0_URL_GH__}/bryanhann
bh0export __BH0_DST_BH__    ${__BH0_DST_GH__}/bryanhann

mkdir -p ${__BH0_ACC__}
mkdir -p ${__BH0_RAW__}
mkdir -p ${__BH0_LOCAL__}
mkdir -p ${__BH0_HTTP__}

cp ${ZDOTDIR}/readme.acc    ${__BH0_ACC__}
cp ${ZDOTDIR}/readme.raw    ${__BH0_RAW__}
cp ${ZDOTDIR}/readme.local  ${__BH0_LOCAL__}
cp ${ZDOTDIR}/readme.http   ${__BH0_HTTP__}

bh0include bh0.__main__
bh0installvim
bh0firstrun && bh0endfirstrun

