# call with '< input'
import sys
nbs = [int(x) for x in sys.stdin]

def do():
    for nb1 in nbs:
        for nb2 in nbs:
            for nb3 in nbs:
                if nb1+nb2+nb3 == 2020:
                    print(nb1, nb2, nb3, nb1*nb2*nb3)
                    return

do()
