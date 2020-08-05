source $ZDOTDIR/functions.sh

#======================================================================
#  MAIN
#======================================================================
function main () {
    .call profile
    .call venv
    .call omzsh
    .source ${ZDOTDIR}/history.sh
}

#======================================================================
#  PROFILE
#======================================================================
profile () {
    [[ -z "$BORG" ]] || return
    .export BORG $ZDOTDIR
    .export BORG_LOCAL      ~/.local/borg
    .export BORG_VENV       ${BORG_LOCAL}/VENV
    .export PATH            $PATH:$BORG_VENV/bin
    .export PYTHONPATH      $ZDOTDIR/lib/python
}

#======================================================================
#  VENV
#======================================================================
function venv.install       { .note installing venv; .exec python3 -m venv $BORG_VENV; }
function venv.remove        { .note removing venv; rm -rf $BORG_VENV; }
function venv.activate      { .exec source $BORG_VENV/bin/activate }
function venv.configure     { .source $ZDOTDIR/venv.config.sh }
function venv.deactivate    { .exec deactivate }
function venv.prepare       {
    .export WORKON_HOME                 ${BORG_LOCAL}/WORKON_HOME
    .export PROJECT_HOME                ${BORG_LOCAL}/PROJECT_HOME
    .export VIRTUALENVWRAPPER_HOOK_DIR  ${BORG_LOCAL}/VIRTUALENVWRAPPER_HOOK_DIR
    .export VIRTUALENVWRAPPER_PYTHON    ${BORG_VENV}/bin/python
    .exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
}
function venv () {
    venv.prepare
    venv.install        # .exec python3 -m venv $BORG_VENV;
    venv.activate       #.exec source $BORG_VENV/bin/activate
    venv.configure      #.source $ZDOTDIR/venv.update.sh
    venv.deactivate     #.exec deactivate
}

#======================================================================
#  OMZSH
#======================================================================
function omzsh.install  { $BORG/vendor/omzsh/install.sh --unattended; }
function omzsh.remove   { .note removing omzsh; rm -rf $ZSH; }
function omzsh.activate { .source $ZSH/oh-my-zsh.sh }
function omzsh.configure   { .source $ZDOTDIR/omzsh.config.sh }
function omzsh.prepare  {
    .export ZSH ${BORG_LOCAL}/ZSH
}
function omzsh () {
    omzsh.prepare
    omzsh.install
    omzsh.configure
    omzsh.activate
}


.call main
