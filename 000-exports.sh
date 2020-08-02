.export BORG        $ZDOTDIR
.export BUILD       ~/.build
.export BorgTEMP    $BUILD/BorgTEMP
.export BorgBIN     $BUILD/BorgBIN
.export BorgVENV    $BUILD/BorgVENV

.export PATH        $PATH:$BorgBIN
.export ZSH         $BUILD/ZSH
.export PYTHONPATH  $BORG/lib/python
.export WORKON_HOME                 $BUILD/WORKON_HOME
.export PROJECT_HOME                $BUILD/PROJECT_HOME
.export VIRTUALENVWRAPPER_HOOK_DIR  $BUILD/VIRTUALENVWRAPPER_HOOK_DIR

.export HISTSIZE    5000            # How many lines of history to keep in memory
.export HISTFILE    $BUILD/HISTFILE # Where to save history to disk
.export SAVEHIST    5000            # Number of history entries to save to disk
.export HISTDUP     erase           # Erase duplicates in the history file
.exec setopt appendhistory          # Append history to the history file (no overwriting)
.exec setopt sharehistory           # Share history across terminals
.exec setopt incappendhistory       # Immediately


mkdir -p $BorgTEMP
mkdir -p $BorgBIN
