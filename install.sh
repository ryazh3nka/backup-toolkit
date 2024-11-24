#!/bin/bash

read -p "do you want to install or deinstall the script? (i/D) " id
if [ "${id,,}" = "i" ]; then
    printf "This will create a configuration file at ~/.config/backup-toolkit and copy the script to ~/usr/local/bin.\nDo you want this? (y/N) "
    read create_config
    if [ "${create_config,,}" = "y" ]; then
        mkdir -p ~/.config/backup-toolkit
        chmod +x ./backup-toolkit
        if [ -f "./backup-tkit.config" ]; then
            cp ./backup-tkit.config ~/.config/backup-toolkit
        else
            echo "err: backup-tkit.config file not found."
            exit 1
        fi
        sudo cp ./backup-toolkit /usr/local/bin
        echo "finished!"
    else
        echo "aborting..."
    fi
else  
    sudo rm -rf /usr/local/bin/backup-toolkit
    sudo rm -rf ~/.config/backup-toolkit
fi