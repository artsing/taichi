
build/bin/_zombie：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  15:	e8 db 06 00 00       	call   6f5 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7e 0d                	jle    2b <main+0x2b>
    sleep(5);  // Let child exit before parent.
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	6a 05                	push   $0x5
  23:	e8 65 07 00 00       	call   78d <sleep>
  28:	83 c4 10             	add    $0x10,%esp
  exit();
  2b:	e8 cd 06 00 00       	call   6fd <exit>

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	f3 0f 1e fb          	endbr32 
  34:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  35:	31 c0                	xor    %eax,%eax
{
  37:	89 e5                	mov    %esp,%ebp
  39:	53                   	push   %ebx
  3a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	89 c8                	mov    %ecx,%eax
  50:	5b                   	pop    %ebx
  51:	5d                   	pop    %ebp
  52:	c3                   	ret    
  53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	53                   	push   %ebx
  68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  6e:	0f b6 01             	movzbl (%ecx),%eax
  71:	0f b6 1a             	movzbl (%edx),%ebx
  74:	84 c0                	test   %al,%al
  76:	75 19                	jne    91 <strcmp+0x31>
  78:	eb 26                	jmp    a0 <strcmp+0x40>
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  84:	83 c1 01             	add    $0x1,%ecx
  87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  8a:	0f b6 1a             	movzbl (%edx),%ebx
  8d:	84 c0                	test   %al,%al
  8f:	74 0f                	je     a0 <strcmp+0x40>
  91:	38 d8                	cmp    %bl,%al
  93:	74 eb                	je     80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  95:	29 d8                	sub    %ebx,%eax
}
  97:	5b                   	pop    %ebx
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ba:	80 3a 00             	cmpb   $0x0,(%edx)
  bd:	74 21                	je     e0 <strlen+0x30>
  bf:	31 c0                	xor    %eax,%eax
  c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  cf:	89 c1                	mov    %eax,%ecx
  d1:	75 f5                	jne    c8 <strlen+0x18>
    ;
  return n;
}
  d3:	89 c8                	mov    %ecx,%eax
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	57                   	push   %edi
  f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	89 d7                	mov    %edx,%edi
 103:	fc                   	cld    
 104:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 106:	89 d0                	mov    %edx,%eax
 108:	5f                   	pop    %edi
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11e:	0f b6 10             	movzbl (%eax),%edx
 121:	84 d2                	test   %dl,%dl
 123:	75 16                	jne    13b <strchr+0x2b>
 125:	eb 21                	jmp    148 <strchr+0x38>
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
 130:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 134:	83 c0 01             	add    $0x1,%eax
 137:	84 d2                	test   %dl,%dl
 139:	74 0d                	je     148 <strchr+0x38>
    if(*s == c)
 13b:	38 d1                	cmp    %dl,%cl
 13d:	75 f1                	jne    130 <strchr+0x20>
      return (char*)s;
  return 0;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 148:	31 c0                	xor    %eax,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	57                   	push   %edi
 158:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 159:	31 f6                	xor    %esi,%esi
{
 15b:	53                   	push   %ebx
 15c:	89 f3                	mov    %esi,%ebx
 15e:	83 ec 1c             	sub    $0x1c,%esp
 161:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 164:	eb 33                	jmp    199 <gets+0x49>
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	8d 45 e7             	lea    -0x19(%ebp),%eax
 176:	6a 01                	push   $0x1
 178:	50                   	push   %eax
 179:	6a 00                	push   $0x0
 17b:	e8 95 05 00 00       	call   715 <read>
    if(cc < 1)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	7e 1c                	jle    1a3 <gets+0x53>
      break;
    buf[i++] = c;
 187:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 18b:	83 c7 01             	add    $0x1,%edi
 18e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 191:	3c 0a                	cmp    $0xa,%al
 193:	74 23                	je     1b8 <gets+0x68>
 195:	3c 0d                	cmp    $0xd,%al
 197:	74 1f                	je     1b8 <gets+0x68>
  for(i=0; i+1 < max; ){
 199:	83 c3 01             	add    $0x1,%ebx
 19c:	89 fe                	mov    %edi,%esi
 19e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a1:	7c cd                	jl     170 <gets+0x20>
 1a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1a8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ae:	5b                   	pop    %ebx
 1af:	5e                   	pop    %esi
 1b0:	5f                   	pop    %edi
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	8b 75 08             	mov    0x8(%ebp),%esi
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	01 de                	add    %ebx,%esi
 1c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1c2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c8:	5b                   	pop    %ebx
 1c9:	5e                   	pop    %esi
 1ca:	5f                   	pop    %edi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	pushl  0x8(%ebp)
 1e1:	e8 57 05 00 00       	call   73d <open>
  if(fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 2b                	js     218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1ed:	83 ec 08             	sub    $0x8,%esp
 1f0:	ff 75 0c             	pushl  0xc(%ebp)
 1f3:	89 c3                	mov    %eax,%ebx
 1f5:	50                   	push   %eax
 1f6:	e8 5a 05 00 00       	call   755 <fstat>
  close(fd);
 1fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fe:	89 c6                	mov    %eax,%esi
  close(fd);
 200:	e8 20 05 00 00       	call   725 <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20b:	89 f0                	mov    %esi,%eax
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 218:	be ff ff ff ff       	mov    $0xffffffff,%esi
 21d:	eb e9                	jmp    208 <stat+0x38>
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22b:	0f be 02             	movsbl (%edx),%eax
 22e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 231:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 234:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 239:	77 1a                	ja     255 <atoi+0x35>
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop
    n = n*10 + *s++ - '0';
 240:	83 c2 01             	add    $0x1,%edx
 243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 24a:	0f be 02             	movsbl (%edx),%eax
 24d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	89 c8                	mov    %ecx,%eax
 257:	5b                   	pop    %ebx
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	8b 45 10             	mov    0x10(%ebp),%eax
 26b:	8b 55 08             	mov    0x8(%ebp),%edx
 26e:	56                   	push   %esi
 26f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 272:	85 c0                	test   %eax,%eax
 274:	7e 0f                	jle    285 <memmove+0x25>
 276:	01 d0                	add    %edx,%eax
  dst = vdst;
 278:	89 d7                	mov    %edx,%edi
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 281:	39 f8                	cmp    %edi,%eax
 283:	75 fb                	jne    280 <memmove+0x20>
  return vdst;
}
 285:	5e                   	pop    %esi
 286:	89 d0                	mov    %edx,%eax
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	56                   	push   %esi
 299:	53                   	push   %ebx
 29a:	83 ec 34             	sub    $0x34,%esp
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2a0:	68 08 0c 00 00       	push   $0xc08
hexdump (void *data, size_t size) {
 2a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2ab:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 2ad:	89 c7                	mov    %eax,%edi
 2af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2b2:	e8 e9 05 00 00       	call   8a0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	85 ff                	test   %edi,%edi
 2bc:	0f 84 2d 01 00 00    	je     3ef <hexdump+0x15f>
 2c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2c5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2cc:	be 10 00 00 00       	mov    $0x10,%esi
 2d1:	83 e8 01             	sub    $0x1,%eax
 2d4:	83 e0 f0             	and    $0xfffffff0,%eax
 2d7:	83 c0 10             	add    $0x10,%eax
 2da:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 5c 0c 00 00       	push   $0xc5c
 2e8:	6a 01                	push   $0x1
 2ea:	e8 b1 05 00 00       	call   8a0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 2f9:	0f 8e 51 01 00 00    	jle    450 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 2ff:	8b 7d dc             	mov    -0x24(%ebp),%edi
 302:	83 ec 04             	sub    $0x4,%esp
 305:	57                   	push   %edi
 306:	89 fb                	mov    %edi,%ebx
 308:	68 59 0c 00 00       	push   $0xc59
 30d:	6a 01                	push   $0x1
 30f:	e8 8c 05 00 00       	call   8a0 <printf>
 314:	89 7d d8             	mov    %edi,-0x28(%ebp)
 317:	83 c4 10             	add    $0x10,%esp
 31a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 31d:	eb 28                	jmp    347 <hexdump+0xb7>
 31f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 320:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 324:	80 fa 0f             	cmp    $0xf,%dl
 327:	0f 86 e3 00 00 00    	jbe    410 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 32d:	83 ec 04             	sub    $0x4,%esp
 330:	83 c3 01             	add    $0x1,%ebx
 333:	52                   	push   %edx
 334:	68 5f 0c 00 00       	push   $0xc5f
 339:	6a 01                	push   $0x1
 33b:	e8 60 05 00 00       	call   8a0 <printf>
 340:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 343:	39 f3                	cmp    %esi,%ebx
 345:	74 1e                	je     365 <hexdump+0xd5>
      if(offset + index < (int)size) {
 347:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 34a:	7f d4                	jg     320 <hexdump+0x90>
      } else {
        printf(1, "   ");
 34c:	83 ec 08             	sub    $0x8,%esp
 34f:	83 c3 01             	add    $0x1,%ebx
 352:	68 63 0c 00 00       	push   $0xc63
 357:	6a 01                	push   $0x1
 359:	e8 42 05 00 00       	call   8a0 <printf>
 35e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 361:	39 f3                	cmp    %esi,%ebx
 363:	75 e2                	jne    347 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 365:	83 ec 08             	sub    $0x8,%esp
 368:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 36b:	68 5c 0c 00 00       	push   $0xc5c
 370:	6a 01                	push   $0x1
 372:	e8 29 05 00 00       	call   8a0 <printf>
 377:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 37a:	83 c4 10             	add    $0x10,%esp
 37d:	eb 1b                	jmp    39a <hexdump+0x10a>
 37f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	52                   	push   %edx
 384:	68 67 0c 00 00       	push   $0xc67
 389:	6a 01                	push   $0x1
 38b:	e8 10 05 00 00       	call   8a0 <printf>
 390:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 393:	83 c3 01             	add    $0x1,%ebx
 396:	39 de                	cmp    %ebx,%esi
 398:	74 30                	je     3ca <hexdump+0x13a>
      if(offset + index < (int)size) {
 39a:	39 df                	cmp    %ebx,%edi
 39c:	0f 8e 8e 00 00 00    	jle    430 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 3a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 3a5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 3a9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 3ac:	80 f9 5e             	cmp    $0x5e,%cl
 3af:	76 cf                	jbe    380 <hexdump+0xf0>
        } else {
          printf(1, ".");
 3b1:	83 ec 08             	sub    $0x8,%esp
 3b4:	83 c3 01             	add    $0x1,%ebx
 3b7:	68 6a 0c 00 00       	push   $0xc6a
 3bc:	6a 01                	push   $0x1
 3be:	e8 dd 04 00 00       	call   8a0 <printf>
 3c3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3c6:	39 de                	cmp    %ebx,%esi
 3c8:	75 d0                	jne    39a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 3ca:	83 ec 08             	sub    $0x8,%esp
 3cd:	83 c6 10             	add    $0x10,%esi
 3d0:	68 6c 0c 00 00       	push   $0xc6c
 3d5:	6a 01                	push   $0x1
 3d7:	e8 c4 04 00 00       	call   8a0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 3dc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 3e6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 3e9:	0f 85 f1 fe ff ff    	jne    2e0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3ef:	c7 45 0c 08 0c 00 00 	movl   $0xc08,0xc(%ebp)
 3f6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 3fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5f                   	pop    %edi
 403:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 404:	e9 97 04 00 00       	jmp    8a0 <printf>
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 410:	83 ec 08             	sub    $0x8,%esp
 413:	68 57 0c 00 00       	push   $0xc57
 418:	6a 01                	push   $0x1
 41a:	e8 81 04 00 00       	call   8a0 <printf>
 41f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 423:	83 c4 10             	add    $0x10,%esp
 426:	e9 02 ff ff ff       	jmp    32d <hexdump+0x9d>
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
        printf(1, " ");
 430:	83 ec 08             	sub    $0x8,%esp
 433:	68 65 0c 00 00       	push   $0xc65
 438:	6a 01                	push   $0x1
 43a:	e8 61 04 00 00       	call   8a0 <printf>
 43f:	83 c4 10             	add    $0x10,%esp
 442:	e9 4c ff ff ff       	jmp    393 <hexdump+0x103>
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 450:	83 ec 08             	sub    $0x8,%esp
 453:	68 57 0c 00 00       	push   $0xc57
 458:	6a 01                	push   $0x1
 45a:	e8 41 04 00 00       	call   8a0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 45f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 462:	83 c4 10             	add    $0x10,%esp
 465:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 46b:	0f 8f 8e fe ff ff    	jg     2ff <hexdump+0x6f>
 471:	83 ec 08             	sub    $0x8,%esp
 474:	68 57 0c 00 00       	push   $0xc57
 479:	6a 01                	push   $0x1
 47b:	e8 20 04 00 00       	call   8a0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 480:	83 c4 10             	add    $0x10,%esp
 483:	83 ff 0f             	cmp    $0xf,%edi
 486:	0f 8f 73 fe ff ff    	jg     2ff <hexdump+0x6f>
 48c:	83 ec 08             	sub    $0x8,%esp
 48f:	68 57 0c 00 00       	push   $0xc57
 494:	6a 01                	push   $0x1
 496:	e8 05 04 00 00       	call   8a0 <printf>
 49b:	83 c4 10             	add    $0x10,%esp
 49e:	e9 5c fe ff ff       	jmp    2ff <hexdump+0x6f>
 4a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
    if (!endian)
 4b5:	a1 34 10 00 00       	mov    0x1034,%eax
{
 4ba:	89 e5                	mov    %esp,%ebp
 4bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 4bf:	85 c0                	test   %eax,%eax
 4c1:	75 1d                	jne    4e0 <hton16+0x30>
        endian = byteorder();
 4c3:	c7 05 34 10 00 00 d2 	movl   $0x4d2,0x1034
 4ca:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 4cd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 4cf:	5d                   	pop    %ebp
 4d0:	66 c1 c2 08          	rol    $0x8,%dx
 4d4:	89 d0                	mov    %edx,%eax
 4d6:	c3                   	ret    
 4d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4de:	66 90                	xchg   %ax,%ax
 4e0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 4e2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 4e7:	74 e4                	je     4cd <hton16+0x1d>
}
 4e9:	89 d0                	mov    %edx,%eax
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <ntoh16>:
 4f0:	f3 0f 1e fb          	endbr32 
 4f4:	eb ba                	jmp    4b0 <hton16>
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi

00000500 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
    if (!endian)
 505:	8b 15 34 10 00 00    	mov    0x1034,%edx
{
 50b:	89 e5                	mov    %esp,%ebp
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 510:	85 d2                	test   %edx,%edx
 512:	75 14                	jne    528 <hton32+0x28>
        endian = byteorder();
 514:	c7 05 34 10 00 00 d2 	movl   $0x4d2,0x1034
 51b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 51e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 528:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 52e:	74 ee                	je     51e <hton32+0x1e>
}
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    
 532:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <ntoh32>:
 540:	f3 0f 1e fb          	endbr32 
 544:	eb ba                	jmp    500 <hton32>
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 550:	f3 0f 1e fb          	endbr32 
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	8b 4d 08             	mov    0x8(%ebp),%ecx
 55b:	56                   	push   %esi
 55c:	53                   	push   %ebx
 55d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 560:	0f b6 01             	movzbl (%ecx),%eax
 563:	3c 09                	cmp    $0x9,%al
 565:	74 09                	je     570 <strtol+0x20>
 567:	3c 20                	cmp    $0x20,%al
 569:	75 14                	jne    57f <strtol+0x2f>
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
 570:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 574:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 577:	3c 20                	cmp    $0x20,%al
 579:	74 f5                	je     570 <strtol+0x20>
 57b:	3c 09                	cmp    $0x9,%al
 57d:	74 f1                	je     570 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 57f:	3c 2b                	cmp    $0x2b,%al
 581:	0f 84 a9 00 00 00    	je     630 <strtol+0xe0>
    int neg = 0;
 587:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 589:	3c 2d                	cmp    $0x2d,%al
 58b:	0f 84 8f 00 00 00    	je     620 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 591:	0f be 11             	movsbl (%ecx),%edx
 594:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 59a:	75 12                	jne    5ae <strtol+0x5e>
 59c:	80 fa 30             	cmp    $0x30,%dl
 59f:	0f 84 9b 00 00 00    	je     640 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 5a5:	85 db                	test   %ebx,%ebx
 5a7:	75 05                	jne    5ae <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 5a9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 5ae:	89 5d 10             	mov    %ebx,0x10(%ebp)
 5b1:	31 c0                	xor    %eax,%eax
 5b3:	eb 17                	jmp    5cc <strtol+0x7c>
 5b5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 5b8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 5bb:	3b 55 10             	cmp    0x10(%ebp),%edx
 5be:	7d 28                	jge    5e8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 5c0:	0f af 45 10          	imul   0x10(%ebp),%eax
 5c4:	83 c1 01             	add    $0x1,%ecx
 5c7:	01 d0                	add    %edx,%eax
    while (1) {
 5c9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 5cc:	8d 72 d0             	lea    -0x30(%edx),%esi
 5cf:	89 f3                	mov    %esi,%ebx
 5d1:	80 fb 09             	cmp    $0x9,%bl
 5d4:	76 e2                	jbe    5b8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 5d6:	8d 72 9f             	lea    -0x61(%edx),%esi
 5d9:	89 f3                	mov    %esi,%ebx
 5db:	80 fb 19             	cmp    $0x19,%bl
 5de:	77 28                	ja     608 <strtol+0xb8>
            dig = *s - 'a' + 10;
 5e0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 5e3:	3b 55 10             	cmp    0x10(%ebp),%edx
 5e6:	7c d8                	jl     5c0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 5e8:	8b 55 0c             	mov    0xc(%ebp),%edx
 5eb:	85 d2                	test   %edx,%edx
 5ed:	74 05                	je     5f4 <strtol+0xa4>
        *endptr = (char *) s;
 5ef:	8b 75 0c             	mov    0xc(%ebp),%esi
 5f2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 5f4:	89 c2                	mov    %eax,%edx
}
 5f6:	5b                   	pop    %ebx
 5f7:	5e                   	pop    %esi
    return (neg ? -val : val);
 5f8:	f7 da                	neg    %edx
 5fa:	85 ff                	test   %edi,%edi
}
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 5fe:	0f 45 c2             	cmovne %edx,%eax
}
 601:	c3                   	ret    
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 608:	8d 72 bf             	lea    -0x41(%edx),%esi
 60b:	89 f3                	mov    %esi,%ebx
 60d:	80 fb 19             	cmp    $0x19,%bl
 610:	77 d6                	ja     5e8 <strtol+0x98>
            dig = *s - 'A' + 10;
 612:	83 ea 37             	sub    $0x37,%edx
 615:	eb a4                	jmp    5bb <strtol+0x6b>
 617:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 620:	83 c1 01             	add    $0x1,%ecx
 623:	bf 01 00 00 00       	mov    $0x1,%edi
 628:	e9 64 ff ff ff       	jmp    591 <strtol+0x41>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 630:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 633:	31 ff                	xor    %edi,%edi
 635:	e9 57 ff ff ff       	jmp    591 <strtol+0x41>
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 640:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 644:	3c 78                	cmp    $0x78,%al
 646:	74 18                	je     660 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 648:	85 db                	test   %ebx,%ebx
 64a:	0f 85 5e ff ff ff    	jne    5ae <strtol+0x5e>
        s++, base = 8;
 650:	83 c1 01             	add    $0x1,%ecx
 653:	0f be d0             	movsbl %al,%edx
 656:	bb 08 00 00 00       	mov    $0x8,%ebx
 65b:	e9 4e ff ff ff       	jmp    5ae <strtol+0x5e>
        s += 2, base = 16;
 660:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 664:	bb 10 00 00 00       	mov    $0x10,%ebx
 669:	83 c1 02             	add    $0x2,%ecx
 66c:	e9 3d ff ff ff       	jmp    5ae <strtol+0x5e>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop

00000680 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
 685:	89 e5                	mov    %esp,%ebp
 687:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 688:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 68a:	56                   	push   %esi
 68b:	53                   	push   %ebx
 68c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 68f:	83 ec 1c             	sub    $0x1c,%esp
 692:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 695:	83 ec 04             	sub    $0x4,%esp
 698:	6a 0a                	push   $0xa
 69a:	53                   	push   %ebx
 69b:	56                   	push   %esi
 69c:	e8 af fe ff ff       	call   550 <strtol>
        if (ret < 0 || ret > 255) {
 6a1:	83 c4 10             	add    $0x10,%esp
 6a4:	3d ff 00 00 00       	cmp    $0xff,%eax
 6a9:	77 3d                	ja     6e8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 6ab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 6ae:	39 f1                	cmp    %esi,%ecx
 6b0:	74 36                	je     6e8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 6b2:	0f b6 11             	movzbl (%ecx),%edx
 6b5:	83 ff 03             	cmp    $0x3,%edi
 6b8:	74 16                	je     6d0 <ip_addr_pton+0x50>
 6ba:	80 fa 2e             	cmp    $0x2e,%dl
 6bd:	75 29                	jne    6e8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 6bf:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 6c2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 6c5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 6c8:	83 c7 01             	add    $0x1,%edi
 6cb:	eb c8                	jmp    695 <ip_addr_pton+0x15>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 6d0:	84 d2                	test   %dl,%dl
 6d2:	75 14                	jne    6e8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 6d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 6d7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 6da:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 6dd:	31 c0                	xor    %eax,%eax
}
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 6eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 6f0:	5b                   	pop    %ebx
 6f1:	5e                   	pop    %esi
 6f2:	5f                   	pop    %edi
 6f3:	5d                   	pop    %ebp
 6f4:	c3                   	ret    

000006f5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6f5:	b8 01 00 00 00       	mov    $0x1,%eax
 6fa:	cd 40                	int    $0x40
 6fc:	c3                   	ret    

000006fd <exit>:
SYSCALL(exit)
 6fd:	b8 02 00 00 00       	mov    $0x2,%eax
 702:	cd 40                	int    $0x40
 704:	c3                   	ret    

00000705 <wait>:
SYSCALL(wait)
 705:	b8 03 00 00 00       	mov    $0x3,%eax
 70a:	cd 40                	int    $0x40
 70c:	c3                   	ret    

0000070d <pipe>:
SYSCALL(pipe)
 70d:	b8 04 00 00 00       	mov    $0x4,%eax
 712:	cd 40                	int    $0x40
 714:	c3                   	ret    

00000715 <read>:
SYSCALL(read)
 715:	b8 05 00 00 00       	mov    $0x5,%eax
 71a:	cd 40                	int    $0x40
 71c:	c3                   	ret    

0000071d <write>:
SYSCALL(write)
 71d:	b8 10 00 00 00       	mov    $0x10,%eax
 722:	cd 40                	int    $0x40
 724:	c3                   	ret    

00000725 <close>:
SYSCALL(close)
 725:	b8 15 00 00 00       	mov    $0x15,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <kill>:
SYSCALL(kill)
 72d:	b8 06 00 00 00       	mov    $0x6,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <exec>:
SYSCALL(exec)
 735:	b8 07 00 00 00       	mov    $0x7,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <open>:
SYSCALL(open)
 73d:	b8 0f 00 00 00       	mov    $0xf,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <mknod>:
SYSCALL(mknod)
 745:	b8 11 00 00 00       	mov    $0x11,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <unlink>:
SYSCALL(unlink)
 74d:	b8 12 00 00 00       	mov    $0x12,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <fstat>:
SYSCALL(fstat)
 755:	b8 08 00 00 00       	mov    $0x8,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <link>:
SYSCALL(link)
 75d:	b8 13 00 00 00       	mov    $0x13,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <mkdir>:
SYSCALL(mkdir)
 765:	b8 14 00 00 00       	mov    $0x14,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <chdir>:
SYSCALL(chdir)
 76d:	b8 09 00 00 00       	mov    $0x9,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <dup>:
SYSCALL(dup)
 775:	b8 0a 00 00 00       	mov    $0xa,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <getpid>:
SYSCALL(getpid)
 77d:	b8 0b 00 00 00       	mov    $0xb,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <sbrk>:
SYSCALL(sbrk)
 785:	b8 0c 00 00 00       	mov    $0xc,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <sleep>:
SYSCALL(sleep)
 78d:	b8 0d 00 00 00       	mov    $0xd,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <uptime>:
SYSCALL(uptime)
 795:	b8 0e 00 00 00       	mov    $0xe,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <ioctl>:
# iotcl
SYSCALL(ioctl)
 79d:	b8 16 00 00 00       	mov    $0x16,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <socket>:
# socket
SYSCALL(socket)
 7a5:	b8 17 00 00 00       	mov    $0x17,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <bind>:
SYSCALL(bind)
 7ad:	b8 19 00 00 00       	mov    $0x19,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <listen>:
SYSCALL(listen)
 7b5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <accept>:
SYSCALL(accept)
 7bd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <recv>:
SYSCALL(recv)
 7c5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <send>:
SYSCALL(send)
 7cd:	b8 1d 00 00 00       	mov    $0x1d,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <recvfrom>:
SYSCALL(recvfrom)
 7d5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <sendto>:
SYSCALL(sendto)
 7dd:	b8 1f 00 00 00       	mov    $0x1f,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    
 7e5:	66 90                	xchg   %ax,%ax
 7e7:	66 90                	xchg   %ax,%ax
 7e9:	66 90                	xchg   %ax,%ax
 7eb:	66 90                	xchg   %ax,%ax
 7ed:	66 90                	xchg   %ax,%ax
 7ef:	90                   	nop

000007f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 3c             	sub    $0x3c,%esp
 7f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7fc:	89 d1                	mov    %edx,%ecx
{
 7fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 801:	85 d2                	test   %edx,%edx
 803:	0f 89 7f 00 00 00    	jns    888 <printint+0x98>
 809:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 80d:	74 79                	je     888 <printint+0x98>
    neg = 1;
 80f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 816:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 818:	31 db                	xor    %ebx,%ebx
 81a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 820:	89 c8                	mov    %ecx,%eax
 822:	31 d2                	xor    %edx,%edx
 824:	89 cf                	mov    %ecx,%edi
 826:	f7 75 c4             	divl   -0x3c(%ebp)
 829:	0f b6 92 78 0c 00 00 	movzbl 0xc78(%edx),%edx
 830:	89 45 c0             	mov    %eax,-0x40(%ebp)
 833:	89 d8                	mov    %ebx,%eax
 835:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 838:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 83b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 83e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 841:	76 dd                	jbe    820 <printint+0x30>
  if(neg)
 843:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 846:	85 c9                	test   %ecx,%ecx
 848:	74 0c                	je     856 <printint+0x66>
    buf[i++] = '-';
 84a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 84f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 851:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 856:	8b 7d b8             	mov    -0x48(%ebp),%edi
 859:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 85d:	eb 07                	jmp    866 <printint+0x76>
 85f:	90                   	nop
 860:	0f b6 13             	movzbl (%ebx),%edx
 863:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 866:	83 ec 04             	sub    $0x4,%esp
 869:	88 55 d7             	mov    %dl,-0x29(%ebp)
 86c:	6a 01                	push   $0x1
 86e:	56                   	push   %esi
 86f:	57                   	push   %edi
 870:	e8 a8 fe ff ff       	call   71d <write>
  while(--i >= 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	39 de                	cmp    %ebx,%esi
 87a:	75 e4                	jne    860 <printint+0x70>
    putc(fd, buf[i]);
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87f:	5b                   	pop    %ebx
 880:	5e                   	pop    %esi
 881:	5f                   	pop    %edi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret    
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 888:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 88f:	eb 87                	jmp    818 <printint+0x28>
 891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop

000008a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8a0:	f3 0f 1e fb          	endbr32 
 8a4:	55                   	push   %ebp
 8a5:	89 e5                	mov    %esp,%ebp
 8a7:	57                   	push   %edi
 8a8:	56                   	push   %esi
 8a9:	53                   	push   %ebx
 8aa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ad:	8b 75 0c             	mov    0xc(%ebp),%esi
 8b0:	0f b6 1e             	movzbl (%esi),%ebx
 8b3:	84 db                	test   %bl,%bl
 8b5:	0f 84 b4 00 00 00    	je     96f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 8bb:	8d 45 10             	lea    0x10(%ebp),%eax
 8be:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 8c4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 8c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8c9:	eb 33                	jmp    8fe <printf+0x5e>
 8cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
 8d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 8d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 8d8:	83 f8 25             	cmp    $0x25,%eax
 8db:	74 17                	je     8f4 <printf+0x54>
  write(fd, &c, 1);
 8dd:	83 ec 04             	sub    $0x4,%esp
 8e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 8e3:	6a 01                	push   $0x1
 8e5:	57                   	push   %edi
 8e6:	ff 75 08             	pushl  0x8(%ebp)
 8e9:	e8 2f fe ff ff       	call   71d <write>
 8ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 8f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8f4:	0f b6 1e             	movzbl (%esi),%ebx
 8f7:	83 c6 01             	add    $0x1,%esi
 8fa:	84 db                	test   %bl,%bl
 8fc:	74 71                	je     96f <printf+0xcf>
    c = fmt[i] & 0xff;
 8fe:	0f be cb             	movsbl %bl,%ecx
 901:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 904:	85 d2                	test   %edx,%edx
 906:	74 c8                	je     8d0 <printf+0x30>
      }
    } else if(state == '%'){
 908:	83 fa 25             	cmp    $0x25,%edx
 90b:	75 e7                	jne    8f4 <printf+0x54>
      if(c == 'd'){
 90d:	83 f8 64             	cmp    $0x64,%eax
 910:	0f 84 9a 00 00 00    	je     9b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 916:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 91c:	83 f9 70             	cmp    $0x70,%ecx
 91f:	74 5f                	je     980 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 921:	83 f8 73             	cmp    $0x73,%eax
 924:	0f 84 d6 00 00 00    	je     a00 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 92a:	83 f8 63             	cmp    $0x63,%eax
 92d:	0f 84 8d 00 00 00    	je     9c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 933:	83 f8 25             	cmp    $0x25,%eax
 936:	0f 84 b4 00 00 00    	je     9f0 <printf+0x150>
  write(fd, &c, 1);
 93c:	83 ec 04             	sub    $0x4,%esp
 93f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 943:	6a 01                	push   $0x1
 945:	57                   	push   %edi
 946:	ff 75 08             	pushl  0x8(%ebp)
 949:	e8 cf fd ff ff       	call   71d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 94e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 951:	83 c4 0c             	add    $0xc,%esp
 954:	6a 01                	push   $0x1
 956:	83 c6 01             	add    $0x1,%esi
 959:	57                   	push   %edi
 95a:	ff 75 08             	pushl  0x8(%ebp)
 95d:	e8 bb fd ff ff       	call   71d <write>
  for(i = 0; fmt[i]; i++){
 962:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 966:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 969:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 96b:	84 db                	test   %bl,%bl
 96d:	75 8f                	jne    8fe <printf+0x5e>
    }
  }
}
 96f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
 977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	b9 10 00 00 00       	mov    $0x10,%ecx
 988:	6a 00                	push   $0x0
 98a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	8b 13                	mov    (%ebx),%edx
 992:	e8 59 fe ff ff       	call   7f0 <printint>
        ap++;
 997:	89 d8                	mov    %ebx,%eax
 999:	83 c4 10             	add    $0x10,%esp
      state = 0;
 99c:	31 d2                	xor    %edx,%edx
        ap++;
 99e:	83 c0 04             	add    $0x4,%eax
 9a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9a4:	e9 4b ff ff ff       	jmp    8f4 <printf+0x54>
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 9b0:	83 ec 0c             	sub    $0xc,%esp
 9b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9b8:	6a 01                	push   $0x1
 9ba:	eb ce                	jmp    98a <printf+0xea>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 9c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 9c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 9c8:	6a 01                	push   $0x1
        ap++;
 9ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 9cd:	57                   	push   %edi
 9ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 9d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9d4:	e8 44 fd ff ff       	call   71d <write>
        ap++;
 9d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 9dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9df:	31 d2                	xor    %edx,%edx
 9e1:	e9 0e ff ff ff       	jmp    8f4 <printf+0x54>
 9e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 9f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9f3:	83 ec 04             	sub    $0x4,%esp
 9f6:	e9 59 ff ff ff       	jmp    954 <printf+0xb4>
 9fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9ff:	90                   	nop
        s = (char*)*ap;
 a00:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a03:	8b 18                	mov    (%eax),%ebx
        ap++;
 a05:	83 c0 04             	add    $0x4,%eax
 a08:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a0b:	85 db                	test   %ebx,%ebx
 a0d:	74 17                	je     a26 <printf+0x186>
        while(*s != 0){
 a0f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a12:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a14:	84 c0                	test   %al,%al
 a16:	0f 84 d8 fe ff ff    	je     8f4 <printf+0x54>
 a1c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a1f:	89 de                	mov    %ebx,%esi
 a21:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a24:	eb 1a                	jmp    a40 <printf+0x1a0>
          s = "(null)";
 a26:	bb 70 0c 00 00       	mov    $0xc70,%ebx
        while(*s != 0){
 a2b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a2e:	b8 28 00 00 00       	mov    $0x28,%eax
 a33:	89 de                	mov    %ebx,%esi
 a35:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3f:	90                   	nop
  write(fd, &c, 1);
 a40:	83 ec 04             	sub    $0x4,%esp
          s++;
 a43:	83 c6 01             	add    $0x1,%esi
 a46:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a49:	6a 01                	push   $0x1
 a4b:	57                   	push   %edi
 a4c:	53                   	push   %ebx
 a4d:	e8 cb fc ff ff       	call   71d <write>
        while(*s != 0){
 a52:	0f b6 06             	movzbl (%esi),%eax
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	84 c0                	test   %al,%al
 a5a:	75 e4                	jne    a40 <printf+0x1a0>
 a5c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 a5f:	31 d2                	xor    %edx,%edx
 a61:	e9 8e fe ff ff       	jmp    8f4 <printf+0x54>
 a66:	66 90                	xchg   %ax,%ax
 a68:	66 90                	xchg   %ax,%ax
 a6a:	66 90                	xchg   %ax,%ax
 a6c:	66 90                	xchg   %ax,%ax
 a6e:	66 90                	xchg   %ax,%ax

00000a70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a70:	f3 0f 1e fb          	endbr32 
 a74:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a75:	a1 38 10 00 00       	mov    0x1038,%eax
{
 a7a:	89 e5                	mov    %esp,%ebp
 a7c:	57                   	push   %edi
 a7d:	56                   	push   %esi
 a7e:	53                   	push   %ebx
 a7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a82:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 a84:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a87:	39 c8                	cmp    %ecx,%eax
 a89:	73 15                	jae    aa0 <free+0x30>
 a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
 a90:	39 d1                	cmp    %edx,%ecx
 a92:	72 14                	jb     aa8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a94:	39 d0                	cmp    %edx,%eax
 a96:	73 10                	jae    aa8 <free+0x38>
{
 a98:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a9a:	8b 10                	mov    (%eax),%edx
 a9c:	39 c8                	cmp    %ecx,%eax
 a9e:	72 f0                	jb     a90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa0:	39 d0                	cmp    %edx,%eax
 aa2:	72 f4                	jb     a98 <free+0x28>
 aa4:	39 d1                	cmp    %edx,%ecx
 aa6:	73 f0                	jae    a98 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aa8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aae:	39 fa                	cmp    %edi,%edx
 ab0:	74 1e                	je     ad0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ab2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ab5:	8b 50 04             	mov    0x4(%eax),%edx
 ab8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 abb:	39 f1                	cmp    %esi,%ecx
 abd:	74 28                	je     ae7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 abf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 ac1:	5b                   	pop    %ebx
  freep = p;
 ac2:	a3 38 10 00 00       	mov    %eax,0x1038
}
 ac7:	5e                   	pop    %esi
 ac8:	5f                   	pop    %edi
 ac9:	5d                   	pop    %ebp
 aca:	c3                   	ret    
 acb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 ad0:	03 72 04             	add    0x4(%edx),%esi
 ad3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ad6:	8b 10                	mov    (%eax),%edx
 ad8:	8b 12                	mov    (%edx),%edx
 ada:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 add:	8b 50 04             	mov    0x4(%eax),%edx
 ae0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ae3:	39 f1                	cmp    %esi,%ecx
 ae5:	75 d8                	jne    abf <free+0x4f>
    p->s.size += bp->s.size;
 ae7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 aea:	a3 38 10 00 00       	mov    %eax,0x1038
    p->s.size += bp->s.size;
 aef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 af2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 af5:	89 10                	mov    %edx,(%eax)
}
 af7:	5b                   	pop    %ebx
 af8:	5e                   	pop    %esi
 af9:	5f                   	pop    %edi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b00:	f3 0f 1e fb          	endbr32 
 b04:	55                   	push   %ebp
 b05:	89 e5                	mov    %esp,%ebp
 b07:	57                   	push   %edi
 b08:	56                   	push   %esi
 b09:	53                   	push   %ebx
 b0a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b10:	8b 3d 38 10 00 00    	mov    0x1038,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b16:	8d 70 07             	lea    0x7(%eax),%esi
 b19:	c1 ee 03             	shr    $0x3,%esi
 b1c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b1f:	85 ff                	test   %edi,%edi
 b21:	0f 84 a9 00 00 00    	je     bd0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b27:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b29:	8b 48 04             	mov    0x4(%eax),%ecx
 b2c:	39 f1                	cmp    %esi,%ecx
 b2e:	73 6d                	jae    b9d <malloc+0x9d>
 b30:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b36:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b3b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b3e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 b45:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 b48:	eb 17                	jmp    b61 <malloc+0x61>
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b50:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 b52:	8b 4a 04             	mov    0x4(%edx),%ecx
 b55:	39 f1                	cmp    %esi,%ecx
 b57:	73 4f                	jae    ba8 <malloc+0xa8>
 b59:	8b 3d 38 10 00 00    	mov    0x1038,%edi
 b5f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b61:	39 c7                	cmp    %eax,%edi
 b63:	75 eb                	jne    b50 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 b65:	83 ec 0c             	sub    $0xc,%esp
 b68:	ff 75 e4             	pushl  -0x1c(%ebp)
 b6b:	e8 15 fc ff ff       	call   785 <sbrk>
  if(p == (char*)-1)
 b70:	83 c4 10             	add    $0x10,%esp
 b73:	83 f8 ff             	cmp    $0xffffffff,%eax
 b76:	74 1b                	je     b93 <malloc+0x93>
  hp->s.size = nu;
 b78:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b7b:	83 ec 0c             	sub    $0xc,%esp
 b7e:	83 c0 08             	add    $0x8,%eax
 b81:	50                   	push   %eax
 b82:	e8 e9 fe ff ff       	call   a70 <free>
  return freep;
 b87:	a1 38 10 00 00       	mov    0x1038,%eax
      if((p = morecore(nunits)) == 0)
 b8c:	83 c4 10             	add    $0x10,%esp
 b8f:	85 c0                	test   %eax,%eax
 b91:	75 bd                	jne    b50 <malloc+0x50>
        return 0;
  }
}
 b93:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b96:	31 c0                	xor    %eax,%eax
}
 b98:	5b                   	pop    %ebx
 b99:	5e                   	pop    %esi
 b9a:	5f                   	pop    %edi
 b9b:	5d                   	pop    %ebp
 b9c:	c3                   	ret    
    if(p->s.size >= nunits){
 b9d:	89 c2                	mov    %eax,%edx
 b9f:	89 f8                	mov    %edi,%eax
 ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ba8:	39 ce                	cmp    %ecx,%esi
 baa:	74 54                	je     c00 <malloc+0x100>
        p->s.size -= nunits;
 bac:	29 f1                	sub    %esi,%ecx
 bae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 bb1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 bb4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 bb7:	a3 38 10 00 00       	mov    %eax,0x1038
}
 bbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bbf:	8d 42 08             	lea    0x8(%edx),%eax
}
 bc2:	5b                   	pop    %ebx
 bc3:	5e                   	pop    %esi
 bc4:	5f                   	pop    %edi
 bc5:	5d                   	pop    %ebp
 bc6:	c3                   	ret    
 bc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 bd0:	c7 05 38 10 00 00 3c 	movl   $0x103c,0x1038
 bd7:	10 00 00 
    base.s.size = 0;
 bda:	bf 3c 10 00 00       	mov    $0x103c,%edi
    base.s.ptr = freep = prevp = &base;
 bdf:	c7 05 3c 10 00 00 3c 	movl   $0x103c,0x103c
 be6:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 beb:	c7 05 40 10 00 00 00 	movl   $0x0,0x1040
 bf2:	00 00 00 
    if(p->s.size >= nunits){
 bf5:	e9 36 ff ff ff       	jmp    b30 <malloc+0x30>
 bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c00:	8b 0a                	mov    (%edx),%ecx
 c02:	89 08                	mov    %ecx,(%eax)
 c04:	eb b1                	jmp    bb7 <malloc+0xb7>
