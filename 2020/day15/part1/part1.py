input = [9, 19, 1, 6, 0, 5, 4]

#input = [0, 3, 6]

#input = [3, 1, 2]

turn_number_spoken = {
    number: i + 1
    for i, number in enumerate(input[:-1])
}
last_spoken = input[-1]
for turn in range(len(input) + 1, 2021):
    print("turn", turn, "last spoken", last_spoken)
    if last_spoken in turn_number_spoken:
        print("previous turn spoken", turn_number_spoken[last_spoken])
        n = turn - 1 - turn_number_spoken[last_spoken]
    else:
        print("first time")
        n = 0
    print("new", n)
    turn_number_spoken[last_spoken] = turn - 1
    last_spoken = n


