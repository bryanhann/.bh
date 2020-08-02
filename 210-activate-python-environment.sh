.export WORKON_HOME                 $BORGBUILD/WORKON_HOME
.export PROJECT_HOME                $BORGBUILD/PROJECT_HOME
.export VIRTUALENVWRAPPER_HOOK_DIR  $BORGBUILD/VIRTUALENVWRAPPER_HOOK_DIR

.note the next line is redundant if omzsh is using plugin \'virtualenvwrapper\'
.source virtualenvwrapper.sh
