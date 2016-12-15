#!/bin/bash

for name in *.png
do
    newname="$(echo "$name" | cut -c2-)"
    mv "$name" "$newname"
done
