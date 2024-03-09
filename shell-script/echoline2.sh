#!/bin/bash

usage() {
    echo "Usage: $0 [-t <timer>] [-m <message>] [-h]"
    echo "Options:"
    echo "  -t <timer>    Задай временной интервал в секундах (default: 5)"
    echo "  -m <message>  Задай выводимое сообщение (default: 'HELLO WORLD')"
    echo "  -h            Показать данную подсказку"
    exit 1
}

is_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    fi
    return 0
}

timer=5
message="HELLO WORLD"

while getopts ":t:m:h" opt; do
    case $opt in
        t)
            if ! is_number "$OPTARG"; then
                echo "Invalid timer value: $OPTARG. Timer value must be a number." >&2
                exit 1
            fi
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