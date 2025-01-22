#!/bin/bash

# This script demonstrates a race condition bug.
# It uses two processes to concurrently update a counter in a file.

counter_file="counter.txt"
touch "$counter_file"

# Function to increment the counter
increment_counter() {
  local current_count=$(cat "$counter_file")
  local new_count=$((current_count + 1))
  echo "$new_count" > "$counter_file"
}

# Create two processes to increment the counter
for i in {1..2}; do
  increment_counter &
done

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $(cat "$counter_file")"
