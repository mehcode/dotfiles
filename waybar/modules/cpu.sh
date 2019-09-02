#!/usr/bin/env bash

class=cpu

usage=$(mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]["cpu-load"][0] | to_entries[1:length-1] | map(.value) | add' | xargs printf "%.2f")

speed_mhz=$(lscpu | grep "CPU MHz" | sed --expression "s/CPU MHz:[[:space:]]*//g" | xargs printf "%.*f\n" 0)
speed_ghz=`bc -l <<< "$speed_mhz / 1000"`

speed=$(echo $speed_ghz | xargs printf "%.*f\n" 2)

info="$usage% ($speed GHz)"

jq -M -c -r -n ".text=\"$info\" | .class=\"$class\""
