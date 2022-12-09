# call with < input
import sys

lines = [line.strip() for line in sys.stdin]
width = len(lines[0])
slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
product = 1

for dx, dy in slopes:
    x, y, hits = 0, 0, 0
    while y < len(lines):
        if lines[y][x] == '#':
            hits += 1
        x = (x + dx) % width
        y += dy
    product *= hits

print(product)
