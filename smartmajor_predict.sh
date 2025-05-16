#!/bin/bash

dataset="Interests_Dataset.csv"
results_file="results.csv"

if [ ! -f "$dataset" ]; then
  echo "Dataset $dataset not found!"
  exit 1
fi

echo "Enter your full name:"
read name

first_line=$(head -n 1 "$dataset")
IFS=',' read -r -a all_columns <<< "$first_line"
interests=("${all_columns[@]:1}")

answers=()
echo "Please answer with yes or no:"
for interest in "${interests[@]}"; do
  echo -n "Are you interested in \"$interest\"? "
  read response
  if [[ "$response" == "yes" || "$response" == "y" ]]; then
    answers+=(1)
  elif [[ "$response" == "no" || "$response" == "n" ]]; then
    answers+=(0)
  else
    answers+=(0)
  fi
done

best_major=""
max_score=0

while IFS=',' read -r -a row_array; do
  if [[ "${row_array[0]}" == "major" ]]; then
    continue
  fi

  score=0
  for ((i=1; i<${#row_array[@]}; i++)); do
    if [[ "${answers[i-1]}" -eq 1 && "${row_array[i]}" -eq 1 ]]; then
      ((score++))
    fi
  done

  if (( score > max_score )); then
    max_score=$score
    best_major="${row_array[0]}"
  fi
done < "$dataset"

echo ""
echo "The most suitable major for $name is: $best_major"
echo "$name,$(date +%F),$best_major" >> "$results_file"
