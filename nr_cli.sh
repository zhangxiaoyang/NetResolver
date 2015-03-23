#!/usr/bin/env bash

source lib/NetResolver.sh

function usage()
{
    echo "Usage:"
    echo "  ./NetResolver.sh -d baidu.com"
    echo "  ./NetResolver.sh -i 180.149.132.47"
    echo ""
}

if [[ "$#" == "2" ]]
then
    [[ "$1" == "-d" ]] && resolve_domain "$2"
    [[ "$1" == "-i" ]] && resolve_ip "$2"
else
    usage
fi
