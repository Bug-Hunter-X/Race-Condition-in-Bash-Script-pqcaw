#!/bin/bash

# This script demonstrates a solution to the race condition bug.
# It uses a lock file to prevent concurrent access to the counter file.

counter_file="counter.txt"
lock_file="counter.lock"
touch "$counter_file"

# Function to increment the counter
increment_counter() {
  # Acquire the lock
  flock "$lock_file"

  local current_count=$(cat "$counter_file")
  local new_count=$((current_count + 1))
  echo "$new_count" > "$counter_file"

  # Release the lock
  flock -u "$lock_file"
}

# Create two processes to increment the counter
for i in {1..2}; do
  increment_counter &
done

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $(cat "$counter_file")"
rm -f "$lock_file"