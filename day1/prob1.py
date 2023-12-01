from ast import List


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
    for key, value in alpha_num_dict.items():
        line= line.replace(key, value)
    temp = ""
    j = len(line) - 1
    while i < len(line) and j >= 0:
        if not line[i].isdigit():
            i += 1
        elif not line[j].isdigit():
            j -= 1
        else:
            temp = line[i] + line[j]
            sum += int(temp)
            break 

print(sum)
