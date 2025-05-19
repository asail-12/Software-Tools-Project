#!/bin/bash

results_file="results.csv"

if [[ ! -f $results_file ]]; then
  echo "No results available. Please run prediction first."
  exit 1
fi

while true; do
  echo ""
  echo "===== Advisor Panel ====="
  echo "1. View all student results"
  echo "2. View major distribution"
  echo "3. View top 3 most selected majors"
  echo "4. View number of students per date"
  echo "5. Exit"
  read -p "Enter your choice (1-5): " choice

  case $choice in
    1)
      column -s, -t < "$results_file"
      ;;
    2)
      cut -d',' -f3 "$results_file" | sort | uniq -c | sort -nr
      ;;
    3)
      cut -d',' -f3 "$results_file" | sort | uniq -c | sort -nr | head -n 3
      ;;
    4)
      cut -d',' -f2 "$results_file" | sort | uniq -c | sort -nr
      ;;
    5)
      echo "Exiting Advisor Panel."
      break
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done
