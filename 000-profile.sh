function profile.main { profile.firstrun }
function profile.firstrun {
    .firstrun || return
    .export BORG_LOCAL      ~/.local/borg
    .export BORG_VENDOR     ${ZDOTDIR}/vendor
    .export BORG_VENV       ${BORG_LOCAL}/VENV
    .export PATH            $PATH:$BORG_VENV/bin
    .export PYTHONPATH      $ZDOTDIR/lib/python
}

profile.main
