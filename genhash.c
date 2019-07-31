#include <stdlib.h> 
#include <stdio.h>
#include <string.h>

unsigned int myhash(unsigned char *str, int want_hash_size)
{
	unsigned int hash = 5381;
	int c,i;

	for(i=1;i<=want_hash_size;i++){
		c = *str++;
		hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
		// printf("%-4d: %x\n",i,hash);
	}
	return hash;
}

int main(){
	FILE *fp;
	fpos_t pos;
	int want_hash_size = 10240;
	unsigned char buff[want_hash_size];
	const char *filename = "build/kernel.bin";
	int fileLen=0;

	memset(buff,0,want_hash_size);

	//read start from 0x00
	pos.__pos = 0x00;
	fp = fopen(filename,"rb");
	if(!fp)
		return 1;

	while(!feof(fp)) { 
        fread(&buff[fileLen], sizeof(char), 1, fp);
        // printf("%02X", buff[fileLen]);
        fileLen++;  
    } 

	unsigned int hash = myhash(buff,want_hash_size);

	printf("%c%c%c%c",((char*)&hash)[0],((char*)&hash)[1],((char*)&hash)[2],((char*)&hash)[3]);

	fclose(fp);

}