import sys

mem = []

for line_number, line in enumerate(sys.stdin):
    instr, arg = line.split()
    int_arg = int(arg)
    mem.append((instr, int_arg))

def does_it_halt(mem):
    accum = 0
    ip = 0
    executed = set()
    while True:
        if ip >= len(mem):
            # it halts !
            return True, accum
        instr, arg = mem[ip]
        #print(ip, instr, arg)
        if ip in executed:
            return False, accum
        executed.add(ip)
        if instr == "acc":
            accum += arg
        elif instr == "jmp":
            ip += arg
            continue
        ip += 1

def fix(mem):
    for i in range(len(mem)):
        instr, arg = mem[i]
        if instr == "jmp":
            new_instr = "nop"
        elif instr == "nop":
            new_instr = "jmp"
        else:
            continue
        mem[i] = (new_instr, arg)
        print("#{} Changing {} to {}".format(i, instr, new_instr))
        halt, accum = does_it_halt(mem)
        mem[i] = (instr, arg)
        if halt:
            print("HALT!", accum)
            return True
    return False

fix(mem)
