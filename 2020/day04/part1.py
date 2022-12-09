import sys
from typing import Dict


def is_valid_passport(passport: Dict[str, str]):
    return all([k in passport for k in
                "byr iyr eyr hgt hcl ecl pid".split()])


passport_data = {}

n_valid = 0

for line in sys.stdin:
    if line.strip() == "":
        if is_valid_passport(passport_data):
            n_valid += 1
        passport_data = {}
    for d in line.strip().split():
        k, v = d.split(':')
        passport_data[k] = v

if is_valid_passport(passport_data):
    n_valid += 1

print(n_valid)

