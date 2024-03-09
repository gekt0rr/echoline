#!/bin/bash

usage() {
    echo "Usage: $0 [-t <timer>] [-m <message>] [-h]"
    echo "Options:"
    echo "  -t <timer>    Задай временной интервал в секундах (default: 5)"
    echo "  -m <message>  Задай выводимое сообщение (default: 'HELLO WORLD')"
    echo "  -h            Показать данную подсказку"
    exit 1
}

timer=5
message="HELLO WORLD"

while getopts ":t:m:h" opt; do
    case $opt in
        t)
            timer=$OPTARG
            ;;
        m)
            message=$OPTARG
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
    esac
done

while true; do
    date
    echo "$message"
    sleep "$timer"
done