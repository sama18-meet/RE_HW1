f'''
Example usage:
>>> python string2stack.py settlement
Output:
... push    0x0000746e      ; tn
... push    0x656d656c      ; emel
... push    0x74746573      ; ttes
... push    esp
... ========================; Call the function here
... add     esp, 0x0c
'''

from sys import argv


def _hexord(c):
    return hex(ord(c))[2:]


def _lil_endy_hexify(s: str):
    return ''.join([_hexord(c) for c in s])


def _lil_endy_pushify(s: str):
    pref = 'push\t'
    return pref + '0x%08x' % (int(_lil_endy_hexify(s), 16) if s else 0)


def _split_to_4s(s: str):
    return [s[i:i+4][::-1] for i in range(0, len(s), 4)][::-1]


def _print_push(s: str):
    quads = _split_to_4s(s)
    count_pushes = 0

    if len(s)%4 == 0:
        print(_lil_endy_pushify('') + '\t; ' + '\0')
        count_pushes += 1

    for quad_i in range(len(quads)):
        quad = quads[quad_i]
        push_quad = _lil_endy_pushify(quad)
        
        print(push_quad + '\t; ' + quad)
    
    count_pushes += len(quads) + 1  # 4 more bytes for esp

    print('push\tesp')
    print('=' * 24 + '; Call the function here')
    print(f'add\tesp, 0x{count_pushes * 4:02x}')

def _main():
    _print_push(' '.join(argv[1:]))


if __name__ == '__main__':
    _main()
