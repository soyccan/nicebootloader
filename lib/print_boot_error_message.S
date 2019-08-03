global print_error

print_error:
    mov esi, 0x1e0
    mov esi, 0x280
    mov eax, 0x51
    mov ebx, 10
    mov ecx, 9
    call print_char
    mov eax, 0x41
    mov ebx, 68
    mov ecx, 3
    call print_char
    mov eax, 0x51
    mov ebx, 108
    mov ecx, 9
    call print_char
    mov esi, 0x320
    mov eax, 0x51
    mov ebx, 6
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 9
    call print_char
    mov eax, 0x51
    mov ebx, 28
    mov ecx, 2
    call print_char
    mov eax, 0x41
    mov ebx, 66
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 68
    mov ecx, 3
    call print_char
    mov eax, 0x41
    mov ebx, 74
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 104
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 108
    mov ecx, 9
    call print_char
    mov eax, 0x51
    mov ebx, 126
    mov ecx, 2
    call print_char
    mov esi, 0x3c0
    mov eax, 0x51
    mov ebx, 2
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 6
    mov ecx, 13
    call print_char
    mov eax, 0x51
    mov ebx, 32
    mov ecx, 2
    call print_char
    mov eax, 0x41
    mov ebx, 64
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 66
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 76
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 100
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 104
    mov ecx, 13
    call print_char
    mov eax, 0x51
    mov ebx, 130
    mov ecx, 2
    call print_char
    mov esi, 0x460
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 16
    mov ecx, 3
    call print_char
    mov eax, 0x3a
    mov ebx, 22
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 62
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 64
    mov ecx, 7
    call print_char
    mov eax, 0x41
    mov ebx, 78
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 114
    mov ecx, 3
    call print_char
    mov eax, 0x3a
    mov ebx, 120
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x500
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 6
    call print_char
    mov eax, 0x4f
    mov ebx, 14
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 22
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 24
    mov ecx, 6
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 60
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 62
    mov ecx, 9
    call print_char
    mov eax, 0x41
    mov ebx, 80
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 6
    call print_char
    mov eax, 0x4f
    mov ebx, 112
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 120
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 122
    mov ecx, 6
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x5a0
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 24
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 58
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 60
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 70
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 72
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 82
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 122
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x640
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 24
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 56
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 58
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 68
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 72
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 74
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 84
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 122
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x6e0
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 24
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 54
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 56
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 66
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 74
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 76
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 86
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 122
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x780
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 24
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 52
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 54
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 64
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 76
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 78
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 88
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 122
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x820
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 24
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 50
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 52
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 62
    mov ecx, 9
    call print_char
    mov eax, 0x3a
    mov ebx, 80
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 90
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 122
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x8c0
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 12
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 18
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 48
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 50
    mov ecx, 21
    call print_char
    mov eax, 0x41
    mov ebx, 92
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 5
    call print_char
    mov eax, 0x4f
    mov ebx, 110
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 116
    mov ecx, 4
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0x960
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 6
    call print_char
    mov eax, 0x4f
    mov ebx, 14
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 18
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 20
    mov ecx, 8
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 46
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 48
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 58
    mov ecx, 13
    call print_char
    mov eax, 0x3a
    mov ebx, 84
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 94
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 6
    call print_char
    mov eax, 0x4f
    mov ebx, 112
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 116
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 118
    mov ecx, 8
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0xa00
    mov eax, 0x51
    mov ebx, 0
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 2
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 16
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 20
    mov ecx, 8
    call print_char
    mov eax, 0x51
    mov ebx, 36
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 44
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 46
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 56
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 84
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 86
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 96
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 100
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 114
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 118
    mov ecx, 8
    call print_char
    mov eax, 0x51
    mov ebx, 134
    mov ecx, 1
    call print_char
    mov esi, 0xaa0
    mov eax, 0x51
    mov ebx, 2
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 6
    mov ecx, 14
    call print_char
    mov eax, 0x51
    mov ebx, 34
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 42
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 44
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 54
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 86
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 88
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 98
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 100
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 104
    mov ecx, 14
    call print_char
    mov eax, 0x51
    mov ebx, 132
    mov ecx, 1
    call print_char
    mov esi, 0xb40
    mov eax, 0x51
    mov ebx, 6
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 10
    mov ecx, 11
    call print_char
    mov eax, 0x51
    mov ebx, 32
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 40
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 42
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 52
    mov ecx, 1
    call print_char
    mov eax, 0x41
    mov ebx, 88
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 90
    mov ecx, 5
    call print_char
    mov eax, 0x41
    mov ebx, 100
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 104
    mov ecx, 2
    call print_char
    mov eax, 0x3a
    mov ebx, 108
    mov ecx, 11
    call print_char
    mov eax, 0x51
    mov ebx, 130
    mov ecx, 1
    call print_char
    mov esi, 0xbe0
    mov eax, 0x51
    mov ebx, 10
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 26
    mov ecx, 4
    call print_char
    mov eax, 0x51
    mov ebx, 34
    mov ecx, 2
    call print_char
    mov eax, 0x41
    mov ebx, 38
    mov ecx, 7
    call print_char
    mov eax, 0x41
    mov ebx, 90
    mov ecx, 7
    call print_char
    mov eax, 0x51
    mov ebx, 108
    mov ecx, 8
    call print_char
    mov eax, 0x3a
    mov ebx, 124
    mov ecx, 4
    call print_char
    mov eax, 0x51
    mov ebx, 132
    mov ecx, 2
    call print_char
    mov esi, 0xc80
    mov eax, 0x51
    mov ebx, 26
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 28
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 38
    mov ecx, 1
    call print_char
    mov eax, 0x51
    mov ebx, 124
    mov ecx, 1
    call print_char
    mov eax, 0x3a
    mov ebx, 126
    mov ecx, 5
    call print_char
    mov eax, 0x51
    mov ebx, 136
    mov ecx, 1
    call print_char
    mov esi, 0xd20
    mov eax, 0x51
    mov ebx, 28
    mov ecx, 6
    call print_char
    mov eax, 0x51
    mov ebx, 126
    mov ecx, 6
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