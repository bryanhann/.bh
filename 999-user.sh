function bh1user { echo ~/.bh.user }
[[ -f $( bh1user )/activate-here.sh ]] && {
    cd $(bh1user)
    bh0source $(bh1user)/activate-here.sh
}
