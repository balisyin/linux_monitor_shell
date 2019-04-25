#!/bin/bash
while read line
do
    echo $line | redis-cli -h 10.100.111.16 -a jxxxxx
done < redis.txt
