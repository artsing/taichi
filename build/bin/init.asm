
build/bin/_init：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("/dev/console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 28 0d 00 00       	push   $0xd28
  1d:	e8 3b 08 00 00       	call   85d <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("/dev/console", 1, 1);
    open("/dev/console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 5e 08 00 00       	call   895 <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 52 08 00 00       	call   895 <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 35 0d 00 00       	push   $0xd35
  58:	6a 01                	push   $0x1
  5a:	e8 61 09 00 00       	call   9c0 <printf>
    pid = fork();
  5f:	e8 b1 07 00 00       	call   815 <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("/bin/sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 b0 07 00 00       	call   825 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 79 0d 00 00       	push   $0xd79
  85:	6a 01                	push   $0x1
  87:	e8 34 09 00 00       	call   9c0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 48 0d 00 00       	push   $0xd48
  98:	6a 01                	push   $0x1
  9a:	e8 21 09 00 00       	call   9c0 <printf>
      exit();
  9f:	e8 79 07 00 00       	call   81d <exit>
      exec("/bin/sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 e4 11 00 00       	push   $0x11e4
  ab:	68 5b 0d 00 00       	push   $0xd5b
  b0:	e8 a0 07 00 00       	call   855 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 63 0d 00 00       	push   $0xd63
  bc:	6a 01                	push   $0x1
  be:	e8 fd 08 00 00       	call   9c0 <printf>
      exit();
  c3:	e8 55 07 00 00       	call   81d <exit>
    mknod("/dev/console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 28 0d 00 00       	push   $0xd28
  d2:	e8 8e 07 00 00       	call   865 <mknod>
    open("/dev/console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 28 0d 00 00       	push   $0xd28
  e0:	e8 78 07 00 00       	call   85d <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f5:	31 c0                	xor    %eax,%eax
{
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 7d 10             	mov    0x10(%ebp),%edi
 12b:	56                   	push   %esi
 12c:	8b 75 08             	mov    0x8(%ebp),%esi
 12f:	53                   	push   %ebx
 130:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 133:	85 ff                	test   %edi,%edi
 135:	74 39                	je     170 <strcat_s+0x50>
 137:	31 c0                	xor    %eax,%eax
 139:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 13e:	eb 11                	jmp    151 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 140:	0f b6 12             	movzbl (%edx),%edx
 143:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 146:	84 d2                	test   %dl,%dl
 148:	74 26                	je     170 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 14a:	83 c0 01             	add    $0x1,%eax
 14d:	39 c7                	cmp    %eax,%edi
 14f:	74 1f                	je     170 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 151:	89 c2                	mov    %eax,%edx
 153:	29 ca                	sub    %ecx,%edx
 155:	01 da                	add    %ebx,%edx
 157:	83 f9 ff             	cmp    $0xffffffff,%ecx
 15a:	75 e4                	jne    140 <strcat_s+0x20>
 15c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 160:	75 e8                	jne    14a <strcat_s+0x2a>
 162:	89 da                	mov    %ebx,%edx
 164:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 166:	0f b6 12             	movzbl (%edx),%edx
 169:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 16c:	84 d2                	test   %dl,%dl
 16e:	75 da                	jne    14a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 170:	5b                   	pop    %ebx
 171:	89 f0                	mov    %esi,%eax
 173:	5e                   	pop    %esi
 174:	5f                   	pop    %edi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18e:	0f b6 01             	movzbl (%ecx),%eax
 191:	0f b6 1a             	movzbl (%edx),%ebx
 194:	84 c0                	test   %al,%al
 196:	75 19                	jne    1b1 <strcmp+0x31>
 198:	eb 26                	jmp    1c0 <strcmp+0x40>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 1a             	movzbl (%edx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	38 d8                	cmp    %bl,%al
 1b3:	74 eb                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b5:	29 d8                	sub    %ebx,%eax
}
 1b7:	5b                   	pop    %ebx
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 3a 00             	cmpb   $0x0,(%edx)
 1dd:	74 21                	je     200 <strlen+0x30>
 1df:	31 c0                	xor    %eax,%eax
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ef:	89 c1                	mov    %eax,%ecx
 1f1:	75 f5                	jne    1e8 <strlen+0x18>
    ;
  return n;
}
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	89 d7                	mov    %edx,%edi
 223:	fc                   	cld    
 224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 226:	89 d0                	mov    %edx,%eax
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23e:	0f b6 10             	movzbl (%eax),%edx
 241:	84 d2                	test   %dl,%dl
 243:	75 16                	jne    25b <strchr+0x2b>
 245:	eb 21                	jmp    268 <strchr+0x38>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	31 f6                	xor    %esi,%esi
{
 27b:	53                   	push   %ebx
 27c:	89 f3                	mov    %esi,%ebx
 27e:	83 ec 1c             	sub    $0x1c,%esp
 281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 284:	eb 33                	jmp    2b9 <gets+0x49>
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	6a 00                	push   $0x0
 29b:	e8 95 05 00 00       	call   835 <read>
    if(cc < 1)
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 1c                	jle    2c3 <gets+0x53>
      break;
    buf[i++] = c;
 2a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 23                	je     2d8 <gets+0x68>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 1f                	je     2d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	89 fe                	mov    %edi,%esi
 2be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c1:	7c cd                	jl     290 <gets+0x20>
 2c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	8b 75 08             	mov    0x8(%ebp),%esi
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	01 de                	add    %ebx,%esi
 2e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 00                	push   $0x0
 2fe:	ff 75 08             	pushl  0x8(%ebp)
 301:	e8 57 05 00 00       	call   85d <open>
  if(fd < 0)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	78 2b                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 30d:	83 ec 08             	sub    $0x8,%esp
 310:	ff 75 0c             	pushl  0xc(%ebp)
 313:	89 c3                	mov    %eax,%ebx
 315:	50                   	push   %eax
 316:	e8 5a 05 00 00       	call   875 <fstat>
  close(fd);
 31b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	e8 20 05 00 00       	call   845 <close>
  return r;
 325:	83 c4 10             	add    $0x10,%esp
}
 328:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32b:	89 f0                	mov    %esi,%eax
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33d:	eb e9                	jmp    328 <stat+0x38>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	0f be 02             	movsbl (%edx),%eax
 34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 359:	77 1a                	ja     375 <atoi+0x35>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	89 c8                	mov    %ecx,%eax
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	8b 55 08             	mov    0x8(%ebp),%edx
 38e:	56                   	push   %esi
 38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	85 c0                	test   %eax,%eax
 394:	7e 0f                	jle    3a5 <memmove+0x25>
 396:	01 d0                	add    %edx,%eax
  dst = vdst;
 398:	89 d7                	mov    %edx,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	57                   	push   %edi
 3b8:	56                   	push   %esi
 3b9:	53                   	push   %ebx
 3ba:	83 ec 34             	sub    $0x34,%esp
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3c0:	68 84 0d 00 00       	push   $0xd84
hexdump (void *data, size_t size) {
 3c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 3c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3cb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 3cd:	89 c7                	mov    %eax,%edi
 3cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3d2:	e8 e9 05 00 00       	call   9c0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 3d7:	83 c4 10             	add    $0x10,%esp
 3da:	85 ff                	test   %edi,%edi
 3dc:	0f 84 2d 01 00 00    	je     50f <hexdump+0x15f>
 3e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 3e5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 3ec:	be 10 00 00 00       	mov    $0x10,%esi
 3f1:	83 e8 01             	sub    $0x1,%eax
 3f4:	83 e0 f0             	and    $0xfffffff0,%eax
 3f7:	83 c0 10             	add    $0x10,%eax
 3fa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 400:	83 ec 08             	sub    $0x8,%esp
 403:	68 d8 0d 00 00       	push   $0xdd8
 408:	6a 01                	push   $0x1
 40a:	e8 b1 05 00 00       	call   9c0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 40f:	83 c4 10             	add    $0x10,%esp
 412:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 419:	0f 8e 51 01 00 00    	jle    570 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 41f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 422:	83 ec 04             	sub    $0x4,%esp
 425:	57                   	push   %edi
 426:	89 fb                	mov    %edi,%ebx
 428:	68 d5 0d 00 00       	push   $0xdd5
 42d:	6a 01                	push   $0x1
 42f:	e8 8c 05 00 00       	call   9c0 <printf>
 434:	89 7d d8             	mov    %edi,-0x28(%ebp)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 43d:	eb 28                	jmp    467 <hexdump+0xb7>
 43f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 440:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 444:	80 fa 0f             	cmp    $0xf,%dl
 447:	0f 86 e3 00 00 00    	jbe    530 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 44d:	83 ec 04             	sub    $0x4,%esp
 450:	83 c3 01             	add    $0x1,%ebx
 453:	52                   	push   %edx
 454:	68 db 0d 00 00       	push   $0xddb
 459:	6a 01                	push   $0x1
 45b:	e8 60 05 00 00       	call   9c0 <printf>
 460:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 463:	39 f3                	cmp    %esi,%ebx
 465:	74 1e                	je     485 <hexdump+0xd5>
      if(offset + index < (int)size) {
 467:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 46a:	7f d4                	jg     440 <hexdump+0x90>
      } else {
        printf(1, "   ");
 46c:	83 ec 08             	sub    $0x8,%esp
 46f:	83 c3 01             	add    $0x1,%ebx
 472:	68 df 0d 00 00       	push   $0xddf
 477:	6a 01                	push   $0x1
 479:	e8 42 05 00 00       	call   9c0 <printf>
 47e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 481:	39 f3                	cmp    %esi,%ebx
 483:	75 e2                	jne    467 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 485:	83 ec 08             	sub    $0x8,%esp
 488:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 48b:	68 d8 0d 00 00       	push   $0xdd8
 490:	6a 01                	push   $0x1
 492:	e8 29 05 00 00       	call   9c0 <printf>
 497:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 49a:	83 c4 10             	add    $0x10,%esp
 49d:	eb 1b                	jmp    4ba <hexdump+0x10a>
 49f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	52                   	push   %edx
 4a4:	68 e3 0d 00 00       	push   $0xde3
 4a9:	6a 01                	push   $0x1
 4ab:	e8 10 05 00 00       	call   9c0 <printf>
 4b0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4b3:	83 c3 01             	add    $0x1,%ebx
 4b6:	39 de                	cmp    %ebx,%esi
 4b8:	74 30                	je     4ea <hexdump+0x13a>
      if(offset + index < (int)size) {
 4ba:	39 df                	cmp    %ebx,%edi
 4bc:	0f 8e 8e 00 00 00    	jle    550 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 4c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 4c5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4c9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 4cc:	80 f9 5e             	cmp    $0x5e,%cl
 4cf:	76 cf                	jbe    4a0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	83 c3 01             	add    $0x1,%ebx
 4d7:	68 e6 0d 00 00       	push   $0xde6
 4dc:	6a 01                	push   $0x1
 4de:	e8 dd 04 00 00       	call   9c0 <printf>
 4e3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4e6:	39 de                	cmp    %ebx,%esi
 4e8:	75 d0                	jne    4ba <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 4ea:	83 ec 08             	sub    $0x8,%esp
 4ed:	83 c6 10             	add    $0x10,%esi
 4f0:	68 e8 0d 00 00       	push   $0xde8
 4f5:	6a 01                	push   $0x1
 4f7:	e8 c4 04 00 00       	call   9c0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4fc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 500:	83 c4 10             	add    $0x10,%esp
 503:	8b 45 dc             	mov    -0x24(%ebp),%eax
 506:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 509:	0f 85 f1 fe ff ff    	jne    400 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 50f:	c7 45 0c 84 0d 00 00 	movl   $0xd84,0xc(%ebp)
 516:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 51d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5f                   	pop    %edi
 523:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 524:	e9 97 04 00 00       	jmp    9c0 <printf>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 530:	83 ec 08             	sub    $0x8,%esp
 533:	68 d3 0d 00 00       	push   $0xdd3
 538:	6a 01                	push   $0x1
 53a:	e8 81 04 00 00       	call   9c0 <printf>
 53f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 543:	83 c4 10             	add    $0x10,%esp
 546:	e9 02 ff ff ff       	jmp    44d <hexdump+0x9d>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
        printf(1, " ");
 550:	83 ec 08             	sub    $0x8,%esp
 553:	68 e1 0d 00 00       	push   $0xde1
 558:	6a 01                	push   $0x1
 55a:	e8 61 04 00 00       	call   9c0 <printf>
 55f:	83 c4 10             	add    $0x10,%esp
 562:	e9 4c ff ff ff       	jmp    4b3 <hexdump+0x103>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 570:	83 ec 08             	sub    $0x8,%esp
 573:	68 d3 0d 00 00       	push   $0xdd3
 578:	6a 01                	push   $0x1
 57a:	e8 41 04 00 00       	call   9c0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 57f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 582:	83 c4 10             	add    $0x10,%esp
 585:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 58b:	0f 8f 8e fe ff ff    	jg     41f <hexdump+0x6f>
 591:	83 ec 08             	sub    $0x8,%esp
 594:	68 d3 0d 00 00       	push   $0xdd3
 599:	6a 01                	push   $0x1
 59b:	e8 20 04 00 00       	call   9c0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 5a0:	83 c4 10             	add    $0x10,%esp
 5a3:	83 ff 0f             	cmp    $0xf,%edi
 5a6:	0f 8f 73 fe ff ff    	jg     41f <hexdump+0x6f>
 5ac:	83 ec 08             	sub    $0x8,%esp
 5af:	68 d3 0d 00 00       	push   $0xdd3
 5b4:	6a 01                	push   $0x1
 5b6:	e8 05 04 00 00       	call   9c0 <printf>
 5bb:	83 c4 10             	add    $0x10,%esp
 5be:	e9 5c fe ff ff       	jmp    41f <hexdump+0x6f>
 5c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005d0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	55                   	push   %ebp
    if (!endian)
 5d5:	a1 ec 11 00 00       	mov    0x11ec,%eax
{
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 5df:	85 c0                	test   %eax,%eax
 5e1:	75 1d                	jne    600 <hton16+0x30>
        endian = byteorder();
 5e3:	c7 05 ec 11 00 00 d2 	movl   $0x4d2,0x11ec
 5ea:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 5ed:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 5ef:	5d                   	pop    %ebp
 5f0:	66 c1 c2 08          	rol    $0x8,%dx
 5f4:	89 d0                	mov    %edx,%eax
 5f6:	c3                   	ret    
 5f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fe:	66 90                	xchg   %ax,%ax
 600:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 602:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 607:	74 e4                	je     5ed <hton16+0x1d>
}
 609:	89 d0                	mov    %edx,%eax
 60b:	5d                   	pop    %ebp
 60c:	c3                   	ret    
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <ntoh16>:
 610:	f3 0f 1e fb          	endbr32 
 614:	eb ba                	jmp    5d0 <hton16>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi

00000620 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
    if (!endian)
 625:	8b 15 ec 11 00 00    	mov    0x11ec,%edx
{
 62b:	89 e5                	mov    %esp,%ebp
 62d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 630:	85 d2                	test   %edx,%edx
 632:	75 14                	jne    648 <hton32+0x28>
        endian = byteorder();
 634:	c7 05 ec 11 00 00 d2 	movl   $0x4d2,0x11ec
 63b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 63e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 640:	5d                   	pop    %ebp
 641:	c3                   	ret    
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 648:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 64e:	74 ee                	je     63e <hton32+0x1e>
}
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
 652:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000660 <ntoh32>:
 660:	f3 0f 1e fb          	endbr32 
 664:	eb ba                	jmp    620 <hton32>
 666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi

00000670 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	57                   	push   %edi
 678:	8b 4d 08             	mov    0x8(%ebp),%ecx
 67b:	56                   	push   %esi
 67c:	53                   	push   %ebx
 67d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 680:	0f b6 01             	movzbl (%ecx),%eax
 683:	3c 09                	cmp    $0x9,%al
 685:	74 09                	je     690 <strtol+0x20>
 687:	3c 20                	cmp    $0x20,%al
 689:	75 14                	jne    69f <strtol+0x2f>
 68b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
 690:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 694:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 697:	3c 20                	cmp    $0x20,%al
 699:	74 f5                	je     690 <strtol+0x20>
 69b:	3c 09                	cmp    $0x9,%al
 69d:	74 f1                	je     690 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 69f:	3c 2b                	cmp    $0x2b,%al
 6a1:	0f 84 a9 00 00 00    	je     750 <strtol+0xe0>
    int neg = 0;
 6a7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 6a9:	3c 2d                	cmp    $0x2d,%al
 6ab:	0f 84 8f 00 00 00    	je     740 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6b1:	0f be 11             	movsbl (%ecx),%edx
 6b4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 6ba:	75 12                	jne    6ce <strtol+0x5e>
 6bc:	80 fa 30             	cmp    $0x30,%dl
 6bf:	0f 84 9b 00 00 00    	je     760 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 6c5:	85 db                	test   %ebx,%ebx
 6c7:	75 05                	jne    6ce <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 6c9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 6ce:	89 5d 10             	mov    %ebx,0x10(%ebp)
 6d1:	31 c0                	xor    %eax,%eax
 6d3:	eb 17                	jmp    6ec <strtol+0x7c>
 6d5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 6d8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 6db:	3b 55 10             	cmp    0x10(%ebp),%edx
 6de:	7d 28                	jge    708 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 6e0:	0f af 45 10          	imul   0x10(%ebp),%eax
 6e4:	83 c1 01             	add    $0x1,%ecx
 6e7:	01 d0                	add    %edx,%eax
    while (1) {
 6e9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 6ec:	8d 72 d0             	lea    -0x30(%edx),%esi
 6ef:	89 f3                	mov    %esi,%ebx
 6f1:	80 fb 09             	cmp    $0x9,%bl
 6f4:	76 e2                	jbe    6d8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 6f6:	8d 72 9f             	lea    -0x61(%edx),%esi
 6f9:	89 f3                	mov    %esi,%ebx
 6fb:	80 fb 19             	cmp    $0x19,%bl
 6fe:	77 28                	ja     728 <strtol+0xb8>
            dig = *s - 'a' + 10;
 700:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 703:	3b 55 10             	cmp    0x10(%ebp),%edx
 706:	7c d8                	jl     6e0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 708:	8b 55 0c             	mov    0xc(%ebp),%edx
 70b:	85 d2                	test   %edx,%edx
 70d:	74 05                	je     714 <strtol+0xa4>
        *endptr = (char *) s;
 70f:	8b 75 0c             	mov    0xc(%ebp),%esi
 712:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 714:	89 c2                	mov    %eax,%edx
}
 716:	5b                   	pop    %ebx
 717:	5e                   	pop    %esi
    return (neg ? -val : val);
 718:	f7 da                	neg    %edx
 71a:	85 ff                	test   %edi,%edi
}
 71c:	5f                   	pop    %edi
 71d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 71e:	0f 45 c2             	cmovne %edx,%eax
}
 721:	c3                   	ret    
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 728:	8d 72 bf             	lea    -0x41(%edx),%esi
 72b:	89 f3                	mov    %esi,%ebx
 72d:	80 fb 19             	cmp    $0x19,%bl
 730:	77 d6                	ja     708 <strtol+0x98>
            dig = *s - 'A' + 10;
 732:	83 ea 37             	sub    $0x37,%edx
 735:	eb a4                	jmp    6db <strtol+0x6b>
 737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 740:	83 c1 01             	add    $0x1,%ecx
 743:	bf 01 00 00 00       	mov    $0x1,%edi
 748:	e9 64 ff ff ff       	jmp    6b1 <strtol+0x41>
 74d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 750:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 753:	31 ff                	xor    %edi,%edi
 755:	e9 57 ff ff ff       	jmp    6b1 <strtol+0x41>
 75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 760:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 764:	3c 78                	cmp    $0x78,%al
 766:	74 18                	je     780 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 768:	85 db                	test   %ebx,%ebx
 76a:	0f 85 5e ff ff ff    	jne    6ce <strtol+0x5e>
        s++, base = 8;
 770:	83 c1 01             	add    $0x1,%ecx
 773:	0f be d0             	movsbl %al,%edx
 776:	bb 08 00 00 00       	mov    $0x8,%ebx
 77b:	e9 4e ff ff ff       	jmp    6ce <strtol+0x5e>
        s += 2, base = 16;
 780:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 784:	bb 10 00 00 00       	mov    $0x10,%ebx
 789:	83 c1 02             	add    $0x2,%ecx
 78c:	e9 3d ff ff ff       	jmp    6ce <strtol+0x5e>
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop

000007a0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 7a0:	f3 0f 1e fb          	endbr32 
 7a4:	55                   	push   %ebp
 7a5:	89 e5                	mov    %esp,%ebp
 7a7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 7a8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 7aa:	56                   	push   %esi
 7ab:	53                   	push   %ebx
 7ac:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 7af:	83 ec 1c             	sub    $0x1c,%esp
 7b2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 7b5:	83 ec 04             	sub    $0x4,%esp
 7b8:	6a 0a                	push   $0xa
 7ba:	53                   	push   %ebx
 7bb:	56                   	push   %esi
 7bc:	e8 af fe ff ff       	call   670 <strtol>
        if (ret < 0 || ret > 255) {
 7c1:	83 c4 10             	add    $0x10,%esp
 7c4:	3d ff 00 00 00       	cmp    $0xff,%eax
 7c9:	77 3d                	ja     808 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 7cb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 7ce:	39 f1                	cmp    %esi,%ecx
 7d0:	74 36                	je     808 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7d2:	0f b6 11             	movzbl (%ecx),%edx
 7d5:	83 ff 03             	cmp    $0x3,%edi
 7d8:	74 16                	je     7f0 <ip_addr_pton+0x50>
 7da:	80 fa 2e             	cmp    $0x2e,%dl
 7dd:	75 29                	jne    808 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 7df:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 7e2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 7e5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 7e8:	83 c7 01             	add    $0x1,%edi
 7eb:	eb c8                	jmp    7b5 <ip_addr_pton+0x15>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7f0:	84 d2                	test   %dl,%dl
 7f2:	75 14                	jne    808 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 7f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 7f7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 7fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 7fd:	31 c0                	xor    %eax,%eax
}
 7ff:	5b                   	pop    %ebx
 800:	5e                   	pop    %esi
 801:	5f                   	pop    %edi
 802:	5d                   	pop    %ebp
 803:	c3                   	ret    
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 808:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 80b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 810:	5b                   	pop    %ebx
 811:	5e                   	pop    %esi
 812:	5f                   	pop    %edi
 813:	5d                   	pop    %ebp
 814:	c3                   	ret    

00000815 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 815:	b8 01 00 00 00       	mov    $0x1,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <exit>:
SYSCALL(exit)
 81d:	b8 02 00 00 00       	mov    $0x2,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <wait>:
SYSCALL(wait)
 825:	b8 03 00 00 00       	mov    $0x3,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <pipe>:
SYSCALL(pipe)
 82d:	b8 04 00 00 00       	mov    $0x4,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <read>:
SYSCALL(read)
 835:	b8 05 00 00 00       	mov    $0x5,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <write>:
SYSCALL(write)
 83d:	b8 10 00 00 00       	mov    $0x10,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <close>:
SYSCALL(close)
 845:	b8 15 00 00 00       	mov    $0x15,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <kill>:
SYSCALL(kill)
 84d:	b8 06 00 00 00       	mov    $0x6,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <exec>:
SYSCALL(exec)
 855:	b8 07 00 00 00       	mov    $0x7,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <open>:
SYSCALL(open)
 85d:	b8 0f 00 00 00       	mov    $0xf,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <mknod>:
SYSCALL(mknod)
 865:	b8 11 00 00 00       	mov    $0x11,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <unlink>:
SYSCALL(unlink)
 86d:	b8 12 00 00 00       	mov    $0x12,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <fstat>:
SYSCALL(fstat)
 875:	b8 08 00 00 00       	mov    $0x8,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <link>:
SYSCALL(link)
 87d:	b8 13 00 00 00       	mov    $0x13,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <mkdir>:
SYSCALL(mkdir)
 885:	b8 14 00 00 00       	mov    $0x14,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <chdir>:
SYSCALL(chdir)
 88d:	b8 09 00 00 00       	mov    $0x9,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <dup>:
SYSCALL(dup)
 895:	b8 0a 00 00 00       	mov    $0xa,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <getpid>:
SYSCALL(getpid)
 89d:	b8 0b 00 00 00       	mov    $0xb,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <sbrk>:
SYSCALL(sbrk)
 8a5:	b8 0c 00 00 00       	mov    $0xc,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <sleep>:
SYSCALL(sleep)
 8ad:	b8 0d 00 00 00       	mov    $0xd,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <uptime>:
SYSCALL(uptime)
 8b5:	b8 0e 00 00 00       	mov    $0xe,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <ioctl>:
# iotcl
SYSCALL(ioctl)
 8bd:	b8 16 00 00 00       	mov    $0x16,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <socket>:
# socket
SYSCALL(socket)
 8c5:	b8 17 00 00 00       	mov    $0x17,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <bind>:
SYSCALL(bind)
 8cd:	b8 19 00 00 00       	mov    $0x19,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <listen>:
SYSCALL(listen)
 8d5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <accept>:
SYSCALL(accept)
 8dd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <recv>:
SYSCALL(recv)
 8e5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <send>:
SYSCALL(send)
 8ed:	b8 1d 00 00 00       	mov    $0x1d,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <recvfrom>:
SYSCALL(recvfrom)
 8f5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <sendto>:
SYSCALL(sendto)
 8fd:	b8 1f 00 00 00       	mov    $0x1f,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    
 905:	66 90                	xchg   %ax,%ax
 907:	66 90                	xchg   %ax,%ax
 909:	66 90                	xchg   %ax,%ax
 90b:	66 90                	xchg   %ax,%ax
 90d:	66 90                	xchg   %ax,%ax
 90f:	90                   	nop

00000910 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 3c             	sub    $0x3c,%esp
 919:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 91c:	89 d1                	mov    %edx,%ecx
{
 91e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 921:	85 d2                	test   %edx,%edx
 923:	0f 89 7f 00 00 00    	jns    9a8 <printint+0x98>
 929:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 92d:	74 79                	je     9a8 <printint+0x98>
    neg = 1;
 92f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 936:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 938:	31 db                	xor    %ebx,%ebx
 93a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 940:	89 c8                	mov    %ecx,%eax
 942:	31 d2                	xor    %edx,%edx
 944:	89 cf                	mov    %ecx,%edi
 946:	f7 75 c4             	divl   -0x3c(%ebp)
 949:	0f b6 92 f4 0d 00 00 	movzbl 0xdf4(%edx),%edx
 950:	89 45 c0             	mov    %eax,-0x40(%ebp)
 953:	89 d8                	mov    %ebx,%eax
 955:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 958:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 95b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 95e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 961:	76 dd                	jbe    940 <printint+0x30>
  if(neg)
 963:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 966:	85 c9                	test   %ecx,%ecx
 968:	74 0c                	je     976 <printint+0x66>
    buf[i++] = '-';
 96a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 96f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 971:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 976:	8b 7d b8             	mov    -0x48(%ebp),%edi
 979:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 97d:	eb 07                	jmp    986 <printint+0x76>
 97f:	90                   	nop
 980:	0f b6 13             	movzbl (%ebx),%edx
 983:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 986:	83 ec 04             	sub    $0x4,%esp
 989:	88 55 d7             	mov    %dl,-0x29(%ebp)
 98c:	6a 01                	push   $0x1
 98e:	56                   	push   %esi
 98f:	57                   	push   %edi
 990:	e8 a8 fe ff ff       	call   83d <write>
  while(--i >= 0)
 995:	83 c4 10             	add    $0x10,%esp
 998:	39 de                	cmp    %ebx,%esi
 99a:	75 e4                	jne    980 <printint+0x70>
    putc(fd, buf[i]);
}
 99c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 99f:	5b                   	pop    %ebx
 9a0:	5e                   	pop    %esi
 9a1:	5f                   	pop    %edi
 9a2:	5d                   	pop    %ebp
 9a3:	c3                   	ret    
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 9a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 9af:	eb 87                	jmp    938 <printint+0x28>
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bf:	90                   	nop

000009c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 9c0:	f3 0f 1e fb          	endbr32 
 9c4:	55                   	push   %ebp
 9c5:	89 e5                	mov    %esp,%ebp
 9c7:	57                   	push   %edi
 9c8:	56                   	push   %esi
 9c9:	53                   	push   %ebx
 9ca:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9cd:	8b 75 0c             	mov    0xc(%ebp),%esi
 9d0:	0f b6 1e             	movzbl (%esi),%ebx
 9d3:	84 db                	test   %bl,%bl
 9d5:	0f 84 b4 00 00 00    	je     a8f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 9db:	8d 45 10             	lea    0x10(%ebp),%eax
 9de:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 9e1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 9e4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 9e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9e9:	eb 33                	jmp    a1e <printf+0x5e>
 9eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9ef:	90                   	nop
 9f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9f3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 9f8:	83 f8 25             	cmp    $0x25,%eax
 9fb:	74 17                	je     a14 <printf+0x54>
  write(fd, &c, 1);
 9fd:	83 ec 04             	sub    $0x4,%esp
 a00:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a03:	6a 01                	push   $0x1
 a05:	57                   	push   %edi
 a06:	ff 75 08             	pushl  0x8(%ebp)
 a09:	e8 2f fe ff ff       	call   83d <write>
 a0e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a11:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a14:	0f b6 1e             	movzbl (%esi),%ebx
 a17:	83 c6 01             	add    $0x1,%esi
 a1a:	84 db                	test   %bl,%bl
 a1c:	74 71                	je     a8f <printf+0xcf>
    c = fmt[i] & 0xff;
 a1e:	0f be cb             	movsbl %bl,%ecx
 a21:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a24:	85 d2                	test   %edx,%edx
 a26:	74 c8                	je     9f0 <printf+0x30>
      }
    } else if(state == '%'){
 a28:	83 fa 25             	cmp    $0x25,%edx
 a2b:	75 e7                	jne    a14 <printf+0x54>
      if(c == 'd'){
 a2d:	83 f8 64             	cmp    $0x64,%eax
 a30:	0f 84 9a 00 00 00    	je     ad0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a36:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a3c:	83 f9 70             	cmp    $0x70,%ecx
 a3f:	74 5f                	je     aa0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a41:	83 f8 73             	cmp    $0x73,%eax
 a44:	0f 84 d6 00 00 00    	je     b20 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a4a:	83 f8 63             	cmp    $0x63,%eax
 a4d:	0f 84 8d 00 00 00    	je     ae0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a53:	83 f8 25             	cmp    $0x25,%eax
 a56:	0f 84 b4 00 00 00    	je     b10 <printf+0x150>
  write(fd, &c, 1);
 a5c:	83 ec 04             	sub    $0x4,%esp
 a5f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a63:	6a 01                	push   $0x1
 a65:	57                   	push   %edi
 a66:	ff 75 08             	pushl  0x8(%ebp)
 a69:	e8 cf fd ff ff       	call   83d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a6e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a71:	83 c4 0c             	add    $0xc,%esp
 a74:	6a 01                	push   $0x1
 a76:	83 c6 01             	add    $0x1,%esi
 a79:	57                   	push   %edi
 a7a:	ff 75 08             	pushl  0x8(%ebp)
 a7d:	e8 bb fd ff ff       	call   83d <write>
  for(i = 0; fmt[i]; i++){
 a82:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a86:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a89:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a8b:	84 db                	test   %bl,%bl
 a8d:	75 8f                	jne    a1e <printf+0x5e>
    }
  }
}
 a8f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a92:	5b                   	pop    %ebx
 a93:	5e                   	pop    %esi
 a94:	5f                   	pop    %edi
 a95:	5d                   	pop    %ebp
 a96:	c3                   	ret    
 a97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 aa0:	83 ec 0c             	sub    $0xc,%esp
 aa3:	b9 10 00 00 00       	mov    $0x10,%ecx
 aa8:	6a 00                	push   $0x0
 aaa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 aad:	8b 45 08             	mov    0x8(%ebp),%eax
 ab0:	8b 13                	mov    (%ebx),%edx
 ab2:	e8 59 fe ff ff       	call   910 <printint>
        ap++;
 ab7:	89 d8                	mov    %ebx,%eax
 ab9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 abc:	31 d2                	xor    %edx,%edx
        ap++;
 abe:	83 c0 04             	add    $0x4,%eax
 ac1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ac4:	e9 4b ff ff ff       	jmp    a14 <printf+0x54>
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 ad0:	83 ec 0c             	sub    $0xc,%esp
 ad3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ad8:	6a 01                	push   $0x1
 ada:	eb ce                	jmp    aaa <printf+0xea>
 adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 ae0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 ae3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 ae6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 ae8:	6a 01                	push   $0x1
        ap++;
 aea:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 aed:	57                   	push   %edi
 aee:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 af1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 af4:	e8 44 fd ff ff       	call   83d <write>
        ap++;
 af9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 afc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 aff:	31 d2                	xor    %edx,%edx
 b01:	e9 0e ff ff ff       	jmp    a14 <printf+0x54>
 b06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b0d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b10:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b13:	83 ec 04             	sub    $0x4,%esp
 b16:	e9 59 ff ff ff       	jmp    a74 <printf+0xb4>
 b1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop
        s = (char*)*ap;
 b20:	8b 45 d0             	mov    -0x30(%ebp),%eax
 b23:	8b 18                	mov    (%eax),%ebx
        ap++;
 b25:	83 c0 04             	add    $0x4,%eax
 b28:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 b2b:	85 db                	test   %ebx,%ebx
 b2d:	74 17                	je     b46 <printf+0x186>
        while(*s != 0){
 b2f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 b32:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 b34:	84 c0                	test   %al,%al
 b36:	0f 84 d8 fe ff ff    	je     a14 <printf+0x54>
 b3c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b3f:	89 de                	mov    %ebx,%esi
 b41:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b44:	eb 1a                	jmp    b60 <printf+0x1a0>
          s = "(null)";
 b46:	bb ec 0d 00 00       	mov    $0xdec,%ebx
        while(*s != 0){
 b4b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b4e:	b8 28 00 00 00       	mov    $0x28,%eax
 b53:	89 de                	mov    %ebx,%esi
 b55:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b5f:	90                   	nop
  write(fd, &c, 1);
 b60:	83 ec 04             	sub    $0x4,%esp
          s++;
 b63:	83 c6 01             	add    $0x1,%esi
 b66:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b69:	6a 01                	push   $0x1
 b6b:	57                   	push   %edi
 b6c:	53                   	push   %ebx
 b6d:	e8 cb fc ff ff       	call   83d <write>
        while(*s != 0){
 b72:	0f b6 06             	movzbl (%esi),%eax
 b75:	83 c4 10             	add    $0x10,%esp
 b78:	84 c0                	test   %al,%al
 b7a:	75 e4                	jne    b60 <printf+0x1a0>
 b7c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b7f:	31 d2                	xor    %edx,%edx
 b81:	e9 8e fe ff ff       	jmp    a14 <printf+0x54>
 b86:	66 90                	xchg   %ax,%ax
 b88:	66 90                	xchg   %ax,%ax
 b8a:	66 90                	xchg   %ax,%ax
 b8c:	66 90                	xchg   %ax,%ax
 b8e:	66 90                	xchg   %ax,%ax

00000b90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b90:	f3 0f 1e fb          	endbr32 
 b94:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b95:	a1 f0 11 00 00       	mov    0x11f0,%eax
{
 b9a:	89 e5                	mov    %esp,%ebp
 b9c:	57                   	push   %edi
 b9d:	56                   	push   %esi
 b9e:	53                   	push   %ebx
 b9f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ba2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 ba4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ba7:	39 c8                	cmp    %ecx,%eax
 ba9:	73 15                	jae    bc0 <free+0x30>
 bab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 baf:	90                   	nop
 bb0:	39 d1                	cmp    %edx,%ecx
 bb2:	72 14                	jb     bc8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb4:	39 d0                	cmp    %edx,%eax
 bb6:	73 10                	jae    bc8 <free+0x38>
{
 bb8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bba:	8b 10                	mov    (%eax),%edx
 bbc:	39 c8                	cmp    %ecx,%eax
 bbe:	72 f0                	jb     bb0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bc0:	39 d0                	cmp    %edx,%eax
 bc2:	72 f4                	jb     bb8 <free+0x28>
 bc4:	39 d1                	cmp    %edx,%ecx
 bc6:	73 f0                	jae    bb8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 bc8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 bcb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 bce:	39 fa                	cmp    %edi,%edx
 bd0:	74 1e                	je     bf0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 bd2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bd5:	8b 50 04             	mov    0x4(%eax),%edx
 bd8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bdb:	39 f1                	cmp    %esi,%ecx
 bdd:	74 28                	je     c07 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 bdf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 be1:	5b                   	pop    %ebx
  freep = p;
 be2:	a3 f0 11 00 00       	mov    %eax,0x11f0
}
 be7:	5e                   	pop    %esi
 be8:	5f                   	pop    %edi
 be9:	5d                   	pop    %ebp
 bea:	c3                   	ret    
 beb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bef:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 bf0:	03 72 04             	add    0x4(%edx),%esi
 bf3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bf6:	8b 10                	mov    (%eax),%edx
 bf8:	8b 12                	mov    (%edx),%edx
 bfa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bfd:	8b 50 04             	mov    0x4(%eax),%edx
 c00:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c03:	39 f1                	cmp    %esi,%ecx
 c05:	75 d8                	jne    bdf <free+0x4f>
    p->s.size += bp->s.size;
 c07:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 c0a:	a3 f0 11 00 00       	mov    %eax,0x11f0
    p->s.size += bp->s.size;
 c0f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c12:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c15:	89 10                	mov    %edx,(%eax)
}
 c17:	5b                   	pop    %ebx
 c18:	5e                   	pop    %esi
 c19:	5f                   	pop    %edi
 c1a:	5d                   	pop    %ebp
 c1b:	c3                   	ret    
 c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c20:	f3 0f 1e fb          	endbr32 
 c24:	55                   	push   %ebp
 c25:	89 e5                	mov    %esp,%ebp
 c27:	57                   	push   %edi
 c28:	56                   	push   %esi
 c29:	53                   	push   %ebx
 c2a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c2d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c30:	8b 3d f0 11 00 00    	mov    0x11f0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c36:	8d 70 07             	lea    0x7(%eax),%esi
 c39:	c1 ee 03             	shr    $0x3,%esi
 c3c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 c3f:	85 ff                	test   %edi,%edi
 c41:	0f 84 a9 00 00 00    	je     cf0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c47:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c49:	8b 48 04             	mov    0x4(%eax),%ecx
 c4c:	39 f1                	cmp    %esi,%ecx
 c4e:	73 6d                	jae    cbd <malloc+0x9d>
 c50:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c56:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c5b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 c5e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 c65:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 c68:	eb 17                	jmp    c81 <malloc+0x61>
 c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c70:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c72:	8b 4a 04             	mov    0x4(%edx),%ecx
 c75:	39 f1                	cmp    %esi,%ecx
 c77:	73 4f                	jae    cc8 <malloc+0xa8>
 c79:	8b 3d f0 11 00 00    	mov    0x11f0,%edi
 c7f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c81:	39 c7                	cmp    %eax,%edi
 c83:	75 eb                	jne    c70 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c85:	83 ec 0c             	sub    $0xc,%esp
 c88:	ff 75 e4             	pushl  -0x1c(%ebp)
 c8b:	e8 15 fc ff ff       	call   8a5 <sbrk>
  if(p == (char*)-1)
 c90:	83 c4 10             	add    $0x10,%esp
 c93:	83 f8 ff             	cmp    $0xffffffff,%eax
 c96:	74 1b                	je     cb3 <malloc+0x93>
  hp->s.size = nu;
 c98:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c9b:	83 ec 0c             	sub    $0xc,%esp
 c9e:	83 c0 08             	add    $0x8,%eax
 ca1:	50                   	push   %eax
 ca2:	e8 e9 fe ff ff       	call   b90 <free>
  return freep;
 ca7:	a1 f0 11 00 00       	mov    0x11f0,%eax
      if((p = morecore(nunits)) == 0)
 cac:	83 c4 10             	add    $0x10,%esp
 caf:	85 c0                	test   %eax,%eax
 cb1:	75 bd                	jne    c70 <malloc+0x50>
        return 0;
  }
}
 cb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 cb6:	31 c0                	xor    %eax,%eax
}
 cb8:	5b                   	pop    %ebx
 cb9:	5e                   	pop    %esi
 cba:	5f                   	pop    %edi
 cbb:	5d                   	pop    %ebp
 cbc:	c3                   	ret    
    if(p->s.size >= nunits){
 cbd:	89 c2                	mov    %eax,%edx
 cbf:	89 f8                	mov    %edi,%eax
 cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 cc8:	39 ce                	cmp    %ecx,%esi
 cca:	74 54                	je     d20 <malloc+0x100>
        p->s.size -= nunits;
 ccc:	29 f1                	sub    %esi,%ecx
 cce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 cd1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 cd4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 cd7:	a3 f0 11 00 00       	mov    %eax,0x11f0
}
 cdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 cdf:	8d 42 08             	lea    0x8(%edx),%eax
}
 ce2:	5b                   	pop    %ebx
 ce3:	5e                   	pop    %esi
 ce4:	5f                   	pop    %edi
 ce5:	5d                   	pop    %ebp
 ce6:	c3                   	ret    
 ce7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 cf0:	c7 05 f0 11 00 00 f4 	movl   $0x11f4,0x11f0
 cf7:	11 00 00 
    base.s.size = 0;
 cfa:	bf f4 11 00 00       	mov    $0x11f4,%edi
    base.s.ptr = freep = prevp = &base;
 cff:	c7 05 f4 11 00 00 f4 	movl   $0x11f4,0x11f4
 d06:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d09:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 d0b:	c7 05 f8 11 00 00 00 	movl   $0x0,0x11f8
 d12:	00 00 00 
    if(p->s.size >= nunits){
 d15:	e9 36 ff ff ff       	jmp    c50 <malloc+0x30>
 d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 d20:	8b 0a                	mov    (%edx),%ecx
 d22:	89 08                	mov    %ecx,(%eax)
 d24:	eb b1                	jmp    cd7 <malloc+0xb7>
