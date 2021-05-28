
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
  1d:	68 98 0c 00 00       	push   $0xc98
  22:	6a 02                	push   $0x2
  24:	e8 07 09 00 00       	call   930 <printf>
    exit();
  29:	e8 5f 07 00 00       	call   78d <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 b2 07 00 00       	call   7ed <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 46 07 00 00       	call   78d <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 ab 0c 00 00       	push   $0xcab
  52:	6a 02                	push   $0x2
  54:	e8 d7 08 00 00       	call   930 <printf>
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

00000090 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	57                   	push   %edi
  98:	8b 7d 10             	mov    0x10(%ebp),%edi
  9b:	56                   	push   %esi
  9c:	8b 75 08             	mov    0x8(%ebp),%esi
  9f:	53                   	push   %ebx
  a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
  a3:	85 ff                	test   %edi,%edi
  a5:	74 39                	je     e0 <strcat_s+0x50>
  a7:	31 c0                	xor    %eax,%eax
  a9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  ae:	eb 11                	jmp    c1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  b6:	84 d2                	test   %dl,%dl
  b8:	74 26                	je     e0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
  ba:	83 c0 01             	add    $0x1,%eax
  bd:	39 c7                	cmp    %eax,%edi
  bf:	74 1f                	je     e0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
  c1:	89 c2                	mov    %eax,%edx
  c3:	29 ca                	sub    %ecx,%edx
  c5:	01 da                	add    %ebx,%edx
  c7:	83 f9 ff             	cmp    $0xffffffff,%ecx
  ca:	75 e4                	jne    b0 <strcat_s+0x20>
  cc:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
  d0:	75 e8                	jne    ba <strcat_s+0x2a>
  d2:	89 da                	mov    %ebx,%edx
  d4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
  d6:	0f b6 12             	movzbl (%edx),%edx
  d9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  dc:	84 d2                	test   %dl,%dl
  de:	75 da                	jne    ba <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
  e0:	5b                   	pop    %ebx
  e1:	89 f0                	mov    %esi,%eax
  e3:	5e                   	pop    %esi
  e4:	5f                   	pop    %edi
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	53                   	push   %ebx
  f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  fe:	0f b6 01             	movzbl (%ecx),%eax
 101:	0f b6 1a             	movzbl (%edx),%ebx
 104:	84 c0                	test   %al,%al
 106:	75 19                	jne    121 <strcmp+0x31>
 108:	eb 26                	jmp    130 <strcmp+0x40>
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 110:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 114:	83 c1 01             	add    $0x1,%ecx
 117:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 11a:	0f b6 1a             	movzbl (%edx),%ebx
 11d:	84 c0                	test   %al,%al
 11f:	74 0f                	je     130 <strcmp+0x40>
 121:	38 d8                	cmp    %bl,%al
 123:	74 eb                	je     110 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 125:	29 d8                	sub    %ebx,%eax
}
 127:	5b                   	pop    %ebx
 128:	5d                   	pop    %ebp
 129:	c3                   	ret    
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 132:	29 d8                	sub    %ebx,%eax
}
 134:	5b                   	pop    %ebx
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13e:	66 90                	xchg   %ax,%ax

00000140 <strlen>:

uint
strlen(const char *s)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 14a:	80 3a 00             	cmpb   $0x0,(%edx)
 14d:	74 21                	je     170 <strlen+0x30>
 14f:	31 c0                	xor    %eax,%eax
 151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 158:	83 c0 01             	add    $0x1,%eax
 15b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 15f:	89 c1                	mov    %eax,%ecx
 161:	75 f5                	jne    158 <strlen+0x18>
    ;
  return n;
}
 163:	89 c8                	mov    %ecx,%eax
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 18b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18e:	8b 45 0c             	mov    0xc(%ebp),%eax
 191:	89 d7                	mov    %edx,%edi
 193:	fc                   	cld    
 194:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 196:	89 d0                	mov    %edx,%eax
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ae:	0f b6 10             	movzbl (%eax),%edx
 1b1:	84 d2                	test   %dl,%dl
 1b3:	75 16                	jne    1cb <strchr+0x2b>
 1b5:	eb 21                	jmp    1d8 <strchr+0x38>
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
 1c0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	84 d2                	test   %dl,%dl
 1c9:	74 0d                	je     1d8 <strchr+0x38>
    if(*s == c)
 1cb:	38 d1                	cmp    %dl,%cl
 1cd:	75 f1                	jne    1c0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d8:	31 c0                	xor    %eax,%eax
}
 1da:	5d                   	pop    %ebp
 1db:	c3                   	ret    
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	f3 0f 1e fb          	endbr32 
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	57                   	push   %edi
 1e8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e9:	31 f6                	xor    %esi,%esi
{
 1eb:	53                   	push   %ebx
 1ec:	89 f3                	mov    %esi,%ebx
 1ee:	83 ec 1c             	sub    $0x1c,%esp
 1f1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1f4:	eb 33                	jmp    229 <gets+0x49>
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 45 e7             	lea    -0x19(%ebp),%eax
 206:	6a 01                	push   $0x1
 208:	50                   	push   %eax
 209:	6a 00                	push   $0x0
 20b:	e8 95 05 00 00       	call   7a5 <read>
    if(cc < 1)
 210:	83 c4 10             	add    $0x10,%esp
 213:	85 c0                	test   %eax,%eax
 215:	7e 1c                	jle    233 <gets+0x53>
      break;
    buf[i++] = c;
 217:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 21b:	83 c7 01             	add    $0x1,%edi
 21e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 221:	3c 0a                	cmp    $0xa,%al
 223:	74 23                	je     248 <gets+0x68>
 225:	3c 0d                	cmp    $0xd,%al
 227:	74 1f                	je     248 <gets+0x68>
  for(i=0; i+1 < max; ){
 229:	83 c3 01             	add    $0x1,%ebx
 22c:	89 fe                	mov    %edi,%esi
 22e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 231:	7c cd                	jl     200 <gets+0x20>
 233:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 235:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 238:	c6 03 00             	movb   $0x0,(%ebx)
}
 23b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23e:	5b                   	pop    %ebx
 23f:	5e                   	pop    %esi
 240:	5f                   	pop    %edi
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 247:	90                   	nop
 248:	8b 75 08             	mov    0x8(%ebp),%esi
 24b:	8b 45 08             	mov    0x8(%ebp),%eax
 24e:	01 de                	add    %ebx,%esi
 250:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 252:	c6 03 00             	movb   $0x0,(%ebx)
}
 255:	8d 65 f4             	lea    -0xc(%ebp),%esp
 258:	5b                   	pop    %ebx
 259:	5e                   	pop    %esi
 25a:	5f                   	pop    %edi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <stat>:

int
stat(const char *n, struct stat *st)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	56                   	push   %esi
 268:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	6a 00                	push   $0x0
 26e:	ff 75 08             	pushl  0x8(%ebp)
 271:	e8 57 05 00 00       	call   7cd <open>
  if(fd < 0)
 276:	83 c4 10             	add    $0x10,%esp
 279:	85 c0                	test   %eax,%eax
 27b:	78 2b                	js     2a8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 27d:	83 ec 08             	sub    $0x8,%esp
 280:	ff 75 0c             	pushl  0xc(%ebp)
 283:	89 c3                	mov    %eax,%ebx
 285:	50                   	push   %eax
 286:	e8 5a 05 00 00       	call   7e5 <fstat>
  close(fd);
 28b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 28e:	89 c6                	mov    %eax,%esi
  close(fd);
 290:	e8 20 05 00 00       	call   7b5 <close>
  return r;
 295:	83 c4 10             	add    $0x10,%esp
}
 298:	8d 65 f8             	lea    -0x8(%ebp),%esp
 29b:	89 f0                	mov    %esi,%eax
 29d:	5b                   	pop    %ebx
 29e:	5e                   	pop    %esi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ad:	eb e9                	jmp    298 <stat+0x38>
 2af:	90                   	nop

000002b0 <atoi>:

int
atoi(const char *s)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	53                   	push   %ebx
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2bb:	0f be 02             	movsbl (%edx),%eax
 2be:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2c1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2c9:	77 1a                	ja     2e5 <atoi+0x35>
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop
    n = n*10 + *s++ - '0';
 2d0:	83 c2 01             	add    $0x1,%edx
 2d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2da:	0f be 02             	movsbl (%edx),%eax
 2dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
  return n;
}
 2e5:	89 c8                	mov    %ecx,%eax
 2e7:	5b                   	pop    %ebx
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	57                   	push   %edi
 2f8:	8b 45 10             	mov    0x10(%ebp),%eax
 2fb:	8b 55 08             	mov    0x8(%ebp),%edx
 2fe:	56                   	push   %esi
 2ff:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 302:	85 c0                	test   %eax,%eax
 304:	7e 0f                	jle    315 <memmove+0x25>
 306:	01 d0                	add    %edx,%eax
  dst = vdst;
 308:	89 d7                	mov    %edx,%edi
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 310:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 311:	39 f8                	cmp    %edi,%eax
 313:	75 fb                	jne    310 <memmove+0x20>
  return vdst;
}
 315:	5e                   	pop    %esi
 316:	89 d0                	mov    %edx,%eax
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	56                   	push   %esi
 329:	53                   	push   %ebx
 32a:	83 ec 34             	sub    $0x34,%esp
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 330:	68 c0 0c 00 00       	push   $0xcc0
hexdump (void *data, size_t size) {
 335:	89 45 e0             	mov    %eax,-0x20(%ebp)
 338:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 33b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 33d:	89 c7                	mov    %eax,%edi
 33f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 342:	e8 e9 05 00 00       	call   930 <printf>
  for (offset = 0; offset < size; offset += 16) {
 347:	83 c4 10             	add    $0x10,%esp
 34a:	85 ff                	test   %edi,%edi
 34c:	0f 84 2d 01 00 00    	je     47f <hexdump+0x15f>
 352:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 355:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 35c:	be 10 00 00 00       	mov    $0x10,%esi
 361:	83 e8 01             	sub    $0x1,%eax
 364:	83 e0 f0             	and    $0xfffffff0,%eax
 367:	83 c0 10             	add    $0x10,%eax
 36a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 370:	83 ec 08             	sub    $0x8,%esp
 373:	68 14 0d 00 00       	push   $0xd14
 378:	6a 01                	push   $0x1
 37a:	e8 b1 05 00 00       	call   930 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 37f:	83 c4 10             	add    $0x10,%esp
 382:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 389:	0f 8e 51 01 00 00    	jle    4e0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 38f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 392:	83 ec 04             	sub    $0x4,%esp
 395:	57                   	push   %edi
 396:	89 fb                	mov    %edi,%ebx
 398:	68 11 0d 00 00       	push   $0xd11
 39d:	6a 01                	push   $0x1
 39f:	e8 8c 05 00 00       	call   930 <printf>
 3a4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 3a7:	83 c4 10             	add    $0x10,%esp
 3aa:	8b 7d e0             	mov    -0x20(%ebp),%edi
 3ad:	eb 28                	jmp    3d7 <hexdump+0xb7>
 3af:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 3b0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 3b4:	80 fa 0f             	cmp    $0xf,%dl
 3b7:	0f 86 e3 00 00 00    	jbe    4a0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 3bd:	83 ec 04             	sub    $0x4,%esp
 3c0:	83 c3 01             	add    $0x1,%ebx
 3c3:	52                   	push   %edx
 3c4:	68 17 0d 00 00       	push   $0xd17
 3c9:	6a 01                	push   $0x1
 3cb:	e8 60 05 00 00       	call   930 <printf>
 3d0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3d3:	39 f3                	cmp    %esi,%ebx
 3d5:	74 1e                	je     3f5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 3d7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 3da:	7f d4                	jg     3b0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 3dc:	83 ec 08             	sub    $0x8,%esp
 3df:	83 c3 01             	add    $0x1,%ebx
 3e2:	68 1b 0d 00 00       	push   $0xd1b
 3e7:	6a 01                	push   $0x1
 3e9:	e8 42 05 00 00       	call   930 <printf>
 3ee:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3f1:	39 f3                	cmp    %esi,%ebx
 3f3:	75 e2                	jne    3d7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 3f5:	83 ec 08             	sub    $0x8,%esp
 3f8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 3fb:	68 14 0d 00 00       	push   $0xd14
 400:	6a 01                	push   $0x1
 402:	e8 29 05 00 00       	call   930 <printf>
 407:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 40a:	83 c4 10             	add    $0x10,%esp
 40d:	eb 1b                	jmp    42a <hexdump+0x10a>
 40f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 410:	83 ec 04             	sub    $0x4,%esp
 413:	52                   	push   %edx
 414:	68 1f 0d 00 00       	push   $0xd1f
 419:	6a 01                	push   $0x1
 41b:	e8 10 05 00 00       	call   930 <printf>
 420:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 423:	83 c3 01             	add    $0x1,%ebx
 426:	39 de                	cmp    %ebx,%esi
 428:	74 30                	je     45a <hexdump+0x13a>
      if(offset + index < (int)size) {
 42a:	39 df                	cmp    %ebx,%edi
 42c:	0f 8e 8e 00 00 00    	jle    4c0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 432:	8b 45 e0             	mov    -0x20(%ebp),%eax
 435:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 439:	8d 4a e0             	lea    -0x20(%edx),%ecx
 43c:	80 f9 5e             	cmp    $0x5e,%cl
 43f:	76 cf                	jbe    410 <hexdump+0xf0>
        } else {
          printf(1, ".");
 441:	83 ec 08             	sub    $0x8,%esp
 444:	83 c3 01             	add    $0x1,%ebx
 447:	68 22 0d 00 00       	push   $0xd22
 44c:	6a 01                	push   $0x1
 44e:	e8 dd 04 00 00       	call   930 <printf>
 453:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 456:	39 de                	cmp    %ebx,%esi
 458:	75 d0                	jne    42a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 45a:	83 ec 08             	sub    $0x8,%esp
 45d:	83 c6 10             	add    $0x10,%esi
 460:	68 24 0d 00 00       	push   $0xd24
 465:	6a 01                	push   $0x1
 467:	e8 c4 04 00 00       	call   930 <printf>
  for (offset = 0; offset < size; offset += 16) {
 46c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 470:	83 c4 10             	add    $0x10,%esp
 473:	8b 45 dc             	mov    -0x24(%ebp),%eax
 476:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 479:	0f 85 f1 fe ff ff    	jne    370 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 47f:	c7 45 0c c0 0c 00 00 	movl   $0xcc0,0xc(%ebp)
 486:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 48d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5f                   	pop    %edi
 493:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 494:	e9 97 04 00 00       	jmp    930 <printf>
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4a0:	83 ec 08             	sub    $0x8,%esp
 4a3:	68 0f 0d 00 00       	push   $0xd0f
 4a8:	6a 01                	push   $0x1
 4aa:	e8 81 04 00 00       	call   930 <printf>
 4af:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	e9 02 ff ff ff       	jmp    3bd <hexdump+0x9d>
 4bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop
        printf(1, " ");
 4c0:	83 ec 08             	sub    $0x8,%esp
 4c3:	68 1d 0d 00 00       	push   $0xd1d
 4c8:	6a 01                	push   $0x1
 4ca:	e8 61 04 00 00       	call   930 <printf>
 4cf:	83 c4 10             	add    $0x10,%esp
 4d2:	e9 4c ff ff ff       	jmp    423 <hexdump+0x103>
 4d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4de:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 4e0:	83 ec 08             	sub    $0x8,%esp
 4e3:	68 0f 0d 00 00       	push   $0xd0f
 4e8:	6a 01                	push   $0x1
 4ea:	e8 41 04 00 00       	call   930 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 4ef:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 4fb:	0f 8f 8e fe ff ff    	jg     38f <hexdump+0x6f>
 501:	83 ec 08             	sub    $0x8,%esp
 504:	68 0f 0d 00 00       	push   $0xd0f
 509:	6a 01                	push   $0x1
 50b:	e8 20 04 00 00       	call   930 <printf>
    if (offset <= 0x000f) printf(1, "0");
 510:	83 c4 10             	add    $0x10,%esp
 513:	83 ff 0f             	cmp    $0xf,%edi
 516:	0f 8f 73 fe ff ff    	jg     38f <hexdump+0x6f>
 51c:	83 ec 08             	sub    $0x8,%esp
 51f:	68 0f 0d 00 00       	push   $0xd0f
 524:	6a 01                	push   $0x1
 526:	e8 05 04 00 00       	call   930 <printf>
 52b:	83 c4 10             	add    $0x10,%esp
 52e:	e9 5c fe ff ff       	jmp    38f <hexdump+0x6f>
 533:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000540 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
    if (!endian)
 545:	a1 20 11 00 00       	mov    0x1120,%eax
{
 54a:	89 e5                	mov    %esp,%ebp
 54c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 54f:	85 c0                	test   %eax,%eax
 551:	75 1d                	jne    570 <hton16+0x30>
        endian = byteorder();
 553:	c7 05 20 11 00 00 d2 	movl   $0x4d2,0x1120
 55a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 55d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 55f:	5d                   	pop    %ebp
 560:	66 c1 c2 08          	rol    $0x8,%dx
 564:	89 d0                	mov    %edx,%eax
 566:	c3                   	ret    
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
 570:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 572:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 577:	74 e4                	je     55d <hton16+0x1d>
}
 579:	89 d0                	mov    %edx,%eax
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    
 57d:	8d 76 00             	lea    0x0(%esi),%esi

00000580 <ntoh16>:
 580:	f3 0f 1e fb          	endbr32 
 584:	eb ba                	jmp    540 <hton16>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi

00000590 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
    if (!endian)
 595:	8b 15 20 11 00 00    	mov    0x1120,%edx
{
 59b:	89 e5                	mov    %esp,%ebp
 59d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 5a0:	85 d2                	test   %edx,%edx
 5a2:	75 14                	jne    5b8 <hton32+0x28>
        endian = byteorder();
 5a4:	c7 05 20 11 00 00 d2 	movl   $0x4d2,0x1120
 5ab:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 5ae:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 5b0:	5d                   	pop    %ebp
 5b1:	c3                   	ret    
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 5b8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 5be:	74 ee                	je     5ae <hton32+0x1e>
}
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    
 5c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005d0 <ntoh32>:
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	eb ba                	jmp    590 <hton32>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi

000005e0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5eb:	56                   	push   %esi
 5ec:	53                   	push   %ebx
 5ed:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 5f0:	0f b6 01             	movzbl (%ecx),%eax
 5f3:	3c 09                	cmp    $0x9,%al
 5f5:	74 09                	je     600 <strtol+0x20>
 5f7:	3c 20                	cmp    $0x20,%al
 5f9:	75 14                	jne    60f <strtol+0x2f>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
 600:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 604:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 607:	3c 20                	cmp    $0x20,%al
 609:	74 f5                	je     600 <strtol+0x20>
 60b:	3c 09                	cmp    $0x9,%al
 60d:	74 f1                	je     600 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 60f:	3c 2b                	cmp    $0x2b,%al
 611:	0f 84 a9 00 00 00    	je     6c0 <strtol+0xe0>
    int neg = 0;
 617:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 619:	3c 2d                	cmp    $0x2d,%al
 61b:	0f 84 8f 00 00 00    	je     6b0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 621:	0f be 11             	movsbl (%ecx),%edx
 624:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 62a:	75 12                	jne    63e <strtol+0x5e>
 62c:	80 fa 30             	cmp    $0x30,%dl
 62f:	0f 84 9b 00 00 00    	je     6d0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 635:	85 db                	test   %ebx,%ebx
 637:	75 05                	jne    63e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 639:	bb 0a 00 00 00       	mov    $0xa,%ebx
 63e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 641:	31 c0                	xor    %eax,%eax
 643:	eb 17                	jmp    65c <strtol+0x7c>
 645:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 648:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 64b:	3b 55 10             	cmp    0x10(%ebp),%edx
 64e:	7d 28                	jge    678 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 650:	0f af 45 10          	imul   0x10(%ebp),%eax
 654:	83 c1 01             	add    $0x1,%ecx
 657:	01 d0                	add    %edx,%eax
    while (1) {
 659:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 65c:	8d 72 d0             	lea    -0x30(%edx),%esi
 65f:	89 f3                	mov    %esi,%ebx
 661:	80 fb 09             	cmp    $0x9,%bl
 664:	76 e2                	jbe    648 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 666:	8d 72 9f             	lea    -0x61(%edx),%esi
 669:	89 f3                	mov    %esi,%ebx
 66b:	80 fb 19             	cmp    $0x19,%bl
 66e:	77 28                	ja     698 <strtol+0xb8>
            dig = *s - 'a' + 10;
 670:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 673:	3b 55 10             	cmp    0x10(%ebp),%edx
 676:	7c d8                	jl     650 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 678:	8b 55 0c             	mov    0xc(%ebp),%edx
 67b:	85 d2                	test   %edx,%edx
 67d:	74 05                	je     684 <strtol+0xa4>
        *endptr = (char *) s;
 67f:	8b 75 0c             	mov    0xc(%ebp),%esi
 682:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 684:	89 c2                	mov    %eax,%edx
}
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
    return (neg ? -val : val);
 688:	f7 da                	neg    %edx
 68a:	85 ff                	test   %edi,%edi
}
 68c:	5f                   	pop    %edi
 68d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 68e:	0f 45 c2             	cmovne %edx,%eax
}
 691:	c3                   	ret    
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 698:	8d 72 bf             	lea    -0x41(%edx),%esi
 69b:	89 f3                	mov    %esi,%ebx
 69d:	80 fb 19             	cmp    $0x19,%bl
 6a0:	77 d6                	ja     678 <strtol+0x98>
            dig = *s - 'A' + 10;
 6a2:	83 ea 37             	sub    $0x37,%edx
 6a5:	eb a4                	jmp    64b <strtol+0x6b>
 6a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ae:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 6b0:	83 c1 01             	add    $0x1,%ecx
 6b3:	bf 01 00 00 00       	mov    $0x1,%edi
 6b8:	e9 64 ff ff ff       	jmp    621 <strtol+0x41>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 6c0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 6c3:	31 ff                	xor    %edi,%edi
 6c5:	e9 57 ff ff ff       	jmp    621 <strtol+0x41>
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 6d4:	3c 78                	cmp    $0x78,%al
 6d6:	74 18                	je     6f0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 6d8:	85 db                	test   %ebx,%ebx
 6da:	0f 85 5e ff ff ff    	jne    63e <strtol+0x5e>
        s++, base = 8;
 6e0:	83 c1 01             	add    $0x1,%ecx
 6e3:	0f be d0             	movsbl %al,%edx
 6e6:	bb 08 00 00 00       	mov    $0x8,%ebx
 6eb:	e9 4e ff ff ff       	jmp    63e <strtol+0x5e>
        s += 2, base = 16;
 6f0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 6f4:	bb 10 00 00 00       	mov    $0x10,%ebx
 6f9:	83 c1 02             	add    $0x2,%ecx
 6fc:	e9 3d ff ff ff       	jmp    63e <strtol+0x5e>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop

00000710 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 710:	f3 0f 1e fb          	endbr32 
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 718:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 71a:	56                   	push   %esi
 71b:	53                   	push   %ebx
 71c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 71f:	83 ec 1c             	sub    $0x1c,%esp
 722:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 725:	83 ec 04             	sub    $0x4,%esp
 728:	6a 0a                	push   $0xa
 72a:	53                   	push   %ebx
 72b:	56                   	push   %esi
 72c:	e8 af fe ff ff       	call   5e0 <strtol>
        if (ret < 0 || ret > 255) {
 731:	83 c4 10             	add    $0x10,%esp
 734:	3d ff 00 00 00       	cmp    $0xff,%eax
 739:	77 3d                	ja     778 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 73b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 73e:	39 f1                	cmp    %esi,%ecx
 740:	74 36                	je     778 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 742:	0f b6 11             	movzbl (%ecx),%edx
 745:	83 ff 03             	cmp    $0x3,%edi
 748:	74 16                	je     760 <ip_addr_pton+0x50>
 74a:	80 fa 2e             	cmp    $0x2e,%dl
 74d:	75 29                	jne    778 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 74f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 752:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 755:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 758:	83 c7 01             	add    $0x1,%edi
 75b:	eb c8                	jmp    725 <ip_addr_pton+0x15>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 760:	84 d2                	test   %dl,%dl
 762:	75 14                	jne    778 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 764:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 767:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 76a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 76d:	31 c0                	xor    %eax,%eax
}
 76f:	5b                   	pop    %ebx
 770:	5e                   	pop    %esi
 771:	5f                   	pop    %edi
 772:	5d                   	pop    %ebp
 773:	c3                   	ret    
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 778:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 77b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 780:	5b                   	pop    %ebx
 781:	5e                   	pop    %esi
 782:	5f                   	pop    %edi
 783:	5d                   	pop    %ebp
 784:	c3                   	ret    

00000785 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 785:	b8 01 00 00 00       	mov    $0x1,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <exit>:
SYSCALL(exit)
 78d:	b8 02 00 00 00       	mov    $0x2,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <wait>:
SYSCALL(wait)
 795:	b8 03 00 00 00       	mov    $0x3,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <pipe>:
SYSCALL(pipe)
 79d:	b8 04 00 00 00       	mov    $0x4,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <read>:
SYSCALL(read)
 7a5:	b8 05 00 00 00       	mov    $0x5,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <write>:
SYSCALL(write)
 7ad:	b8 10 00 00 00       	mov    $0x10,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <close>:
SYSCALL(close)
 7b5:	b8 15 00 00 00       	mov    $0x15,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <kill>:
SYSCALL(kill)
 7bd:	b8 06 00 00 00       	mov    $0x6,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <exec>:
SYSCALL(exec)
 7c5:	b8 07 00 00 00       	mov    $0x7,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <open>:
SYSCALL(open)
 7cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <mknod>:
SYSCALL(mknod)
 7d5:	b8 11 00 00 00       	mov    $0x11,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <unlink>:
SYSCALL(unlink)
 7dd:	b8 12 00 00 00       	mov    $0x12,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <fstat>:
SYSCALL(fstat)
 7e5:	b8 08 00 00 00       	mov    $0x8,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <link>:
SYSCALL(link)
 7ed:	b8 13 00 00 00       	mov    $0x13,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <mkdir>:
SYSCALL(mkdir)
 7f5:	b8 14 00 00 00       	mov    $0x14,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <chdir>:
SYSCALL(chdir)
 7fd:	b8 09 00 00 00       	mov    $0x9,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <dup>:
SYSCALL(dup)
 805:	b8 0a 00 00 00       	mov    $0xa,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <getpid>:
SYSCALL(getpid)
 80d:	b8 0b 00 00 00       	mov    $0xb,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <sbrk>:
SYSCALL(sbrk)
 815:	b8 0c 00 00 00       	mov    $0xc,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <sleep>:
SYSCALL(sleep)
 81d:	b8 0d 00 00 00       	mov    $0xd,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <uptime>:
SYSCALL(uptime)
 825:	b8 0e 00 00 00       	mov    $0xe,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <ioctl>:
# iotcl
SYSCALL(ioctl)
 82d:	b8 16 00 00 00       	mov    $0x16,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <socket>:
# socket
SYSCALL(socket)
 835:	b8 17 00 00 00       	mov    $0x17,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <bind>:
SYSCALL(bind)
 83d:	b8 19 00 00 00       	mov    $0x19,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <listen>:
SYSCALL(listen)
 845:	b8 1a 00 00 00       	mov    $0x1a,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <accept>:
SYSCALL(accept)
 84d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <recv>:
SYSCALL(recv)
 855:	b8 1c 00 00 00       	mov    $0x1c,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <send>:
SYSCALL(send)
 85d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <recvfrom>:
SYSCALL(recvfrom)
 865:	b8 1e 00 00 00       	mov    $0x1e,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <sendto>:
SYSCALL(sendto)
 86d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    
 875:	66 90                	xchg   %ax,%ax
 877:	66 90                	xchg   %ax,%ax
 879:	66 90                	xchg   %ax,%ax
 87b:	66 90                	xchg   %ax,%ax
 87d:	66 90                	xchg   %ax,%ax
 87f:	90                   	nop

00000880 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 3c             	sub    $0x3c,%esp
 889:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 88c:	89 d1                	mov    %edx,%ecx
{
 88e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 891:	85 d2                	test   %edx,%edx
 893:	0f 89 7f 00 00 00    	jns    918 <printint+0x98>
 899:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 89d:	74 79                	je     918 <printint+0x98>
    neg = 1;
 89f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8a8:	31 db                	xor    %ebx,%ebx
 8aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8b0:	89 c8                	mov    %ecx,%eax
 8b2:	31 d2                	xor    %edx,%edx
 8b4:	89 cf                	mov    %ecx,%edi
 8b6:	f7 75 c4             	divl   -0x3c(%ebp)
 8b9:	0f b6 92 30 0d 00 00 	movzbl 0xd30(%edx),%edx
 8c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8c3:	89 d8                	mov    %ebx,%eax
 8c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8d1:	76 dd                	jbe    8b0 <printint+0x30>
  if(neg)
 8d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8d6:	85 c9                	test   %ecx,%ecx
 8d8:	74 0c                	je     8e6 <printint+0x66>
    buf[i++] = '-';
 8da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8ed:	eb 07                	jmp    8f6 <printint+0x76>
 8ef:	90                   	nop
 8f0:	0f b6 13             	movzbl (%ebx),%edx
 8f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8f6:	83 ec 04             	sub    $0x4,%esp
 8f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8fc:	6a 01                	push   $0x1
 8fe:	56                   	push   %esi
 8ff:	57                   	push   %edi
 900:	e8 a8 fe ff ff       	call   7ad <write>
  while(--i >= 0)
 905:	83 c4 10             	add    $0x10,%esp
 908:	39 de                	cmp    %ebx,%esi
 90a:	75 e4                	jne    8f0 <printint+0x70>
    putc(fd, buf[i]);
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 90f:	5b                   	pop    %ebx
 910:	5e                   	pop    %esi
 911:	5f                   	pop    %edi
 912:	5d                   	pop    %ebp
 913:	c3                   	ret    
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 918:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 91f:	eb 87                	jmp    8a8 <printint+0x28>
 921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 928:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92f:	90                   	nop

00000930 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 930:	f3 0f 1e fb          	endbr32 
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	57                   	push   %edi
 938:	56                   	push   %esi
 939:	53                   	push   %ebx
 93a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 93d:	8b 75 0c             	mov    0xc(%ebp),%esi
 940:	0f b6 1e             	movzbl (%esi),%ebx
 943:	84 db                	test   %bl,%bl
 945:	0f 84 b4 00 00 00    	je     9ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 94b:	8d 45 10             	lea    0x10(%ebp),%eax
 94e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 951:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 954:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 956:	89 45 d0             	mov    %eax,-0x30(%ebp)
 959:	eb 33                	jmp    98e <printf+0x5e>
 95b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop
 960:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 963:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 968:	83 f8 25             	cmp    $0x25,%eax
 96b:	74 17                	je     984 <printf+0x54>
  write(fd, &c, 1);
 96d:	83 ec 04             	sub    $0x4,%esp
 970:	88 5d e7             	mov    %bl,-0x19(%ebp)
 973:	6a 01                	push   $0x1
 975:	57                   	push   %edi
 976:	ff 75 08             	pushl  0x8(%ebp)
 979:	e8 2f fe ff ff       	call   7ad <write>
 97e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 981:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 984:	0f b6 1e             	movzbl (%esi),%ebx
 987:	83 c6 01             	add    $0x1,%esi
 98a:	84 db                	test   %bl,%bl
 98c:	74 71                	je     9ff <printf+0xcf>
    c = fmt[i] & 0xff;
 98e:	0f be cb             	movsbl %bl,%ecx
 991:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 994:	85 d2                	test   %edx,%edx
 996:	74 c8                	je     960 <printf+0x30>
      }
    } else if(state == '%'){
 998:	83 fa 25             	cmp    $0x25,%edx
 99b:	75 e7                	jne    984 <printf+0x54>
      if(c == 'd'){
 99d:	83 f8 64             	cmp    $0x64,%eax
 9a0:	0f 84 9a 00 00 00    	je     a40 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9ac:	83 f9 70             	cmp    $0x70,%ecx
 9af:	74 5f                	je     a10 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9b1:	83 f8 73             	cmp    $0x73,%eax
 9b4:	0f 84 d6 00 00 00    	je     a90 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ba:	83 f8 63             	cmp    $0x63,%eax
 9bd:	0f 84 8d 00 00 00    	je     a50 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9c3:	83 f8 25             	cmp    $0x25,%eax
 9c6:	0f 84 b4 00 00 00    	je     a80 <printf+0x150>
  write(fd, &c, 1);
 9cc:	83 ec 04             	sub    $0x4,%esp
 9cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9d3:	6a 01                	push   $0x1
 9d5:	57                   	push   %edi
 9d6:	ff 75 08             	pushl  0x8(%ebp)
 9d9:	e8 cf fd ff ff       	call   7ad <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9e1:	83 c4 0c             	add    $0xc,%esp
 9e4:	6a 01                	push   $0x1
 9e6:	83 c6 01             	add    $0x1,%esi
 9e9:	57                   	push   %edi
 9ea:	ff 75 08             	pushl  0x8(%ebp)
 9ed:	e8 bb fd ff ff       	call   7ad <write>
  for(i = 0; fmt[i]; i++){
 9f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 9f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 9f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 9fb:	84 db                	test   %bl,%bl
 9fd:	75 8f                	jne    98e <printf+0x5e>
    }
  }
}
 9ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a02:	5b                   	pop    %ebx
 a03:	5e                   	pop    %esi
 a04:	5f                   	pop    %edi
 a05:	5d                   	pop    %ebp
 a06:	c3                   	ret    
 a07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a0e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a10:	83 ec 0c             	sub    $0xc,%esp
 a13:	b9 10 00 00 00       	mov    $0x10,%ecx
 a18:	6a 00                	push   $0x0
 a1a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a1d:	8b 45 08             	mov    0x8(%ebp),%eax
 a20:	8b 13                	mov    (%ebx),%edx
 a22:	e8 59 fe ff ff       	call   880 <printint>
        ap++;
 a27:	89 d8                	mov    %ebx,%eax
 a29:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a2c:	31 d2                	xor    %edx,%edx
        ap++;
 a2e:	83 c0 04             	add    $0x4,%eax
 a31:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a34:	e9 4b ff ff ff       	jmp    984 <printf+0x54>
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a40:	83 ec 0c             	sub    $0xc,%esp
 a43:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a48:	6a 01                	push   $0x1
 a4a:	eb ce                	jmp    a1a <printf+0xea>
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a50:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a53:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a56:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a58:	6a 01                	push   $0x1
        ap++;
 a5a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a5d:	57                   	push   %edi
 a5e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a61:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a64:	e8 44 fd ff ff       	call   7ad <write>
        ap++;
 a69:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a6c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a6f:	31 d2                	xor    %edx,%edx
 a71:	e9 0e ff ff ff       	jmp    984 <printf+0x54>
 a76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a7d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a80:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a83:	83 ec 04             	sub    $0x4,%esp
 a86:	e9 59 ff ff ff       	jmp    9e4 <printf+0xb4>
 a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
        s = (char*)*ap;
 a90:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a93:	8b 18                	mov    (%eax),%ebx
        ap++;
 a95:	83 c0 04             	add    $0x4,%eax
 a98:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a9b:	85 db                	test   %ebx,%ebx
 a9d:	74 17                	je     ab6 <printf+0x186>
        while(*s != 0){
 a9f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 aa2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 aa4:	84 c0                	test   %al,%al
 aa6:	0f 84 d8 fe ff ff    	je     984 <printf+0x54>
 aac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 aaf:	89 de                	mov    %ebx,%esi
 ab1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ab4:	eb 1a                	jmp    ad0 <printf+0x1a0>
          s = "(null)";
 ab6:	bb 28 0d 00 00       	mov    $0xd28,%ebx
        while(*s != 0){
 abb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 abe:	b8 28 00 00 00       	mov    $0x28,%eax
 ac3:	89 de                	mov    %ebx,%esi
 ac5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ac8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop
  write(fd, &c, 1);
 ad0:	83 ec 04             	sub    $0x4,%esp
          s++;
 ad3:	83 c6 01             	add    $0x1,%esi
 ad6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ad9:	6a 01                	push   $0x1
 adb:	57                   	push   %edi
 adc:	53                   	push   %ebx
 add:	e8 cb fc ff ff       	call   7ad <write>
        while(*s != 0){
 ae2:	0f b6 06             	movzbl (%esi),%eax
 ae5:	83 c4 10             	add    $0x10,%esp
 ae8:	84 c0                	test   %al,%al
 aea:	75 e4                	jne    ad0 <printf+0x1a0>
 aec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 aef:	31 d2                	xor    %edx,%edx
 af1:	e9 8e fe ff ff       	jmp    984 <printf+0x54>
 af6:	66 90                	xchg   %ax,%ax
 af8:	66 90                	xchg   %ax,%ax
 afa:	66 90                	xchg   %ax,%ax
 afc:	66 90                	xchg   %ax,%ax
 afe:	66 90                	xchg   %ax,%ax

00000b00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b00:	f3 0f 1e fb          	endbr32 
 b04:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b05:	a1 24 11 00 00       	mov    0x1124,%eax
{
 b0a:	89 e5                	mov    %esp,%ebp
 b0c:	57                   	push   %edi
 b0d:	56                   	push   %esi
 b0e:	53                   	push   %ebx
 b0f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b12:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b14:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b17:	39 c8                	cmp    %ecx,%eax
 b19:	73 15                	jae    b30 <free+0x30>
 b1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop
 b20:	39 d1                	cmp    %edx,%ecx
 b22:	72 14                	jb     b38 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b24:	39 d0                	cmp    %edx,%eax
 b26:	73 10                	jae    b38 <free+0x38>
{
 b28:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b2a:	8b 10                	mov    (%eax),%edx
 b2c:	39 c8                	cmp    %ecx,%eax
 b2e:	72 f0                	jb     b20 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b30:	39 d0                	cmp    %edx,%eax
 b32:	72 f4                	jb     b28 <free+0x28>
 b34:	39 d1                	cmp    %edx,%ecx
 b36:	73 f0                	jae    b28 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b38:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b3b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b3e:	39 fa                	cmp    %edi,%edx
 b40:	74 1e                	je     b60 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b42:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b45:	8b 50 04             	mov    0x4(%eax),%edx
 b48:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b4b:	39 f1                	cmp    %esi,%ecx
 b4d:	74 28                	je     b77 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b4f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b51:	5b                   	pop    %ebx
  freep = p;
 b52:	a3 24 11 00 00       	mov    %eax,0x1124
}
 b57:	5e                   	pop    %esi
 b58:	5f                   	pop    %edi
 b59:	5d                   	pop    %ebp
 b5a:	c3                   	ret    
 b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b5f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b60:	03 72 04             	add    0x4(%edx),%esi
 b63:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b66:	8b 10                	mov    (%eax),%edx
 b68:	8b 12                	mov    (%edx),%edx
 b6a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b6d:	8b 50 04             	mov    0x4(%eax),%edx
 b70:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b73:	39 f1                	cmp    %esi,%ecx
 b75:	75 d8                	jne    b4f <free+0x4f>
    p->s.size += bp->s.size;
 b77:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b7a:	a3 24 11 00 00       	mov    %eax,0x1124
    p->s.size += bp->s.size;
 b7f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b82:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b85:	89 10                	mov    %edx,(%eax)
}
 b87:	5b                   	pop    %ebx
 b88:	5e                   	pop    %esi
 b89:	5f                   	pop    %edi
 b8a:	5d                   	pop    %ebp
 b8b:	c3                   	ret    
 b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b90:	f3 0f 1e fb          	endbr32 
 b94:	55                   	push   %ebp
 b95:	89 e5                	mov    %esp,%ebp
 b97:	57                   	push   %edi
 b98:	56                   	push   %esi
 b99:	53                   	push   %ebx
 b9a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 ba0:	8b 3d 24 11 00 00    	mov    0x1124,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba6:	8d 70 07             	lea    0x7(%eax),%esi
 ba9:	c1 ee 03             	shr    $0x3,%esi
 bac:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 baf:	85 ff                	test   %edi,%edi
 bb1:	0f 84 a9 00 00 00    	je     c60 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bb7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 bb9:	8b 48 04             	mov    0x4(%eax),%ecx
 bbc:	39 f1                	cmp    %esi,%ecx
 bbe:	73 6d                	jae    c2d <malloc+0x9d>
 bc0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 bc6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 bcb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 bce:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 bd5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 bd8:	eb 17                	jmp    bf1 <malloc+0x61>
 bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 be2:	8b 4a 04             	mov    0x4(%edx),%ecx
 be5:	39 f1                	cmp    %esi,%ecx
 be7:	73 4f                	jae    c38 <malloc+0xa8>
 be9:	8b 3d 24 11 00 00    	mov    0x1124,%edi
 bef:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bf1:	39 c7                	cmp    %eax,%edi
 bf3:	75 eb                	jne    be0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 bf5:	83 ec 0c             	sub    $0xc,%esp
 bf8:	ff 75 e4             	pushl  -0x1c(%ebp)
 bfb:	e8 15 fc ff ff       	call   815 <sbrk>
  if(p == (char*)-1)
 c00:	83 c4 10             	add    $0x10,%esp
 c03:	83 f8 ff             	cmp    $0xffffffff,%eax
 c06:	74 1b                	je     c23 <malloc+0x93>
  hp->s.size = nu;
 c08:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c0b:	83 ec 0c             	sub    $0xc,%esp
 c0e:	83 c0 08             	add    $0x8,%eax
 c11:	50                   	push   %eax
 c12:	e8 e9 fe ff ff       	call   b00 <free>
  return freep;
 c17:	a1 24 11 00 00       	mov    0x1124,%eax
      if((p = morecore(nunits)) == 0)
 c1c:	83 c4 10             	add    $0x10,%esp
 c1f:	85 c0                	test   %eax,%eax
 c21:	75 bd                	jne    be0 <malloc+0x50>
        return 0;
  }
}
 c23:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c26:	31 c0                	xor    %eax,%eax
}
 c28:	5b                   	pop    %ebx
 c29:	5e                   	pop    %esi
 c2a:	5f                   	pop    %edi
 c2b:	5d                   	pop    %ebp
 c2c:	c3                   	ret    
    if(p->s.size >= nunits){
 c2d:	89 c2                	mov    %eax,%edx
 c2f:	89 f8                	mov    %edi,%eax
 c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c38:	39 ce                	cmp    %ecx,%esi
 c3a:	74 54                	je     c90 <malloc+0x100>
        p->s.size -= nunits;
 c3c:	29 f1                	sub    %esi,%ecx
 c3e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c41:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c44:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c47:	a3 24 11 00 00       	mov    %eax,0x1124
}
 c4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c4f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c52:	5b                   	pop    %ebx
 c53:	5e                   	pop    %esi
 c54:	5f                   	pop    %edi
 c55:	5d                   	pop    %ebp
 c56:	c3                   	ret    
 c57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c5e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c60:	c7 05 24 11 00 00 28 	movl   $0x1128,0x1124
 c67:	11 00 00 
    base.s.size = 0;
 c6a:	bf 28 11 00 00       	mov    $0x1128,%edi
    base.s.ptr = freep = prevp = &base;
 c6f:	c7 05 28 11 00 00 28 	movl   $0x1128,0x1128
 c76:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c79:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c7b:	c7 05 2c 11 00 00 00 	movl   $0x0,0x112c
 c82:	00 00 00 
    if(p->s.size >= nunits){
 c85:	e9 36 ff ff ff       	jmp    bc0 <malloc+0x30>
 c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c90:	8b 0a                	mov    (%edx),%ecx
 c92:	89 08                	mov    %ecx,(%eax)
 c94:	eb b1                	jmp    c47 <malloc+0xb7>
