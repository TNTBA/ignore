#!/bin/bash

# Define the root directory of the old firmware
OLD_ROOT="/path/to/old/firmware/root"

# Output file
OUTPUT_FILE="hooks_found.txt"

# Ensure the output file is empty
> "$OUTPUT_FILE"

echo "Scanning for hooks in $OLD_ROOT..."

# Find all regular files in the root directory
find "$OLD_ROOT" -type f | while read -r file; do
    # Search for hook patterns in the file
    if grep -Iq . "$file"; then  # Check if the file is text
        matches=$(grep -inE \
            -e '(^|\s)(pre|post)(-|\s)?(install|upgrade|remove|start|stop|exec|hook)' \
            -e '(^|\s)(RUN|IMPORT|PROGRAM|ACTION)\s*==' \
            -e '(^|\s)(ExecStartPre|ExecStartPost|ExecStop|ExecReload|ExecStart)' \
            -e '(^|\s)(KERNEL|SUBSYSTEM|DRIVERS|ATTRS|ENV)\s*==' \
            -e '(^|\s)(@reboot|@yearly|@annually|@monthly|@weekly|@daily|@hourly|@midnight)' \
            -e '^\s*cron\b' \
            "$file")
        if [ ! -z "$matches" ]; then
            echo "File: $file" >> "$OUTPUT_FILE"
            echo "$matches" >> "$OUTPUT_FILE"
            echo "----------------------------------------" >> "$OUTPUT_FILE"
        fi
    fi
done

echo "Hook scanning complete. Results saved in $OUTPUT_FILE."
