function venv.configure {
    .exec pip install --upgrade pip
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .exec pip install cat-in-a-box
}

function omzsh.configure {
    .export ZSH_THEME kafeitu # plugins must not contain virtualenv for prompt to show virtual_env)
    plugins=(git virtualenvwrapper)
}

function main () {
    .call profile
    .call venv
    .call omzsh
    .source ${ZDOTDIR}/history.sh
    [[ -z "$BHPID" ]] && .export BHPID $$
}

function profile () {
    [[ -z "$BORG" ]] || return
    .export BORG $ZDOTDIR
    .export BORG_LOCAL      ~/.local/borg
    .export BORG_VENV       ${BORG_LOCAL}/VENV
    .export PATH            $PATH:$BORG_VENV/bin
    .export PYTHONPATH      $ZDOTDIR/lib/python
    .export VIRTUALENVWRAPPER_HOOK_DIR  ${BORG_LOCAL}/VIRTUALENVWRAPPER_HOOK_DIR
    .export VIRTUALENVWRAPPER_PYTHON    ${BORG_VENV}/bin/python
    .export WORKON_HOME                 ${BORG_LOCAL}/WORKON_HOME
    .export PROJECT_HOME                ${BORG_LOCAL}/PROJECT_HOME
    .exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
    .export ZSH ${BORG_LOCAL}/ZSH
}

function venv { venv.install; venv.activate; venv.configure; venv.deactivate; }
function venv.install { .note installing venv; .exec python3 -m venv $BORG_VENV; }
function venv.remove { .note removing venv; rm -rf $BORG_VENV; }
function venv.activate { .exec source $BORG_VENV/bin/activate; }
function venv.deactivate { .exec deactivate; }

function omzsh { omzsh.install; omzsh.configure; omzsh.activate; }
function omzsh.install { $BORG/vendor/omzsh/install.sh --unattended; }
function omzsh.remove { .note removing omzsh; rm -rf $ZSH; }
function omzsh.activate { .source $ZSH/oh-my-zsh.sh }

source $ZDOTDIR/functions.sh

.call main
