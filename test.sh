#!/usr/bin/bash

first=true
echo -e "[\n"

while read line; do
    jpsuid=$(echo $line | awk '{print $1}')
    jpsip=$(echo $line | awk '{print $2}')
    jpsstatus=$(echo $line | awk '{print $3}')
    jpstype=$(echo $line | awk '{print $4}')
    if ! $first;
    then
        echo -e ",\n"
    fi
    first=false
    echo -e "   {\n"
    echo -e "      \"{#JPSUID}\":\"$jpsuid\",\n"
    echo -e "      \"{#JPSIP}\":\"$jpsip\",\n"
    echo -e "      \"{#JPSSTATUS}\":\"$jpsstatus\",\n"
    echo -e "      \"{#JPSTYPE}\":\"$jpstype\",\n"
    echo -e "   }\n"
done < ./input.txt
echo -e "]\n"

