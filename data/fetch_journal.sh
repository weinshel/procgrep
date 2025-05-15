#!/bin/sh
set -e

if [ $# -ne 3 ]; then
    echo "Usage: $0 journal_name start_year start_issue"
    exit 1
fi

journal="$1"
start_year="$2"
issue=$3
current_year=$(date +"%Y")

mkdir -p $journal

year="$start_year"
while [ "$year" -le "$current_year" ]; do
    echo "Fetching $journal$issue..."
    curl -L "https://dblp.org/search/publ/api?q=toc%3Adb/journals/$journal/$journal$issue.bht%3A&h=5000&format=json" -o "$journal/$year.json"
    year=$((year + 1))
    issue=$((issue + 1))
done
