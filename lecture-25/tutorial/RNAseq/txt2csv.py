#!/usr/bin/env python
from sys import argv
import polars as pl


def bashify() -> tuple:
    input = argv[-2]
    output = argv[-1]
    return input, output


def open_file(input: str) -> list:
    f = open(input, "r").readlines()
    lines = [line.strip().split("\t") for line in f[1:]]
    return lines


def convert_to_csv(lines: list, output_file: str):
    df = pl.DataFrame(lines[1:]).transpose()
    df.columns = lines[0]
    print(df)
    df.write_csv(output_file, separator=",")


input, output = bashify()
file = open_file(input)
convert_to_csv(file, output)
