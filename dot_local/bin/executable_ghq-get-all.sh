#!/bin/sh

gh repo list $1 --no-archived --json url --jq '.[].url' | ghq get -P
