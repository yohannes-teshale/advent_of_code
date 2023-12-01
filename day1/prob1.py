from ast import List
import operator

sum = 0
with open("input.txt", "r") as file:
    lines = file.read().split("\n")

alpha_num_dict = {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
    "zero": "0",
}

for line in lines:
    i = 0
    digit_index_map = {}

    for key, value in alpha_num_dict.items():
        if key in line:
            indices=[i for i in range(len(line)) if line.startswith(key, i)]
            digit_index_map[value] = indices;
            

    temp = ""
    while i < len(line):
        if line[i].isdigit():
            digit_index_map[line[i]]= digit_index_map.get(line[i], []) + [i]
        i += 1

    digit_index_map = dict(sorted(digit_index_map.items(), key=operator.itemgetter(1)))
    print(digit_index_map)
    first_digit = min(digit_index_map, key=lambda x: min(digit_index_map[x]))
    last_digit = max(digit_index_map, key=lambda x: max(digit_index_map[x]))
    temp= str(first_digit) + str(last_digit)
    sum += int(temp)

print(sum)
