#!/bin/sh
set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 conference_name start_year"
    exit 1
fi

conf="$1"
start_year="$2"
current_year=$(date +"%Y")

mkdir -p $conf

year="$start_year"
while [ "$year" -le "$current_year" ]; do
    echo "Fetching $conf$year..."
    curl -L "https://dblp.org/search/publ/api?q=toc%3Adb/conf/$conf/$conf$year.bht%3A&h=5000&format=json" -o "$conf/$year.json"
    year=$((year + 1))
done
