#!/usr/bin/env bash

class=storage

usage=$(btrfs filesystem usage / 2> /dev/null | rg -o 'Device allocated:.*?([\d\.]+).*?' -r '$1')
size=$(btrfs filesystem usage / 2> /dev/null | rg -o 'Device size:.*?([\d\.]+).*?' -r '$1')

percentage=`bc -l <<< "$usage / $size"`

jq -M -c -r -n ".text=\"$usage\" | .percentage=\"$percentage\" | .class=\"$class\""
