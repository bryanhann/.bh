
function main () {
pushd $ZDOTDIR
for script in $( ls [0-9]*.sh | sort ); do .source ${ZDOTDIR}/$script; done
#    .source ${ZDOTDIR}/000-profile.sh
#    .source ${ZDOTDIR}/100-venv.sh
#    .source ${ZDOTDIR}/200-omzsh.sh
#    .source ${ZDOTDIR}/300-history.sh
}








