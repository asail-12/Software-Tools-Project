#!/bin/bash
# script runs the Advisor Panel for viewing student result statistics

results_file="results.csv"
# Set the name of the results file

if [[ ! -f $results_file ]]; then
  # Check if the results file does not exist
  echo "No results available. Please run prediction first."
  exit 1
  # Exit the script if file is missing
fi

while true; do
  # Infinite loop to keep showing the menu until the user exits
  echo ""
  echo "===== Advisor Panel ====="
  echo "1. View all student results"
  echo "2. View major distribution"
  echo "3. View top 3 most selected majors"
  echo "4. View number of students per date"
  echo "5. Exit"
  read -p "Enter your choice (1-5): " choice
  # Display menu and read user input

  case $choice in
    1)
      # Option 1: Show the full results table with aligned columns
      column -s, -t < "$results_file"
      ;;
    2)
      # Option 2: Show how many students selected each major
      cut -d',' -f3 "$results_file" | sort | uniq -c | sort -nr
      ;;
    3)
      # Option 3: Show the top 3 most frequently selected majors
      cut -d',' -f3 "$results_file" | sort | uniq -c | sort -nr | head -n 3
      ;;
    4)
      # Option 4: Show the number of students for each date
      cut -d',' -f2 "$results_file" | sort | uniq -c | sort -nr
      ;;
    5)
      # Option 5: Exit the loop and close the panel
      echo "Exiting Advisor Panel."
      break
      ;;
    *)
      # Handle invalid menu choices
      echo "Invalid choice."
      ;;
  esac
done
