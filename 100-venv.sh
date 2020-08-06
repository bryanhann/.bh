function venv.main {
    venv.firstrun;
}
function venv.firstrun {
    .firstrun || return
    .export VIRTUALENVWRAPPER_HOOK_DIR  ${BORG_LOCAL}/VIRTUALENVWRAPPER_HOOK_DIR
    .export VIRTUALENVWRAPPER_PYTHON    ${BORG_VENV}/bin/python
    .export WORKON_HOME                 ${BORG_LOCAL}/WORKON_HOME
    .export PROJECT_HOME                ${BORG_LOCAL}/PROJECT_HOME
    .exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
    .exec venv.install
}
function venv.install {
    venv.is_installed && return
    .exec python3 -m venv $BORG_VENV;
    venv.is_installed
    venv.config
}
function venv.remove { .note removing venv; rm -rf $BORG_VENV; }
function venv.activate { .exec source $BORG_VENV/bin/activate; }
function venv.deactivate { .exec deactivate; }

function venv.config {
    .exec venv.activate
    .exec pip install --upgrade pip
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .source $ZDOTDIR/venv.post-config.sh
    .exec venv.deactivate
}
function venv.is_installed {
    [[ -d $BORG_VENV ]] && { .note venv is installed && return 0 }
    [[ -d $BORG_VENV ]] || { .note venv is not installed && return 1 }
}

venv.main


