
build/bin/_stressfs：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 78 0d 00 00       	push   $0xd78
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 c1 09 00 00       	call   a10 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 01 02 00 00       	call   260 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 fe 07 00 00       	call   865 <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 8b 0d 00 00       	push   $0xd8b
  8a:	6a 01                	push   $0x1
  8c:	e8 7f 09 00 00       	call   a10 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 01 08 00 00       	call   8ad <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 c6 07 00 00       	call   88d <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 bd 07 00 00       	call   895 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 95 0d 00 00       	push   $0xd95
  df:	6a 01                	push   $0x1
  e1:	e8 2a 09 00 00       	call   a10 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 b2 07 00 00       	call   8ad <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 76 07 00 00       	call   885 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 75 07 00 00       	call   895 <close>

  wait();
 120:	e8 50 07 00 00       	call   875 <wait>

  exit();
 125:	e8 43 07 00 00       	call   86d <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 145:	31 c0                	xor    %eax,%eax
{
 147:	89 e5                	mov    %esp,%ebp
 149:	53                   	push   %ebx
 14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	89 c8                	mov    %ecx,%eax
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	57                   	push   %edi
 178:	8b 7d 10             	mov    0x10(%ebp),%edi
 17b:	56                   	push   %esi
 17c:	8b 75 08             	mov    0x8(%ebp),%esi
 17f:	53                   	push   %ebx
 180:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 183:	85 ff                	test   %edi,%edi
 185:	74 39                	je     1c0 <strcat_s+0x50>
 187:	31 c0                	xor    %eax,%eax
 189:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 18e:	eb 11                	jmp    1a1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 190:	0f b6 12             	movzbl (%edx),%edx
 193:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 196:	84 d2                	test   %dl,%dl
 198:	74 26                	je     1c0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 19a:	83 c0 01             	add    $0x1,%eax
 19d:	39 c7                	cmp    %eax,%edi
 19f:	74 1f                	je     1c0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 1a1:	89 c2                	mov    %eax,%edx
 1a3:	29 ca                	sub    %ecx,%edx
 1a5:	01 da                	add    %ebx,%edx
 1a7:	83 f9 ff             	cmp    $0xffffffff,%ecx
 1aa:	75 e4                	jne    190 <strcat_s+0x20>
 1ac:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 1b0:	75 e8                	jne    19a <strcat_s+0x2a>
 1b2:	89 da                	mov    %ebx,%edx
 1b4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 1b6:	0f b6 12             	movzbl (%edx),%edx
 1b9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 1bc:	84 d2                	test   %dl,%dl
 1be:	75 da                	jne    19a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 1c0:	5b                   	pop    %ebx
 1c1:	89 f0                	mov    %esi,%eax
 1c3:	5e                   	pop    %esi
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	53                   	push   %ebx
 1d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1de:	0f b6 01             	movzbl (%ecx),%eax
 1e1:	0f b6 1a             	movzbl (%edx),%ebx
 1e4:	84 c0                	test   %al,%al
 1e6:	75 19                	jne    201 <strcmp+0x31>
 1e8:	eb 26                	jmp    210 <strcmp+0x40>
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1f4:	83 c1 01             	add    $0x1,%ecx
 1f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1fa:	0f b6 1a             	movzbl (%edx),%ebx
 1fd:	84 c0                	test   %al,%al
 1ff:	74 0f                	je     210 <strcmp+0x40>
 201:	38 d8                	cmp    %bl,%al
 203:	74 eb                	je     1f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 205:	29 d8                	sub    %ebx,%eax
}
 207:	5b                   	pop    %ebx
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 210:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 212:	29 d8                	sub    %ebx,%eax
}
 214:	5b                   	pop    %ebx
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 22a:	80 3a 00             	cmpb   $0x0,(%edx)
 22d:	74 21                	je     250 <strlen+0x30>
 22f:	31 c0                	xor    %eax,%eax
 231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 238:	83 c0 01             	add    $0x1,%eax
 23b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 23f:	89 c1                	mov    %eax,%ecx
 241:	75 f5                	jne    238 <strlen+0x18>
    ;
  return n;
}
 243:	89 c8                	mov    %ecx,%eax
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 250:	31 c9                	xor    %ecx,%ecx
}
 252:	5d                   	pop    %ebp
 253:	89 c8                	mov    %ecx,%eax
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 26b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26e:	8b 45 0c             	mov    0xc(%ebp),%eax
 271:	89 d7                	mov    %edx,%edi
 273:	fc                   	cld    
 274:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 28e:	0f b6 10             	movzbl (%eax),%edx
 291:	84 d2                	test   %dl,%dl
 293:	75 16                	jne    2ab <strchr+0x2b>
 295:	eb 21                	jmp    2b8 <strchr+0x38>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax
 2a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	84 d2                	test   %dl,%dl
 2a9:	74 0d                	je     2b8 <strchr+0x38>
    if(*s == c)
 2ab:	38 d1                	cmp    %dl,%cl
 2ad:	75 f1                	jne    2a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2b8:	31 c0                	xor    %eax,%eax
}
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c9:	31 f6                	xor    %esi,%esi
{
 2cb:	53                   	push   %ebx
 2cc:	89 f3                	mov    %esi,%ebx
 2ce:	83 ec 1c             	sub    $0x1c,%esp
 2d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2d4:	eb 33                	jmp    309 <gets+0x49>
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e6:	6a 01                	push   $0x1
 2e8:	50                   	push   %eax
 2e9:	6a 00                	push   $0x0
 2eb:	e8 95 05 00 00       	call   885 <read>
    if(cc < 1)
 2f0:	83 c4 10             	add    $0x10,%esp
 2f3:	85 c0                	test   %eax,%eax
 2f5:	7e 1c                	jle    313 <gets+0x53>
      break;
    buf[i++] = c;
 2f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fb:	83 c7 01             	add    $0x1,%edi
 2fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 301:	3c 0a                	cmp    $0xa,%al
 303:	74 23                	je     328 <gets+0x68>
 305:	3c 0d                	cmp    $0xd,%al
 307:	74 1f                	je     328 <gets+0x68>
  for(i=0; i+1 < max; ){
 309:	83 c3 01             	add    $0x1,%ebx
 30c:	89 fe                	mov    %edi,%esi
 30e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 311:	7c cd                	jl     2e0 <gets+0x20>
 313:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 315:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 318:	c6 03 00             	movb   $0x0,(%ebx)
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
 328:	8b 75 08             	mov    0x8(%ebp),%esi
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 de                	add    %ebx,%esi
 330:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 332:	c6 03 00             	movb   $0x0,(%ebx)
}
 335:	8d 65 f4             	lea    -0xc(%ebp),%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	56                   	push   %esi
 348:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	6a 00                	push   $0x0
 34e:	ff 75 08             	pushl  0x8(%ebp)
 351:	e8 57 05 00 00       	call   8ad <open>
  if(fd < 0)
 356:	83 c4 10             	add    $0x10,%esp
 359:	85 c0                	test   %eax,%eax
 35b:	78 2b                	js     388 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 35d:	83 ec 08             	sub    $0x8,%esp
 360:	ff 75 0c             	pushl  0xc(%ebp)
 363:	89 c3                	mov    %eax,%ebx
 365:	50                   	push   %eax
 366:	e8 5a 05 00 00       	call   8c5 <fstat>
  close(fd);
 36b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 36e:	89 c6                	mov    %eax,%esi
  close(fd);
 370:	e8 20 05 00 00       	call   895 <close>
  return r;
 375:	83 c4 10             	add    $0x10,%esp
}
 378:	8d 65 f8             	lea    -0x8(%ebp),%esp
 37b:	89 f0                	mov    %esi,%eax
 37d:	5b                   	pop    %ebx
 37e:	5e                   	pop    %esi
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 388:	be ff ff ff ff       	mov    $0xffffffff,%esi
 38d:	eb e9                	jmp    378 <stat+0x38>
 38f:	90                   	nop

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	53                   	push   %ebx
 398:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 39b:	0f be 02             	movsbl (%edx),%eax
 39e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3a9:	77 1a                	ja     3c5 <atoi+0x35>
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
    n = n*10 + *s++ - '0';
 3b0:	83 c2 01             	add    $0x1,%edx
 3b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ba:	0f be 02             	movsbl (%edx),%eax
 3bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	89 c8                	mov    %ecx,%eax
 3c7:	5b                   	pop    %ebx
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	8b 45 10             	mov    0x10(%ebp),%eax
 3db:	8b 55 08             	mov    0x8(%ebp),%edx
 3de:	56                   	push   %esi
 3df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3e2:	85 c0                	test   %eax,%eax
 3e4:	7e 0f                	jle    3f5 <memmove+0x25>
 3e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3e8:	89 d7                	mov    %edx,%edi
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3f1:	39 f8                	cmp    %edi,%eax
 3f3:	75 fb                	jne    3f0 <memmove+0x20>
  return vdst;
}
 3f5:	5e                   	pop    %esi
 3f6:	89 d0                	mov    %edx,%eax
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 34             	sub    $0x34,%esp
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 410:	68 9c 0d 00 00       	push   $0xd9c
hexdump (void *data, size_t size) {
 415:	89 45 e0             	mov    %eax,-0x20(%ebp)
 418:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 41b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 41d:	89 c7                	mov    %eax,%edi
 41f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 422:	e8 e9 05 00 00       	call   a10 <printf>
  for (offset = 0; offset < size; offset += 16) {
 427:	83 c4 10             	add    $0x10,%esp
 42a:	85 ff                	test   %edi,%edi
 42c:	0f 84 2d 01 00 00    	je     55f <hexdump+0x15f>
 432:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 435:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 43c:	be 10 00 00 00       	mov    $0x10,%esi
 441:	83 e8 01             	sub    $0x1,%eax
 444:	83 e0 f0             	and    $0xfffffff0,%eax
 447:	83 c0 10             	add    $0x10,%eax
 44a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 44d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 450:	83 ec 08             	sub    $0x8,%esp
 453:	68 f0 0d 00 00       	push   $0xdf0
 458:	6a 01                	push   $0x1
 45a:	e8 b1 05 00 00       	call   a10 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 45f:	83 c4 10             	add    $0x10,%esp
 462:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 469:	0f 8e 51 01 00 00    	jle    5c0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 46f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 472:	83 ec 04             	sub    $0x4,%esp
 475:	57                   	push   %edi
 476:	89 fb                	mov    %edi,%ebx
 478:	68 ed 0d 00 00       	push   $0xded
 47d:	6a 01                	push   $0x1
 47f:	e8 8c 05 00 00       	call   a10 <printf>
 484:	89 7d d8             	mov    %edi,-0x28(%ebp)
 487:	83 c4 10             	add    $0x10,%esp
 48a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 48d:	eb 28                	jmp    4b7 <hexdump+0xb7>
 48f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 490:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 494:	80 fa 0f             	cmp    $0xf,%dl
 497:	0f 86 e3 00 00 00    	jbe    580 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 49d:	83 ec 04             	sub    $0x4,%esp
 4a0:	83 c3 01             	add    $0x1,%ebx
 4a3:	52                   	push   %edx
 4a4:	68 f3 0d 00 00       	push   $0xdf3
 4a9:	6a 01                	push   $0x1
 4ab:	e8 60 05 00 00       	call   a10 <printf>
 4b0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4b3:	39 f3                	cmp    %esi,%ebx
 4b5:	74 1e                	je     4d5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 4b7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 4ba:	7f d4                	jg     490 <hexdump+0x90>
      } else {
        printf(1, "   ");
 4bc:	83 ec 08             	sub    $0x8,%esp
 4bf:	83 c3 01             	add    $0x1,%ebx
 4c2:	68 f7 0d 00 00       	push   $0xdf7
 4c7:	6a 01                	push   $0x1
 4c9:	e8 42 05 00 00       	call   a10 <printf>
 4ce:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4d1:	39 f3                	cmp    %esi,%ebx
 4d3:	75 e2                	jne    4b7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 4db:	68 f0 0d 00 00       	push   $0xdf0
 4e0:	6a 01                	push   $0x1
 4e2:	e8 29 05 00 00       	call   a10 <printf>
 4e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ea:	83 c4 10             	add    $0x10,%esp
 4ed:	eb 1b                	jmp    50a <hexdump+0x10a>
 4ef:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	52                   	push   %edx
 4f4:	68 fb 0d 00 00       	push   $0xdfb
 4f9:	6a 01                	push   $0x1
 4fb:	e8 10 05 00 00       	call   a10 <printf>
 500:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 503:	83 c3 01             	add    $0x1,%ebx
 506:	39 de                	cmp    %ebx,%esi
 508:	74 30                	je     53a <hexdump+0x13a>
      if(offset + index < (int)size) {
 50a:	39 df                	cmp    %ebx,%edi
 50c:	0f 8e 8e 00 00 00    	jle    5a0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 512:	8b 45 e0             	mov    -0x20(%ebp),%eax
 515:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 519:	8d 4a e0             	lea    -0x20(%edx),%ecx
 51c:	80 f9 5e             	cmp    $0x5e,%cl
 51f:	76 cf                	jbe    4f0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 521:	83 ec 08             	sub    $0x8,%esp
 524:	83 c3 01             	add    $0x1,%ebx
 527:	68 fe 0d 00 00       	push   $0xdfe
 52c:	6a 01                	push   $0x1
 52e:	e8 dd 04 00 00       	call   a10 <printf>
 533:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 536:	39 de                	cmp    %ebx,%esi
 538:	75 d0                	jne    50a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	83 c6 10             	add    $0x10,%esi
 540:	68 00 0e 00 00       	push   $0xe00
 545:	6a 01                	push   $0x1
 547:	e8 c4 04 00 00       	call   a10 <printf>
  for (offset = 0; offset < size; offset += 16) {
 54c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 550:	83 c4 10             	add    $0x10,%esp
 553:	8b 45 dc             	mov    -0x24(%ebp),%eax
 556:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 559:	0f 85 f1 fe ff ff    	jne    450 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 55f:	c7 45 0c 9c 0d 00 00 	movl   $0xd9c,0xc(%ebp)
 566:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 56d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 570:	5b                   	pop    %ebx
 571:	5e                   	pop    %esi
 572:	5f                   	pop    %edi
 573:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 574:	e9 97 04 00 00       	jmp    a10 <printf>
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 580:	83 ec 08             	sub    $0x8,%esp
 583:	68 eb 0d 00 00       	push   $0xdeb
 588:	6a 01                	push   $0x1
 58a:	e8 81 04 00 00       	call   a10 <printf>
 58f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 593:	83 c4 10             	add    $0x10,%esp
 596:	e9 02 ff ff ff       	jmp    49d <hexdump+0x9d>
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
        printf(1, " ");
 5a0:	83 ec 08             	sub    $0x8,%esp
 5a3:	68 f9 0d 00 00       	push   $0xdf9
 5a8:	6a 01                	push   $0x1
 5aa:	e8 61 04 00 00       	call   a10 <printf>
 5af:	83 c4 10             	add    $0x10,%esp
 5b2:	e9 4c ff ff ff       	jmp    503 <hexdump+0x103>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 5c0:	83 ec 08             	sub    $0x8,%esp
 5c3:	68 eb 0d 00 00       	push   $0xdeb
 5c8:	6a 01                	push   $0x1
 5ca:	e8 41 04 00 00       	call   a10 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 5cf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 5d2:	83 c4 10             	add    $0x10,%esp
 5d5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 5db:	0f 8f 8e fe ff ff    	jg     46f <hexdump+0x6f>
 5e1:	83 ec 08             	sub    $0x8,%esp
 5e4:	68 eb 0d 00 00       	push   $0xdeb
 5e9:	6a 01                	push   $0x1
 5eb:	e8 20 04 00 00       	call   a10 <printf>
    if (offset <= 0x000f) printf(1, "0");
 5f0:	83 c4 10             	add    $0x10,%esp
 5f3:	83 ff 0f             	cmp    $0xf,%edi
 5f6:	0f 8f 73 fe ff ff    	jg     46f <hexdump+0x6f>
 5fc:	83 ec 08             	sub    $0x8,%esp
 5ff:	68 eb 0d 00 00       	push   $0xdeb
 604:	6a 01                	push   $0x1
 606:	e8 05 04 00 00       	call   a10 <printf>
 60b:	83 c4 10             	add    $0x10,%esp
 60e:	e9 5c fe ff ff       	jmp    46f <hexdump+0x6f>
 613:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000620 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
    if (!endian)
 625:	a1 08 12 00 00       	mov    0x1208,%eax
{
 62a:	89 e5                	mov    %esp,%ebp
 62c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 62f:	85 c0                	test   %eax,%eax
 631:	75 1d                	jne    650 <hton16+0x30>
        endian = byteorder();
 633:	c7 05 08 12 00 00 d2 	movl   $0x4d2,0x1208
 63a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 63d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 63f:	5d                   	pop    %ebp
 640:	66 c1 c2 08          	rol    $0x8,%dx
 644:	89 d0                	mov    %edx,%eax
 646:	c3                   	ret    
 647:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64e:	66 90                	xchg   %ax,%ax
 650:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 652:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 657:	74 e4                	je     63d <hton16+0x1d>
}
 659:	89 d0                	mov    %edx,%eax
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <ntoh16>:
 660:	f3 0f 1e fb          	endbr32 
 664:	eb ba                	jmp    620 <hton16>
 666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi

00000670 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
    if (!endian)
 675:	8b 15 08 12 00 00    	mov    0x1208,%edx
{
 67b:	89 e5                	mov    %esp,%ebp
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 680:	85 d2                	test   %edx,%edx
 682:	75 14                	jne    698 <hton32+0x28>
        endian = byteorder();
 684:	c7 05 08 12 00 00 d2 	movl   $0x4d2,0x1208
 68b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 68e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 690:	5d                   	pop    %ebp
 691:	c3                   	ret    
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 698:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 69e:	74 ee                	je     68e <hton32+0x1e>
}
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
 6a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006b0 <ntoh32>:
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	eb ba                	jmp    670 <hton32>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi

000006c0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 6c0:	f3 0f 1e fb          	endbr32 
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	57                   	push   %edi
 6c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6cb:	56                   	push   %esi
 6cc:	53                   	push   %ebx
 6cd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 6d0:	0f b6 01             	movzbl (%ecx),%eax
 6d3:	3c 09                	cmp    $0x9,%al
 6d5:	74 09                	je     6e0 <strtol+0x20>
 6d7:	3c 20                	cmp    $0x20,%al
 6d9:	75 14                	jne    6ef <strtol+0x2f>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
 6e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 6e4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 6e7:	3c 20                	cmp    $0x20,%al
 6e9:	74 f5                	je     6e0 <strtol+0x20>
 6eb:	3c 09                	cmp    $0x9,%al
 6ed:	74 f1                	je     6e0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 6ef:	3c 2b                	cmp    $0x2b,%al
 6f1:	0f 84 a9 00 00 00    	je     7a0 <strtol+0xe0>
    int neg = 0;
 6f7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 6f9:	3c 2d                	cmp    $0x2d,%al
 6fb:	0f 84 8f 00 00 00    	je     790 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 701:	0f be 11             	movsbl (%ecx),%edx
 704:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 70a:	75 12                	jne    71e <strtol+0x5e>
 70c:	80 fa 30             	cmp    $0x30,%dl
 70f:	0f 84 9b 00 00 00    	je     7b0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 715:	85 db                	test   %ebx,%ebx
 717:	75 05                	jne    71e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 719:	bb 0a 00 00 00       	mov    $0xa,%ebx
 71e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 721:	31 c0                	xor    %eax,%eax
 723:	eb 17                	jmp    73c <strtol+0x7c>
 725:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 728:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 72b:	3b 55 10             	cmp    0x10(%ebp),%edx
 72e:	7d 28                	jge    758 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 730:	0f af 45 10          	imul   0x10(%ebp),%eax
 734:	83 c1 01             	add    $0x1,%ecx
 737:	01 d0                	add    %edx,%eax
    while (1) {
 739:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 73c:	8d 72 d0             	lea    -0x30(%edx),%esi
 73f:	89 f3                	mov    %esi,%ebx
 741:	80 fb 09             	cmp    $0x9,%bl
 744:	76 e2                	jbe    728 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 746:	8d 72 9f             	lea    -0x61(%edx),%esi
 749:	89 f3                	mov    %esi,%ebx
 74b:	80 fb 19             	cmp    $0x19,%bl
 74e:	77 28                	ja     778 <strtol+0xb8>
            dig = *s - 'a' + 10;
 750:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 753:	3b 55 10             	cmp    0x10(%ebp),%edx
 756:	7c d8                	jl     730 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 758:	8b 55 0c             	mov    0xc(%ebp),%edx
 75b:	85 d2                	test   %edx,%edx
 75d:	74 05                	je     764 <strtol+0xa4>
        *endptr = (char *) s;
 75f:	8b 75 0c             	mov    0xc(%ebp),%esi
 762:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 764:	89 c2                	mov    %eax,%edx
}
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
    return (neg ? -val : val);
 768:	f7 da                	neg    %edx
 76a:	85 ff                	test   %edi,%edi
}
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 76e:	0f 45 c2             	cmovne %edx,%eax
}
 771:	c3                   	ret    
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 778:	8d 72 bf             	lea    -0x41(%edx),%esi
 77b:	89 f3                	mov    %esi,%ebx
 77d:	80 fb 19             	cmp    $0x19,%bl
 780:	77 d6                	ja     758 <strtol+0x98>
            dig = *s - 'A' + 10;
 782:	83 ea 37             	sub    $0x37,%edx
 785:	eb a4                	jmp    72b <strtol+0x6b>
 787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 790:	83 c1 01             	add    $0x1,%ecx
 793:	bf 01 00 00 00       	mov    $0x1,%edi
 798:	e9 64 ff ff ff       	jmp    701 <strtol+0x41>
 79d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 7a0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 7a3:	31 ff                	xor    %edi,%edi
 7a5:	e9 57 ff ff ff       	jmp    701 <strtol+0x41>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 7b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 7b4:	3c 78                	cmp    $0x78,%al
 7b6:	74 18                	je     7d0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 7b8:	85 db                	test   %ebx,%ebx
 7ba:	0f 85 5e ff ff ff    	jne    71e <strtol+0x5e>
        s++, base = 8;
 7c0:	83 c1 01             	add    $0x1,%ecx
 7c3:	0f be d0             	movsbl %al,%edx
 7c6:	bb 08 00 00 00       	mov    $0x8,%ebx
 7cb:	e9 4e ff ff ff       	jmp    71e <strtol+0x5e>
        s += 2, base = 16;
 7d0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 7d4:	bb 10 00 00 00       	mov    $0x10,%ebx
 7d9:	83 c1 02             	add    $0x2,%ecx
 7dc:	e9 3d ff ff ff       	jmp    71e <strtol+0x5e>
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop

000007f0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 7f0:	f3 0f 1e fb          	endbr32 
 7f4:	55                   	push   %ebp
 7f5:	89 e5                	mov    %esp,%ebp
 7f7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 7f8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 7fa:	56                   	push   %esi
 7fb:	53                   	push   %ebx
 7fc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 7ff:	83 ec 1c             	sub    $0x1c,%esp
 802:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 805:	83 ec 04             	sub    $0x4,%esp
 808:	6a 0a                	push   $0xa
 80a:	53                   	push   %ebx
 80b:	56                   	push   %esi
 80c:	e8 af fe ff ff       	call   6c0 <strtol>
        if (ret < 0 || ret > 255) {
 811:	83 c4 10             	add    $0x10,%esp
 814:	3d ff 00 00 00       	cmp    $0xff,%eax
 819:	77 3d                	ja     858 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 81b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 81e:	39 f1                	cmp    %esi,%ecx
 820:	74 36                	je     858 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 822:	0f b6 11             	movzbl (%ecx),%edx
 825:	83 ff 03             	cmp    $0x3,%edi
 828:	74 16                	je     840 <ip_addr_pton+0x50>
 82a:	80 fa 2e             	cmp    $0x2e,%dl
 82d:	75 29                	jne    858 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 82f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 832:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 835:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 838:	83 c7 01             	add    $0x1,%edi
 83b:	eb c8                	jmp    805 <ip_addr_pton+0x15>
 83d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 840:	84 d2                	test   %dl,%dl
 842:	75 14                	jne    858 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 844:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 847:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 84a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 84d:	31 c0                	xor    %eax,%eax
}
 84f:	5b                   	pop    %ebx
 850:	5e                   	pop    %esi
 851:	5f                   	pop    %edi
 852:	5d                   	pop    %ebp
 853:	c3                   	ret    
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 858:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 85b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 860:	5b                   	pop    %ebx
 861:	5e                   	pop    %esi
 862:	5f                   	pop    %edi
 863:	5d                   	pop    %ebp
 864:	c3                   	ret    

00000865 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 865:	b8 01 00 00 00       	mov    $0x1,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <exit>:
SYSCALL(exit)
 86d:	b8 02 00 00 00       	mov    $0x2,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <wait>:
SYSCALL(wait)
 875:	b8 03 00 00 00       	mov    $0x3,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <pipe>:
SYSCALL(pipe)
 87d:	b8 04 00 00 00       	mov    $0x4,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <read>:
SYSCALL(read)
 885:	b8 05 00 00 00       	mov    $0x5,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <write>:
SYSCALL(write)
 88d:	b8 10 00 00 00       	mov    $0x10,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <close>:
SYSCALL(close)
 895:	b8 15 00 00 00       	mov    $0x15,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <kill>:
SYSCALL(kill)
 89d:	b8 06 00 00 00       	mov    $0x6,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <exec>:
SYSCALL(exec)
 8a5:	b8 07 00 00 00       	mov    $0x7,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <open>:
SYSCALL(open)
 8ad:	b8 0f 00 00 00       	mov    $0xf,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <mknod>:
SYSCALL(mknod)
 8b5:	b8 11 00 00 00       	mov    $0x11,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <unlink>:
SYSCALL(unlink)
 8bd:	b8 12 00 00 00       	mov    $0x12,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <fstat>:
SYSCALL(fstat)
 8c5:	b8 08 00 00 00       	mov    $0x8,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <link>:
SYSCALL(link)
 8cd:	b8 13 00 00 00       	mov    $0x13,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <mkdir>:
SYSCALL(mkdir)
 8d5:	b8 14 00 00 00       	mov    $0x14,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <chdir>:
SYSCALL(chdir)
 8dd:	b8 09 00 00 00       	mov    $0x9,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <dup>:
SYSCALL(dup)
 8e5:	b8 0a 00 00 00       	mov    $0xa,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <getpid>:
SYSCALL(getpid)
 8ed:	b8 0b 00 00 00       	mov    $0xb,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <sbrk>:
SYSCALL(sbrk)
 8f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <sleep>:
SYSCALL(sleep)
 8fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <uptime>:
SYSCALL(uptime)
 905:	b8 0e 00 00 00       	mov    $0xe,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <ioctl>:
# iotcl
SYSCALL(ioctl)
 90d:	b8 16 00 00 00       	mov    $0x16,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <socket>:
# socket
SYSCALL(socket)
 915:	b8 17 00 00 00       	mov    $0x17,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <bind>:
SYSCALL(bind)
 91d:	b8 19 00 00 00       	mov    $0x19,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <listen>:
SYSCALL(listen)
 925:	b8 1a 00 00 00       	mov    $0x1a,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <accept>:
SYSCALL(accept)
 92d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <recv>:
SYSCALL(recv)
 935:	b8 1c 00 00 00       	mov    $0x1c,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <send>:
SYSCALL(send)
 93d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <recvfrom>:
SYSCALL(recvfrom)
 945:	b8 1e 00 00 00       	mov    $0x1e,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <sendto>:
SYSCALL(sendto)
 94d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    
 955:	66 90                	xchg   %ax,%ax
 957:	66 90                	xchg   %ax,%ax
 959:	66 90                	xchg   %ax,%ax
 95b:	66 90                	xchg   %ax,%ax
 95d:	66 90                	xchg   %ax,%ax
 95f:	90                   	nop

00000960 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	57                   	push   %edi
 964:	56                   	push   %esi
 965:	53                   	push   %ebx
 966:	83 ec 3c             	sub    $0x3c,%esp
 969:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 96c:	89 d1                	mov    %edx,%ecx
{
 96e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 971:	85 d2                	test   %edx,%edx
 973:	0f 89 7f 00 00 00    	jns    9f8 <printint+0x98>
 979:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 97d:	74 79                	je     9f8 <printint+0x98>
    neg = 1;
 97f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 986:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 988:	31 db                	xor    %ebx,%ebx
 98a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 990:	89 c8                	mov    %ecx,%eax
 992:	31 d2                	xor    %edx,%edx
 994:	89 cf                	mov    %ecx,%edi
 996:	f7 75 c4             	divl   -0x3c(%ebp)
 999:	0f b6 92 0c 0e 00 00 	movzbl 0xe0c(%edx),%edx
 9a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 9a3:	89 d8                	mov    %ebx,%eax
 9a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 9a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 9ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 9ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 9b1:	76 dd                	jbe    990 <printint+0x30>
  if(neg)
 9b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 9b6:	85 c9                	test   %ecx,%ecx
 9b8:	74 0c                	je     9c6 <printint+0x66>
    buf[i++] = '-';
 9ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 9bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 9c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 9c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 9c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 9cd:	eb 07                	jmp    9d6 <printint+0x76>
 9cf:	90                   	nop
 9d0:	0f b6 13             	movzbl (%ebx),%edx
 9d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 9d6:	83 ec 04             	sub    $0x4,%esp
 9d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 9dc:	6a 01                	push   $0x1
 9de:	56                   	push   %esi
 9df:	57                   	push   %edi
 9e0:	e8 a8 fe ff ff       	call   88d <write>
  while(--i >= 0)
 9e5:	83 c4 10             	add    $0x10,%esp
 9e8:	39 de                	cmp    %ebx,%esi
 9ea:	75 e4                	jne    9d0 <printint+0x70>
    putc(fd, buf[i]);
}
 9ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9ef:	5b                   	pop    %ebx
 9f0:	5e                   	pop    %esi
 9f1:	5f                   	pop    %edi
 9f2:	5d                   	pop    %ebp
 9f3:	c3                   	ret    
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 9f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 9ff:	eb 87                	jmp    988 <printint+0x28>
 a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop

00000a10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 a10:	f3 0f 1e fb          	endbr32 
 a14:	55                   	push   %ebp
 a15:	89 e5                	mov    %esp,%ebp
 a17:	57                   	push   %edi
 a18:	56                   	push   %esi
 a19:	53                   	push   %ebx
 a1a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a1d:	8b 75 0c             	mov    0xc(%ebp),%esi
 a20:	0f b6 1e             	movzbl (%esi),%ebx
 a23:	84 db                	test   %bl,%bl
 a25:	0f 84 b4 00 00 00    	je     adf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 a2b:	8d 45 10             	lea    0x10(%ebp),%eax
 a2e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 a31:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 a34:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 a36:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a39:	eb 33                	jmp    a6e <printf+0x5e>
 a3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a3f:	90                   	nop
 a40:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a43:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 a48:	83 f8 25             	cmp    $0x25,%eax
 a4b:	74 17                	je     a64 <printf+0x54>
  write(fd, &c, 1);
 a4d:	83 ec 04             	sub    $0x4,%esp
 a50:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a53:	6a 01                	push   $0x1
 a55:	57                   	push   %edi
 a56:	ff 75 08             	pushl  0x8(%ebp)
 a59:	e8 2f fe ff ff       	call   88d <write>
 a5e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a61:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a64:	0f b6 1e             	movzbl (%esi),%ebx
 a67:	83 c6 01             	add    $0x1,%esi
 a6a:	84 db                	test   %bl,%bl
 a6c:	74 71                	je     adf <printf+0xcf>
    c = fmt[i] & 0xff;
 a6e:	0f be cb             	movsbl %bl,%ecx
 a71:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a74:	85 d2                	test   %edx,%edx
 a76:	74 c8                	je     a40 <printf+0x30>
      }
    } else if(state == '%'){
 a78:	83 fa 25             	cmp    $0x25,%edx
 a7b:	75 e7                	jne    a64 <printf+0x54>
      if(c == 'd'){
 a7d:	83 f8 64             	cmp    $0x64,%eax
 a80:	0f 84 9a 00 00 00    	je     b20 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a86:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a8c:	83 f9 70             	cmp    $0x70,%ecx
 a8f:	74 5f                	je     af0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a91:	83 f8 73             	cmp    $0x73,%eax
 a94:	0f 84 d6 00 00 00    	je     b70 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a9a:	83 f8 63             	cmp    $0x63,%eax
 a9d:	0f 84 8d 00 00 00    	je     b30 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 aa3:	83 f8 25             	cmp    $0x25,%eax
 aa6:	0f 84 b4 00 00 00    	je     b60 <printf+0x150>
  write(fd, &c, 1);
 aac:	83 ec 04             	sub    $0x4,%esp
 aaf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 ab3:	6a 01                	push   $0x1
 ab5:	57                   	push   %edi
 ab6:	ff 75 08             	pushl  0x8(%ebp)
 ab9:	e8 cf fd ff ff       	call   88d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 abe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 ac1:	83 c4 0c             	add    $0xc,%esp
 ac4:	6a 01                	push   $0x1
 ac6:	83 c6 01             	add    $0x1,%esi
 ac9:	57                   	push   %edi
 aca:	ff 75 08             	pushl  0x8(%ebp)
 acd:	e8 bb fd ff ff       	call   88d <write>
  for(i = 0; fmt[i]; i++){
 ad2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 ad6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 ad9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 adb:	84 db                	test   %bl,%bl
 add:	75 8f                	jne    a6e <printf+0x5e>
    }
  }
}
 adf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ae2:	5b                   	pop    %ebx
 ae3:	5e                   	pop    %esi
 ae4:	5f                   	pop    %edi
 ae5:	5d                   	pop    %ebp
 ae6:	c3                   	ret    
 ae7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 af0:	83 ec 0c             	sub    $0xc,%esp
 af3:	b9 10 00 00 00       	mov    $0x10,%ecx
 af8:	6a 00                	push   $0x0
 afa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 afd:	8b 45 08             	mov    0x8(%ebp),%eax
 b00:	8b 13                	mov    (%ebx),%edx
 b02:	e8 59 fe ff ff       	call   960 <printint>
        ap++;
 b07:	89 d8                	mov    %ebx,%eax
 b09:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b0c:	31 d2                	xor    %edx,%edx
        ap++;
 b0e:	83 c0 04             	add    $0x4,%eax
 b11:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b14:	e9 4b ff ff ff       	jmp    a64 <printf+0x54>
 b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 b20:	83 ec 0c             	sub    $0xc,%esp
 b23:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b28:	6a 01                	push   $0x1
 b2a:	eb ce                	jmp    afa <printf+0xea>
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 b30:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b33:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b36:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 b38:	6a 01                	push   $0x1
        ap++;
 b3a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 b3d:	57                   	push   %edi
 b3e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 b41:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b44:	e8 44 fd ff ff       	call   88d <write>
        ap++;
 b49:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b4c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b4f:	31 d2                	xor    %edx,%edx
 b51:	e9 0e ff ff ff       	jmp    a64 <printf+0x54>
 b56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b5d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b60:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b63:	83 ec 04             	sub    $0x4,%esp
 b66:	e9 59 ff ff ff       	jmp    ac4 <printf+0xb4>
 b6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b6f:	90                   	nop
        s = (char*)*ap;
 b70:	8b 45 d0             	mov    -0x30(%ebp),%eax
 b73:	8b 18                	mov    (%eax),%ebx
        ap++;
 b75:	83 c0 04             	add    $0x4,%eax
 b78:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 b7b:	85 db                	test   %ebx,%ebx
 b7d:	74 17                	je     b96 <printf+0x186>
        while(*s != 0){
 b7f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 b82:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 b84:	84 c0                	test   %al,%al
 b86:	0f 84 d8 fe ff ff    	je     a64 <printf+0x54>
 b8c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b8f:	89 de                	mov    %ebx,%esi
 b91:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b94:	eb 1a                	jmp    bb0 <printf+0x1a0>
          s = "(null)";
 b96:	bb 04 0e 00 00       	mov    $0xe04,%ebx
        while(*s != 0){
 b9b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b9e:	b8 28 00 00 00       	mov    $0x28,%eax
 ba3:	89 de                	mov    %ebx,%esi
 ba5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ba8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 baf:	90                   	nop
  write(fd, &c, 1);
 bb0:	83 ec 04             	sub    $0x4,%esp
          s++;
 bb3:	83 c6 01             	add    $0x1,%esi
 bb6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 bb9:	6a 01                	push   $0x1
 bbb:	57                   	push   %edi
 bbc:	53                   	push   %ebx
 bbd:	e8 cb fc ff ff       	call   88d <write>
        while(*s != 0){
 bc2:	0f b6 06             	movzbl (%esi),%eax
 bc5:	83 c4 10             	add    $0x10,%esp
 bc8:	84 c0                	test   %al,%al
 bca:	75 e4                	jne    bb0 <printf+0x1a0>
 bcc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 bcf:	31 d2                	xor    %edx,%edx
 bd1:	e9 8e fe ff ff       	jmp    a64 <printf+0x54>
 bd6:	66 90                	xchg   %ax,%ax
 bd8:	66 90                	xchg   %ax,%ax
 bda:	66 90                	xchg   %ax,%ax
 bdc:	66 90                	xchg   %ax,%ax
 bde:	66 90                	xchg   %ax,%ax

00000be0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 be0:	f3 0f 1e fb          	endbr32 
 be4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 be5:	a1 0c 12 00 00       	mov    0x120c,%eax
{
 bea:	89 e5                	mov    %esp,%ebp
 bec:	57                   	push   %edi
 bed:	56                   	push   %esi
 bee:	53                   	push   %ebx
 bef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bf2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 bf4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bf7:	39 c8                	cmp    %ecx,%eax
 bf9:	73 15                	jae    c10 <free+0x30>
 bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bff:	90                   	nop
 c00:	39 d1                	cmp    %edx,%ecx
 c02:	72 14                	jb     c18 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c04:	39 d0                	cmp    %edx,%eax
 c06:	73 10                	jae    c18 <free+0x38>
{
 c08:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c0a:	8b 10                	mov    (%eax),%edx
 c0c:	39 c8                	cmp    %ecx,%eax
 c0e:	72 f0                	jb     c00 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c10:	39 d0                	cmp    %edx,%eax
 c12:	72 f4                	jb     c08 <free+0x28>
 c14:	39 d1                	cmp    %edx,%ecx
 c16:	73 f0                	jae    c08 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 c1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 c1e:	39 fa                	cmp    %edi,%edx
 c20:	74 1e                	je     c40 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 c22:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c25:	8b 50 04             	mov    0x4(%eax),%edx
 c28:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c2b:	39 f1                	cmp    %esi,%ecx
 c2d:	74 28                	je     c57 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c2f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 c31:	5b                   	pop    %ebx
  freep = p;
 c32:	a3 0c 12 00 00       	mov    %eax,0x120c
}
 c37:	5e                   	pop    %esi
 c38:	5f                   	pop    %edi
 c39:	5d                   	pop    %ebp
 c3a:	c3                   	ret    
 c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c3f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 c40:	03 72 04             	add    0x4(%edx),%esi
 c43:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 c46:	8b 10                	mov    (%eax),%edx
 c48:	8b 12                	mov    (%edx),%edx
 c4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c4d:	8b 50 04             	mov    0x4(%eax),%edx
 c50:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c53:	39 f1                	cmp    %esi,%ecx
 c55:	75 d8                	jne    c2f <free+0x4f>
    p->s.size += bp->s.size;
 c57:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 c5a:	a3 0c 12 00 00       	mov    %eax,0x120c
    p->s.size += bp->s.size;
 c5f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c62:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c65:	89 10                	mov    %edx,(%eax)
}
 c67:	5b                   	pop    %ebx
 c68:	5e                   	pop    %esi
 c69:	5f                   	pop    %edi
 c6a:	5d                   	pop    %ebp
 c6b:	c3                   	ret    
 c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c70:	f3 0f 1e fb          	endbr32 
 c74:	55                   	push   %ebp
 c75:	89 e5                	mov    %esp,%ebp
 c77:	57                   	push   %edi
 c78:	56                   	push   %esi
 c79:	53                   	push   %ebx
 c7a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c80:	8b 3d 0c 12 00 00    	mov    0x120c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c86:	8d 70 07             	lea    0x7(%eax),%esi
 c89:	c1 ee 03             	shr    $0x3,%esi
 c8c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 c8f:	85 ff                	test   %edi,%edi
 c91:	0f 84 a9 00 00 00    	je     d40 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c97:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c99:	8b 48 04             	mov    0x4(%eax),%ecx
 c9c:	39 f1                	cmp    %esi,%ecx
 c9e:	73 6d                	jae    d0d <malloc+0x9d>
 ca0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ca6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 cab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 cae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 cb5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 cb8:	eb 17                	jmp    cd1 <malloc+0x61>
 cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cc0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 cc2:	8b 4a 04             	mov    0x4(%edx),%ecx
 cc5:	39 f1                	cmp    %esi,%ecx
 cc7:	73 4f                	jae    d18 <malloc+0xa8>
 cc9:	8b 3d 0c 12 00 00    	mov    0x120c,%edi
 ccf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 cd1:	39 c7                	cmp    %eax,%edi
 cd3:	75 eb                	jne    cc0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 cd5:	83 ec 0c             	sub    $0xc,%esp
 cd8:	ff 75 e4             	pushl  -0x1c(%ebp)
 cdb:	e8 15 fc ff ff       	call   8f5 <sbrk>
  if(p == (char*)-1)
 ce0:	83 c4 10             	add    $0x10,%esp
 ce3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ce6:	74 1b                	je     d03 <malloc+0x93>
  hp->s.size = nu;
 ce8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ceb:	83 ec 0c             	sub    $0xc,%esp
 cee:	83 c0 08             	add    $0x8,%eax
 cf1:	50                   	push   %eax
 cf2:	e8 e9 fe ff ff       	call   be0 <free>
  return freep;
 cf7:	a1 0c 12 00 00       	mov    0x120c,%eax
      if((p = morecore(nunits)) == 0)
 cfc:	83 c4 10             	add    $0x10,%esp
 cff:	85 c0                	test   %eax,%eax
 d01:	75 bd                	jne    cc0 <malloc+0x50>
        return 0;
  }
}
 d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 d06:	31 c0                	xor    %eax,%eax
}
 d08:	5b                   	pop    %ebx
 d09:	5e                   	pop    %esi
 d0a:	5f                   	pop    %edi
 d0b:	5d                   	pop    %ebp
 d0c:	c3                   	ret    
    if(p->s.size >= nunits){
 d0d:	89 c2                	mov    %eax,%edx
 d0f:	89 f8                	mov    %edi,%eax
 d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 d18:	39 ce                	cmp    %ecx,%esi
 d1a:	74 54                	je     d70 <malloc+0x100>
        p->s.size -= nunits;
 d1c:	29 f1                	sub    %esi,%ecx
 d1e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 d21:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 d24:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 d27:	a3 0c 12 00 00       	mov    %eax,0x120c
}
 d2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 d2f:	8d 42 08             	lea    0x8(%edx),%eax
}
 d32:	5b                   	pop    %ebx
 d33:	5e                   	pop    %esi
 d34:	5f                   	pop    %edi
 d35:	5d                   	pop    %ebp
 d36:	c3                   	ret    
 d37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d3e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 d40:	c7 05 0c 12 00 00 10 	movl   $0x1210,0x120c
 d47:	12 00 00 
    base.s.size = 0;
 d4a:	bf 10 12 00 00       	mov    $0x1210,%edi
    base.s.ptr = freep = prevp = &base;
 d4f:	c7 05 10 12 00 00 10 	movl   $0x1210,0x1210
 d56:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d59:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 d5b:	c7 05 14 12 00 00 00 	movl   $0x0,0x1214
 d62:	00 00 00 
    if(p->s.size >= nunits){
 d65:	e9 36 ff ff ff       	jmp    ca0 <malloc+0x30>
 d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 d70:	8b 0a                	mov    (%edx),%ecx
 d72:	89 08                	mov    %ecx,(%eax)
 d74:	eb b1                	jmp    d27 <malloc+0xb7>
