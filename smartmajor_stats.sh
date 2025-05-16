#!/bin/bash

# Set the name of the results file
results_file="results.csv"

# Check if the file exists
if [[ ! -f $results_file ]]; then
  echo "No results found. Please run the prediction script first"  # Show message if the file is missing
else
  # Show the menu to the user
  echo "View and Statistics Menu"
  echo "1. View all student results"
  echo "2. View statistics summary"

  # Ask the user to enter a choice
  read -p "Enter your choice (1 or 2): " choice

  # If the user chooses 1, show all results
  if [[ "$choice" == "1" ]]; then
    echo "Student results:"
    cut -d',' -f1,2,3 "$results_file"  # Display name, ID, and major

  # If the user chooses 2, show summary statistics
  elif [[ "$choice" == "2" ]]; then
    total=$(wc -l < "$results_file")  # Count how many students (lines)
    echo "Total students: $total"
    echo "Major predictions"
    # Show how many students got each predicted major (from most to least)
    cut -d',' -f3 "$results_file" | sort | uniq -c | sort -nr

  # If the input is not 1 or 2
  else
    echo "Invalid choice. Please enter either 1 or 2"
  fi
fi
