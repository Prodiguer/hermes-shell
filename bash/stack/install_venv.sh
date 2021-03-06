#!/bin/bash

# Import utils.
source $HERMES_HOME/bash/utils.sh

# Main entry point.
main()
{
    log "Installing system dependencies"
    yum install gcc libffi-devel python-devel openssl-devel

    log "Installing virtual environment: "$HERMES_DIR_VENV

    # Set paths.
    export PATH=$HERMES_DIR_PYTHON/bin:$PATH
    export PYTHONPATH=$HERMES_DIR_PYTHON/bin:$PYTHONPATH

    # Upgrade pip/virtualenv.
    pip install --upgrade pip
    pip install --upgrade virtualenv

    # Create venv.
    rm -rf $HERMES_DIR_VENV
    mkdir -p $HERMES_DIR_VENV
    virtualenv -q $HERMES_DIR_VENV

    # Activate venv.
    source $HERMES_DIR_VENV/bin/activate

    # Install dependencies.
    pip install -r $HERMES_VENV_REQUIREMENTS

    # Clean up.
    deactivate
}

# Invoke entry point.
main
