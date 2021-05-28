
build/bin/_ln：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   e:	83 39 03             	cmpl   $0x3,(%ecx)
{
  11:	55                   	push   %ebp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  19:	74 13                	je     2e <main+0x2e>
    printf(2, "Usage: ln old new\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 38 0c 00 00       	push   $0xc38
  22:	6a 02                	push   $0x2
  24:	e8 a7 08 00 00       	call   8d0 <printf>
    exit();
  29:	e8 ff 06 00 00       	call   72d <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 52 07 00 00       	call   78d <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 e6 06 00 00       	call   72d <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 4b 0c 00 00       	push   $0xc4b
  52:	6a 02                	push   $0x2
  54:	e8 77 08 00 00       	call   8d0 <printf>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	eb e4                	jmp    42 <main+0x42>
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  65:	31 c0                	xor    %eax,%eax
{
  67:	89 e5                	mov    %esp,%ebp
  69:	53                   	push   %ebx
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	89 c8                	mov    %ecx,%eax
  80:	5b                   	pop    %ebx
  81:	5d                   	pop    %ebp
  82:	c3                   	ret    
  83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9e:	0f b6 01             	movzbl (%ecx),%eax
  a1:	0f b6 1a             	movzbl (%edx),%ebx
  a4:	84 c0                	test   %al,%al
  a6:	75 19                	jne    c1 <strcmp+0x31>
  a8:	eb 26                	jmp    d0 <strcmp+0x40>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  b4:	83 c1 01             	add    $0x1,%ecx
  b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ba:	0f b6 1a             	movzbl (%edx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	38 d8                	cmp    %bl,%al
  c3:	74 eb                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	5b                   	pop    %ebx
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ea:	80 3a 00             	cmpb   $0x0,(%edx)
  ed:	74 21                	je     110 <strlen+0x30>
  ef:	31 c0                	xor    %eax,%eax
  f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f8:	83 c0 01             	add    $0x1,%eax
  fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ff:	89 c1                	mov    %eax,%ecx
 101:	75 f5                	jne    f8 <strlen+0x18>
    ;
  return n;
}
 103:	89 c8                	mov    %ecx,%eax
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 12b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12e:	8b 45 0c             	mov    0xc(%ebp),%eax
 131:	89 d7                	mov    %edx,%edi
 133:	fc                   	cld    
 134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 136:	89 d0                	mov    %edx,%eax
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14e:	0f b6 10             	movzbl (%eax),%edx
 151:	84 d2                	test   %dl,%dl
 153:	75 16                	jne    16b <strchr+0x2b>
 155:	eb 21                	jmp    178 <strchr+0x38>
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 164:	83 c0 01             	add    $0x1,%eax
 167:	84 d2                	test   %dl,%dl
 169:	74 0d                	je     178 <strchr+0x38>
    if(*s == c)
 16b:	38 d1                	cmp    %dl,%cl
 16d:	75 f1                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	31 f6                	xor    %esi,%esi
{
 18b:	53                   	push   %ebx
 18c:	89 f3                	mov    %esi,%ebx
 18e:	83 ec 1c             	sub    $0x1c,%esp
 191:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 194:	eb 33                	jmp    1c9 <gets+0x49>
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a6:	6a 01                	push   $0x1
 1a8:	50                   	push   %eax
 1a9:	6a 00                	push   $0x0
 1ab:	e8 95 05 00 00       	call   745 <read>
    if(cc < 1)
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	85 c0                	test   %eax,%eax
 1b5:	7e 1c                	jle    1d3 <gets+0x53>
      break;
    buf[i++] = c;
 1b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bb:	83 c7 01             	add    $0x1,%edi
 1be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c1:	3c 0a                	cmp    $0xa,%al
 1c3:	74 23                	je     1e8 <gets+0x68>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 1f                	je     1e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	89 fe                	mov    %edi,%esi
 1ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d1:	7c cd                	jl     1a0 <gets+0x20>
 1d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1de:	5b                   	pop    %ebx
 1df:	5e                   	pop    %esi
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	8b 75 08             	mov    0x8(%ebp),%esi
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	01 de                	add    %ebx,%esi
 1f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 57 05 00 00       	call   76d <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 2b                	js     248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	ff 75 0c             	pushl  0xc(%ebp)
 223:	89 c3                	mov    %eax,%ebx
 225:	50                   	push   %eax
 226:	e8 5a 05 00 00       	call   785 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 20 05 00 00       	call   755 <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23b:	89 f0                	mov    %esi,%eax
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 248:	be ff ff ff ff       	mov    $0xffffffff,%esi
 24d:	eb e9                	jmp    238 <stat+0x38>
 24f:	90                   	nop

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	53                   	push   %ebx
 258:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25b:	0f be 02             	movsbl (%edx),%eax
 25e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 261:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 264:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 269:	77 1a                	ja     285 <atoi+0x35>
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	89 c8                	mov    %ecx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	8b 45 10             	mov    0x10(%ebp),%eax
 29b:	8b 55 08             	mov    0x8(%ebp),%edx
 29e:	56                   	push   %esi
 29f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0f                	jle    2b5 <memmove+0x25>
 2a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
 2c9:	53                   	push   %ebx
 2ca:	83 ec 34             	sub    $0x34,%esp
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2d0:	68 60 0c 00 00       	push   $0xc60
hexdump (void *data, size_t size) {
 2d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2db:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 2dd:	89 c7                	mov    %eax,%edi
 2df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2e2:	e8 e9 05 00 00       	call   8d0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	85 ff                	test   %edi,%edi
 2ec:	0f 84 2d 01 00 00    	je     41f <hexdump+0x15f>
 2f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2fc:	be 10 00 00 00       	mov    $0x10,%esi
 301:	83 e8 01             	sub    $0x1,%eax
 304:	83 e0 f0             	and    $0xfffffff0,%eax
 307:	83 c0 10             	add    $0x10,%eax
 30a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 310:	83 ec 08             	sub    $0x8,%esp
 313:	68 b4 0c 00 00       	push   $0xcb4
 318:	6a 01                	push   $0x1
 31a:	e8 b1 05 00 00       	call   8d0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 31f:	83 c4 10             	add    $0x10,%esp
 322:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 329:	0f 8e 51 01 00 00    	jle    480 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 32f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 332:	83 ec 04             	sub    $0x4,%esp
 335:	57                   	push   %edi
 336:	89 fb                	mov    %edi,%ebx
 338:	68 b1 0c 00 00       	push   $0xcb1
 33d:	6a 01                	push   $0x1
 33f:	e8 8c 05 00 00       	call   8d0 <printf>
 344:	89 7d d8             	mov    %edi,-0x28(%ebp)
 347:	83 c4 10             	add    $0x10,%esp
 34a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 34d:	eb 28                	jmp    377 <hexdump+0xb7>
 34f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 350:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 354:	80 fa 0f             	cmp    $0xf,%dl
 357:	0f 86 e3 00 00 00    	jbe    440 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 35d:	83 ec 04             	sub    $0x4,%esp
 360:	83 c3 01             	add    $0x1,%ebx
 363:	52                   	push   %edx
 364:	68 b7 0c 00 00       	push   $0xcb7
 369:	6a 01                	push   $0x1
 36b:	e8 60 05 00 00       	call   8d0 <printf>
 370:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 373:	39 f3                	cmp    %esi,%ebx
 375:	74 1e                	je     395 <hexdump+0xd5>
      if(offset + index < (int)size) {
 377:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 37a:	7f d4                	jg     350 <hexdump+0x90>
      } else {
        printf(1, "   ");
 37c:	83 ec 08             	sub    $0x8,%esp
 37f:	83 c3 01             	add    $0x1,%ebx
 382:	68 bb 0c 00 00       	push   $0xcbb
 387:	6a 01                	push   $0x1
 389:	e8 42 05 00 00       	call   8d0 <printf>
 38e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 391:	39 f3                	cmp    %esi,%ebx
 393:	75 e2                	jne    377 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 395:	83 ec 08             	sub    $0x8,%esp
 398:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 39b:	68 b4 0c 00 00       	push   $0xcb4
 3a0:	6a 01                	push   $0x1
 3a2:	e8 29 05 00 00       	call   8d0 <printf>
 3a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3aa:	83 c4 10             	add    $0x10,%esp
 3ad:	eb 1b                	jmp    3ca <hexdump+0x10a>
 3af:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	52                   	push   %edx
 3b4:	68 bf 0c 00 00       	push   $0xcbf
 3b9:	6a 01                	push   $0x1
 3bb:	e8 10 05 00 00       	call   8d0 <printf>
 3c0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3c3:	83 c3 01             	add    $0x1,%ebx
 3c6:	39 de                	cmp    %ebx,%esi
 3c8:	74 30                	je     3fa <hexdump+0x13a>
      if(offset + index < (int)size) {
 3ca:	39 df                	cmp    %ebx,%edi
 3cc:	0f 8e 8e 00 00 00    	jle    460 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 3d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 3d5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 3d9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 3dc:	80 f9 5e             	cmp    $0x5e,%cl
 3df:	76 cf                	jbe    3b0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 3e1:	83 ec 08             	sub    $0x8,%esp
 3e4:	83 c3 01             	add    $0x1,%ebx
 3e7:	68 c2 0c 00 00       	push   $0xcc2
 3ec:	6a 01                	push   $0x1
 3ee:	e8 dd 04 00 00       	call   8d0 <printf>
 3f3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3f6:	39 de                	cmp    %ebx,%esi
 3f8:	75 d0                	jne    3ca <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 3fa:	83 ec 08             	sub    $0x8,%esp
 3fd:	83 c6 10             	add    $0x10,%esi
 400:	68 c4 0c 00 00       	push   $0xcc4
 405:	6a 01                	push   $0x1
 407:	e8 c4 04 00 00       	call   8d0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 40c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 410:	83 c4 10             	add    $0x10,%esp
 413:	8b 45 dc             	mov    -0x24(%ebp),%eax
 416:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 419:	0f 85 f1 fe ff ff    	jne    310 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 41f:	c7 45 0c 60 0c 00 00 	movl   $0xc60,0xc(%ebp)
 426:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 42d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 430:	5b                   	pop    %ebx
 431:	5e                   	pop    %esi
 432:	5f                   	pop    %edi
 433:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 434:	e9 97 04 00 00       	jmp    8d0 <printf>
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 440:	83 ec 08             	sub    $0x8,%esp
 443:	68 af 0c 00 00       	push   $0xcaf
 448:	6a 01                	push   $0x1
 44a:	e8 81 04 00 00       	call   8d0 <printf>
 44f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 453:	83 c4 10             	add    $0x10,%esp
 456:	e9 02 ff ff ff       	jmp    35d <hexdump+0x9d>
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop
        printf(1, " ");
 460:	83 ec 08             	sub    $0x8,%esp
 463:	68 bd 0c 00 00       	push   $0xcbd
 468:	6a 01                	push   $0x1
 46a:	e8 61 04 00 00       	call   8d0 <printf>
 46f:	83 c4 10             	add    $0x10,%esp
 472:	e9 4c ff ff ff       	jmp    3c3 <hexdump+0x103>
 477:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 480:	83 ec 08             	sub    $0x8,%esp
 483:	68 af 0c 00 00       	push   $0xcaf
 488:	6a 01                	push   $0x1
 48a:	e8 41 04 00 00       	call   8d0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 48f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 492:	83 c4 10             	add    $0x10,%esp
 495:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 49b:	0f 8f 8e fe ff ff    	jg     32f <hexdump+0x6f>
 4a1:	83 ec 08             	sub    $0x8,%esp
 4a4:	68 af 0c 00 00       	push   $0xcaf
 4a9:	6a 01                	push   $0x1
 4ab:	e8 20 04 00 00       	call   8d0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 4b0:	83 c4 10             	add    $0x10,%esp
 4b3:	83 ff 0f             	cmp    $0xf,%edi
 4b6:	0f 8f 73 fe ff ff    	jg     32f <hexdump+0x6f>
 4bc:	83 ec 08             	sub    $0x8,%esp
 4bf:	68 af 0c 00 00       	push   $0xcaf
 4c4:	6a 01                	push   $0x1
 4c6:	e8 05 04 00 00       	call   8d0 <printf>
 4cb:	83 c4 10             	add    $0x10,%esp
 4ce:	e9 5c fe ff ff       	jmp    32f <hexdump+0x6f>
 4d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004e0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
    if (!endian)
 4e5:	a1 90 10 00 00       	mov    0x1090,%eax
{
 4ea:	89 e5                	mov    %esp,%ebp
 4ec:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 4ef:	85 c0                	test   %eax,%eax
 4f1:	75 1d                	jne    510 <hton16+0x30>
        endian = byteorder();
 4f3:	c7 05 90 10 00 00 d2 	movl   $0x4d2,0x1090
 4fa:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 4fd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 4ff:	5d                   	pop    %ebp
 500:	66 c1 c2 08          	rol    $0x8,%dx
 504:	89 d0                	mov    %edx,%eax
 506:	c3                   	ret    
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax
 510:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 512:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 517:	74 e4                	je     4fd <hton16+0x1d>
}
 519:	89 d0                	mov    %edx,%eax
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi

00000520 <ntoh16>:
 520:	f3 0f 1e fb          	endbr32 
 524:	eb ba                	jmp    4e0 <hton16>
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
    if (!endian)
 535:	8b 15 90 10 00 00    	mov    0x1090,%edx
{
 53b:	89 e5                	mov    %esp,%ebp
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 540:	85 d2                	test   %edx,%edx
 542:	75 14                	jne    558 <hton32+0x28>
        endian = byteorder();
 544:	c7 05 90 10 00 00 d2 	movl   $0x4d2,0x1090
 54b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 54e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 558:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 55e:	74 ee                	je     54e <hton32+0x1e>
}
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    
 562:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <ntoh32>:
 570:	f3 0f 1e fb          	endbr32 
 574:	eb ba                	jmp    530 <hton32>
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi

00000580 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	8b 4d 08             	mov    0x8(%ebp),%ecx
 58b:	56                   	push   %esi
 58c:	53                   	push   %ebx
 58d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 590:	0f b6 01             	movzbl (%ecx),%eax
 593:	3c 09                	cmp    $0x9,%al
 595:	74 09                	je     5a0 <strtol+0x20>
 597:	3c 20                	cmp    $0x20,%al
 599:	75 14                	jne    5af <strtol+0x2f>
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
 5a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 5a4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 5a7:	3c 20                	cmp    $0x20,%al
 5a9:	74 f5                	je     5a0 <strtol+0x20>
 5ab:	3c 09                	cmp    $0x9,%al
 5ad:	74 f1                	je     5a0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 5af:	3c 2b                	cmp    $0x2b,%al
 5b1:	0f 84 a9 00 00 00    	je     660 <strtol+0xe0>
    int neg = 0;
 5b7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 5b9:	3c 2d                	cmp    $0x2d,%al
 5bb:	0f 84 8f 00 00 00    	je     650 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 5c1:	0f be 11             	movsbl (%ecx),%edx
 5c4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 5ca:	75 12                	jne    5de <strtol+0x5e>
 5cc:	80 fa 30             	cmp    $0x30,%dl
 5cf:	0f 84 9b 00 00 00    	je     670 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 5d5:	85 db                	test   %ebx,%ebx
 5d7:	75 05                	jne    5de <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 5d9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 5de:	89 5d 10             	mov    %ebx,0x10(%ebp)
 5e1:	31 c0                	xor    %eax,%eax
 5e3:	eb 17                	jmp    5fc <strtol+0x7c>
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 5e8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 5eb:	3b 55 10             	cmp    0x10(%ebp),%edx
 5ee:	7d 28                	jge    618 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 5f0:	0f af 45 10          	imul   0x10(%ebp),%eax
 5f4:	83 c1 01             	add    $0x1,%ecx
 5f7:	01 d0                	add    %edx,%eax
    while (1) {
 5f9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 5fc:	8d 72 d0             	lea    -0x30(%edx),%esi
 5ff:	89 f3                	mov    %esi,%ebx
 601:	80 fb 09             	cmp    $0x9,%bl
 604:	76 e2                	jbe    5e8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 606:	8d 72 9f             	lea    -0x61(%edx),%esi
 609:	89 f3                	mov    %esi,%ebx
 60b:	80 fb 19             	cmp    $0x19,%bl
 60e:	77 28                	ja     638 <strtol+0xb8>
            dig = *s - 'a' + 10;
 610:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 613:	3b 55 10             	cmp    0x10(%ebp),%edx
 616:	7c d8                	jl     5f0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 618:	8b 55 0c             	mov    0xc(%ebp),%edx
 61b:	85 d2                	test   %edx,%edx
 61d:	74 05                	je     624 <strtol+0xa4>
        *endptr = (char *) s;
 61f:	8b 75 0c             	mov    0xc(%ebp),%esi
 622:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 624:	89 c2                	mov    %eax,%edx
}
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
    return (neg ? -val : val);
 628:	f7 da                	neg    %edx
 62a:	85 ff                	test   %edi,%edi
}
 62c:	5f                   	pop    %edi
 62d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 62e:	0f 45 c2             	cmovne %edx,%eax
}
 631:	c3                   	ret    
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 638:	8d 72 bf             	lea    -0x41(%edx),%esi
 63b:	89 f3                	mov    %esi,%ebx
 63d:	80 fb 19             	cmp    $0x19,%bl
 640:	77 d6                	ja     618 <strtol+0x98>
            dig = *s - 'A' + 10;
 642:	83 ea 37             	sub    $0x37,%edx
 645:	eb a4                	jmp    5eb <strtol+0x6b>
 647:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 650:	83 c1 01             	add    $0x1,%ecx
 653:	bf 01 00 00 00       	mov    $0x1,%edi
 658:	e9 64 ff ff ff       	jmp    5c1 <strtol+0x41>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 660:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 663:	31 ff                	xor    %edi,%edi
 665:	e9 57 ff ff ff       	jmp    5c1 <strtol+0x41>
 66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 670:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 674:	3c 78                	cmp    $0x78,%al
 676:	74 18                	je     690 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 678:	85 db                	test   %ebx,%ebx
 67a:	0f 85 5e ff ff ff    	jne    5de <strtol+0x5e>
        s++, base = 8;
 680:	83 c1 01             	add    $0x1,%ecx
 683:	0f be d0             	movsbl %al,%edx
 686:	bb 08 00 00 00       	mov    $0x8,%ebx
 68b:	e9 4e ff ff ff       	jmp    5de <strtol+0x5e>
        s += 2, base = 16;
 690:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 694:	bb 10 00 00 00       	mov    $0x10,%ebx
 699:	83 c1 02             	add    $0x2,%ecx
 69c:	e9 3d ff ff ff       	jmp    5de <strtol+0x5e>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop

000006b0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 6b8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 6ba:	56                   	push   %esi
 6bb:	53                   	push   %ebx
 6bc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 6bf:	83 ec 1c             	sub    $0x1c,%esp
 6c2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 6c5:	83 ec 04             	sub    $0x4,%esp
 6c8:	6a 0a                	push   $0xa
 6ca:	53                   	push   %ebx
 6cb:	56                   	push   %esi
 6cc:	e8 af fe ff ff       	call   580 <strtol>
        if (ret < 0 || ret > 255) {
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	3d ff 00 00 00       	cmp    $0xff,%eax
 6d9:	77 3d                	ja     718 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 6db:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 6de:	39 f1                	cmp    %esi,%ecx
 6e0:	74 36                	je     718 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 6e2:	0f b6 11             	movzbl (%ecx),%edx
 6e5:	83 ff 03             	cmp    $0x3,%edi
 6e8:	74 16                	je     700 <ip_addr_pton+0x50>
 6ea:	80 fa 2e             	cmp    $0x2e,%dl
 6ed:	75 29                	jne    718 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 6ef:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 6f2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 6f5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 6f8:	83 c7 01             	add    $0x1,%edi
 6fb:	eb c8                	jmp    6c5 <ip_addr_pton+0x15>
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 700:	84 d2                	test   %dl,%dl
 702:	75 14                	jne    718 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 704:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 707:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 70a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 70d:	31 c0                	xor    %eax,%eax
}
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 718:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 71b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 720:	5b                   	pop    %ebx
 721:	5e                   	pop    %esi
 722:	5f                   	pop    %edi
 723:	5d                   	pop    %ebp
 724:	c3                   	ret    

00000725 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 725:	b8 01 00 00 00       	mov    $0x1,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <exit>:
SYSCALL(exit)
 72d:	b8 02 00 00 00       	mov    $0x2,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <wait>:
SYSCALL(wait)
 735:	b8 03 00 00 00       	mov    $0x3,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <pipe>:
SYSCALL(pipe)
 73d:	b8 04 00 00 00       	mov    $0x4,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <read>:
SYSCALL(read)
 745:	b8 05 00 00 00       	mov    $0x5,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <write>:
SYSCALL(write)
 74d:	b8 10 00 00 00       	mov    $0x10,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <close>:
SYSCALL(close)
 755:	b8 15 00 00 00       	mov    $0x15,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <kill>:
SYSCALL(kill)
 75d:	b8 06 00 00 00       	mov    $0x6,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <exec>:
SYSCALL(exec)
 765:	b8 07 00 00 00       	mov    $0x7,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <open>:
SYSCALL(open)
 76d:	b8 0f 00 00 00       	mov    $0xf,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <mknod>:
SYSCALL(mknod)
 775:	b8 11 00 00 00       	mov    $0x11,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <unlink>:
SYSCALL(unlink)
 77d:	b8 12 00 00 00       	mov    $0x12,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <fstat>:
SYSCALL(fstat)
 785:	b8 08 00 00 00       	mov    $0x8,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <link>:
SYSCALL(link)
 78d:	b8 13 00 00 00       	mov    $0x13,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <mkdir>:
SYSCALL(mkdir)
 795:	b8 14 00 00 00       	mov    $0x14,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <chdir>:
SYSCALL(chdir)
 79d:	b8 09 00 00 00       	mov    $0x9,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <dup>:
SYSCALL(dup)
 7a5:	b8 0a 00 00 00       	mov    $0xa,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <getpid>:
SYSCALL(getpid)
 7ad:	b8 0b 00 00 00       	mov    $0xb,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <sbrk>:
SYSCALL(sbrk)
 7b5:	b8 0c 00 00 00       	mov    $0xc,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <sleep>:
SYSCALL(sleep)
 7bd:	b8 0d 00 00 00       	mov    $0xd,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <uptime>:
SYSCALL(uptime)
 7c5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <ioctl>:
# iotcl
SYSCALL(ioctl)
 7cd:	b8 16 00 00 00       	mov    $0x16,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <socket>:
# socket
SYSCALL(socket)
 7d5:	b8 17 00 00 00       	mov    $0x17,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <bind>:
SYSCALL(bind)
 7dd:	b8 19 00 00 00       	mov    $0x19,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <listen>:
SYSCALL(listen)
 7e5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <accept>:
SYSCALL(accept)
 7ed:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <recv>:
SYSCALL(recv)
 7f5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <send>:
SYSCALL(send)
 7fd:	b8 1d 00 00 00       	mov    $0x1d,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <recvfrom>:
SYSCALL(recvfrom)
 805:	b8 1e 00 00 00       	mov    $0x1e,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <sendto>:
SYSCALL(sendto)
 80d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    
 815:	66 90                	xchg   %ax,%ax
 817:	66 90                	xchg   %ax,%ax
 819:	66 90                	xchg   %ax,%ax
 81b:	66 90                	xchg   %ax,%ax
 81d:	66 90                	xchg   %ax,%ax
 81f:	90                   	nop

00000820 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 3c             	sub    $0x3c,%esp
 829:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 82c:	89 d1                	mov    %edx,%ecx
{
 82e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 831:	85 d2                	test   %edx,%edx
 833:	0f 89 7f 00 00 00    	jns    8b8 <printint+0x98>
 839:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 83d:	74 79                	je     8b8 <printint+0x98>
    neg = 1;
 83f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 846:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 848:	31 db                	xor    %ebx,%ebx
 84a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 850:	89 c8                	mov    %ecx,%eax
 852:	31 d2                	xor    %edx,%edx
 854:	89 cf                	mov    %ecx,%edi
 856:	f7 75 c4             	divl   -0x3c(%ebp)
 859:	0f b6 92 d0 0c 00 00 	movzbl 0xcd0(%edx),%edx
 860:	89 45 c0             	mov    %eax,-0x40(%ebp)
 863:	89 d8                	mov    %ebx,%eax
 865:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 868:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 86b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 86e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 871:	76 dd                	jbe    850 <printint+0x30>
  if(neg)
 873:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 876:	85 c9                	test   %ecx,%ecx
 878:	74 0c                	je     886 <printint+0x66>
    buf[i++] = '-';
 87a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 87f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 881:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 886:	8b 7d b8             	mov    -0x48(%ebp),%edi
 889:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 88d:	eb 07                	jmp    896 <printint+0x76>
 88f:	90                   	nop
 890:	0f b6 13             	movzbl (%ebx),%edx
 893:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 896:	83 ec 04             	sub    $0x4,%esp
 899:	88 55 d7             	mov    %dl,-0x29(%ebp)
 89c:	6a 01                	push   $0x1
 89e:	56                   	push   %esi
 89f:	57                   	push   %edi
 8a0:	e8 a8 fe ff ff       	call   74d <write>
  while(--i >= 0)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	39 de                	cmp    %ebx,%esi
 8aa:	75 e4                	jne    890 <printint+0x70>
    putc(fd, buf[i]);
}
 8ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8af:	5b                   	pop    %ebx
 8b0:	5e                   	pop    %esi
 8b1:	5f                   	pop    %edi
 8b2:	5d                   	pop    %ebp
 8b3:	c3                   	ret    
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8bf:	eb 87                	jmp    848 <printint+0x28>
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop

000008d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8d0:	f3 0f 1e fb          	endbr32 
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	57                   	push   %edi
 8d8:	56                   	push   %esi
 8d9:	53                   	push   %ebx
 8da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 8e0:	0f b6 1e             	movzbl (%esi),%ebx
 8e3:	84 db                	test   %bl,%bl
 8e5:	0f 84 b4 00 00 00    	je     99f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 8eb:	8d 45 10             	lea    0x10(%ebp),%eax
 8ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 8f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 8f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8f9:	eb 33                	jmp    92e <printf+0x5e>
 8fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8ff:	90                   	nop
 900:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 903:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 908:	83 f8 25             	cmp    $0x25,%eax
 90b:	74 17                	je     924 <printf+0x54>
  write(fd, &c, 1);
 90d:	83 ec 04             	sub    $0x4,%esp
 910:	88 5d e7             	mov    %bl,-0x19(%ebp)
 913:	6a 01                	push   $0x1
 915:	57                   	push   %edi
 916:	ff 75 08             	pushl  0x8(%ebp)
 919:	e8 2f fe ff ff       	call   74d <write>
 91e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 921:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 924:	0f b6 1e             	movzbl (%esi),%ebx
 927:	83 c6 01             	add    $0x1,%esi
 92a:	84 db                	test   %bl,%bl
 92c:	74 71                	je     99f <printf+0xcf>
    c = fmt[i] & 0xff;
 92e:	0f be cb             	movsbl %bl,%ecx
 931:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 934:	85 d2                	test   %edx,%edx
 936:	74 c8                	je     900 <printf+0x30>
      }
    } else if(state == '%'){
 938:	83 fa 25             	cmp    $0x25,%edx
 93b:	75 e7                	jne    924 <printf+0x54>
      if(c == 'd'){
 93d:	83 f8 64             	cmp    $0x64,%eax
 940:	0f 84 9a 00 00 00    	je     9e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 946:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 94c:	83 f9 70             	cmp    $0x70,%ecx
 94f:	74 5f                	je     9b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 951:	83 f8 73             	cmp    $0x73,%eax
 954:	0f 84 d6 00 00 00    	je     a30 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 95a:	83 f8 63             	cmp    $0x63,%eax
 95d:	0f 84 8d 00 00 00    	je     9f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 963:	83 f8 25             	cmp    $0x25,%eax
 966:	0f 84 b4 00 00 00    	je     a20 <printf+0x150>
  write(fd, &c, 1);
 96c:	83 ec 04             	sub    $0x4,%esp
 96f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 973:	6a 01                	push   $0x1
 975:	57                   	push   %edi
 976:	ff 75 08             	pushl  0x8(%ebp)
 979:	e8 cf fd ff ff       	call   74d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 97e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 981:	83 c4 0c             	add    $0xc,%esp
 984:	6a 01                	push   $0x1
 986:	83 c6 01             	add    $0x1,%esi
 989:	57                   	push   %edi
 98a:	ff 75 08             	pushl  0x8(%ebp)
 98d:	e8 bb fd ff ff       	call   74d <write>
  for(i = 0; fmt[i]; i++){
 992:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 996:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 999:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 99b:	84 db                	test   %bl,%bl
 99d:	75 8f                	jne    92e <printf+0x5e>
    }
  }
}
 99f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9a2:	5b                   	pop    %ebx
 9a3:	5e                   	pop    %esi
 9a4:	5f                   	pop    %edi
 9a5:	5d                   	pop    %ebp
 9a6:	c3                   	ret    
 9a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 9b0:	83 ec 0c             	sub    $0xc,%esp
 9b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9b8:	6a 00                	push   $0x0
 9ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 9bd:	8b 45 08             	mov    0x8(%ebp),%eax
 9c0:	8b 13                	mov    (%ebx),%edx
 9c2:	e8 59 fe ff ff       	call   820 <printint>
        ap++;
 9c7:	89 d8                	mov    %ebx,%eax
 9c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9cc:	31 d2                	xor    %edx,%edx
        ap++;
 9ce:	83 c0 04             	add    $0x4,%eax
 9d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9d4:	e9 4b ff ff ff       	jmp    924 <printf+0x54>
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 9e0:	83 ec 0c             	sub    $0xc,%esp
 9e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9e8:	6a 01                	push   $0x1
 9ea:	eb ce                	jmp    9ba <printf+0xea>
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 9f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 9f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 9f8:	6a 01                	push   $0x1
        ap++;
 9fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 9fd:	57                   	push   %edi
 9fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a01:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a04:	e8 44 fd ff ff       	call   74d <write>
        ap++;
 a09:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a0c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a0f:	31 d2                	xor    %edx,%edx
 a11:	e9 0e ff ff ff       	jmp    924 <printf+0x54>
 a16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a20:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a23:	83 ec 04             	sub    $0x4,%esp
 a26:	e9 59 ff ff ff       	jmp    984 <printf+0xb4>
 a2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop
        s = (char*)*ap;
 a30:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a33:	8b 18                	mov    (%eax),%ebx
        ap++;
 a35:	83 c0 04             	add    $0x4,%eax
 a38:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a3b:	85 db                	test   %ebx,%ebx
 a3d:	74 17                	je     a56 <printf+0x186>
        while(*s != 0){
 a3f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a42:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a44:	84 c0                	test   %al,%al
 a46:	0f 84 d8 fe ff ff    	je     924 <printf+0x54>
 a4c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a4f:	89 de                	mov    %ebx,%esi
 a51:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a54:	eb 1a                	jmp    a70 <printf+0x1a0>
          s = "(null)";
 a56:	bb c8 0c 00 00       	mov    $0xcc8,%ebx
        while(*s != 0){
 a5b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a5e:	b8 28 00 00 00       	mov    $0x28,%eax
 a63:	89 de                	mov    %ebx,%esi
 a65:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a6f:	90                   	nop
  write(fd, &c, 1);
 a70:	83 ec 04             	sub    $0x4,%esp
          s++;
 a73:	83 c6 01             	add    $0x1,%esi
 a76:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a79:	6a 01                	push   $0x1
 a7b:	57                   	push   %edi
 a7c:	53                   	push   %ebx
 a7d:	e8 cb fc ff ff       	call   74d <write>
        while(*s != 0){
 a82:	0f b6 06             	movzbl (%esi),%eax
 a85:	83 c4 10             	add    $0x10,%esp
 a88:	84 c0                	test   %al,%al
 a8a:	75 e4                	jne    a70 <printf+0x1a0>
 a8c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 a8f:	31 d2                	xor    %edx,%edx
 a91:	e9 8e fe ff ff       	jmp    924 <printf+0x54>
 a96:	66 90                	xchg   %ax,%ax
 a98:	66 90                	xchg   %ax,%ax
 a9a:	66 90                	xchg   %ax,%ax
 a9c:	66 90                	xchg   %ax,%ax
 a9e:	66 90                	xchg   %ax,%ax

00000aa0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 aa0:	f3 0f 1e fb          	endbr32 
 aa4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aa5:	a1 94 10 00 00       	mov    0x1094,%eax
{
 aaa:	89 e5                	mov    %esp,%ebp
 aac:	57                   	push   %edi
 aad:	56                   	push   %esi
 aae:	53                   	push   %ebx
 aaf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ab2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 ab4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab7:	39 c8                	cmp    %ecx,%eax
 ab9:	73 15                	jae    ad0 <free+0x30>
 abb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 abf:	90                   	nop
 ac0:	39 d1                	cmp    %edx,%ecx
 ac2:	72 14                	jb     ad8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac4:	39 d0                	cmp    %edx,%eax
 ac6:	73 10                	jae    ad8 <free+0x38>
{
 ac8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aca:	8b 10                	mov    (%eax),%edx
 acc:	39 c8                	cmp    %ecx,%eax
 ace:	72 f0                	jb     ac0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad0:	39 d0                	cmp    %edx,%eax
 ad2:	72 f4                	jb     ac8 <free+0x28>
 ad4:	39 d1                	cmp    %edx,%ecx
 ad6:	73 f0                	jae    ac8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 adb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ade:	39 fa                	cmp    %edi,%edx
 ae0:	74 1e                	je     b00 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ae2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ae5:	8b 50 04             	mov    0x4(%eax),%edx
 ae8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 aeb:	39 f1                	cmp    %esi,%ecx
 aed:	74 28                	je     b17 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 aef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 af1:	5b                   	pop    %ebx
  freep = p;
 af2:	a3 94 10 00 00       	mov    %eax,0x1094
}
 af7:	5e                   	pop    %esi
 af8:	5f                   	pop    %edi
 af9:	5d                   	pop    %ebp
 afa:	c3                   	ret    
 afb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b00:	03 72 04             	add    0x4(%edx),%esi
 b03:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b06:	8b 10                	mov    (%eax),%edx
 b08:	8b 12                	mov    (%edx),%edx
 b0a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b0d:	8b 50 04             	mov    0x4(%eax),%edx
 b10:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b13:	39 f1                	cmp    %esi,%ecx
 b15:	75 d8                	jne    aef <free+0x4f>
    p->s.size += bp->s.size;
 b17:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b1a:	a3 94 10 00 00       	mov    %eax,0x1094
    p->s.size += bp->s.size;
 b1f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b22:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b25:	89 10                	mov    %edx,(%eax)
}
 b27:	5b                   	pop    %ebx
 b28:	5e                   	pop    %esi
 b29:	5f                   	pop    %edi
 b2a:	5d                   	pop    %ebp
 b2b:	c3                   	ret    
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b30:	f3 0f 1e fb          	endbr32 
 b34:	55                   	push   %ebp
 b35:	89 e5                	mov    %esp,%ebp
 b37:	57                   	push   %edi
 b38:	56                   	push   %esi
 b39:	53                   	push   %ebx
 b3a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b3d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b40:	8b 3d 94 10 00 00    	mov    0x1094,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b46:	8d 70 07             	lea    0x7(%eax),%esi
 b49:	c1 ee 03             	shr    $0x3,%esi
 b4c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b4f:	85 ff                	test   %edi,%edi
 b51:	0f 84 a9 00 00 00    	je     c00 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b57:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b59:	8b 48 04             	mov    0x4(%eax),%ecx
 b5c:	39 f1                	cmp    %esi,%ecx
 b5e:	73 6d                	jae    bcd <malloc+0x9d>
 b60:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b66:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b6b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b6e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 b75:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 b78:	eb 17                	jmp    b91 <malloc+0x61>
 b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b80:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 b82:	8b 4a 04             	mov    0x4(%edx),%ecx
 b85:	39 f1                	cmp    %esi,%ecx
 b87:	73 4f                	jae    bd8 <malloc+0xa8>
 b89:	8b 3d 94 10 00 00    	mov    0x1094,%edi
 b8f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b91:	39 c7                	cmp    %eax,%edi
 b93:	75 eb                	jne    b80 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 b95:	83 ec 0c             	sub    $0xc,%esp
 b98:	ff 75 e4             	pushl  -0x1c(%ebp)
 b9b:	e8 15 fc ff ff       	call   7b5 <sbrk>
  if(p == (char*)-1)
 ba0:	83 c4 10             	add    $0x10,%esp
 ba3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ba6:	74 1b                	je     bc3 <malloc+0x93>
  hp->s.size = nu;
 ba8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bab:	83 ec 0c             	sub    $0xc,%esp
 bae:	83 c0 08             	add    $0x8,%eax
 bb1:	50                   	push   %eax
 bb2:	e8 e9 fe ff ff       	call   aa0 <free>
  return freep;
 bb7:	a1 94 10 00 00       	mov    0x1094,%eax
      if((p = morecore(nunits)) == 0)
 bbc:	83 c4 10             	add    $0x10,%esp
 bbf:	85 c0                	test   %eax,%eax
 bc1:	75 bd                	jne    b80 <malloc+0x50>
        return 0;
  }
}
 bc3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bc6:	31 c0                	xor    %eax,%eax
}
 bc8:	5b                   	pop    %ebx
 bc9:	5e                   	pop    %esi
 bca:	5f                   	pop    %edi
 bcb:	5d                   	pop    %ebp
 bcc:	c3                   	ret    
    if(p->s.size >= nunits){
 bcd:	89 c2                	mov    %eax,%edx
 bcf:	89 f8                	mov    %edi,%eax
 bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 bd8:	39 ce                	cmp    %ecx,%esi
 bda:	74 54                	je     c30 <malloc+0x100>
        p->s.size -= nunits;
 bdc:	29 f1                	sub    %esi,%ecx
 bde:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 be1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 be4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 be7:	a3 94 10 00 00       	mov    %eax,0x1094
}
 bec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bef:	8d 42 08             	lea    0x8(%edx),%eax
}
 bf2:	5b                   	pop    %ebx
 bf3:	5e                   	pop    %esi
 bf4:	5f                   	pop    %edi
 bf5:	5d                   	pop    %ebp
 bf6:	c3                   	ret    
 bf7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bfe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c00:	c7 05 94 10 00 00 98 	movl   $0x1098,0x1094
 c07:	10 00 00 
    base.s.size = 0;
 c0a:	bf 98 10 00 00       	mov    $0x1098,%edi
    base.s.ptr = freep = prevp = &base;
 c0f:	c7 05 98 10 00 00 98 	movl   $0x1098,0x1098
 c16:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c19:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c1b:	c7 05 9c 10 00 00 00 	movl   $0x0,0x109c
 c22:	00 00 00 
    if(p->s.size >= nunits){
 c25:	e9 36 ff ff ff       	jmp    b60 <malloc+0x30>
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c30:	8b 0a                	mov    (%edx),%ecx
 c32:	89 08                	mov    %ecx,(%eax)
 c34:	eb b1                	jmp    be7 <malloc+0xb7>
