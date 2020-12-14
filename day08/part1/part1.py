import sys

mem = []

for line_number, line in enumerate(sys.stdin):
    instr, arg = line.split()
    int_arg = int(arg)
    mem.append((instr, int_arg))

accum = 0
ip = 0
executed = set()
while True:
    if ip >= len(mem):
        print("Normal termination")
        break
    instr, arg = mem[ip]
    print(ip, instr, arg)
    if ip in executed:
        print("Already executed ! Accum:", accum)
        break
    executed.add(ip)
    if instr == "acc":
        accum += arg
    elif instr == "jmp":
        ip += arg
        continue
    ip += 1
