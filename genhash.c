#include <stdlib.h> 
#include <stdio.h>
#include <string.h>
#include <stdint.h>
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

uint64_t power(uint64_t a, uint64_t k, uint64_t N) {
	uint64_t p=1, i;
	for (i=1; i<=k; i++) {
		p = (p*a)%N;
	}
	return p;
}
uint64_t powMod(uint64_t a, uint64_t b, uint64_t n) {
	uint64_t x = 1, y = a;
	while (b > 0) {
		if (b % 2 == 1)
			x = (x * y) % n;
		y = (y * y) % n; // Squaring the base
		b /= 2;
	}
	return x % n;
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

	/* Hash encryption */
	unsigned int cipher = powMod(hash, 11, 4294049777); // p=65521, q=65537, e=4293918721, d=4293918722 n=4294049777
	printf("%u\n", cipher);
	fclose(fp);
}
