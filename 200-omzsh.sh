function omzsh.firstrun {
    bh0firstrun || return
    bh0export ZSH $(_LOCAL_)/ZSH
    omzsh.install
 }

function omzsh.main {
    bh0source $(_HOME_)/omzsh.user.activate.sh
}

function omzsh._install { $(_VENDOR_)/omzsh/install.sh --unattended; }
function omzsh.install { omzsh.is_installed || {omzsh._install; omzsh.is_installed } }
function omzsh.remove { bh0note removing omzsh; rm -rf $ZSH; }

function omzsh.is_installed {
    [[ -d $ZSH ]] && { bh0note omzsh is installed && return 0 }
    [[ -d $ZSH ]] || { bh0note omzsh is not installed && return 1 }
}

omzsh.firstrun
omzsh.main
