
build/bin/_init：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 c8 0c 00 00       	push   $0xcc8
  1d:	e8 db 07 00 00       	call   7fd <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 fe 07 00 00       	call   835 <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 f2 07 00 00       	call   835 <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 d0 0c 00 00       	push   $0xcd0
  58:	6a 01                	push   $0x1
  5a:	e8 01 09 00 00       	call   960 <printf>
    pid = fork();
  5f:	e8 51 07 00 00       	call   7b5 <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 50 07 00 00       	call   7c5 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 0f 0d 00 00       	push   $0xd0f
  85:	6a 01                	push   $0x1
  87:	e8 d4 08 00 00       	call   960 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 e3 0c 00 00       	push   $0xce3
  98:	6a 01                	push   $0x1
  9a:	e8 c1 08 00 00       	call   960 <printf>
      exit();
  9f:	e8 19 07 00 00       	call   7bd <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 48 11 00 00       	push   $0x1148
  ab:	68 f6 0c 00 00       	push   $0xcf6
  b0:	e8 40 07 00 00       	call   7f5 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 f9 0c 00 00       	push   $0xcf9
  bc:	6a 01                	push   $0x1
  be:	e8 9d 08 00 00       	call   960 <printf>
      exit();
  c3:	e8 f5 06 00 00       	call   7bd <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 c8 0c 00 00       	push   $0xcc8
  d2:	e8 2e 07 00 00       	call   805 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 c8 0c 00 00       	push   $0xcc8
  e0:	e8 18 07 00 00       	call   7fd <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f5:	31 c0                	xor    %eax,%eax
{
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12e:	0f b6 01             	movzbl (%ecx),%eax
 131:	0f b6 1a             	movzbl (%edx),%ebx
 134:	84 c0                	test   %al,%al
 136:	75 19                	jne    151 <strcmp+0x31>
 138:	eb 26                	jmp    160 <strcmp+0x40>
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 14a:	0f b6 1a             	movzbl (%edx),%ebx
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 155:	29 d8                	sub    %ebx,%eax
}
 157:	5b                   	pop    %ebx
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 21                	je     1a0 <strlen+0x30>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18f:	89 c1                	mov    %eax,%ecx
 191:	75 f5                	jne    188 <strlen+0x18>
    ;
  return n;
}
 193:	89 c8                	mov    %ecx,%eax
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 d7                	mov    %edx,%edi
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1de:	0f b6 10             	movzbl (%eax),%edx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	75 16                	jne    1fb <strchr+0x2b>
 1e5:	eb 21                	jmp    208 <strchr+0x38>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
    if(*s == c)
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 208:	31 c0                	xor    %eax,%eax
}
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 219:	31 f6                	xor    %esi,%esi
{
 21b:	53                   	push   %ebx
 21c:	89 f3                	mov    %esi,%ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 224:	eb 33                	jmp    259 <gets+0x49>
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	6a 01                	push   $0x1
 238:	50                   	push   %eax
 239:	6a 00                	push   $0x0
 23b:	e8 95 05 00 00       	call   7d5 <read>
    if(cc < 1)
 240:	83 c4 10             	add    $0x10,%esp
 243:	85 c0                	test   %eax,%eax
 245:	7e 1c                	jle    263 <gets+0x53>
      break;
    buf[i++] = c;
 247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24b:	83 c7 01             	add    $0x1,%edi
 24e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 251:	3c 0a                	cmp    $0xa,%al
 253:	74 23                	je     278 <gets+0x68>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 1f                	je     278 <gets+0x68>
  for(i=0; i+1 < max; ){
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	89 fe                	mov    %edi,%esi
 25e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 261:	7c cd                	jl     230 <gets+0x20>
 263:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 265:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 268:	c6 03 00             	movb   $0x0,(%ebx)
}
 26b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26e:	5b                   	pop    %ebx
 26f:	5e                   	pop    %esi
 270:	5f                   	pop    %edi
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	8b 75 08             	mov    0x8(%ebp),%esi
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	01 de                	add    %ebx,%esi
 280:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 282:	c6 03 00             	movb   $0x0,(%ebx)
}
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	6a 00                	push   $0x0
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 57 05 00 00       	call   7fd <open>
  if(fd < 0)
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	78 2b                	js     2d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	50                   	push   %eax
 2b6:	e8 5a 05 00 00       	call   815 <fstat>
  close(fd);
 2bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2be:	89 c6                	mov    %eax,%esi
  close(fd);
 2c0:	e8 20 05 00 00       	call   7e5 <close>
  return r;
 2c5:	83 c4 10             	add    $0x10,%esp
}
 2c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dd:	eb e9                	jmp    2c8 <stat+0x38>
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2eb:	0f be 02             	movsbl (%edx),%eax
 2ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f9:	77 1a                	ja     315 <atoi+0x35>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	89 c8                	mov    %ecx,%eax
 317:	5b                   	pop    %ebx
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
 32e:	56                   	push   %esi
 32f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	85 c0                	test   %eax,%eax
 334:	7e 0f                	jle    345 <memmove+0x25>
 336:	01 d0                	add    %edx,%eax
  dst = vdst;
 338:	89 d7                	mov    %edx,%edi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	56                   	push   %esi
 359:	53                   	push   %ebx
 35a:	83 ec 34             	sub    $0x34,%esp
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 360:	68 18 0d 00 00       	push   $0xd18
hexdump (void *data, size_t size) {
 365:	89 45 e0             	mov    %eax,-0x20(%ebp)
 368:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 36b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 36d:	89 c7                	mov    %eax,%edi
 36f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 372:	e8 e9 05 00 00       	call   960 <printf>
  for (offset = 0; offset < size; offset += 16) {
 377:	83 c4 10             	add    $0x10,%esp
 37a:	85 ff                	test   %edi,%edi
 37c:	0f 84 2d 01 00 00    	je     4af <hexdump+0x15f>
 382:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 385:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 38c:	be 10 00 00 00       	mov    $0x10,%esi
 391:	83 e8 01             	sub    $0x1,%eax
 394:	83 e0 f0             	and    $0xfffffff0,%eax
 397:	83 c0 10             	add    $0x10,%eax
 39a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 3a0:	83 ec 08             	sub    $0x8,%esp
 3a3:	68 6c 0d 00 00       	push   $0xd6c
 3a8:	6a 01                	push   $0x1
 3aa:	e8 b1 05 00 00       	call   960 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 3b9:	0f 8e 51 01 00 00    	jle    510 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 3bf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 3c2:	83 ec 04             	sub    $0x4,%esp
 3c5:	57                   	push   %edi
 3c6:	89 fb                	mov    %edi,%ebx
 3c8:	68 69 0d 00 00       	push   $0xd69
 3cd:	6a 01                	push   $0x1
 3cf:	e8 8c 05 00 00       	call   960 <printf>
 3d4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 3d7:	83 c4 10             	add    $0x10,%esp
 3da:	8b 7d e0             	mov    -0x20(%ebp),%edi
 3dd:	eb 28                	jmp    407 <hexdump+0xb7>
 3df:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 3e0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 3e4:	80 fa 0f             	cmp    $0xf,%dl
 3e7:	0f 86 e3 00 00 00    	jbe    4d0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 3ed:	83 ec 04             	sub    $0x4,%esp
 3f0:	83 c3 01             	add    $0x1,%ebx
 3f3:	52                   	push   %edx
 3f4:	68 6f 0d 00 00       	push   $0xd6f
 3f9:	6a 01                	push   $0x1
 3fb:	e8 60 05 00 00       	call   960 <printf>
 400:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 403:	39 f3                	cmp    %esi,%ebx
 405:	74 1e                	je     425 <hexdump+0xd5>
      if(offset + index < (int)size) {
 407:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 40a:	7f d4                	jg     3e0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 40c:	83 ec 08             	sub    $0x8,%esp
 40f:	83 c3 01             	add    $0x1,%ebx
 412:	68 73 0d 00 00       	push   $0xd73
 417:	6a 01                	push   $0x1
 419:	e8 42 05 00 00       	call   960 <printf>
 41e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 421:	39 f3                	cmp    %esi,%ebx
 423:	75 e2                	jne    407 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 425:	83 ec 08             	sub    $0x8,%esp
 428:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 42b:	68 6c 0d 00 00       	push   $0xd6c
 430:	6a 01                	push   $0x1
 432:	e8 29 05 00 00       	call   960 <printf>
 437:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 43a:	83 c4 10             	add    $0x10,%esp
 43d:	eb 1b                	jmp    45a <hexdump+0x10a>
 43f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 440:	83 ec 04             	sub    $0x4,%esp
 443:	52                   	push   %edx
 444:	68 77 0d 00 00       	push   $0xd77
 449:	6a 01                	push   $0x1
 44b:	e8 10 05 00 00       	call   960 <printf>
 450:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 453:	83 c3 01             	add    $0x1,%ebx
 456:	39 de                	cmp    %ebx,%esi
 458:	74 30                	je     48a <hexdump+0x13a>
      if(offset + index < (int)size) {
 45a:	39 df                	cmp    %ebx,%edi
 45c:	0f 8e 8e 00 00 00    	jle    4f0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 462:	8b 45 e0             	mov    -0x20(%ebp),%eax
 465:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 469:	8d 4a e0             	lea    -0x20(%edx),%ecx
 46c:	80 f9 5e             	cmp    $0x5e,%cl
 46f:	76 cf                	jbe    440 <hexdump+0xf0>
        } else {
          printf(1, ".");
 471:	83 ec 08             	sub    $0x8,%esp
 474:	83 c3 01             	add    $0x1,%ebx
 477:	68 7a 0d 00 00       	push   $0xd7a
 47c:	6a 01                	push   $0x1
 47e:	e8 dd 04 00 00       	call   960 <printf>
 483:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 486:	39 de                	cmp    %ebx,%esi
 488:	75 d0                	jne    45a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 48a:	83 ec 08             	sub    $0x8,%esp
 48d:	83 c6 10             	add    $0x10,%esi
 490:	68 7c 0d 00 00       	push   $0xd7c
 495:	6a 01                	push   $0x1
 497:	e8 c4 04 00 00       	call   960 <printf>
  for (offset = 0; offset < size; offset += 16) {
 49c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 4a0:	83 c4 10             	add    $0x10,%esp
 4a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 4a6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 4a9:	0f 85 f1 fe ff ff    	jne    3a0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4af:	c7 45 0c 18 0d 00 00 	movl   $0xd18,0xc(%ebp)
 4b6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 4bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5f                   	pop    %edi
 4c3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4c4:	e9 97 04 00 00       	jmp    960 <printf>
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4d0:	83 ec 08             	sub    $0x8,%esp
 4d3:	68 67 0d 00 00       	push   $0xd67
 4d8:	6a 01                	push   $0x1
 4da:	e8 81 04 00 00       	call   960 <printf>
 4df:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4e3:	83 c4 10             	add    $0x10,%esp
 4e6:	e9 02 ff ff ff       	jmp    3ed <hexdump+0x9d>
 4eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
        printf(1, " ");
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	68 75 0d 00 00       	push   $0xd75
 4f8:	6a 01                	push   $0x1
 4fa:	e8 61 04 00 00       	call   960 <printf>
 4ff:	83 c4 10             	add    $0x10,%esp
 502:	e9 4c ff ff ff       	jmp    453 <hexdump+0x103>
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 510:	83 ec 08             	sub    $0x8,%esp
 513:	68 67 0d 00 00       	push   $0xd67
 518:	6a 01                	push   $0x1
 51a:	e8 41 04 00 00       	call   960 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 51f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 522:	83 c4 10             	add    $0x10,%esp
 525:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 52b:	0f 8f 8e fe ff ff    	jg     3bf <hexdump+0x6f>
 531:	83 ec 08             	sub    $0x8,%esp
 534:	68 67 0d 00 00       	push   $0xd67
 539:	6a 01                	push   $0x1
 53b:	e8 20 04 00 00       	call   960 <printf>
    if (offset <= 0x000f) printf(1, "0");
 540:	83 c4 10             	add    $0x10,%esp
 543:	83 ff 0f             	cmp    $0xf,%edi
 546:	0f 8f 73 fe ff ff    	jg     3bf <hexdump+0x6f>
 54c:	83 ec 08             	sub    $0x8,%esp
 54f:	68 67 0d 00 00       	push   $0xd67
 554:	6a 01                	push   $0x1
 556:	e8 05 04 00 00       	call   960 <printf>
 55b:	83 c4 10             	add    $0x10,%esp
 55e:	e9 5c fe ff ff       	jmp    3bf <hexdump+0x6f>
 563:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
    if (!endian)
 575:	a1 50 11 00 00       	mov    0x1150,%eax
{
 57a:	89 e5                	mov    %esp,%ebp
 57c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 57f:	85 c0                	test   %eax,%eax
 581:	75 1d                	jne    5a0 <hton16+0x30>
        endian = byteorder();
 583:	c7 05 50 11 00 00 d2 	movl   $0x4d2,0x1150
 58a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 58d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 58f:	5d                   	pop    %ebp
 590:	66 c1 c2 08          	rol    $0x8,%dx
 594:	89 d0                	mov    %edx,%eax
 596:	c3                   	ret    
 597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59e:	66 90                	xchg   %ax,%ax
 5a0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 5a2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 5a7:	74 e4                	je     58d <hton16+0x1d>
}
 5a9:	89 d0                	mov    %edx,%eax
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
 5ad:	8d 76 00             	lea    0x0(%esi),%esi

000005b0 <ntoh16>:
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	eb ba                	jmp    570 <hton16>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi

000005c0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 5c0:	f3 0f 1e fb          	endbr32 
 5c4:	55                   	push   %ebp
    if (!endian)
 5c5:	8b 15 50 11 00 00    	mov    0x1150,%edx
{
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 5d0:	85 d2                	test   %edx,%edx
 5d2:	75 14                	jne    5e8 <hton32+0x28>
        endian = byteorder();
 5d4:	c7 05 50 11 00 00 d2 	movl   $0x4d2,0x1150
 5db:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 5de:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret    
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 5e8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 5ee:	74 ee                	je     5de <hton32+0x1e>
}
 5f0:	5d                   	pop    %ebp
 5f1:	c3                   	ret    
 5f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000600 <ntoh32>:
 600:	f3 0f 1e fb          	endbr32 
 604:	eb ba                	jmp    5c0 <hton32>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	8b 4d 08             	mov    0x8(%ebp),%ecx
 61b:	56                   	push   %esi
 61c:	53                   	push   %ebx
 61d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 620:	0f b6 01             	movzbl (%ecx),%eax
 623:	3c 09                	cmp    $0x9,%al
 625:	74 09                	je     630 <strtol+0x20>
 627:	3c 20                	cmp    $0x20,%al
 629:	75 14                	jne    63f <strtol+0x2f>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
 630:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 634:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 637:	3c 20                	cmp    $0x20,%al
 639:	74 f5                	je     630 <strtol+0x20>
 63b:	3c 09                	cmp    $0x9,%al
 63d:	74 f1                	je     630 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 63f:	3c 2b                	cmp    $0x2b,%al
 641:	0f 84 a9 00 00 00    	je     6f0 <strtol+0xe0>
    int neg = 0;
 647:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 649:	3c 2d                	cmp    $0x2d,%al
 64b:	0f 84 8f 00 00 00    	je     6e0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 651:	0f be 11             	movsbl (%ecx),%edx
 654:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 65a:	75 12                	jne    66e <strtol+0x5e>
 65c:	80 fa 30             	cmp    $0x30,%dl
 65f:	0f 84 9b 00 00 00    	je     700 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 665:	85 db                	test   %ebx,%ebx
 667:	75 05                	jne    66e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 669:	bb 0a 00 00 00       	mov    $0xa,%ebx
 66e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 671:	31 c0                	xor    %eax,%eax
 673:	eb 17                	jmp    68c <strtol+0x7c>
 675:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 678:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 67b:	3b 55 10             	cmp    0x10(%ebp),%edx
 67e:	7d 28                	jge    6a8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 680:	0f af 45 10          	imul   0x10(%ebp),%eax
 684:	83 c1 01             	add    $0x1,%ecx
 687:	01 d0                	add    %edx,%eax
    while (1) {
 689:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 68c:	8d 72 d0             	lea    -0x30(%edx),%esi
 68f:	89 f3                	mov    %esi,%ebx
 691:	80 fb 09             	cmp    $0x9,%bl
 694:	76 e2                	jbe    678 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 696:	8d 72 9f             	lea    -0x61(%edx),%esi
 699:	89 f3                	mov    %esi,%ebx
 69b:	80 fb 19             	cmp    $0x19,%bl
 69e:	77 28                	ja     6c8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 6a0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 6a3:	3b 55 10             	cmp    0x10(%ebp),%edx
 6a6:	7c d8                	jl     680 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 6a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ab:	85 d2                	test   %edx,%edx
 6ad:	74 05                	je     6b4 <strtol+0xa4>
        *endptr = (char *) s;
 6af:	8b 75 0c             	mov    0xc(%ebp),%esi
 6b2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 6b4:	89 c2                	mov    %eax,%edx
}
 6b6:	5b                   	pop    %ebx
 6b7:	5e                   	pop    %esi
    return (neg ? -val : val);
 6b8:	f7 da                	neg    %edx
 6ba:	85 ff                	test   %edi,%edi
}
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 6be:	0f 45 c2             	cmovne %edx,%eax
}
 6c1:	c3                   	ret    
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 6c8:	8d 72 bf             	lea    -0x41(%edx),%esi
 6cb:	89 f3                	mov    %esi,%ebx
 6cd:	80 fb 19             	cmp    $0x19,%bl
 6d0:	77 d6                	ja     6a8 <strtol+0x98>
            dig = *s - 'A' + 10;
 6d2:	83 ea 37             	sub    $0x37,%edx
 6d5:	eb a4                	jmp    67b <strtol+0x6b>
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 6e0:	83 c1 01             	add    $0x1,%ecx
 6e3:	bf 01 00 00 00       	mov    $0x1,%edi
 6e8:	e9 64 ff ff ff       	jmp    651 <strtol+0x41>
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 6f0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 6f3:	31 ff                	xor    %edi,%edi
 6f5:	e9 57 ff ff ff       	jmp    651 <strtol+0x41>
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 700:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 704:	3c 78                	cmp    $0x78,%al
 706:	74 18                	je     720 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 708:	85 db                	test   %ebx,%ebx
 70a:	0f 85 5e ff ff ff    	jne    66e <strtol+0x5e>
        s++, base = 8;
 710:	83 c1 01             	add    $0x1,%ecx
 713:	0f be d0             	movsbl %al,%edx
 716:	bb 08 00 00 00       	mov    $0x8,%ebx
 71b:	e9 4e ff ff ff       	jmp    66e <strtol+0x5e>
        s += 2, base = 16;
 720:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 724:	bb 10 00 00 00       	mov    $0x10,%ebx
 729:	83 c1 02             	add    $0x2,%ecx
 72c:	e9 3d ff ff ff       	jmp    66e <strtol+0x5e>
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop

00000740 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 740:	f3 0f 1e fb          	endbr32 
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 748:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 74a:	56                   	push   %esi
 74b:	53                   	push   %ebx
 74c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 74f:	83 ec 1c             	sub    $0x1c,%esp
 752:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 755:	83 ec 04             	sub    $0x4,%esp
 758:	6a 0a                	push   $0xa
 75a:	53                   	push   %ebx
 75b:	56                   	push   %esi
 75c:	e8 af fe ff ff       	call   610 <strtol>
        if (ret < 0 || ret > 255) {
 761:	83 c4 10             	add    $0x10,%esp
 764:	3d ff 00 00 00       	cmp    $0xff,%eax
 769:	77 3d                	ja     7a8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 76b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 76e:	39 f1                	cmp    %esi,%ecx
 770:	74 36                	je     7a8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 772:	0f b6 11             	movzbl (%ecx),%edx
 775:	83 ff 03             	cmp    $0x3,%edi
 778:	74 16                	je     790 <ip_addr_pton+0x50>
 77a:	80 fa 2e             	cmp    $0x2e,%dl
 77d:	75 29                	jne    7a8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 77f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 782:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 785:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 788:	83 c7 01             	add    $0x1,%edi
 78b:	eb c8                	jmp    755 <ip_addr_pton+0x15>
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 790:	84 d2                	test   %dl,%dl
 792:	75 14                	jne    7a8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 794:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 797:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 79a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 79d:	31 c0                	xor    %eax,%eax
}
 79f:	5b                   	pop    %ebx
 7a0:	5e                   	pop    %esi
 7a1:	5f                   	pop    %edi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 7ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 7b0:	5b                   	pop    %ebx
 7b1:	5e                   	pop    %esi
 7b2:	5f                   	pop    %edi
 7b3:	5d                   	pop    %ebp
 7b4:	c3                   	ret    

000007b5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7b5:	b8 01 00 00 00       	mov    $0x1,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <exit>:
SYSCALL(exit)
 7bd:	b8 02 00 00 00       	mov    $0x2,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <wait>:
SYSCALL(wait)
 7c5:	b8 03 00 00 00       	mov    $0x3,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <pipe>:
SYSCALL(pipe)
 7cd:	b8 04 00 00 00       	mov    $0x4,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <read>:
SYSCALL(read)
 7d5:	b8 05 00 00 00       	mov    $0x5,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <write>:
SYSCALL(write)
 7dd:	b8 10 00 00 00       	mov    $0x10,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <close>:
SYSCALL(close)
 7e5:	b8 15 00 00 00       	mov    $0x15,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <kill>:
SYSCALL(kill)
 7ed:	b8 06 00 00 00       	mov    $0x6,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <exec>:
SYSCALL(exec)
 7f5:	b8 07 00 00 00       	mov    $0x7,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <open>:
SYSCALL(open)
 7fd:	b8 0f 00 00 00       	mov    $0xf,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <mknod>:
SYSCALL(mknod)
 805:	b8 11 00 00 00       	mov    $0x11,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <unlink>:
SYSCALL(unlink)
 80d:	b8 12 00 00 00       	mov    $0x12,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <fstat>:
SYSCALL(fstat)
 815:	b8 08 00 00 00       	mov    $0x8,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <link>:
SYSCALL(link)
 81d:	b8 13 00 00 00       	mov    $0x13,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <mkdir>:
SYSCALL(mkdir)
 825:	b8 14 00 00 00       	mov    $0x14,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <chdir>:
SYSCALL(chdir)
 82d:	b8 09 00 00 00       	mov    $0x9,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <dup>:
SYSCALL(dup)
 835:	b8 0a 00 00 00       	mov    $0xa,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <getpid>:
SYSCALL(getpid)
 83d:	b8 0b 00 00 00       	mov    $0xb,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <sbrk>:
SYSCALL(sbrk)
 845:	b8 0c 00 00 00       	mov    $0xc,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <sleep>:
SYSCALL(sleep)
 84d:	b8 0d 00 00 00       	mov    $0xd,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <uptime>:
SYSCALL(uptime)
 855:	b8 0e 00 00 00       	mov    $0xe,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <ioctl>:
# iotcl
SYSCALL(ioctl)
 85d:	b8 16 00 00 00       	mov    $0x16,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <socket>:
# socket
SYSCALL(socket)
 865:	b8 17 00 00 00       	mov    $0x17,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <bind>:
SYSCALL(bind)
 86d:	b8 19 00 00 00       	mov    $0x19,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <listen>:
SYSCALL(listen)
 875:	b8 1a 00 00 00       	mov    $0x1a,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <accept>:
SYSCALL(accept)
 87d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <recv>:
SYSCALL(recv)
 885:	b8 1c 00 00 00       	mov    $0x1c,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <send>:
SYSCALL(send)
 88d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <recvfrom>:
SYSCALL(recvfrom)
 895:	b8 1e 00 00 00       	mov    $0x1e,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <sendto>:
SYSCALL(sendto)
 89d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    
 8a5:	66 90                	xchg   %ax,%ax
 8a7:	66 90                	xchg   %ax,%ax
 8a9:	66 90                	xchg   %ax,%ax
 8ab:	66 90                	xchg   %ax,%ax
 8ad:	66 90                	xchg   %ax,%ax
 8af:	90                   	nop

000008b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
 8b4:	56                   	push   %esi
 8b5:	53                   	push   %ebx
 8b6:	83 ec 3c             	sub    $0x3c,%esp
 8b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8bc:	89 d1                	mov    %edx,%ecx
{
 8be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 8c1:	85 d2                	test   %edx,%edx
 8c3:	0f 89 7f 00 00 00    	jns    948 <printint+0x98>
 8c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8cd:	74 79                	je     948 <printint+0x98>
    neg = 1;
 8cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8d8:	31 db                	xor    %ebx,%ebx
 8da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8e0:	89 c8                	mov    %ecx,%eax
 8e2:	31 d2                	xor    %edx,%edx
 8e4:	89 cf                	mov    %ecx,%edi
 8e6:	f7 75 c4             	divl   -0x3c(%ebp)
 8e9:	0f b6 92 88 0d 00 00 	movzbl 0xd88(%edx),%edx
 8f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8f3:	89 d8                	mov    %ebx,%eax
 8f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 901:	76 dd                	jbe    8e0 <printint+0x30>
  if(neg)
 903:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 906:	85 c9                	test   %ecx,%ecx
 908:	74 0c                	je     916 <printint+0x66>
    buf[i++] = '-';
 90a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 90f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 911:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 916:	8b 7d b8             	mov    -0x48(%ebp),%edi
 919:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 91d:	eb 07                	jmp    926 <printint+0x76>
 91f:	90                   	nop
 920:	0f b6 13             	movzbl (%ebx),%edx
 923:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 926:	83 ec 04             	sub    $0x4,%esp
 929:	88 55 d7             	mov    %dl,-0x29(%ebp)
 92c:	6a 01                	push   $0x1
 92e:	56                   	push   %esi
 92f:	57                   	push   %edi
 930:	e8 a8 fe ff ff       	call   7dd <write>
  while(--i >= 0)
 935:	83 c4 10             	add    $0x10,%esp
 938:	39 de                	cmp    %ebx,%esi
 93a:	75 e4                	jne    920 <printint+0x70>
    putc(fd, buf[i]);
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 93f:	5b                   	pop    %ebx
 940:	5e                   	pop    %esi
 941:	5f                   	pop    %edi
 942:	5d                   	pop    %ebp
 943:	c3                   	ret    
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 948:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 94f:	eb 87                	jmp    8d8 <printint+0x28>
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop

00000960 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 960:	f3 0f 1e fb          	endbr32 
 964:	55                   	push   %ebp
 965:	89 e5                	mov    %esp,%ebp
 967:	57                   	push   %edi
 968:	56                   	push   %esi
 969:	53                   	push   %ebx
 96a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96d:	8b 75 0c             	mov    0xc(%ebp),%esi
 970:	0f b6 1e             	movzbl (%esi),%ebx
 973:	84 db                	test   %bl,%bl
 975:	0f 84 b4 00 00 00    	je     a2f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 97b:	8d 45 10             	lea    0x10(%ebp),%eax
 97e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 981:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 984:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 986:	89 45 d0             	mov    %eax,-0x30(%ebp)
 989:	eb 33                	jmp    9be <printf+0x5e>
 98b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop
 990:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 993:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 998:	83 f8 25             	cmp    $0x25,%eax
 99b:	74 17                	je     9b4 <printf+0x54>
  write(fd, &c, 1);
 99d:	83 ec 04             	sub    $0x4,%esp
 9a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9a3:	6a 01                	push   $0x1
 9a5:	57                   	push   %edi
 9a6:	ff 75 08             	pushl  0x8(%ebp)
 9a9:	e8 2f fe ff ff       	call   7dd <write>
 9ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 9b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 9b4:	0f b6 1e             	movzbl (%esi),%ebx
 9b7:	83 c6 01             	add    $0x1,%esi
 9ba:	84 db                	test   %bl,%bl
 9bc:	74 71                	je     a2f <printf+0xcf>
    c = fmt[i] & 0xff;
 9be:	0f be cb             	movsbl %bl,%ecx
 9c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9c4:	85 d2                	test   %edx,%edx
 9c6:	74 c8                	je     990 <printf+0x30>
      }
    } else if(state == '%'){
 9c8:	83 fa 25             	cmp    $0x25,%edx
 9cb:	75 e7                	jne    9b4 <printf+0x54>
      if(c == 'd'){
 9cd:	83 f8 64             	cmp    $0x64,%eax
 9d0:	0f 84 9a 00 00 00    	je     a70 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9dc:	83 f9 70             	cmp    $0x70,%ecx
 9df:	74 5f                	je     a40 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e1:	83 f8 73             	cmp    $0x73,%eax
 9e4:	0f 84 d6 00 00 00    	je     ac0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ea:	83 f8 63             	cmp    $0x63,%eax
 9ed:	0f 84 8d 00 00 00    	je     a80 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f3:	83 f8 25             	cmp    $0x25,%eax
 9f6:	0f 84 b4 00 00 00    	je     ab0 <printf+0x150>
  write(fd, &c, 1);
 9fc:	83 ec 04             	sub    $0x4,%esp
 9ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a03:	6a 01                	push   $0x1
 a05:	57                   	push   %edi
 a06:	ff 75 08             	pushl  0x8(%ebp)
 a09:	e8 cf fd ff ff       	call   7dd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a0e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a11:	83 c4 0c             	add    $0xc,%esp
 a14:	6a 01                	push   $0x1
 a16:	83 c6 01             	add    $0x1,%esi
 a19:	57                   	push   %edi
 a1a:	ff 75 08             	pushl  0x8(%ebp)
 a1d:	e8 bb fd ff ff       	call   7dd <write>
  for(i = 0; fmt[i]; i++){
 a22:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a26:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a29:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a2b:	84 db                	test   %bl,%bl
 a2d:	75 8f                	jne    9be <printf+0x5e>
    }
  }
}
 a2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a32:	5b                   	pop    %ebx
 a33:	5e                   	pop    %esi
 a34:	5f                   	pop    %edi
 a35:	5d                   	pop    %ebp
 a36:	c3                   	ret    
 a37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a40:	83 ec 0c             	sub    $0xc,%esp
 a43:	b9 10 00 00 00       	mov    $0x10,%ecx
 a48:	6a 00                	push   $0x0
 a4a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	8b 13                	mov    (%ebx),%edx
 a52:	e8 59 fe ff ff       	call   8b0 <printint>
        ap++;
 a57:	89 d8                	mov    %ebx,%eax
 a59:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a5c:	31 d2                	xor    %edx,%edx
        ap++;
 a5e:	83 c0 04             	add    $0x4,%eax
 a61:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a64:	e9 4b ff ff ff       	jmp    9b4 <printf+0x54>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a70:	83 ec 0c             	sub    $0xc,%esp
 a73:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a78:	6a 01                	push   $0x1
 a7a:	eb ce                	jmp    a4a <printf+0xea>
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a80:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a83:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a86:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a88:	6a 01                	push   $0x1
        ap++;
 a8a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a8d:	57                   	push   %edi
 a8e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a91:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a94:	e8 44 fd ff ff       	call   7dd <write>
        ap++;
 a99:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a9c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a9f:	31 d2                	xor    %edx,%edx
 aa1:	e9 0e ff ff ff       	jmp    9b4 <printf+0x54>
 aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 ab0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 ab3:	83 ec 04             	sub    $0x4,%esp
 ab6:	e9 59 ff ff ff       	jmp    a14 <printf+0xb4>
 abb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 abf:	90                   	nop
        s = (char*)*ap;
 ac0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ac3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ac5:	83 c0 04             	add    $0x4,%eax
 ac8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 acb:	85 db                	test   %ebx,%ebx
 acd:	74 17                	je     ae6 <printf+0x186>
        while(*s != 0){
 acf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 ad2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 ad4:	84 c0                	test   %al,%al
 ad6:	0f 84 d8 fe ff ff    	je     9b4 <printf+0x54>
 adc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 adf:	89 de                	mov    %ebx,%esi
 ae1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ae4:	eb 1a                	jmp    b00 <printf+0x1a0>
          s = "(null)";
 ae6:	bb 80 0d 00 00       	mov    $0xd80,%ebx
        while(*s != 0){
 aeb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 aee:	b8 28 00 00 00       	mov    $0x28,%eax
 af3:	89 de                	mov    %ebx,%esi
 af5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 af8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aff:	90                   	nop
  write(fd, &c, 1);
 b00:	83 ec 04             	sub    $0x4,%esp
          s++;
 b03:	83 c6 01             	add    $0x1,%esi
 b06:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b09:	6a 01                	push   $0x1
 b0b:	57                   	push   %edi
 b0c:	53                   	push   %ebx
 b0d:	e8 cb fc ff ff       	call   7dd <write>
        while(*s != 0){
 b12:	0f b6 06             	movzbl (%esi),%eax
 b15:	83 c4 10             	add    $0x10,%esp
 b18:	84 c0                	test   %al,%al
 b1a:	75 e4                	jne    b00 <printf+0x1a0>
 b1c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b1f:	31 d2                	xor    %edx,%edx
 b21:	e9 8e fe ff ff       	jmp    9b4 <printf+0x54>
 b26:	66 90                	xchg   %ax,%ax
 b28:	66 90                	xchg   %ax,%ax
 b2a:	66 90                	xchg   %ax,%ax
 b2c:	66 90                	xchg   %ax,%ax
 b2e:	66 90                	xchg   %ax,%ax

00000b30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b30:	f3 0f 1e fb          	endbr32 
 b34:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b35:	a1 54 11 00 00       	mov    0x1154,%eax
{
 b3a:	89 e5                	mov    %esp,%ebp
 b3c:	57                   	push   %edi
 b3d:	56                   	push   %esi
 b3e:	53                   	push   %ebx
 b3f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b42:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b44:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b47:	39 c8                	cmp    %ecx,%eax
 b49:	73 15                	jae    b60 <free+0x30>
 b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b4f:	90                   	nop
 b50:	39 d1                	cmp    %edx,%ecx
 b52:	72 14                	jb     b68 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b54:	39 d0                	cmp    %edx,%eax
 b56:	73 10                	jae    b68 <free+0x38>
{
 b58:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b5a:	8b 10                	mov    (%eax),%edx
 b5c:	39 c8                	cmp    %ecx,%eax
 b5e:	72 f0                	jb     b50 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b60:	39 d0                	cmp    %edx,%eax
 b62:	72 f4                	jb     b58 <free+0x28>
 b64:	39 d1                	cmp    %edx,%ecx
 b66:	73 f0                	jae    b58 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b68:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b6b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b6e:	39 fa                	cmp    %edi,%edx
 b70:	74 1e                	je     b90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b72:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b75:	8b 50 04             	mov    0x4(%eax),%edx
 b78:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b7b:	39 f1                	cmp    %esi,%ecx
 b7d:	74 28                	je     ba7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b7f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b81:	5b                   	pop    %ebx
  freep = p;
 b82:	a3 54 11 00 00       	mov    %eax,0x1154
}
 b87:	5e                   	pop    %esi
 b88:	5f                   	pop    %edi
 b89:	5d                   	pop    %ebp
 b8a:	c3                   	ret    
 b8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b8f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b90:	03 72 04             	add    0x4(%edx),%esi
 b93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b96:	8b 10                	mov    (%eax),%edx
 b98:	8b 12                	mov    (%edx),%edx
 b9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b9d:	8b 50 04             	mov    0x4(%eax),%edx
 ba0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ba3:	39 f1                	cmp    %esi,%ecx
 ba5:	75 d8                	jne    b7f <free+0x4f>
    p->s.size += bp->s.size;
 ba7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 baa:	a3 54 11 00 00       	mov    %eax,0x1154
    p->s.size += bp->s.size;
 baf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bb2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bb5:	89 10                	mov    %edx,(%eax)
}
 bb7:	5b                   	pop    %ebx
 bb8:	5e                   	pop    %esi
 bb9:	5f                   	pop    %edi
 bba:	5d                   	pop    %ebp
 bbb:	c3                   	ret    
 bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bc0:	f3 0f 1e fb          	endbr32 
 bc4:	55                   	push   %ebp
 bc5:	89 e5                	mov    %esp,%ebp
 bc7:	57                   	push   %edi
 bc8:	56                   	push   %esi
 bc9:	53                   	push   %ebx
 bca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bd0:	8b 3d 54 11 00 00    	mov    0x1154,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bd6:	8d 70 07             	lea    0x7(%eax),%esi
 bd9:	c1 ee 03             	shr    $0x3,%esi
 bdc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 bdf:	85 ff                	test   %edi,%edi
 be1:	0f 84 a9 00 00 00    	je     c90 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 be9:	8b 48 04             	mov    0x4(%eax),%ecx
 bec:	39 f1                	cmp    %esi,%ecx
 bee:	73 6d                	jae    c5d <malloc+0x9d>
 bf0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 bf6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 bfb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 bfe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 c05:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 c08:	eb 17                	jmp    c21 <malloc+0x61>
 c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c10:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c12:	8b 4a 04             	mov    0x4(%edx),%ecx
 c15:	39 f1                	cmp    %esi,%ecx
 c17:	73 4f                	jae    c68 <malloc+0xa8>
 c19:	8b 3d 54 11 00 00    	mov    0x1154,%edi
 c1f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c21:	39 c7                	cmp    %eax,%edi
 c23:	75 eb                	jne    c10 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c25:	83 ec 0c             	sub    $0xc,%esp
 c28:	ff 75 e4             	pushl  -0x1c(%ebp)
 c2b:	e8 15 fc ff ff       	call   845 <sbrk>
  if(p == (char*)-1)
 c30:	83 c4 10             	add    $0x10,%esp
 c33:	83 f8 ff             	cmp    $0xffffffff,%eax
 c36:	74 1b                	je     c53 <malloc+0x93>
  hp->s.size = nu;
 c38:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c3b:	83 ec 0c             	sub    $0xc,%esp
 c3e:	83 c0 08             	add    $0x8,%eax
 c41:	50                   	push   %eax
 c42:	e8 e9 fe ff ff       	call   b30 <free>
  return freep;
 c47:	a1 54 11 00 00       	mov    0x1154,%eax
      if((p = morecore(nunits)) == 0)
 c4c:	83 c4 10             	add    $0x10,%esp
 c4f:	85 c0                	test   %eax,%eax
 c51:	75 bd                	jne    c10 <malloc+0x50>
        return 0;
  }
}
 c53:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c56:	31 c0                	xor    %eax,%eax
}
 c58:	5b                   	pop    %ebx
 c59:	5e                   	pop    %esi
 c5a:	5f                   	pop    %edi
 c5b:	5d                   	pop    %ebp
 c5c:	c3                   	ret    
    if(p->s.size >= nunits){
 c5d:	89 c2                	mov    %eax,%edx
 c5f:	89 f8                	mov    %edi,%eax
 c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c68:	39 ce                	cmp    %ecx,%esi
 c6a:	74 54                	je     cc0 <malloc+0x100>
        p->s.size -= nunits;
 c6c:	29 f1                	sub    %esi,%ecx
 c6e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c71:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c74:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c77:	a3 54 11 00 00       	mov    %eax,0x1154
}
 c7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c7f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c82:	5b                   	pop    %ebx
 c83:	5e                   	pop    %esi
 c84:	5f                   	pop    %edi
 c85:	5d                   	pop    %ebp
 c86:	c3                   	ret    
 c87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c8e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c90:	c7 05 54 11 00 00 58 	movl   $0x1158,0x1154
 c97:	11 00 00 
    base.s.size = 0;
 c9a:	bf 58 11 00 00       	mov    $0x1158,%edi
    base.s.ptr = freep = prevp = &base;
 c9f:	c7 05 58 11 00 00 58 	movl   $0x1158,0x1158
 ca6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ca9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 cab:	c7 05 5c 11 00 00 00 	movl   $0x0,0x115c
 cb2:	00 00 00 
    if(p->s.size >= nunits){
 cb5:	e9 36 ff ff ff       	jmp    bf0 <malloc+0x30>
 cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 cc0:	8b 0a                	mov    (%edx),%ecx
 cc2:	89 08                	mov    %ecx,(%eax)
 cc4:	eb b1                	jmp    c77 <malloc+0xb7>
