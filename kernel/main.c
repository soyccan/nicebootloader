#include "print.h"

void _start(){
    put_str("\r\nSuccess boot !!!");
    while(1){
        asm("hlt");
    };
}
