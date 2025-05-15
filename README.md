# procgrep (proceedings grep)

## Usage

Search a specific venue and year:

```
./procgrep usenix 2024 iot
```

Search all proceedings in the dataset:

```
./procgrep "*" "*" iot
```


## Installation

This script requires `ripgrep` and `jq`.
You can install them using your favorite package manager (e.g. APT/Homebrew/MacPorts).

## Adding proceedings

The script uses data from [dblp.org](https://dblp.org/).

To add a venue or year, add the JSON export from dblp to the appropriate folder.
For conferences this can be found at `https://dblp.org/search/publ/api?q=toc%3Adb/conf/uss/uss2023.bht%3A&h=1000&format=json`, and for journals `https://dblp.org/search/publ/api?q=toc%3Adb/journals/cscw/cscw34.bht%3A&h=1000&format=json` (replacing the conference/journal identifier and year as appropriate).

A script to fetch data for conferences can be found at `data/fetch_conf.sh`.
