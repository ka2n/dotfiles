#!/bin/sh

gh repo list $1 --no-archived --limit 300 --json url --jq '.[].url' | ghq get -P
