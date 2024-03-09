#!/bin/bash

while true; do
    date
    echo ${2:-"HELLO WORLD"}
    sleep ${1:-5}
done
