function omzsh_firstrun {
    bh0firstrun || return
    bh0export ZSH $(_LOCAL_)/ZSH
    omzsh_install
 }

function omzsh_main {
    bh0source $(_HOME_)/omzsh.user.activate.sh
}

function omzsh__install { $(_VENDOR_)/omzsh/install.sh --unattended; }
function omzsh_install { omzsh_is_installed || {omzsh__install; omzsh_is_installed } }
function omzsh_remove { bh0note removing omzsh; rm -rf $ZSH; }

function omzsh_is_installed {
    [[ -d $ZSH ]] && { bh0note omzsh is installed && return 0 }
    [[ -d $ZSH ]] || { bh0note omzsh is not installed && return 1 }
}

omzsh_firstrun
omzsh_main
