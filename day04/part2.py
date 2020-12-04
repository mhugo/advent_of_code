import sys
from typing import Dict


def is_valid_passport_key(k, v):
    if k == "byr":
        # four digits; at least 1920 and at most 2002
        return len(v) == 4 \
            and v.isdigit() \
            and 1920 <= int(v) <= 2002

    if k == "iyr":
        # four digits; at least 2010 and at most 2020
        return len(v) == 4 \
            and v.isdigit() \
            and 2010 <= int(v) <= 2020

    if k == "eyr":
        # four digits; at least 2020 and at most 2030
        return len(v) == 4 \
            and v.isdigit() \
            and 2020 <= int(v) <= 2030

    if k == "hgt":
        # a number followed by either cm or in:
        # If cm, the number must be at least 150 and at most 193.
        # If in, the number must be at least 59 and at most 76
        return len(v) >= 2 \
            and (
                (
                    v.endswith("cm")
                    and v[:-2].isdigit()
                    and 150 <= int(v[:-2]) <= 193
                ) or (
                    v.endswith("in")
                    and v[:-2].isdigit()
                    and 59 <= int(v[:-2]) <= 76
                )
            )

    if k == "hcl":
        # a # followed by exactly six characters 0-9 or a-f
        return len(v) == 7 \
            and v[0] == "#" \
            and all([c in "0123456789abcdef" for c in v[1:]])

    if k == "ecl":
        # exactly one of: amb blu brn gry grn hzl oth
        return v in "amb blu brn gry grn hzl oth".split()

    if k == "pid":
        # a nine-digit number, including leading zeroes
        return len(v) == 9 and v.isdigit()

    if k == "cid":
        return True

    return False


def all_key_present(passport: Dict[str, str]):
    return all([k in passport for k in
                "byr iyr eyr hgt hcl ecl pid".split()])


def is_valid_passport(passport: Dict[str, str]):
    return all_key_present(passport) \
        and all([is_valid_passport_key(k, v) for k, v in passport.items()])


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
