
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
  38:	e8 83 02 00 00       	call   2c0 <atoi>
  3d:	89 04 24             	mov    %eax,(%esp)
  40:	e8 88 07 00 00       	call   7cd <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 4c 07 00 00       	call   79d <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 a8 0c 00 00       	push   $0xca8
  58:	6a 02                	push   $0x2
  5a:	e8 e1 08 00 00       	call   940 <printf>
    exit();
  5f:	e8 39 07 00 00       	call   79d <exit>
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

000000a0 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	8b 7d 10             	mov    0x10(%ebp),%edi
  ab:	56                   	push   %esi
  ac:	8b 75 08             	mov    0x8(%ebp),%esi
  af:	53                   	push   %ebx
  b0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
  b3:	85 ff                	test   %edi,%edi
  b5:	74 39                	je     f0 <strcat_s+0x50>
  b7:	31 c0                	xor    %eax,%eax
  b9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  be:	eb 11                	jmp    d1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
  c0:	0f b6 12             	movzbl (%edx),%edx
  c3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  c6:	84 d2                	test   %dl,%dl
  c8:	74 26                	je     f0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
  ca:	83 c0 01             	add    $0x1,%eax
  cd:	39 c7                	cmp    %eax,%edi
  cf:	74 1f                	je     f0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
  d1:	89 c2                	mov    %eax,%edx
  d3:	29 ca                	sub    %ecx,%edx
  d5:	01 da                	add    %ebx,%edx
  d7:	83 f9 ff             	cmp    $0xffffffff,%ecx
  da:	75 e4                	jne    c0 <strcat_s+0x20>
  dc:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
  e0:	75 e8                	jne    ca <strcat_s+0x2a>
  e2:	89 da                	mov    %ebx,%edx
  e4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
  e6:	0f b6 12             	movzbl (%edx),%edx
  e9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  ec:	84 d2                	test   %dl,%dl
  ee:	75 da                	jne    ca <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
  f0:	5b                   	pop    %ebx
  f1:	89 f0                	mov    %esi,%eax
  f3:	5e                   	pop    %esi
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fe:	66 90                	xchg   %ax,%ax

00000100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	53                   	push   %ebx
 108:	8b 4d 08             	mov    0x8(%ebp),%ecx
 10b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 10e:	0f b6 01             	movzbl (%ecx),%eax
 111:	0f b6 1a             	movzbl (%edx),%ebx
 114:	84 c0                	test   %al,%al
 116:	75 19                	jne    131 <strcmp+0x31>
 118:	eb 26                	jmp    140 <strcmp+0x40>
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 120:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 124:	83 c1 01             	add    $0x1,%ecx
 127:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 12a:	0f b6 1a             	movzbl (%edx),%ebx
 12d:	84 c0                	test   %al,%al
 12f:	74 0f                	je     140 <strcmp+0x40>
 131:	38 d8                	cmp    %bl,%al
 133:	74 eb                	je     120 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 135:	29 d8                	sub    %ebx,%eax
}
 137:	5b                   	pop    %ebx
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 142:	29 d8                	sub    %ebx,%eax
}
 144:	5b                   	pop    %ebx
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14e:	66 90                	xchg   %ax,%ax

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 15a:	80 3a 00             	cmpb   $0x0,(%edx)
 15d:	74 21                	je     180 <strlen+0x30>
 15f:	31 c0                	xor    %eax,%eax
 161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 168:	83 c0 01             	add    $0x1,%eax
 16b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 16f:	89 c1                	mov    %eax,%ecx
 171:	75 f5                	jne    168 <strlen+0x18>
    ;
  return n;
}
 173:	89 c8                	mov    %ecx,%eax
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 180:	31 c9                	xor    %ecx,%ecx
}
 182:	5d                   	pop    %ebp
 183:	89 c8                	mov    %ecx,%eax
 185:	c3                   	ret    
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 19b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19e:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a1:	89 d7                	mov    %edx,%edi
 1a3:	fc                   	cld    
 1a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <strchr>:

char*
strchr(const char *s, char c)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1be:	0f b6 10             	movzbl (%eax),%edx
 1c1:	84 d2                	test   %dl,%dl
 1c3:	75 16                	jne    1db <strchr+0x2b>
 1c5:	eb 21                	jmp    1e8 <strchr+0x38>
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax
 1d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	84 d2                	test   %dl,%dl
 1d9:	74 0d                	je     1e8 <strchr+0x38>
    if(*s == c)
 1db:	38 d1                	cmp    %dl,%cl
 1dd:	75 f1                	jne    1d0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1e8:	31 c0                	xor    %eax,%eax
}
 1ea:	5d                   	pop    %ebp
 1eb:	c3                   	ret    
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <gets>:

char*
gets(char *buf, int max)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f9:	31 f6                	xor    %esi,%esi
{
 1fb:	53                   	push   %ebx
 1fc:	89 f3                	mov    %esi,%ebx
 1fe:	83 ec 1c             	sub    $0x1c,%esp
 201:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 204:	eb 33                	jmp    239 <gets+0x49>
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 210:	83 ec 04             	sub    $0x4,%esp
 213:	8d 45 e7             	lea    -0x19(%ebp),%eax
 216:	6a 01                	push   $0x1
 218:	50                   	push   %eax
 219:	6a 00                	push   $0x0
 21b:	e8 95 05 00 00       	call   7b5 <read>
    if(cc < 1)
 220:	83 c4 10             	add    $0x10,%esp
 223:	85 c0                	test   %eax,%eax
 225:	7e 1c                	jle    243 <gets+0x53>
      break;
    buf[i++] = c;
 227:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 22b:	83 c7 01             	add    $0x1,%edi
 22e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 231:	3c 0a                	cmp    $0xa,%al
 233:	74 23                	je     258 <gets+0x68>
 235:	3c 0d                	cmp    $0xd,%al
 237:	74 1f                	je     258 <gets+0x68>
  for(i=0; i+1 < max; ){
 239:	83 c3 01             	add    $0x1,%ebx
 23c:	89 fe                	mov    %edi,%esi
 23e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 241:	7c cd                	jl     210 <gets+0x20>
 243:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 245:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 248:	c6 03 00             	movb   $0x0,(%ebx)
}
 24b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24e:	5b                   	pop    %ebx
 24f:	5e                   	pop    %esi
 250:	5f                   	pop    %edi
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 257:	90                   	nop
 258:	8b 75 08             	mov    0x8(%ebp),%esi
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	01 de                	add    %ebx,%esi
 260:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 262:	c6 03 00             	movb   $0x0,(%ebx)
}
 265:	8d 65 f4             	lea    -0xc(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5f                   	pop    %edi
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	56                   	push   %esi
 278:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	6a 00                	push   $0x0
 27e:	ff 75 08             	pushl  0x8(%ebp)
 281:	e8 57 05 00 00       	call   7dd <open>
  if(fd < 0)
 286:	83 c4 10             	add    $0x10,%esp
 289:	85 c0                	test   %eax,%eax
 28b:	78 2b                	js     2b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	ff 75 0c             	pushl  0xc(%ebp)
 293:	89 c3                	mov    %eax,%ebx
 295:	50                   	push   %eax
 296:	e8 5a 05 00 00       	call   7f5 <fstat>
  close(fd);
 29b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29e:	89 c6                	mov    %eax,%esi
  close(fd);
 2a0:	e8 20 05 00 00       	call   7c5 <close>
  return r;
 2a5:	83 c4 10             	add    $0x10,%esp
}
 2a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ab:	89 f0                	mov    %esi,%eax
 2ad:	5b                   	pop    %ebx
 2ae:	5e                   	pop    %esi
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2bd:	eb e9                	jmp    2a8 <stat+0x38>
 2bf:	90                   	nop

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	53                   	push   %ebx
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2cb:	0f be 02             	movsbl (%edx),%eax
 2ce:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2d1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d9:	77 1a                	ja     2f5 <atoi+0x35>
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	89 c8                	mov    %ecx,%eax
 2f7:	5b                   	pop    %ebx
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	57                   	push   %edi
 308:	8b 45 10             	mov    0x10(%ebp),%eax
 30b:	8b 55 08             	mov    0x8(%ebp),%edx
 30e:	56                   	push   %esi
 30f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	85 c0                	test   %eax,%eax
 314:	7e 0f                	jle    325 <memmove+0x25>
 316:	01 d0                	add    %edx,%eax
  dst = vdst;
 318:	89 d7                	mov    %edx,%edi
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	56                   	push   %esi
 339:	53                   	push   %ebx
 33a:	83 ec 34             	sub    $0x34,%esp
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 340:	68 bc 0c 00 00       	push   $0xcbc
hexdump (void *data, size_t size) {
 345:	89 45 e0             	mov    %eax,-0x20(%ebp)
 348:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 34b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 34d:	89 c7                	mov    %eax,%edi
 34f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 352:	e8 e9 05 00 00       	call   940 <printf>
  for (offset = 0; offset < size; offset += 16) {
 357:	83 c4 10             	add    $0x10,%esp
 35a:	85 ff                	test   %edi,%edi
 35c:	0f 84 2d 01 00 00    	je     48f <hexdump+0x15f>
 362:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 365:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 36c:	be 10 00 00 00       	mov    $0x10,%esi
 371:	83 e8 01             	sub    $0x1,%eax
 374:	83 e0 f0             	and    $0xfffffff0,%eax
 377:	83 c0 10             	add    $0x10,%eax
 37a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 380:	83 ec 08             	sub    $0x8,%esp
 383:	68 10 0d 00 00       	push   $0xd10
 388:	6a 01                	push   $0x1
 38a:	e8 b1 05 00 00       	call   940 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 38f:	83 c4 10             	add    $0x10,%esp
 392:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 399:	0f 8e 51 01 00 00    	jle    4f0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 39f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 3a2:	83 ec 04             	sub    $0x4,%esp
 3a5:	57                   	push   %edi
 3a6:	89 fb                	mov    %edi,%ebx
 3a8:	68 0d 0d 00 00       	push   $0xd0d
 3ad:	6a 01                	push   $0x1
 3af:	e8 8c 05 00 00       	call   940 <printf>
 3b4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 3b7:	83 c4 10             	add    $0x10,%esp
 3ba:	8b 7d e0             	mov    -0x20(%ebp),%edi
 3bd:	eb 28                	jmp    3e7 <hexdump+0xb7>
 3bf:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 3c0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 3c4:	80 fa 0f             	cmp    $0xf,%dl
 3c7:	0f 86 e3 00 00 00    	jbe    4b0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 3cd:	83 ec 04             	sub    $0x4,%esp
 3d0:	83 c3 01             	add    $0x1,%ebx
 3d3:	52                   	push   %edx
 3d4:	68 13 0d 00 00       	push   $0xd13
 3d9:	6a 01                	push   $0x1
 3db:	e8 60 05 00 00       	call   940 <printf>
 3e0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3e3:	39 f3                	cmp    %esi,%ebx
 3e5:	74 1e                	je     405 <hexdump+0xd5>
      if(offset + index < (int)size) {
 3e7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 3ea:	7f d4                	jg     3c0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 3ec:	83 ec 08             	sub    $0x8,%esp
 3ef:	83 c3 01             	add    $0x1,%ebx
 3f2:	68 17 0d 00 00       	push   $0xd17
 3f7:	6a 01                	push   $0x1
 3f9:	e8 42 05 00 00       	call   940 <printf>
 3fe:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 401:	39 f3                	cmp    %esi,%ebx
 403:	75 e2                	jne    3e7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 405:	83 ec 08             	sub    $0x8,%esp
 408:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 40b:	68 10 0d 00 00       	push   $0xd10
 410:	6a 01                	push   $0x1
 412:	e8 29 05 00 00       	call   940 <printf>
 417:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 41a:	83 c4 10             	add    $0x10,%esp
 41d:	eb 1b                	jmp    43a <hexdump+0x10a>
 41f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 420:	83 ec 04             	sub    $0x4,%esp
 423:	52                   	push   %edx
 424:	68 1b 0d 00 00       	push   $0xd1b
 429:	6a 01                	push   $0x1
 42b:	e8 10 05 00 00       	call   940 <printf>
 430:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 433:	83 c3 01             	add    $0x1,%ebx
 436:	39 de                	cmp    %ebx,%esi
 438:	74 30                	je     46a <hexdump+0x13a>
      if(offset + index < (int)size) {
 43a:	39 df                	cmp    %ebx,%edi
 43c:	0f 8e 8e 00 00 00    	jle    4d0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 442:	8b 45 e0             	mov    -0x20(%ebp),%eax
 445:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 449:	8d 4a e0             	lea    -0x20(%edx),%ecx
 44c:	80 f9 5e             	cmp    $0x5e,%cl
 44f:	76 cf                	jbe    420 <hexdump+0xf0>
        } else {
          printf(1, ".");
 451:	83 ec 08             	sub    $0x8,%esp
 454:	83 c3 01             	add    $0x1,%ebx
 457:	68 1e 0d 00 00       	push   $0xd1e
 45c:	6a 01                	push   $0x1
 45e:	e8 dd 04 00 00       	call   940 <printf>
 463:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 466:	39 de                	cmp    %ebx,%esi
 468:	75 d0                	jne    43a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 46a:	83 ec 08             	sub    $0x8,%esp
 46d:	83 c6 10             	add    $0x10,%esi
 470:	68 20 0d 00 00       	push   $0xd20
 475:	6a 01                	push   $0x1
 477:	e8 c4 04 00 00       	call   940 <printf>
  for (offset = 0; offset < size; offset += 16) {
 47c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 480:	83 c4 10             	add    $0x10,%esp
 483:	8b 45 dc             	mov    -0x24(%ebp),%eax
 486:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 489:	0f 85 f1 fe ff ff    	jne    380 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 48f:	c7 45 0c bc 0c 00 00 	movl   $0xcbc,0xc(%ebp)
 496:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 49d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a0:	5b                   	pop    %ebx
 4a1:	5e                   	pop    %esi
 4a2:	5f                   	pop    %edi
 4a3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4a4:	e9 97 04 00 00       	jmp    940 <printf>
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4b0:	83 ec 08             	sub    $0x8,%esp
 4b3:	68 0b 0d 00 00       	push   $0xd0b
 4b8:	6a 01                	push   $0x1
 4ba:	e8 81 04 00 00       	call   940 <printf>
 4bf:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4c3:	83 c4 10             	add    $0x10,%esp
 4c6:	e9 02 ff ff ff       	jmp    3cd <hexdump+0x9d>
 4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop
        printf(1, " ");
 4d0:	83 ec 08             	sub    $0x8,%esp
 4d3:	68 19 0d 00 00       	push   $0xd19
 4d8:	6a 01                	push   $0x1
 4da:	e8 61 04 00 00       	call   940 <printf>
 4df:	83 c4 10             	add    $0x10,%esp
 4e2:	e9 4c ff ff ff       	jmp    433 <hexdump+0x103>
 4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ee:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	68 0b 0d 00 00       	push   $0xd0b
 4f8:	6a 01                	push   $0x1
 4fa:	e8 41 04 00 00       	call   940 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 4ff:	8b 7d dc             	mov    -0x24(%ebp),%edi
 502:	83 c4 10             	add    $0x10,%esp
 505:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 50b:	0f 8f 8e fe ff ff    	jg     39f <hexdump+0x6f>
 511:	83 ec 08             	sub    $0x8,%esp
 514:	68 0b 0d 00 00       	push   $0xd0b
 519:	6a 01                	push   $0x1
 51b:	e8 20 04 00 00       	call   940 <printf>
    if (offset <= 0x000f) printf(1, "0");
 520:	83 c4 10             	add    $0x10,%esp
 523:	83 ff 0f             	cmp    $0xf,%edi
 526:	0f 8f 73 fe ff ff    	jg     39f <hexdump+0x6f>
 52c:	83 ec 08             	sub    $0x8,%esp
 52f:	68 0b 0d 00 00       	push   $0xd0b
 534:	6a 01                	push   $0x1
 536:	e8 05 04 00 00       	call   940 <printf>
 53b:	83 c4 10             	add    $0x10,%esp
 53e:	e9 5c fe ff ff       	jmp    39f <hexdump+0x6f>
 543:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000550 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 550:	f3 0f 1e fb          	endbr32 
 554:	55                   	push   %ebp
    if (!endian)
 555:	a1 20 11 00 00       	mov    0x1120,%eax
{
 55a:	89 e5                	mov    %esp,%ebp
 55c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 55f:	85 c0                	test   %eax,%eax
 561:	75 1d                	jne    580 <hton16+0x30>
        endian = byteorder();
 563:	c7 05 20 11 00 00 d2 	movl   $0x4d2,0x1120
 56a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 56d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 56f:	5d                   	pop    %ebp
 570:	66 c1 c2 08          	rol    $0x8,%dx
 574:	89 d0                	mov    %edx,%eax
 576:	c3                   	ret    
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
 580:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 582:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 587:	74 e4                	je     56d <hton16+0x1d>
}
 589:	89 d0                	mov    %edx,%eax
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret    
 58d:	8d 76 00             	lea    0x0(%esi),%esi

00000590 <ntoh16>:
 590:	f3 0f 1e fb          	endbr32 
 594:	eb ba                	jmp    550 <hton16>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi

000005a0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
    if (!endian)
 5a5:	8b 15 20 11 00 00    	mov    0x1120,%edx
{
 5ab:	89 e5                	mov    %esp,%ebp
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 5b0:	85 d2                	test   %edx,%edx
 5b2:	75 14                	jne    5c8 <hton32+0x28>
        endian = byteorder();
 5b4:	c7 05 20 11 00 00 d2 	movl   $0x4d2,0x1120
 5bb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 5be:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 5c8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 5ce:	74 ee                	je     5be <hton32+0x1e>
}
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    
 5d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005e0 <ntoh32>:
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	eb ba                	jmp    5a0 <hton32>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi

000005f0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	57                   	push   %edi
 5f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5fb:	56                   	push   %esi
 5fc:	53                   	push   %ebx
 5fd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 600:	0f b6 01             	movzbl (%ecx),%eax
 603:	3c 09                	cmp    $0x9,%al
 605:	74 09                	je     610 <strtol+0x20>
 607:	3c 20                	cmp    $0x20,%al
 609:	75 14                	jne    61f <strtol+0x2f>
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
 610:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 614:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 617:	3c 20                	cmp    $0x20,%al
 619:	74 f5                	je     610 <strtol+0x20>
 61b:	3c 09                	cmp    $0x9,%al
 61d:	74 f1                	je     610 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 61f:	3c 2b                	cmp    $0x2b,%al
 621:	0f 84 a9 00 00 00    	je     6d0 <strtol+0xe0>
    int neg = 0;
 627:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 629:	3c 2d                	cmp    $0x2d,%al
 62b:	0f 84 8f 00 00 00    	je     6c0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 631:	0f be 11             	movsbl (%ecx),%edx
 634:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 63a:	75 12                	jne    64e <strtol+0x5e>
 63c:	80 fa 30             	cmp    $0x30,%dl
 63f:	0f 84 9b 00 00 00    	je     6e0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 645:	85 db                	test   %ebx,%ebx
 647:	75 05                	jne    64e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 649:	bb 0a 00 00 00       	mov    $0xa,%ebx
 64e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 651:	31 c0                	xor    %eax,%eax
 653:	eb 17                	jmp    66c <strtol+0x7c>
 655:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 658:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 65b:	3b 55 10             	cmp    0x10(%ebp),%edx
 65e:	7d 28                	jge    688 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 660:	0f af 45 10          	imul   0x10(%ebp),%eax
 664:	83 c1 01             	add    $0x1,%ecx
 667:	01 d0                	add    %edx,%eax
    while (1) {
 669:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 66c:	8d 72 d0             	lea    -0x30(%edx),%esi
 66f:	89 f3                	mov    %esi,%ebx
 671:	80 fb 09             	cmp    $0x9,%bl
 674:	76 e2                	jbe    658 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 676:	8d 72 9f             	lea    -0x61(%edx),%esi
 679:	89 f3                	mov    %esi,%ebx
 67b:	80 fb 19             	cmp    $0x19,%bl
 67e:	77 28                	ja     6a8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 680:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 683:	3b 55 10             	cmp    0x10(%ebp),%edx
 686:	7c d8                	jl     660 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 688:	8b 55 0c             	mov    0xc(%ebp),%edx
 68b:	85 d2                	test   %edx,%edx
 68d:	74 05                	je     694 <strtol+0xa4>
        *endptr = (char *) s;
 68f:	8b 75 0c             	mov    0xc(%ebp),%esi
 692:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 694:	89 c2                	mov    %eax,%edx
}
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
    return (neg ? -val : val);
 698:	f7 da                	neg    %edx
 69a:	85 ff                	test   %edi,%edi
}
 69c:	5f                   	pop    %edi
 69d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 69e:	0f 45 c2             	cmovne %edx,%eax
}
 6a1:	c3                   	ret    
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 6a8:	8d 72 bf             	lea    -0x41(%edx),%esi
 6ab:	89 f3                	mov    %esi,%ebx
 6ad:	80 fb 19             	cmp    $0x19,%bl
 6b0:	77 d6                	ja     688 <strtol+0x98>
            dig = *s - 'A' + 10;
 6b2:	83 ea 37             	sub    $0x37,%edx
 6b5:	eb a4                	jmp    65b <strtol+0x6b>
 6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6be:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 6c0:	83 c1 01             	add    $0x1,%ecx
 6c3:	bf 01 00 00 00       	mov    $0x1,%edi
 6c8:	e9 64 ff ff ff       	jmp    631 <strtol+0x41>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 6d0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 6d3:	31 ff                	xor    %edi,%edi
 6d5:	e9 57 ff ff ff       	jmp    631 <strtol+0x41>
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 6e4:	3c 78                	cmp    $0x78,%al
 6e6:	74 18                	je     700 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 6e8:	85 db                	test   %ebx,%ebx
 6ea:	0f 85 5e ff ff ff    	jne    64e <strtol+0x5e>
        s++, base = 8;
 6f0:	83 c1 01             	add    $0x1,%ecx
 6f3:	0f be d0             	movsbl %al,%edx
 6f6:	bb 08 00 00 00       	mov    $0x8,%ebx
 6fb:	e9 4e ff ff ff       	jmp    64e <strtol+0x5e>
        s += 2, base = 16;
 700:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 704:	bb 10 00 00 00       	mov    $0x10,%ebx
 709:	83 c1 02             	add    $0x2,%ecx
 70c:	e9 3d ff ff ff       	jmp    64e <strtol+0x5e>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop

00000720 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 720:	f3 0f 1e fb          	endbr32 
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 728:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 72a:	56                   	push   %esi
 72b:	53                   	push   %ebx
 72c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 72f:	83 ec 1c             	sub    $0x1c,%esp
 732:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 735:	83 ec 04             	sub    $0x4,%esp
 738:	6a 0a                	push   $0xa
 73a:	53                   	push   %ebx
 73b:	56                   	push   %esi
 73c:	e8 af fe ff ff       	call   5f0 <strtol>
        if (ret < 0 || ret > 255) {
 741:	83 c4 10             	add    $0x10,%esp
 744:	3d ff 00 00 00       	cmp    $0xff,%eax
 749:	77 3d                	ja     788 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 74b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 74e:	39 f1                	cmp    %esi,%ecx
 750:	74 36                	je     788 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 752:	0f b6 11             	movzbl (%ecx),%edx
 755:	83 ff 03             	cmp    $0x3,%edi
 758:	74 16                	je     770 <ip_addr_pton+0x50>
 75a:	80 fa 2e             	cmp    $0x2e,%dl
 75d:	75 29                	jne    788 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 75f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 762:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 765:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 768:	83 c7 01             	add    $0x1,%edi
 76b:	eb c8                	jmp    735 <ip_addr_pton+0x15>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 770:	84 d2                	test   %dl,%dl
 772:	75 14                	jne    788 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 774:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 777:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 77a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 77d:	31 c0                	xor    %eax,%eax
}
 77f:	5b                   	pop    %ebx
 780:	5e                   	pop    %esi
 781:	5f                   	pop    %edi
 782:	5d                   	pop    %ebp
 783:	c3                   	ret    
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 788:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 78b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 790:	5b                   	pop    %ebx
 791:	5e                   	pop    %esi
 792:	5f                   	pop    %edi
 793:	5d                   	pop    %ebp
 794:	c3                   	ret    

00000795 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 795:	b8 01 00 00 00       	mov    $0x1,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <exit>:
SYSCALL(exit)
 79d:	b8 02 00 00 00       	mov    $0x2,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <wait>:
SYSCALL(wait)
 7a5:	b8 03 00 00 00       	mov    $0x3,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <pipe>:
SYSCALL(pipe)
 7ad:	b8 04 00 00 00       	mov    $0x4,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <read>:
SYSCALL(read)
 7b5:	b8 05 00 00 00       	mov    $0x5,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <write>:
SYSCALL(write)
 7bd:	b8 10 00 00 00       	mov    $0x10,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <close>:
SYSCALL(close)
 7c5:	b8 15 00 00 00       	mov    $0x15,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <kill>:
SYSCALL(kill)
 7cd:	b8 06 00 00 00       	mov    $0x6,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <exec>:
SYSCALL(exec)
 7d5:	b8 07 00 00 00       	mov    $0x7,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <open>:
SYSCALL(open)
 7dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <mknod>:
SYSCALL(mknod)
 7e5:	b8 11 00 00 00       	mov    $0x11,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <unlink>:
SYSCALL(unlink)
 7ed:	b8 12 00 00 00       	mov    $0x12,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <fstat>:
SYSCALL(fstat)
 7f5:	b8 08 00 00 00       	mov    $0x8,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <link>:
SYSCALL(link)
 7fd:	b8 13 00 00 00       	mov    $0x13,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <mkdir>:
SYSCALL(mkdir)
 805:	b8 14 00 00 00       	mov    $0x14,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <chdir>:
SYSCALL(chdir)
 80d:	b8 09 00 00 00       	mov    $0x9,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <dup>:
SYSCALL(dup)
 815:	b8 0a 00 00 00       	mov    $0xa,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <getpid>:
SYSCALL(getpid)
 81d:	b8 0b 00 00 00       	mov    $0xb,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <sbrk>:
SYSCALL(sbrk)
 825:	b8 0c 00 00 00       	mov    $0xc,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <sleep>:
SYSCALL(sleep)
 82d:	b8 0d 00 00 00       	mov    $0xd,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <uptime>:
SYSCALL(uptime)
 835:	b8 0e 00 00 00       	mov    $0xe,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <ioctl>:
# iotcl
SYSCALL(ioctl)
 83d:	b8 16 00 00 00       	mov    $0x16,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <socket>:
# socket
SYSCALL(socket)
 845:	b8 17 00 00 00       	mov    $0x17,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <bind>:
SYSCALL(bind)
 84d:	b8 19 00 00 00       	mov    $0x19,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <listen>:
SYSCALL(listen)
 855:	b8 1a 00 00 00       	mov    $0x1a,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <accept>:
SYSCALL(accept)
 85d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <recv>:
SYSCALL(recv)
 865:	b8 1c 00 00 00       	mov    $0x1c,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <send>:
SYSCALL(send)
 86d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <recvfrom>:
SYSCALL(recvfrom)
 875:	b8 1e 00 00 00       	mov    $0x1e,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <sendto>:
SYSCALL(sendto)
 87d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    
 885:	66 90                	xchg   %ax,%ax
 887:	66 90                	xchg   %ax,%ax
 889:	66 90                	xchg   %ax,%ax
 88b:	66 90                	xchg   %ax,%ax
 88d:	66 90                	xchg   %ax,%ax
 88f:	90                   	nop

00000890 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	57                   	push   %edi
 894:	56                   	push   %esi
 895:	53                   	push   %ebx
 896:	83 ec 3c             	sub    $0x3c,%esp
 899:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 89c:	89 d1                	mov    %edx,%ecx
{
 89e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 8a1:	85 d2                	test   %edx,%edx
 8a3:	0f 89 7f 00 00 00    	jns    928 <printint+0x98>
 8a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8ad:	74 79                	je     928 <printint+0x98>
    neg = 1;
 8af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8b8:	31 db                	xor    %ebx,%ebx
 8ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8c0:	89 c8                	mov    %ecx,%eax
 8c2:	31 d2                	xor    %edx,%edx
 8c4:	89 cf                	mov    %ecx,%edi
 8c6:	f7 75 c4             	divl   -0x3c(%ebp)
 8c9:	0f b6 92 2c 0d 00 00 	movzbl 0xd2c(%edx),%edx
 8d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8d3:	89 d8                	mov    %ebx,%eax
 8d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8e1:	76 dd                	jbe    8c0 <printint+0x30>
  if(neg)
 8e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8e6:	85 c9                	test   %ecx,%ecx
 8e8:	74 0c                	je     8f6 <printint+0x66>
    buf[i++] = '-';
 8ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8fd:	eb 07                	jmp    906 <printint+0x76>
 8ff:	90                   	nop
 900:	0f b6 13             	movzbl (%ebx),%edx
 903:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 906:	83 ec 04             	sub    $0x4,%esp
 909:	88 55 d7             	mov    %dl,-0x29(%ebp)
 90c:	6a 01                	push   $0x1
 90e:	56                   	push   %esi
 90f:	57                   	push   %edi
 910:	e8 a8 fe ff ff       	call   7bd <write>
  while(--i >= 0)
 915:	83 c4 10             	add    $0x10,%esp
 918:	39 de                	cmp    %ebx,%esi
 91a:	75 e4                	jne    900 <printint+0x70>
    putc(fd, buf[i]);
}
 91c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91f:	5b                   	pop    %ebx
 920:	5e                   	pop    %esi
 921:	5f                   	pop    %edi
 922:	5d                   	pop    %ebp
 923:	c3                   	ret    
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 928:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 92f:	eb 87                	jmp    8b8 <printint+0x28>
 931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93f:	90                   	nop

00000940 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 940:	f3 0f 1e fb          	endbr32 
 944:	55                   	push   %ebp
 945:	89 e5                	mov    %esp,%ebp
 947:	57                   	push   %edi
 948:	56                   	push   %esi
 949:	53                   	push   %ebx
 94a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 94d:	8b 75 0c             	mov    0xc(%ebp),%esi
 950:	0f b6 1e             	movzbl (%esi),%ebx
 953:	84 db                	test   %bl,%bl
 955:	0f 84 b4 00 00 00    	je     a0f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 95b:	8d 45 10             	lea    0x10(%ebp),%eax
 95e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 961:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 964:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 966:	89 45 d0             	mov    %eax,-0x30(%ebp)
 969:	eb 33                	jmp    99e <printf+0x5e>
 96b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 96f:	90                   	nop
 970:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 973:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 978:	83 f8 25             	cmp    $0x25,%eax
 97b:	74 17                	je     994 <printf+0x54>
  write(fd, &c, 1);
 97d:	83 ec 04             	sub    $0x4,%esp
 980:	88 5d e7             	mov    %bl,-0x19(%ebp)
 983:	6a 01                	push   $0x1
 985:	57                   	push   %edi
 986:	ff 75 08             	pushl  0x8(%ebp)
 989:	e8 2f fe ff ff       	call   7bd <write>
 98e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 991:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 994:	0f b6 1e             	movzbl (%esi),%ebx
 997:	83 c6 01             	add    $0x1,%esi
 99a:	84 db                	test   %bl,%bl
 99c:	74 71                	je     a0f <printf+0xcf>
    c = fmt[i] & 0xff;
 99e:	0f be cb             	movsbl %bl,%ecx
 9a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9a4:	85 d2                	test   %edx,%edx
 9a6:	74 c8                	je     970 <printf+0x30>
      }
    } else if(state == '%'){
 9a8:	83 fa 25             	cmp    $0x25,%edx
 9ab:	75 e7                	jne    994 <printf+0x54>
      if(c == 'd'){
 9ad:	83 f8 64             	cmp    $0x64,%eax
 9b0:	0f 84 9a 00 00 00    	je     a50 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9bc:	83 f9 70             	cmp    $0x70,%ecx
 9bf:	74 5f                	je     a20 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9c1:	83 f8 73             	cmp    $0x73,%eax
 9c4:	0f 84 d6 00 00 00    	je     aa0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ca:	83 f8 63             	cmp    $0x63,%eax
 9cd:	0f 84 8d 00 00 00    	je     a60 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9d3:	83 f8 25             	cmp    $0x25,%eax
 9d6:	0f 84 b4 00 00 00    	je     a90 <printf+0x150>
  write(fd, &c, 1);
 9dc:	83 ec 04             	sub    $0x4,%esp
 9df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9e3:	6a 01                	push   $0x1
 9e5:	57                   	push   %edi
 9e6:	ff 75 08             	pushl  0x8(%ebp)
 9e9:	e8 cf fd ff ff       	call   7bd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9f1:	83 c4 0c             	add    $0xc,%esp
 9f4:	6a 01                	push   $0x1
 9f6:	83 c6 01             	add    $0x1,%esi
 9f9:	57                   	push   %edi
 9fa:	ff 75 08             	pushl  0x8(%ebp)
 9fd:	e8 bb fd ff ff       	call   7bd <write>
  for(i = 0; fmt[i]; i++){
 a02:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a06:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a09:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a0b:	84 db                	test   %bl,%bl
 a0d:	75 8f                	jne    99e <printf+0x5e>
    }
  }
}
 a0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a12:	5b                   	pop    %ebx
 a13:	5e                   	pop    %esi
 a14:	5f                   	pop    %edi
 a15:	5d                   	pop    %ebp
 a16:	c3                   	ret    
 a17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a20:	83 ec 0c             	sub    $0xc,%esp
 a23:	b9 10 00 00 00       	mov    $0x10,%ecx
 a28:	6a 00                	push   $0x0
 a2a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a2d:	8b 45 08             	mov    0x8(%ebp),%eax
 a30:	8b 13                	mov    (%ebx),%edx
 a32:	e8 59 fe ff ff       	call   890 <printint>
        ap++;
 a37:	89 d8                	mov    %ebx,%eax
 a39:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a3c:	31 d2                	xor    %edx,%edx
        ap++;
 a3e:	83 c0 04             	add    $0x4,%eax
 a41:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a44:	e9 4b ff ff ff       	jmp    994 <printf+0x54>
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a50:	83 ec 0c             	sub    $0xc,%esp
 a53:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a58:	6a 01                	push   $0x1
 a5a:	eb ce                	jmp    a2a <printf+0xea>
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a60:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a63:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a66:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a68:	6a 01                	push   $0x1
        ap++;
 a6a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a6d:	57                   	push   %edi
 a6e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a71:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a74:	e8 44 fd ff ff       	call   7bd <write>
        ap++;
 a79:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a7c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7f:	31 d2                	xor    %edx,%edx
 a81:	e9 0e ff ff ff       	jmp    994 <printf+0x54>
 a86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a90:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a93:	83 ec 04             	sub    $0x4,%esp
 a96:	e9 59 ff ff ff       	jmp    9f4 <printf+0xb4>
 a9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop
        s = (char*)*ap;
 aa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 aa3:	8b 18                	mov    (%eax),%ebx
        ap++;
 aa5:	83 c0 04             	add    $0x4,%eax
 aa8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 aab:	85 db                	test   %ebx,%ebx
 aad:	74 17                	je     ac6 <printf+0x186>
        while(*s != 0){
 aaf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 ab2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 ab4:	84 c0                	test   %al,%al
 ab6:	0f 84 d8 fe ff ff    	je     994 <printf+0x54>
 abc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 abf:	89 de                	mov    %ebx,%esi
 ac1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ac4:	eb 1a                	jmp    ae0 <printf+0x1a0>
          s = "(null)";
 ac6:	bb 24 0d 00 00       	mov    $0xd24,%ebx
        while(*s != 0){
 acb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 ace:	b8 28 00 00 00       	mov    $0x28,%eax
 ad3:	89 de                	mov    %ebx,%esi
 ad5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ad8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 adf:	90                   	nop
  write(fd, &c, 1);
 ae0:	83 ec 04             	sub    $0x4,%esp
          s++;
 ae3:	83 c6 01             	add    $0x1,%esi
 ae6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ae9:	6a 01                	push   $0x1
 aeb:	57                   	push   %edi
 aec:	53                   	push   %ebx
 aed:	e8 cb fc ff ff       	call   7bd <write>
        while(*s != 0){
 af2:	0f b6 06             	movzbl (%esi),%eax
 af5:	83 c4 10             	add    $0x10,%esp
 af8:	84 c0                	test   %al,%al
 afa:	75 e4                	jne    ae0 <printf+0x1a0>
 afc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 aff:	31 d2                	xor    %edx,%edx
 b01:	e9 8e fe ff ff       	jmp    994 <printf+0x54>
 b06:	66 90                	xchg   %ax,%ax
 b08:	66 90                	xchg   %ax,%ax
 b0a:	66 90                	xchg   %ax,%ax
 b0c:	66 90                	xchg   %ax,%ax
 b0e:	66 90                	xchg   %ax,%ax

00000b10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b10:	f3 0f 1e fb          	endbr32 
 b14:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b15:	a1 24 11 00 00       	mov    0x1124,%eax
{
 b1a:	89 e5                	mov    %esp,%ebp
 b1c:	57                   	push   %edi
 b1d:	56                   	push   %esi
 b1e:	53                   	push   %ebx
 b1f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b22:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b24:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b27:	39 c8                	cmp    %ecx,%eax
 b29:	73 15                	jae    b40 <free+0x30>
 b2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b2f:	90                   	nop
 b30:	39 d1                	cmp    %edx,%ecx
 b32:	72 14                	jb     b48 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b34:	39 d0                	cmp    %edx,%eax
 b36:	73 10                	jae    b48 <free+0x38>
{
 b38:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b3a:	8b 10                	mov    (%eax),%edx
 b3c:	39 c8                	cmp    %ecx,%eax
 b3e:	72 f0                	jb     b30 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b40:	39 d0                	cmp    %edx,%eax
 b42:	72 f4                	jb     b38 <free+0x28>
 b44:	39 d1                	cmp    %edx,%ecx
 b46:	73 f0                	jae    b38 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b4e:	39 fa                	cmp    %edi,%edx
 b50:	74 1e                	je     b70 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b52:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b55:	8b 50 04             	mov    0x4(%eax),%edx
 b58:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b5b:	39 f1                	cmp    %esi,%ecx
 b5d:	74 28                	je     b87 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b5f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b61:	5b                   	pop    %ebx
  freep = p;
 b62:	a3 24 11 00 00       	mov    %eax,0x1124
}
 b67:	5e                   	pop    %esi
 b68:	5f                   	pop    %edi
 b69:	5d                   	pop    %ebp
 b6a:	c3                   	ret    
 b6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b6f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b70:	03 72 04             	add    0x4(%edx),%esi
 b73:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b76:	8b 10                	mov    (%eax),%edx
 b78:	8b 12                	mov    (%edx),%edx
 b7a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b7d:	8b 50 04             	mov    0x4(%eax),%edx
 b80:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b83:	39 f1                	cmp    %esi,%ecx
 b85:	75 d8                	jne    b5f <free+0x4f>
    p->s.size += bp->s.size;
 b87:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b8a:	a3 24 11 00 00       	mov    %eax,0x1124
    p->s.size += bp->s.size;
 b8f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b92:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b95:	89 10                	mov    %edx,(%eax)
}
 b97:	5b                   	pop    %ebx
 b98:	5e                   	pop    %esi
 b99:	5f                   	pop    %edi
 b9a:	5d                   	pop    %ebp
 b9b:	c3                   	ret    
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ba0:	f3 0f 1e fb          	endbr32 
 ba4:	55                   	push   %ebp
 ba5:	89 e5                	mov    %esp,%ebp
 ba7:	57                   	push   %edi
 ba8:	56                   	push   %esi
 ba9:	53                   	push   %ebx
 baa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bb0:	8b 3d 24 11 00 00    	mov    0x1124,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb6:	8d 70 07             	lea    0x7(%eax),%esi
 bb9:	c1 ee 03             	shr    $0x3,%esi
 bbc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 bbf:	85 ff                	test   %edi,%edi
 bc1:	0f 84 a9 00 00 00    	je     c70 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bc7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 bc9:	8b 48 04             	mov    0x4(%eax),%ecx
 bcc:	39 f1                	cmp    %esi,%ecx
 bce:	73 6d                	jae    c3d <malloc+0x9d>
 bd0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 bd6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 bdb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 bde:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 be5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 be8:	eb 17                	jmp    c01 <malloc+0x61>
 bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bf0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 bf2:	8b 4a 04             	mov    0x4(%edx),%ecx
 bf5:	39 f1                	cmp    %esi,%ecx
 bf7:	73 4f                	jae    c48 <malloc+0xa8>
 bf9:	8b 3d 24 11 00 00    	mov    0x1124,%edi
 bff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c01:	39 c7                	cmp    %eax,%edi
 c03:	75 eb                	jne    bf0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c05:	83 ec 0c             	sub    $0xc,%esp
 c08:	ff 75 e4             	pushl  -0x1c(%ebp)
 c0b:	e8 15 fc ff ff       	call   825 <sbrk>
  if(p == (char*)-1)
 c10:	83 c4 10             	add    $0x10,%esp
 c13:	83 f8 ff             	cmp    $0xffffffff,%eax
 c16:	74 1b                	je     c33 <malloc+0x93>
  hp->s.size = nu;
 c18:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c1b:	83 ec 0c             	sub    $0xc,%esp
 c1e:	83 c0 08             	add    $0x8,%eax
 c21:	50                   	push   %eax
 c22:	e8 e9 fe ff ff       	call   b10 <free>
  return freep;
 c27:	a1 24 11 00 00       	mov    0x1124,%eax
      if((p = morecore(nunits)) == 0)
 c2c:	83 c4 10             	add    $0x10,%esp
 c2f:	85 c0                	test   %eax,%eax
 c31:	75 bd                	jne    bf0 <malloc+0x50>
        return 0;
  }
}
 c33:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c36:	31 c0                	xor    %eax,%eax
}
 c38:	5b                   	pop    %ebx
 c39:	5e                   	pop    %esi
 c3a:	5f                   	pop    %edi
 c3b:	5d                   	pop    %ebp
 c3c:	c3                   	ret    
    if(p->s.size >= nunits){
 c3d:	89 c2                	mov    %eax,%edx
 c3f:	89 f8                	mov    %edi,%eax
 c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c48:	39 ce                	cmp    %ecx,%esi
 c4a:	74 54                	je     ca0 <malloc+0x100>
        p->s.size -= nunits;
 c4c:	29 f1                	sub    %esi,%ecx
 c4e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c51:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c54:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c57:	a3 24 11 00 00       	mov    %eax,0x1124
}
 c5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c5f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c62:	5b                   	pop    %ebx
 c63:	5e                   	pop    %esi
 c64:	5f                   	pop    %edi
 c65:	5d                   	pop    %ebp
 c66:	c3                   	ret    
 c67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c6e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c70:	c7 05 24 11 00 00 28 	movl   $0x1128,0x1124
 c77:	11 00 00 
    base.s.size = 0;
 c7a:	bf 28 11 00 00       	mov    $0x1128,%edi
    base.s.ptr = freep = prevp = &base;
 c7f:	c7 05 28 11 00 00 28 	movl   $0x1128,0x1128
 c86:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c89:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c8b:	c7 05 2c 11 00 00 00 	movl   $0x0,0x112c
 c92:	00 00 00 
    if(p->s.size >= nunits){
 c95:	e9 36 ff ff ff       	jmp    bd0 <malloc+0x30>
 c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ca0:	8b 0a                	mov    (%edx),%ecx
 ca2:	89 08                	mov    %ecx,(%eax)
 ca4:	eb b1                	jmp    c57 <malloc+0xb7>
