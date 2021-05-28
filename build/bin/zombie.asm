
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
  15:	e8 3b 07 00 00       	call   755 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7e 0d                	jle    2b <main+0x2b>
    sleep(5);  // Let child exit before parent.
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	6a 05                	push   $0x5
  23:	e8 c5 07 00 00       	call   7ed <sleep>
  28:	83 c4 10             	add    $0x10,%esp
  exit();
  2b:	e8 2d 07 00 00       	call   75d <exit>

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

00000060 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	57                   	push   %edi
  68:	8b 7d 10             	mov    0x10(%ebp),%edi
  6b:	56                   	push   %esi
  6c:	8b 75 08             	mov    0x8(%ebp),%esi
  6f:	53                   	push   %ebx
  70:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
  73:	85 ff                	test   %edi,%edi
  75:	74 39                	je     b0 <strcat_s+0x50>
  77:	31 c0                	xor    %eax,%eax
  79:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  7e:	eb 11                	jmp    91 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
  80:	0f b6 12             	movzbl (%edx),%edx
  83:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  86:	84 d2                	test   %dl,%dl
  88:	74 26                	je     b0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
  8a:	83 c0 01             	add    $0x1,%eax
  8d:	39 c7                	cmp    %eax,%edi
  8f:	74 1f                	je     b0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
  91:	89 c2                	mov    %eax,%edx
  93:	29 ca                	sub    %ecx,%edx
  95:	01 da                	add    %ebx,%edx
  97:	83 f9 ff             	cmp    $0xffffffff,%ecx
  9a:	75 e4                	jne    80 <strcat_s+0x20>
  9c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
  a0:	75 e8                	jne    8a <strcat_s+0x2a>
  a2:	89 da                	mov    %ebx,%edx
  a4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
  a6:	0f b6 12             	movzbl (%edx),%edx
  a9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
  ac:	84 d2                	test   %dl,%dl
  ae:	75 da                	jne    8a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
  b0:	5b                   	pop    %ebx
  b1:	89 f0                	mov    %esi,%eax
  b3:	5e                   	pop    %esi
  b4:	5f                   	pop    %edi
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    
  b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	f3 0f 1e fb          	endbr32 
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	53                   	push   %ebx
  c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ce:	0f b6 01             	movzbl (%ecx),%eax
  d1:	0f b6 1a             	movzbl (%edx),%ebx
  d4:	84 c0                	test   %al,%al
  d6:	75 19                	jne    f1 <strcmp+0x31>
  d8:	eb 26                	jmp    100 <strcmp+0x40>
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  e4:	83 c1 01             	add    $0x1,%ecx
  e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ea:	0f b6 1a             	movzbl (%edx),%ebx
  ed:	84 c0                	test   %al,%al
  ef:	74 0f                	je     100 <strcmp+0x40>
  f1:	38 d8                	cmp    %bl,%al
  f3:	74 eb                	je     e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  f5:	29 d8                	sub    %ebx,%eax
}
  f7:	5b                   	pop    %ebx
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 100:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 102:	29 d8                	sub    %ebx,%eax
}
 104:	5b                   	pop    %ebx
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 11a:	80 3a 00             	cmpb   $0x0,(%edx)
 11d:	74 21                	je     140 <strlen+0x30>
 11f:	31 c0                	xor    %eax,%eax
 121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 128:	83 c0 01             	add    $0x1,%eax
 12b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 12f:	89 c1                	mov    %eax,%ecx
 131:	75 f5                	jne    128 <strlen+0x18>
    ;
  return n;
}
 133:	89 c8                	mov    %ecx,%eax
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 140:	31 c9                	xor    %ecx,%ecx
}
 142:	5d                   	pop    %ebp
 143:	89 c8                	mov    %ecx,%eax
 145:	c3                   	ret    
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	57                   	push   %edi
 158:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 15b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	89 d7                	mov    %edx,%edi
 163:	fc                   	cld    
 164:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 166:	89 d0                	mov    %edx,%eax
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	84 d2                	test   %dl,%dl
 183:	75 16                	jne    19b <strchr+0x2b>
 185:	eb 21                	jmp    1a8 <strchr+0x38>
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax
 190:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 194:	83 c0 01             	add    $0x1,%eax
 197:	84 d2                	test   %dl,%dl
 199:	74 0d                	je     1a8 <strchr+0x38>
    if(*s == c)
 19b:	38 d1                	cmp    %dl,%cl
 19d:	75 f1                	jne    190 <strchr+0x20>
      return (char*)s;
  return 0;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1a8:	31 c0                	xor    %eax,%eax
}
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b9:	31 f6                	xor    %esi,%esi
{
 1bb:	53                   	push   %ebx
 1bc:	89 f3                	mov    %esi,%ebx
 1be:	83 ec 1c             	sub    $0x1c,%esp
 1c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1c4:	eb 33                	jmp    1f9 <gets+0x49>
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1d6:	6a 01                	push   $0x1
 1d8:	50                   	push   %eax
 1d9:	6a 00                	push   $0x0
 1db:	e8 95 05 00 00       	call   775 <read>
    if(cc < 1)
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	85 c0                	test   %eax,%eax
 1e5:	7e 1c                	jle    203 <gets+0x53>
      break;
    buf[i++] = c;
 1e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1eb:	83 c7 01             	add    $0x1,%edi
 1ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1f1:	3c 0a                	cmp    $0xa,%al
 1f3:	74 23                	je     218 <gets+0x68>
 1f5:	3c 0d                	cmp    $0xd,%al
 1f7:	74 1f                	je     218 <gets+0x68>
  for(i=0; i+1 < max; ){
 1f9:	83 c3 01             	add    $0x1,%ebx
 1fc:	89 fe                	mov    %edi,%esi
 1fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 201:	7c cd                	jl     1d0 <gets+0x20>
 203:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 205:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 208:	c6 03 00             	movb   $0x0,(%ebx)
}
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	8b 75 08             	mov    0x8(%ebp),%esi
 21b:	8b 45 08             	mov    0x8(%ebp),%eax
 21e:	01 de                	add    %ebx,%esi
 220:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 222:	c6 03 00             	movb   $0x0,(%ebx)
}
 225:	8d 65 f4             	lea    -0xc(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5f                   	pop    %edi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <stat>:

int
stat(const char *n, struct stat *st)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	56                   	push   %esi
 238:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	6a 00                	push   $0x0
 23e:	ff 75 08             	pushl  0x8(%ebp)
 241:	e8 57 05 00 00       	call   79d <open>
  if(fd < 0)
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	78 2b                	js     278 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	pushl  0xc(%ebp)
 253:	89 c3                	mov    %eax,%ebx
 255:	50                   	push   %eax
 256:	e8 5a 05 00 00       	call   7b5 <fstat>
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 25e:	89 c6                	mov    %eax,%esi
  close(fd);
 260:	e8 20 05 00 00       	call   785 <close>
  return r;
 265:	83 c4 10             	add    $0x10,%esp
}
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	89 f0                	mov    %esi,%eax
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 278:	be ff ff ff ff       	mov    $0xffffffff,%esi
 27d:	eb e9                	jmp    268 <stat+0x38>
 27f:	90                   	nop

00000280 <atoi>:

int
atoi(const char *s)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	53                   	push   %ebx
 288:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28b:	0f be 02             	movsbl (%edx),%eax
 28e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 291:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 294:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 299:	77 1a                	ja     2b5 <atoi+0x35>
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop
    n = n*10 + *s++ - '0';
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2aa:	0f be 02             	movsbl (%edx),%eax
 2ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 eb                	jbe    2a0 <atoi+0x20>
  return n;
}
 2b5:	89 c8                	mov    %ecx,%eax
 2b7:	5b                   	pop    %ebx
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	8b 45 10             	mov    0x10(%ebp),%eax
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
 2ce:	56                   	push   %esi
 2cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d2:	85 c0                	test   %eax,%eax
 2d4:	7e 0f                	jle    2e5 <memmove+0x25>
 2d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2d8:	89 d7                	mov    %edx,%edi
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2e1:	39 f8                	cmp    %edi,%eax
 2e3:	75 fb                	jne    2e0 <memmove+0x20>
  return vdst;
}
 2e5:	5e                   	pop    %esi
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	57                   	push   %edi
 2f8:	56                   	push   %esi
 2f9:	53                   	push   %ebx
 2fa:	83 ec 34             	sub    $0x34,%esp
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 300:	68 68 0c 00 00       	push   $0xc68
hexdump (void *data, size_t size) {
 305:	89 45 e0             	mov    %eax,-0x20(%ebp)
 308:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 30b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 30d:	89 c7                	mov    %eax,%edi
 30f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 312:	e8 e9 05 00 00       	call   900 <printf>
  for (offset = 0; offset < size; offset += 16) {
 317:	83 c4 10             	add    $0x10,%esp
 31a:	85 ff                	test   %edi,%edi
 31c:	0f 84 2d 01 00 00    	je     44f <hexdump+0x15f>
 322:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 325:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 32c:	be 10 00 00 00       	mov    $0x10,%esi
 331:	83 e8 01             	sub    $0x1,%eax
 334:	83 e0 f0             	and    $0xfffffff0,%eax
 337:	83 c0 10             	add    $0x10,%eax
 33a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 340:	83 ec 08             	sub    $0x8,%esp
 343:	68 bc 0c 00 00       	push   $0xcbc
 348:	6a 01                	push   $0x1
 34a:	e8 b1 05 00 00       	call   900 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 34f:	83 c4 10             	add    $0x10,%esp
 352:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 359:	0f 8e 51 01 00 00    	jle    4b0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 35f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 362:	83 ec 04             	sub    $0x4,%esp
 365:	57                   	push   %edi
 366:	89 fb                	mov    %edi,%ebx
 368:	68 b9 0c 00 00       	push   $0xcb9
 36d:	6a 01                	push   $0x1
 36f:	e8 8c 05 00 00       	call   900 <printf>
 374:	89 7d d8             	mov    %edi,-0x28(%ebp)
 377:	83 c4 10             	add    $0x10,%esp
 37a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 37d:	eb 28                	jmp    3a7 <hexdump+0xb7>
 37f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 380:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 384:	80 fa 0f             	cmp    $0xf,%dl
 387:	0f 86 e3 00 00 00    	jbe    470 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 38d:	83 ec 04             	sub    $0x4,%esp
 390:	83 c3 01             	add    $0x1,%ebx
 393:	52                   	push   %edx
 394:	68 bf 0c 00 00       	push   $0xcbf
 399:	6a 01                	push   $0x1
 39b:	e8 60 05 00 00       	call   900 <printf>
 3a0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3a3:	39 f3                	cmp    %esi,%ebx
 3a5:	74 1e                	je     3c5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 3a7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 3aa:	7f d4                	jg     380 <hexdump+0x90>
      } else {
        printf(1, "   ");
 3ac:	83 ec 08             	sub    $0x8,%esp
 3af:	83 c3 01             	add    $0x1,%ebx
 3b2:	68 c3 0c 00 00       	push   $0xcc3
 3b7:	6a 01                	push   $0x1
 3b9:	e8 42 05 00 00       	call   900 <printf>
 3be:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3c1:	39 f3                	cmp    %esi,%ebx
 3c3:	75 e2                	jne    3a7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 3cb:	68 bc 0c 00 00       	push   $0xcbc
 3d0:	6a 01                	push   $0x1
 3d2:	e8 29 05 00 00       	call   900 <printf>
 3d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3da:	83 c4 10             	add    $0x10,%esp
 3dd:	eb 1b                	jmp    3fa <hexdump+0x10a>
 3df:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	52                   	push   %edx
 3e4:	68 c7 0c 00 00       	push   $0xcc7
 3e9:	6a 01                	push   $0x1
 3eb:	e8 10 05 00 00       	call   900 <printf>
 3f0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3f3:	83 c3 01             	add    $0x1,%ebx
 3f6:	39 de                	cmp    %ebx,%esi
 3f8:	74 30                	je     42a <hexdump+0x13a>
      if(offset + index < (int)size) {
 3fa:	39 df                	cmp    %ebx,%edi
 3fc:	0f 8e 8e 00 00 00    	jle    490 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 402:	8b 45 e0             	mov    -0x20(%ebp),%eax
 405:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 409:	8d 4a e0             	lea    -0x20(%edx),%ecx
 40c:	80 f9 5e             	cmp    $0x5e,%cl
 40f:	76 cf                	jbe    3e0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 411:	83 ec 08             	sub    $0x8,%esp
 414:	83 c3 01             	add    $0x1,%ebx
 417:	68 ca 0c 00 00       	push   $0xcca
 41c:	6a 01                	push   $0x1
 41e:	e8 dd 04 00 00       	call   900 <printf>
 423:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 426:	39 de                	cmp    %ebx,%esi
 428:	75 d0                	jne    3fa <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	83 c6 10             	add    $0x10,%esi
 430:	68 cc 0c 00 00       	push   $0xccc
 435:	6a 01                	push   $0x1
 437:	e8 c4 04 00 00       	call   900 <printf>
  for (offset = 0; offset < size; offset += 16) {
 43c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 440:	83 c4 10             	add    $0x10,%esp
 443:	8b 45 dc             	mov    -0x24(%ebp),%eax
 446:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 449:	0f 85 f1 fe ff ff    	jne    340 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 44f:	c7 45 0c 68 0c 00 00 	movl   $0xc68,0xc(%ebp)
 456:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 45d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5f                   	pop    %edi
 463:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 464:	e9 97 04 00 00       	jmp    900 <printf>
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 470:	83 ec 08             	sub    $0x8,%esp
 473:	68 b7 0c 00 00       	push   $0xcb7
 478:	6a 01                	push   $0x1
 47a:	e8 81 04 00 00       	call   900 <printf>
 47f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 483:	83 c4 10             	add    $0x10,%esp
 486:	e9 02 ff ff ff       	jmp    38d <hexdump+0x9d>
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
        printf(1, " ");
 490:	83 ec 08             	sub    $0x8,%esp
 493:	68 c5 0c 00 00       	push   $0xcc5
 498:	6a 01                	push   $0x1
 49a:	e8 61 04 00 00       	call   900 <printf>
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	e9 4c ff ff ff       	jmp    3f3 <hexdump+0x103>
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 4b0:	83 ec 08             	sub    $0x8,%esp
 4b3:	68 b7 0c 00 00       	push   $0xcb7
 4b8:	6a 01                	push   $0x1
 4ba:	e8 41 04 00 00       	call   900 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 4bf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 4cb:	0f 8f 8e fe ff ff    	jg     35f <hexdump+0x6f>
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	68 b7 0c 00 00       	push   $0xcb7
 4d9:	6a 01                	push   $0x1
 4db:	e8 20 04 00 00       	call   900 <printf>
    if (offset <= 0x000f) printf(1, "0");
 4e0:	83 c4 10             	add    $0x10,%esp
 4e3:	83 ff 0f             	cmp    $0xf,%edi
 4e6:	0f 8f 73 fe ff ff    	jg     35f <hexdump+0x6f>
 4ec:	83 ec 08             	sub    $0x8,%esp
 4ef:	68 b7 0c 00 00       	push   $0xcb7
 4f4:	6a 01                	push   $0x1
 4f6:	e8 05 04 00 00       	call   900 <printf>
 4fb:	83 c4 10             	add    $0x10,%esp
 4fe:	e9 5c fe ff ff       	jmp    35f <hexdump+0x6f>
 503:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000510 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
    if (!endian)
 515:	a1 c4 10 00 00       	mov    0x10c4,%eax
{
 51a:	89 e5                	mov    %esp,%ebp
 51c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 51f:	85 c0                	test   %eax,%eax
 521:	75 1d                	jne    540 <hton16+0x30>
        endian = byteorder();
 523:	c7 05 c4 10 00 00 d2 	movl   $0x4d2,0x10c4
 52a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 52d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 52f:	5d                   	pop    %ebp
 530:	66 c1 c2 08          	rol    $0x8,%dx
 534:	89 d0                	mov    %edx,%eax
 536:	c3                   	ret    
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax
 540:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 542:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 547:	74 e4                	je     52d <hton16+0x1d>
}
 549:	89 d0                	mov    %edx,%eax
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <ntoh16>:
 550:	f3 0f 1e fb          	endbr32 
 554:	eb ba                	jmp    510 <hton16>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi

00000560 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 560:	f3 0f 1e fb          	endbr32 
 564:	55                   	push   %ebp
    if (!endian)
 565:	8b 15 c4 10 00 00    	mov    0x10c4,%edx
{
 56b:	89 e5                	mov    %esp,%ebp
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 570:	85 d2                	test   %edx,%edx
 572:	75 14                	jne    588 <hton32+0x28>
        endian = byteorder();
 574:	c7 05 c4 10 00 00 d2 	movl   $0x4d2,0x10c4
 57b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 57e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 588:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 58e:	74 ee                	je     57e <hton32+0x1e>
}
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    
 592:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005a0 <ntoh32>:
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	eb ba                	jmp    560 <hton32>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi

000005b0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	57                   	push   %edi
 5b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5bb:	56                   	push   %esi
 5bc:	53                   	push   %ebx
 5bd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 5c0:	0f b6 01             	movzbl (%ecx),%eax
 5c3:	3c 09                	cmp    $0x9,%al
 5c5:	74 09                	je     5d0 <strtol+0x20>
 5c7:	3c 20                	cmp    $0x20,%al
 5c9:	75 14                	jne    5df <strtol+0x2f>
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
 5d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 5d4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 5d7:	3c 20                	cmp    $0x20,%al
 5d9:	74 f5                	je     5d0 <strtol+0x20>
 5db:	3c 09                	cmp    $0x9,%al
 5dd:	74 f1                	je     5d0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 5df:	3c 2b                	cmp    $0x2b,%al
 5e1:	0f 84 a9 00 00 00    	je     690 <strtol+0xe0>
    int neg = 0;
 5e7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 5e9:	3c 2d                	cmp    $0x2d,%al
 5eb:	0f 84 8f 00 00 00    	je     680 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 5f1:	0f be 11             	movsbl (%ecx),%edx
 5f4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 5fa:	75 12                	jne    60e <strtol+0x5e>
 5fc:	80 fa 30             	cmp    $0x30,%dl
 5ff:	0f 84 9b 00 00 00    	je     6a0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 605:	85 db                	test   %ebx,%ebx
 607:	75 05                	jne    60e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 609:	bb 0a 00 00 00       	mov    $0xa,%ebx
 60e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 611:	31 c0                	xor    %eax,%eax
 613:	eb 17                	jmp    62c <strtol+0x7c>
 615:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 618:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 61b:	3b 55 10             	cmp    0x10(%ebp),%edx
 61e:	7d 28                	jge    648 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 620:	0f af 45 10          	imul   0x10(%ebp),%eax
 624:	83 c1 01             	add    $0x1,%ecx
 627:	01 d0                	add    %edx,%eax
    while (1) {
 629:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 62c:	8d 72 d0             	lea    -0x30(%edx),%esi
 62f:	89 f3                	mov    %esi,%ebx
 631:	80 fb 09             	cmp    $0x9,%bl
 634:	76 e2                	jbe    618 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 636:	8d 72 9f             	lea    -0x61(%edx),%esi
 639:	89 f3                	mov    %esi,%ebx
 63b:	80 fb 19             	cmp    $0x19,%bl
 63e:	77 28                	ja     668 <strtol+0xb8>
            dig = *s - 'a' + 10;
 640:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 643:	3b 55 10             	cmp    0x10(%ebp),%edx
 646:	7c d8                	jl     620 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 648:	8b 55 0c             	mov    0xc(%ebp),%edx
 64b:	85 d2                	test   %edx,%edx
 64d:	74 05                	je     654 <strtol+0xa4>
        *endptr = (char *) s;
 64f:	8b 75 0c             	mov    0xc(%ebp),%esi
 652:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 654:	89 c2                	mov    %eax,%edx
}
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
    return (neg ? -val : val);
 658:	f7 da                	neg    %edx
 65a:	85 ff                	test   %edi,%edi
}
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 65e:	0f 45 c2             	cmovne %edx,%eax
}
 661:	c3                   	ret    
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 668:	8d 72 bf             	lea    -0x41(%edx),%esi
 66b:	89 f3                	mov    %esi,%ebx
 66d:	80 fb 19             	cmp    $0x19,%bl
 670:	77 d6                	ja     648 <strtol+0x98>
            dig = *s - 'A' + 10;
 672:	83 ea 37             	sub    $0x37,%edx
 675:	eb a4                	jmp    61b <strtol+0x6b>
 677:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 680:	83 c1 01             	add    $0x1,%ecx
 683:	bf 01 00 00 00       	mov    $0x1,%edi
 688:	e9 64 ff ff ff       	jmp    5f1 <strtol+0x41>
 68d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 690:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 693:	31 ff                	xor    %edi,%edi
 695:	e9 57 ff ff ff       	jmp    5f1 <strtol+0x41>
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 6a4:	3c 78                	cmp    $0x78,%al
 6a6:	74 18                	je     6c0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 6a8:	85 db                	test   %ebx,%ebx
 6aa:	0f 85 5e ff ff ff    	jne    60e <strtol+0x5e>
        s++, base = 8;
 6b0:	83 c1 01             	add    $0x1,%ecx
 6b3:	0f be d0             	movsbl %al,%edx
 6b6:	bb 08 00 00 00       	mov    $0x8,%ebx
 6bb:	e9 4e ff ff ff       	jmp    60e <strtol+0x5e>
        s += 2, base = 16;
 6c0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 6c4:	bb 10 00 00 00       	mov    $0x10,%ebx
 6c9:	83 c1 02             	add    $0x2,%ecx
 6cc:	e9 3d ff ff ff       	jmp    60e <strtol+0x5e>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 6e8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 6ea:	56                   	push   %esi
 6eb:	53                   	push   %ebx
 6ec:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 6ef:	83 ec 1c             	sub    $0x1c,%esp
 6f2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 6f5:	83 ec 04             	sub    $0x4,%esp
 6f8:	6a 0a                	push   $0xa
 6fa:	53                   	push   %ebx
 6fb:	56                   	push   %esi
 6fc:	e8 af fe ff ff       	call   5b0 <strtol>
        if (ret < 0 || ret > 255) {
 701:	83 c4 10             	add    $0x10,%esp
 704:	3d ff 00 00 00       	cmp    $0xff,%eax
 709:	77 3d                	ja     748 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 70b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 70e:	39 f1                	cmp    %esi,%ecx
 710:	74 36                	je     748 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 712:	0f b6 11             	movzbl (%ecx),%edx
 715:	83 ff 03             	cmp    $0x3,%edi
 718:	74 16                	je     730 <ip_addr_pton+0x50>
 71a:	80 fa 2e             	cmp    $0x2e,%dl
 71d:	75 29                	jne    748 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 71f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 722:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 725:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 728:	83 c7 01             	add    $0x1,%edi
 72b:	eb c8                	jmp    6f5 <ip_addr_pton+0x15>
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 730:	84 d2                	test   %dl,%dl
 732:	75 14                	jne    748 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 734:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 737:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 73a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 73d:	31 c0                	xor    %eax,%eax
}
 73f:	5b                   	pop    %ebx
 740:	5e                   	pop    %esi
 741:	5f                   	pop    %edi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 748:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 74b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 750:	5b                   	pop    %ebx
 751:	5e                   	pop    %esi
 752:	5f                   	pop    %edi
 753:	5d                   	pop    %ebp
 754:	c3                   	ret    

00000755 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 755:	b8 01 00 00 00       	mov    $0x1,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <exit>:
SYSCALL(exit)
 75d:	b8 02 00 00 00       	mov    $0x2,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <wait>:
SYSCALL(wait)
 765:	b8 03 00 00 00       	mov    $0x3,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <pipe>:
SYSCALL(pipe)
 76d:	b8 04 00 00 00       	mov    $0x4,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <read>:
SYSCALL(read)
 775:	b8 05 00 00 00       	mov    $0x5,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <write>:
SYSCALL(write)
 77d:	b8 10 00 00 00       	mov    $0x10,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <close>:
SYSCALL(close)
 785:	b8 15 00 00 00       	mov    $0x15,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <kill>:
SYSCALL(kill)
 78d:	b8 06 00 00 00       	mov    $0x6,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <exec>:
SYSCALL(exec)
 795:	b8 07 00 00 00       	mov    $0x7,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <open>:
SYSCALL(open)
 79d:	b8 0f 00 00 00       	mov    $0xf,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <mknod>:
SYSCALL(mknod)
 7a5:	b8 11 00 00 00       	mov    $0x11,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <unlink>:
SYSCALL(unlink)
 7ad:	b8 12 00 00 00       	mov    $0x12,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <fstat>:
SYSCALL(fstat)
 7b5:	b8 08 00 00 00       	mov    $0x8,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <link>:
SYSCALL(link)
 7bd:	b8 13 00 00 00       	mov    $0x13,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <mkdir>:
SYSCALL(mkdir)
 7c5:	b8 14 00 00 00       	mov    $0x14,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <chdir>:
SYSCALL(chdir)
 7cd:	b8 09 00 00 00       	mov    $0x9,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <dup>:
SYSCALL(dup)
 7d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <getpid>:
SYSCALL(getpid)
 7dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <sbrk>:
SYSCALL(sbrk)
 7e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <sleep>:
SYSCALL(sleep)
 7ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <uptime>:
SYSCALL(uptime)
 7f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <ioctl>:
# iotcl
SYSCALL(ioctl)
 7fd:	b8 16 00 00 00       	mov    $0x16,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <socket>:
# socket
SYSCALL(socket)
 805:	b8 17 00 00 00       	mov    $0x17,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <bind>:
SYSCALL(bind)
 80d:	b8 19 00 00 00       	mov    $0x19,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <listen>:
SYSCALL(listen)
 815:	b8 1a 00 00 00       	mov    $0x1a,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <accept>:
SYSCALL(accept)
 81d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <recv>:
SYSCALL(recv)
 825:	b8 1c 00 00 00       	mov    $0x1c,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <send>:
SYSCALL(send)
 82d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <recvfrom>:
SYSCALL(recvfrom)
 835:	b8 1e 00 00 00       	mov    $0x1e,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <sendto>:
SYSCALL(sendto)
 83d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    
 845:	66 90                	xchg   %ax,%ax
 847:	66 90                	xchg   %ax,%ax
 849:	66 90                	xchg   %ax,%ax
 84b:	66 90                	xchg   %ax,%ax
 84d:	66 90                	xchg   %ax,%ax
 84f:	90                   	nop

00000850 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 3c             	sub    $0x3c,%esp
 859:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 85c:	89 d1                	mov    %edx,%ecx
{
 85e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 861:	85 d2                	test   %edx,%edx
 863:	0f 89 7f 00 00 00    	jns    8e8 <printint+0x98>
 869:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 86d:	74 79                	je     8e8 <printint+0x98>
    neg = 1;
 86f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 876:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 878:	31 db                	xor    %ebx,%ebx
 87a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 87d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 880:	89 c8                	mov    %ecx,%eax
 882:	31 d2                	xor    %edx,%edx
 884:	89 cf                	mov    %ecx,%edi
 886:	f7 75 c4             	divl   -0x3c(%ebp)
 889:	0f b6 92 d8 0c 00 00 	movzbl 0xcd8(%edx),%edx
 890:	89 45 c0             	mov    %eax,-0x40(%ebp)
 893:	89 d8                	mov    %ebx,%eax
 895:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 898:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 89b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 89e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8a1:	76 dd                	jbe    880 <printint+0x30>
  if(neg)
 8a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8a6:	85 c9                	test   %ecx,%ecx
 8a8:	74 0c                	je     8b6 <printint+0x66>
    buf[i++] = '-';
 8aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8bd:	eb 07                	jmp    8c6 <printint+0x76>
 8bf:	90                   	nop
 8c0:	0f b6 13             	movzbl (%ebx),%edx
 8c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8c6:	83 ec 04             	sub    $0x4,%esp
 8c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8cc:	6a 01                	push   $0x1
 8ce:	56                   	push   %esi
 8cf:	57                   	push   %edi
 8d0:	e8 a8 fe ff ff       	call   77d <write>
  while(--i >= 0)
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	39 de                	cmp    %ebx,%esi
 8da:	75 e4                	jne    8c0 <printint+0x70>
    putc(fd, buf[i]);
}
 8dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8df:	5b                   	pop    %ebx
 8e0:	5e                   	pop    %esi
 8e1:	5f                   	pop    %edi
 8e2:	5d                   	pop    %ebp
 8e3:	c3                   	ret    
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8ef:	eb 87                	jmp    878 <printint+0x28>
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ff:	90                   	nop

00000900 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 900:	f3 0f 1e fb          	endbr32 
 904:	55                   	push   %ebp
 905:	89 e5                	mov    %esp,%ebp
 907:	57                   	push   %edi
 908:	56                   	push   %esi
 909:	53                   	push   %ebx
 90a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 90d:	8b 75 0c             	mov    0xc(%ebp),%esi
 910:	0f b6 1e             	movzbl (%esi),%ebx
 913:	84 db                	test   %bl,%bl
 915:	0f 84 b4 00 00 00    	je     9cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 91b:	8d 45 10             	lea    0x10(%ebp),%eax
 91e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 921:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 924:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 926:	89 45 d0             	mov    %eax,-0x30(%ebp)
 929:	eb 33                	jmp    95e <printf+0x5e>
 92b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 92f:	90                   	nop
 930:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 933:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 938:	83 f8 25             	cmp    $0x25,%eax
 93b:	74 17                	je     954 <printf+0x54>
  write(fd, &c, 1);
 93d:	83 ec 04             	sub    $0x4,%esp
 940:	88 5d e7             	mov    %bl,-0x19(%ebp)
 943:	6a 01                	push   $0x1
 945:	57                   	push   %edi
 946:	ff 75 08             	pushl  0x8(%ebp)
 949:	e8 2f fe ff ff       	call   77d <write>
 94e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 951:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 954:	0f b6 1e             	movzbl (%esi),%ebx
 957:	83 c6 01             	add    $0x1,%esi
 95a:	84 db                	test   %bl,%bl
 95c:	74 71                	je     9cf <printf+0xcf>
    c = fmt[i] & 0xff;
 95e:	0f be cb             	movsbl %bl,%ecx
 961:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 964:	85 d2                	test   %edx,%edx
 966:	74 c8                	je     930 <printf+0x30>
      }
    } else if(state == '%'){
 968:	83 fa 25             	cmp    $0x25,%edx
 96b:	75 e7                	jne    954 <printf+0x54>
      if(c == 'd'){
 96d:	83 f8 64             	cmp    $0x64,%eax
 970:	0f 84 9a 00 00 00    	je     a10 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 976:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 97c:	83 f9 70             	cmp    $0x70,%ecx
 97f:	74 5f                	je     9e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 981:	83 f8 73             	cmp    $0x73,%eax
 984:	0f 84 d6 00 00 00    	je     a60 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 98a:	83 f8 63             	cmp    $0x63,%eax
 98d:	0f 84 8d 00 00 00    	je     a20 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 993:	83 f8 25             	cmp    $0x25,%eax
 996:	0f 84 b4 00 00 00    	je     a50 <printf+0x150>
  write(fd, &c, 1);
 99c:	83 ec 04             	sub    $0x4,%esp
 99f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9a3:	6a 01                	push   $0x1
 9a5:	57                   	push   %edi
 9a6:	ff 75 08             	pushl  0x8(%ebp)
 9a9:	e8 cf fd ff ff       	call   77d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9b1:	83 c4 0c             	add    $0xc,%esp
 9b4:	6a 01                	push   $0x1
 9b6:	83 c6 01             	add    $0x1,%esi
 9b9:	57                   	push   %edi
 9ba:	ff 75 08             	pushl  0x8(%ebp)
 9bd:	e8 bb fd ff ff       	call   77d <write>
  for(i = 0; fmt[i]; i++){
 9c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 9c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 9c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 9cb:	84 db                	test   %bl,%bl
 9cd:	75 8f                	jne    95e <printf+0x5e>
    }
  }
}
 9cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9d2:	5b                   	pop    %ebx
 9d3:	5e                   	pop    %esi
 9d4:	5f                   	pop    %edi
 9d5:	5d                   	pop    %ebp
 9d6:	c3                   	ret    
 9d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 9e0:	83 ec 0c             	sub    $0xc,%esp
 9e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9e8:	6a 00                	push   $0x0
 9ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 9ed:	8b 45 08             	mov    0x8(%ebp),%eax
 9f0:	8b 13                	mov    (%ebx),%edx
 9f2:	e8 59 fe ff ff       	call   850 <printint>
        ap++;
 9f7:	89 d8                	mov    %ebx,%eax
 9f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9fc:	31 d2                	xor    %edx,%edx
        ap++;
 9fe:	83 c0 04             	add    $0x4,%eax
 a01:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a04:	e9 4b ff ff ff       	jmp    954 <printf+0x54>
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a10:	83 ec 0c             	sub    $0xc,%esp
 a13:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a18:	6a 01                	push   $0x1
 a1a:	eb ce                	jmp    9ea <printf+0xea>
 a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a20:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a23:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a26:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a28:	6a 01                	push   $0x1
        ap++;
 a2a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a2d:	57                   	push   %edi
 a2e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a31:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a34:	e8 44 fd ff ff       	call   77d <write>
        ap++;
 a39:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a3c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a3f:	31 d2                	xor    %edx,%edx
 a41:	e9 0e ff ff ff       	jmp    954 <printf+0x54>
 a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a4d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a50:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a53:	83 ec 04             	sub    $0x4,%esp
 a56:	e9 59 ff ff ff       	jmp    9b4 <printf+0xb4>
 a5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a5f:	90                   	nop
        s = (char*)*ap;
 a60:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a63:	8b 18                	mov    (%eax),%ebx
        ap++;
 a65:	83 c0 04             	add    $0x4,%eax
 a68:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a6b:	85 db                	test   %ebx,%ebx
 a6d:	74 17                	je     a86 <printf+0x186>
        while(*s != 0){
 a6f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a72:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a74:	84 c0                	test   %al,%al
 a76:	0f 84 d8 fe ff ff    	je     954 <printf+0x54>
 a7c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a7f:	89 de                	mov    %ebx,%esi
 a81:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a84:	eb 1a                	jmp    aa0 <printf+0x1a0>
          s = "(null)";
 a86:	bb d0 0c 00 00       	mov    $0xcd0,%ebx
        while(*s != 0){
 a8b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a8e:	b8 28 00 00 00       	mov    $0x28,%eax
 a93:	89 de                	mov    %ebx,%esi
 a95:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop
  write(fd, &c, 1);
 aa0:	83 ec 04             	sub    $0x4,%esp
          s++;
 aa3:	83 c6 01             	add    $0x1,%esi
 aa6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 aa9:	6a 01                	push   $0x1
 aab:	57                   	push   %edi
 aac:	53                   	push   %ebx
 aad:	e8 cb fc ff ff       	call   77d <write>
        while(*s != 0){
 ab2:	0f b6 06             	movzbl (%esi),%eax
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	84 c0                	test   %al,%al
 aba:	75 e4                	jne    aa0 <printf+0x1a0>
 abc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 abf:	31 d2                	xor    %edx,%edx
 ac1:	e9 8e fe ff ff       	jmp    954 <printf+0x54>
 ac6:	66 90                	xchg   %ax,%ax
 ac8:	66 90                	xchg   %ax,%ax
 aca:	66 90                	xchg   %ax,%ax
 acc:	66 90                	xchg   %ax,%ax
 ace:	66 90                	xchg   %ax,%ax

00000ad0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ad0:	f3 0f 1e fb          	endbr32 
 ad4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad5:	a1 c8 10 00 00       	mov    0x10c8,%eax
{
 ada:	89 e5                	mov    %esp,%ebp
 adc:	57                   	push   %edi
 add:	56                   	push   %esi
 ade:	53                   	push   %ebx
 adf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ae2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 ae4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ae7:	39 c8                	cmp    %ecx,%eax
 ae9:	73 15                	jae    b00 <free+0x30>
 aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aef:	90                   	nop
 af0:	39 d1                	cmp    %edx,%ecx
 af2:	72 14                	jb     b08 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af4:	39 d0                	cmp    %edx,%eax
 af6:	73 10                	jae    b08 <free+0x38>
{
 af8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 afa:	8b 10                	mov    (%eax),%edx
 afc:	39 c8                	cmp    %ecx,%eax
 afe:	72 f0                	jb     af0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b00:	39 d0                	cmp    %edx,%eax
 b02:	72 f4                	jb     af8 <free+0x28>
 b04:	39 d1                	cmp    %edx,%ecx
 b06:	73 f0                	jae    af8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b0e:	39 fa                	cmp    %edi,%edx
 b10:	74 1e                	je     b30 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b12:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b15:	8b 50 04             	mov    0x4(%eax),%edx
 b18:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b1b:	39 f1                	cmp    %esi,%ecx
 b1d:	74 28                	je     b47 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b1f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b21:	5b                   	pop    %ebx
  freep = p;
 b22:	a3 c8 10 00 00       	mov    %eax,0x10c8
}
 b27:	5e                   	pop    %esi
 b28:	5f                   	pop    %edi
 b29:	5d                   	pop    %ebp
 b2a:	c3                   	ret    
 b2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b2f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b30:	03 72 04             	add    0x4(%edx),%esi
 b33:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b36:	8b 10                	mov    (%eax),%edx
 b38:	8b 12                	mov    (%edx),%edx
 b3a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b3d:	8b 50 04             	mov    0x4(%eax),%edx
 b40:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b43:	39 f1                	cmp    %esi,%ecx
 b45:	75 d8                	jne    b1f <free+0x4f>
    p->s.size += bp->s.size;
 b47:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b4a:	a3 c8 10 00 00       	mov    %eax,0x10c8
    p->s.size += bp->s.size;
 b4f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b52:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b55:	89 10                	mov    %edx,(%eax)
}
 b57:	5b                   	pop    %ebx
 b58:	5e                   	pop    %esi
 b59:	5f                   	pop    %edi
 b5a:	5d                   	pop    %ebp
 b5b:	c3                   	ret    
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b60:	f3 0f 1e fb          	endbr32 
 b64:	55                   	push   %ebp
 b65:	89 e5                	mov    %esp,%ebp
 b67:	57                   	push   %edi
 b68:	56                   	push   %esi
 b69:	53                   	push   %ebx
 b6a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b70:	8b 3d c8 10 00 00    	mov    0x10c8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b76:	8d 70 07             	lea    0x7(%eax),%esi
 b79:	c1 ee 03             	shr    $0x3,%esi
 b7c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b7f:	85 ff                	test   %edi,%edi
 b81:	0f 84 a9 00 00 00    	je     c30 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b87:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b89:	8b 48 04             	mov    0x4(%eax),%ecx
 b8c:	39 f1                	cmp    %esi,%ecx
 b8e:	73 6d                	jae    bfd <malloc+0x9d>
 b90:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b96:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b9b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b9e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ba5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ba8:	eb 17                	jmp    bc1 <malloc+0x61>
 baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bb0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 bb2:	8b 4a 04             	mov    0x4(%edx),%ecx
 bb5:	39 f1                	cmp    %esi,%ecx
 bb7:	73 4f                	jae    c08 <malloc+0xa8>
 bb9:	8b 3d c8 10 00 00    	mov    0x10c8,%edi
 bbf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bc1:	39 c7                	cmp    %eax,%edi
 bc3:	75 eb                	jne    bb0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 bc5:	83 ec 0c             	sub    $0xc,%esp
 bc8:	ff 75 e4             	pushl  -0x1c(%ebp)
 bcb:	e8 15 fc ff ff       	call   7e5 <sbrk>
  if(p == (char*)-1)
 bd0:	83 c4 10             	add    $0x10,%esp
 bd3:	83 f8 ff             	cmp    $0xffffffff,%eax
 bd6:	74 1b                	je     bf3 <malloc+0x93>
  hp->s.size = nu;
 bd8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bdb:	83 ec 0c             	sub    $0xc,%esp
 bde:	83 c0 08             	add    $0x8,%eax
 be1:	50                   	push   %eax
 be2:	e8 e9 fe ff ff       	call   ad0 <free>
  return freep;
 be7:	a1 c8 10 00 00       	mov    0x10c8,%eax
      if((p = morecore(nunits)) == 0)
 bec:	83 c4 10             	add    $0x10,%esp
 bef:	85 c0                	test   %eax,%eax
 bf1:	75 bd                	jne    bb0 <malloc+0x50>
        return 0;
  }
}
 bf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bf6:	31 c0                	xor    %eax,%eax
}
 bf8:	5b                   	pop    %ebx
 bf9:	5e                   	pop    %esi
 bfa:	5f                   	pop    %edi
 bfb:	5d                   	pop    %ebp
 bfc:	c3                   	ret    
    if(p->s.size >= nunits){
 bfd:	89 c2                	mov    %eax,%edx
 bff:	89 f8                	mov    %edi,%eax
 c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c08:	39 ce                	cmp    %ecx,%esi
 c0a:	74 54                	je     c60 <malloc+0x100>
        p->s.size -= nunits;
 c0c:	29 f1                	sub    %esi,%ecx
 c0e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c11:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c14:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c17:	a3 c8 10 00 00       	mov    %eax,0x10c8
}
 c1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c1f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c22:	5b                   	pop    %ebx
 c23:	5e                   	pop    %esi
 c24:	5f                   	pop    %edi
 c25:	5d                   	pop    %ebp
 c26:	c3                   	ret    
 c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c2e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c30:	c7 05 c8 10 00 00 cc 	movl   $0x10cc,0x10c8
 c37:	10 00 00 
    base.s.size = 0;
 c3a:	bf cc 10 00 00       	mov    $0x10cc,%edi
    base.s.ptr = freep = prevp = &base;
 c3f:	c7 05 cc 10 00 00 cc 	movl   $0x10cc,0x10cc
 c46:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c49:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c4b:	c7 05 d0 10 00 00 00 	movl   $0x0,0x10d0
 c52:	00 00 00 
    if(p->s.size >= nunits){
 c55:	e9 36 ff ff ff       	jmp    b90 <malloc+0x30>
 c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c60:	8b 0a                	mov    (%edx),%ecx
 c62:	89 08                	mov    %ecx,(%eax)
 c64:	eb b1                	jmp    c17 <malloc+0xb7>
