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
		printf("%-4d: %x\n",i,hash);
	}
	int hash2 = hash;
	for(i=1;i<=want_hash_size;i++){
		c = *str++;
		hash2 = ((hash2 << 5) + hash2) + c; /* hash2 * 33 + c */
		printf("%-4d: %x\n",i+want_hash_size,hash2);
	}
	return hash;
}

int main(){
	FILE *fp;
	fpos_t pos;
	int want_hash_size = 10240;
	unsigned char buff[want_hash_size*2];
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

        printf("%02X", buff[fileLen]);
        fileLen++;  
    } 
    putchar('\n');

	printf("%u\n",myhash(buff,want_hash_size));

	fclose(fp);

}