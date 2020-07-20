export dst=$R20/__BUILD__/VENV
if [ ! -d $dst ];
    then
        python3 -m venv $dst
        source $dst/bin/activate
        pip install --upgrade pip
        r20pip_install virtualenv
        r20pip_install virtualenvwrapper
        deactivate
    else
fi
source $dst/bin/activate
source $dst/bin/virtualenvwrapper.sh
