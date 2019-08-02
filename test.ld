SECTIONS {
    .text 0x0 :
    {
        build/loader.elf
        build/test.o (.text)
    }
}
