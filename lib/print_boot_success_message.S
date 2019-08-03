global print_success
print_success:
    mov esi, 0x1e0
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 7
    call print_char
    mov eax, 0x3a
    mov ebx, 14
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 18
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 22
    mov ecx, 3
    call print_char
    mov eax, 0x2c
    mov ebx, 28
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 30
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 32
    mov ecx, 11
    call print_char
    mov eax, 0x7e
    mov ebx, 54
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 56
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 60
    mov ecx, 28
    call print_char
    mov eax, 0x3a
    mov ebx, 116
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 120
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 136
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 140
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 144
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 146
    mov ecx, 7
    call print_char
    mov esi, 0x280
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 6
    call print_char
    mov eax, 0x3a
    mov ebx, 12
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 16
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 18
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 20
    mov ecx, 5
    call print_char
    mov eax, 0x3a
    mov ebx, 30
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 32
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 34
    mov ecx, 12
    call print_char
    mov eax, 0x7e
    mov ebx, 58
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 60
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 64
    mov ecx, 26
    call print_char
    mov eax, 0x3a
    mov ebx, 116
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 120
    mov ecx, 8
    call print_char
    mov eax, 0x3d
    mov ebx, 136
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 138
    mov ecx, 11
    call print_char
    mov esi, 0x320
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 6
    call print_char
    mov eax, 0x3a
    mov ebx, 12
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 16
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 32
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 34
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 36
    mov ecx, 13
    call print_char
    mov eax, 0x7e
    mov ebx, 62
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 64
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 68
    mov ecx, 24
    call print_char
    mov eax, 0x3a
    mov ebx, 116
    mov ecx, 4
    call print_char
    mov eax, 0x7e
    mov ebx, 124
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 128
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 130
    mov ecx, 15
    call print_char
    mov esi, 0x3c0
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 5
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 14
    mov ecx, 8
    call print_char
    mov eax, 0x7e
    mov ebx, 30
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 34
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 38
    mov ecx, 14
    call print_char
    mov eax, 0x3d
    mov ebx, 66
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 68
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 70
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 74
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 90
    mov ecx, 15
    call print_char
    mov eax, 0x7e
    mov ebx, 120
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 122
    mov ecx, 18
    call print_char
    mov eax, 0x7e
    mov ebx, 158
    mov ecx, 1
    call print_char
    mov esi, 0x460
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 8
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 10
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 12
    mov ecx, 10
    call print_char
    mov eax, 0x7e
    mov ebx, 32
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 34
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 38
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 40
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 42
    mov ecx, 14
    call print_char
    mov eax, 0x3d
    mov ebx, 70
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 72
    mov ecx, 8
    call print_char
    mov eax, 0x3d
    mov ebx, 88
    mov ecx, 10
    call print_char
    mov eax, 0x23
    mov ebx, 108
    mov ecx, 24
    call print_char
    mov eax, 0x3d
    mov ebx, 156
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 158
    mov ecx, 1
    call print_char
    mov esi, 0x500
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 8
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 10
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 12
    mov ecx, 15
    call print_char
    mov eax, 0x3d
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 44
    mov ecx, 55
    call print_char
    mov eax, 0x3d
    mov ebx, 154
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 156
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 158
    mov ecx, 1
    call print_char
    mov esi, 0x5a0
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 4
    call print_char
    mov eax, 0x2c
    mov ebx, 8
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 15
    call print_char
    mov eax, 0x2c
    mov ebx, 40
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 46
    mov ecx, 52
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 152
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 156
    mov ecx, 2
    call print_char
    mov esi, 0x640
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 3
    call print_char
    mov eax, 0x3a
    mov ebx, 6
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 8
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 18
    call print_char
    mov eax, 0x7e
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 48
    mov ecx, 49
    call print_char
    mov eax, 0x7e
    mov ebx, 146
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 148
    mov ecx, 6
    call print_char
    mov esi, 0x6e0
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 3
    call print_char
    mov eax, 0x2c
    mov ebx, 6
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 8
    mov ecx, 19
    call print_char
    mov eax, 0x2c
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 50
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 52
    mov ecx, 2
    call print_char
    mov eax, 0x23
    mov ebx, 56
    mov ecx, 42
    call print_char
    mov eax, 0x3d
    mov ebx, 140
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 142
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 144
    mov ecx, 8
    call print_char
    mov esi, 0x780
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 4
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 6
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 8
    mov ecx, 21
    call print_char
    mov eax, 0x2c
    mov ebx, 50
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 52
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 54
    mov ecx, 39
    call print_char
    mov eax, 0x3d
    mov ebx, 132
    mov ecx, 3
    call print_char
    mov eax, 0x7e
    mov ebx, 138
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 140
    mov ecx, 10
    call print_char
    mov esi, 0x820
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 4
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 8
    mov ecx, 14
    call print_char
    mov eax, 0x2c
    mov ebx, 36
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 44
    mov ecx, 4
    call print_char
    mov eax, 0x23
    mov ebx, 52
    mov ecx, 41
    call print_char
    mov eax, 0x3d
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 136
    mov ecx, 12
    call print_char
    mov esi, 0x8c0
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 4
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 6
    mov ecx, 14
    call print_char
    mov eax, 0x2c
    mov ebx, 34
    mov ecx, 5
    call print_char
    mov eax, 0x3a
    mov ebx, 44
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 50
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 52
    mov ecx, 42
    call print_char
    mov eax, 0x7e
    mov ebx, 136
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 138
    mov ecx, 11
    call print_char
    mov esi, 0x960
    mov eax, 0x7e
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 2
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 6
    mov ecx, 13
    call print_char
    mov eax, 0x2c
    mov ebx, 32
    mov ecx, 5
    call print_char
    mov eax, 0x3a
    mov ebx, 42
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 50
    mov ecx, 6
    call print_char
    mov eax, 0x3d
    mov ebx, 62
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 66
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 70
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 72
    mov ecx, 18
    call print_char
    mov eax, 0x3d
    mov ebx, 108
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 112
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 116
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 120
    mov ecx, 8
    call print_char
    mov eax, 0x3d
    mov ebx, 136
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 138
    mov ecx, 11
    call print_char
    mov esi, 0xa00
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 2
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 4
    mov ecx, 21
    call print_char
    mov eax, 0x2c
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 50
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 60
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 62
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 64
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 66
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 68
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 72
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 74
    mov ecx, 16
    call print_char
    mov eax, 0x3d
    mov ebx, 106
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 108
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 112
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 114
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 116
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 120
    mov ecx, 9
    call print_char
    mov eax, 0x7e
    mov ebx, 138
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 140
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 144
    mov ecx, 8
    call print_char
    mov esi, 0xaa0
    mov eax, 0x2c
    mov ebx, 0
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 4
    mov ecx, 3
    call print_char
    mov eax, 0x2c
    mov ebx, 10
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 8
    call print_char
    mov eax, 0x7e
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 44
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 50
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 60
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 62
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 66
    mov ecx, 3
    call print_char
    mov eax, 0x7e
    mov ebx, 72
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 74
    mov ecx, 16
    call print_char
    mov eax, 0x3d
    mov ebx, 106
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 108
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 110
    mov ecx, 4
    call print_char
    mov eax, 0x3d
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 120
    mov ecx, 10
    call print_char
    mov eax, 0x3a
    mov ebx, 140
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 144
    mov ecx, 8
    call print_char
    mov esi, 0xb40
    mov eax, 0x2c
    mov ebx, 0
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 4
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 8
    mov ecx, 10
    call print_char
    mov eax, 0x3a
    mov ebx, 28
    mov ecx, 8
    call print_char
    mov eax, 0x2c
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 48
    mov ecx, 8
    call print_char
    mov eax, 0x7e
    mov ebx, 64
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 66
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 70
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 72
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 74
    mov ecx, 18
    call print_char
    mov eax, 0x3d
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 112
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 114
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 116
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 118
    mov ecx, 11
    call print_char
    mov eax, 0x7e
    mov ebx, 140
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 142
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 144
    mov ecx, 8
    call print_char
    mov esi, 0xbe0
    mov eax, 0x2c
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 3
    call print_char
    mov eax, 0x2c
    mov ebx, 8
    mov ecx, 11
    call print_char
    mov eax, 0x3a
    mov ebx, 30
    mov ecx, 7
    call print_char
    mov eax, 0x2c
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 48
    mov ecx, 16
    call print_char
    mov eax, 0x3d
    mov ebx, 80
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 82
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 86
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 88
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 90
    mov ecx, 25
    call print_char
    mov eax, 0x3d
    mov ebx, 140
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 142
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 144
    mov ecx, 8
    call print_char
    mov esi, 0xc80
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 4
    call print_char
    mov eax, 0x2c
    mov ebx, 8
    mov ecx, 10
    call print_char
    mov eax, 0x3a
    mov ebx, 28
    mov ecx, 5
    call print_char
    mov eax, 0x7e
    mov ebx, 38
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 40
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 48
    mov ecx, 2
    call print_char
    mov eax, 0x23
    mov ebx, 52
    mov ecx, 15
    call print_char
    mov eax, 0x3d
    mov ebx, 82
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 84
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 88
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 90
    mov ecx, 26
    call print_char
    mov eax, 0x7e
    mov ebx, 142
    mov ecx, 9
    call print_char
    mov esi, 0xd20
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 6
    call print_char
    mov eax, 0x2c
    mov ebx, 12
    mov ecx, 7
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x7e
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 38
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 42
    mov ecx, 2
    call print_char
    mov eax, 0x2b
    mov ebx, 46
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 56
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 58
    mov ecx, 31
    call print_char
    mov eax, 0x3d
    mov ebx, 120
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 122
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 132
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 134
    mov ecx, 4
    call print_char
    mov eax, 0x7e
    mov ebx, 142
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 144
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 146
    mov ecx, 7
    call print_char
    mov esi, 0xdc0
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 8
    call print_char
    mov eax, 0x7e
    mov ebx, 16
    mov ecx, 11
    call print_char
    mov eax, 0x3a
    mov ebx, 38
    mov ecx, 2
    call print_char
    mov eax, 0x2c
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 44
    mov ecx, 6
    call print_char
    mov eax, 0x3d
    mov ebx, 56
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 58
    mov ecx, 30
    call print_char
    mov eax, 0x3d
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 120
    mov ecx, 7
    call print_char
    mov eax, 0x3d
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 136
    mov ecx, 3
    call print_char
    mov eax, 0x3d
    mov ebx, 142
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 144
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 146
    mov ecx, 7
    call print_char
    mov esi, 0xe60
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 13
    call print_char
    mov eax, 0x7e
    mov ebx, 26
    mov ecx, 3
    call print_char
    mov eax, 0x3a
    mov ebx, 32
    mov ecx, 4
    call print_char
    mov eax, 0x2c
    mov ebx, 40
    mov ecx, 2
    call print_char
    mov eax, 0x2b
    mov ebx, 44
    mov ecx, 6
    call print_char
    mov eax, 0x3d
    mov ebx, 56
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 58
    mov ecx, 12
    call print_char
    mov eax, 0x3d
    mov ebx, 82
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 84
    mov ecx, 3
    call print_char
    mov eax, 0x2b
    mov ebx, 90
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 94
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 96
    mov ecx, 11
    call print_char
    mov eax, 0x3d
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 120
    mov ecx, 7
    call print_char
    mov eax, 0x3d
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 136
    mov ecx, 4
    call print_char
    mov eax, 0x7e
    mov ebx, 144
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 146
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 152
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 154
    mov ecx, 3
    call print_char
    mov esi, 0xf00
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 18
    call print_char
    mov eax, 0x7e
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 38
    mov ecx, 1
    call print_char
    mov eax, 0x2c
    mov ebx, 40
    mov ecx, 2
    call print_char
    mov eax, 0x3d
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 46
    mov ecx, 4
    call print_char
    mov eax, 0x3d
    mov ebx, 54
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 56
    mov ecx, 11
    call print_char
    mov eax, 0x3d
    mov ebx, 78
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 80
    mov ecx, 3
    call print_char
    mov eax, 0x2b
    mov ebx, 86
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 96
    mov ecx, 2
    call print_char
    mov eax, 0x23
    mov ebx, 100
    mov ecx, 9
    call print_char
    mov eax, 0x3d
    mov ebx, 118
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 120
    mov ecx, 7
    call print_char
    mov eax, 0x3d
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 136
    mov ecx, 4
    call print_char
    mov eax, 0x3d
    mov ebx, 144
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 146
    mov ecx, 7
    call print_char
    mov esi, 0xfa0
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 19
    call print_char
    mov eax, 0x2c
    mov ebx, 38
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 46
    mov ecx, 4
    call print_char
    mov eax, 0x23
    mov ebx, 54
    mov ecx, 12
    call print_char
    mov eax, 0x3d
    mov ebx, 78
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 80
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 82
    mov ecx, 8
    call print_char
    mov eax, 0x3d
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 100
    mov ecx, 10
    call print_char
    mov eax, 0x3d
    mov ebx, 120
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 122
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 132
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 134
    mov ecx, 6
    call print_char
    mov eax, 0x3a
    mov ebx, 146
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 158
    mov ecx, 1
    call print_char
    mov esi, 0x1040
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 19
    call print_char
    mov eax, 0x2c
    mov ebx, 38
    mov ecx, 2
    call print_char
    mov eax, 0x7e
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 44
    mov ecx, 17
    call print_char
    mov eax, 0x3d
    mov ebx, 78
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 80
    mov ecx, 9
    call print_char
    mov eax, 0x3d
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 100
    mov ecx, 23
    call print_char
    mov eax, 0x3d
    mov ebx, 146
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 148
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 5
    call print_char
    mov esi, 0x10e0
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 20
    call print_char
    mov eax, 0x2c
    mov ebx, 40
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x3d
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 46
    mov ecx, 17
    call print_char
    mov eax, 0x3d
    mov ebx, 80
    mov ecx, 1
    call print_char
    mov eax, 0x2b
    mov ebx, 82
    mov ecx, 8
    call print_char
    mov eax, 0x3d
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 100
    mov ecx, 24
    call print_char
    mov eax, 0x3a
    mov ebx, 148
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 158
    mov ecx, 1
    call print_char
    mov esi, 0x1180
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 3
    call print_char
    mov eax, 0x7e
    mov ebx, 6
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 5
    call print_char
    mov eax, 0x7e
    mov ebx, 20
    mov ecx, 10
    call print_char
    mov eax, 0x3a
    mov ebx, 40
    mov ecx, 3
    call print_char
    mov eax, 0x23
    mov ebx, 46
    mov ecx, 19
    call print_char
    mov eax, 0x3d
    mov ebx, 84
    mov ecx, 2
    call print_char
    mov eax, 0x2b
    mov ebx, 88
    mov ecx, 3
    call print_char
    mov eax, 0x3d
    mov ebx, 94
    mov ecx, 2
    call print_char
    mov eax, 0x23
    mov ebx, 98
    mov ecx, 25
    call print_char
    mov eax, 0x7e
    mov ebx, 148
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 150
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 152
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 154
    mov ecx, 3
    call print_char
    mov esi, 0x1220
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 3
    call print_char
    mov eax, 0x7e
    mov ebx, 6
    mov ecx, 19
    call print_char
    mov eax, 0x3a
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x7e
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 48
    mov ecx, 50
    call print_char
    mov eax, 0x3d
    mov ebx, 148
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 150
    mov ecx, 5
    call print_char
    mov esi, 0x12c0
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 8
    call print_char
    mov eax, 0x7e
    mov ebx, 16
    mov ecx, 11
    call print_char
    mov eax, 0x3a
    mov ebx, 38
    mov ecx, 5
    call print_char
    mov eax, 0x3d
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 50
    mov ecx, 50
    call print_char
    mov eax, 0x3a
    mov ebx, 150
    mov ecx, 5
    call print_char
    mov esi, 0x1360
    mov eax, 0x3a
    mov ebx, 0
    mov ecx, 12
    call print_char
    mov eax, 0x7e
    mov ebx, 24
    mov ecx, 7
    call print_char
    mov eax, 0x3a
    mov ebx, 38
    mov ecx, 5
    call print_char
    mov eax, 0x7e
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x23
    mov ebx, 50
    mov ecx, 50
    call print_char
    mov eax, 0x7e
    mov ebx, 150
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 152
    mov ecx, 4
    call print_char
    ret

print_char:
    mov byte [gs:esi+ebx], al
    inc ebx
    mov byte [gs:esi+ebx], 0xe
    inc ebx
    dec ecx
    cmp ecx, 0x0
    jne print_char
    ret