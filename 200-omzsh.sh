function omzsh.firstrun {
    .firstrun || return
    .export ZSH ${BORG_LOCAL}/ZSH
     omzsh.install
 }

function omzsh.main {
    source $ZDOTDIR/omzsh.user.activate.sh
}

function omzsh._install { ${BORG_VENDOR}/omzsh/install.sh --unattended; }
function omzsh.install { omzsh.is_installed || {omzsh._install; omzsh.is_installed } }
function omzsh.remove { .note removing omzsh; rm -rf $ZSH; }

function omzsh.is_installed {
    [[ -d $ZSH ]] && { .note omzsh is installed && return 0 }
    [[ -d $ZSH ]] || { .note omzsh is not installed && return 1 }
}

omzsh.firstrun
omzsh.main
