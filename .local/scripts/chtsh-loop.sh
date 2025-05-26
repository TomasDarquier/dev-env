#!/usr/bin/env bash

while true; do
    # Clear line and write the prefix
    printf "\ncurl cht.sh/"
    # Read user input after the prefix
    read -e -r input
    # Exit on special keyword
    [[ "$input" == "exit" || "$input" == "q" ]] && break
    # Fetch result
    curl "cht.sh/$input"
done

