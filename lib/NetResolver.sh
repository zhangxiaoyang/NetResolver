#!/usr/bin/env bash

function resolve_domain()
{
    DOMAIN="$1"

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

    echo -e "\n== TTL =="
    DOMAIN_TTL
    echo "$TTL"

    echo -e "\n== WHOIS =="
    DOMAIN_WHOIS
    echo "$WHOIS"
}

function resolve_ip()
{
    IP="$1"

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
