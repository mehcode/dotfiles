#!/usr/bin/env bash

info=$(checkupdates | wc -l)

# If no updates available
if [ $info ]; then exit 1; fi

jq -M -c -r -n ".text=\"$info\""
