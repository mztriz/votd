#!/bin/bash
# Ava Gailliot
# A small shell script to print Bible Gateway's VOTD in NLT

# RSS feed URL for BG
# 51 is NLT
URL=https://www.biblegateway.com/usage/votd/rss/votd.rdf?51

# Grab VOTD from XML in URL
MESSAGE=$(curl --silent --connect-timeout 10 "$URL" | grep -o '&ldquo.*' | cut -f2- -d';' | cut -d '&' -f1 )
VERSE=$(curl --silent --connect-timeout 10 "$URL" | sed -n '22 p'| sed -e 's/<[^>]*>//g')
echo -e "\"$MESSAGE\" \n\t\t$VERSE"
