#!/bin/bash

for name in *.png
do
    #cut first x-1 characters
    #newname="$(echo "$name" | cut -c2-)"
    #mv "$name" "$newname"
    #replace character or string
    #mv "$name" "${name/_/\-}"
    #to lowercase
    #newname=$(echo "$name" | tr '[:upper:]' '[:lower:]') 
    mv "$name" "$newname"
done

