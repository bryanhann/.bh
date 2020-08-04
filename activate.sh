# Assume this directory is $ZDOTDIR

cd $ZDOTDIR
source functions.sh

[[ -z "$BORG" ]] && {
    .export BORG $ZDOTDIR

    .export BORG_VENV                   ~/.local/borg/VENV
    .export ZSH                         ~/.local/borg/ZSH
    .export BORG_REPOS                  ~/.local/borg/BORG_REPOS
    .export WORKON_HOME                 ~/.local/borg/WORKON_HOME
    .export PROJECT_HOME                ~/.local/borg/PROJECT_HOME
    .export VIRTUALENVWRAPPER_HOOK_DIR  ~/.local/borg/VIRTUALENVWRAPPER_HOOK_DIR
    .export HISTFILE                    ~/.local/borg/HISTFILE

    mkdir -p $WORKON_HOME
    mkdir -p $PROJECT_HOME
    mkdir -p $BORG_REPOS

    .export PATH            $PATH:$BORG_VENV/bin
    .export PYTHONPATH      $BORG/lib/python

    .export HISTSIZE    5000            # How many lines of history to keep in memory
    .export SAVEHIST    5000            # Number of history entries to save to disk
    .export HISTDUP     erase           # Erase duplicates in the history file
    .exec setopt appendhistory          # Append history to the history file (no overwriting)
    .exec setopt sharehistory           # Share history across terminals
    .exec setopt incappendhistory       # Immediately
}

#======================================================================
# Install the VENV if missing
#======================================================================

    [[ -d $BORG_VENV ]] || {
        .note installing python
        .exec python3 -m venv $BORG_VENV
        .source $BORG_VENV/bin/activate
        .exec pip install virtualenv
        .exec pip install virtualenvwrapper
        .exec deactivate
    }

#======================================================================
# Activate the virtualenvwrapper
#======================================================================

    .source virtualenvwrapper.sh

#======================================================================
# Convenience functions to remove the VENV
#======================================================================

    function .remove.venv { rm -rf $BORG_VENV; }
    function .remove.omzsh () { rm -rf $ZSH; }

#======================================================================
# Install OMZSH if missing
#======================================================================

    [[ -d $ZSH ]] || {
        $BORG/vendor/omzsh/install.sh --unattended ;
    }

#======================================================================
# Functions to install/uninstall via git repositories
#======================================================================

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

# minimal : very good
# virtualenv_prompt_info
# git_prompt_info
# minimal fox  kiwi bira steef dallas kafeitu(nice)
# nanotech : wide, 2level
# suvash : very good
# essembeh gozilla sonicradish juanghurtado[!] wedisagree : rich git info
# jaischeema : pumpkin at ~/borg-dev ±(dev) ✗ ❯
# strug : origin/dev

.export ZSH_THEME kafeitu # plugins must not contain virtualenv for prompt to show virtual_env)
plugins=(git virtualenvwrapper)
.source $ZSH/oh-my-zsh.sh

#for script in $(ls [1-9]*.sh | sort); do .source $script; done;
