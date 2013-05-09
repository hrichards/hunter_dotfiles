# First, set your python version. I assume python2.7 in this example.
PYTHONVER=2.7
PYTHON=python${PYTHONVER}

# Update $HOME/.bashrc with appropriate environment variables
export PATH="$HOME/bin:$PATH"
export TEMP="$HOME/tmp"
alias python=${PYTHON}
export PYTHON=${PYTHON}
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_TMPDIR="$WORKON_HOME/tmp"
export VIRTUALENVWRAPPER_PYTHON=`which python`
source virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true 
