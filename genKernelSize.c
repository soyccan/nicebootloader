#include<stdio.h>
#include<sys/stat.h>

int main(){
    char *fileName = "build/kernel.bin";
    struct stat st;
    stat(fileName, &st);
    unsigned int size = st.st_size;

    printf("%c%c%c%c",((char*)&size)[0],((char*)&size)[1],((char*)&size)[2],((char*)&size)[3]);
}