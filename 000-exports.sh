.export BORG            $ZDOTDIR
.export BORG_BUILD      ${HOME}/.build
.export BORG_TEMP       $BORG_BUILD/TEMP
.export BORG_BIN        $BORG_BUILD/BIN
.export BORG_VENV       $BORG_BUILD/VENV
.export BORG_REPOS      $BORG_BUILD/REPOS
.export WORKON_HOME     $BORG_BUILD/WORKON_HOME
.export PROJECT_HOME    $BORG_BUILD/PROJECT_HOME
.export ZSH             $BORG_BUILD/ZSH
.export PATH            $BORG/sbin:$PATH:$BORG_BIN
.export PYTHONPATH      $BORG/lib/python
.export VIRTUALENVWRAPPER_HOOK_DIR  ${HOME}/.local/borg/VIRTUALENVWRAPPER_HOOK_DIR

mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME
rm -rf   $BORG_BIN
mkdir -p $BORG_BIN

.export HISTSIZE    5000            # How many lines of history to keep in memory
.export HISTFILE    $BUILD/HISTFILE # Where to save history to disk
.export SAVEHIST    5000            # Number of history entries to save to disk
.export HISTDUP     erase           # Erase duplicates in the history file
.exec setopt appendhistory          # Append history to the history file (no overwriting)
.exec setopt sharehistory           # Share history across terminals
.exec setopt incappendhistory       # Immediately

