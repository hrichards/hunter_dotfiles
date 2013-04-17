#!/usr/bin/env python
"""
Sleep for a given number of minutes, and then beep until ^C
"""

import sys
from time import sleep

DEFAULT_TIME_MIN = 25
SEC_PER_MIN = 60
SYS_BELL = "\a"

"""
The two bell separators below are to make a more interesting beep: two beeps
separated by a short tone, then both separated by a long tone:

    MINOR         MAJOR         MINOR
BEEP-----BEEP---------------BEEP-----BEEP

"""
BELL_SEP_MINOR = 0.25
BELL_SEP_MAJOR = 0.75


def beep():
    sys.stdout.write(SYS_BELL)
    sys.stdout.flush()
    sleep(BELL_SEP_MINOR)
    sys.stdout.write(SYS_BELL)
    sys.stdout.flush()
    sleep(BELL_SEP_MAJOR)


def main(sleep_time_min):
    for minute in reversed(range(1, int(sleep_time_min) + 1)):
        print "%d minute(s) left..." % minute
        sleep(SEC_PER_MIN)
    while True:
        try:
            beep()
        except KeyboardInterrupt:
            print
            break


if __name__ == "__main__":
    try:
        main(float(sys.argv[1]))
    except IndexError:
        main(DEFAULT_TIME_MIN)
