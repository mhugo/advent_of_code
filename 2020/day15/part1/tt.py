import time
t_start = time.time()

n = 0
for i in range(30000000):
    n += 1
print(time.time() - t_start)
