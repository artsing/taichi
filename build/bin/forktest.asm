
build/bin/_forktest：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   a:	e8 41 00 00 00       	call   50 <forktest>
  exit();
   f:	e8 09 08 00 00       	call   81d <exit>
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <printf>:
{
  20:	f3 0f 1e fb          	endbr32 
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %ebx
  28:	83 ec 10             	sub    $0x10,%esp
  2b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2e:	53                   	push   %ebx
  2f:	e8 9c 01 00 00       	call   1d0 <strlen>
  34:	83 c4 0c             	add    $0xc,%esp
  37:	50                   	push   %eax
  38:	53                   	push   %ebx
  39:	ff 75 08             	pushl  0x8(%ebp)
  3c:	e8 fc 07 00 00       	call   83d <write>
}
  41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  44:	83 c4 10             	add    $0x10,%esp
  47:	c9                   	leave  
  48:	c3                   	ret    
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000050 <forktest>:
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	53                   	push   %ebx
  for(n=0; n<N; n++){
  58:	31 db                	xor    %ebx,%ebx
{
  5a:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  5d:	68 08 09 00 00       	push   $0x908
  62:	e8 69 01 00 00       	call   1d0 <strlen>
  67:	83 c4 0c             	add    $0xc,%esp
  6a:	50                   	push   %eax
  6b:	68 08 09 00 00       	push   $0x908
  70:	6a 01                	push   $0x1
  72:	e8 c6 07 00 00       	call   83d <write>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	eb 15                	jmp    91 <forktest+0x41>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	74 58                	je     da <forktest+0x8a>
  for(n=0; n<N; n++){
  82:	83 c3 01             	add    $0x1,%ebx
  85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8b:	0f 84 92 00 00 00    	je     123 <forktest+0xd3>
    pid = fork();
  91:	e8 7f 07 00 00       	call   815 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 80 07 00 00       	call   825 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 36                	js     df <forktest+0x8f>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 72 07 00 00       	call   825 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 49                	jne    101 <forktest+0xb1>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 3a 09 00 00       	push   $0x93a
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 3a 09 00 00       	push   $0x93a
  ce:	6a 01                	push   $0x1
  d0:	e8 68 07 00 00       	call   83d <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
      exit();
  da:	e8 3e 07 00 00       	call   81d <exit>
  write(fd, s, strlen(s));
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	68 13 09 00 00       	push   $0x913
  e7:	e8 e4 00 00 00       	call   1d0 <strlen>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	50                   	push   %eax
  f0:	68 13 09 00 00       	push   $0x913
  f5:	6a 01                	push   $0x1
  f7:	e8 41 07 00 00       	call   83d <write>
      exit();
  fc:	e8 1c 07 00 00       	call   81d <exit>
  write(fd, s, strlen(s));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	68 27 09 00 00       	push   $0x927
 109:	e8 c2 00 00 00       	call   1d0 <strlen>
 10e:	83 c4 0c             	add    $0xc,%esp
 111:	50                   	push   %eax
 112:	68 27 09 00 00       	push   $0x927
 117:	6a 01                	push   $0x1
 119:	e8 1f 07 00 00       	call   83d <write>
    exit();
 11e:	e8 fa 06 00 00       	call   81d <exit>
  write(fd, s, strlen(s));
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	68 48 09 00 00       	push   $0x948
 12b:	e8 a0 00 00 00       	call   1d0 <strlen>
 130:	83 c4 0c             	add    $0xc,%esp
 133:	50                   	push   %eax
 134:	68 48 09 00 00       	push   $0x948
 139:	6a 01                	push   $0x1
 13b:	e8 fd 06 00 00       	call   83d <write>
    exit();
 140:	e8 d8 06 00 00       	call   81d <exit>
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 155:	31 c0                	xor    %eax,%eax
{
 157:	89 e5                	mov    %esp,%ebp
 159:	53                   	push   %ebx
 15a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	89 c8                	mov    %ecx,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

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
 3c0:	68 68 09 00 00       	push   $0x968
hexdump (void *data, size_t size) {
 3c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 3c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3cb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 3cd:	89 c7                	mov    %eax,%edi
 3cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3d2:	e8 49 fc ff ff       	call   20 <printf>
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
 403:	68 bc 09 00 00       	push   $0x9bc
 408:	6a 01                	push   $0x1
 40a:	e8 11 fc ff ff       	call   20 <printf>
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
 428:	68 b9 09 00 00       	push   $0x9b9
 42d:	6a 01                	push   $0x1
 42f:	e8 ec fb ff ff       	call   20 <printf>
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
 454:	68 bf 09 00 00       	push   $0x9bf
 459:	6a 01                	push   $0x1
 45b:	e8 c0 fb ff ff       	call   20 <printf>
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
 472:	68 c3 09 00 00       	push   $0x9c3
 477:	6a 01                	push   $0x1
 479:	e8 a2 fb ff ff       	call   20 <printf>
 47e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 481:	39 f3                	cmp    %esi,%ebx
 483:	75 e2                	jne    467 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 485:	83 ec 08             	sub    $0x8,%esp
 488:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 48b:	68 bc 09 00 00       	push   $0x9bc
 490:	6a 01                	push   $0x1
 492:	e8 89 fb ff ff       	call   20 <printf>
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
 4a4:	68 c7 09 00 00       	push   $0x9c7
 4a9:	6a 01                	push   $0x1
 4ab:	e8 70 fb ff ff       	call   20 <printf>
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
 4d7:	68 ca 09 00 00       	push   $0x9ca
 4dc:	6a 01                	push   $0x1
 4de:	e8 3d fb ff ff       	call   20 <printf>
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
 4f0:	68 cc 09 00 00       	push   $0x9cc
 4f5:	6a 01                	push   $0x1
 4f7:	e8 24 fb ff ff       	call   20 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4fc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 500:	83 c4 10             	add    $0x10,%esp
 503:	8b 45 dc             	mov    -0x24(%ebp),%eax
 506:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 509:	0f 85 f1 fe ff ff    	jne    400 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 50f:	c7 45 0c 68 09 00 00 	movl   $0x968,0xc(%ebp)
 516:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 51d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5f                   	pop    %edi
 523:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 524:	e9 f7 fa ff ff       	jmp    20 <printf>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 530:	83 ec 08             	sub    $0x8,%esp
 533:	68 b7 09 00 00       	push   $0x9b7
 538:	6a 01                	push   $0x1
 53a:	e8 e1 fa ff ff       	call   20 <printf>
 53f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 543:	83 c4 10             	add    $0x10,%esp
 546:	e9 02 ff ff ff       	jmp    44d <hexdump+0x9d>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
        printf(1, " ");
 550:	83 ec 08             	sub    $0x8,%esp
 553:	68 c5 09 00 00       	push   $0x9c5
 558:	6a 01                	push   $0x1
 55a:	e8 c1 fa ff ff       	call   20 <printf>
 55f:	83 c4 10             	add    $0x10,%esp
 562:	e9 4c ff ff ff       	jmp    4b3 <hexdump+0x103>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 570:	83 ec 08             	sub    $0x8,%esp
 573:	68 b7 09 00 00       	push   $0x9b7
 578:	6a 01                	push   $0x1
 57a:	e8 a1 fa ff ff       	call   20 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 57f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 582:	83 c4 10             	add    $0x10,%esp
 585:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 58b:	0f 8f 8e fe ff ff    	jg     41f <hexdump+0x6f>
 591:	83 ec 08             	sub    $0x8,%esp
 594:	68 b7 09 00 00       	push   $0x9b7
 599:	6a 01                	push   $0x1
 59b:	e8 80 fa ff ff       	call   20 <printf>
    if (offset <= 0x000f) printf(1, "0");
 5a0:	83 c4 10             	add    $0x10,%esp
 5a3:	83 ff 0f             	cmp    $0xf,%edi
 5a6:	0f 8f 73 fe ff ff    	jg     41f <hexdump+0x6f>
 5ac:	83 ec 08             	sub    $0x8,%esp
 5af:	68 b7 09 00 00       	push   $0x9b7
 5b4:	6a 01                	push   $0x1
 5b6:	e8 65 fa ff ff       	call   20 <printf>
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
 5d5:	a1 e0 0c 00 00       	mov    0xce0,%eax
{
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 5df:	85 c0                	test   %eax,%eax
 5e1:	75 1d                	jne    600 <hton16+0x30>
        endian = byteorder();
 5e3:	c7 05 e0 0c 00 00 d2 	movl   $0x4d2,0xce0
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
 625:	8b 15 e0 0c 00 00    	mov    0xce0,%edx
{
 62b:	89 e5                	mov    %esp,%ebp
 62d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 630:	85 d2                	test   %edx,%edx
 632:	75 14                	jne    648 <hton32+0x28>
        endian = byteorder();
 634:	c7 05 e0 0c 00 00 d2 	movl   $0x4d2,0xce0
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
