
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
   f:	e8 69 08 00 00       	call   87d <exit>
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
  2f:	e8 fc 01 00 00       	call   230 <strlen>
  34:	83 c4 0c             	add    $0xc,%esp
  37:	50                   	push   %eax
  38:	53                   	push   %ebx
  39:	ff 75 08             	pushl  0x8(%ebp)
  3c:	e8 5c 08 00 00       	call   89d <write>
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
  5d:	68 68 09 00 00       	push   $0x968
  62:	e8 c9 01 00 00       	call   230 <strlen>
  67:	83 c4 0c             	add    $0xc,%esp
  6a:	50                   	push   %eax
  6b:	68 68 09 00 00       	push   $0x968
  70:	6a 01                	push   $0x1
  72:	e8 26 08 00 00       	call   89d <write>
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
  91:	e8 df 07 00 00       	call   875 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 e0 07 00 00       	call   885 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 36                	js     df <forktest+0x8f>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 d2 07 00 00       	call   885 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 49                	jne    101 <forktest+0xb1>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 9a 09 00 00       	push   $0x99a
  c0:	e8 6b 01 00 00       	call   230 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 9a 09 00 00       	push   $0x99a
  ce:	6a 01                	push   $0x1
  d0:	e8 c8 07 00 00       	call   89d <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
      exit();
  da:	e8 9e 07 00 00       	call   87d <exit>
  write(fd, s, strlen(s));
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	68 73 09 00 00       	push   $0x973
  e7:	e8 44 01 00 00       	call   230 <strlen>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	50                   	push   %eax
  f0:	68 73 09 00 00       	push   $0x973
  f5:	6a 01                	push   $0x1
  f7:	e8 a1 07 00 00       	call   89d <write>
      exit();
  fc:	e8 7c 07 00 00       	call   87d <exit>
  write(fd, s, strlen(s));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	68 87 09 00 00       	push   $0x987
 109:	e8 22 01 00 00       	call   230 <strlen>
 10e:	83 c4 0c             	add    $0xc,%esp
 111:	50                   	push   %eax
 112:	68 87 09 00 00       	push   $0x987
 117:	6a 01                	push   $0x1
 119:	e8 7f 07 00 00       	call   89d <write>
    exit();
 11e:	e8 5a 07 00 00       	call   87d <exit>
  write(fd, s, strlen(s));
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	68 a8 09 00 00       	push   $0x9a8
 12b:	e8 00 01 00 00       	call   230 <strlen>
 130:	83 c4 0c             	add    $0xc,%esp
 133:	50                   	push   %eax
 134:	68 a8 09 00 00       	push   $0x9a8
 139:	6a 01                	push   $0x1
 13b:	e8 5d 07 00 00       	call   89d <write>
    exit();
 140:	e8 38 07 00 00       	call   87d <exit>
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

00000180 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	8b 7d 10             	mov    0x10(%ebp),%edi
 18b:	56                   	push   %esi
 18c:	8b 75 08             	mov    0x8(%ebp),%esi
 18f:	53                   	push   %ebx
 190:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 193:	85 ff                	test   %edi,%edi
 195:	74 39                	je     1d0 <strcat_s+0x50>
 197:	31 c0                	xor    %eax,%eax
 199:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 19e:	eb 11                	jmp    1b1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 1a0:	0f b6 12             	movzbl (%edx),%edx
 1a3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 1a6:	84 d2                	test   %dl,%dl
 1a8:	74 26                	je     1d0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 1aa:	83 c0 01             	add    $0x1,%eax
 1ad:	39 c7                	cmp    %eax,%edi
 1af:	74 1f                	je     1d0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	29 ca                	sub    %ecx,%edx
 1b5:	01 da                	add    %ebx,%edx
 1b7:	83 f9 ff             	cmp    $0xffffffff,%ecx
 1ba:	75 e4                	jne    1a0 <strcat_s+0x20>
 1bc:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 1c0:	75 e8                	jne    1aa <strcat_s+0x2a>
 1c2:	89 da                	mov    %ebx,%edx
 1c4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 1c6:	0f b6 12             	movzbl (%edx),%edx
 1c9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 1cc:	84 d2                	test   %dl,%dl
 1ce:	75 da                	jne    1aa <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 1d0:	5b                   	pop    %ebx
 1d1:	89 f0                	mov    %esi,%eax
 1d3:	5e                   	pop    %esi
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	f3 0f 1e fb          	endbr32 
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	53                   	push   %ebx
 1e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ee:	0f b6 01             	movzbl (%ecx),%eax
 1f1:	0f b6 1a             	movzbl (%edx),%ebx
 1f4:	84 c0                	test   %al,%al
 1f6:	75 19                	jne    211 <strcmp+0x31>
 1f8:	eb 26                	jmp    220 <strcmp+0x40>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 204:	83 c1 01             	add    $0x1,%ecx
 207:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 20a:	0f b6 1a             	movzbl (%edx),%ebx
 20d:	84 c0                	test   %al,%al
 20f:	74 0f                	je     220 <strcmp+0x40>
 211:	38 d8                	cmp    %bl,%al
 213:	74 eb                	je     200 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 215:	29 d8                	sub    %ebx,%eax
}
 217:	5b                   	pop    %ebx
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 220:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 222:	29 d8                	sub    %ebx,%eax
}
 224:	5b                   	pop    %ebx
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 23a:	80 3a 00             	cmpb   $0x0,(%edx)
 23d:	74 21                	je     260 <strlen+0x30>
 23f:	31 c0                	xor    %eax,%eax
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 248:	83 c0 01             	add    $0x1,%eax
 24b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 24f:	89 c1                	mov    %eax,%ecx
 251:	75 f5                	jne    248 <strlen+0x18>
    ;
  return n;
}
 253:	89 c8                	mov    %ecx,%eax
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 260:	31 c9                	xor    %ecx,%ecx
}
 262:	5d                   	pop    %ebp
 263:	89 c8                	mov    %ecx,%eax
 265:	c3                   	ret    
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 27b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27e:	8b 45 0c             	mov    0xc(%ebp),%eax
 281:	89 d7                	mov    %edx,%edi
 283:	fc                   	cld    
 284:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 286:	89 d0                	mov    %edx,%eax
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <strchr>:

char*
strchr(const char *s, char c)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 29e:	0f b6 10             	movzbl (%eax),%edx
 2a1:	84 d2                	test   %dl,%dl
 2a3:	75 16                	jne    2bb <strchr+0x2b>
 2a5:	eb 21                	jmp    2c8 <strchr+0x38>
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax
 2b0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2b4:	83 c0 01             	add    $0x1,%eax
 2b7:	84 d2                	test   %dl,%dl
 2b9:	74 0d                	je     2c8 <strchr+0x38>
    if(*s == c)
 2bb:	38 d1                	cmp    %dl,%cl
 2bd:	75 f1                	jne    2b0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2c8:	31 c0                	xor    %eax,%eax
}
 2ca:	5d                   	pop    %ebp
 2cb:	c3                   	ret    
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	57                   	push   %edi
 2d8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d9:	31 f6                	xor    %esi,%esi
{
 2db:	53                   	push   %ebx
 2dc:	89 f3                	mov    %esi,%ebx
 2de:	83 ec 1c             	sub    $0x1c,%esp
 2e1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2e4:	eb 33                	jmp    319 <gets+0x49>
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2f6:	6a 01                	push   $0x1
 2f8:	50                   	push   %eax
 2f9:	6a 00                	push   $0x0
 2fb:	e8 95 05 00 00       	call   895 <read>
    if(cc < 1)
 300:	83 c4 10             	add    $0x10,%esp
 303:	85 c0                	test   %eax,%eax
 305:	7e 1c                	jle    323 <gets+0x53>
      break;
    buf[i++] = c;
 307:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 30b:	83 c7 01             	add    $0x1,%edi
 30e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 311:	3c 0a                	cmp    $0xa,%al
 313:	74 23                	je     338 <gets+0x68>
 315:	3c 0d                	cmp    $0xd,%al
 317:	74 1f                	je     338 <gets+0x68>
  for(i=0; i+1 < max; ){
 319:	83 c3 01             	add    $0x1,%ebx
 31c:	89 fe                	mov    %edi,%esi
 31e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 321:	7c cd                	jl     2f0 <gets+0x20>
 323:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 325:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 328:	c6 03 00             	movb   $0x0,(%ebx)
}
 32b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32e:	5b                   	pop    %ebx
 32f:	5e                   	pop    %esi
 330:	5f                   	pop    %edi
 331:	5d                   	pop    %ebp
 332:	c3                   	ret    
 333:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 337:	90                   	nop
 338:	8b 75 08             	mov    0x8(%ebp),%esi
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	01 de                	add    %ebx,%esi
 340:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 342:	c6 03 00             	movb   $0x0,(%ebx)
}
 345:	8d 65 f4             	lea    -0xc(%ebp),%esp
 348:	5b                   	pop    %ebx
 349:	5e                   	pop    %esi
 34a:	5f                   	pop    %edi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	56                   	push   %esi
 358:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	6a 00                	push   $0x0
 35e:	ff 75 08             	pushl  0x8(%ebp)
 361:	e8 57 05 00 00       	call   8bd <open>
  if(fd < 0)
 366:	83 c4 10             	add    $0x10,%esp
 369:	85 c0                	test   %eax,%eax
 36b:	78 2b                	js     398 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 36d:	83 ec 08             	sub    $0x8,%esp
 370:	ff 75 0c             	pushl  0xc(%ebp)
 373:	89 c3                	mov    %eax,%ebx
 375:	50                   	push   %eax
 376:	e8 5a 05 00 00       	call   8d5 <fstat>
  close(fd);
 37b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37e:	89 c6                	mov    %eax,%esi
  close(fd);
 380:	e8 20 05 00 00       	call   8a5 <close>
  return r;
 385:	83 c4 10             	add    $0x10,%esp
}
 388:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38b:	89 f0                	mov    %esi,%eax
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 398:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39d:	eb e9                	jmp    388 <stat+0x38>
 39f:	90                   	nop

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	53                   	push   %ebx
 3a8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ab:	0f be 02             	movsbl (%edx),%eax
 3ae:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3b1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b9:	77 1a                	ja     3d5 <atoi+0x35>
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	89 c8                	mov    %ecx,%eax
 3d7:	5b                   	pop    %ebx
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	57                   	push   %edi
 3e8:	8b 45 10             	mov    0x10(%ebp),%eax
 3eb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ee:	56                   	push   %esi
 3ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3f2:	85 c0                	test   %eax,%eax
 3f4:	7e 0f                	jle    405 <memmove+0x25>
 3f6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f8:	89 d7                	mov    %edx,%edi
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	57                   	push   %edi
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
 41a:	83 ec 34             	sub    $0x34,%esp
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 420:	68 c8 09 00 00       	push   $0x9c8
hexdump (void *data, size_t size) {
 425:	89 45 e0             	mov    %eax,-0x20(%ebp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 42b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 42d:	89 c7                	mov    %eax,%edi
 42f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 432:	e8 e9 fb ff ff       	call   20 <printf>
  for (offset = 0; offset < size; offset += 16) {
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 ff                	test   %edi,%edi
 43c:	0f 84 2d 01 00 00    	je     56f <hexdump+0x15f>
 442:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 445:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 44c:	be 10 00 00 00       	mov    $0x10,%esi
 451:	83 e8 01             	sub    $0x1,%eax
 454:	83 e0 f0             	and    $0xfffffff0,%eax
 457:	83 c0 10             	add    $0x10,%eax
 45a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 460:	83 ec 08             	sub    $0x8,%esp
 463:	68 1c 0a 00 00       	push   $0xa1c
 468:	6a 01                	push   $0x1
 46a:	e8 b1 fb ff ff       	call   20 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 46f:	83 c4 10             	add    $0x10,%esp
 472:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 479:	0f 8e 51 01 00 00    	jle    5d0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 47f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 482:	83 ec 04             	sub    $0x4,%esp
 485:	57                   	push   %edi
 486:	89 fb                	mov    %edi,%ebx
 488:	68 19 0a 00 00       	push   $0xa19
 48d:	6a 01                	push   $0x1
 48f:	e8 8c fb ff ff       	call   20 <printf>
 494:	89 7d d8             	mov    %edi,-0x28(%ebp)
 497:	83 c4 10             	add    $0x10,%esp
 49a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 49d:	eb 28                	jmp    4c7 <hexdump+0xb7>
 49f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4a0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4a4:	80 fa 0f             	cmp    $0xf,%dl
 4a7:	0f 86 e3 00 00 00    	jbe    590 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 4ad:	83 ec 04             	sub    $0x4,%esp
 4b0:	83 c3 01             	add    $0x1,%ebx
 4b3:	52                   	push   %edx
 4b4:	68 1f 0a 00 00       	push   $0xa1f
 4b9:	6a 01                	push   $0x1
 4bb:	e8 60 fb ff ff       	call   20 <printf>
 4c0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4c3:	39 f3                	cmp    %esi,%ebx
 4c5:	74 1e                	je     4e5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 4c7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 4ca:	7f d4                	jg     4a0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	83 c3 01             	add    $0x1,%ebx
 4d2:	68 23 0a 00 00       	push   $0xa23
 4d7:	6a 01                	push   $0x1
 4d9:	e8 42 fb ff ff       	call   20 <printf>
 4de:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4e1:	39 f3                	cmp    %esi,%ebx
 4e3:	75 e2                	jne    4c7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 4eb:	68 1c 0a 00 00       	push   $0xa1c
 4f0:	6a 01                	push   $0x1
 4f2:	e8 29 fb ff ff       	call   20 <printf>
 4f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fa:	83 c4 10             	add    $0x10,%esp
 4fd:	eb 1b                	jmp    51a <hexdump+0x10a>
 4ff:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	52                   	push   %edx
 504:	68 27 0a 00 00       	push   $0xa27
 509:	6a 01                	push   $0x1
 50b:	e8 10 fb ff ff       	call   20 <printf>
 510:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 513:	83 c3 01             	add    $0x1,%ebx
 516:	39 de                	cmp    %ebx,%esi
 518:	74 30                	je     54a <hexdump+0x13a>
      if(offset + index < (int)size) {
 51a:	39 df                	cmp    %ebx,%edi
 51c:	0f 8e 8e 00 00 00    	jle    5b0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 522:	8b 45 e0             	mov    -0x20(%ebp),%eax
 525:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 529:	8d 4a e0             	lea    -0x20(%edx),%ecx
 52c:	80 f9 5e             	cmp    $0x5e,%cl
 52f:	76 cf                	jbe    500 <hexdump+0xf0>
        } else {
          printf(1, ".");
 531:	83 ec 08             	sub    $0x8,%esp
 534:	83 c3 01             	add    $0x1,%ebx
 537:	68 2a 0a 00 00       	push   $0xa2a
 53c:	6a 01                	push   $0x1
 53e:	e8 dd fa ff ff       	call   20 <printf>
 543:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 546:	39 de                	cmp    %ebx,%esi
 548:	75 d0                	jne    51a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 54a:	83 ec 08             	sub    $0x8,%esp
 54d:	83 c6 10             	add    $0x10,%esi
 550:	68 2c 0a 00 00       	push   $0xa2c
 555:	6a 01                	push   $0x1
 557:	e8 c4 fa ff ff       	call   20 <printf>
  for (offset = 0; offset < size; offset += 16) {
 55c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 560:	83 c4 10             	add    $0x10,%esp
 563:	8b 45 dc             	mov    -0x24(%ebp),%eax
 566:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 569:	0f 85 f1 fe ff ff    	jne    460 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 56f:	c7 45 0c c8 09 00 00 	movl   $0x9c8,0xc(%ebp)
 576:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 57d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 580:	5b                   	pop    %ebx
 581:	5e                   	pop    %esi
 582:	5f                   	pop    %edi
 583:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 584:	e9 97 fa ff ff       	jmp    20 <printf>
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 590:	83 ec 08             	sub    $0x8,%esp
 593:	68 17 0a 00 00       	push   $0xa17
 598:	6a 01                	push   $0x1
 59a:	e8 81 fa ff ff       	call   20 <printf>
 59f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 5a3:	83 c4 10             	add    $0x10,%esp
 5a6:	e9 02 ff ff ff       	jmp    4ad <hexdump+0x9d>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
        printf(1, " ");
 5b0:	83 ec 08             	sub    $0x8,%esp
 5b3:	68 25 0a 00 00       	push   $0xa25
 5b8:	6a 01                	push   $0x1
 5ba:	e8 61 fa ff ff       	call   20 <printf>
 5bf:	83 c4 10             	add    $0x10,%esp
 5c2:	e9 4c ff ff ff       	jmp    513 <hexdump+0x103>
 5c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ce:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 5d0:	83 ec 08             	sub    $0x8,%esp
 5d3:	68 17 0a 00 00       	push   $0xa17
 5d8:	6a 01                	push   $0x1
 5da:	e8 41 fa ff ff       	call   20 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 5df:	8b 7d dc             	mov    -0x24(%ebp),%edi
 5e2:	83 c4 10             	add    $0x10,%esp
 5e5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 5eb:	0f 8f 8e fe ff ff    	jg     47f <hexdump+0x6f>
 5f1:	83 ec 08             	sub    $0x8,%esp
 5f4:	68 17 0a 00 00       	push   $0xa17
 5f9:	6a 01                	push   $0x1
 5fb:	e8 20 fa ff ff       	call   20 <printf>
    if (offset <= 0x000f) printf(1, "0");
 600:	83 c4 10             	add    $0x10,%esp
 603:	83 ff 0f             	cmp    $0xf,%edi
 606:	0f 8f 73 fe ff ff    	jg     47f <hexdump+0x6f>
 60c:	83 ec 08             	sub    $0x8,%esp
 60f:	68 17 0a 00 00       	push   $0xa17
 614:	6a 01                	push   $0x1
 616:	e8 05 fa ff ff       	call   20 <printf>
 61b:	83 c4 10             	add    $0x10,%esp
 61e:	e9 5c fe ff ff       	jmp    47f <hexdump+0x6f>
 623:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000630 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
    if (!endian)
 635:	a1 70 0d 00 00       	mov    0xd70,%eax
{
 63a:	89 e5                	mov    %esp,%ebp
 63c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 63f:	85 c0                	test   %eax,%eax
 641:	75 1d                	jne    660 <hton16+0x30>
        endian = byteorder();
 643:	c7 05 70 0d 00 00 d2 	movl   $0x4d2,0xd70
 64a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 64d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 64f:	5d                   	pop    %ebp
 650:	66 c1 c2 08          	rol    $0x8,%dx
 654:	89 d0                	mov    %edx,%eax
 656:	c3                   	ret    
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
 660:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 662:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 667:	74 e4                	je     64d <hton16+0x1d>
}
 669:	89 d0                	mov    %edx,%eax
 66b:	5d                   	pop    %ebp
 66c:	c3                   	ret    
 66d:	8d 76 00             	lea    0x0(%esi),%esi

00000670 <ntoh16>:
 670:	f3 0f 1e fb          	endbr32 
 674:	eb ba                	jmp    630 <hton16>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi

00000680 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
    if (!endian)
 685:	8b 15 70 0d 00 00    	mov    0xd70,%edx
{
 68b:	89 e5                	mov    %esp,%ebp
 68d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 690:	85 d2                	test   %edx,%edx
 692:	75 14                	jne    6a8 <hton32+0x28>
        endian = byteorder();
 694:	c7 05 70 0d 00 00 d2 	movl   $0x4d2,0xd70
 69b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 69e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 6a8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 6ae:	74 ee                	je     69e <hton32+0x1e>
}
 6b0:	5d                   	pop    %ebp
 6b1:	c3                   	ret    
 6b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006c0 <ntoh32>:
 6c0:	f3 0f 1e fb          	endbr32 
 6c4:	eb ba                	jmp    680 <hton32>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi

000006d0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	57                   	push   %edi
 6d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6db:	56                   	push   %esi
 6dc:	53                   	push   %ebx
 6dd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 6e0:	0f b6 01             	movzbl (%ecx),%eax
 6e3:	3c 09                	cmp    $0x9,%al
 6e5:	74 09                	je     6f0 <strtol+0x20>
 6e7:	3c 20                	cmp    $0x20,%al
 6e9:	75 14                	jne    6ff <strtol+0x2f>
 6eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
 6f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 6f4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 6f7:	3c 20                	cmp    $0x20,%al
 6f9:	74 f5                	je     6f0 <strtol+0x20>
 6fb:	3c 09                	cmp    $0x9,%al
 6fd:	74 f1                	je     6f0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 6ff:	3c 2b                	cmp    $0x2b,%al
 701:	0f 84 a9 00 00 00    	je     7b0 <strtol+0xe0>
    int neg = 0;
 707:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 709:	3c 2d                	cmp    $0x2d,%al
 70b:	0f 84 8f 00 00 00    	je     7a0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 711:	0f be 11             	movsbl (%ecx),%edx
 714:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 71a:	75 12                	jne    72e <strtol+0x5e>
 71c:	80 fa 30             	cmp    $0x30,%dl
 71f:	0f 84 9b 00 00 00    	je     7c0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 725:	85 db                	test   %ebx,%ebx
 727:	75 05                	jne    72e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 729:	bb 0a 00 00 00       	mov    $0xa,%ebx
 72e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 731:	31 c0                	xor    %eax,%eax
 733:	eb 17                	jmp    74c <strtol+0x7c>
 735:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 738:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 73b:	3b 55 10             	cmp    0x10(%ebp),%edx
 73e:	7d 28                	jge    768 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 740:	0f af 45 10          	imul   0x10(%ebp),%eax
 744:	83 c1 01             	add    $0x1,%ecx
 747:	01 d0                	add    %edx,%eax
    while (1) {
 749:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 74c:	8d 72 d0             	lea    -0x30(%edx),%esi
 74f:	89 f3                	mov    %esi,%ebx
 751:	80 fb 09             	cmp    $0x9,%bl
 754:	76 e2                	jbe    738 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 756:	8d 72 9f             	lea    -0x61(%edx),%esi
 759:	89 f3                	mov    %esi,%ebx
 75b:	80 fb 19             	cmp    $0x19,%bl
 75e:	77 28                	ja     788 <strtol+0xb8>
            dig = *s - 'a' + 10;
 760:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 763:	3b 55 10             	cmp    0x10(%ebp),%edx
 766:	7c d8                	jl     740 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 768:	8b 55 0c             	mov    0xc(%ebp),%edx
 76b:	85 d2                	test   %edx,%edx
 76d:	74 05                	je     774 <strtol+0xa4>
        *endptr = (char *) s;
 76f:	8b 75 0c             	mov    0xc(%ebp),%esi
 772:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 774:	89 c2                	mov    %eax,%edx
}
 776:	5b                   	pop    %ebx
 777:	5e                   	pop    %esi
    return (neg ? -val : val);
 778:	f7 da                	neg    %edx
 77a:	85 ff                	test   %edi,%edi
}
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 77e:	0f 45 c2             	cmovne %edx,%eax
}
 781:	c3                   	ret    
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 788:	8d 72 bf             	lea    -0x41(%edx),%esi
 78b:	89 f3                	mov    %esi,%ebx
 78d:	80 fb 19             	cmp    $0x19,%bl
 790:	77 d6                	ja     768 <strtol+0x98>
            dig = *s - 'A' + 10;
 792:	83 ea 37             	sub    $0x37,%edx
 795:	eb a4                	jmp    73b <strtol+0x6b>
 797:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 7a0:	83 c1 01             	add    $0x1,%ecx
 7a3:	bf 01 00 00 00       	mov    $0x1,%edi
 7a8:	e9 64 ff ff ff       	jmp    711 <strtol+0x41>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 7b0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 7b3:	31 ff                	xor    %edi,%edi
 7b5:	e9 57 ff ff ff       	jmp    711 <strtol+0x41>
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 7c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 7c4:	3c 78                	cmp    $0x78,%al
 7c6:	74 18                	je     7e0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 7c8:	85 db                	test   %ebx,%ebx
 7ca:	0f 85 5e ff ff ff    	jne    72e <strtol+0x5e>
        s++, base = 8;
 7d0:	83 c1 01             	add    $0x1,%ecx
 7d3:	0f be d0             	movsbl %al,%edx
 7d6:	bb 08 00 00 00       	mov    $0x8,%ebx
 7db:	e9 4e ff ff ff       	jmp    72e <strtol+0x5e>
        s += 2, base = 16;
 7e0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 7e4:	bb 10 00 00 00       	mov    $0x10,%ebx
 7e9:	83 c1 02             	add    $0x2,%ecx
 7ec:	e9 3d ff ff ff       	jmp    72e <strtol+0x5e>
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop

00000800 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 800:	f3 0f 1e fb          	endbr32 
 804:	55                   	push   %ebp
 805:	89 e5                	mov    %esp,%ebp
 807:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 808:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 80a:	56                   	push   %esi
 80b:	53                   	push   %ebx
 80c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 80f:	83 ec 1c             	sub    $0x1c,%esp
 812:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 815:	83 ec 04             	sub    $0x4,%esp
 818:	6a 0a                	push   $0xa
 81a:	53                   	push   %ebx
 81b:	56                   	push   %esi
 81c:	e8 af fe ff ff       	call   6d0 <strtol>
        if (ret < 0 || ret > 255) {
 821:	83 c4 10             	add    $0x10,%esp
 824:	3d ff 00 00 00       	cmp    $0xff,%eax
 829:	77 3d                	ja     868 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 82b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 82e:	39 f1                	cmp    %esi,%ecx
 830:	74 36                	je     868 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 832:	0f b6 11             	movzbl (%ecx),%edx
 835:	83 ff 03             	cmp    $0x3,%edi
 838:	74 16                	je     850 <ip_addr_pton+0x50>
 83a:	80 fa 2e             	cmp    $0x2e,%dl
 83d:	75 29                	jne    868 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 83f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 842:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 845:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 848:	83 c7 01             	add    $0x1,%edi
 84b:	eb c8                	jmp    815 <ip_addr_pton+0x15>
 84d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 850:	84 d2                	test   %dl,%dl
 852:	75 14                	jne    868 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 854:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 857:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 85a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 85d:	31 c0                	xor    %eax,%eax
}
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 868:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 86b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 870:	5b                   	pop    %ebx
 871:	5e                   	pop    %esi
 872:	5f                   	pop    %edi
 873:	5d                   	pop    %ebp
 874:	c3                   	ret    

00000875 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 875:	b8 01 00 00 00       	mov    $0x1,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <exit>:
SYSCALL(exit)
 87d:	b8 02 00 00 00       	mov    $0x2,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <wait>:
SYSCALL(wait)
 885:	b8 03 00 00 00       	mov    $0x3,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <pipe>:
SYSCALL(pipe)
 88d:	b8 04 00 00 00       	mov    $0x4,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <read>:
SYSCALL(read)
 895:	b8 05 00 00 00       	mov    $0x5,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <write>:
SYSCALL(write)
 89d:	b8 10 00 00 00       	mov    $0x10,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <close>:
SYSCALL(close)
 8a5:	b8 15 00 00 00       	mov    $0x15,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <kill>:
SYSCALL(kill)
 8ad:	b8 06 00 00 00       	mov    $0x6,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <exec>:
SYSCALL(exec)
 8b5:	b8 07 00 00 00       	mov    $0x7,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <open>:
SYSCALL(open)
 8bd:	b8 0f 00 00 00       	mov    $0xf,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <mknod>:
SYSCALL(mknod)
 8c5:	b8 11 00 00 00       	mov    $0x11,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <unlink>:
SYSCALL(unlink)
 8cd:	b8 12 00 00 00       	mov    $0x12,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <fstat>:
SYSCALL(fstat)
 8d5:	b8 08 00 00 00       	mov    $0x8,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <link>:
SYSCALL(link)
 8dd:	b8 13 00 00 00       	mov    $0x13,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <mkdir>:
SYSCALL(mkdir)
 8e5:	b8 14 00 00 00       	mov    $0x14,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <chdir>:
SYSCALL(chdir)
 8ed:	b8 09 00 00 00       	mov    $0x9,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <dup>:
SYSCALL(dup)
 8f5:	b8 0a 00 00 00       	mov    $0xa,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <getpid>:
SYSCALL(getpid)
 8fd:	b8 0b 00 00 00       	mov    $0xb,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <sbrk>:
SYSCALL(sbrk)
 905:	b8 0c 00 00 00       	mov    $0xc,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <sleep>:
SYSCALL(sleep)
 90d:	b8 0d 00 00 00       	mov    $0xd,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <uptime>:
SYSCALL(uptime)
 915:	b8 0e 00 00 00       	mov    $0xe,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <ioctl>:
# iotcl
SYSCALL(ioctl)
 91d:	b8 16 00 00 00       	mov    $0x16,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <socket>:
# socket
SYSCALL(socket)
 925:	b8 17 00 00 00       	mov    $0x17,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <bind>:
SYSCALL(bind)
 92d:	b8 19 00 00 00       	mov    $0x19,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <listen>:
SYSCALL(listen)
 935:	b8 1a 00 00 00       	mov    $0x1a,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <accept>:
SYSCALL(accept)
 93d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <recv>:
SYSCALL(recv)
 945:	b8 1c 00 00 00       	mov    $0x1c,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <send>:
SYSCALL(send)
 94d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <recvfrom>:
SYSCALL(recvfrom)
 955:	b8 1e 00 00 00       	mov    $0x1e,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <sendto>:
SYSCALL(sendto)
 95d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    
