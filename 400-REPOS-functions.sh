
function .REPOS.install {
    for url in $*; do true; done
    dst=$BORG_REPOS/$url
    [[ "$1" == "_r" ]] && { shift ; rm -rf ${dst}; }
    [[ -d $dst ]] || git clone $* ${dst}
    $dst/borg/install.sh
}

function .REPOS.uninstall {
    for url in $*; do true; done
    dst=$BORG_REPOS/$url
    [[ -d $dst ]] && rm -rf ${dst}
}

