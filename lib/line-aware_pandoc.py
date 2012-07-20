#!/usr/bin/env python
"""

Wrapper for pandoc to allow it to be used as a vim plugin.  Pandoc does a great
job at formatting markdown, but it mangles leading and trailing whitespace:
deleting leading and adding trailing, to be specific.

This script does the following:

1. It takes in piped input, remembering how much whitespace was at the beginning
and end of the section.
2. Then it passes what remains to a specific call to pandoc
3. It removes all whitespace that pandoc adds at the beginning and ending of the
section.
4. Finally, it adds back the whitespace at the beginning and end of the block
and writes it out to a pipe so that it can be used inside vim.

"""

import sys
from subprocess import Popen, PIPE

def count_and_strip_whitespace(lines):
    leading_index = []
    trailing_index = []

    for i in range(len(lines)):
        if lines[i] == '\n':
            leading_index.append(i)
        else:
            break

    for i in range(len(lines)-1, 0, -1):
        if lines[i] == '\n':
            trailing_index.append(i)
        else:
            break

    remove_indexes = (leading_index + trailing_index)[::1]
    map(lines.pop, remove_indexes)
    return len(leading_index), len(trailing_index), lines

def process_with_pandoc(lines):
    pipe_to_pandoc = Popen(["pandoc", "-t", "markdown"], stdin=PIPE,
            stdout=PIPE)
    return pipe_to_pandoc.communicate(input=buffer(''.join(lines)))[0]

def re_apply_whitespace(leading, trailing, lines):
    return_lines = []
    for i in range(leading):
        return_lines.append('\n')
    return_lines += lines
    for i in range(trailing):
        return_lines.append('\n')
    return ''.join(return_lines)

def main(args):
    with sys.stdin as s:
        lines = s.readlines()
        (leading, trailing, clean_lines) = count_and_strip_whitespace(lines)
        raw_markdown = process_with_pandoc(clean_lines)
        cleaned_up_markdown = \
            count_and_strip_whitespace(raw_markdown.splitlines(True))[2]
        padded_lines = re_apply_whitespace(leading, trailing,
                cleaned_up_markdown)
        sys.stdout.write(padded_lines)

if __name__ == "__main__":
    main(sys.argv[1:])
