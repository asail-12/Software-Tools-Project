#!/bin/bash

result_file="result.csv"
# Name of the results file we are searching in

if [[ ! -f $result_file ]]; then
    echo "Results file not found "
    exit 1
fi
# If the file does not exist, we print a message and stop the script.

echo "--- Search Tool ---"
echo "1. Search by student name"
echo "2. Search by predicted major"
echo "3. Search by date (YYYY-MM-DD)"
#Show search options to the user

read -p "Enter your choice 1/2/3 : " option
# We ask the user to choose the type of search.

case $option in
    1) read -p "Enter student name: " name       
    # If he chooses 1, he will be asked for the student's name. 
       grep -i "$name" "$result_file";;                                                                                         #Search for the name within the file, ignoring capital or lowercase letters.
