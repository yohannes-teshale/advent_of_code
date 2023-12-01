sum = 0
with open("input.txt", "r") as file:
    lines = file.read().split("\n")

for line in lines:
    i = 0
    j = len(line) - 1
    temp = ""

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
