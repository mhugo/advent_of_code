import time

input = [9, 19, 1, 6, 0, 5, 4]

#input = [0, 3, 6]

#input = [3, 1, 2]

N = 30000000
#N = 100

t_start = time.time()

turn_number_spoken = {}

for i, number in enumerate(input[:-1]):
    turn_number_spoken[number] = i + 1

last_spoken = input[-1]
for turn in range(len(input) + 1, N + 1):
    last_turn = turn_number_spoken.get(last_spoken)
    if last_turn:
        n = turn - 1 - last_turn
    else:
        n = 0
    turn_number_spoken[last_spoken] = turn - 1
    last_spoken = n
print(n)
print(time.time() - t_start)

