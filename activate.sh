source $ZDOTDIR/functions.sh

#======================================================================
#  MAIN
#======================================================================
function main () {
    .call   profile
    .call   venv
    .source virtualenvwrapper.sh
    .call   omzsh
}

#======================================================================
#  MAIN
#======================================================================
profile () {
    [[ -z "$BORG" ]] || return
    .export BORG $ZDOTDIR
    .export BORG_VENV                   ~/.local/borg/VENV
    .export ZSH                         ~/.local/borg/ZSH
    .export BORG_REPOS                  ~/.local/borg/BORG_REPOS
    .export WORKON_HOME                 ~/.local/borg/WORKON_HOME
    .export PROJECT_HOME                ~/.local/borg/PROJECT_HOME
    .export VIRTUALENVWRAPPER_HOOK_DIR  ~/.local/borg/VIRTUALENVWRAPPER_HOOK_DIR
    .export VIRTUALENVWRAPPER_PYTHON    ${BORG_VENV}/bin/python
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
#  VENV
#======================================================================
function venv () {
    [[ -d $BORG_VENV ]] || venv.install
}
function venv.remove { rm -rf $BORG_VENV; }
function venv.install () {
        .note installing python
        .exec python3 -m venv $BORG_VENV
        .source $BORG_VENV/bin/activate
        .exec pip install virtualenv
        .exec pip install virtualenvwrapper
        .exec deactivate
}

#======================================================================
#  OMZSH
#======================================================================
function omzsh () {
    [[ -d $ZSH ]] || omzsh.install
    .export ZSH_THEME kafeitu # plugins must not contain virtualenv for prompt to show virtual_env)
    plugins=(git virtualenvwrapper)
    .source $ZSH/oh-my-zsh.sh
}
function omzsh.remove   () { rm -rf $ZSH; }
function omzsh.install  () { $BORG/vendor/omzsh/install.sh --unattended; }


.call main
