#!/bin/bash

fileName="info.txt"
MYSQL='mysql -h -P3306 -u -p -Dserviceinfo_chatright'#fixme

if [ ! -f $fileName ]; then
    echo "info.txt not exist"
fi

cat $fileName | while read line
do
    name=`echo $line |awk '{print $1}'`
    value=`echo $line | awk '{print $2}'`
    #value=`echo $line | awk '{print $2}' | sed 's/http/https/g' | sed 's/test//g'`
   # echo $name $value 
    cmd="insert into serviceinfo_server_policy (server_name,server_url,https_server_url,server_type,switch,collection) values (\"$name\",\"$value\",\"$value\", 1,1,1);"
    echo $cmd
    #echo $cmd | `$MYSQL`
done