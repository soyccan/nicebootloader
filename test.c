#include <linux/module.h>
extern long long foo(){
    long long x = 1, y = 1007516271, b = 2732493731;  
    while (b > 0) {
        if (b % 2 == 1)            
            x = (x * y) % 4294049777;                       
        y = (y * y) % 4294049777;
        b /= 2;
        }                        
    long long descrypt = x % 4294049777;   
    return descrypt;
}
