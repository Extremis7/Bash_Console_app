#!/bin/bash

# The testing environment as we go!
source ./Scripts/System/Scan_Preparation/machine_1.sh

# borrowing from machine_1.sh during testing ---------------
# Directory where the server files will be located. This will be the top level directory for the server.
    SERVER_DIR="server_directory"
    mkdir -p "$SERVER_DIR"
    cd "$SERVER_DIR"
    echo "Tester now in $SERVER_DIR at start of the script. $PWD"

# -----------------------------------------------------------


# create_python_server_script