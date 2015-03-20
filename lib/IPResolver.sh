#!/usr/bin/env bash

function IP_AS()
{
    # https://baoz.net/%E6%9F%A5%E8%AF%A2ip%E5%AF%B9%E5%BA%94%E7%9A%84%E8%87%AA%E6%B2%BB%E5%9F%9Fasn/
    AS=`whois -h "whois.cymru.com" -v "$IP"\
    | grep "|"\
    | awk '{if(NR == 1 || !(index($0, "BGP Prefix"))) print $0;}'`
}

function IP_WHOIS()
{
    WHOIS=`whois $IP`
}

function IP_DNS()
{
    # http://bgp.he.net/ip/180.149.132.47#_dns
    DNS=`python lib/ip2dns.py "$IP"`
}

function IP_RBL()
{
    # http://blog.chinaunix.net/uid-20530497-id-2048985.html
    local reverseIP=`echo "$IP"\
    | awk '{split($0, arr, "."); if(length(arr)==4)print arr[4]"."arr[3]"."arr[2]"."arr[1];}'`

    RBL=`dig $reverseIP.cbl.anti-spam.org.cn.\
    | grep status\
    | awk '{if(index($0, "NXDOMAIN")) print "NXDOMAIN"; else if(index($0, "NOERRO")) print "NOERRO";}'`
}

function test_domain()
{
    echo -e "\n== NS =="
    DOMAIN_NS
    echo "$NS"

    echo -e "\n== MX =="
    DOMAIN_MX
    echo "$MX"

    echo -e "\n== TXT =="
    DOMAIN_TXT
    echo "$TXT"

    echo -e "\n== A =="
    DOMAIN_A
    echo "$A"

    echo -e "\n== ALEXA =="
    DOMAIN_ALEXA
    echo "$ALEXA"

    echo -e "\n== AS =="
    DOMAIN_AS
    echo "$AS"

    echo -e "\n== WHOIS =="
    DOMAIN_WHOIS
    echo "$WHOIS"
}
