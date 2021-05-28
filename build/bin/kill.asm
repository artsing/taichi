
build/bin/_kill：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 30                	jle    51 <main+0x51>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 23 02 00 00       	call   260 <atoi>
  3d:	89 04 24             	mov    %eax,(%esp)
  40:	e8 28 07 00 00       	call   76d <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 ec 06 00 00       	call   73d <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 48 0c 00 00       	push   $0xc48
  58:	6a 02                	push   $0x2
  5a:	e8 81 08 00 00       	call   8e0 <printf>
    exit();
  5f:	e8 d9 06 00 00       	call   73d <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	f3 0f 1e fb          	endbr32 
  74:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  75:	31 c0                	xor    %eax,%eax
{
  77:	89 e5                	mov    %esp,%ebp
  79:	53                   	push   %ebx
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	89 c8                	mov    %ecx,%eax
  90:	5b                   	pop    %ebx
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	0f b6 1a             	movzbl (%edx),%ebx
  b4:	84 c0                	test   %al,%al
  b6:	75 19                	jne    d1 <strcmp+0x31>
  b8:	eb 26                	jmp    e0 <strcmp+0x40>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  c4:	83 c1 01             	add    $0x1,%ecx
  c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ca:	0f b6 1a             	movzbl (%edx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	38 d8                	cmp    %bl,%al
  d3:	74 eb                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	5b                   	pop    %ebx
  d8:	5d                   	pop    %ebp
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  fa:	80 3a 00             	cmpb   $0x0,(%edx)
  fd:	74 21                	je     120 <strlen+0x30>
  ff:	31 c0                	xor    %eax,%eax
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c0 01             	add    $0x1,%eax
 10b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10f:	89 c1                	mov    %eax,%ecx
 111:	75 f5                	jne    108 <strlen+0x18>
    ;
  return n;
}
 113:	89 c8                	mov    %ecx,%eax
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 13b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	89 d7                	mov    %edx,%edi
 143:	fc                   	cld    
 144:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 146:	89 d0                	mov    %edx,%eax
 148:	5f                   	pop    %edi
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15e:	0f b6 10             	movzbl (%eax),%edx
 161:	84 d2                	test   %dl,%dl
 163:	75 16                	jne    17b <strchr+0x2b>
 165:	eb 21                	jmp    188 <strchr+0x38>
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret    
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 199:	31 f6                	xor    %esi,%esi
{
 19b:	53                   	push   %ebx
 19c:	89 f3                	mov    %esi,%ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a4:	eb 33                	jmp    1d9 <gets+0x49>
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b6:	6a 01                	push   $0x1
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 95 05 00 00       	call   755 <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 1c                	jle    1e3 <gets+0x53>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	83 c7 01             	add    $0x1,%edi
 1ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	74 23                	je     1f8 <gets+0x68>
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 1f                	je     1f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	89 fe                	mov    %edi,%esi
 1de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e1:	7c cd                	jl     1b0 <gets+0x20>
 1e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5f                   	pop    %edi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	8b 75 08             	mov    0x8(%ebp),%esi
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 de                	add    %ebx,%esi
 200:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 202:	c6 03 00             	movb   $0x0,(%ebx)
}
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	6a 00                	push   $0x0
 21e:	ff 75 08             	pushl  0x8(%ebp)
 221:	e8 57 05 00 00       	call   77d <open>
  if(fd < 0)
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	78 2b                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 22d:	83 ec 08             	sub    $0x8,%esp
 230:	ff 75 0c             	pushl  0xc(%ebp)
 233:	89 c3                	mov    %eax,%ebx
 235:	50                   	push   %eax
 236:	e8 5a 05 00 00       	call   795 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 20 05 00 00       	call   765 <close>
  return r;
 245:	83 c4 10             	add    $0x10,%esp
}
 248:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24b:	89 f0                	mov    %esi,%eax
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb e9                	jmp    248 <stat+0x38>
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	0f be 02             	movsbl (%edx),%eax
 26e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 271:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 274:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 279:	77 1a                	ja     295 <atoi+0x35>
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	89 c8                	mov    %ecx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	57                   	push   %edi
 2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 2ab:	8b 55 08             	mov    0x8(%ebp),%edx
 2ae:	56                   	push   %esi
 2af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 0f                	jle    2c5 <memmove+0x25>
 2b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b8:	89 d7                	mov    %edx,%edi
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	57                   	push   %edi
 2d8:	56                   	push   %esi
 2d9:	53                   	push   %ebx
 2da:	83 ec 34             	sub    $0x34,%esp
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2e0:	68 5c 0c 00 00       	push   $0xc5c
hexdump (void *data, size_t size) {
 2e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2eb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 2ed:	89 c7                	mov    %eax,%edi
 2ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2f2:	e8 e9 05 00 00       	call   8e0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 2f7:	83 c4 10             	add    $0x10,%esp
 2fa:	85 ff                	test   %edi,%edi
 2fc:	0f 84 2d 01 00 00    	je     42f <hexdump+0x15f>
 302:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 305:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 30c:	be 10 00 00 00       	mov    $0x10,%esi
 311:	83 e8 01             	sub    $0x1,%eax
 314:	83 e0 f0             	and    $0xfffffff0,%eax
 317:	83 c0 10             	add    $0x10,%eax
 31a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 320:	83 ec 08             	sub    $0x8,%esp
 323:	68 b0 0c 00 00       	push   $0xcb0
 328:	6a 01                	push   $0x1
 32a:	e8 b1 05 00 00       	call   8e0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 32f:	83 c4 10             	add    $0x10,%esp
 332:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 339:	0f 8e 51 01 00 00    	jle    490 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 33f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 342:	83 ec 04             	sub    $0x4,%esp
 345:	57                   	push   %edi
 346:	89 fb                	mov    %edi,%ebx
 348:	68 ad 0c 00 00       	push   $0xcad
 34d:	6a 01                	push   $0x1
 34f:	e8 8c 05 00 00       	call   8e0 <printf>
 354:	89 7d d8             	mov    %edi,-0x28(%ebp)
 357:	83 c4 10             	add    $0x10,%esp
 35a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 35d:	eb 28                	jmp    387 <hexdump+0xb7>
 35f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 360:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 364:	80 fa 0f             	cmp    $0xf,%dl
 367:	0f 86 e3 00 00 00    	jbe    450 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 36d:	83 ec 04             	sub    $0x4,%esp
 370:	83 c3 01             	add    $0x1,%ebx
 373:	52                   	push   %edx
 374:	68 b3 0c 00 00       	push   $0xcb3
 379:	6a 01                	push   $0x1
 37b:	e8 60 05 00 00       	call   8e0 <printf>
 380:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 383:	39 f3                	cmp    %esi,%ebx
 385:	74 1e                	je     3a5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 387:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 38a:	7f d4                	jg     360 <hexdump+0x90>
      } else {
        printf(1, "   ");
 38c:	83 ec 08             	sub    $0x8,%esp
 38f:	83 c3 01             	add    $0x1,%ebx
 392:	68 b7 0c 00 00       	push   $0xcb7
 397:	6a 01                	push   $0x1
 399:	e8 42 05 00 00       	call   8e0 <printf>
 39e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3a1:	39 f3                	cmp    %esi,%ebx
 3a3:	75 e2                	jne    387 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 3ab:	68 b0 0c 00 00       	push   $0xcb0
 3b0:	6a 01                	push   $0x1
 3b2:	e8 29 05 00 00       	call   8e0 <printf>
 3b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	eb 1b                	jmp    3da <hexdump+0x10a>
 3bf:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 3c0:	83 ec 04             	sub    $0x4,%esp
 3c3:	52                   	push   %edx
 3c4:	68 bb 0c 00 00       	push   $0xcbb
 3c9:	6a 01                	push   $0x1
 3cb:	e8 10 05 00 00       	call   8e0 <printf>
 3d0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3d3:	83 c3 01             	add    $0x1,%ebx
 3d6:	39 de                	cmp    %ebx,%esi
 3d8:	74 30                	je     40a <hexdump+0x13a>
      if(offset + index < (int)size) {
 3da:	39 df                	cmp    %ebx,%edi
 3dc:	0f 8e 8e 00 00 00    	jle    470 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 3e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 3e5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 3e9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 3ec:	80 f9 5e             	cmp    $0x5e,%cl
 3ef:	76 cf                	jbe    3c0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 3f1:	83 ec 08             	sub    $0x8,%esp
 3f4:	83 c3 01             	add    $0x1,%ebx
 3f7:	68 be 0c 00 00       	push   $0xcbe
 3fc:	6a 01                	push   $0x1
 3fe:	e8 dd 04 00 00       	call   8e0 <printf>
 403:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 406:	39 de                	cmp    %ebx,%esi
 408:	75 d0                	jne    3da <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 40a:	83 ec 08             	sub    $0x8,%esp
 40d:	83 c6 10             	add    $0x10,%esi
 410:	68 c0 0c 00 00       	push   $0xcc0
 415:	6a 01                	push   $0x1
 417:	e8 c4 04 00 00       	call   8e0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 41c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 420:	83 c4 10             	add    $0x10,%esp
 423:	8b 45 dc             	mov    -0x24(%ebp),%eax
 426:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 429:	0f 85 f1 fe ff ff    	jne    320 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 42f:	c7 45 0c 5c 0c 00 00 	movl   $0xc5c,0xc(%ebp)
 436:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 43d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 440:	5b                   	pop    %ebx
 441:	5e                   	pop    %esi
 442:	5f                   	pop    %edi
 443:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 444:	e9 97 04 00 00       	jmp    8e0 <printf>
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 450:	83 ec 08             	sub    $0x8,%esp
 453:	68 ab 0c 00 00       	push   $0xcab
 458:	6a 01                	push   $0x1
 45a:	e8 81 04 00 00       	call   8e0 <printf>
 45f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 463:	83 c4 10             	add    $0x10,%esp
 466:	e9 02 ff ff ff       	jmp    36d <hexdump+0x9d>
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
        printf(1, " ");
 470:	83 ec 08             	sub    $0x8,%esp
 473:	68 b9 0c 00 00       	push   $0xcb9
 478:	6a 01                	push   $0x1
 47a:	e8 61 04 00 00       	call   8e0 <printf>
 47f:	83 c4 10             	add    $0x10,%esp
 482:	e9 4c ff ff ff       	jmp    3d3 <hexdump+0x103>
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 490:	83 ec 08             	sub    $0x8,%esp
 493:	68 ab 0c 00 00       	push   $0xcab
 498:	6a 01                	push   $0x1
 49a:	e8 41 04 00 00       	call   8e0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 49f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 4ab:	0f 8f 8e fe ff ff    	jg     33f <hexdump+0x6f>
 4b1:	83 ec 08             	sub    $0x8,%esp
 4b4:	68 ab 0c 00 00       	push   $0xcab
 4b9:	6a 01                	push   $0x1
 4bb:	e8 20 04 00 00       	call   8e0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 4c0:	83 c4 10             	add    $0x10,%esp
 4c3:	83 ff 0f             	cmp    $0xf,%edi
 4c6:	0f 8f 73 fe ff ff    	jg     33f <hexdump+0x6f>
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	68 ab 0c 00 00       	push   $0xcab
 4d4:	6a 01                	push   $0x1
 4d6:	e8 05 04 00 00       	call   8e0 <printf>
 4db:	83 c4 10             	add    $0x10,%esp
 4de:	e9 5c fe ff ff       	jmp    33f <hexdump+0x6f>
 4e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004f0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 4f0:	f3 0f 1e fb          	endbr32 
 4f4:	55                   	push   %ebp
    if (!endian)
 4f5:	a1 90 10 00 00       	mov    0x1090,%eax
{
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 4ff:	85 c0                	test   %eax,%eax
 501:	75 1d                	jne    520 <hton16+0x30>
        endian = byteorder();
 503:	c7 05 90 10 00 00 d2 	movl   $0x4d2,0x1090
 50a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 50d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 50f:	5d                   	pop    %ebp
 510:	66 c1 c2 08          	rol    $0x8,%dx
 514:	89 d0                	mov    %edx,%eax
 516:	c3                   	ret    
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax
 520:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 522:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 527:	74 e4                	je     50d <hton16+0x1d>
}
 529:	89 d0                	mov    %edx,%eax
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    
 52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <ntoh16>:
 530:	f3 0f 1e fb          	endbr32 
 534:	eb ba                	jmp    4f0 <hton16>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
    if (!endian)
 545:	8b 15 90 10 00 00    	mov    0x1090,%edx
{
 54b:	89 e5                	mov    %esp,%ebp
 54d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 550:	85 d2                	test   %edx,%edx
 552:	75 14                	jne    568 <hton32+0x28>
        endian = byteorder();
 554:	c7 05 90 10 00 00 d2 	movl   $0x4d2,0x1090
 55b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 55e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 568:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 56e:	74 ee                	je     55e <hton32+0x1e>
}
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    
 572:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000580 <ntoh32>:
 580:	f3 0f 1e fb          	endbr32 
 584:	eb ba                	jmp    540 <hton32>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi

00000590 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	57                   	push   %edi
 598:	8b 4d 08             	mov    0x8(%ebp),%ecx
 59b:	56                   	push   %esi
 59c:	53                   	push   %ebx
 59d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 5a0:	0f b6 01             	movzbl (%ecx),%eax
 5a3:	3c 09                	cmp    $0x9,%al
 5a5:	74 09                	je     5b0 <strtol+0x20>
 5a7:	3c 20                	cmp    $0x20,%al
 5a9:	75 14                	jne    5bf <strtol+0x2f>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
 5b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 5b4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 5b7:	3c 20                	cmp    $0x20,%al
 5b9:	74 f5                	je     5b0 <strtol+0x20>
 5bb:	3c 09                	cmp    $0x9,%al
 5bd:	74 f1                	je     5b0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 5bf:	3c 2b                	cmp    $0x2b,%al
 5c1:	0f 84 a9 00 00 00    	je     670 <strtol+0xe0>
    int neg = 0;
 5c7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 5c9:	3c 2d                	cmp    $0x2d,%al
 5cb:	0f 84 8f 00 00 00    	je     660 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 5d1:	0f be 11             	movsbl (%ecx),%edx
 5d4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 5da:	75 12                	jne    5ee <strtol+0x5e>
 5dc:	80 fa 30             	cmp    $0x30,%dl
 5df:	0f 84 9b 00 00 00    	je     680 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 5e5:	85 db                	test   %ebx,%ebx
 5e7:	75 05                	jne    5ee <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 5e9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 5ee:	89 5d 10             	mov    %ebx,0x10(%ebp)
 5f1:	31 c0                	xor    %eax,%eax
 5f3:	eb 17                	jmp    60c <strtol+0x7c>
 5f5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 5f8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 5fb:	3b 55 10             	cmp    0x10(%ebp),%edx
 5fe:	7d 28                	jge    628 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 600:	0f af 45 10          	imul   0x10(%ebp),%eax
 604:	83 c1 01             	add    $0x1,%ecx
 607:	01 d0                	add    %edx,%eax
    while (1) {
 609:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 60c:	8d 72 d0             	lea    -0x30(%edx),%esi
 60f:	89 f3                	mov    %esi,%ebx
 611:	80 fb 09             	cmp    $0x9,%bl
 614:	76 e2                	jbe    5f8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 616:	8d 72 9f             	lea    -0x61(%edx),%esi
 619:	89 f3                	mov    %esi,%ebx
 61b:	80 fb 19             	cmp    $0x19,%bl
 61e:	77 28                	ja     648 <strtol+0xb8>
            dig = *s - 'a' + 10;
 620:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 623:	3b 55 10             	cmp    0x10(%ebp),%edx
 626:	7c d8                	jl     600 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 628:	8b 55 0c             	mov    0xc(%ebp),%edx
 62b:	85 d2                	test   %edx,%edx
 62d:	74 05                	je     634 <strtol+0xa4>
        *endptr = (char *) s;
 62f:	8b 75 0c             	mov    0xc(%ebp),%esi
 632:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 634:	89 c2                	mov    %eax,%edx
}
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
    return (neg ? -val : val);
 638:	f7 da                	neg    %edx
 63a:	85 ff                	test   %edi,%edi
}
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 63e:	0f 45 c2             	cmovne %edx,%eax
}
 641:	c3                   	ret    
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 648:	8d 72 bf             	lea    -0x41(%edx),%esi
 64b:	89 f3                	mov    %esi,%ebx
 64d:	80 fb 19             	cmp    $0x19,%bl
 650:	77 d6                	ja     628 <strtol+0x98>
            dig = *s - 'A' + 10;
 652:	83 ea 37             	sub    $0x37,%edx
 655:	eb a4                	jmp    5fb <strtol+0x6b>
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 660:	83 c1 01             	add    $0x1,%ecx
 663:	bf 01 00 00 00       	mov    $0x1,%edi
 668:	e9 64 ff ff ff       	jmp    5d1 <strtol+0x41>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 670:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 673:	31 ff                	xor    %edi,%edi
 675:	e9 57 ff ff ff       	jmp    5d1 <strtol+0x41>
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 680:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 684:	3c 78                	cmp    $0x78,%al
 686:	74 18                	je     6a0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 688:	85 db                	test   %ebx,%ebx
 68a:	0f 85 5e ff ff ff    	jne    5ee <strtol+0x5e>
        s++, base = 8;
 690:	83 c1 01             	add    $0x1,%ecx
 693:	0f be d0             	movsbl %al,%edx
 696:	bb 08 00 00 00       	mov    $0x8,%ebx
 69b:	e9 4e ff ff ff       	jmp    5ee <strtol+0x5e>
        s += 2, base = 16;
 6a0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 6a4:	bb 10 00 00 00       	mov    $0x10,%ebx
 6a9:	83 c1 02             	add    $0x2,%ecx
 6ac:	e9 3d ff ff ff       	jmp    5ee <strtol+0x5e>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop

000006c0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 6c0:	f3 0f 1e fb          	endbr32 
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 6c8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 6ca:	56                   	push   %esi
 6cb:	53                   	push   %ebx
 6cc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 6cf:	83 ec 1c             	sub    $0x1c,%esp
 6d2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 6d5:	83 ec 04             	sub    $0x4,%esp
 6d8:	6a 0a                	push   $0xa
 6da:	53                   	push   %ebx
 6db:	56                   	push   %esi
 6dc:	e8 af fe ff ff       	call   590 <strtol>
        if (ret < 0 || ret > 255) {
 6e1:	83 c4 10             	add    $0x10,%esp
 6e4:	3d ff 00 00 00       	cmp    $0xff,%eax
 6e9:	77 3d                	ja     728 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 6eb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 6ee:	39 f1                	cmp    %esi,%ecx
 6f0:	74 36                	je     728 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 6f2:	0f b6 11             	movzbl (%ecx),%edx
 6f5:	83 ff 03             	cmp    $0x3,%edi
 6f8:	74 16                	je     710 <ip_addr_pton+0x50>
 6fa:	80 fa 2e             	cmp    $0x2e,%dl
 6fd:	75 29                	jne    728 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 6ff:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 702:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 705:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 708:	83 c7 01             	add    $0x1,%edi
 70b:	eb c8                	jmp    6d5 <ip_addr_pton+0x15>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 710:	84 d2                	test   %dl,%dl
 712:	75 14                	jne    728 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 714:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 717:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 71a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 71d:	31 c0                	xor    %eax,%eax
}
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 728:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 72b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 730:	5b                   	pop    %ebx
 731:	5e                   	pop    %esi
 732:	5f                   	pop    %edi
 733:	5d                   	pop    %ebp
 734:	c3                   	ret    

00000735 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 735:	b8 01 00 00 00       	mov    $0x1,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <exit>:
SYSCALL(exit)
 73d:	b8 02 00 00 00       	mov    $0x2,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <wait>:
SYSCALL(wait)
 745:	b8 03 00 00 00       	mov    $0x3,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <pipe>:
SYSCALL(pipe)
 74d:	b8 04 00 00 00       	mov    $0x4,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <read>:
SYSCALL(read)
 755:	b8 05 00 00 00       	mov    $0x5,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <write>:
SYSCALL(write)
 75d:	b8 10 00 00 00       	mov    $0x10,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <close>:
SYSCALL(close)
 765:	b8 15 00 00 00       	mov    $0x15,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <kill>:
SYSCALL(kill)
 76d:	b8 06 00 00 00       	mov    $0x6,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <exec>:
SYSCALL(exec)
 775:	b8 07 00 00 00       	mov    $0x7,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <open>:
SYSCALL(open)
 77d:	b8 0f 00 00 00       	mov    $0xf,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <mknod>:
SYSCALL(mknod)
 785:	b8 11 00 00 00       	mov    $0x11,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <unlink>:
SYSCALL(unlink)
 78d:	b8 12 00 00 00       	mov    $0x12,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <fstat>:
SYSCALL(fstat)
 795:	b8 08 00 00 00       	mov    $0x8,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <link>:
SYSCALL(link)
 79d:	b8 13 00 00 00       	mov    $0x13,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <mkdir>:
SYSCALL(mkdir)
 7a5:	b8 14 00 00 00       	mov    $0x14,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <chdir>:
SYSCALL(chdir)
 7ad:	b8 09 00 00 00       	mov    $0x9,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <dup>:
SYSCALL(dup)
 7b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <getpid>:
SYSCALL(getpid)
 7bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <sbrk>:
SYSCALL(sbrk)
 7c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <sleep>:
SYSCALL(sleep)
 7cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <uptime>:
SYSCALL(uptime)
 7d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <ioctl>:
# iotcl
SYSCALL(ioctl)
 7dd:	b8 16 00 00 00       	mov    $0x16,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <socket>:
# socket
SYSCALL(socket)
 7e5:	b8 17 00 00 00       	mov    $0x17,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <bind>:
SYSCALL(bind)
 7ed:	b8 19 00 00 00       	mov    $0x19,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <listen>:
SYSCALL(listen)
 7f5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <accept>:
SYSCALL(accept)
 7fd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <recv>:
SYSCALL(recv)
 805:	b8 1c 00 00 00       	mov    $0x1c,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <send>:
SYSCALL(send)
 80d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <recvfrom>:
SYSCALL(recvfrom)
 815:	b8 1e 00 00 00       	mov    $0x1e,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <sendto>:
SYSCALL(sendto)
 81d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    
 825:	66 90                	xchg   %ax,%ax
 827:	66 90                	xchg   %ax,%ax
 829:	66 90                	xchg   %ax,%ax
 82b:	66 90                	xchg   %ax,%ax
 82d:	66 90                	xchg   %ax,%ax
 82f:	90                   	nop

00000830 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 3c             	sub    $0x3c,%esp
 839:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 83c:	89 d1                	mov    %edx,%ecx
{
 83e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 841:	85 d2                	test   %edx,%edx
 843:	0f 89 7f 00 00 00    	jns    8c8 <printint+0x98>
 849:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 84d:	74 79                	je     8c8 <printint+0x98>
    neg = 1;
 84f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 856:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 858:	31 db                	xor    %ebx,%ebx
 85a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 860:	89 c8                	mov    %ecx,%eax
 862:	31 d2                	xor    %edx,%edx
 864:	89 cf                	mov    %ecx,%edi
 866:	f7 75 c4             	divl   -0x3c(%ebp)
 869:	0f b6 92 cc 0c 00 00 	movzbl 0xccc(%edx),%edx
 870:	89 45 c0             	mov    %eax,-0x40(%ebp)
 873:	89 d8                	mov    %ebx,%eax
 875:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 878:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 87b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 87e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 881:	76 dd                	jbe    860 <printint+0x30>
  if(neg)
 883:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 886:	85 c9                	test   %ecx,%ecx
 888:	74 0c                	je     896 <printint+0x66>
    buf[i++] = '-';
 88a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 88f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 891:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 896:	8b 7d b8             	mov    -0x48(%ebp),%edi
 899:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 89d:	eb 07                	jmp    8a6 <printint+0x76>
 89f:	90                   	nop
 8a0:	0f b6 13             	movzbl (%ebx),%edx
 8a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8a6:	83 ec 04             	sub    $0x4,%esp
 8a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8ac:	6a 01                	push   $0x1
 8ae:	56                   	push   %esi
 8af:	57                   	push   %edi
 8b0:	e8 a8 fe ff ff       	call   75d <write>
  while(--i >= 0)
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	39 de                	cmp    %ebx,%esi
 8ba:	75 e4                	jne    8a0 <printint+0x70>
    putc(fd, buf[i]);
}
 8bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8bf:	5b                   	pop    %ebx
 8c0:	5e                   	pop    %esi
 8c1:	5f                   	pop    %edi
 8c2:	5d                   	pop    %ebp
 8c3:	c3                   	ret    
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8cf:	eb 87                	jmp    858 <printint+0x28>
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop

000008e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8e0:	f3 0f 1e fb          	endbr32 
 8e4:	55                   	push   %ebp
 8e5:	89 e5                	mov    %esp,%ebp
 8e7:	57                   	push   %edi
 8e8:	56                   	push   %esi
 8e9:	53                   	push   %ebx
 8ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 8f0:	0f b6 1e             	movzbl (%esi),%ebx
 8f3:	84 db                	test   %bl,%bl
 8f5:	0f 84 b4 00 00 00    	je     9af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 8fb:	8d 45 10             	lea    0x10(%ebp),%eax
 8fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 901:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 904:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 906:	89 45 d0             	mov    %eax,-0x30(%ebp)
 909:	eb 33                	jmp    93e <printf+0x5e>
 90b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
 910:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 913:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 918:	83 f8 25             	cmp    $0x25,%eax
 91b:	74 17                	je     934 <printf+0x54>
  write(fd, &c, 1);
 91d:	83 ec 04             	sub    $0x4,%esp
 920:	88 5d e7             	mov    %bl,-0x19(%ebp)
 923:	6a 01                	push   $0x1
 925:	57                   	push   %edi
 926:	ff 75 08             	pushl  0x8(%ebp)
 929:	e8 2f fe ff ff       	call   75d <write>
 92e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 931:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 934:	0f b6 1e             	movzbl (%esi),%ebx
 937:	83 c6 01             	add    $0x1,%esi
 93a:	84 db                	test   %bl,%bl
 93c:	74 71                	je     9af <printf+0xcf>
    c = fmt[i] & 0xff;
 93e:	0f be cb             	movsbl %bl,%ecx
 941:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 944:	85 d2                	test   %edx,%edx
 946:	74 c8                	je     910 <printf+0x30>
      }
    } else if(state == '%'){
 948:	83 fa 25             	cmp    $0x25,%edx
 94b:	75 e7                	jne    934 <printf+0x54>
      if(c == 'd'){
 94d:	83 f8 64             	cmp    $0x64,%eax
 950:	0f 84 9a 00 00 00    	je     9f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 956:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 95c:	83 f9 70             	cmp    $0x70,%ecx
 95f:	74 5f                	je     9c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 961:	83 f8 73             	cmp    $0x73,%eax
 964:	0f 84 d6 00 00 00    	je     a40 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 96a:	83 f8 63             	cmp    $0x63,%eax
 96d:	0f 84 8d 00 00 00    	je     a00 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 973:	83 f8 25             	cmp    $0x25,%eax
 976:	0f 84 b4 00 00 00    	je     a30 <printf+0x150>
  write(fd, &c, 1);
 97c:	83 ec 04             	sub    $0x4,%esp
 97f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 983:	6a 01                	push   $0x1
 985:	57                   	push   %edi
 986:	ff 75 08             	pushl  0x8(%ebp)
 989:	e8 cf fd ff ff       	call   75d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 98e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 991:	83 c4 0c             	add    $0xc,%esp
 994:	6a 01                	push   $0x1
 996:	83 c6 01             	add    $0x1,%esi
 999:	57                   	push   %edi
 99a:	ff 75 08             	pushl  0x8(%ebp)
 99d:	e8 bb fd ff ff       	call   75d <write>
  for(i = 0; fmt[i]; i++){
 9a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 9a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 9a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 9ab:	84 db                	test   %bl,%bl
 9ad:	75 8f                	jne    93e <printf+0x5e>
    }
  }
}
 9af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9b2:	5b                   	pop    %ebx
 9b3:	5e                   	pop    %esi
 9b4:	5f                   	pop    %edi
 9b5:	5d                   	pop    %ebp
 9b6:	c3                   	ret    
 9b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 9c0:	83 ec 0c             	sub    $0xc,%esp
 9c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9c8:	6a 00                	push   $0x0
 9ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 9cd:	8b 45 08             	mov    0x8(%ebp),%eax
 9d0:	8b 13                	mov    (%ebx),%edx
 9d2:	e8 59 fe ff ff       	call   830 <printint>
        ap++;
 9d7:	89 d8                	mov    %ebx,%eax
 9d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9dc:	31 d2                	xor    %edx,%edx
        ap++;
 9de:	83 c0 04             	add    $0x4,%eax
 9e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9e4:	e9 4b ff ff ff       	jmp    934 <printf+0x54>
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 9f0:	83 ec 0c             	sub    $0xc,%esp
 9f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9f8:	6a 01                	push   $0x1
 9fa:	eb ce                	jmp    9ca <printf+0xea>
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a00:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a03:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a06:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a08:	6a 01                	push   $0x1
        ap++;
 a0a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a0d:	57                   	push   %edi
 a0e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a11:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a14:	e8 44 fd ff ff       	call   75d <write>
        ap++;
 a19:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a1c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a1f:	31 d2                	xor    %edx,%edx
 a21:	e9 0e ff ff ff       	jmp    934 <printf+0x54>
 a26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a30:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a33:	83 ec 04             	sub    $0x4,%esp
 a36:	e9 59 ff ff ff       	jmp    994 <printf+0xb4>
 a3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a3f:	90                   	nop
        s = (char*)*ap;
 a40:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a43:	8b 18                	mov    (%eax),%ebx
        ap++;
 a45:	83 c0 04             	add    $0x4,%eax
 a48:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a4b:	85 db                	test   %ebx,%ebx
 a4d:	74 17                	je     a66 <printf+0x186>
        while(*s != 0){
 a4f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a52:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a54:	84 c0                	test   %al,%al
 a56:	0f 84 d8 fe ff ff    	je     934 <printf+0x54>
 a5c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a5f:	89 de                	mov    %ebx,%esi
 a61:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a64:	eb 1a                	jmp    a80 <printf+0x1a0>
          s = "(null)";
 a66:	bb c4 0c 00 00       	mov    $0xcc4,%ebx
        while(*s != 0){
 a6b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a6e:	b8 28 00 00 00       	mov    $0x28,%eax
 a73:	89 de                	mov    %ebx,%esi
 a75:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a7f:	90                   	nop
  write(fd, &c, 1);
 a80:	83 ec 04             	sub    $0x4,%esp
          s++;
 a83:	83 c6 01             	add    $0x1,%esi
 a86:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a89:	6a 01                	push   $0x1
 a8b:	57                   	push   %edi
 a8c:	53                   	push   %ebx
 a8d:	e8 cb fc ff ff       	call   75d <write>
        while(*s != 0){
 a92:	0f b6 06             	movzbl (%esi),%eax
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	84 c0                	test   %al,%al
 a9a:	75 e4                	jne    a80 <printf+0x1a0>
 a9c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 a9f:	31 d2                	xor    %edx,%edx
 aa1:	e9 8e fe ff ff       	jmp    934 <printf+0x54>
 aa6:	66 90                	xchg   %ax,%ax
 aa8:	66 90                	xchg   %ax,%ax
 aaa:	66 90                	xchg   %ax,%ax
 aac:	66 90                	xchg   %ax,%ax
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab0:	f3 0f 1e fb          	endbr32 
 ab4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab5:	a1 94 10 00 00       	mov    0x1094,%eax
{
 aba:	89 e5                	mov    %esp,%ebp
 abc:	57                   	push   %edi
 abd:	56                   	push   %esi
 abe:	53                   	push   %ebx
 abf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ac2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 ac4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac7:	39 c8                	cmp    %ecx,%eax
 ac9:	73 15                	jae    ae0 <free+0x30>
 acb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop
 ad0:	39 d1                	cmp    %edx,%ecx
 ad2:	72 14                	jb     ae8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	39 d0                	cmp    %edx,%eax
 ad6:	73 10                	jae    ae8 <free+0x38>
{
 ad8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ada:	8b 10                	mov    (%eax),%edx
 adc:	39 c8                	cmp    %ecx,%eax
 ade:	72 f0                	jb     ad0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae0:	39 d0                	cmp    %edx,%eax
 ae2:	72 f4                	jb     ad8 <free+0x28>
 ae4:	39 d1                	cmp    %edx,%ecx
 ae6:	73 f0                	jae    ad8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ae8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aeb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aee:	39 fa                	cmp    %edi,%edx
 af0:	74 1e                	je     b10 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 af2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 af5:	8b 50 04             	mov    0x4(%eax),%edx
 af8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 afb:	39 f1                	cmp    %esi,%ecx
 afd:	74 28                	je     b27 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 aff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b01:	5b                   	pop    %ebx
  freep = p;
 b02:	a3 94 10 00 00       	mov    %eax,0x1094
}
 b07:	5e                   	pop    %esi
 b08:	5f                   	pop    %edi
 b09:	5d                   	pop    %ebp
 b0a:	c3                   	ret    
 b0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b0f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b10:	03 72 04             	add    0x4(%edx),%esi
 b13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b16:	8b 10                	mov    (%eax),%edx
 b18:	8b 12                	mov    (%edx),%edx
 b1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b1d:	8b 50 04             	mov    0x4(%eax),%edx
 b20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b23:	39 f1                	cmp    %esi,%ecx
 b25:	75 d8                	jne    aff <free+0x4f>
    p->s.size += bp->s.size;
 b27:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b2a:	a3 94 10 00 00       	mov    %eax,0x1094
    p->s.size += bp->s.size;
 b2f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b32:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b35:	89 10                	mov    %edx,(%eax)
}
 b37:	5b                   	pop    %ebx
 b38:	5e                   	pop    %esi
 b39:	5f                   	pop    %edi
 b3a:	5d                   	pop    %ebp
 b3b:	c3                   	ret    
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b40:	f3 0f 1e fb          	endbr32 
 b44:	55                   	push   %ebp
 b45:	89 e5                	mov    %esp,%ebp
 b47:	57                   	push   %edi
 b48:	56                   	push   %esi
 b49:	53                   	push   %ebx
 b4a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b50:	8b 3d 94 10 00 00    	mov    0x1094,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b56:	8d 70 07             	lea    0x7(%eax),%esi
 b59:	c1 ee 03             	shr    $0x3,%esi
 b5c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b5f:	85 ff                	test   %edi,%edi
 b61:	0f 84 a9 00 00 00    	je     c10 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b67:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b69:	8b 48 04             	mov    0x4(%eax),%ecx
 b6c:	39 f1                	cmp    %esi,%ecx
 b6e:	73 6d                	jae    bdd <malloc+0x9d>
 b70:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b76:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b7b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b7e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 b85:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 b88:	eb 17                	jmp    ba1 <malloc+0x61>
 b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b90:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 b92:	8b 4a 04             	mov    0x4(%edx),%ecx
 b95:	39 f1                	cmp    %esi,%ecx
 b97:	73 4f                	jae    be8 <malloc+0xa8>
 b99:	8b 3d 94 10 00 00    	mov    0x1094,%edi
 b9f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ba1:	39 c7                	cmp    %eax,%edi
 ba3:	75 eb                	jne    b90 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ba5:	83 ec 0c             	sub    $0xc,%esp
 ba8:	ff 75 e4             	pushl  -0x1c(%ebp)
 bab:	e8 15 fc ff ff       	call   7c5 <sbrk>
  if(p == (char*)-1)
 bb0:	83 c4 10             	add    $0x10,%esp
 bb3:	83 f8 ff             	cmp    $0xffffffff,%eax
 bb6:	74 1b                	je     bd3 <malloc+0x93>
  hp->s.size = nu;
 bb8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bbb:	83 ec 0c             	sub    $0xc,%esp
 bbe:	83 c0 08             	add    $0x8,%eax
 bc1:	50                   	push   %eax
 bc2:	e8 e9 fe ff ff       	call   ab0 <free>
  return freep;
 bc7:	a1 94 10 00 00       	mov    0x1094,%eax
      if((p = morecore(nunits)) == 0)
 bcc:	83 c4 10             	add    $0x10,%esp
 bcf:	85 c0                	test   %eax,%eax
 bd1:	75 bd                	jne    b90 <malloc+0x50>
        return 0;
  }
}
 bd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bd6:	31 c0                	xor    %eax,%eax
}
 bd8:	5b                   	pop    %ebx
 bd9:	5e                   	pop    %esi
 bda:	5f                   	pop    %edi
 bdb:	5d                   	pop    %ebp
 bdc:	c3                   	ret    
    if(p->s.size >= nunits){
 bdd:	89 c2                	mov    %eax,%edx
 bdf:	89 f8                	mov    %edi,%eax
 be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 be8:	39 ce                	cmp    %ecx,%esi
 bea:	74 54                	je     c40 <malloc+0x100>
        p->s.size -= nunits;
 bec:	29 f1                	sub    %esi,%ecx
 bee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 bf1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 bf4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 bf7:	a3 94 10 00 00       	mov    %eax,0x1094
}
 bfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bff:	8d 42 08             	lea    0x8(%edx),%eax
}
 c02:	5b                   	pop    %ebx
 c03:	5e                   	pop    %esi
 c04:	5f                   	pop    %edi
 c05:	5d                   	pop    %ebp
 c06:	c3                   	ret    
 c07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c0e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c10:	c7 05 94 10 00 00 98 	movl   $0x1098,0x1094
 c17:	10 00 00 
    base.s.size = 0;
 c1a:	bf 98 10 00 00       	mov    $0x1098,%edi
    base.s.ptr = freep = prevp = &base;
 c1f:	c7 05 98 10 00 00 98 	movl   $0x1098,0x1098
 c26:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c29:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c2b:	c7 05 9c 10 00 00 00 	movl   $0x0,0x109c
 c32:	00 00 00 
    if(p->s.size >= nunits){
 c35:	e9 36 ff ff ff       	jmp    b70 <malloc+0x30>
 c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c40:	8b 0a                	mov    (%edx),%ecx
 c42:	89 08                	mov    %ecx,(%eax)
 c44:	eb b1                	jmp    bf7 <malloc+0xb7>
