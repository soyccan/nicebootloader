%include "boot.inc"
extern RSA_decrypt
extern print_error
extern print_success

LOADER_STACK_TOP equ LOADER_BASE_ADDR

;--------GDT 相關常數--------
GDT_SIZE    equ  GDT_END-GDT_BASE
GDT_LIMIT   equ  GDT_SIZE-1

;--------記憶體大小記錄在 0x510--------
total_mem_bytes equ 0x510


[BITS 16]
;以16位元指令的格式組譯指令

;--------列印字串--------
    mov sp, LOADER_BASE_ADDR
    mov si, color
    mov cx, 5
    boot_animate_loop:
        push cx
        mov bp, loadermsg
        ; 10 frame animate
        mov cx, 10
        boot_animate:
            push cx

            ;clear
            ;後來決的不clear比較好
            ; mov ax, 0x600
            ; mov bx, 0x700
            ; mov cx, 0
            ; mov dx, 0x184f
            ; int 0x10

            push bp
            mov ax, 0x1301  ;print and move cursor 
            mov bx, 0x000f  ;black background, white char
            mov dx, 0x1800 ;row, column
            mov cx, 52  ;length
            mov bp, blank_line
            int 0x10
            int 0x10
            int 0x10
            int 0x10
            pop bp

            mov bh, 0       ; page 0
            mov bl, [si]    ; color
            add si, 1
            mov cx,19   ;loop time
            print_boot_img:
                push cx
                mov cx, 52  ;length
                int 0x10
                add bp,52
                pop cx
                loop print_boot_img

            mov ah, 86h
            xor dx,dx
            mov cx,10  
            int 0x15    ;等待 cx/dx 微秒
            pop cx
            loop boot_animate
        pop cx
        loop boot_animate_loop

;--------e820 get memory size--------
    mov bx, 0x001f
    xor ebx, ebx
    mov edx, 0x534d4150
    mov di, ards_buf
    e820_mem_get_loop:
        mov eax, 0x0000e820
        mov ecx, 20
        int 0x15
        jc  e820_failed_try_e801

        add di, cx
        inc word [ards_nr]
        cmp ebx, 0
        jnz e820_mem_get_loop

    mov cx, [ards_nr]
    mov ebx, ards_buf - 20
    xor edx, edx
    find_max_mem_area:
        add ebx, 20
        mov eax, [ebx+8]
        cmp edx, eax
        jge next_ards
        cmp dword [ebx+16], 1
        jne next_ards
        mov edx, eax
    next_ards:
        loop find_max_mem_area
    jmp  mem_get_ok
;--------e801 get memory size--------
e820_failed_try_e801:
    mov ax, 0xe801
    int 0x15
    jc  e801_failed_go_88
;below 15MB
    mov cx, 0x400
    mul cx
    shl edx, 16
    and eax, 0x0000ffff
    or edx, eax
    add edx, 0x100000
    mov esi, edx
;above 16MB
    xor eax, eax
    mov ax, bx
    mov ecx, 0x10000
    mul ecx

    add esi, eax
    mov edx, esi
    jmp mem_get_ok
;--------0x88 get memory size--------
e801_failed_go_88:
    mov ah, 0x99
    int 0x15
    jc error_hlt
    and eax, 0x0000ffff
    mov cx, 0x400
    mul cx
    shl edx, 16
    or  edx, eax
    add edx, 0x100000

;儲存得到的記憶體資訊
mem_get_ok:
    mov [total_mem_bytes], edx

;--------進入保護模式--------
;1. 開啟 A20 位址線
;2. 讀取 Global Descriptor Table
;3. set cr0 暫存器的 PE 位

;==1==
    in  al, 0x92
    or  al, 10b
    out 0x92, al
;==2==
    lgdt    [gdt_ptr]
;==3==
    mov eax, cr0
    or  eax, 1
    mov cr0, eax

;用 far jump 來設定段暫存器，使之為保護模式下的選擇子
;且清空 pipeline，避免執行解碼錯誤的指令(真實模式下 GDTR 只使用低20位，其他位為0，D 位會是0，造成把 32bit 指令解碼為 16bit 指令)
    jmp dword SELECTOR_CODE:p_mode_start

[BITS 32]
;以32位元指令的格式組譯指令

p_mode_start:
;初始化段暫存器
    mov ax, SELECTOR_DATA
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov esp, LOADER_STACK_TOP
    mov ax, SELECTOR_VIDEO
    mov gs, ax
;顯示 P
    ; mov byte [gs:160], 'P'
;--------載入 kernel--------
    mov ax, KERNEL_START_SECTOR
    mov bx, KERNEL_BASE_ADDR
    mov cx, 20

    call read_disk

;--------啟用分頁機制--------
;1. 設定好 Page Directory，Page Table
;2. 把分頁位址放進控制暫存器 cr3（Page Directory Base Register，PDBR）
;3. set cr0 暫存器的 PG 位

;==1==
    call setup_page
;要修改選擇子，否則開啟分頁後會找錯實體位址
    sgdt [gdt_ptr]

    mov ebx, [gdt_ptr + 2]
    or dword [ebx + 0x18 + 4], 0xc0000000

    add dword [gdt_ptr + 2], 0xc0000000

;==2==
    mov eax, PAGE_DIR_TABLE_POS
    mov cr3, eax
;==3==
    mov eax, cr0
    or eax, 0x80000000
    mov cr0, eax
;重新讀取分頁下的 gdt
    lgdt [gdt_ptr]
;show a V
    ; mov byte[gs:160], 'V'
;kernel stack
    mov esp, 0xc009f000
    jmp 0xc0000000 | KERNEL_BASE_ADDR
error_hlt:
    call print_error
    jmp $

read_disk:
;--------------------------------
;從硬碟載入到記憶體
;ax:LBA 編號，bx: 載入位址, cx: 載入 block 數
;--------------------------------
    mov esi, eax
    mov di, cx

    mov dx, 0x1f2
    mov al, cl
    out dx, al

    mov eax, esi

    mov dx, 0x1f3
    out dx, al

    mov cl, 8
    shr eax, cl
    mov dx, 0x1f4
    out dx, al

    shr eax, cl
    mov dx, 0x1f5
    out dx, al

    shr eax, cl
    and al, 0x0f    ;24~27 bits for lba
    or  al, 0xe0    ;lba mode
    mov dx, 0x1f6
    out dx, al

    mov dx, 0x1f7
    mov al, 0x20    ;0x20 is read
    out dx, al

    not_ready:
        nop
        in al, dx
        and al, 0x88
        cmp al, 0x08
        jnz not_ready

    mov ax, di
    mov dx, 256
    mul dx
    mov cx, ax
    mov dx, 0x1f0

    push edi

    ;0x7bd
    go_on_read:
        in ax, dx
        mov [bx], ax
        add bx, 2
        loop go_on_read

    mov si, KERNEL_BASE_ADDR
    add si, 9216 ; si = KERNEL_BASE_ADDR + 512 * 18 = kernel size addr
    mov ecx, dword[si] ; ecx = kernel size

    ; djb2 hash initial value
    mov edi, 5381
    mov si, KERNEL_BASE_ADDR
    djb2_hash:
        mov dl, byte[si]
        
        mov ebx, edi
        sal edi, 5
        add edi, ebx    ; edi = edi * 33
        movzx edx, dl
        add edi, edx    ; edi = edi + al

        add si, 1
        loop djb2_hash

    ; 0x7f3
    mov edx, 0
    mov eax, edi
    mov ecx, 4294049777
    div ecx  ; edx = edi % 4294049777
    ;djb2 hash end
    
    mov ecx, edx ; ecx = hash

    pop edi
    ; TODO: our checkpoint
    mov bx, KERNEL_BASE_ADDR
    mov dx, 8704
    add bx, dx ; bx = KERNEL_ADDR + 17 * 512 = ENCRYPT_HASH_ADDR

    ;0x802
    mov eax, DWORD [bx] ; eax =  ENCRYPT_HASH
    push ecx

    ; call decrypt function (eax)
    push eax
    call RSA_decrypt    ;eax = decrypt(eax)
    pop ecx
    pop ecx
    cmp eax, ecx
    jne error_hlt
    call print_success
    ret


setup_page:
;--------------------------------
;設定 PDE，PTE
;--------------------------------
;每個 PDE 佔 4byte，共 1k 項，要清空 4096byte 的空間
    mov ecx, 1024
    mov esi, 0
    clear_page_dir:
        mov dword [PAGE_DIR_TABLE_POS + esi*4], 0
        inc esi
        loop clear_page_dir
;我們將 PDE PTE 連續放置，所以 PAGE_DIR_TABLE_POS + 0x1000 是第一個 PTE
create_pde:
    mov eax, PAGE_DIR_TABLE_POS
    add eax, 0x1000
    mov ebx, eax
    or eax, PG_US_U | PG_RW_W | PG_P
;讓分頁目錄項的 0x0（第0項）、0xc00（第768項）都存第一分頁的位址
    mov [PAGE_DIR_TABLE_POS + 0x0], eax
    mov [PAGE_DIR_TABLE_POS + 0xc00], eax
;讓分頁目錄表的最後一項指向 PAGE_DIR_TABLE_POS
    sub eax, 0x1000
    mov [PAGE_DIR_TABLE_POS + 4092], eax

;每個 PTE 表 4k 實體對應，1M／4k＝256
    mov ecx, 256
    mov esi, 0
    mov edx, PG_US_U | PG_RW_W | PG_P
create_pte:
    mov [ebx+esi*4], edx
    add edx, 4096
    inc esi
    loop create_pte

    mov eax, PAGE_DIR_TABLE_POS
    add eax, 0x2000
    or eax,  PG_US_U | PG_RW_W | PG_P
    mov ebx, PAGE_DIR_TABLE_POS
    mov ecx, 254
    mov esi, 769
create_kernel_pde:
    mov [ebx+esi*4], eax
    inc esi
    add eax, 0x1000
    loop create_kernel_pde
    ret


;--------GDT--------
;第0個不可用
GDT_BASE:
    dd 0x00000000
    dd 0x00000000

;平坦模型下的 cs
GDT_DESC:
    dd 0x0000ffff
    dd DESC_CODE_HIGH4

;平坦模型下的 ds，ss
DATA_STACK_DESC:
    dd  0x0000ffff
    dd  DESC_DATA_HIGH4

;文字模式顯卡的記憶體位置 0xb8000~0xbffff ,((0xbffff-0xb8000)+1)/4-1 = 7
VIDEO_DESC:
    dd  0x80000007
    dd  DESC_VIDEO_HIGH4

GDT_END:

gdt_ptr:
    dw  GDT_LIMIT
    dd  GDT_BASE

;Address Range Descriptor Structure
ards_buf times 200 db 0
ards_nr dw 0

loadermsg:
db `                         .cccc;;cc;\';c.            \n`
db `                      .,:dkdc:;;:c:,:d:.           \n`
db `                     .loc\'.,cc::c:::,..;:.         \n`
db `                   .cl;....;dkdccc::,...c;         \n`
db `                  .c:,\';:\'..ckc\',;::;....;c.       \n`
db `                .c:\'.,dkkoc:ok:;llllc,,c,\';:.      \n`
db `               .;c,\';okkkkkkkk:;lllll,:kd;.;:,.    \n`
db `               co..:kkkkkkkkkk:;llllc\':kkc..oNc    \n`
db `             .cl;.,oxkkkkkkkkkc,:cll;,okkc\'.cO;    \n`
db `             ;k:..ckkkkkkkkkkkl..,;,.;xkko:\',l\'    \n`
db `            .,...\';dkkkkkkkkkkd;.....ckkkl\'.cO;    \n`
db `         .,,:,.;oo:ckkkkkkkkkkkdoc;;cdkkkc..cd,    \n`
db `      .cclo;,ccdkkl;llccdkkkkkkkkkkkkkkkd,.c;      \n`
db `     .lol:;;okkkkkxooc::coodkkkkkkkkkkkko\'.oc      \n`
db `   .c:\'..lkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkd,.oc      \n`
db `  .lo;,:cdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkd,.c;      \n`
db `,dx:..;lllllllllllllllllllllllllllllllllc\'...      \n`
db `cNO;........................................       \n`
db `                                                   \n`
db `                .ckx;\'........\':c.                 \n`
db `             .,:c:::::oxxocoo::::,\',.              \n`
db `            .odc\'..:lkkoolllllo;..;d,              \n`
db `            ;c..:o:..;:..\',;\'.......;.             \n`
db `           ,c..:0Xx::o:.,cllc:,\'::,.,c.            \n`
db `           ;c;lkXKXXXXl.;lllll;lKXOo;\':c.          \n`
db `         ,dc.oXXXXXXXXl.,lllll;lXXXXx,c0:          \n`
db `         ;Oc.oXXXXXXXXo.\':ll:;\'oXXXXO;,l\'          \n`
db `         \'l;;kXXXXXXXXd\'.\'::\'..dXXXXO;,l\'          \n`
db `         \'l;:0XXXXXXXX0x:...,:o0XXXXx,:x,          \n`
db `         \'l;;kXXXXXXXXXKkol;oXXXXXXXO;oNc          \n`
db `        ,c\'..ckk0XXXXXXXXXX00XXXXXXX0:;o:.         \n`
db `      .\':;..:do::ooookXXXXXXXXXXXXXXXo..c;         \n`
db `    .\',\',:co0XX0kkkxxOXXXXXXXXXXXXXXXOc..;l.       \n`
db `  .:;\'..oXXXXXXXXXXXXXXXXXXXXXXXXXXXXXko;\';:.      \n`
db `.ldc..:oOXKXXXXXXKXXKXXXXXXXXXXXXXXXXXXXo..oc      \n`
db `:0o...:dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo,.:,      \n`
db `cNo........................................;\'      \n`
db `                                                   \n`
db `            .cc;.  ...  .;c.                       \n`
db `         .,,cc:cc:lxxxl:ccc:;,.                    \n`
db `        .lo;...lKKklllookl..cO;                    \n`
db `      .cl;.,:\'.okl;..\'\'.;,..\';:.                   \n`
db `     .:o;;dkd,.ll..,cc::,..,\'.;:,.                 \n`
db `     co..lKKKkokl.\':lloo;\'\'ol..;dl.                \n`
db `   .,c;.,xKKKKKKo.\':llll;.\'oOxl,.cl,.              \n`
db `   cNo..lKKKKKKKo\'\';llll;;okKKKl..oNc              \n`
db `   cNo..lKKKKKKKko;\':c:,\'lKKKKKo\'.oNc              \n`
db `   cNo..lKKKKKKKKKl.....\'dKKKKKxc,l0:              \n`
db `   .c:\'.lKKKKKKKKKk;....lKKKKKKo\'.oNc              \n`
db `     ,:.\'oxOKKKKKKKOxxxxOKKKKKKxc,;ol:.            \n`
db `     ;c..\'\':oookKKKKKKKKKKKKKKKKKk:.\'clc.          \n`
db `   ,xl\'.,oxo;\'\';oxOKKKKKKKKKKKKKKKOxxl:::;,.       \n`
db `  .dOc..lKKKkoooookKKKKKKKKKKKKKKKKKKKxl,;ol.      \n`
db `  cx,\';okKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKl..;lc.    \n`
db `  co..:dddddddddddddddddddddddddddddddddl::\',::.   \n`
db `  co...........................................    \n`
db `                                                   \n`
db `           .ccccccc.                               \n`
db `      .,,,;cooolccoo;;,,.                          \n`
db `     .dOx;..;lllll;..;xOd.                         \n`
db `   .cdo;\',loOXXXXXkll;\';odc.                       \n`
db `  ,ol:;c,\':oko:cccccc,...ckl.                      \n`
db `  ;c.;kXo..::..;c::\'.......oc                      \n`
db `,dc..oXX0kk0o.\':lll;..cxxc.,ld,                    \n`
db `kNo.\'oXXXXXXo\',:lll;..oXXOo;cOd.                   \n`
db `KOc;oOXXXXXXo.\':lol;..dXXXXl\';xc                   \n`
db `Ol,:k0XXXXXX0c.,clc\'.:0XXXXx,.oc                   \n`
db `KOc;dOXXXXXXXl..\';\'..lXXXXXo..oc                   \n`
db `dNo..oXXXXXXXOx:..\'lxOXXXXXk,.:; ..                \n`
db `cNo..lXXXXXXXXXOolkXXXXXXXXXkl,..;:\';.             \n`
db `.,;\'.,dkkkkk0XXXXXXXXXXXXXXXXXOxxl;,;,;l:.         \n`
db `  ;c.;:\'\'\'\'\':doOXXXXXXXXXXXXXXXXXXOdo;\';clc.       \n`
db `  ;c.lOdood:\'\'\'oXXXXXXXXXXXXXXXXXXXXXk,..;ol.      \n`
db `  \';.:xxxxxocccoxxxxxxxxxxxxxxxxxxxxxxl::\'.\';;.    \n`
db `  \';........................................;l\'    \n`
db `                                                   \n`
db `                                                   \n`
db `        .;:;;,.,;;::,.                             \n`
db `     .;\':;........\'co:.                            \n`
db `   .clc;\'\':cllllc::,.\':c.                          \n`
db `  .lo;;o:coxdllllllc;\'\'::,,.                       \n`
db `.c:\'.,cl,.\'l:\',,;;\'......cO;                       \n`
db `do;\';oxoc;:l;;llllc\'.\';;\'.,;.                      \n`
db `c..ckkkkkkkd,;llllc\'.:kkd;.\':c.                    \n`
db `\'.,okkkkkkkkc;lllll,.:kkkdl,cO;                    \n`
db `..;xkkkkkkkkc,ccll:,;okkkkk:,co,                   \n`
db `..,dkkkkkkkkc..,;,\'ckkkkkkkc;ll.                   \n`
db `..\'okkkkkkkko,....\'okkkkkkkc,:c.                   \n`
db `c..ckkkkkkkkkdl;,:okkkkkkkkd,.\',\';.                \n`
db `d..\':lxkkkkkkkkxxkkkkkkkkkkkdoc;,;\'..\'.,.          \n`
db `o...\'\';llllldkkkkkkkkkkkkkkkkkkdll;..\'cdo.         \n`
db `o..,l;\'\'\'\'\'\';dkkkkkkkkkkkkkkkkkkkkdlc,..;lc.       \n`
db `o..;lc;;;;;;,,;clllllllllllllllllllllc\'..,:c.      \n`
db `o..........................................;\'      \n`
db `                                                   \n`
db `                                                   \n`
db `           .,,,,,,,,,.                             \n`
db `         .ckKxodooxOOdcc.                          \n`
db `      .cclooc\'....\';;cool.                         \n`
db `     .loc;;;;clllllc;;;;;:;,.                      \n`
db `   .c:\'.,okd;;cdo:::::cl,..oc                      \n`
db `  .:o;\';okkx;\';;,\';::;\'....,:,.                    \n`
db `  co..ckkkkkddkc,cclll;.,c:,:o:.                   \n`
db `  co..ckkkkkkkk:,cllll;.:kkd,.\':c.                 \n`
db `.,:;.,okkkkkkkk:,cclll;.ckkkdl;;o:.                \n`
db `cNo..ckkkkkkkkko,.;loc,.ckkkkkc..oc                \n`
db `,dd;.:kkkkkkkkkx;..;:,.\'lkkkkko,.:,                \n`
db `  ;:.ckkkkkkkkkkc.....;ldkkkkkk:.,\'                \n`
db `,dc..\'okkkkkkkkkxoc;;cxkkkkkkkkc..,;,.             \n`
db `kNo..\':lllllldkkkkkkkkkkkkkkkkkdcc,.;l.            \n`
db `KOc,c;\'\'\'\'\'\'\';lldkkkkkkkkkkkkkkkkkc..;lc.          \n`
db `xx:\':;;;;,.,,...,;;cllllllllllllllc;\'.;od,         \n`
db `cNo.....................................oc         \n`
db `                                                   \n`
db `                                                   \n`
db `                                                   \n`
db `                   .ccccccc.                       \n`
db `               .ccckNKOOOOkdcc.                    \n`
db `            .;;cc:ccccccc:,:c::,,.                 \n`
db `         .c;:;.,cccllxOOOxlllc,;ol.                \n`
db `        .lkc,coxo:;oOOxooooooo;..:,                \n`
db `      .cdc.,dOOOc..cOd,.\',,;\'....\':l.              \n`
db `      cNx\'.lOOOOxlldOc..;lll;.....cO;              \n`
db `     ,do;,:dOOOOOOOOOl\'\':lll;..:d:\'\'c,             \n`
db `     co..lOOOOOOOOOOOl\'\':lll;.\'lOd,.cd.            \n`
db `     co.\'dOOOOOOOOOOOo,.;llc,.,dOOc..dc            \n`
db `     co..lOOOOOOOOOOOOc.\';:,..cOOOl..oc            \n`
db `   .,:;.\'::lxOOOOOOOOOo:\'...,:oOOOc.\'dc            \n`
db `   ;Oc..cl\'\':lldOOOOOOOOdcclxOOOOx,.cd.            \n`
db `  .:;\';lxl\'\'\'\'\':lldOOOOOOOOOOOOOOc..oc             \n`
db `,dl,.\'cooc:::,....,::coooooooooooc\'.c:             \n`
db `cNo.................................oc             \n`
db `                                                   \n`
db `                                                   \n`
db `                                                   \n`
db `                                                   \n`
db `                        .cccccccc.                 \n`
db `                  .,,,;;cc:cccccc:;;,.             \n`
db `                .cdxo;..,::cccc::,..;l.            \n`
db `               ,do:,,:c:coxxdllll:;,\';:,.          \n`
db `             .cl;.,oxxc\'.,cc,.\';;;\'...oNc          \n`
db `             ;Oc..cxxxc\'.,c;..;lll;...cO;          \n`
db `           .;;\',:ldxxxdoldxc..;lll:\'...\'c,         \n`
db `           ;c..cxxxxkxxkxxxc\'.;lll:\'\',\'.cdc.       \n`
db `         .c;.;odxxxxxxxxxxxd;.,cll;.,l:.\'dNc       \n`
db `        .:,\'\'ccoxkxxkxxxxxxx:..,:;\'.:xc..oNc       \n`
db `      .lc,.\'lc\':dxxxkxxxxxxxol,...\',lx:..dNc       \n`
db `     .:,\',coxoc;;ccccoxxxxxxxxo:::oxxo,.cdc.       \n`
db `  .;\':;.\'oxxxxxc\'\'\'\'\';cccoxxxxxxxxxxxc..oc         \n`
db `,do:\'..,:llllll:;;;;;;,..,;:lllllllll;..oc         \n`
db `cNo.....................................oc         \n`
db `                                                   \n`
db `                                                   \n`
db `                                                   \n`
db `                              .ccccc.              \n`
db `                         .cc;\'coooxkl;.            \n`
db `                     .:c:::c:,,,,,;c;;,.\'.         \n`
db `                   .clc,\',:,..:xxocc;\'..c;         \n`
db `                  .c:,\';:ox:..:c,,,,,,...cd,       \n`
db `                .c:\'.,oxxxxl::l:.,loll;..;ol.      \n`
db `                ;Oc..:xxxxxxxxx:.,llll,....oc      \n`
db `             .,;,\',:loxxxxxxxxx:.,llll;.,,.\'ld,    \n`
db `            .lo;..:xxxxxxxxxxxx:.\'cllc,.:l:\'cO;    \n`
db `           .:;...\'cxxxxxxxxxxxxoc;,::,..cdl;;l\'    \n`
db `         .cl;\':,\'\';oxxxxxxdxxxxxx:....,cooc,cO;    \n`
db `     .,,,::;,lxoc:,,:lxxxxxxxxxxxo:,,;lxxl;\'oNc    \n`
db `   .cdxo;\':lxxxxxxc\'\';cccccoxxxxxxxxxxxxo,.;lc.    \n`
db `  .loc\'.\'lxxxxxxxxocc;\'\'\'\'\';ccoxxxxxxxxx:..oc      \n`
db `olc,..\',:cccccccccccc:;;;;;;;;:ccccccccc,.\'c,      \n`
db `Ol;......................................;l\'       \n`
db `                                                   \n`
db `                                                   \n`
db `                              ,ddoodd,             \n`
db `                         .cc\' ,ooccoo,\'cc.         \n`
db `                      .ccldo;...\',,...;oxdc.       \n`
db `                   .,,:cc;.,\'..;lol;;,\'..lkl.      \n`
db `                  .dOc\';:ccl;..;dl,.\'\'.....oc      \n`
db `                .,lc\',cdddddlccld;.,;c::\'..,cc:.   \n`
db `                cNo..:ddddddddddd;\':clll;,c,\';xc   \n`
db `               .lo;,clddddddddddd;\':clll;:kc..;\'   \n`
db `             .,c;..:ddddddddddddd:\';clll,;ll,..    \n`
db `             ;Oc..\';:ldddddddddddl,.,c:;\';dd;..    \n`
db `           .\'\'\',:c:,\'cdddddddddddo:,\'\'..\'cdd;..    \n`
db `         .cdc\';lddd:\';lddddddddddddd;.\';lddl,..    \n`
db `      .,;::;,cdddddol;;lllllodddddddlcldddd:.\'l;   \n`
db `     .dOc..,lddddddddlcc:;\'\';cclddddddddddd;;ll.   \n`
db `   .coc,;::ldddddddddddddlcccc:ldddddddddl:,cO;    \n`
db `,xl::,..,cccccccccccccccccccccccccccccccc:;\':xx,   \n`
db `cNd.........................................;lOc   \n`
db `                                                   \n`

blank_line:
db `                                                   \n`

color:
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB
db 0xE, 0x9, 0xA, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0xF, 0x2, 0xE, 0xD, 0x9, 0xC, 0xB


