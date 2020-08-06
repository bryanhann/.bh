function venv_main {
    venv_firstrun;
}
function venv_firstrun {
    bh0firstrun || return
    bh0export VIRTUALENVWRAPPER_PYTHON    $(_VENV_)/bin/python
    bh0export VIRTUALENVWRAPPER_HOOK_DIR  $(_LOCAL_)/VIRTUALENVWRAPPER_HOOK_DIR
    bh0export WORKON_HOME                 $(_LOCAL_)/WORKON_HOME
    bh0export PROJECT_HOME                $(_LOCAL_)/PROJECT_HOME
    bh0exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
    bh0exec venv_install
}
function venv_install {
    venv_is_installed && return
    bh0exec python3 -m venv $(_VENV_);
    venv_is_installed
    venv_config
}
function venv_remove { bh0note removing venv; rm -rf $(_VENV_); }
function venv_activate { bh0exec source $(_VENV_)/bin/activate; }
function venv_deactivate { bh0exec deactivate; }

function venv_config {
    bh0exec venv_activate
    bh0exec pip install --upgrade pip
    bh0exec pip install virtualenv
    bh0exec pip install virtualenvwrapper
    bh0source $(_HOME_)/venv.post-config.sh
    bh0exec venv_deactivate
}
function venv_is_installed {
    [[ -d $(_VENV_) ]] && { bh0note venv is installed && return 0 }
    [[ -d $(_VENV_) ]] || { bh0note venv is not installed && return 1 }
}

venv_main


