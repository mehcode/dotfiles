#!/usr/bin/env bash

class=cpu_speed

speed_mhz=$(lscpu | grep "CPU MHz" | sed --expression "s/CPU MHz:[[:space:]]*//g" | xargs printf "%.*f\n" 0)
speed_ghz=`bc -l <<< "$speed_mhz / 1000"`

speed=$(echo $speed_ghz | xargs printf "%.*f\n" 2)

info="($speed GHz)"

jq -M -c -r -n ".text=\"$info\" | .class=\"$class\""
