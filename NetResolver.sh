#!/usr/bin/env bash

DOMAIN="baidu.com"
IP="180.149.132.47"

source lib/DomainResolver.sh
source lib/IPResolver.sh

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

function test_ip()
{
    echo -e "\n== AS =="
    IP_AS
    echo "$AS"

    echo -e "\n== WHOIS =="
    IP_WHOIS
    echo "$WHOIS"

    echo -e "\n== DNS =="
    IP_DNS
    echo "$DNS"

    echo -e "\n== RBL =="
    IP_RBL
    echo "$RBL"
}

test_domain > test_domain.log
test_ip > test_ip.log
