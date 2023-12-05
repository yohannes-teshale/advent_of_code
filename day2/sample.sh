#!/bin/bash

input=$(cat input.txt)

for inp in "${input[@]}"; do
    him=$(echo "$inp" | egrep -o '[0-9]+ red')
    echo "$him"
done