
build/bin/_echo：     文件格式 elf32-i386


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
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  for(i = 1; i < argc; i++)
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 4b                	jle    6c <main+0x6c>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  27:	83 c3 04             	add    $0x4,%ebx
  2a:	8b 43 fc             	mov    -0x4(%ebx),%eax
  2d:	39 f3                	cmp    %esi,%ebx
  2f:	74 26                	je     57 <main+0x57>
  31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  38:	68 1d 0d 00 00       	push   $0xd1d
  3d:	83 c3 04             	add    $0x4,%ebx
  40:	50                   	push   %eax
  41:	68 b8 0c 00 00       	push   $0xcb8
  46:	6a 01                	push   $0x1
  48:	e8 03 09 00 00       	call   950 <printf>
  for(i = 1; i < argc; i++)
  4d:	8b 43 fc             	mov    -0x4(%ebx),%eax
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  50:	83 c4 10             	add    $0x10,%esp
  53:	39 f3                	cmp    %esi,%ebx
  55:	75 e1                	jne    38 <main+0x38>
  57:	68 26 0d 00 00       	push   $0xd26
  5c:	50                   	push   %eax
  5d:	68 b8 0c 00 00       	push   $0xcb8
  62:	6a 01                	push   $0x1
  64:	e8 e7 08 00 00       	call   950 <printf>
  69:	83 c4 10             	add    $0x10,%esp
  exit();
  6c:	e8 3c 07 00 00       	call   7ad <exit>
  71:	66 90                	xchg   %ax,%ax
  73:	66 90                	xchg   %ax,%ax
  75:	66 90                	xchg   %ax,%ax
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	f3 0f 1e fb          	endbr32 
  84:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  85:	31 c0                	xor    %eax,%eax
{
  87:	89 e5                	mov    %esp,%ebp
  89:	53                   	push   %ebx
  8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	89 c8                	mov    %ecx,%eax
  a0:	5b                   	pop    %ebx
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    
  a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000b0 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	57                   	push   %edi
  b8:	8b 7d 10             	mov    0x10(%ebp),%edi
  bb:	56                   	push   %esi
  bc:	8b 75 08             	mov    0x8(%ebp),%esi
  bf:	53                   	push   %ebx
  c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
  c3:	85 ff                	test   %edi,%edi
  c5:	74 39                	je     100 <strcat_s+0x50>
  c7:	31 c0                	xor    %eax,%eax
  c9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  ce:	eb 11                	jmp    e1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
  d0:	0f b6 12             	movzbl (%edx),%edx
  d3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  d6:	84 d2                	test   %dl,%dl
  d8:	74 26                	je     100 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
  da:	83 c0 01             	add    $0x1,%eax
  dd:	39 c7                	cmp    %eax,%edi
  df:	74 1f                	je     100 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
  e1:	89 c2                	mov    %eax,%edx
  e3:	29 ca                	sub    %ecx,%edx
  e5:	01 da                	add    %ebx,%edx
  e7:	83 f9 ff             	cmp    $0xffffffff,%ecx
  ea:	75 e4                	jne    d0 <strcat_s+0x20>
  ec:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
  f0:	75 e8                	jne    da <strcat_s+0x2a>
  f2:	89 da                	mov    %ebx,%edx
  f4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
  f6:	0f b6 12             	movzbl (%edx),%edx
  f9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  fc:	84 d2                	test   %dl,%dl
  fe:	75 da                	jne    da <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 100:	5b                   	pop    %ebx
 101:	89 f0                	mov    %esi,%eax
 103:	5e                   	pop    %esi
 104:	5f                   	pop    %edi
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	53                   	push   %ebx
 118:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 11e:	0f b6 01             	movzbl (%ecx),%eax
 121:	0f b6 1a             	movzbl (%edx),%ebx
 124:	84 c0                	test   %al,%al
 126:	75 19                	jne    141 <strcmp+0x31>
 128:	eb 26                	jmp    150 <strcmp+0x40>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 134:	83 c1 01             	add    $0x1,%ecx
 137:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 13a:	0f b6 1a             	movzbl (%edx),%ebx
 13d:	84 c0                	test   %al,%al
 13f:	74 0f                	je     150 <strcmp+0x40>
 141:	38 d8                	cmp    %bl,%al
 143:	74 eb                	je     130 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 145:	29 d8                	sub    %ebx,%eax
}
 147:	5b                   	pop    %ebx
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 152:	29 d8                	sub    %ebx,%eax
}
 154:	5b                   	pop    %ebx
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax

00000160 <strlen>:

uint
strlen(const char *s)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 16a:	80 3a 00             	cmpb   $0x0,(%edx)
 16d:	74 21                	je     190 <strlen+0x30>
 16f:	31 c0                	xor    %eax,%eax
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 178:	83 c0 01             	add    $0x1,%eax
 17b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 17f:	89 c1                	mov    %eax,%ecx
 181:	75 f5                	jne    178 <strlen+0x18>
    ;
  return n;
}
 183:	89 c8                	mov    %ecx,%eax
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b1:	89 d7                	mov    %edx,%edi
 1b3:	fc                   	cld    
 1b4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b6:	89 d0                	mov    %edx,%eax
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ce:	0f b6 10             	movzbl (%eax),%edx
 1d1:	84 d2                	test   %dl,%dl
 1d3:	75 16                	jne    1eb <strchr+0x2b>
 1d5:	eb 21                	jmp    1f8 <strchr+0x38>
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax
 1e0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	84 d2                	test   %dl,%dl
 1e9:	74 0d                	je     1f8 <strchr+0x38>
    if(*s == c)
 1eb:	38 d1                	cmp    %dl,%cl
 1ed:	75 f1                	jne    1e0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f8:	31 c0                	xor    %eax,%eax
}
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 209:	31 f6                	xor    %esi,%esi
{
 20b:	53                   	push   %ebx
 20c:	89 f3                	mov    %esi,%ebx
 20e:	83 ec 1c             	sub    $0x1c,%esp
 211:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 214:	eb 33                	jmp    249 <gets+0x49>
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	8d 45 e7             	lea    -0x19(%ebp),%eax
 226:	6a 01                	push   $0x1
 228:	50                   	push   %eax
 229:	6a 00                	push   $0x0
 22b:	e8 95 05 00 00       	call   7c5 <read>
    if(cc < 1)
 230:	83 c4 10             	add    $0x10,%esp
 233:	85 c0                	test   %eax,%eax
 235:	7e 1c                	jle    253 <gets+0x53>
      break;
    buf[i++] = c;
 237:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 23b:	83 c7 01             	add    $0x1,%edi
 23e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 241:	3c 0a                	cmp    $0xa,%al
 243:	74 23                	je     268 <gets+0x68>
 245:	3c 0d                	cmp    $0xd,%al
 247:	74 1f                	je     268 <gets+0x68>
  for(i=0; i+1 < max; ){
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	89 fe                	mov    %edi,%esi
 24e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 251:	7c cd                	jl     220 <gets+0x20>
 253:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 255:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 258:	c6 03 00             	movb   $0x0,(%ebx)
}
 25b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25e:	5b                   	pop    %ebx
 25f:	5e                   	pop    %esi
 260:	5f                   	pop    %edi
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 267:	90                   	nop
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	01 de                	add    %ebx,%esi
 270:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 272:	c6 03 00             	movb   $0x0,(%ebx)
}
 275:	8d 65 f4             	lea    -0xc(%ebp),%esp
 278:	5b                   	pop    %ebx
 279:	5e                   	pop    %esi
 27a:	5f                   	pop    %edi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	6a 00                	push   $0x0
 28e:	ff 75 08             	pushl  0x8(%ebp)
 291:	e8 57 05 00 00       	call   7ed <open>
  if(fd < 0)
 296:	83 c4 10             	add    $0x10,%esp
 299:	85 c0                	test   %eax,%eax
 29b:	78 2b                	js     2c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 29d:	83 ec 08             	sub    $0x8,%esp
 2a0:	ff 75 0c             	pushl  0xc(%ebp)
 2a3:	89 c3                	mov    %eax,%ebx
 2a5:	50                   	push   %eax
 2a6:	e8 5a 05 00 00       	call   805 <fstat>
  close(fd);
 2ab:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ae:	89 c6                	mov    %eax,%esi
  close(fd);
 2b0:	e8 20 05 00 00       	call   7d5 <close>
  return r;
 2b5:	83 c4 10             	add    $0x10,%esp
}
 2b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2cd:	eb e9                	jmp    2b8 <stat+0x38>
 2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2db:	0f be 02             	movsbl (%edx),%eax
 2de:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2e1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e9:	77 1a                	ja     305 <atoi+0x35>
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	89 c8                	mov    %ecx,%eax
 307:	5b                   	pop    %ebx
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	57                   	push   %edi
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	8b 55 08             	mov    0x8(%ebp),%edx
 31e:	56                   	push   %esi
 31f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 322:	85 c0                	test   %eax,%eax
 324:	7e 0f                	jle    335 <memmove+0x25>
 326:	01 d0                	add    %edx,%eax
  dst = vdst;
 328:	89 d7                	mov    %edx,%edi
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	56                   	push   %esi
 349:	53                   	push   %ebx
 34a:	83 ec 34             	sub    $0x34,%esp
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 350:	68 c0 0c 00 00       	push   $0xcc0
hexdump (void *data, size_t size) {
 355:	89 45 e0             	mov    %eax,-0x20(%ebp)
 358:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 35b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 35d:	89 c7                	mov    %eax,%edi
 35f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 362:	e8 e9 05 00 00       	call   950 <printf>
  for (offset = 0; offset < size; offset += 16) {
 367:	83 c4 10             	add    $0x10,%esp
 36a:	85 ff                	test   %edi,%edi
 36c:	0f 84 2d 01 00 00    	je     49f <hexdump+0x15f>
 372:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 375:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 37c:	be 10 00 00 00       	mov    $0x10,%esi
 381:	83 e8 01             	sub    $0x1,%eax
 384:	83 e0 f0             	and    $0xfffffff0,%eax
 387:	83 c0 10             	add    $0x10,%eax
 38a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 390:	83 ec 08             	sub    $0x8,%esp
 393:	68 14 0d 00 00       	push   $0xd14
 398:	6a 01                	push   $0x1
 39a:	e8 b1 05 00 00       	call   950 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 39f:	83 c4 10             	add    $0x10,%esp
 3a2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 3a9:	0f 8e 51 01 00 00    	jle    500 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 3af:	8b 7d dc             	mov    -0x24(%ebp),%edi
 3b2:	83 ec 04             	sub    $0x4,%esp
 3b5:	57                   	push   %edi
 3b6:	89 fb                	mov    %edi,%ebx
 3b8:	68 11 0d 00 00       	push   $0xd11
 3bd:	6a 01                	push   $0x1
 3bf:	e8 8c 05 00 00       	call   950 <printf>
 3c4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 3c7:	83 c4 10             	add    $0x10,%esp
 3ca:	8b 7d e0             	mov    -0x20(%ebp),%edi
 3cd:	eb 28                	jmp    3f7 <hexdump+0xb7>
 3cf:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 3d0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 3d4:	80 fa 0f             	cmp    $0xf,%dl
 3d7:	0f 86 e3 00 00 00    	jbe    4c0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 3dd:	83 ec 04             	sub    $0x4,%esp
 3e0:	83 c3 01             	add    $0x1,%ebx
 3e3:	52                   	push   %edx
 3e4:	68 17 0d 00 00       	push   $0xd17
 3e9:	6a 01                	push   $0x1
 3eb:	e8 60 05 00 00       	call   950 <printf>
 3f0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3f3:	39 f3                	cmp    %esi,%ebx
 3f5:	74 1e                	je     415 <hexdump+0xd5>
      if(offset + index < (int)size) {
 3f7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 3fa:	7f d4                	jg     3d0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 3fc:	83 ec 08             	sub    $0x8,%esp
 3ff:	83 c3 01             	add    $0x1,%ebx
 402:	68 1b 0d 00 00       	push   $0xd1b
 407:	6a 01                	push   $0x1
 409:	e8 42 05 00 00       	call   950 <printf>
 40e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 411:	39 f3                	cmp    %esi,%ebx
 413:	75 e2                	jne    3f7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 415:	83 ec 08             	sub    $0x8,%esp
 418:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 41b:	68 14 0d 00 00       	push   $0xd14
 420:	6a 01                	push   $0x1
 422:	e8 29 05 00 00       	call   950 <printf>
 427:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	eb 1b                	jmp    44a <hexdump+0x10a>
 42f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 430:	83 ec 04             	sub    $0x4,%esp
 433:	52                   	push   %edx
 434:	68 1f 0d 00 00       	push   $0xd1f
 439:	6a 01                	push   $0x1
 43b:	e8 10 05 00 00       	call   950 <printf>
 440:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 443:	83 c3 01             	add    $0x1,%ebx
 446:	39 de                	cmp    %ebx,%esi
 448:	74 30                	je     47a <hexdump+0x13a>
      if(offset + index < (int)size) {
 44a:	39 df                	cmp    %ebx,%edi
 44c:	0f 8e 8e 00 00 00    	jle    4e0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 452:	8b 45 e0             	mov    -0x20(%ebp),%eax
 455:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 459:	8d 4a e0             	lea    -0x20(%edx),%ecx
 45c:	80 f9 5e             	cmp    $0x5e,%cl
 45f:	76 cf                	jbe    430 <hexdump+0xf0>
        } else {
          printf(1, ".");
 461:	83 ec 08             	sub    $0x8,%esp
 464:	83 c3 01             	add    $0x1,%ebx
 467:	68 22 0d 00 00       	push   $0xd22
 46c:	6a 01                	push   $0x1
 46e:	e8 dd 04 00 00       	call   950 <printf>
 473:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 476:	39 de                	cmp    %ebx,%esi
 478:	75 d0                	jne    44a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 47a:	83 ec 08             	sub    $0x8,%esp
 47d:	83 c6 10             	add    $0x10,%esi
 480:	68 24 0d 00 00       	push   $0xd24
 485:	6a 01                	push   $0x1
 487:	e8 c4 04 00 00       	call   950 <printf>
  for (offset = 0; offset < size; offset += 16) {
 48c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 490:	83 c4 10             	add    $0x10,%esp
 493:	8b 45 dc             	mov    -0x24(%ebp),%eax
 496:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 499:	0f 85 f1 fe ff ff    	jne    390 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 49f:	c7 45 0c c0 0c 00 00 	movl   $0xcc0,0xc(%ebp)
 4a6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4b4:	e9 97 04 00 00       	jmp    950 <printf>
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4c0:	83 ec 08             	sub    $0x8,%esp
 4c3:	68 0f 0d 00 00       	push   $0xd0f
 4c8:	6a 01                	push   $0x1
 4ca:	e8 81 04 00 00       	call   950 <printf>
 4cf:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4d3:	83 c4 10             	add    $0x10,%esp
 4d6:	e9 02 ff ff ff       	jmp    3dd <hexdump+0x9d>
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
        printf(1, " ");
 4e0:	83 ec 08             	sub    $0x8,%esp
 4e3:	68 1d 0d 00 00       	push   $0xd1d
 4e8:	6a 01                	push   $0x1
 4ea:	e8 61 04 00 00       	call   950 <printf>
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	e9 4c ff ff ff       	jmp    443 <hexdump+0x103>
 4f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fe:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 500:	83 ec 08             	sub    $0x8,%esp
 503:	68 0f 0d 00 00       	push   $0xd0f
 508:	6a 01                	push   $0x1
 50a:	e8 41 04 00 00       	call   950 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 50f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 512:	83 c4 10             	add    $0x10,%esp
 515:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 51b:	0f 8f 8e fe ff ff    	jg     3af <hexdump+0x6f>
 521:	83 ec 08             	sub    $0x8,%esp
 524:	68 0f 0d 00 00       	push   $0xd0f
 529:	6a 01                	push   $0x1
 52b:	e8 20 04 00 00       	call   950 <printf>
    if (offset <= 0x000f) printf(1, "0");
 530:	83 c4 10             	add    $0x10,%esp
 533:	83 ff 0f             	cmp    $0xf,%edi
 536:	0f 8f 73 fe ff ff    	jg     3af <hexdump+0x6f>
 53c:	83 ec 08             	sub    $0x8,%esp
 53f:	68 0f 0d 00 00       	push   $0xd0f
 544:	6a 01                	push   $0x1
 546:	e8 05 04 00 00       	call   950 <printf>
 54b:	83 c4 10             	add    $0x10,%esp
 54e:	e9 5c fe ff ff       	jmp    3af <hexdump+0x6f>
 553:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000560 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 560:	f3 0f 1e fb          	endbr32 
 564:	55                   	push   %ebp
    if (!endian)
 565:	a1 24 11 00 00       	mov    0x1124,%eax
{
 56a:	89 e5                	mov    %esp,%ebp
 56c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 56f:	85 c0                	test   %eax,%eax
 571:	75 1d                	jne    590 <hton16+0x30>
        endian = byteorder();
 573:	c7 05 24 11 00 00 d2 	movl   $0x4d2,0x1124
 57a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 57d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 57f:	5d                   	pop    %ebp
 580:	66 c1 c2 08          	rol    $0x8,%dx
 584:	89 d0                	mov    %edx,%eax
 586:	c3                   	ret    
 587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58e:	66 90                	xchg   %ax,%ax
 590:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 592:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 597:	74 e4                	je     57d <hton16+0x1d>
}
 599:	89 d0                	mov    %edx,%eax
 59b:	5d                   	pop    %ebp
 59c:	c3                   	ret    
 59d:	8d 76 00             	lea    0x0(%esi),%esi

000005a0 <ntoh16>:
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	eb ba                	jmp    560 <hton16>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi

000005b0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
    if (!endian)
 5b5:	8b 15 24 11 00 00    	mov    0x1124,%edx
{
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 5c0:	85 d2                	test   %edx,%edx
 5c2:	75 14                	jne    5d8 <hton32+0x28>
        endian = byteorder();
 5c4:	c7 05 24 11 00 00 d2 	movl   $0x4d2,0x1124
 5cb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 5ce:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 5d8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 5de:	74 ee                	je     5ce <hton32+0x1e>
}
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret    
 5e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005f0 <ntoh32>:
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	eb ba                	jmp    5b0 <hton32>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi

00000600 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	8b 4d 08             	mov    0x8(%ebp),%ecx
 60b:	56                   	push   %esi
 60c:	53                   	push   %ebx
 60d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 610:	0f b6 01             	movzbl (%ecx),%eax
 613:	3c 09                	cmp    $0x9,%al
 615:	74 09                	je     620 <strtol+0x20>
 617:	3c 20                	cmp    $0x20,%al
 619:	75 14                	jne    62f <strtol+0x2f>
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
 620:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 624:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 627:	3c 20                	cmp    $0x20,%al
 629:	74 f5                	je     620 <strtol+0x20>
 62b:	3c 09                	cmp    $0x9,%al
 62d:	74 f1                	je     620 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 62f:	3c 2b                	cmp    $0x2b,%al
 631:	0f 84 a9 00 00 00    	je     6e0 <strtol+0xe0>
    int neg = 0;
 637:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 639:	3c 2d                	cmp    $0x2d,%al
 63b:	0f 84 8f 00 00 00    	je     6d0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 641:	0f be 11             	movsbl (%ecx),%edx
 644:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 64a:	75 12                	jne    65e <strtol+0x5e>
 64c:	80 fa 30             	cmp    $0x30,%dl
 64f:	0f 84 9b 00 00 00    	je     6f0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 655:	85 db                	test   %ebx,%ebx
 657:	75 05                	jne    65e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 659:	bb 0a 00 00 00       	mov    $0xa,%ebx
 65e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 661:	31 c0                	xor    %eax,%eax
 663:	eb 17                	jmp    67c <strtol+0x7c>
 665:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 668:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 66b:	3b 55 10             	cmp    0x10(%ebp),%edx
 66e:	7d 28                	jge    698 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 670:	0f af 45 10          	imul   0x10(%ebp),%eax
 674:	83 c1 01             	add    $0x1,%ecx
 677:	01 d0                	add    %edx,%eax
    while (1) {
 679:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 67c:	8d 72 d0             	lea    -0x30(%edx),%esi
 67f:	89 f3                	mov    %esi,%ebx
 681:	80 fb 09             	cmp    $0x9,%bl
 684:	76 e2                	jbe    668 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 686:	8d 72 9f             	lea    -0x61(%edx),%esi
 689:	89 f3                	mov    %esi,%ebx
 68b:	80 fb 19             	cmp    $0x19,%bl
 68e:	77 28                	ja     6b8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 690:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 693:	3b 55 10             	cmp    0x10(%ebp),%edx
 696:	7c d8                	jl     670 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 698:	8b 55 0c             	mov    0xc(%ebp),%edx
 69b:	85 d2                	test   %edx,%edx
 69d:	74 05                	je     6a4 <strtol+0xa4>
        *endptr = (char *) s;
 69f:	8b 75 0c             	mov    0xc(%ebp),%esi
 6a2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 6a4:	89 c2                	mov    %eax,%edx
}
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
    return (neg ? -val : val);
 6a8:	f7 da                	neg    %edx
 6aa:	85 ff                	test   %edi,%edi
}
 6ac:	5f                   	pop    %edi
 6ad:	5d                   	pop    %ebp
    return (neg ? -val : val);
 6ae:	0f 45 c2             	cmovne %edx,%eax
}
 6b1:	c3                   	ret    
 6b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 6b8:	8d 72 bf             	lea    -0x41(%edx),%esi
 6bb:	89 f3                	mov    %esi,%ebx
 6bd:	80 fb 19             	cmp    $0x19,%bl
 6c0:	77 d6                	ja     698 <strtol+0x98>
            dig = *s - 'A' + 10;
 6c2:	83 ea 37             	sub    $0x37,%edx
 6c5:	eb a4                	jmp    66b <strtol+0x6b>
 6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ce:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 6d0:	83 c1 01             	add    $0x1,%ecx
 6d3:	bf 01 00 00 00       	mov    $0x1,%edi
 6d8:	e9 64 ff ff ff       	jmp    641 <strtol+0x41>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 6e0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 6e3:	31 ff                	xor    %edi,%edi
 6e5:	e9 57 ff ff ff       	jmp    641 <strtol+0x41>
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 6f4:	3c 78                	cmp    $0x78,%al
 6f6:	74 18                	je     710 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 6f8:	85 db                	test   %ebx,%ebx
 6fa:	0f 85 5e ff ff ff    	jne    65e <strtol+0x5e>
        s++, base = 8;
 700:	83 c1 01             	add    $0x1,%ecx
 703:	0f be d0             	movsbl %al,%edx
 706:	bb 08 00 00 00       	mov    $0x8,%ebx
 70b:	e9 4e ff ff ff       	jmp    65e <strtol+0x5e>
        s += 2, base = 16;
 710:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 714:	bb 10 00 00 00       	mov    $0x10,%ebx
 719:	83 c1 02             	add    $0x2,%ecx
 71c:	e9 3d ff ff ff       	jmp    65e <strtol+0x5e>
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop

00000730 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 730:	f3 0f 1e fb          	endbr32 
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 738:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 73a:	56                   	push   %esi
 73b:	53                   	push   %ebx
 73c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 73f:	83 ec 1c             	sub    $0x1c,%esp
 742:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 745:	83 ec 04             	sub    $0x4,%esp
 748:	6a 0a                	push   $0xa
 74a:	53                   	push   %ebx
 74b:	56                   	push   %esi
 74c:	e8 af fe ff ff       	call   600 <strtol>
        if (ret < 0 || ret > 255) {
 751:	83 c4 10             	add    $0x10,%esp
 754:	3d ff 00 00 00       	cmp    $0xff,%eax
 759:	77 3d                	ja     798 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 75b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 75e:	39 f1                	cmp    %esi,%ecx
 760:	74 36                	je     798 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 762:	0f b6 11             	movzbl (%ecx),%edx
 765:	83 ff 03             	cmp    $0x3,%edi
 768:	74 16                	je     780 <ip_addr_pton+0x50>
 76a:	80 fa 2e             	cmp    $0x2e,%dl
 76d:	75 29                	jne    798 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 76f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 772:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 775:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 778:	83 c7 01             	add    $0x1,%edi
 77b:	eb c8                	jmp    745 <ip_addr_pton+0x15>
 77d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 780:	84 d2                	test   %dl,%dl
 782:	75 14                	jne    798 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 784:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 787:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 78a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 78d:	31 c0                	xor    %eax,%eax
}
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 79b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 7a0:	5b                   	pop    %ebx
 7a1:	5e                   	pop    %esi
 7a2:	5f                   	pop    %edi
 7a3:	5d                   	pop    %ebp
 7a4:	c3                   	ret    

000007a5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7a5:	b8 01 00 00 00       	mov    $0x1,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <exit>:
SYSCALL(exit)
 7ad:	b8 02 00 00 00       	mov    $0x2,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <wait>:
SYSCALL(wait)
 7b5:	b8 03 00 00 00       	mov    $0x3,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <pipe>:
SYSCALL(pipe)
 7bd:	b8 04 00 00 00       	mov    $0x4,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <read>:
SYSCALL(read)
 7c5:	b8 05 00 00 00       	mov    $0x5,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <write>:
SYSCALL(write)
 7cd:	b8 10 00 00 00       	mov    $0x10,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <close>:
SYSCALL(close)
 7d5:	b8 15 00 00 00       	mov    $0x15,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <kill>:
SYSCALL(kill)
 7dd:	b8 06 00 00 00       	mov    $0x6,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <exec>:
SYSCALL(exec)
 7e5:	b8 07 00 00 00       	mov    $0x7,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <open>:
SYSCALL(open)
 7ed:	b8 0f 00 00 00       	mov    $0xf,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <mknod>:
SYSCALL(mknod)
 7f5:	b8 11 00 00 00       	mov    $0x11,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <unlink>:
SYSCALL(unlink)
 7fd:	b8 12 00 00 00       	mov    $0x12,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <fstat>:
SYSCALL(fstat)
 805:	b8 08 00 00 00       	mov    $0x8,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <link>:
SYSCALL(link)
 80d:	b8 13 00 00 00       	mov    $0x13,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <mkdir>:
SYSCALL(mkdir)
 815:	b8 14 00 00 00       	mov    $0x14,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <chdir>:
SYSCALL(chdir)
 81d:	b8 09 00 00 00       	mov    $0x9,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <dup>:
SYSCALL(dup)
 825:	b8 0a 00 00 00       	mov    $0xa,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <getpid>:
SYSCALL(getpid)
 82d:	b8 0b 00 00 00       	mov    $0xb,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <sbrk>:
SYSCALL(sbrk)
 835:	b8 0c 00 00 00       	mov    $0xc,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <sleep>:
SYSCALL(sleep)
 83d:	b8 0d 00 00 00       	mov    $0xd,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <uptime>:
SYSCALL(uptime)
 845:	b8 0e 00 00 00       	mov    $0xe,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <ioctl>:
# iotcl
SYSCALL(ioctl)
 84d:	b8 16 00 00 00       	mov    $0x16,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <socket>:
# socket
SYSCALL(socket)
 855:	b8 17 00 00 00       	mov    $0x17,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <bind>:
SYSCALL(bind)
 85d:	b8 19 00 00 00       	mov    $0x19,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <listen>:
SYSCALL(listen)
 865:	b8 1a 00 00 00       	mov    $0x1a,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <accept>:
SYSCALL(accept)
 86d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <recv>:
SYSCALL(recv)
 875:	b8 1c 00 00 00       	mov    $0x1c,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <send>:
SYSCALL(send)
 87d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <recvfrom>:
SYSCALL(recvfrom)
 885:	b8 1e 00 00 00       	mov    $0x1e,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <sendto>:
SYSCALL(sendto)
 88d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    
 895:	66 90                	xchg   %ax,%ax
 897:	66 90                	xchg   %ax,%ax
 899:	66 90                	xchg   %ax,%ax
 89b:	66 90                	xchg   %ax,%ax
 89d:	66 90                	xchg   %ax,%ax
 89f:	90                   	nop

000008a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 3c             	sub    $0x3c,%esp
 8a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8ac:	89 d1                	mov    %edx,%ecx
{
 8ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 8b1:	85 d2                	test   %edx,%edx
 8b3:	0f 89 7f 00 00 00    	jns    938 <printint+0x98>
 8b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8bd:	74 79                	je     938 <printint+0x98>
    neg = 1;
 8bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8c8:	31 db                	xor    %ebx,%ebx
 8ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8d0:	89 c8                	mov    %ecx,%eax
 8d2:	31 d2                	xor    %edx,%edx
 8d4:	89 cf                	mov    %ecx,%edi
 8d6:	f7 75 c4             	divl   -0x3c(%ebp)
 8d9:	0f b6 92 30 0d 00 00 	movzbl 0xd30(%edx),%edx
 8e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8e3:	89 d8                	mov    %ebx,%eax
 8e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8f1:	76 dd                	jbe    8d0 <printint+0x30>
  if(neg)
 8f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8f6:	85 c9                	test   %ecx,%ecx
 8f8:	74 0c                	je     906 <printint+0x66>
    buf[i++] = '-';
 8fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 901:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 906:	8b 7d b8             	mov    -0x48(%ebp),%edi
 909:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 90d:	eb 07                	jmp    916 <printint+0x76>
 90f:	90                   	nop
 910:	0f b6 13             	movzbl (%ebx),%edx
 913:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 916:	83 ec 04             	sub    $0x4,%esp
 919:	88 55 d7             	mov    %dl,-0x29(%ebp)
 91c:	6a 01                	push   $0x1
 91e:	56                   	push   %esi
 91f:	57                   	push   %edi
 920:	e8 a8 fe ff ff       	call   7cd <write>
  while(--i >= 0)
 925:	83 c4 10             	add    $0x10,%esp
 928:	39 de                	cmp    %ebx,%esi
 92a:	75 e4                	jne    910 <printint+0x70>
    putc(fd, buf[i]);
}
 92c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 92f:	5b                   	pop    %ebx
 930:	5e                   	pop    %esi
 931:	5f                   	pop    %edi
 932:	5d                   	pop    %ebp
 933:	c3                   	ret    
 934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 938:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 93f:	eb 87                	jmp    8c8 <printint+0x28>
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 948:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94f:	90                   	nop

00000950 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 950:	f3 0f 1e fb          	endbr32 
 954:	55                   	push   %ebp
 955:	89 e5                	mov    %esp,%ebp
 957:	57                   	push   %edi
 958:	56                   	push   %esi
 959:	53                   	push   %ebx
 95a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 95d:	8b 75 0c             	mov    0xc(%ebp),%esi
 960:	0f b6 1e             	movzbl (%esi),%ebx
 963:	84 db                	test   %bl,%bl
 965:	0f 84 b4 00 00 00    	je     a1f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 96b:	8d 45 10             	lea    0x10(%ebp),%eax
 96e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 971:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 974:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 976:	89 45 d0             	mov    %eax,-0x30(%ebp)
 979:	eb 33                	jmp    9ae <printf+0x5e>
 97b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop
 980:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 983:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 988:	83 f8 25             	cmp    $0x25,%eax
 98b:	74 17                	je     9a4 <printf+0x54>
  write(fd, &c, 1);
 98d:	83 ec 04             	sub    $0x4,%esp
 990:	88 5d e7             	mov    %bl,-0x19(%ebp)
 993:	6a 01                	push   $0x1
 995:	57                   	push   %edi
 996:	ff 75 08             	pushl  0x8(%ebp)
 999:	e8 2f fe ff ff       	call   7cd <write>
 99e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 9a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 9a4:	0f b6 1e             	movzbl (%esi),%ebx
 9a7:	83 c6 01             	add    $0x1,%esi
 9aa:	84 db                	test   %bl,%bl
 9ac:	74 71                	je     a1f <printf+0xcf>
    c = fmt[i] & 0xff;
 9ae:	0f be cb             	movsbl %bl,%ecx
 9b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9b4:	85 d2                	test   %edx,%edx
 9b6:	74 c8                	je     980 <printf+0x30>
      }
    } else if(state == '%'){
 9b8:	83 fa 25             	cmp    $0x25,%edx
 9bb:	75 e7                	jne    9a4 <printf+0x54>
      if(c == 'd'){
 9bd:	83 f8 64             	cmp    $0x64,%eax
 9c0:	0f 84 9a 00 00 00    	je     a60 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9cc:	83 f9 70             	cmp    $0x70,%ecx
 9cf:	74 5f                	je     a30 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9d1:	83 f8 73             	cmp    $0x73,%eax
 9d4:	0f 84 d6 00 00 00    	je     ab0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9da:	83 f8 63             	cmp    $0x63,%eax
 9dd:	0f 84 8d 00 00 00    	je     a70 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9e3:	83 f8 25             	cmp    $0x25,%eax
 9e6:	0f 84 b4 00 00 00    	je     aa0 <printf+0x150>
  write(fd, &c, 1);
 9ec:	83 ec 04             	sub    $0x4,%esp
 9ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9f3:	6a 01                	push   $0x1
 9f5:	57                   	push   %edi
 9f6:	ff 75 08             	pushl  0x8(%ebp)
 9f9:	e8 cf fd ff ff       	call   7cd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a01:	83 c4 0c             	add    $0xc,%esp
 a04:	6a 01                	push   $0x1
 a06:	83 c6 01             	add    $0x1,%esi
 a09:	57                   	push   %edi
 a0a:	ff 75 08             	pushl  0x8(%ebp)
 a0d:	e8 bb fd ff ff       	call   7cd <write>
  for(i = 0; fmt[i]; i++){
 a12:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a16:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a19:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a1b:	84 db                	test   %bl,%bl
 a1d:	75 8f                	jne    9ae <printf+0x5e>
    }
  }
}
 a1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a22:	5b                   	pop    %ebx
 a23:	5e                   	pop    %esi
 a24:	5f                   	pop    %edi
 a25:	5d                   	pop    %ebp
 a26:	c3                   	ret    
 a27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a30:	83 ec 0c             	sub    $0xc,%esp
 a33:	b9 10 00 00 00       	mov    $0x10,%ecx
 a38:	6a 00                	push   $0x0
 a3a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a3d:	8b 45 08             	mov    0x8(%ebp),%eax
 a40:	8b 13                	mov    (%ebx),%edx
 a42:	e8 59 fe ff ff       	call   8a0 <printint>
        ap++;
 a47:	89 d8                	mov    %ebx,%eax
 a49:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a4c:	31 d2                	xor    %edx,%edx
        ap++;
 a4e:	83 c0 04             	add    $0x4,%eax
 a51:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a54:	e9 4b ff ff ff       	jmp    9a4 <printf+0x54>
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a60:	83 ec 0c             	sub    $0xc,%esp
 a63:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a68:	6a 01                	push   $0x1
 a6a:	eb ce                	jmp    a3a <printf+0xea>
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a70:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a73:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a76:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a78:	6a 01                	push   $0x1
        ap++;
 a7a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a7d:	57                   	push   %edi
 a7e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a81:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a84:	e8 44 fd ff ff       	call   7cd <write>
        ap++;
 a89:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a8c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a8f:	31 d2                	xor    %edx,%edx
 a91:	e9 0e ff ff ff       	jmp    9a4 <printf+0x54>
 a96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 aa0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 aa3:	83 ec 04             	sub    $0x4,%esp
 aa6:	e9 59 ff ff ff       	jmp    a04 <printf+0xb4>
 aab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aaf:	90                   	nop
        s = (char*)*ap;
 ab0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ab3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ab5:	83 c0 04             	add    $0x4,%eax
 ab8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 abb:	85 db                	test   %ebx,%ebx
 abd:	74 17                	je     ad6 <printf+0x186>
        while(*s != 0){
 abf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 ac2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 ac4:	84 c0                	test   %al,%al
 ac6:	0f 84 d8 fe ff ff    	je     9a4 <printf+0x54>
 acc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 acf:	89 de                	mov    %ebx,%esi
 ad1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ad4:	eb 1a                	jmp    af0 <printf+0x1a0>
          s = "(null)";
 ad6:	bb 28 0d 00 00       	mov    $0xd28,%ebx
        while(*s != 0){
 adb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 ade:	b8 28 00 00 00       	mov    $0x28,%eax
 ae3:	89 de                	mov    %ebx,%esi
 ae5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ae8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aef:	90                   	nop
  write(fd, &c, 1);
 af0:	83 ec 04             	sub    $0x4,%esp
          s++;
 af3:	83 c6 01             	add    $0x1,%esi
 af6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 af9:	6a 01                	push   $0x1
 afb:	57                   	push   %edi
 afc:	53                   	push   %ebx
 afd:	e8 cb fc ff ff       	call   7cd <write>
        while(*s != 0){
 b02:	0f b6 06             	movzbl (%esi),%eax
 b05:	83 c4 10             	add    $0x10,%esp
 b08:	84 c0                	test   %al,%al
 b0a:	75 e4                	jne    af0 <printf+0x1a0>
 b0c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b0f:	31 d2                	xor    %edx,%edx
 b11:	e9 8e fe ff ff       	jmp    9a4 <printf+0x54>
 b16:	66 90                	xchg   %ax,%ax
 b18:	66 90                	xchg   %ax,%ax
 b1a:	66 90                	xchg   %ax,%ax
 b1c:	66 90                	xchg   %ax,%ax
 b1e:	66 90                	xchg   %ax,%ax

00000b20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b20:	f3 0f 1e fb          	endbr32 
 b24:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b25:	a1 28 11 00 00       	mov    0x1128,%eax
{
 b2a:	89 e5                	mov    %esp,%ebp
 b2c:	57                   	push   %edi
 b2d:	56                   	push   %esi
 b2e:	53                   	push   %ebx
 b2f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b32:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b34:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b37:	39 c8                	cmp    %ecx,%eax
 b39:	73 15                	jae    b50 <free+0x30>
 b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b3f:	90                   	nop
 b40:	39 d1                	cmp    %edx,%ecx
 b42:	72 14                	jb     b58 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b44:	39 d0                	cmp    %edx,%eax
 b46:	73 10                	jae    b58 <free+0x38>
{
 b48:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b4a:	8b 10                	mov    (%eax),%edx
 b4c:	39 c8                	cmp    %ecx,%eax
 b4e:	72 f0                	jb     b40 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b50:	39 d0                	cmp    %edx,%eax
 b52:	72 f4                	jb     b48 <free+0x28>
 b54:	39 d1                	cmp    %edx,%ecx
 b56:	73 f0                	jae    b48 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b58:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b5b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b5e:	39 fa                	cmp    %edi,%edx
 b60:	74 1e                	je     b80 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b62:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b65:	8b 50 04             	mov    0x4(%eax),%edx
 b68:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b6b:	39 f1                	cmp    %esi,%ecx
 b6d:	74 28                	je     b97 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b6f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b71:	5b                   	pop    %ebx
  freep = p;
 b72:	a3 28 11 00 00       	mov    %eax,0x1128
}
 b77:	5e                   	pop    %esi
 b78:	5f                   	pop    %edi
 b79:	5d                   	pop    %ebp
 b7a:	c3                   	ret    
 b7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b7f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b80:	03 72 04             	add    0x4(%edx),%esi
 b83:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b86:	8b 10                	mov    (%eax),%edx
 b88:	8b 12                	mov    (%edx),%edx
 b8a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b8d:	8b 50 04             	mov    0x4(%eax),%edx
 b90:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b93:	39 f1                	cmp    %esi,%ecx
 b95:	75 d8                	jne    b6f <free+0x4f>
    p->s.size += bp->s.size;
 b97:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b9a:	a3 28 11 00 00       	mov    %eax,0x1128
    p->s.size += bp->s.size;
 b9f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ba2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 ba5:	89 10                	mov    %edx,(%eax)
}
 ba7:	5b                   	pop    %ebx
 ba8:	5e                   	pop    %esi
 ba9:	5f                   	pop    %edi
 baa:	5d                   	pop    %ebp
 bab:	c3                   	ret    
 bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bb0:	f3 0f 1e fb          	endbr32 
 bb4:	55                   	push   %ebp
 bb5:	89 e5                	mov    %esp,%ebp
 bb7:	57                   	push   %edi
 bb8:	56                   	push   %esi
 bb9:	53                   	push   %ebx
 bba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bc0:	8b 3d 28 11 00 00    	mov    0x1128,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc6:	8d 70 07             	lea    0x7(%eax),%esi
 bc9:	c1 ee 03             	shr    $0x3,%esi
 bcc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 bcf:	85 ff                	test   %edi,%edi
 bd1:	0f 84 a9 00 00 00    	je     c80 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 bd9:	8b 48 04             	mov    0x4(%eax),%ecx
 bdc:	39 f1                	cmp    %esi,%ecx
 bde:	73 6d                	jae    c4d <malloc+0x9d>
 be0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 be6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 beb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 bee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 bf5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 bf8:	eb 17                	jmp    c11 <malloc+0x61>
 bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c00:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c02:	8b 4a 04             	mov    0x4(%edx),%ecx
 c05:	39 f1                	cmp    %esi,%ecx
 c07:	73 4f                	jae    c58 <malloc+0xa8>
 c09:	8b 3d 28 11 00 00    	mov    0x1128,%edi
 c0f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c11:	39 c7                	cmp    %eax,%edi
 c13:	75 eb                	jne    c00 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c15:	83 ec 0c             	sub    $0xc,%esp
 c18:	ff 75 e4             	pushl  -0x1c(%ebp)
 c1b:	e8 15 fc ff ff       	call   835 <sbrk>
  if(p == (char*)-1)
 c20:	83 c4 10             	add    $0x10,%esp
 c23:	83 f8 ff             	cmp    $0xffffffff,%eax
 c26:	74 1b                	je     c43 <malloc+0x93>
  hp->s.size = nu;
 c28:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c2b:	83 ec 0c             	sub    $0xc,%esp
 c2e:	83 c0 08             	add    $0x8,%eax
 c31:	50                   	push   %eax
 c32:	e8 e9 fe ff ff       	call   b20 <free>
  return freep;
 c37:	a1 28 11 00 00       	mov    0x1128,%eax
      if((p = morecore(nunits)) == 0)
 c3c:	83 c4 10             	add    $0x10,%esp
 c3f:	85 c0                	test   %eax,%eax
 c41:	75 bd                	jne    c00 <malloc+0x50>
        return 0;
  }
}
 c43:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c46:	31 c0                	xor    %eax,%eax
}
 c48:	5b                   	pop    %ebx
 c49:	5e                   	pop    %esi
 c4a:	5f                   	pop    %edi
 c4b:	5d                   	pop    %ebp
 c4c:	c3                   	ret    
    if(p->s.size >= nunits){
 c4d:	89 c2                	mov    %eax,%edx
 c4f:	89 f8                	mov    %edi,%eax
 c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c58:	39 ce                	cmp    %ecx,%esi
 c5a:	74 54                	je     cb0 <malloc+0x100>
        p->s.size -= nunits;
 c5c:	29 f1                	sub    %esi,%ecx
 c5e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c61:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c64:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c67:	a3 28 11 00 00       	mov    %eax,0x1128
}
 c6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c6f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c72:	5b                   	pop    %ebx
 c73:	5e                   	pop    %esi
 c74:	5f                   	pop    %edi
 c75:	5d                   	pop    %ebp
 c76:	c3                   	ret    
 c77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c7e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c80:	c7 05 28 11 00 00 2c 	movl   $0x112c,0x1128
 c87:	11 00 00 
    base.s.size = 0;
 c8a:	bf 2c 11 00 00       	mov    $0x112c,%edi
    base.s.ptr = freep = prevp = &base;
 c8f:	c7 05 2c 11 00 00 2c 	movl   $0x112c,0x112c
 c96:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c99:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c9b:	c7 05 30 11 00 00 00 	movl   $0x0,0x1130
 ca2:	00 00 00 
    if(p->s.size >= nunits){
 ca5:	e9 36 ff ff ff       	jmp    be0 <malloc+0x30>
 caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 cb0:	8b 0a                	mov    (%edx),%ecx
 cb2:	89 08                	mov    %ecx,(%eax)
 cb4:	eb b1                	jmp    c67 <malloc+0xb7>
