#!/usr/bin/env bash

source lib/NetResolver.sh
source lib/DomainResolver.sh
source lib/IPResolver.sh

function usage()
{
    echo "Usage:"
    echo "  ./nr_cli.sh -d baidu.com"
    echo "  ./nr_cli.sh -i 180.149.132.47"
    echo ""
}

if [[ "$#" == "2" ]]
then
    [[ "$1" == "-d" ]] && resolve_domain "$2"
    [[ "$1" == "-i" ]] && resolve_ip "$2"
else
    usage
fi
