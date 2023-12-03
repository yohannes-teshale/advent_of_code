#!/bin/bash

file_path="input.txt"

target_red=12
target_green=13
target_blue=14

impossible_games=()

IFS=$'\n' games=($(cat "$file_path"))
length="${#games[@]}"
echo "Number of games: $length"
for game in "${games[@]}"; do
    IFS=$'\n' draws=($(echo "$game" | tr ';' '\n'))
    echo "${draws[1]}"
    for draw in "${draws[@]}"; do
        echo "$draw"
    red=$(echo "$draw" | grep -oE '[0-9]+ red' | awk '{sum+=$1}END{print sum}')
    green=$(echo "$draw" | grep -oE '[0-9]+ green' | awk '{sum+=$1}END{print sum}')
    blue=$(echo "$draw" | grep -oE '[0-9]+ blue' | awk '{sum+=$1}END{print sum}')

    echo "Game: $game"
    echo "Red: $red"
    echo "Green: $green"
    echo "Blue: $blue"
    if [ "$red" -gt "$target_red" ] || [ "$green" -gt "$target_green" ] || [ "$blue" -gt "$target_blue" ]; then
        game_id=$(echo "$game" | grep -oE 'Game [0-9]+' | grep -oE '[0-9]+')
        impossible_games+=("$game_id")
        echo "imPossible game: $game_id"
        break
    fi
    done
  

done

if [ "${#impossible_games[@]}" -eq 0 ]; then
    echo "all games match the target cube counts."
else
    echo "imPossible games: ${impossible_games[@]}"
    sum=0
    for game_id in "${impossible_games[@]}"; do
        sum=$((sum + game_id))
    done
    
    echo "results is $((5050-sum))" 
fi
