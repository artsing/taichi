
build/bin/_mkdir：     文件格式 elf32-i386


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
  11:	57                   	push   %edi
  12:	bf 01 00 00 00       	mov    $0x1,%edi
  17:	56                   	push   %esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 08             	sub    $0x8,%esp
  1d:	8b 59 04             	mov    0x4(%ecx),%ebx
  20:	8b 31                	mov    (%ecx),%esi
  22:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  25:	83 fe 01             	cmp    $0x1,%esi
  28:	7e 3a                	jle    64 <main+0x64>
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 7b 07 00 00       	call   7b5 <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 fd 06 00 00       	call   74d <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 6f 0c 00 00       	push   $0xc6f
  58:	6a 02                	push   $0x2
  5a:	e8 91 08 00 00       	call   8f0 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 58 0c 00 00       	push   $0xc58
  6b:	6a 02                	push   $0x2
  6d:	e8 7e 08 00 00       	call   8f0 <printf>
    exit();
  72:	e8 d6 06 00 00       	call   74d <exit>
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

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	53                   	push   %ebx
  b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  be:	0f b6 01             	movzbl (%ecx),%eax
  c1:	0f b6 1a             	movzbl (%edx),%ebx
  c4:	84 c0                	test   %al,%al
  c6:	75 19                	jne    e1 <strcmp+0x31>
  c8:	eb 26                	jmp    f0 <strcmp+0x40>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  d4:	83 c1 01             	add    $0x1,%ecx
  d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  da:	0f b6 1a             	movzbl (%edx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	38 d8                	cmp    %bl,%al
  e3:	74 eb                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	5b                   	pop    %ebx
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fe:	66 90                	xchg   %ax,%ax

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 10a:	80 3a 00             	cmpb   $0x0,(%edx)
 10d:	74 21                	je     130 <strlen+0x30>
 10f:	31 c0                	xor    %eax,%eax
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 118:	83 c0 01             	add    $0x1,%eax
 11b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 11f:	89 c1                	mov    %eax,%ecx
 121:	75 f5                	jne    118 <strlen+0x18>
    ;
  return n;
}
 123:	89 c8                	mov    %ecx,%eax
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 14b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	89 d7                	mov    %edx,%edi
 153:	fc                   	cld    
 154:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 156:	89 d0                	mov    %edx,%eax
 158:	5f                   	pop    %edi
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 45 08             	mov    0x8(%ebp),%eax
 16a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16e:	0f b6 10             	movzbl (%eax),%edx
 171:	84 d2                	test   %dl,%dl
 173:	75 16                	jne    18b <strchr+0x2b>
 175:	eb 21                	jmp    198 <strchr+0x38>
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax
 180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 184:	83 c0 01             	add    $0x1,%eax
 187:	84 d2                	test   %dl,%dl
 189:	74 0d                	je     198 <strchr+0x38>
    if(*s == c)
 18b:	38 d1                	cmp    %dl,%cl
 18d:	75 f1                	jne    180 <strchr+0x20>
      return (char*)s;
  return 0;
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 198:	31 c0                	xor    %eax,%eax
}
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a9:	31 f6                	xor    %esi,%esi
{
 1ab:	53                   	push   %ebx
 1ac:	89 f3                	mov    %esi,%ebx
 1ae:	83 ec 1c             	sub    $0x1c,%esp
 1b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1b4:	eb 33                	jmp    1e9 <gets+0x49>
 1b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1c6:	6a 01                	push   $0x1
 1c8:	50                   	push   %eax
 1c9:	6a 00                	push   $0x0
 1cb:	e8 95 05 00 00       	call   765 <read>
    if(cc < 1)
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	85 c0                	test   %eax,%eax
 1d5:	7e 1c                	jle    1f3 <gets+0x53>
      break;
    buf[i++] = c;
 1d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1db:	83 c7 01             	add    $0x1,%edi
 1de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1e1:	3c 0a                	cmp    $0xa,%al
 1e3:	74 23                	je     208 <gets+0x68>
 1e5:	3c 0d                	cmp    $0xd,%al
 1e7:	74 1f                	je     208 <gets+0x68>
  for(i=0; i+1 < max; ){
 1e9:	83 c3 01             	add    $0x1,%ebx
 1ec:	89 fe                	mov    %edi,%esi
 1ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f1:	7c cd                	jl     1c0 <gets+0x20>
 1f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1f8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5f                   	pop    %edi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	8b 75 08             	mov    0x8(%ebp),%esi
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	01 de                	add    %ebx,%esi
 210:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 212:	c6 03 00             	movb   $0x0,(%ebx)
}
 215:	8d 65 f4             	lea    -0xc(%ebp),%esp
 218:	5b                   	pop    %ebx
 219:	5e                   	pop    %esi
 21a:	5f                   	pop    %edi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	6a 00                	push   $0x0
 22e:	ff 75 08             	pushl  0x8(%ebp)
 231:	e8 57 05 00 00       	call   78d <open>
  if(fd < 0)
 236:	83 c4 10             	add    $0x10,%esp
 239:	85 c0                	test   %eax,%eax
 23b:	78 2b                	js     268 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 23d:	83 ec 08             	sub    $0x8,%esp
 240:	ff 75 0c             	pushl  0xc(%ebp)
 243:	89 c3                	mov    %eax,%ebx
 245:	50                   	push   %eax
 246:	e8 5a 05 00 00       	call   7a5 <fstat>
  close(fd);
 24b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 24e:	89 c6                	mov    %eax,%esi
  close(fd);
 250:	e8 20 05 00 00       	call   775 <close>
  return r;
 255:	83 c4 10             	add    $0x10,%esp
}
 258:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25b:	89 f0                	mov    %esi,%eax
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 268:	be ff ff ff ff       	mov    $0xffffffff,%esi
 26d:	eb e9                	jmp    258 <stat+0x38>
 26f:	90                   	nop

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27b:	0f be 02             	movsbl (%edx),%eax
 27e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 281:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 284:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 289:	77 1a                	ja     2a5 <atoi+0x35>
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop
    n = n*10 + *s++ - '0';
 290:	83 c2 01             	add    $0x1,%edx
 293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 29a:	0f be 02             	movsbl (%edx),%eax
 29d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
  return n;
}
 2a5:	89 c8                	mov    %ecx,%eax
 2a7:	5b                   	pop    %ebx
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	8b 45 10             	mov    0x10(%ebp),%eax
 2bb:	8b 55 08             	mov    0x8(%ebp),%edx
 2be:	56                   	push   %esi
 2bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c2:	85 c0                	test   %eax,%eax
 2c4:	7e 0f                	jle    2d5 <memmove+0x25>
 2c6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2c8:	89 d7                	mov    %edx,%edi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2d1:	39 f8                	cmp    %edi,%eax
 2d3:	75 fb                	jne    2d0 <memmove+0x20>
  return vdst;
}
 2d5:	5e                   	pop    %esi
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	57                   	push   %edi
 2e8:	56                   	push   %esi
 2e9:	53                   	push   %ebx
 2ea:	83 ec 34             	sub    $0x34,%esp
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2f0:	68 8c 0c 00 00       	push   $0xc8c
hexdump (void *data, size_t size) {
 2f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 2fb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 2fd:	89 c7                	mov    %eax,%edi
 2ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 302:	e8 e9 05 00 00       	call   8f0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 307:	83 c4 10             	add    $0x10,%esp
 30a:	85 ff                	test   %edi,%edi
 30c:	0f 84 2d 01 00 00    	je     43f <hexdump+0x15f>
 312:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 315:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 31c:	be 10 00 00 00       	mov    $0x10,%esi
 321:	83 e8 01             	sub    $0x1,%eax
 324:	83 e0 f0             	and    $0xfffffff0,%eax
 327:	83 c0 10             	add    $0x10,%eax
 32a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 330:	83 ec 08             	sub    $0x8,%esp
 333:	68 e0 0c 00 00       	push   $0xce0
 338:	6a 01                	push   $0x1
 33a:	e8 b1 05 00 00       	call   8f0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 33f:	83 c4 10             	add    $0x10,%esp
 342:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 349:	0f 8e 51 01 00 00    	jle    4a0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 34f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 352:	83 ec 04             	sub    $0x4,%esp
 355:	57                   	push   %edi
 356:	89 fb                	mov    %edi,%ebx
 358:	68 dd 0c 00 00       	push   $0xcdd
 35d:	6a 01                	push   $0x1
 35f:	e8 8c 05 00 00       	call   8f0 <printf>
 364:	89 7d d8             	mov    %edi,-0x28(%ebp)
 367:	83 c4 10             	add    $0x10,%esp
 36a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 36d:	eb 28                	jmp    397 <hexdump+0xb7>
 36f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 370:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 374:	80 fa 0f             	cmp    $0xf,%dl
 377:	0f 86 e3 00 00 00    	jbe    460 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 37d:	83 ec 04             	sub    $0x4,%esp
 380:	83 c3 01             	add    $0x1,%ebx
 383:	52                   	push   %edx
 384:	68 e3 0c 00 00       	push   $0xce3
 389:	6a 01                	push   $0x1
 38b:	e8 60 05 00 00       	call   8f0 <printf>
 390:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 393:	39 f3                	cmp    %esi,%ebx
 395:	74 1e                	je     3b5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 397:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 39a:	7f d4                	jg     370 <hexdump+0x90>
      } else {
        printf(1, "   ");
 39c:	83 ec 08             	sub    $0x8,%esp
 39f:	83 c3 01             	add    $0x1,%ebx
 3a2:	68 e7 0c 00 00       	push   $0xce7
 3a7:	6a 01                	push   $0x1
 3a9:	e8 42 05 00 00       	call   8f0 <printf>
 3ae:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 3b1:	39 f3                	cmp    %esi,%ebx
 3b3:	75 e2                	jne    397 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 3b5:	83 ec 08             	sub    $0x8,%esp
 3b8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 3bb:	68 e0 0c 00 00       	push   $0xce0
 3c0:	6a 01                	push   $0x1
 3c2:	e8 29 05 00 00       	call   8f0 <printf>
 3c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3ca:	83 c4 10             	add    $0x10,%esp
 3cd:	eb 1b                	jmp    3ea <hexdump+0x10a>
 3cf:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	52                   	push   %edx
 3d4:	68 eb 0c 00 00       	push   $0xceb
 3d9:	6a 01                	push   $0x1
 3db:	e8 10 05 00 00       	call   8f0 <printf>
 3e0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 3e3:	83 c3 01             	add    $0x1,%ebx
 3e6:	39 de                	cmp    %ebx,%esi
 3e8:	74 30                	je     41a <hexdump+0x13a>
      if(offset + index < (int)size) {
 3ea:	39 df                	cmp    %ebx,%edi
 3ec:	0f 8e 8e 00 00 00    	jle    480 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 3f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 3f5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 3f9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 3fc:	80 f9 5e             	cmp    $0x5e,%cl
 3ff:	76 cf                	jbe    3d0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 401:	83 ec 08             	sub    $0x8,%esp
 404:	83 c3 01             	add    $0x1,%ebx
 407:	68 ee 0c 00 00       	push   $0xcee
 40c:	6a 01                	push   $0x1
 40e:	e8 dd 04 00 00       	call   8f0 <printf>
 413:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 416:	39 de                	cmp    %ebx,%esi
 418:	75 d0                	jne    3ea <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	83 c6 10             	add    $0x10,%esi
 420:	68 f0 0c 00 00       	push   $0xcf0
 425:	6a 01                	push   $0x1
 427:	e8 c4 04 00 00       	call   8f0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 42c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 430:	83 c4 10             	add    $0x10,%esp
 433:	8b 45 dc             	mov    -0x24(%ebp),%eax
 436:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 439:	0f 85 f1 fe ff ff    	jne    330 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 43f:	c7 45 0c 8c 0c 00 00 	movl   $0xc8c,0xc(%ebp)
 446:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 44d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 450:	5b                   	pop    %ebx
 451:	5e                   	pop    %esi
 452:	5f                   	pop    %edi
 453:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 454:	e9 97 04 00 00       	jmp    8f0 <printf>
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 460:	83 ec 08             	sub    $0x8,%esp
 463:	68 db 0c 00 00       	push   $0xcdb
 468:	6a 01                	push   $0x1
 46a:	e8 81 04 00 00       	call   8f0 <printf>
 46f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 473:	83 c4 10             	add    $0x10,%esp
 476:	e9 02 ff ff ff       	jmp    37d <hexdump+0x9d>
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop
        printf(1, " ");
 480:	83 ec 08             	sub    $0x8,%esp
 483:	68 e9 0c 00 00       	push   $0xce9
 488:	6a 01                	push   $0x1
 48a:	e8 61 04 00 00       	call   8f0 <printf>
 48f:	83 c4 10             	add    $0x10,%esp
 492:	e9 4c ff ff ff       	jmp    3e3 <hexdump+0x103>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 4a0:	83 ec 08             	sub    $0x8,%esp
 4a3:	68 db 0c 00 00       	push   $0xcdb
 4a8:	6a 01                	push   $0x1
 4aa:	e8 41 04 00 00       	call   8f0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 4af:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 4bb:	0f 8f 8e fe ff ff    	jg     34f <hexdump+0x6f>
 4c1:	83 ec 08             	sub    $0x8,%esp
 4c4:	68 db 0c 00 00       	push   $0xcdb
 4c9:	6a 01                	push   $0x1
 4cb:	e8 20 04 00 00       	call   8f0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 4d0:	83 c4 10             	add    $0x10,%esp
 4d3:	83 ff 0f             	cmp    $0xf,%edi
 4d6:	0f 8f 73 fe ff ff    	jg     34f <hexdump+0x6f>
 4dc:	83 ec 08             	sub    $0x8,%esp
 4df:	68 db 0c 00 00       	push   $0xcdb
 4e4:	6a 01                	push   $0x1
 4e6:	e8 05 04 00 00       	call   8f0 <printf>
 4eb:	83 c4 10             	add    $0x10,%esp
 4ee:	e9 5c fe ff ff       	jmp    34f <hexdump+0x6f>
 4f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000500 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
    if (!endian)
 505:	a1 c8 10 00 00       	mov    0x10c8,%eax
{
 50a:	89 e5                	mov    %esp,%ebp
 50c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 50f:	85 c0                	test   %eax,%eax
 511:	75 1d                	jne    530 <hton16+0x30>
        endian = byteorder();
 513:	c7 05 c8 10 00 00 d2 	movl   $0x4d2,0x10c8
 51a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 51d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 51f:	5d                   	pop    %ebp
 520:	66 c1 c2 08          	rol    $0x8,%dx
 524:	89 d0                	mov    %edx,%eax
 526:	c3                   	ret    
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
 530:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 532:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 537:	74 e4                	je     51d <hton16+0x1d>
}
 539:	89 d0                	mov    %edx,%eax
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <ntoh16>:
 540:	f3 0f 1e fb          	endbr32 
 544:	eb ba                	jmp    500 <hton16>
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 550:	f3 0f 1e fb          	endbr32 
 554:	55                   	push   %ebp
    if (!endian)
 555:	8b 15 c8 10 00 00    	mov    0x10c8,%edx
{
 55b:	89 e5                	mov    %esp,%ebp
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 560:	85 d2                	test   %edx,%edx
 562:	75 14                	jne    578 <hton32+0x28>
        endian = byteorder();
 564:	c7 05 c8 10 00 00 d2 	movl   $0x4d2,0x10c8
 56b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 56e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 578:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 57e:	74 ee                	je     56e <hton32+0x1e>
}
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    
 582:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000590 <ntoh32>:
 590:	f3 0f 1e fb          	endbr32 
 594:	eb ba                	jmp    550 <hton32>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi

000005a0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	57                   	push   %edi
 5a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5ab:	56                   	push   %esi
 5ac:	53                   	push   %ebx
 5ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 5b0:	0f b6 01             	movzbl (%ecx),%eax
 5b3:	3c 09                	cmp    $0x9,%al
 5b5:	74 09                	je     5c0 <strtol+0x20>
 5b7:	3c 20                	cmp    $0x20,%al
 5b9:	75 14                	jne    5cf <strtol+0x2f>
 5bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop
 5c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 5c4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 5c7:	3c 20                	cmp    $0x20,%al
 5c9:	74 f5                	je     5c0 <strtol+0x20>
 5cb:	3c 09                	cmp    $0x9,%al
 5cd:	74 f1                	je     5c0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 5cf:	3c 2b                	cmp    $0x2b,%al
 5d1:	0f 84 a9 00 00 00    	je     680 <strtol+0xe0>
    int neg = 0;
 5d7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 5d9:	3c 2d                	cmp    $0x2d,%al
 5db:	0f 84 8f 00 00 00    	je     670 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 5e1:	0f be 11             	movsbl (%ecx),%edx
 5e4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 5ea:	75 12                	jne    5fe <strtol+0x5e>
 5ec:	80 fa 30             	cmp    $0x30,%dl
 5ef:	0f 84 9b 00 00 00    	je     690 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 5f5:	85 db                	test   %ebx,%ebx
 5f7:	75 05                	jne    5fe <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 5f9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 5fe:	89 5d 10             	mov    %ebx,0x10(%ebp)
 601:	31 c0                	xor    %eax,%eax
 603:	eb 17                	jmp    61c <strtol+0x7c>
 605:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 608:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 60b:	3b 55 10             	cmp    0x10(%ebp),%edx
 60e:	7d 28                	jge    638 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 610:	0f af 45 10          	imul   0x10(%ebp),%eax
 614:	83 c1 01             	add    $0x1,%ecx
 617:	01 d0                	add    %edx,%eax
    while (1) {
 619:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 61c:	8d 72 d0             	lea    -0x30(%edx),%esi
 61f:	89 f3                	mov    %esi,%ebx
 621:	80 fb 09             	cmp    $0x9,%bl
 624:	76 e2                	jbe    608 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 626:	8d 72 9f             	lea    -0x61(%edx),%esi
 629:	89 f3                	mov    %esi,%ebx
 62b:	80 fb 19             	cmp    $0x19,%bl
 62e:	77 28                	ja     658 <strtol+0xb8>
            dig = *s - 'a' + 10;
 630:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 633:	3b 55 10             	cmp    0x10(%ebp),%edx
 636:	7c d8                	jl     610 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 638:	8b 55 0c             	mov    0xc(%ebp),%edx
 63b:	85 d2                	test   %edx,%edx
 63d:	74 05                	je     644 <strtol+0xa4>
        *endptr = (char *) s;
 63f:	8b 75 0c             	mov    0xc(%ebp),%esi
 642:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 644:	89 c2                	mov    %eax,%edx
}
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
    return (neg ? -val : val);
 648:	f7 da                	neg    %edx
 64a:	85 ff                	test   %edi,%edi
}
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 64e:	0f 45 c2             	cmovne %edx,%eax
}
 651:	c3                   	ret    
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 658:	8d 72 bf             	lea    -0x41(%edx),%esi
 65b:	89 f3                	mov    %esi,%ebx
 65d:	80 fb 19             	cmp    $0x19,%bl
 660:	77 d6                	ja     638 <strtol+0x98>
            dig = *s - 'A' + 10;
 662:	83 ea 37             	sub    $0x37,%edx
 665:	eb a4                	jmp    60b <strtol+0x6b>
 667:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 670:	83 c1 01             	add    $0x1,%ecx
 673:	bf 01 00 00 00       	mov    $0x1,%edi
 678:	e9 64 ff ff ff       	jmp    5e1 <strtol+0x41>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 680:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 683:	31 ff                	xor    %edi,%edi
 685:	e9 57 ff ff ff       	jmp    5e1 <strtol+0x41>
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 690:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 694:	3c 78                	cmp    $0x78,%al
 696:	74 18                	je     6b0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 698:	85 db                	test   %ebx,%ebx
 69a:	0f 85 5e ff ff ff    	jne    5fe <strtol+0x5e>
        s++, base = 8;
 6a0:	83 c1 01             	add    $0x1,%ecx
 6a3:	0f be d0             	movsbl %al,%edx
 6a6:	bb 08 00 00 00       	mov    $0x8,%ebx
 6ab:	e9 4e ff ff ff       	jmp    5fe <strtol+0x5e>
        s += 2, base = 16;
 6b0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 6b4:	bb 10 00 00 00       	mov    $0x10,%ebx
 6b9:	83 c1 02             	add    $0x2,%ecx
 6bc:	e9 3d ff ff ff       	jmp    5fe <strtol+0x5e>
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop

000006d0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 6d8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 6da:	56                   	push   %esi
 6db:	53                   	push   %ebx
 6dc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 6df:	83 ec 1c             	sub    $0x1c,%esp
 6e2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 6e5:	83 ec 04             	sub    $0x4,%esp
 6e8:	6a 0a                	push   $0xa
 6ea:	53                   	push   %ebx
 6eb:	56                   	push   %esi
 6ec:	e8 af fe ff ff       	call   5a0 <strtol>
        if (ret < 0 || ret > 255) {
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	3d ff 00 00 00       	cmp    $0xff,%eax
 6f9:	77 3d                	ja     738 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 6fb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 6fe:	39 f1                	cmp    %esi,%ecx
 700:	74 36                	je     738 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 702:	0f b6 11             	movzbl (%ecx),%edx
 705:	83 ff 03             	cmp    $0x3,%edi
 708:	74 16                	je     720 <ip_addr_pton+0x50>
 70a:	80 fa 2e             	cmp    $0x2e,%dl
 70d:	75 29                	jne    738 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 70f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 712:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 715:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 718:	83 c7 01             	add    $0x1,%edi
 71b:	eb c8                	jmp    6e5 <ip_addr_pton+0x15>
 71d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 720:	84 d2                	test   %dl,%dl
 722:	75 14                	jne    738 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 724:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 727:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 72a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 72d:	31 c0                	xor    %eax,%eax
}
 72f:	5b                   	pop    %ebx
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret    
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 738:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 73b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 740:	5b                   	pop    %ebx
 741:	5e                   	pop    %esi
 742:	5f                   	pop    %edi
 743:	5d                   	pop    %ebp
 744:	c3                   	ret    

00000745 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 745:	b8 01 00 00 00       	mov    $0x1,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <exit>:
SYSCALL(exit)
 74d:	b8 02 00 00 00       	mov    $0x2,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <wait>:
SYSCALL(wait)
 755:	b8 03 00 00 00       	mov    $0x3,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <pipe>:
SYSCALL(pipe)
 75d:	b8 04 00 00 00       	mov    $0x4,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <read>:
SYSCALL(read)
 765:	b8 05 00 00 00       	mov    $0x5,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <write>:
SYSCALL(write)
 76d:	b8 10 00 00 00       	mov    $0x10,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <close>:
SYSCALL(close)
 775:	b8 15 00 00 00       	mov    $0x15,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <kill>:
SYSCALL(kill)
 77d:	b8 06 00 00 00       	mov    $0x6,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <exec>:
SYSCALL(exec)
 785:	b8 07 00 00 00       	mov    $0x7,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <open>:
SYSCALL(open)
 78d:	b8 0f 00 00 00       	mov    $0xf,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <mknod>:
SYSCALL(mknod)
 795:	b8 11 00 00 00       	mov    $0x11,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <unlink>:
SYSCALL(unlink)
 79d:	b8 12 00 00 00       	mov    $0x12,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <fstat>:
SYSCALL(fstat)
 7a5:	b8 08 00 00 00       	mov    $0x8,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <link>:
SYSCALL(link)
 7ad:	b8 13 00 00 00       	mov    $0x13,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <mkdir>:
SYSCALL(mkdir)
 7b5:	b8 14 00 00 00       	mov    $0x14,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <chdir>:
SYSCALL(chdir)
 7bd:	b8 09 00 00 00       	mov    $0x9,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <dup>:
SYSCALL(dup)
 7c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <getpid>:
SYSCALL(getpid)
 7cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <sbrk>:
SYSCALL(sbrk)
 7d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <sleep>:
SYSCALL(sleep)
 7dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <uptime>:
SYSCALL(uptime)
 7e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <ioctl>:
# iotcl
SYSCALL(ioctl)
 7ed:	b8 16 00 00 00       	mov    $0x16,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <socket>:
# socket
SYSCALL(socket)
 7f5:	b8 17 00 00 00       	mov    $0x17,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <bind>:
SYSCALL(bind)
 7fd:	b8 19 00 00 00       	mov    $0x19,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <listen>:
SYSCALL(listen)
 805:	b8 1a 00 00 00       	mov    $0x1a,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <accept>:
SYSCALL(accept)
 80d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <recv>:
SYSCALL(recv)
 815:	b8 1c 00 00 00       	mov    $0x1c,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <send>:
SYSCALL(send)
 81d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <recvfrom>:
SYSCALL(recvfrom)
 825:	b8 1e 00 00 00       	mov    $0x1e,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <sendto>:
SYSCALL(sendto)
 82d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    
 835:	66 90                	xchg   %ax,%ax
 837:	66 90                	xchg   %ax,%ax
 839:	66 90                	xchg   %ax,%ax
 83b:	66 90                	xchg   %ax,%ax
 83d:	66 90                	xchg   %ax,%ax
 83f:	90                   	nop

00000840 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	57                   	push   %edi
 844:	56                   	push   %esi
 845:	53                   	push   %ebx
 846:	83 ec 3c             	sub    $0x3c,%esp
 849:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 84c:	89 d1                	mov    %edx,%ecx
{
 84e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 851:	85 d2                	test   %edx,%edx
 853:	0f 89 7f 00 00 00    	jns    8d8 <printint+0x98>
 859:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 85d:	74 79                	je     8d8 <printint+0x98>
    neg = 1;
 85f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 866:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 868:	31 db                	xor    %ebx,%ebx
 86a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 86d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 870:	89 c8                	mov    %ecx,%eax
 872:	31 d2                	xor    %edx,%edx
 874:	89 cf                	mov    %ecx,%edi
 876:	f7 75 c4             	divl   -0x3c(%ebp)
 879:	0f b6 92 fc 0c 00 00 	movzbl 0xcfc(%edx),%edx
 880:	89 45 c0             	mov    %eax,-0x40(%ebp)
 883:	89 d8                	mov    %ebx,%eax
 885:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 888:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 88b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 88e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 891:	76 dd                	jbe    870 <printint+0x30>
  if(neg)
 893:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 896:	85 c9                	test   %ecx,%ecx
 898:	74 0c                	je     8a6 <printint+0x66>
    buf[i++] = '-';
 89a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 89f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8ad:	eb 07                	jmp    8b6 <printint+0x76>
 8af:	90                   	nop
 8b0:	0f b6 13             	movzbl (%ebx),%edx
 8b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8b6:	83 ec 04             	sub    $0x4,%esp
 8b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8bc:	6a 01                	push   $0x1
 8be:	56                   	push   %esi
 8bf:	57                   	push   %edi
 8c0:	e8 a8 fe ff ff       	call   76d <write>
  while(--i >= 0)
 8c5:	83 c4 10             	add    $0x10,%esp
 8c8:	39 de                	cmp    %ebx,%esi
 8ca:	75 e4                	jne    8b0 <printint+0x70>
    putc(fd, buf[i]);
}
 8cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8cf:	5b                   	pop    %ebx
 8d0:	5e                   	pop    %esi
 8d1:	5f                   	pop    %edi
 8d2:	5d                   	pop    %ebp
 8d3:	c3                   	ret    
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8df:	eb 87                	jmp    868 <printint+0x28>
 8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ef:	90                   	nop

000008f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8f0:	f3 0f 1e fb          	endbr32 
 8f4:	55                   	push   %ebp
 8f5:	89 e5                	mov    %esp,%ebp
 8f7:	57                   	push   %edi
 8f8:	56                   	push   %esi
 8f9:	53                   	push   %ebx
 8fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 900:	0f b6 1e             	movzbl (%esi),%ebx
 903:	84 db                	test   %bl,%bl
 905:	0f 84 b4 00 00 00    	je     9bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 90b:	8d 45 10             	lea    0x10(%ebp),%eax
 90e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 911:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 914:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 916:	89 45 d0             	mov    %eax,-0x30(%ebp)
 919:	eb 33                	jmp    94e <printf+0x5e>
 91b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 91f:	90                   	nop
 920:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 923:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 928:	83 f8 25             	cmp    $0x25,%eax
 92b:	74 17                	je     944 <printf+0x54>
  write(fd, &c, 1);
 92d:	83 ec 04             	sub    $0x4,%esp
 930:	88 5d e7             	mov    %bl,-0x19(%ebp)
 933:	6a 01                	push   $0x1
 935:	57                   	push   %edi
 936:	ff 75 08             	pushl  0x8(%ebp)
 939:	e8 2f fe ff ff       	call   76d <write>
 93e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 941:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 944:	0f b6 1e             	movzbl (%esi),%ebx
 947:	83 c6 01             	add    $0x1,%esi
 94a:	84 db                	test   %bl,%bl
 94c:	74 71                	je     9bf <printf+0xcf>
    c = fmt[i] & 0xff;
 94e:	0f be cb             	movsbl %bl,%ecx
 951:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 954:	85 d2                	test   %edx,%edx
 956:	74 c8                	je     920 <printf+0x30>
      }
    } else if(state == '%'){
 958:	83 fa 25             	cmp    $0x25,%edx
 95b:	75 e7                	jne    944 <printf+0x54>
      if(c == 'd'){
 95d:	83 f8 64             	cmp    $0x64,%eax
 960:	0f 84 9a 00 00 00    	je     a00 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 966:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 96c:	83 f9 70             	cmp    $0x70,%ecx
 96f:	74 5f                	je     9d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 971:	83 f8 73             	cmp    $0x73,%eax
 974:	0f 84 d6 00 00 00    	je     a50 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 97a:	83 f8 63             	cmp    $0x63,%eax
 97d:	0f 84 8d 00 00 00    	je     a10 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 983:	83 f8 25             	cmp    $0x25,%eax
 986:	0f 84 b4 00 00 00    	je     a40 <printf+0x150>
  write(fd, &c, 1);
 98c:	83 ec 04             	sub    $0x4,%esp
 98f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 993:	6a 01                	push   $0x1
 995:	57                   	push   %edi
 996:	ff 75 08             	pushl  0x8(%ebp)
 999:	e8 cf fd ff ff       	call   76d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 99e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9a1:	83 c4 0c             	add    $0xc,%esp
 9a4:	6a 01                	push   $0x1
 9a6:	83 c6 01             	add    $0x1,%esi
 9a9:	57                   	push   %edi
 9aa:	ff 75 08             	pushl  0x8(%ebp)
 9ad:	e8 bb fd ff ff       	call   76d <write>
  for(i = 0; fmt[i]; i++){
 9b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 9b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 9b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 9bb:	84 db                	test   %bl,%bl
 9bd:	75 8f                	jne    94e <printf+0x5e>
    }
  }
}
 9bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9c2:	5b                   	pop    %ebx
 9c3:	5e                   	pop    %esi
 9c4:	5f                   	pop    %edi
 9c5:	5d                   	pop    %ebp
 9c6:	c3                   	ret    
 9c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9d8:	6a 00                	push   $0x0
 9da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
 9e0:	8b 13                	mov    (%ebx),%edx
 9e2:	e8 59 fe ff ff       	call   840 <printint>
        ap++;
 9e7:	89 d8                	mov    %ebx,%eax
 9e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ec:	31 d2                	xor    %edx,%edx
        ap++;
 9ee:	83 c0 04             	add    $0x4,%eax
 9f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9f4:	e9 4b ff ff ff       	jmp    944 <printf+0x54>
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a00:	83 ec 0c             	sub    $0xc,%esp
 a03:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a08:	6a 01                	push   $0x1
 a0a:	eb ce                	jmp    9da <printf+0xea>
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a10:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a13:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a16:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a18:	6a 01                	push   $0x1
        ap++;
 a1a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a1d:	57                   	push   %edi
 a1e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a21:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a24:	e8 44 fd ff ff       	call   76d <write>
        ap++;
 a29:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a2c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a2f:	31 d2                	xor    %edx,%edx
 a31:	e9 0e ff ff ff       	jmp    944 <printf+0x54>
 a36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 a40:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a43:	83 ec 04             	sub    $0x4,%esp
 a46:	e9 59 ff ff ff       	jmp    9a4 <printf+0xb4>
 a4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a4f:	90                   	nop
        s = (char*)*ap;
 a50:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a53:	8b 18                	mov    (%eax),%ebx
        ap++;
 a55:	83 c0 04             	add    $0x4,%eax
 a58:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a5b:	85 db                	test   %ebx,%ebx
 a5d:	74 17                	je     a76 <printf+0x186>
        while(*s != 0){
 a5f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a62:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a64:	84 c0                	test   %al,%al
 a66:	0f 84 d8 fe ff ff    	je     944 <printf+0x54>
 a6c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a6f:	89 de                	mov    %ebx,%esi
 a71:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a74:	eb 1a                	jmp    a90 <printf+0x1a0>
          s = "(null)";
 a76:	bb f4 0c 00 00       	mov    $0xcf4,%ebx
        while(*s != 0){
 a7b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a7e:	b8 28 00 00 00       	mov    $0x28,%eax
 a83:	89 de                	mov    %ebx,%esi
 a85:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
  write(fd, &c, 1);
 a90:	83 ec 04             	sub    $0x4,%esp
          s++;
 a93:	83 c6 01             	add    $0x1,%esi
 a96:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a99:	6a 01                	push   $0x1
 a9b:	57                   	push   %edi
 a9c:	53                   	push   %ebx
 a9d:	e8 cb fc ff ff       	call   76d <write>
        while(*s != 0){
 aa2:	0f b6 06             	movzbl (%esi),%eax
 aa5:	83 c4 10             	add    $0x10,%esp
 aa8:	84 c0                	test   %al,%al
 aaa:	75 e4                	jne    a90 <printf+0x1a0>
 aac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 aaf:	31 d2                	xor    %edx,%edx
 ab1:	e9 8e fe ff ff       	jmp    944 <printf+0x54>
 ab6:	66 90                	xchg   %ax,%ax
 ab8:	66 90                	xchg   %ax,%ax
 aba:	66 90                	xchg   %ax,%ax
 abc:	66 90                	xchg   %ax,%ax
 abe:	66 90                	xchg   %ax,%ax

00000ac0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac0:	f3 0f 1e fb          	endbr32 
 ac4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac5:	a1 cc 10 00 00       	mov    0x10cc,%eax
{
 aca:	89 e5                	mov    %esp,%ebp
 acc:	57                   	push   %edi
 acd:	56                   	push   %esi
 ace:	53                   	push   %ebx
 acf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ad2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 ad4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad7:	39 c8                	cmp    %ecx,%eax
 ad9:	73 15                	jae    af0 <free+0x30>
 adb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 adf:	90                   	nop
 ae0:	39 d1                	cmp    %edx,%ecx
 ae2:	72 14                	jb     af8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae4:	39 d0                	cmp    %edx,%eax
 ae6:	73 10                	jae    af8 <free+0x38>
{
 ae8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aea:	8b 10                	mov    (%eax),%edx
 aec:	39 c8                	cmp    %ecx,%eax
 aee:	72 f0                	jb     ae0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af0:	39 d0                	cmp    %edx,%eax
 af2:	72 f4                	jb     ae8 <free+0x28>
 af4:	39 d1                	cmp    %edx,%ecx
 af6:	73 f0                	jae    ae8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 af8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 afb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 afe:	39 fa                	cmp    %edi,%edx
 b00:	74 1e                	je     b20 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b02:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b05:	8b 50 04             	mov    0x4(%eax),%edx
 b08:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b0b:	39 f1                	cmp    %esi,%ecx
 b0d:	74 28                	je     b37 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b0f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 b11:	5b                   	pop    %ebx
  freep = p;
 b12:	a3 cc 10 00 00       	mov    %eax,0x10cc
}
 b17:	5e                   	pop    %esi
 b18:	5f                   	pop    %edi
 b19:	5d                   	pop    %ebp
 b1a:	c3                   	ret    
 b1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 b20:	03 72 04             	add    0x4(%edx),%esi
 b23:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b26:	8b 10                	mov    (%eax),%edx
 b28:	8b 12                	mov    (%edx),%edx
 b2a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b2d:	8b 50 04             	mov    0x4(%eax),%edx
 b30:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b33:	39 f1                	cmp    %esi,%ecx
 b35:	75 d8                	jne    b0f <free+0x4f>
    p->s.size += bp->s.size;
 b37:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b3a:	a3 cc 10 00 00       	mov    %eax,0x10cc
    p->s.size += bp->s.size;
 b3f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b42:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b45:	89 10                	mov    %edx,(%eax)
}
 b47:	5b                   	pop    %ebx
 b48:	5e                   	pop    %esi
 b49:	5f                   	pop    %edi
 b4a:	5d                   	pop    %ebp
 b4b:	c3                   	ret    
 b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b50:	f3 0f 1e fb          	endbr32 
 b54:	55                   	push   %ebp
 b55:	89 e5                	mov    %esp,%ebp
 b57:	57                   	push   %edi
 b58:	56                   	push   %esi
 b59:	53                   	push   %ebx
 b5a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b5d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b60:	8b 3d cc 10 00 00    	mov    0x10cc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b66:	8d 70 07             	lea    0x7(%eax),%esi
 b69:	c1 ee 03             	shr    $0x3,%esi
 b6c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b6f:	85 ff                	test   %edi,%edi
 b71:	0f 84 a9 00 00 00    	je     c20 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b77:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b79:	8b 48 04             	mov    0x4(%eax),%ecx
 b7c:	39 f1                	cmp    %esi,%ecx
 b7e:	73 6d                	jae    bed <malloc+0x9d>
 b80:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b86:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b8b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b8e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 b95:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 b98:	eb 17                	jmp    bb1 <malloc+0x61>
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 ba2:	8b 4a 04             	mov    0x4(%edx),%ecx
 ba5:	39 f1                	cmp    %esi,%ecx
 ba7:	73 4f                	jae    bf8 <malloc+0xa8>
 ba9:	8b 3d cc 10 00 00    	mov    0x10cc,%edi
 baf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bb1:	39 c7                	cmp    %eax,%edi
 bb3:	75 eb                	jne    ba0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 bb5:	83 ec 0c             	sub    $0xc,%esp
 bb8:	ff 75 e4             	pushl  -0x1c(%ebp)
 bbb:	e8 15 fc ff ff       	call   7d5 <sbrk>
  if(p == (char*)-1)
 bc0:	83 c4 10             	add    $0x10,%esp
 bc3:	83 f8 ff             	cmp    $0xffffffff,%eax
 bc6:	74 1b                	je     be3 <malloc+0x93>
  hp->s.size = nu;
 bc8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bcb:	83 ec 0c             	sub    $0xc,%esp
 bce:	83 c0 08             	add    $0x8,%eax
 bd1:	50                   	push   %eax
 bd2:	e8 e9 fe ff ff       	call   ac0 <free>
  return freep;
 bd7:	a1 cc 10 00 00       	mov    0x10cc,%eax
      if((p = morecore(nunits)) == 0)
 bdc:	83 c4 10             	add    $0x10,%esp
 bdf:	85 c0                	test   %eax,%eax
 be1:	75 bd                	jne    ba0 <malloc+0x50>
        return 0;
  }
}
 be3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 be6:	31 c0                	xor    %eax,%eax
}
 be8:	5b                   	pop    %ebx
 be9:	5e                   	pop    %esi
 bea:	5f                   	pop    %edi
 beb:	5d                   	pop    %ebp
 bec:	c3                   	ret    
    if(p->s.size >= nunits){
 bed:	89 c2                	mov    %eax,%edx
 bef:	89 f8                	mov    %edi,%eax
 bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 bf8:	39 ce                	cmp    %ecx,%esi
 bfa:	74 54                	je     c50 <malloc+0x100>
        p->s.size -= nunits;
 bfc:	29 f1                	sub    %esi,%ecx
 bfe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c01:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c04:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c07:	a3 cc 10 00 00       	mov    %eax,0x10cc
}
 c0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c0f:	8d 42 08             	lea    0x8(%edx),%eax
}
 c12:	5b                   	pop    %ebx
 c13:	5e                   	pop    %esi
 c14:	5f                   	pop    %edi
 c15:	5d                   	pop    %ebp
 c16:	c3                   	ret    
 c17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c1e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 c20:	c7 05 cc 10 00 00 d0 	movl   $0x10d0,0x10cc
 c27:	10 00 00 
    base.s.size = 0;
 c2a:	bf d0 10 00 00       	mov    $0x10d0,%edi
    base.s.ptr = freep = prevp = &base;
 c2f:	c7 05 d0 10 00 00 d0 	movl   $0x10d0,0x10d0
 c36:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c39:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 c3b:	c7 05 d4 10 00 00 00 	movl   $0x0,0x10d4
 c42:	00 00 00 
    if(p->s.size >= nunits){
 c45:	e9 36 ff ff ff       	jmp    b80 <malloc+0x30>
 c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c50:	8b 0a                	mov    (%edx),%ecx
 c52:	89 08                	mov    %ecx,(%eax)
 c54:	eb b1                	jmp    c07 <malloc+0xb7>
