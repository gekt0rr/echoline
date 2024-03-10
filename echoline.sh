#!/bin/bash

usage() { # Функция вывода подсказки
    echo "Usage: $0 [-t <timer>] [-m <message>] [-h]"
    echo "Options:"
    echo "  -t <timer>    Задай временной интервал в секундах (default: 5)"
    echo "  -m <message>  Задай выводимое сообщение (default: 'HELLO WORLD')"
    echo "  -h            Показать данную подсказку"
    exit 1
}

is_number() {                       # Функция проверки на число
    re='^[0-9]+$'                   # Регулярное выражение для числа  
    if ! [[ $1 =~ $re ]] ; then     # $1 - первый аргумент функции, если он не соответствует регулярному выражению, то вернуть 1 (ошибка)
        return 1
    fi
    return 0                           
}

timer=5                             # Значение по умолчанию для таймера
message="HELLO WORLD"               # Значение по умолчанию для сообщения

while getopts ":t:m:h" opt; do      
    case $opt in                               
        t)
            if ! is_number "$OPTARG"; then
                echo "Не верное значение таймера: $OPTARG. Таймер должен быть числом." >&2
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
            echo "Неверная опция: -$OPTARG" >&2
            usage
            ;;
    esac
done

while true; do
    date
    echo "$message"
    sleep "$timer"
done