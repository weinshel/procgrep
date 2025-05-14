#!/bin/sh
set -e

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 conference_name start_year"
    exit 1
fi

conf="$1"
start_year="$2"
current_year="2025"


# Validate input year is a number
case "$start_year" in
    ''|*[!0-9]*)
        echo "Error: Year must be a number"
        exit 1
        ;;
esac

# Loop from start_year to current_year and load files
year="$start_year"
mkdir -p $conf
while [ "$year" -le "$current_year" ]; do
    echo "Fetching $conf$year..."
    curl -L "https://dblp.org/search/publ/api?q=toc%3Adb/conf/$conf/$conf$year.bht%3A&h=5000&format=json" -o "$conf/$year.json"
    year=$((year + 1))
done
