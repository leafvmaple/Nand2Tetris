import os
import sys
import re


def cur_file_dir():
    path = sys.path[0]
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)


dp0 = cur_file_dir() + "\\"

symbol = {
    'SCREEN': 16384,
    'KBD': 24576,
    'SP': 0,
    'LCL': 1,
    'ARG': 2,
    'THIS': 3,
    'THAT': 4,
}
for i in range(16):
    symbol['R' + str(i)] = i

JUMP = {
    'JGT': 1,
    'JEQ': 2,
    'JGE': 3,
    'JLT': 4,
    'JNE': 5,
    'JLE': 6,
    'JMP': 7,
}

DEST = {'M': 1, 'D': 2, 'A': 4}

COMP = {
    '0':  '0101010',
    '1':  '0111111',
    '-1': '0111010',
    'D':  '0001100',
    'A':  '0110000',
    '!D': '0001101',
    '!A': '0110001',
    '-D': '0001111',
    '-A': '0110011',
    'D+1':'0011111',
    'A+1':'0110111',
    'D-1':'0001110',
    'A-1':'0110010',
    'D+A':'0000010',
    'D-A':'0010011',
    'A-D':'0000111',
    'D&A':'0000000',
    'D|A':'0010101',
    'M':  '1110000',
    '!M': '1110001',
    '-M': '1110011',
    'M+1':'1110111',
    'M-1':'1110010',
    'D+M':'1000010',
    'D-M':'1010011',
    'M-D':'1000111',
    'D&M':'1000000',
    'D|M':'1010101',
}
memory_idx = 16

def parse(line):
    ignore_idx = line.find('//')
    if ignore_idx != -1:
        line = line[:ignore_idx]
    line = line.strip()
    if line == '' or line.startswith('//'):
        return
    if re.match(r'^\(.*\)$', line):
        symbol[line[1:-1]] = len(program)
    else:
        return line


def parse_dest(dest):
    dest_code = 0
    for key, value in DEST.items():
        if key in dest:
            dest_code += value
    return dest_code


def parse_jump(jump):
    if jump in JUMP:
        return JUMP[jump]
    return 0


def parse_comp(comp):
    return COMP[comp]


def code(line):
    global memory_idx
    if line.startswith('@'):
        var = line[1:]
        if var in symbol:
            var = symbol[var]
        elif var.isdigit():
            var = int(var)
        else:
            symbol[var] = memory_idx
            var = memory_idx
            memory_idx += 1

        return '0{:0>15b}'.format(var)
    else:
        dest_code = 0
        jump_code = 0
        dest_idx = line.find('=')
        if dest_idx != -1:
            dest_code = parse_dest(line[:dest_idx])
            line = line[dest_idx + 1:]
        jump_idx = line.find(';')
        if jump_idx != -1:
            jump_code = parse_jump(line[jump_idx + 1:])
            line = line[:jump_idx]
        comp_code = parse_comp(line)
        return '111{}{:0>3b}{:0>3b}'.format(comp_code, dest_code, jump_code)


for root, dirs, files in os.walk(dp0):
    for i, file in enumerate(files):
        if '.asm' in file:
            splitext = os.path.splitext(file)
            file_path = os.path.join(root, file)
            print(file_path)
            f = open(file_path)

            program = []
            memory_idx = 16
            for line in f:
                program_line = parse(line)
                if program_line:
                    program.append(program_line)
            f.close()
            f = open(os.path.join(root, splitext[0] + '.hack'), 'w')
            for line in program:
                binary_string = code(line)
                f.write(binary_string + '\n')
            f.close()
