history.main () { history.firstrun }
history.firstrun () {
    .firstrun || return
    .export HISTFILE                    $(_LOCAL_)/HISTFILE
    .export HISTSIZE    5000            # How many lines of history to keep in memory
    .export SAVEHIST    5000            # Number of history entries to save to disk
    .export HISTDUP     erase           # Erase duplicates in the history file
    .exec setopt appendhistory          # Append history to the history file (no overwriting)
    .exec setopt sharehistory           # Share history across terminals
    .exec setopt incappendhistory       # Immediately
}

history.main
