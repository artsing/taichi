
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
  37:	e8 41 08 00 00       	call   87d <open>
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
  57:	e8 09 08 00 00       	call   865 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 d4 07 00 00       	call   83d <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 6b 0d 00 00       	push   $0xd6b
  71:	6a 01                	push   $0x1
  73:	e8 68 09 00 00       	call   9e0 <printf>
      exit();
  78:	e8 c0 07 00 00       	call   83d <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 b1 07 00 00       	call   83d <exit>
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
  a4:	68 40 12 00 00       	push   $0x1240
  a9:	6a 01                	push   $0x1
  ab:	e8 ad 07 00 00       	call   85d <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 40 12 00 00       	push   $0x1240
  c4:	56                   	push   %esi
  c5:	e8 8b 07 00 00       	call   855 <read>
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
  df:	68 48 0d 00 00       	push   $0xd48
  e4:	6a 01                	push   $0x1
  e6:	e8 f5 08 00 00       	call   9e0 <printf>
      exit();
  eb:	e8 4d 07 00 00       	call   83d <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 5a 0d 00 00       	push   $0xd5a
  f7:	6a 01                	push   $0x1
  f9:	e8 e2 08 00 00       	call   9e0 <printf>
    exit();
  fe:	e8 3a 07 00 00       	call   83d <exit>
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

00000140 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	8b 7d 10             	mov    0x10(%ebp),%edi
 14b:	56                   	push   %esi
 14c:	8b 75 08             	mov    0x8(%ebp),%esi
 14f:	53                   	push   %ebx
 150:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 153:	85 ff                	test   %edi,%edi
 155:	74 39                	je     190 <strcat_s+0x50>
 157:	31 c0                	xor    %eax,%eax
 159:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 15e:	eb 11                	jmp    171 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 160:	0f b6 12             	movzbl (%edx),%edx
 163:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 166:	84 d2                	test   %dl,%dl
 168:	74 26                	je     190 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 16a:	83 c0 01             	add    $0x1,%eax
 16d:	39 c7                	cmp    %eax,%edi
 16f:	74 1f                	je     190 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 171:	89 c2                	mov    %eax,%edx
 173:	29 ca                	sub    %ecx,%edx
 175:	01 da                	add    %ebx,%edx
 177:	83 f9 ff             	cmp    $0xffffffff,%ecx
 17a:	75 e4                	jne    160 <strcat_s+0x20>
 17c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 180:	75 e8                	jne    16a <strcat_s+0x2a>
 182:	89 da                	mov    %ebx,%edx
 184:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 186:	0f b6 12             	movzbl (%edx),%edx
 189:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 18c:	84 d2                	test   %dl,%dl
 18e:	75 da                	jne    16a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 190:	5b                   	pop    %ebx
 191:	89 f0                	mov    %esi,%eax
 193:	5e                   	pop    %esi
 194:	5f                   	pop    %edi
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	53                   	push   %ebx
 1a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ae:	0f b6 01             	movzbl (%ecx),%eax
 1b1:	0f b6 1a             	movzbl (%edx),%ebx
 1b4:	84 c0                	test   %al,%al
 1b6:	75 19                	jne    1d1 <strcmp+0x31>
 1b8:	eb 26                	jmp    1e0 <strcmp+0x40>
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1c4:	83 c1 01             	add    $0x1,%ecx
 1c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ca:	0f b6 1a             	movzbl (%edx),%ebx
 1cd:	84 c0                	test   %al,%al
 1cf:	74 0f                	je     1e0 <strcmp+0x40>
 1d1:	38 d8                	cmp    %bl,%al
 1d3:	74 eb                	je     1c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1d5:	29 d8                	sub    %ebx,%eax
}
 1d7:	5b                   	pop    %ebx
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1e2:	29 d8                	sub    %ebx,%eax
}
 1e4:	5b                   	pop    %ebx
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <strlen>:

uint
strlen(const char *s)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1fa:	80 3a 00             	cmpb   $0x0,(%edx)
 1fd:	74 21                	je     220 <strlen+0x30>
 1ff:	31 c0                	xor    %eax,%eax
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	83 c0 01             	add    $0x1,%eax
 20b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 20f:	89 c1                	mov    %eax,%ecx
 211:	75 f5                	jne    208 <strlen+0x18>
    ;
  return n;
}
 213:	89 c8                	mov    %ecx,%eax
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 220:	31 c9                	xor    %ecx,%ecx
}
 222:	5d                   	pop    %ebp
 223:	89 c8                	mov    %ecx,%eax
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 23b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23e:	8b 45 0c             	mov    0xc(%ebp),%eax
 241:	89 d7                	mov    %edx,%edi
 243:	fc                   	cld    
 244:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 246:	89 d0                	mov    %edx,%eax
 248:	5f                   	pop    %edi
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 25e:	0f b6 10             	movzbl (%eax),%edx
 261:	84 d2                	test   %dl,%dl
 263:	75 16                	jne    27b <strchr+0x2b>
 265:	eb 21                	jmp    288 <strchr+0x38>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax
 270:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 274:	83 c0 01             	add    $0x1,%eax
 277:	84 d2                	test   %dl,%dl
 279:	74 0d                	je     288 <strchr+0x38>
    if(*s == c)
 27b:	38 d1                	cmp    %dl,%cl
 27d:	75 f1                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 288:	31 c0                	xor    %eax,%eax
}
 28a:	5d                   	pop    %ebp
 28b:	c3                   	ret    
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 299:	31 f6                	xor    %esi,%esi
{
 29b:	53                   	push   %ebx
 29c:	89 f3                	mov    %esi,%ebx
 29e:	83 ec 1c             	sub    $0x1c,%esp
 2a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2a4:	eb 33                	jmp    2d9 <gets+0x49>
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2b6:	6a 01                	push   $0x1
 2b8:	50                   	push   %eax
 2b9:	6a 00                	push   $0x0
 2bb:	e8 95 05 00 00       	call   855 <read>
    if(cc < 1)
 2c0:	83 c4 10             	add    $0x10,%esp
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7e 1c                	jle    2e3 <gets+0x53>
      break;
    buf[i++] = c;
 2c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2cb:	83 c7 01             	add    $0x1,%edi
 2ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2d1:	3c 0a                	cmp    $0xa,%al
 2d3:	74 23                	je     2f8 <gets+0x68>
 2d5:	3c 0d                	cmp    $0xd,%al
 2d7:	74 1f                	je     2f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	89 fe                	mov    %edi,%esi
 2de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2e1:	7c cd                	jl     2b0 <gets+0x20>
 2e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ee:	5b                   	pop    %ebx
 2ef:	5e                   	pop    %esi
 2f0:	5f                   	pop    %edi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f7:	90                   	nop
 2f8:	8b 75 08             	mov    0x8(%ebp),%esi
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
 2fe:	01 de                	add    %ebx,%esi
 300:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 302:	c6 03 00             	movb   $0x0,(%ebx)
}
 305:	8d 65 f4             	lea    -0xc(%ebp),%esp
 308:	5b                   	pop    %ebx
 309:	5e                   	pop    %esi
 30a:	5f                   	pop    %edi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	56                   	push   %esi
 318:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	6a 00                	push   $0x0
 31e:	ff 75 08             	pushl  0x8(%ebp)
 321:	e8 57 05 00 00       	call   87d <open>
  if(fd < 0)
 326:	83 c4 10             	add    $0x10,%esp
 329:	85 c0                	test   %eax,%eax
 32b:	78 2b                	js     358 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 32d:	83 ec 08             	sub    $0x8,%esp
 330:	ff 75 0c             	pushl  0xc(%ebp)
 333:	89 c3                	mov    %eax,%ebx
 335:	50                   	push   %eax
 336:	e8 5a 05 00 00       	call   895 <fstat>
  close(fd);
 33b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33e:	89 c6                	mov    %eax,%esi
  close(fd);
 340:	e8 20 05 00 00       	call   865 <close>
  return r;
 345:	83 c4 10             	add    $0x10,%esp
}
 348:	8d 65 f8             	lea    -0x8(%ebp),%esp
 34b:	89 f0                	mov    %esi,%eax
 34d:	5b                   	pop    %ebx
 34e:	5e                   	pop    %esi
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 358:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35d:	eb e9                	jmp    348 <stat+0x38>
 35f:	90                   	nop

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	53                   	push   %ebx
 368:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 36b:	0f be 02             	movsbl (%edx),%eax
 36e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 371:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 374:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 379:	77 1a                	ja     395 <atoi+0x35>
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	89 c8                	mov    %ecx,%eax
 397:	5b                   	pop    %ebx
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	8b 45 10             	mov    0x10(%ebp),%eax
 3ab:	8b 55 08             	mov    0x8(%ebp),%edx
 3ae:	56                   	push   %esi
 3af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b2:	85 c0                	test   %eax,%eax
 3b4:	7e 0f                	jle    3c5 <memmove+0x25>
 3b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b8:	89 d7                	mov    %edx,%edi
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	56                   	push   %esi
 3d9:	53                   	push   %ebx
 3da:	83 ec 34             	sub    $0x34,%esp
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3e0:	68 80 0d 00 00       	push   $0xd80
hexdump (void *data, size_t size) {
 3e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 3e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3eb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 3ed:	89 c7                	mov    %eax,%edi
 3ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3f2:	e8 e9 05 00 00       	call   9e0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	85 ff                	test   %edi,%edi
 3fc:	0f 84 2d 01 00 00    	je     52f <hexdump+0x15f>
 402:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 405:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 40c:	be 10 00 00 00       	mov    $0x10,%esi
 411:	83 e8 01             	sub    $0x1,%eax
 414:	83 e0 f0             	and    $0xfffffff0,%eax
 417:	83 c0 10             	add    $0x10,%eax
 41a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 420:	83 ec 08             	sub    $0x8,%esp
 423:	68 d4 0d 00 00       	push   $0xdd4
 428:	6a 01                	push   $0x1
 42a:	e8 b1 05 00 00       	call   9e0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 42f:	83 c4 10             	add    $0x10,%esp
 432:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 439:	0f 8e 51 01 00 00    	jle    590 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 43f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 442:	83 ec 04             	sub    $0x4,%esp
 445:	57                   	push   %edi
 446:	89 fb                	mov    %edi,%ebx
 448:	68 d1 0d 00 00       	push   $0xdd1
 44d:	6a 01                	push   $0x1
 44f:	e8 8c 05 00 00       	call   9e0 <printf>
 454:	89 7d d8             	mov    %edi,-0x28(%ebp)
 457:	83 c4 10             	add    $0x10,%esp
 45a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 45d:	eb 28                	jmp    487 <hexdump+0xb7>
 45f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 460:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 464:	80 fa 0f             	cmp    $0xf,%dl
 467:	0f 86 e3 00 00 00    	jbe    550 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	83 c3 01             	add    $0x1,%ebx
 473:	52                   	push   %edx
 474:	68 d7 0d 00 00       	push   $0xdd7
 479:	6a 01                	push   $0x1
 47b:	e8 60 05 00 00       	call   9e0 <printf>
 480:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 483:	39 f3                	cmp    %esi,%ebx
 485:	74 1e                	je     4a5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 487:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 48a:	7f d4                	jg     460 <hexdump+0x90>
      } else {
        printf(1, "   ");
 48c:	83 ec 08             	sub    $0x8,%esp
 48f:	83 c3 01             	add    $0x1,%ebx
 492:	68 db 0d 00 00       	push   $0xddb
 497:	6a 01                	push   $0x1
 499:	e8 42 05 00 00       	call   9e0 <printf>
 49e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4a1:	39 f3                	cmp    %esi,%ebx
 4a3:	75 e2                	jne    487 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 4ab:	68 d4 0d 00 00       	push   $0xdd4
 4b0:	6a 01                	push   $0x1
 4b2:	e8 29 05 00 00       	call   9e0 <printf>
 4b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ba:	83 c4 10             	add    $0x10,%esp
 4bd:	eb 1b                	jmp    4da <hexdump+0x10a>
 4bf:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	52                   	push   %edx
 4c4:	68 df 0d 00 00       	push   $0xddf
 4c9:	6a 01                	push   $0x1
 4cb:	e8 10 05 00 00       	call   9e0 <printf>
 4d0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4d3:	83 c3 01             	add    $0x1,%ebx
 4d6:	39 de                	cmp    %ebx,%esi
 4d8:	74 30                	je     50a <hexdump+0x13a>
      if(offset + index < (int)size) {
 4da:	39 df                	cmp    %ebx,%edi
 4dc:	0f 8e 8e 00 00 00    	jle    570 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 4e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 4e5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4e9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 4ec:	80 f9 5e             	cmp    $0x5e,%cl
 4ef:	76 cf                	jbe    4c0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 4f1:	83 ec 08             	sub    $0x8,%esp
 4f4:	83 c3 01             	add    $0x1,%ebx
 4f7:	68 e2 0d 00 00       	push   $0xde2
 4fc:	6a 01                	push   $0x1
 4fe:	e8 dd 04 00 00       	call   9e0 <printf>
 503:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 506:	39 de                	cmp    %ebx,%esi
 508:	75 d0                	jne    4da <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 50a:	83 ec 08             	sub    $0x8,%esp
 50d:	83 c6 10             	add    $0x10,%esi
 510:	68 e4 0d 00 00       	push   $0xde4
 515:	6a 01                	push   $0x1
 517:	e8 c4 04 00 00       	call   9e0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 51c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 520:	83 c4 10             	add    $0x10,%esp
 523:	8b 45 dc             	mov    -0x24(%ebp),%eax
 526:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 529:	0f 85 f1 fe ff ff    	jne    420 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 52f:	c7 45 0c 80 0d 00 00 	movl   $0xd80,0xc(%ebp)
 536:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 53d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 540:	5b                   	pop    %ebx
 541:	5e                   	pop    %esi
 542:	5f                   	pop    %edi
 543:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 544:	e9 97 04 00 00       	jmp    9e0 <printf>
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 550:	83 ec 08             	sub    $0x8,%esp
 553:	68 cf 0d 00 00       	push   $0xdcf
 558:	6a 01                	push   $0x1
 55a:	e8 81 04 00 00       	call   9e0 <printf>
 55f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 563:	83 c4 10             	add    $0x10,%esp
 566:	e9 02 ff ff ff       	jmp    46d <hexdump+0x9d>
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
        printf(1, " ");
 570:	83 ec 08             	sub    $0x8,%esp
 573:	68 dd 0d 00 00       	push   $0xddd
 578:	6a 01                	push   $0x1
 57a:	e8 61 04 00 00       	call   9e0 <printf>
 57f:	83 c4 10             	add    $0x10,%esp
 582:	e9 4c ff ff ff       	jmp    4d3 <hexdump+0x103>
 587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 590:	83 ec 08             	sub    $0x8,%esp
 593:	68 cf 0d 00 00       	push   $0xdcf
 598:	6a 01                	push   $0x1
 59a:	e8 41 04 00 00       	call   9e0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 59f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 5ab:	0f 8f 8e fe ff ff    	jg     43f <hexdump+0x6f>
 5b1:	83 ec 08             	sub    $0x8,%esp
 5b4:	68 cf 0d 00 00       	push   $0xdcf
 5b9:	6a 01                	push   $0x1
 5bb:	e8 20 04 00 00       	call   9e0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	83 ff 0f             	cmp    $0xf,%edi
 5c6:	0f 8f 73 fe ff ff    	jg     43f <hexdump+0x6f>
 5cc:	83 ec 08             	sub    $0x8,%esp
 5cf:	68 cf 0d 00 00       	push   $0xdcf
 5d4:	6a 01                	push   $0x1
 5d6:	e8 05 04 00 00       	call   9e0 <printf>
 5db:	83 c4 10             	add    $0x10,%esp
 5de:	e9 5c fe ff ff       	jmp    43f <hexdump+0x6f>
 5e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005f0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	55                   	push   %ebp
    if (!endian)
 5f5:	a1 20 12 00 00       	mov    0x1220,%eax
{
 5fa:	89 e5                	mov    %esp,%ebp
 5fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 5ff:	85 c0                	test   %eax,%eax
 601:	75 1d                	jne    620 <hton16+0x30>
        endian = byteorder();
 603:	c7 05 20 12 00 00 d2 	movl   $0x4d2,0x1220
 60a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 60d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 60f:	5d                   	pop    %ebp
 610:	66 c1 c2 08          	rol    $0x8,%dx
 614:	89 d0                	mov    %edx,%eax
 616:	c3                   	ret    
 617:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61e:	66 90                	xchg   %ax,%ax
 620:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 622:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 627:	74 e4                	je     60d <hton16+0x1d>
}
 629:	89 d0                	mov    %edx,%eax
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
 62d:	8d 76 00             	lea    0x0(%esi),%esi

00000630 <ntoh16>:
 630:	f3 0f 1e fb          	endbr32 
 634:	eb ba                	jmp    5f0 <hton16>
 636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi

00000640 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
    if (!endian)
 645:	8b 15 20 12 00 00    	mov    0x1220,%edx
{
 64b:	89 e5                	mov    %esp,%ebp
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 650:	85 d2                	test   %edx,%edx
 652:	75 14                	jne    668 <hton32+0x28>
        endian = byteorder();
 654:	c7 05 20 12 00 00 d2 	movl   $0x4d2,0x1220
 65b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 65e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 660:	5d                   	pop    %ebp
 661:	c3                   	ret    
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 668:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 66e:	74 ee                	je     65e <hton32+0x1e>
}
 670:	5d                   	pop    %ebp
 671:	c3                   	ret    
 672:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000680 <ntoh32>:
 680:	f3 0f 1e fb          	endbr32 
 684:	eb ba                	jmp    640 <hton32>
 686:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi

00000690 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 690:	f3 0f 1e fb          	endbr32 
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	8b 4d 08             	mov    0x8(%ebp),%ecx
 69b:	56                   	push   %esi
 69c:	53                   	push   %ebx
 69d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 6a0:	0f b6 01             	movzbl (%ecx),%eax
 6a3:	3c 09                	cmp    $0x9,%al
 6a5:	74 09                	je     6b0 <strtol+0x20>
 6a7:	3c 20                	cmp    $0x20,%al
 6a9:	75 14                	jne    6bf <strtol+0x2f>
 6ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
 6b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 6b4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 6b7:	3c 20                	cmp    $0x20,%al
 6b9:	74 f5                	je     6b0 <strtol+0x20>
 6bb:	3c 09                	cmp    $0x9,%al
 6bd:	74 f1                	je     6b0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 6bf:	3c 2b                	cmp    $0x2b,%al
 6c1:	0f 84 a9 00 00 00    	je     770 <strtol+0xe0>
    int neg = 0;
 6c7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 6c9:	3c 2d                	cmp    $0x2d,%al
 6cb:	0f 84 8f 00 00 00    	je     760 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6d1:	0f be 11             	movsbl (%ecx),%edx
 6d4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 6da:	75 12                	jne    6ee <strtol+0x5e>
 6dc:	80 fa 30             	cmp    $0x30,%dl
 6df:	0f 84 9b 00 00 00    	je     780 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 6e5:	85 db                	test   %ebx,%ebx
 6e7:	75 05                	jne    6ee <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 6e9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 6ee:	89 5d 10             	mov    %ebx,0x10(%ebp)
 6f1:	31 c0                	xor    %eax,%eax
 6f3:	eb 17                	jmp    70c <strtol+0x7c>
 6f5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 6f8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 6fb:	3b 55 10             	cmp    0x10(%ebp),%edx
 6fe:	7d 28                	jge    728 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 700:	0f af 45 10          	imul   0x10(%ebp),%eax
 704:	83 c1 01             	add    $0x1,%ecx
 707:	01 d0                	add    %edx,%eax
    while (1) {
 709:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 70c:	8d 72 d0             	lea    -0x30(%edx),%esi
 70f:	89 f3                	mov    %esi,%ebx
 711:	80 fb 09             	cmp    $0x9,%bl
 714:	76 e2                	jbe    6f8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 716:	8d 72 9f             	lea    -0x61(%edx),%esi
 719:	89 f3                	mov    %esi,%ebx
 71b:	80 fb 19             	cmp    $0x19,%bl
 71e:	77 28                	ja     748 <strtol+0xb8>
            dig = *s - 'a' + 10;
 720:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 723:	3b 55 10             	cmp    0x10(%ebp),%edx
 726:	7c d8                	jl     700 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 728:	8b 55 0c             	mov    0xc(%ebp),%edx
 72b:	85 d2                	test   %edx,%edx
 72d:	74 05                	je     734 <strtol+0xa4>
        *endptr = (char *) s;
 72f:	8b 75 0c             	mov    0xc(%ebp),%esi
 732:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 734:	89 c2                	mov    %eax,%edx
}
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
    return (neg ? -val : val);
 738:	f7 da                	neg    %edx
 73a:	85 ff                	test   %edi,%edi
}
 73c:	5f                   	pop    %edi
 73d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 73e:	0f 45 c2             	cmovne %edx,%eax
}
 741:	c3                   	ret    
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 748:	8d 72 bf             	lea    -0x41(%edx),%esi
 74b:	89 f3                	mov    %esi,%ebx
 74d:	80 fb 19             	cmp    $0x19,%bl
 750:	77 d6                	ja     728 <strtol+0x98>
            dig = *s - 'A' + 10;
 752:	83 ea 37             	sub    $0x37,%edx
 755:	eb a4                	jmp    6fb <strtol+0x6b>
 757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 760:	83 c1 01             	add    $0x1,%ecx
 763:	bf 01 00 00 00       	mov    $0x1,%edi
 768:	e9 64 ff ff ff       	jmp    6d1 <strtol+0x41>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 770:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 773:	31 ff                	xor    %edi,%edi
 775:	e9 57 ff ff ff       	jmp    6d1 <strtol+0x41>
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 780:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 784:	3c 78                	cmp    $0x78,%al
 786:	74 18                	je     7a0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 788:	85 db                	test   %ebx,%ebx
 78a:	0f 85 5e ff ff ff    	jne    6ee <strtol+0x5e>
        s++, base = 8;
 790:	83 c1 01             	add    $0x1,%ecx
 793:	0f be d0             	movsbl %al,%edx
 796:	bb 08 00 00 00       	mov    $0x8,%ebx
 79b:	e9 4e ff ff ff       	jmp    6ee <strtol+0x5e>
        s += 2, base = 16;
 7a0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 7a4:	bb 10 00 00 00       	mov    $0x10,%ebx
 7a9:	83 c1 02             	add    $0x2,%ecx
 7ac:	e9 3d ff ff ff       	jmp    6ee <strtol+0x5e>
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop

000007c0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 7c0:	f3 0f 1e fb          	endbr32 
 7c4:	55                   	push   %ebp
 7c5:	89 e5                	mov    %esp,%ebp
 7c7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 7c8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 7ca:	56                   	push   %esi
 7cb:	53                   	push   %ebx
 7cc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 7cf:	83 ec 1c             	sub    $0x1c,%esp
 7d2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 7d5:	83 ec 04             	sub    $0x4,%esp
 7d8:	6a 0a                	push   $0xa
 7da:	53                   	push   %ebx
 7db:	56                   	push   %esi
 7dc:	e8 af fe ff ff       	call   690 <strtol>
        if (ret < 0 || ret > 255) {
 7e1:	83 c4 10             	add    $0x10,%esp
 7e4:	3d ff 00 00 00       	cmp    $0xff,%eax
 7e9:	77 3d                	ja     828 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 7eb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 7ee:	39 f1                	cmp    %esi,%ecx
 7f0:	74 36                	je     828 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7f2:	0f b6 11             	movzbl (%ecx),%edx
 7f5:	83 ff 03             	cmp    $0x3,%edi
 7f8:	74 16                	je     810 <ip_addr_pton+0x50>
 7fa:	80 fa 2e             	cmp    $0x2e,%dl
 7fd:	75 29                	jne    828 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 7ff:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 802:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 805:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 808:	83 c7 01             	add    $0x1,%edi
 80b:	eb c8                	jmp    7d5 <ip_addr_pton+0x15>
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 810:	84 d2                	test   %dl,%dl
 812:	75 14                	jne    828 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 814:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 817:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 81a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 81d:	31 c0                	xor    %eax,%eax
}
 81f:	5b                   	pop    %ebx
 820:	5e                   	pop    %esi
 821:	5f                   	pop    %edi
 822:	5d                   	pop    %ebp
 823:	c3                   	ret    
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 828:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 82b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 830:	5b                   	pop    %ebx
 831:	5e                   	pop    %esi
 832:	5f                   	pop    %edi
 833:	5d                   	pop    %ebp
 834:	c3                   	ret    

00000835 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 835:	b8 01 00 00 00       	mov    $0x1,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <exit>:
SYSCALL(exit)
 83d:	b8 02 00 00 00       	mov    $0x2,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <wait>:
SYSCALL(wait)
 845:	b8 03 00 00 00       	mov    $0x3,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <pipe>:
SYSCALL(pipe)
 84d:	b8 04 00 00 00       	mov    $0x4,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <read>:
SYSCALL(read)
 855:	b8 05 00 00 00       	mov    $0x5,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <write>:
SYSCALL(write)
 85d:	b8 10 00 00 00       	mov    $0x10,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <close>:
SYSCALL(close)
 865:	b8 15 00 00 00       	mov    $0x15,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <kill>:
SYSCALL(kill)
 86d:	b8 06 00 00 00       	mov    $0x6,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <exec>:
SYSCALL(exec)
 875:	b8 07 00 00 00       	mov    $0x7,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <open>:
SYSCALL(open)
 87d:	b8 0f 00 00 00       	mov    $0xf,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <mknod>:
SYSCALL(mknod)
 885:	b8 11 00 00 00       	mov    $0x11,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <unlink>:
SYSCALL(unlink)
 88d:	b8 12 00 00 00       	mov    $0x12,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <fstat>:
SYSCALL(fstat)
 895:	b8 08 00 00 00       	mov    $0x8,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <link>:
SYSCALL(link)
 89d:	b8 13 00 00 00       	mov    $0x13,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <mkdir>:
SYSCALL(mkdir)
 8a5:	b8 14 00 00 00       	mov    $0x14,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <chdir>:
SYSCALL(chdir)
 8ad:	b8 09 00 00 00       	mov    $0x9,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <dup>:
SYSCALL(dup)
 8b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <getpid>:
SYSCALL(getpid)
 8bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <sbrk>:
SYSCALL(sbrk)
 8c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <sleep>:
SYSCALL(sleep)
 8cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <uptime>:
SYSCALL(uptime)
 8d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <ioctl>:
# iotcl
SYSCALL(ioctl)
 8dd:	b8 16 00 00 00       	mov    $0x16,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <socket>:
# socket
SYSCALL(socket)
 8e5:	b8 17 00 00 00       	mov    $0x17,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <bind>:
SYSCALL(bind)
 8ed:	b8 19 00 00 00       	mov    $0x19,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <listen>:
SYSCALL(listen)
 8f5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <accept>:
SYSCALL(accept)
 8fd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <recv>:
SYSCALL(recv)
 905:	b8 1c 00 00 00       	mov    $0x1c,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <send>:
SYSCALL(send)
 90d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <recvfrom>:
SYSCALL(recvfrom)
 915:	b8 1e 00 00 00       	mov    $0x1e,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <sendto>:
SYSCALL(sendto)
 91d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    
 925:	66 90                	xchg   %ax,%ax
 927:	66 90                	xchg   %ax,%ax
 929:	66 90                	xchg   %ax,%ax
 92b:	66 90                	xchg   %ax,%ax
 92d:	66 90                	xchg   %ax,%ax
 92f:	90                   	nop

00000930 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	83 ec 3c             	sub    $0x3c,%esp
 939:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 93c:	89 d1                	mov    %edx,%ecx
{
 93e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 941:	85 d2                	test   %edx,%edx
 943:	0f 89 7f 00 00 00    	jns    9c8 <printint+0x98>
 949:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 94d:	74 79                	je     9c8 <printint+0x98>
    neg = 1;
 94f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 956:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 958:	31 db                	xor    %ebx,%ebx
 95a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 95d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 960:	89 c8                	mov    %ecx,%eax
 962:	31 d2                	xor    %edx,%edx
 964:	89 cf                	mov    %ecx,%edi
 966:	f7 75 c4             	divl   -0x3c(%ebp)
 969:	0f b6 92 f0 0d 00 00 	movzbl 0xdf0(%edx),%edx
 970:	89 45 c0             	mov    %eax,-0x40(%ebp)
 973:	89 d8                	mov    %ebx,%eax
 975:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 978:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 97b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 97e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 981:	76 dd                	jbe    960 <printint+0x30>
  if(neg)
 983:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 986:	85 c9                	test   %ecx,%ecx
 988:	74 0c                	je     996 <printint+0x66>
    buf[i++] = '-';
 98a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 98f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 991:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 996:	8b 7d b8             	mov    -0x48(%ebp),%edi
 999:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 99d:	eb 07                	jmp    9a6 <printint+0x76>
 99f:	90                   	nop
 9a0:	0f b6 13             	movzbl (%ebx),%edx
 9a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 9a6:	83 ec 04             	sub    $0x4,%esp
 9a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 9ac:	6a 01                	push   $0x1
 9ae:	56                   	push   %esi
 9af:	57                   	push   %edi
 9b0:	e8 a8 fe ff ff       	call   85d <write>
  while(--i >= 0)
 9b5:	83 c4 10             	add    $0x10,%esp
 9b8:	39 de                	cmp    %ebx,%esi
 9ba:	75 e4                	jne    9a0 <printint+0x70>
    putc(fd, buf[i]);
}
 9bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9bf:	5b                   	pop    %ebx
 9c0:	5e                   	pop    %esi
 9c1:	5f                   	pop    %edi
 9c2:	5d                   	pop    %ebp
 9c3:	c3                   	ret    
 9c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 9c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 9cf:	eb 87                	jmp    958 <printint+0x28>
 9d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9df:	90                   	nop

000009e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 9e0:	f3 0f 1e fb          	endbr32 
 9e4:	55                   	push   %ebp
 9e5:	89 e5                	mov    %esp,%ebp
 9e7:	57                   	push   %edi
 9e8:	56                   	push   %esi
 9e9:	53                   	push   %ebx
 9ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 9f0:	0f b6 1e             	movzbl (%esi),%ebx
 9f3:	84 db                	test   %bl,%bl
 9f5:	0f 84 b4 00 00 00    	je     aaf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 9fb:	8d 45 10             	lea    0x10(%ebp),%eax
 9fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 a01:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 a04:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 a06:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a09:	eb 33                	jmp    a3e <printf+0x5e>
 a0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
 a10:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a13:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 a18:	83 f8 25             	cmp    $0x25,%eax
 a1b:	74 17                	je     a34 <printf+0x54>
  write(fd, &c, 1);
 a1d:	83 ec 04             	sub    $0x4,%esp
 a20:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a23:	6a 01                	push   $0x1
 a25:	57                   	push   %edi
 a26:	ff 75 08             	pushl  0x8(%ebp)
 a29:	e8 2f fe ff ff       	call   85d <write>
 a2e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a31:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a34:	0f b6 1e             	movzbl (%esi),%ebx
 a37:	83 c6 01             	add    $0x1,%esi
 a3a:	84 db                	test   %bl,%bl
 a3c:	74 71                	je     aaf <printf+0xcf>
    c = fmt[i] & 0xff;
 a3e:	0f be cb             	movsbl %bl,%ecx
 a41:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a44:	85 d2                	test   %edx,%edx
 a46:	74 c8                	je     a10 <printf+0x30>
      }
    } else if(state == '%'){
 a48:	83 fa 25             	cmp    $0x25,%edx
 a4b:	75 e7                	jne    a34 <printf+0x54>
      if(c == 'd'){
 a4d:	83 f8 64             	cmp    $0x64,%eax
 a50:	0f 84 9a 00 00 00    	je     af0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a56:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a5c:	83 f9 70             	cmp    $0x70,%ecx
 a5f:	74 5f                	je     ac0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a61:	83 f8 73             	cmp    $0x73,%eax
 a64:	0f 84 d6 00 00 00    	je     b40 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a6a:	83 f8 63             	cmp    $0x63,%eax
 a6d:	0f 84 8d 00 00 00    	je     b00 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a73:	83 f8 25             	cmp    $0x25,%eax
 a76:	0f 84 b4 00 00 00    	je     b30 <printf+0x150>
  write(fd, &c, 1);
 a7c:	83 ec 04             	sub    $0x4,%esp
 a7f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a83:	6a 01                	push   $0x1
 a85:	57                   	push   %edi
 a86:	ff 75 08             	pushl  0x8(%ebp)
 a89:	e8 cf fd ff ff       	call   85d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a8e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a91:	83 c4 0c             	add    $0xc,%esp
 a94:	6a 01                	push   $0x1
 a96:	83 c6 01             	add    $0x1,%esi
 a99:	57                   	push   %edi
 a9a:	ff 75 08             	pushl  0x8(%ebp)
 a9d:	e8 bb fd ff ff       	call   85d <write>
  for(i = 0; fmt[i]; i++){
 aa2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 aa6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 aa9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 aab:	84 db                	test   %bl,%bl
 aad:	75 8f                	jne    a3e <printf+0x5e>
    }
  }
}
 aaf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ab2:	5b                   	pop    %ebx
 ab3:	5e                   	pop    %esi
 ab4:	5f                   	pop    %edi
 ab5:	5d                   	pop    %ebp
 ab6:	c3                   	ret    
 ab7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 abe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 ac0:	83 ec 0c             	sub    $0xc,%esp
 ac3:	b9 10 00 00 00       	mov    $0x10,%ecx
 ac8:	6a 00                	push   $0x0
 aca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 acd:	8b 45 08             	mov    0x8(%ebp),%eax
 ad0:	8b 13                	mov    (%ebx),%edx
 ad2:	e8 59 fe ff ff       	call   930 <printint>
        ap++;
 ad7:	89 d8                	mov    %ebx,%eax
 ad9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 adc:	31 d2                	xor    %edx,%edx
        ap++;
 ade:	83 c0 04             	add    $0x4,%eax
 ae1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ae4:	e9 4b ff ff ff       	jmp    a34 <printf+0x54>
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 af0:	83 ec 0c             	sub    $0xc,%esp
 af3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 af8:	6a 01                	push   $0x1
 afa:	eb ce                	jmp    aca <printf+0xea>
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 b00:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b03:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b06:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 b08:	6a 01                	push   $0x1
        ap++;
 b0a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 b0d:	57                   	push   %edi
 b0e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 b11:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b14:	e8 44 fd ff ff       	call   85d <write>
        ap++;
 b19:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b1c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b1f:	31 d2                	xor    %edx,%edx
 b21:	e9 0e ff ff ff       	jmp    a34 <printf+0x54>
 b26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b2d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b30:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b33:	83 ec 04             	sub    $0x4,%esp
 b36:	e9 59 ff ff ff       	jmp    a94 <printf+0xb4>
 b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b3f:	90                   	nop
        s = (char*)*ap;
 b40:	8b 45 d0             	mov    -0x30(%ebp),%eax
 b43:	8b 18                	mov    (%eax),%ebx
        ap++;
 b45:	83 c0 04             	add    $0x4,%eax
 b48:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 b4b:	85 db                	test   %ebx,%ebx
 b4d:	74 17                	je     b66 <printf+0x186>
        while(*s != 0){
 b4f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 b52:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 b54:	84 c0                	test   %al,%al
 b56:	0f 84 d8 fe ff ff    	je     a34 <printf+0x54>
 b5c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b5f:	89 de                	mov    %ebx,%esi
 b61:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b64:	eb 1a                	jmp    b80 <printf+0x1a0>
          s = "(null)";
 b66:	bb e8 0d 00 00       	mov    $0xde8,%ebx
        while(*s != 0){
 b6b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b6e:	b8 28 00 00 00       	mov    $0x28,%eax
 b73:	89 de                	mov    %ebx,%esi
 b75:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b7f:	90                   	nop
  write(fd, &c, 1);
 b80:	83 ec 04             	sub    $0x4,%esp
          s++;
 b83:	83 c6 01             	add    $0x1,%esi
 b86:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b89:	6a 01                	push   $0x1
 b8b:	57                   	push   %edi
 b8c:	53                   	push   %ebx
 b8d:	e8 cb fc ff ff       	call   85d <write>
        while(*s != 0){
 b92:	0f b6 06             	movzbl (%esi),%eax
 b95:	83 c4 10             	add    $0x10,%esp
 b98:	84 c0                	test   %al,%al
 b9a:	75 e4                	jne    b80 <printf+0x1a0>
 b9c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b9f:	31 d2                	xor    %edx,%edx
 ba1:	e9 8e fe ff ff       	jmp    a34 <printf+0x54>
 ba6:	66 90                	xchg   %ax,%ax
 ba8:	66 90                	xchg   %ax,%ax
 baa:	66 90                	xchg   %ax,%ax
 bac:	66 90                	xchg   %ax,%ax
 bae:	66 90                	xchg   %ax,%ax

00000bb0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 bb0:	f3 0f 1e fb          	endbr32 
 bb4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bb5:	a1 24 12 00 00       	mov    0x1224,%eax
{
 bba:	89 e5                	mov    %esp,%ebp
 bbc:	57                   	push   %edi
 bbd:	56                   	push   %esi
 bbe:	53                   	push   %ebx
 bbf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bc2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 bc4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bc7:	39 c8                	cmp    %ecx,%eax
 bc9:	73 15                	jae    be0 <free+0x30>
 bcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bcf:	90                   	nop
 bd0:	39 d1                	cmp    %edx,%ecx
 bd2:	72 14                	jb     be8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bd4:	39 d0                	cmp    %edx,%eax
 bd6:	73 10                	jae    be8 <free+0x38>
{
 bd8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bda:	8b 10                	mov    (%eax),%edx
 bdc:	39 c8                	cmp    %ecx,%eax
 bde:	72 f0                	jb     bd0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 be0:	39 d0                	cmp    %edx,%eax
 be2:	72 f4                	jb     bd8 <free+0x28>
 be4:	39 d1                	cmp    %edx,%ecx
 be6:	73 f0                	jae    bd8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 be8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 beb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 bee:	39 fa                	cmp    %edi,%edx
 bf0:	74 1e                	je     c10 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 bf2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bf5:	8b 50 04             	mov    0x4(%eax),%edx
 bf8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bfb:	39 f1                	cmp    %esi,%ecx
 bfd:	74 28                	je     c27 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 bff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 c01:	5b                   	pop    %ebx
  freep = p;
 c02:	a3 24 12 00 00       	mov    %eax,0x1224
}
 c07:	5e                   	pop    %esi
 c08:	5f                   	pop    %edi
 c09:	5d                   	pop    %ebp
 c0a:	c3                   	ret    
 c0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c0f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 c10:	03 72 04             	add    0x4(%edx),%esi
 c13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 c16:	8b 10                	mov    (%eax),%edx
 c18:	8b 12                	mov    (%edx),%edx
 c1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c1d:	8b 50 04             	mov    0x4(%eax),%edx
 c20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c23:	39 f1                	cmp    %esi,%ecx
 c25:	75 d8                	jne    bff <free+0x4f>
    p->s.size += bp->s.size;
 c27:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 c2a:	a3 24 12 00 00       	mov    %eax,0x1224
    p->s.size += bp->s.size;
 c2f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c32:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c35:	89 10                	mov    %edx,(%eax)
}
 c37:	5b                   	pop    %ebx
 c38:	5e                   	pop    %esi
 c39:	5f                   	pop    %edi
 c3a:	5d                   	pop    %ebp
 c3b:	c3                   	ret    
 c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c40:	f3 0f 1e fb          	endbr32 
 c44:	55                   	push   %ebp
 c45:	89 e5                	mov    %esp,%ebp
 c47:	57                   	push   %edi
 c48:	56                   	push   %esi
 c49:	53                   	push   %ebx
 c4a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c50:	8b 3d 24 12 00 00    	mov    0x1224,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c56:	8d 70 07             	lea    0x7(%eax),%esi
 c59:	c1 ee 03             	shr    $0x3,%esi
 c5c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 c5f:	85 ff                	test   %edi,%edi
 c61:	0f 84 a9 00 00 00    	je     d10 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c67:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c69:	8b 48 04             	mov    0x4(%eax),%ecx
 c6c:	39 f1                	cmp    %esi,%ecx
 c6e:	73 6d                	jae    cdd <malloc+0x9d>
 c70:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c76:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c7b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 c7e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 c85:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 c88:	eb 17                	jmp    ca1 <malloc+0x61>
 c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c90:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c92:	8b 4a 04             	mov    0x4(%edx),%ecx
 c95:	39 f1                	cmp    %esi,%ecx
 c97:	73 4f                	jae    ce8 <malloc+0xa8>
 c99:	8b 3d 24 12 00 00    	mov    0x1224,%edi
 c9f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ca1:	39 c7                	cmp    %eax,%edi
 ca3:	75 eb                	jne    c90 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ca5:	83 ec 0c             	sub    $0xc,%esp
 ca8:	ff 75 e4             	pushl  -0x1c(%ebp)
 cab:	e8 15 fc ff ff       	call   8c5 <sbrk>
  if(p == (char*)-1)
 cb0:	83 c4 10             	add    $0x10,%esp
 cb3:	83 f8 ff             	cmp    $0xffffffff,%eax
 cb6:	74 1b                	je     cd3 <malloc+0x93>
  hp->s.size = nu;
 cb8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 cbb:	83 ec 0c             	sub    $0xc,%esp
 cbe:	83 c0 08             	add    $0x8,%eax
 cc1:	50                   	push   %eax
 cc2:	e8 e9 fe ff ff       	call   bb0 <free>
  return freep;
 cc7:	a1 24 12 00 00       	mov    0x1224,%eax
      if((p = morecore(nunits)) == 0)
 ccc:	83 c4 10             	add    $0x10,%esp
 ccf:	85 c0                	test   %eax,%eax
 cd1:	75 bd                	jne    c90 <malloc+0x50>
        return 0;
  }
}
 cd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 cd6:	31 c0                	xor    %eax,%eax
}
 cd8:	5b                   	pop    %ebx
 cd9:	5e                   	pop    %esi
 cda:	5f                   	pop    %edi
 cdb:	5d                   	pop    %ebp
 cdc:	c3                   	ret    
    if(p->s.size >= nunits){
 cdd:	89 c2                	mov    %eax,%edx
 cdf:	89 f8                	mov    %edi,%eax
 ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ce8:	39 ce                	cmp    %ecx,%esi
 cea:	74 54                	je     d40 <malloc+0x100>
        p->s.size -= nunits;
 cec:	29 f1                	sub    %esi,%ecx
 cee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 cf1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 cf4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 cf7:	a3 24 12 00 00       	mov    %eax,0x1224
}
 cfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 cff:	8d 42 08             	lea    0x8(%edx),%eax
}
 d02:	5b                   	pop    %ebx
 d03:	5e                   	pop    %esi
 d04:	5f                   	pop    %edi
 d05:	5d                   	pop    %ebp
 d06:	c3                   	ret    
 d07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d0e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 d10:	c7 05 24 12 00 00 28 	movl   $0x1228,0x1224
 d17:	12 00 00 
    base.s.size = 0;
 d1a:	bf 28 12 00 00       	mov    $0x1228,%edi
    base.s.ptr = freep = prevp = &base;
 d1f:	c7 05 28 12 00 00 28 	movl   $0x1228,0x1228
 d26:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d29:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 d2b:	c7 05 2c 12 00 00 00 	movl   $0x0,0x122c
 d32:	00 00 00 
    if(p->s.size >= nunits){
 d35:	e9 36 ff ff ff       	jmp    c70 <malloc+0x30>
 d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 d40:	8b 0a                	mov    (%edx),%ecx
 d42:	89 08                	mov    %ecx,(%eax)
 d44:	eb b1                	jmp    cf7 <malloc+0xb7>
