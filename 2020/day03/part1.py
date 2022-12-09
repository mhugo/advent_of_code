# call with '< input'
import sys

x = 0
hits = 0

# One pass baby !
width = len(next(sys.stdin).strip())
for line in sys.stdin:
    x = (x + 3) % width
    if line[x] == '#':
        hits += 1

print(hits)
