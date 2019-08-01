extern unsigned long long foo(){
    /* unsigned long long x = 1, y = 1007516271, b = 2732493731;  
     * while (b > 0) {
     *     if (b % 2 == 1)            
     *         x = (x * y) % 4294049777;                       
     *     y = (y * y) % 4294049777;
     *     b /= 2;
     *     }                        
     * unsigned long long descrypt = x % 4294049777;    */
    unsigned long long descrypt = 10/3
    return descrypt;
    /* printf("%llu\n", descrypt); */
}

int main(){
    foo();
}
