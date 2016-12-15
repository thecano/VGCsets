#!/bin/bash

for file in *.png; do convert $file -resize 90 $file; done
