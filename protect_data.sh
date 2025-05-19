#!/bin/bash

results_file="results.csv"
# Name of the file we will secure

if [[ ! -f $results_file ]]; then
    echo "Error: '$results_file' does not exist"
    exit 1
fi
# If the file does not exist, we print a message and stop.

read -p "Do you want to secure the results file? yes/no: " answer
# We ask the user if he wants to secure the file.

if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
# If he says yes or y
    chmod 600 "$results_file"
# We give the file read and write permissions only to the file owner
    umask 077
# We set the umask so that any new files are automatically secured (read & write only for the owner)
    echo "File Secured"
# We print a confirmation message
    ls -l "$results_file"
# We show the file permissions after securing
else
    echo "Action Cancelled"
# If the user declines, we print a cancellation message.
fi
