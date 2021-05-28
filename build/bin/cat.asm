
build/bin/_cat：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

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
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 50                	jle    7d <main+0x7d>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 e1 07 00 00       	call   81d <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 a9 07 00 00       	call   805 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 74 07 00 00       	call   7dd <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 0b 0d 00 00       	push   $0xd0b
  71:	6a 01                	push   $0x1
  73:	e8 08 09 00 00       	call   980 <printf>
      exit();
  78:	e8 60 07 00 00       	call   7dd <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 51 07 00 00       	call   7dd <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	56                   	push   %esi
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  9b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9c:	eb 19                	jmp    b7 <cat+0x27>
  9e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 c0 11 00 00       	push   $0x11c0
  a9:	6a 01                	push   $0x1
  ab:	e8 4d 07 00 00       	call   7fd <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 c0 11 00 00       	push   $0x11c0
  c4:	56                   	push   %esi
  c5:	e8 2b 07 00 00       	call   7f5 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 e8 0c 00 00       	push   $0xce8
  e4:	6a 01                	push   $0x1
  e6:	e8 95 08 00 00       	call   980 <printf>
      exit();
  eb:	e8 ed 06 00 00       	call   7dd <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 fa 0c 00 00       	push   $0xcfa
  f7:	6a 01                	push   $0x1
  f9:	e8 82 08 00 00       	call   980 <printf>
    exit();
  fe:	e8 da 06 00 00       	call   7dd <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 115:	31 c0                	xor    %eax,%eax
{
 117:	89 e5                	mov    %esp,%ebp
 119:	53                   	push   %ebx
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14e:	0f b6 01             	movzbl (%ecx),%eax
 151:	0f b6 1a             	movzbl (%edx),%ebx
 154:	84 c0                	test   %al,%al
 156:	75 19                	jne    171 <strcmp+0x31>
 158:	eb 26                	jmp    180 <strcmp+0x40>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 3a 00             	cmpb   $0x0,(%edx)
 19d:	74 21                	je     1c0 <strlen+0x30>
 19f:	31 c0                	xor    %eax,%eax
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1af:	89 c1                	mov    %eax,%ecx
 1b1:	75 f5                	jne    1a8 <strlen+0x18>
    ;
  return n;
}
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 d7                	mov    %edx,%edi
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	0f b6 10             	movzbl (%eax),%edx
 201:	84 d2                	test   %dl,%dl
 203:	75 16                	jne    21b <strchr+0x2b>
 205:	eb 21                	jmp    228 <strchr+0x38>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 f6                	xor    %esi,%esi
{
 23b:	53                   	push   %ebx
 23c:	89 f3                	mov    %esi,%ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
 241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 244:	eb 33                	jmp    279 <gets+0x49>
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 45 e7             	lea    -0x19(%ebp),%eax
 256:	6a 01                	push   $0x1
 258:	50                   	push   %eax
 259:	6a 00                	push   $0x0
 25b:	e8 95 05 00 00       	call   7f5 <read>
    if(cc < 1)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	7e 1c                	jle    283 <gets+0x53>
      break;
    buf[i++] = c;
 267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26b:	83 c7 01             	add    $0x1,%edi
 26e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 23                	je     298 <gets+0x68>
 275:	3c 0d                	cmp    $0xd,%al
 277:	74 1f                	je     298 <gets+0x68>
  for(i=0; i+1 < max; ){
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	89 fe                	mov    %edi,%esi
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7c cd                	jl     250 <gets+0x20>
 283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 288:	c6 03 00             	movb   $0x0,(%ebx)
}
 28b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5f                   	pop    %edi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	8b 75 08             	mov    0x8(%ebp),%esi
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	01 de                	add    %ebx,%esi
 2a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 57 05 00 00       	call   81d <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 2b                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2cd:	83 ec 08             	sub    $0x8,%esp
 2d0:	ff 75 0c             	pushl  0xc(%ebp)
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	50                   	push   %eax
 2d6:	e8 5a 05 00 00       	call   835 <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 20 05 00 00       	call   805 <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb e9                	jmp    2e8 <stat+0x38>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	53                   	push   %ebx
 308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30b:	0f be 02             	movsbl (%edx),%eax
 30e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 319:	77 1a                	ja     335 <atoi+0x35>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	89 c8                	mov    %ecx,%eax
 337:	5b                   	pop    %ebx
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
 34e:	56                   	push   %esi
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 0f                	jle    365 <memmove+0x25>
 356:	01 d0                	add    %edx,%eax
  dst = vdst;
 358:	89 d7                	mov    %edx,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	56                   	push   %esi
 379:	53                   	push   %ebx
 37a:	83 ec 34             	sub    $0x34,%esp
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 380:	68 20 0d 00 00       	push   $0xd20
hexdump (void *data, size_t size) {
 385:	89 45 e0             	mov    %eax,-0x20(%ebp)
 388:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 38b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 38d:	89 c7                	mov    %eax,%edi
 38f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 392:	e8 e9 05 00 00       	call   980 <printf>
  for (offset = 0; offset < size; offset += 16) {
 397:	83 c4 10             	add    $0x10,%esp
 39a:	85 ff                	test   %edi,%edi
 39c:	0f 84 2d 01 00 00    	je     4cf <hexdump+0x15f>
 3a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 3a5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 3ac:	be 10 00 00 00       	mov    $0x10,%esi
 3b1:	83 e8 01             	sub    $0x1,%eax
 3b4:	83 e0 f0             	and    $0xfffffff0,%eax
 3b7:	83 c0 10             	add    $0x10,%eax
 3ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 3c0:	83 ec 08             	sub    $0x8,%esp
 3c3:	68 74 0d 00 00       	push   $0xd74
 3c8:	6a 01                	push   $0x1
 3ca:	e8 b1 05 00 00       	call   980 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 3cf:	83 c4 10             	add    $0x10,%esp
 3d2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 3d9:	0f 8e 51 01 00 00    	jle    530 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 3df:	8b 7d dc             	mov    -0x24(%ebp),%edi
 3e2:	83 ec 04             	sub    $0x4,%esp
 3e5:	57                   	push   %edi
 3e6:	89 fb                	mov    %edi,%ebx
 3e8:	68 71 0d 00 00       	push   $0xd71
 3ed:	6a 01                	push   $0x1
 3ef:	e8 8c 05 00 00       	call   980 <printf>
 3f4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	8b 7d e0             	mov    -0x20(%ebp),%edi
 3fd:	eb 28                	jmp    427 <hexdump+0xb7>
 3ff:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 400:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 404:	80 fa 0f             	cmp    $0xf,%dl
 407:	0f 86 e3 00 00 00    	jbe    4f0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 40d:	83 ec 04             	sub    $0x4,%esp
 410:	83 c3 01             	add    $0x1,%ebx
 413:	52                   	push   %edx
 414:	68 77 0d 00 00       	push   $0xd77
 419:	6a 01                	push   $0x1
 41b:	e8 60 05 00 00       	call   980 <printf>
 420:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 423:	39 f3                	cmp    %esi,%ebx
 425:	74 1e                	je     445 <hexdump+0xd5>
      if(offset + index < (int)size) {
 427:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 42a:	7f d4                	jg     400 <hexdump+0x90>
      } else {
        printf(1, "   ");
 42c:	83 ec 08             	sub    $0x8,%esp
 42f:	83 c3 01             	add    $0x1,%ebx
 432:	68 7b 0d 00 00       	push   $0xd7b
 437:	6a 01                	push   $0x1
 439:	e8 42 05 00 00       	call   980 <printf>
 43e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 441:	39 f3                	cmp    %esi,%ebx
 443:	75 e2                	jne    427 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 445:	83 ec 08             	sub    $0x8,%esp
 448:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 44b:	68 74 0d 00 00       	push   $0xd74
 450:	6a 01                	push   $0x1
 452:	e8 29 05 00 00       	call   980 <printf>
 457:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45a:	83 c4 10             	add    $0x10,%esp
 45d:	eb 1b                	jmp    47a <hexdump+0x10a>
 45f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	52                   	push   %edx
 464:	68 7f 0d 00 00       	push   $0xd7f
 469:	6a 01                	push   $0x1
 46b:	e8 10 05 00 00       	call   980 <printf>
 470:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 473:	83 c3 01             	add    $0x1,%ebx
 476:	39 de                	cmp    %ebx,%esi
 478:	74 30                	je     4aa <hexdump+0x13a>
      if(offset + index < (int)size) {
 47a:	39 df                	cmp    %ebx,%edi
 47c:	0f 8e 8e 00 00 00    	jle    510 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 482:	8b 45 e0             	mov    -0x20(%ebp),%eax
 485:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 489:	8d 4a e0             	lea    -0x20(%edx),%ecx
 48c:	80 f9 5e             	cmp    $0x5e,%cl
 48f:	76 cf                	jbe    460 <hexdump+0xf0>
        } else {
          printf(1, ".");
 491:	83 ec 08             	sub    $0x8,%esp
 494:	83 c3 01             	add    $0x1,%ebx
 497:	68 82 0d 00 00       	push   $0xd82
 49c:	6a 01                	push   $0x1
 49e:	e8 dd 04 00 00       	call   980 <printf>
 4a3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4a6:	39 de                	cmp    %ebx,%esi
 4a8:	75 d0                	jne    47a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 4aa:	83 ec 08             	sub    $0x8,%esp
 4ad:	83 c6 10             	add    $0x10,%esi
 4b0:	68 84 0d 00 00       	push   $0xd84
 4b5:	6a 01                	push   $0x1
 4b7:	e8 c4 04 00 00       	call   980 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4bc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 4c0:	83 c4 10             	add    $0x10,%esp
 4c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 4c6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 4c9:	0f 85 f1 fe ff ff    	jne    3c0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4cf:	c7 45 0c 20 0d 00 00 	movl   $0xd20,0xc(%ebp)
 4d6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 4dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5f                   	pop    %edi
 4e3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4e4:	e9 97 04 00 00       	jmp    980 <printf>
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	68 6f 0d 00 00       	push   $0xd6f
 4f8:	6a 01                	push   $0x1
 4fa:	e8 81 04 00 00       	call   980 <printf>
 4ff:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 503:	83 c4 10             	add    $0x10,%esp
 506:	e9 02 ff ff ff       	jmp    40d <hexdump+0x9d>
 50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop
        printf(1, " ");
 510:	83 ec 08             	sub    $0x8,%esp
 513:	68 7d 0d 00 00       	push   $0xd7d
 518:	6a 01                	push   $0x1
 51a:	e8 61 04 00 00       	call   980 <printf>
 51f:	83 c4 10             	add    $0x10,%esp
 522:	e9 4c ff ff ff       	jmp    473 <hexdump+0x103>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 530:	83 ec 08             	sub    $0x8,%esp
 533:	68 6f 0d 00 00       	push   $0xd6f
 538:	6a 01                	push   $0x1
 53a:	e8 41 04 00 00       	call   980 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 53f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 542:	83 c4 10             	add    $0x10,%esp
 545:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 54b:	0f 8f 8e fe ff ff    	jg     3df <hexdump+0x6f>
 551:	83 ec 08             	sub    $0x8,%esp
 554:	68 6f 0d 00 00       	push   $0xd6f
 559:	6a 01                	push   $0x1
 55b:	e8 20 04 00 00       	call   980 <printf>
    if (offset <= 0x000f) printf(1, "0");
 560:	83 c4 10             	add    $0x10,%esp
 563:	83 ff 0f             	cmp    $0xf,%edi
 566:	0f 8f 73 fe ff ff    	jg     3df <hexdump+0x6f>
 56c:	83 ec 08             	sub    $0x8,%esp
 56f:	68 6f 0d 00 00       	push   $0xd6f
 574:	6a 01                	push   $0x1
 576:	e8 05 04 00 00       	call   980 <printf>
 57b:	83 c4 10             	add    $0x10,%esp
 57e:	e9 5c fe ff ff       	jmp    3df <hexdump+0x6f>
 583:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000590 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
    if (!endian)
 595:	a1 a0 11 00 00       	mov    0x11a0,%eax
{
 59a:	89 e5                	mov    %esp,%ebp
 59c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 59f:	85 c0                	test   %eax,%eax
 5a1:	75 1d                	jne    5c0 <hton16+0x30>
        endian = byteorder();
 5a3:	c7 05 a0 11 00 00 d2 	movl   $0x4d2,0x11a0
 5aa:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 5ad:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 5af:	5d                   	pop    %ebp
 5b0:	66 c1 c2 08          	rol    $0x8,%dx
 5b4:	89 d0                	mov    %edx,%eax
 5b6:	c3                   	ret    
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
 5c0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 5c2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 5c7:	74 e4                	je     5ad <hton16+0x1d>
}
 5c9:	89 d0                	mov    %edx,%eax
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
 5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <ntoh16>:
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	eb ba                	jmp    590 <hton16>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi

000005e0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
    if (!endian)
 5e5:	8b 15 a0 11 00 00    	mov    0x11a0,%edx
{
 5eb:	89 e5                	mov    %esp,%ebp
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 5f0:	85 d2                	test   %edx,%edx
 5f2:	75 14                	jne    608 <hton32+0x28>
        endian = byteorder();
 5f4:	c7 05 a0 11 00 00 d2 	movl   $0x4d2,0x11a0
 5fb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 5fe:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 600:	5d                   	pop    %ebp
 601:	c3                   	ret    
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 608:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 60e:	74 ee                	je     5fe <hton32+0x1e>
}
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
 612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000620 <ntoh32>:
 620:	f3 0f 1e fb          	endbr32 
 624:	eb ba                	jmp    5e0 <hton32>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi

00000630 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	57                   	push   %edi
 638:	8b 4d 08             	mov    0x8(%ebp),%ecx
 63b:	56                   	push   %esi
 63c:	53                   	push   %ebx
 63d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 640:	0f b6 01             	movzbl (%ecx),%eax
 643:	3c 09                	cmp    $0x9,%al
 645:	74 09                	je     650 <strtol+0x20>
 647:	3c 20                	cmp    $0x20,%al
 649:	75 14                	jne    65f <strtol+0x2f>
 64b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
 650:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 654:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 657:	3c 20                	cmp    $0x20,%al
 659:	74 f5                	je     650 <strtol+0x20>
 65b:	3c 09                	cmp    $0x9,%al
 65d:	74 f1                	je     650 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 65f:	3c 2b                	cmp    $0x2b,%al
 661:	0f 84 a9 00 00 00    	je     710 <strtol+0xe0>
    int neg = 0;
 667:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 669:	3c 2d                	cmp    $0x2d,%al
 66b:	0f 84 8f 00 00 00    	je     700 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 671:	0f be 11             	movsbl (%ecx),%edx
 674:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 67a:	75 12                	jne    68e <strtol+0x5e>
 67c:	80 fa 30             	cmp    $0x30,%dl
 67f:	0f 84 9b 00 00 00    	je     720 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 685:	85 db                	test   %ebx,%ebx
 687:	75 05                	jne    68e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 689:	bb 0a 00 00 00       	mov    $0xa,%ebx
 68e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 691:	31 c0                	xor    %eax,%eax
 693:	eb 17                	jmp    6ac <strtol+0x7c>
 695:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 698:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 69b:	3b 55 10             	cmp    0x10(%ebp),%edx
 69e:	7d 28                	jge    6c8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 6a0:	0f af 45 10          	imul   0x10(%ebp),%eax
 6a4:	83 c1 01             	add    $0x1,%ecx
 6a7:	01 d0                	add    %edx,%eax
    while (1) {
 6a9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 6ac:	8d 72 d0             	lea    -0x30(%edx),%esi
 6af:	89 f3                	mov    %esi,%ebx
 6b1:	80 fb 09             	cmp    $0x9,%bl
 6b4:	76 e2                	jbe    698 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 6b6:	8d 72 9f             	lea    -0x61(%edx),%esi
 6b9:	89 f3                	mov    %esi,%ebx
 6bb:	80 fb 19             	cmp    $0x19,%bl
 6be:	77 28                	ja     6e8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 6c0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 6c3:	3b 55 10             	cmp    0x10(%ebp),%edx
 6c6:	7c d8                	jl     6a0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 6c8:	8b 55 0c             	mov    0xc(%ebp),%edx
 6cb:	85 d2                	test   %edx,%edx
 6cd:	74 05                	je     6d4 <strtol+0xa4>
        *endptr = (char *) s;
 6cf:	8b 75 0c             	mov    0xc(%ebp),%esi
 6d2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 6d4:	89 c2                	mov    %eax,%edx
}
 6d6:	5b                   	pop    %ebx
 6d7:	5e                   	pop    %esi
    return (neg ? -val : val);
 6d8:	f7 da                	neg    %edx
 6da:	85 ff                	test   %edi,%edi
}
 6dc:	5f                   	pop    %edi
 6dd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 6de:	0f 45 c2             	cmovne %edx,%eax
}
 6e1:	c3                   	ret    
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 6e8:	8d 72 bf             	lea    -0x41(%edx),%esi
 6eb:	89 f3                	mov    %esi,%ebx
 6ed:	80 fb 19             	cmp    $0x19,%bl
 6f0:	77 d6                	ja     6c8 <strtol+0x98>
            dig = *s - 'A' + 10;
 6f2:	83 ea 37             	sub    $0x37,%edx
 6f5:	eb a4                	jmp    69b <strtol+0x6b>
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 700:	83 c1 01             	add    $0x1,%ecx
 703:	bf 01 00 00 00       	mov    $0x1,%edi
 708:	e9 64 ff ff ff       	jmp    671 <strtol+0x41>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 710:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 713:	31 ff                	xor    %edi,%edi
 715:	e9 57 ff ff ff       	jmp    671 <strtol+0x41>
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 720:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 724:	3c 78                	cmp    $0x78,%al
 726:	74 18                	je     740 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 728:	85 db                	test   %ebx,%ebx
 72a:	0f 85 5e ff ff ff    	jne    68e <strtol+0x5e>
        s++, base = 8;
 730:	83 c1 01             	add    $0x1,%ecx
 733:	0f be d0             	movsbl %al,%edx
 736:	bb 08 00 00 00       	mov    $0x8,%ebx
 73b:	e9 4e ff ff ff       	jmp    68e <strtol+0x5e>
        s += 2, base = 16;
 740:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 744:	bb 10 00 00 00       	mov    $0x10,%ebx
 749:	83 c1 02             	add    $0x2,%ecx
 74c:	e9 3d ff ff ff       	jmp    68e <strtol+0x5e>
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop

00000760 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 760:	f3 0f 1e fb          	endbr32 
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 768:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 76a:	56                   	push   %esi
 76b:	53                   	push   %ebx
 76c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 76f:	83 ec 1c             	sub    $0x1c,%esp
 772:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 775:	83 ec 04             	sub    $0x4,%esp
 778:	6a 0a                	push   $0xa
 77a:	53                   	push   %ebx
 77b:	56                   	push   %esi
 77c:	e8 af fe ff ff       	call   630 <strtol>
        if (ret < 0 || ret > 255) {
 781:	83 c4 10             	add    $0x10,%esp
 784:	3d ff 00 00 00       	cmp    $0xff,%eax
 789:	77 3d                	ja     7c8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 78b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 78e:	39 f1                	cmp    %esi,%ecx
 790:	74 36                	je     7c8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 792:	0f b6 11             	movzbl (%ecx),%edx
 795:	83 ff 03             	cmp    $0x3,%edi
 798:	74 16                	je     7b0 <ip_addr_pton+0x50>
 79a:	80 fa 2e             	cmp    $0x2e,%dl
 79d:	75 29                	jne    7c8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 79f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 7a2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 7a5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 7a8:	83 c7 01             	add    $0x1,%edi
 7ab:	eb c8                	jmp    775 <ip_addr_pton+0x15>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7b0:	84 d2                	test   %dl,%dl
 7b2:	75 14                	jne    7c8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 7b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 7b7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 7ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 7bd:	31 c0                	xor    %eax,%eax
}
 7bf:	5b                   	pop    %ebx
 7c0:	5e                   	pop    %esi
 7c1:	5f                   	pop    %edi
 7c2:	5d                   	pop    %ebp
 7c3:	c3                   	ret    
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 7cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 7d0:	5b                   	pop    %ebx
 7d1:	5e                   	pop    %esi
 7d2:	5f                   	pop    %edi
 7d3:	5d                   	pop    %ebp
 7d4:	c3                   	ret    

000007d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7d5:	b8 01 00 00 00       	mov    $0x1,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <exit>:
SYSCALL(exit)
 7dd:	b8 02 00 00 00       	mov    $0x2,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <wait>:
SYSCALL(wait)
 7e5:	b8 03 00 00 00       	mov    $0x3,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <pipe>:
SYSCALL(pipe)
 7ed:	b8 04 00 00 00       	mov    $0x4,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <read>:
SYSCALL(read)
 7f5:	b8 05 00 00 00       	mov    $0x5,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <write>:
SYSCALL(write)
 7fd:	b8 10 00 00 00       	mov    $0x10,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <close>:
SYSCALL(close)
 805:	b8 15 00 00 00       	mov    $0x15,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <kill>:
SYSCALL(kill)
 80d:	b8 06 00 00 00       	mov    $0x6,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <exec>:
SYSCALL(exec)
 815:	b8 07 00 00 00       	mov    $0x7,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <open>:
SYSCALL(open)
 81d:	b8 0f 00 00 00       	mov    $0xf,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <mknod>:
SYSCALL(mknod)
 825:	b8 11 00 00 00       	mov    $0x11,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <unlink>:
SYSCALL(unlink)
 82d:	b8 12 00 00 00       	mov    $0x12,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <fstat>:
SYSCALL(fstat)
 835:	b8 08 00 00 00       	mov    $0x8,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <link>:
SYSCALL(link)
 83d:	b8 13 00 00 00       	mov    $0x13,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <mkdir>:
SYSCALL(mkdir)
 845:	b8 14 00 00 00       	mov    $0x14,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <chdir>:
SYSCALL(chdir)
 84d:	b8 09 00 00 00       	mov    $0x9,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <dup>:
SYSCALL(dup)
 855:	b8 0a 00 00 00       	mov    $0xa,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <getpid>:
SYSCALL(getpid)
 85d:	b8 0b 00 00 00       	mov    $0xb,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <sbrk>:
SYSCALL(sbrk)
 865:	b8 0c 00 00 00       	mov    $0xc,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <sleep>:
SYSCALL(sleep)
 86d:	b8 0d 00 00 00       	mov    $0xd,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <uptime>:
SYSCALL(uptime)
 875:	b8 0e 00 00 00       	mov    $0xe,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <ioctl>:
# iotcl
SYSCALL(ioctl)
 87d:	b8 16 00 00 00       	mov    $0x16,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <socket>:
# socket
SYSCALL(socket)
 885:	b8 17 00 00 00       	mov    $0x17,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <bind>:
SYSCALL(bind)
 88d:	b8 19 00 00 00       	mov    $0x19,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <listen>:
SYSCALL(listen)
 895:	b8 1a 00 00 00       	mov    $0x1a,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <accept>:
SYSCALL(accept)
 89d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <recv>:
SYSCALL(recv)
 8a5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <send>:
SYSCALL(send)
 8ad:	b8 1d 00 00 00       	mov    $0x1d,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <recvfrom>:
SYSCALL(recvfrom)
 8b5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <sendto>:
SYSCALL(sendto)
 8bd:	b8 1f 00 00 00       	mov    $0x1f,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    
 8c5:	66 90                	xchg   %ax,%ax
 8c7:	66 90                	xchg   %ax,%ax
 8c9:	66 90                	xchg   %ax,%ax
 8cb:	66 90                	xchg   %ax,%ax
 8cd:	66 90                	xchg   %ax,%ax
 8cf:	90                   	nop

000008d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 3c             	sub    $0x3c,%esp
 8d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8dc:	89 d1                	mov    %edx,%ecx
{
 8de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 8e1:	85 d2                	test   %edx,%edx
 8e3:	0f 89 7f 00 00 00    	jns    968 <printint+0x98>
 8e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8ed:	74 79                	je     968 <printint+0x98>
    neg = 1;
 8ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8f8:	31 db                	xor    %ebx,%ebx
 8fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 900:	89 c8                	mov    %ecx,%eax
 902:	31 d2                	xor    %edx,%edx
 904:	89 cf                	mov    %ecx,%edi
 906:	f7 75 c4             	divl   -0x3c(%ebp)
 909:	0f b6 92 90 0d 00 00 	movzbl 0xd90(%edx),%edx
 910:	89 45 c0             	mov    %eax,-0x40(%ebp)
 913:	89 d8                	mov    %ebx,%eax
 915:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 918:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 91b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 91e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 921:	76 dd                	jbe    900 <printint+0x30>
  if(neg)
 923:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 926:	85 c9                	test   %ecx,%ecx
 928:	74 0c                	je     936 <printint+0x66>
    buf[i++] = '-';
 92a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 92f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 931:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 936:	8b 7d b8             	mov    -0x48(%ebp),%edi
 939:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 93d:	eb 07                	jmp    946 <printint+0x76>
 93f:	90                   	nop
 940:	0f b6 13             	movzbl (%ebx),%edx
 943:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 946:	83 ec 04             	sub    $0x4,%esp
 949:	88 55 d7             	mov    %dl,-0x29(%ebp)
 94c:	6a 01                	push   $0x1
 94e:	56                   	push   %esi
 94f:	57                   	push   %edi
 950:	e8 a8 fe ff ff       	call   7fd <write>
  while(--i >= 0)
 955:	83 c4 10             	add    $0x10,%esp
 958:	39 de                	cmp    %ebx,%esi
 95a:	75 e4                	jne    940 <printint+0x70>
    putc(fd, buf[i]);
}
 95c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 95f:	5b                   	pop    %ebx
 960:	5e                   	pop    %esi
 961:	5f                   	pop    %edi
 962:	5d                   	pop    %ebp
 963:	c3                   	ret    
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 968:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 96f:	eb 87                	jmp    8f8 <printint+0x28>
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop

00000980 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 980:	f3 0f 1e fb          	endbr32 
 984:	55                   	push   %ebp
 985:	89 e5                	mov    %esp,%ebp
 987:	57                   	push   %edi
 988:	56                   	push   %esi
 989:	53                   	push   %ebx
 98a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 98d:	8b 75 0c             	mov    0xc(%ebp),%esi
 990:	0f b6 1e             	movzbl (%esi),%ebx
 993:	84 db                	test   %bl,%bl
 995:	0f 84 b4 00 00 00    	je     a4f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 99b:	8d 45 10             	lea    0x10(%ebp),%eax
 99e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 9a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 9a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 9a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9a9:	eb 33                	jmp    9de <printf+0x5e>
 9ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9af:	90                   	nop
 9b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 9b8:	83 f8 25             	cmp    $0x25,%eax
 9bb:	74 17                	je     9d4 <printf+0x54>
  write(fd, &c, 1);
 9bd:	83 ec 04             	sub    $0x4,%esp
 9c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9c3:	6a 01                	push   $0x1
 9c5:	57                   	push   %edi
 9c6:	ff 75 08             	pushl  0x8(%ebp)
 9c9:	e8 2f fe ff ff       	call   7fd <write>
 9ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 9d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 9d4:	0f b6 1e             	movzbl (%esi),%ebx
 9d7:	83 c6 01             	add    $0x1,%esi
 9da:	84 db                	test   %bl,%bl
 9dc:	74 71                	je     a4f <printf+0xcf>
    c = fmt[i] & 0xff;
 9de:	0f be cb             	movsbl %bl,%ecx
 9e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9e4:	85 d2                	test   %edx,%edx
 9e6:	74 c8                	je     9b0 <printf+0x30>
      }
    } else if(state == '%'){
 9e8:	83 fa 25             	cmp    $0x25,%edx
 9eb:	75 e7                	jne    9d4 <printf+0x54>
      if(c == 'd'){
 9ed:	83 f8 64             	cmp    $0x64,%eax
 9f0:	0f 84 9a 00 00 00    	je     a90 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9fc:	83 f9 70             	cmp    $0x70,%ecx
 9ff:	74 5f                	je     a60 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a01:	83 f8 73             	cmp    $0x73,%eax
 a04:	0f 84 d6 00 00 00    	je     ae0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a0a:	83 f8 63             	cmp    $0x63,%eax
 a0d:	0f 84 8d 00 00 00    	je     aa0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a13:	83 f8 25             	cmp    $0x25,%eax
 a16:	0f 84 b4 00 00 00    	je     ad0 <printf+0x150>
  write(fd, &c, 1);
 a1c:	83 ec 04             	sub    $0x4,%esp
 a1f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a23:	6a 01                	push   $0x1
 a25:	57                   	push   %edi
 a26:	ff 75 08             	pushl  0x8(%ebp)
 a29:	e8 cf fd ff ff       	call   7fd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a2e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a31:	83 c4 0c             	add    $0xc,%esp
 a34:	6a 01                	push   $0x1
 a36:	83 c6 01             	add    $0x1,%esi
 a39:	57                   	push   %edi
 a3a:	ff 75 08             	pushl  0x8(%ebp)
 a3d:	e8 bb fd ff ff       	call   7fd <write>
  for(i = 0; fmt[i]; i++){
 a42:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a46:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a49:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a4b:	84 db                	test   %bl,%bl
 a4d:	75 8f                	jne    9de <printf+0x5e>
    }
  }
}
 a4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a52:	5b                   	pop    %ebx
 a53:	5e                   	pop    %esi
 a54:	5f                   	pop    %edi
 a55:	5d                   	pop    %ebp
 a56:	c3                   	ret    
 a57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a60:	83 ec 0c             	sub    $0xc,%esp
 a63:	b9 10 00 00 00       	mov    $0x10,%ecx
 a68:	6a 00                	push   $0x0
 a6a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a6d:	8b 45 08             	mov    0x8(%ebp),%eax
 a70:	8b 13                	mov    (%ebx),%edx
 a72:	e8 59 fe ff ff       	call   8d0 <printint>
        ap++;
 a77:	89 d8                	mov    %ebx,%eax
 a79:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7c:	31 d2                	xor    %edx,%edx
        ap++;
 a7e:	83 c0 04             	add    $0x4,%eax
 a81:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a84:	e9 4b ff ff ff       	jmp    9d4 <printf+0x54>
 a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a90:	83 ec 0c             	sub    $0xc,%esp
 a93:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a98:	6a 01                	push   $0x1
 a9a:	eb ce                	jmp    a6a <printf+0xea>
 a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 aa0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 aa3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 aa6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 aa8:	6a 01                	push   $0x1
        ap++;
 aaa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 aad:	57                   	push   %edi
 aae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 ab1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ab4:	e8 44 fd ff ff       	call   7fd <write>
        ap++;
 ab9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 abc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 abf:	31 d2                	xor    %edx,%edx
 ac1:	e9 0e ff ff ff       	jmp    9d4 <printf+0x54>
 ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 acd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 ad0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 ad3:	83 ec 04             	sub    $0x4,%esp
 ad6:	e9 59 ff ff ff       	jmp    a34 <printf+0xb4>
 adb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 adf:	90                   	nop
        s = (char*)*ap;
 ae0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ae3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ae5:	83 c0 04             	add    $0x4,%eax
 ae8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 aeb:	85 db                	test   %ebx,%ebx
 aed:	74 17                	je     b06 <printf+0x186>
        while(*s != 0){
 aef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 af2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 af4:	84 c0                	test   %al,%al
 af6:	0f 84 d8 fe ff ff    	je     9d4 <printf+0x54>
 afc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 aff:	89 de                	mov    %ebx,%esi
 b01:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b04:	eb 1a                	jmp    b20 <printf+0x1a0>
          s = "(null)";
 b06:	bb 88 0d 00 00       	mov    $0xd88,%ebx
        while(*s != 0){
 b0b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b0e:	b8 28 00 00 00       	mov    $0x28,%eax
 b13:	89 de                	mov    %ebx,%esi
 b15:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop
  write(fd, &c, 1);
 b20:	83 ec 04             	sub    $0x4,%esp
          s++;
 b23:	83 c6 01             	add    $0x1,%esi
 b26:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b29:	6a 01                	push   $0x1
 b2b:	57                   	push   %edi
 b2c:	53                   	push   %ebx
 b2d:	e8 cb fc ff ff       	call   7fd <write>
        while(*s != 0){
 b32:	0f b6 06             	movzbl (%esi),%eax
 b35:	83 c4 10             	add    $0x10,%esp
 b38:	84 c0                	test   %al,%al
 b3a:	75 e4                	jne    b20 <printf+0x1a0>
 b3c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b3f:	31 d2                	xor    %edx,%edx
 b41:	e9 8e fe ff ff       	jmp    9d4 <printf+0x54>
 b46:	66 90                	xchg   %ax,%ax
 b48:	66 90                	xchg   %ax,%ax
 b4a:	66 90                	xchg   %ax,%ax
 b4c:	66 90                	xchg   %ax,%ax
 b4e:	66 90                	xchg   %ax,%ax

00000b50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b50:	f3 0f 1e fb          	endbr32 
 b54:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b55:	a1 a4 11 00 00       	mov    0x11a4,%eax
{
 b5a:	89 e5                	mov    %esp,%ebp
 b5c:	57                   	push   %edi
 b5d:	56                   	push   %esi
 b5e:	53                   	push   %ebx
 b5f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b62:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b64:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b67:	39 c8                	cmp    %ecx,%eax
 b69:	73 15                	jae    b80 <free+0x30>
 b6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b6f:	90                   	nop
 b70:	39 d1                	cmp    %edx,%ecx
 b72:	72 14                	jb     b88 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b74:	39 d0                	cmp    %edx,%eax
 b76:	73 10                	jae    b88 <free+0x38>
{
 b78:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b7a:	8b 10                	mov    (%eax),%edx
 b7c:	39 c8                	cmp    %ecx,%eax
 b7e:	72 f0                	jb     b70 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b80:	39 d0                	cmp    %edx,%eax
 b82:	72 f4                	jb     b78 <free+0x28>
 b84:	39 d1                	cmp    %edx,%ecx
 b86:	73 f0                	jae    b78 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b88:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b8b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b8e:	39 fa                	cmp    %edi,%edx
 b90:	74 1e                	je     bb0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b92:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b95:	8b 50 04             	mov    0x4(%eax),%edx
 b98:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b9b:	39 f1                	cmp    %esi,%ecx
 b9d:	74 28                	je     bc7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b9f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 ba1:	5b                   	pop    %ebx
  freep = p;
 ba2:	a3 a4 11 00 00       	mov    %eax,0x11a4
}
 ba7:	5e                   	pop    %esi
 ba8:	5f                   	pop    %edi
 ba9:	5d                   	pop    %ebp
 baa:	c3                   	ret    
 bab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 baf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 bb0:	03 72 04             	add    0x4(%edx),%esi
 bb3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bb6:	8b 10                	mov    (%eax),%edx
 bb8:	8b 12                	mov    (%edx),%edx
 bba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bbd:	8b 50 04             	mov    0x4(%eax),%edx
 bc0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bc3:	39 f1                	cmp    %esi,%ecx
 bc5:	75 d8                	jne    b9f <free+0x4f>
    p->s.size += bp->s.size;
 bc7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bca:	a3 a4 11 00 00       	mov    %eax,0x11a4
    p->s.size += bp->s.size;
 bcf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bd2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bd5:	89 10                	mov    %edx,(%eax)
}
 bd7:	5b                   	pop    %ebx
 bd8:	5e                   	pop    %esi
 bd9:	5f                   	pop    %edi
 bda:	5d                   	pop    %ebp
 bdb:	c3                   	ret    
 bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000be0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 be0:	f3 0f 1e fb          	endbr32 
 be4:	55                   	push   %ebp
 be5:	89 e5                	mov    %esp,%ebp
 be7:	57                   	push   %edi
 be8:	56                   	push   %esi
 be9:	53                   	push   %ebx
 bea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bed:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bf0:	8b 3d a4 11 00 00    	mov    0x11a4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bf6:	8d 70 07             	lea    0x7(%eax),%esi
 bf9:	c1 ee 03             	shr    $0x3,%esi
 bfc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 bff:	85 ff                	test   %edi,%edi
 c01:	0f 84 a9 00 00 00    	je     cb0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c07:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c09:	8b 48 04             	mov    0x4(%eax),%ecx
 c0c:	39 f1                	cmp    %esi,%ecx
 c0e:	73 6d                	jae    c7d <malloc+0x9d>
 c10:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c16:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c1b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 c1e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 c25:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 c28:	eb 17                	jmp    c41 <malloc+0x61>
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c30:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c32:	8b 4a 04             	mov    0x4(%edx),%ecx
 c35:	39 f1                	cmp    %esi,%ecx
 c37:	73 4f                	jae    c88 <malloc+0xa8>
 c39:	8b 3d a4 11 00 00    	mov    0x11a4,%edi
 c3f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c41:	39 c7                	cmp    %eax,%edi
 c43:	75 eb                	jne    c30 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c45:	83 ec 0c             	sub    $0xc,%esp
 c48:	ff 75 e4             	pushl  -0x1c(%ebp)
 c4b:	e8 15 fc ff ff       	call   865 <sbrk>
  if(p == (char*)-1)
 c50:	83 c4 10             	add    $0x10,%esp
 c53:	83 f8 ff             	cmp    $0xffffffff,%eax
 c56:	74 1b                	je     c73 <malloc+0x93>
  hp->s.size = nu;
 c58:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c5b:	83 ec 0c             	sub    $0xc,%esp
 c5e:	83 c0 08             	add    $0x8,%eax
 c61:	50                   	push   %eax
 c62:	e8 e9 fe ff ff       	call   b50 <free>
  return freep;
 c67:	a1 a4 11 00 00       	mov    0x11a4,%eax
      if((p = morecore(nunits)) == 0)
 c6c:	83 c4 10             	add    $0x10,%esp
 c6f:	85 c0                	test   %eax,%eax
 c71:	75 bd                	jne    c30 <malloc+0x50>
        return 0;
  }
}
 c73:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c76:	31 c0                	xor    %eax,%eax
}
 c78:	5b                   	pop    %ebx
 c79:	5e                   	pop    %esi
 c7a:	5f                   	pop    %edi
 c7b:	5d                   	pop    %ebp
 c7c:	c3                   	ret    
    if(p->s.size >= nunits){
 c7d:	89 c2                	mov    %eax,%edx
 c7f:	89 f8                	mov    %edi,%eax
 c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c88:	39 ce                	cmp    %ecx,%esi
 c8a:	74 54                	je     ce0 <malloc+0x100>
        p->s.size -= nunits;
 c8c:	29 f1                	sub    %esi,%ecx
 c8e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 c91:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 c94:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 c97:	a3 a4 11 00 00       	mov    %eax,0x11a4
}
 c9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c9f:	8d 42 08             	lea    0x8(%edx),%eax
}
 ca2:	5b                   	pop    %ebx
 ca3:	5e                   	pop    %esi
 ca4:	5f                   	pop    %edi
 ca5:	5d                   	pop    %ebp
 ca6:	c3                   	ret    
 ca7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 cb0:	c7 05 a4 11 00 00 a8 	movl   $0x11a8,0x11a4
 cb7:	11 00 00 
    base.s.size = 0;
 cba:	bf a8 11 00 00       	mov    $0x11a8,%edi
    base.s.ptr = freep = prevp = &base;
 cbf:	c7 05 a8 11 00 00 a8 	movl   $0x11a8,0x11a8
 cc6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cc9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 ccb:	c7 05 ac 11 00 00 00 	movl   $0x0,0x11ac
 cd2:	00 00 00 
    if(p->s.size >= nunits){
 cd5:	e9 36 ff ff ff       	jmp    c10 <malloc+0x30>
 cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ce0:	8b 0a                	mov    (%edx),%ecx
 ce2:	89 08                	mov    %ecx,(%eax)
 ce4:	eb b1                	jmp    c97 <malloc+0xb7>
