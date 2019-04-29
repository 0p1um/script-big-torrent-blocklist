#!/bin/sh
curl -s https://www.iblocklist.com/lists.php \
    | sed -n "s/.*value='\(http:\/\/.*\)'><\/td>/\1/p" \
    |xargs wget -q -O - \
    |gunzip \
    | sort \
    | uniq \
    | grep -v "#" > blocklist.txt

