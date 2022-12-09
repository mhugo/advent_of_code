from struct import pack, unpack

import time

input = [9, 19, 1, 6, 0, 5, 4]

input = [0, 3, 6]

#input = [3, 1, 2]

N = 30000000
#N = 100

t_start = time.time()

class BigArray:

    def __init__(self, n):
        self._mem = bytearray(n * 4)

    def get(self, idx):
        return unpack('>L', self._mem[idx*4:(idx+1)*4])[0]

    def set(self, idx, v):
        self._mem[idx*4:(idx+1)*4] = pack('>L', v)
        
turn_number_spoken = BigArray(N)

for i, number in enumerate(input[:-1]):
    turn_number_spoken.set(number, i + 1)

last_spoken = input[-1]
for turn in range(len(input) + 1, N + 1):
    last_turn = turn_number_spoken.get(last_spoken)
    if last_turn:
        n = turn - 1 - last_turn
    else:
        n = 0
    turn_number_spoken.set(last_spoken, turn - 1)
    last_spoken = n
print(n)
print(time.time() - t_start)

