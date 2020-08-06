function venv.main {
    venv.firstrun;
}
function venv.firstrun {
    .firstrun || return
    .export VIRTUALENVWRAPPER_PYTHON    $(_VENV_)/bin/python
    .export VIRTUALENVWRAPPER_HOOK_DIR  $(_LOCAL_)/VIRTUALENVWRAPPER_HOOK_DIR
    .export WORKON_HOME                 $(_LOCAL_)/WORKON_HOME
    .export PROJECT_HOME                $(_LOCAL_)/PROJECT_HOME
    .exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
    .exec venv.install
}
function venv.install {
    venv.is_installed && return
    .exec python3 -m venv $(_VENV_);
    venv.is_installed
    venv.config
}
function venv.remove { .note removing venv; rm -rf $(_VENV_); }
function venv.activate { .exec source $(_VENV_)/bin/activate; }
function venv.deactivate { .exec deactivate; }

function venv.config {
    .exec venv.activate
    .exec pip install --upgrade pip
    .exec pip install virtualenv
    .exec pip install virtualenvwrapper
    .source $(_HOME_)/venv.post-config.sh
    .exec venv.deactivate
}
function venv.is_installed {
    [[ -d $(_VENV_) ]] && { .note venv is installed && return 0 }
    [[ -d $(_VENV_) ]] || { .note venv is not installed && return 1 }
}

venv.main


