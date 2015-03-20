#!/usr/bin/env bash

MAX_LEN=10000

function DOMAIN_NS()
{
    NS=`nslookup -q=ns "$DOMAIN"\
    | grep -A "$MAX_LEN" "Non-authoritative answer:"\
    | grep -v "Non-authoritative answer"\
    | awk '{if($0) print $NF; else exit;}'`
}

function DOMAIN_MX()
{
    MX=`nslookup -q=mx "$DOMAIN"\
    | grep -A "$MAX_LEN" "Non-authoritative answer:"\
    | grep -v "Non-authoritative answer"\
    | awk '{if($0) print $NF; else exit;}'`
}

function DOMAIN_TXT()
{
    TXT=`nslookup -q=txt "$DOMAIN"\
    | grep -A "$MAX_LEN" "Non-authoritative answer:"\
    | grep -v "Non-authoritative answer"\
    | awk -F "\"" '{if($2) print $2; else exit;}'`
}

function DOMAIN_A()
{
    A=`nslookup -q=a baidu.com\
    | grep -A "$MAX_LEN" "Non-authoritative answer"\
    | grep -v "Non-authoritative answer"\
    | grep -v "Name:" | sed 's/Address: //'`
}

function DOMAIN_ALEXA()
{
    # http://stackoverflow.com/questions/3676376/fetching-alexa-data
    ALEXA=`curl -s "http://data.alexa.com/data?cli=10&url=$DOMAIN"\
    | grep "<REACH RANK="\
    | head -1\
    | egrep -o "[0-9]+"`
}

function DOMAIN_AS()
{
    # https://baoz.net/%E6%9F%A5%E8%AF%A2ip%E5%AF%B9%E5%BA%94%E7%9A%84%E8%87%AA%E6%B2%BB%E5%9F%9Fasn/
    AS=`for ip in "${A[@]}"
    do
        whois -h "whois.cymru.com" -v "$ip"
    done\
    | grep "|"\
    | awk '{if(NR == 1 || !(index($0, "BGP Prefix"))) print $0;}'`
}

function DOMAIN_WHOIS()
{
    WHOIS=`whois $DOMAIN`
}
