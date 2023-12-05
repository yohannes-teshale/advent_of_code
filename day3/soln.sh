#!/bin/bash

input=$(cat input.txt)
symbol_detected=false
declare -a arr
sum=0
is_symbol(){
    if [[ $1 == "$" ]]; then
        return 0
    else
        return 1
    fi
}
is_number(){
    if [[ $1 =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}
check_symbols_adjacent() {
    local row=$1
    local col=$2
    local arr=("${@:3}")
    local index=$((row * ${#arr[@]} + col))
    local current_element=${arr[$index]}
    echo "current element is $current_element"
     if is_number "$current_element"; then
         for ((i=row-1; i<=row+1; i++)); do
             for ((j=col-1; j<=col+1; j++)); do
                 if [ $i -ge 0 ] && [ $i -lt ${#arr[@]} ] && [ $j -ge 0 ] && [ $j -lt ${#arr[@]} ]; then
                     adjacent_element=${arr[$i,$j]}
                     if [ "$adjacent_element" -ne "$current_element" ] && [ "$adjacent_element" -eq '$' ]; then
                         echo "Symbol detected adjacent to number at [$row, $col]: $adjacent_element"
                     fi
                 fi
             done
         done
     fi
}



function check_symbol() {
    if [[ $1 == "$" ]]; then
        symbol_detected=true
    fi
}

IFS=$'\n' read -d '' -r -a lines < input.txt

for ((i=0; i<${#lines[@]}; i++)); do
    line="${lines[i]}"
    x=($(echo "${line}" | grep -o . | sed 's/[^0-9.]/$/g'))
    
    for ((j=0; j<${#x[@]}; j++)); do
        index=$((i * ${#lines[@]} + j))
        arr[$index]=${x[$j]}
        # echo "array element [$i, $j] is : ${arr[$index]}"
    done
done

for ((i=0; i<${#lines[@]}; i++)); do
    for ((j=0; j<${#lines[@]}; j++)); do
        index=$((i * ${#lines[@]} + j))
        echo  "${arr[$index]}"
    #  check_symbols_adjacent $i $j "${arr[@]}"
    done
done
