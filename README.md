# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script that concurrently updates a counter. The script uses two processes to increment a counter stored in a file. Due to the race condition, the final counter value might not be the expected value (2) because the processes access and modify the file concurrently without proper synchronization.

## How to Reproduce

1. Clone this repository.
2. Run `bash bug.sh`
3. Observe that the final counter value is not always 2.

## Solution

The solution involves using a locking mechanism to prevent concurrent access to the counter file.  This ensures that only one process can update the counter at a time.
