_export dst $ZDOTBLD/venv

if [ ! -d $dst ]; then
    python3 -m venv $dst
    source $dst/bin/activate
    pip install --upgrade pip
fi

source $dst/bin/activate

