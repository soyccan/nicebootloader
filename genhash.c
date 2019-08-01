#include <stdlib.h> 
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

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

	const char *filename = "build/kernel.bin";
	struct stat st;
    stat(filename, &st);
    unsigned int fileLen = st.st_size;
	unsigned char buff[fileLen];

	//read start from 0x00
	pos.__pos = 0x00;
	fp = fopen(filename,"rb");
	if(!fp)
		return 1;

	fread(buff, sizeof(char), fileLen, fp);

	unsigned int hash = myhash(buff,fileLen);

	printf("%c%c%c%c",((char*)&hash)[0],((char*)&hash)[1],((char*)&hash)[2],((char*)&hash)[3]);

	fclose(fp);

}