function omzsh.main { omzsh.firstrun; omzsh.install; omzsh.configure; omzsh.activate; }
function omzsh.install { ${BORG_VENDOR}/omzsh/install.sh --unattended; }
function omzsh.remove { .note removing omzsh; rm -rf $ZSH; }
function omzsh.activate { .source $ZSH/oh-my-zsh.sh }
function omzsh.firstrun {
    .firstrun || return
    .export ZSH ${BORG_LOCAL}/ZSH
}
function omzsh.configure {
    .export ZSH_THEME kafeitu # plugins must not contain virtualenv for prompt to show virtual_env)
    plugins=(git virtualenvwrapper)
}

omzsh.main
