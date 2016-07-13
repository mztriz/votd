#!/bin/bash
# Ava Gailliot
# A small script to print Bible Gateway's  VOTD in NLT

# RSS feed URL for BG
URL=https://www.biblegateway.com/usage/votd/rss/votd.rdf?51

# Grab VOTD from XML in URL
MESSAGE=$(curl --silent --connect-timeout 10 "$URL" | grep -o '&ldquo.*' | cut -f2- -d';' | cut -d '&' -f1 )
VERSE=$(curl --silent --connect-timeout 10 "$URL" | sed -n '22 p'| sed -e 's/<[^>]*>//g')

# Print Verse of the Day
echo "$MESSAGE $VERSE"
