
build/bin/_stressfs：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 18 0d 00 00       	push   $0xd18
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 61 09 00 00       	call   9b0 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 a1 01 00 00       	call   200 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 9e 07 00 00       	call   805 <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 2b 0d 00 00       	push   $0xd2b
  8a:	6a 01                	push   $0x1
  8c:	e8 1f 09 00 00       	call   9b0 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 a1 07 00 00       	call   84d <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 66 07 00 00       	call   82d <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 5d 07 00 00       	call   835 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 35 0d 00 00       	push   $0xd35
  df:	6a 01                	push   $0x1
  e1:	e8 ca 08 00 00       	call   9b0 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 52 07 00 00       	call   84d <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 16 07 00 00       	call   825 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 15 07 00 00       	call   835 <close>

  wait();
 120:	e8 f0 06 00 00       	call   815 <wait>

  exit();
 125:	e8 e3 06 00 00       	call   80d <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 145:	31 c0                	xor    %eax,%eax
{
 147:	89 e5                	mov    %esp,%ebp
 149:	53                   	push   %ebx
 14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	89 c8                	mov    %ecx,%eax
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	53                   	push   %ebx
 178:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 17e:	0f b6 01             	movzbl (%ecx),%eax
 181:	0f b6 1a             	movzbl (%edx),%ebx
 184:	84 c0                	test   %al,%al
 186:	75 19                	jne    1a1 <strcmp+0x31>
 188:	eb 26                	jmp    1b0 <strcmp+0x40>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 194:	83 c1 01             	add    $0x1,%ecx
 197:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19a:	0f b6 1a             	movzbl (%edx),%ebx
 19d:	84 c0                	test   %al,%al
 19f:	74 0f                	je     1b0 <strcmp+0x40>
 1a1:	38 d8                	cmp    %bl,%al
 1a3:	74 eb                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a5:	29 d8                	sub    %ebx,%eax
}
 1a7:	5b                   	pop    %ebx
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ca:	80 3a 00             	cmpb   $0x0,(%edx)
 1cd:	74 21                	je     1f0 <strlen+0x30>
 1cf:	31 c0                	xor    %eax,%eax
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1df:	89 c1                	mov    %eax,%ecx
 1e1:	75 f5                	jne    1d8 <strlen+0x18>
    ;
  return n;
}
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 20b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20e:	8b 45 0c             	mov    0xc(%ebp),%eax
 211:	89 d7                	mov    %edx,%edi
 213:	fc                   	cld    
 214:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 216:	89 d0                	mov    %edx,%eax
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22e:	0f b6 10             	movzbl (%eax),%edx
 231:	84 d2                	test   %dl,%dl
 233:	75 16                	jne    24b <strchr+0x2b>
 235:	eb 21                	jmp    258 <strchr+0x38>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
 240:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 244:	83 c0 01             	add    $0x1,%eax
 247:	84 d2                	test   %dl,%dl
 249:	74 0d                	je     258 <strchr+0x38>
    if(*s == c)
 24b:	38 d1                	cmp    %dl,%cl
 24d:	75 f1                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 258:	31 c0                	xor    %eax,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	31 f6                	xor    %esi,%esi
{
 26b:	53                   	push   %ebx
 26c:	89 f3                	mov    %esi,%ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 274:	eb 33                	jmp    2a9 <gets+0x49>
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	8d 45 e7             	lea    -0x19(%ebp),%eax
 286:	6a 01                	push   $0x1
 288:	50                   	push   %eax
 289:	6a 00                	push   $0x0
 28b:	e8 95 05 00 00       	call   825 <read>
    if(cc < 1)
 290:	83 c4 10             	add    $0x10,%esp
 293:	85 c0                	test   %eax,%eax
 295:	7e 1c                	jle    2b3 <gets+0x53>
      break;
    buf[i++] = c;
 297:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29b:	83 c7 01             	add    $0x1,%edi
 29e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 23                	je     2c8 <gets+0x68>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 1f                	je     2c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	89 fe                	mov    %edi,%esi
 2ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b1:	7c cd                	jl     280 <gets+0x20>
 2b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2be:	5b                   	pop    %ebx
 2bf:	5e                   	pop    %esi
 2c0:	5f                   	pop    %edi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	8b 75 08             	mov    0x8(%ebp),%esi
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	01 de                	add    %ebx,%esi
 2d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	6a 00                	push   $0x0
 2ee:	ff 75 08             	pushl  0x8(%ebp)
 2f1:	e8 57 05 00 00       	call   84d <open>
  if(fd < 0)
 2f6:	83 c4 10             	add    $0x10,%esp
 2f9:	85 c0                	test   %eax,%eax
 2fb:	78 2b                	js     328 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2fd:	83 ec 08             	sub    $0x8,%esp
 300:	ff 75 0c             	pushl  0xc(%ebp)
 303:	89 c3                	mov    %eax,%ebx
 305:	50                   	push   %eax
 306:	e8 5a 05 00 00       	call   865 <fstat>
  close(fd);
 30b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30e:	89 c6                	mov    %eax,%esi
  close(fd);
 310:	e8 20 05 00 00       	call   835 <close>
  return r;
 315:	83 c4 10             	add    $0x10,%esp
}
 318:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 328:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32d:	eb e9                	jmp    318 <stat+0x38>
 32f:	90                   	nop

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	53                   	push   %ebx
 338:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33b:	0f be 02             	movsbl (%edx),%eax
 33e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 341:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 344:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 349:	77 1a                	ja     365 <atoi+0x35>
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    n = n*10 + *s++ - '0';
 350:	83 c2 01             	add    $0x1,%edx
 353:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 356:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 35a:	0f be 02             	movsbl (%edx),%eax
 35d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	89 c8                	mov    %ecx,%eax
 367:	5b                   	pop    %ebx
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	8b 45 10             	mov    0x10(%ebp),%eax
 37b:	8b 55 08             	mov    0x8(%ebp),%edx
 37e:	56                   	push   %esi
 37f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	85 c0                	test   %eax,%eax
 384:	7e 0f                	jle    395 <memmove+0x25>
 386:	01 d0                	add    %edx,%eax
  dst = vdst;
 388:	89 d7                	mov    %edx,%edi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 390:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 391:	39 f8                	cmp    %edi,%eax
 393:	75 fb                	jne    390 <memmove+0x20>
  return vdst;
}
 395:	5e                   	pop    %esi
 396:	89 d0                	mov    %edx,%eax
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 34             	sub    $0x34,%esp
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3b0:	68 3c 0d 00 00       	push   $0xd3c
hexdump (void *data, size_t size) {
 3b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 3b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3bb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 3bd:	89 c7                	mov    %eax,%edi
 3bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 3c2:	e8 e9 05 00 00       	call   9b0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 3c7:	83 c4 10             	add    $0x10,%esp
 3ca:	85 ff                	test   %edi,%edi
 3cc:	0f 84 2d 01 00 00    	je     4ff <hexdump+0x15f>
 3d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 3d5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 3dc:	be 10 00 00 00       	mov    $0x10,%esi
 3e1:	83 e8 01             	sub    $0x1,%eax
 3e4:	83 e0 f0             	and    $0xfffffff0,%eax
 3e7:	83 c0 10             	add    $0x10,%eax
 3ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 3f0:	83 ec 08             	sub    $0x8,%esp
 3f3:	68 90 0d 00 00       	push   $0xd90
 3f8:	6a 01                	push   $0x1
 3fa:	e8 b1 05 00 00       	call   9b0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 409:	0f 8e 51 01 00 00    	jle    560 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 40f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 412:	83 ec 04             	sub    $0x4,%esp
 415:	57                   	push   %edi
 416:	89 fb                	mov    %edi,%ebx
 418:	68 8d 0d 00 00       	push   $0xd8d
 41d:	6a 01                	push   $0x1
 41f:	e8 8c 05 00 00       	call   9b0 <printf>
 424:	89 7d d8             	mov    %edi,-0x28(%ebp)
 427:	83 c4 10             	add    $0x10,%esp
 42a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 42d:	eb 28                	jmp    457 <hexdump+0xb7>
 42f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 430:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 434:	80 fa 0f             	cmp    $0xf,%dl
 437:	0f 86 e3 00 00 00    	jbe    520 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	83 c3 01             	add    $0x1,%ebx
 443:	52                   	push   %edx
 444:	68 93 0d 00 00       	push   $0xd93
 449:	6a 01                	push   $0x1
 44b:	e8 60 05 00 00       	call   9b0 <printf>
 450:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 453:	39 f3                	cmp    %esi,%ebx
 455:	74 1e                	je     475 <hexdump+0xd5>
      if(offset + index < (int)size) {
 457:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 45a:	7f d4                	jg     430 <hexdump+0x90>
      } else {
        printf(1, "   ");
 45c:	83 ec 08             	sub    $0x8,%esp
 45f:	83 c3 01             	add    $0x1,%ebx
 462:	68 97 0d 00 00       	push   $0xd97
 467:	6a 01                	push   $0x1
 469:	e8 42 05 00 00       	call   9b0 <printf>
 46e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 471:	39 f3                	cmp    %esi,%ebx
 473:	75 e2                	jne    457 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 475:	83 ec 08             	sub    $0x8,%esp
 478:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 47b:	68 90 0d 00 00       	push   $0xd90
 480:	6a 01                	push   $0x1
 482:	e8 29 05 00 00       	call   9b0 <printf>
 487:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	eb 1b                	jmp    4aa <hexdump+0x10a>
 48f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	52                   	push   %edx
 494:	68 9b 0d 00 00       	push   $0xd9b
 499:	6a 01                	push   $0x1
 49b:	e8 10 05 00 00       	call   9b0 <printf>
 4a0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4a3:	83 c3 01             	add    $0x1,%ebx
 4a6:	39 de                	cmp    %ebx,%esi
 4a8:	74 30                	je     4da <hexdump+0x13a>
      if(offset + index < (int)size) {
 4aa:	39 df                	cmp    %ebx,%edi
 4ac:	0f 8e 8e 00 00 00    	jle    540 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 4b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 4b5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4b9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 4bc:	80 f9 5e             	cmp    $0x5e,%cl
 4bf:	76 cf                	jbe    490 <hexdump+0xf0>
        } else {
          printf(1, ".");
 4c1:	83 ec 08             	sub    $0x8,%esp
 4c4:	83 c3 01             	add    $0x1,%ebx
 4c7:	68 9e 0d 00 00       	push   $0xd9e
 4cc:	6a 01                	push   $0x1
 4ce:	e8 dd 04 00 00       	call   9b0 <printf>
 4d3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4d6:	39 de                	cmp    %ebx,%esi
 4d8:	75 d0                	jne    4aa <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 4da:	83 ec 08             	sub    $0x8,%esp
 4dd:	83 c6 10             	add    $0x10,%esi
 4e0:	68 a0 0d 00 00       	push   $0xda0
 4e5:	6a 01                	push   $0x1
 4e7:	e8 c4 04 00 00       	call   9b0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4ec:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 4f0:	83 c4 10             	add    $0x10,%esp
 4f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 4f6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 4f9:	0f 85 f1 fe ff ff    	jne    3f0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4ff:	c7 45 0c 3c 0d 00 00 	movl   $0xd3c,0xc(%ebp)
 506:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 50d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 510:	5b                   	pop    %ebx
 511:	5e                   	pop    %esi
 512:	5f                   	pop    %edi
 513:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 514:	e9 97 04 00 00       	jmp    9b0 <printf>
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 520:	83 ec 08             	sub    $0x8,%esp
 523:	68 8b 0d 00 00       	push   $0xd8b
 528:	6a 01                	push   $0x1
 52a:	e8 81 04 00 00       	call   9b0 <printf>
 52f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 533:	83 c4 10             	add    $0x10,%esp
 536:	e9 02 ff ff ff       	jmp    43d <hexdump+0x9d>
 53b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
        printf(1, " ");
 540:	83 ec 08             	sub    $0x8,%esp
 543:	68 99 0d 00 00       	push   $0xd99
 548:	6a 01                	push   $0x1
 54a:	e8 61 04 00 00       	call   9b0 <printf>
 54f:	83 c4 10             	add    $0x10,%esp
 552:	e9 4c ff ff ff       	jmp    4a3 <hexdump+0x103>
 557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 560:	83 ec 08             	sub    $0x8,%esp
 563:	68 8b 0d 00 00       	push   $0xd8b
 568:	6a 01                	push   $0x1
 56a:	e8 41 04 00 00       	call   9b0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 56f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 572:	83 c4 10             	add    $0x10,%esp
 575:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 57b:	0f 8f 8e fe ff ff    	jg     40f <hexdump+0x6f>
 581:	83 ec 08             	sub    $0x8,%esp
 584:	68 8b 0d 00 00       	push   $0xd8b
 589:	6a 01                	push   $0x1
 58b:	e8 20 04 00 00       	call   9b0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 590:	83 c4 10             	add    $0x10,%esp
 593:	83 ff 0f             	cmp    $0xf,%edi
 596:	0f 8f 73 fe ff ff    	jg     40f <hexdump+0x6f>
 59c:	83 ec 08             	sub    $0x8,%esp
 59f:	68 8b 0d 00 00       	push   $0xd8b
 5a4:	6a 01                	push   $0x1
 5a6:	e8 05 04 00 00       	call   9b0 <printf>
 5ab:	83 c4 10             	add    $0x10,%esp
 5ae:	e9 5c fe ff ff       	jmp    40f <hexdump+0x6f>
 5b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005c0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 5c0:	f3 0f 1e fb          	endbr32 
 5c4:	55                   	push   %ebp
    if (!endian)
 5c5:	a1 78 11 00 00       	mov    0x1178,%eax
{
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 5cf:	85 c0                	test   %eax,%eax
 5d1:	75 1d                	jne    5f0 <hton16+0x30>
        endian = byteorder();
 5d3:	c7 05 78 11 00 00 d2 	movl   $0x4d2,0x1178
 5da:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 5dd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 5df:	5d                   	pop    %ebp
 5e0:	66 c1 c2 08          	rol    $0x8,%dx
 5e4:	89 d0                	mov    %edx,%eax
 5e6:	c3                   	ret    
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax
 5f0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 5f2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 5f7:	74 e4                	je     5dd <hton16+0x1d>
}
 5f9:	89 d0                	mov    %edx,%eax
 5fb:	5d                   	pop    %ebp
 5fc:	c3                   	ret    
 5fd:	8d 76 00             	lea    0x0(%esi),%esi

00000600 <ntoh16>:
 600:	f3 0f 1e fb          	endbr32 
 604:	eb ba                	jmp    5c0 <hton16>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
    if (!endian)
 615:	8b 15 78 11 00 00    	mov    0x1178,%edx
{
 61b:	89 e5                	mov    %esp,%ebp
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 620:	85 d2                	test   %edx,%edx
 622:	75 14                	jne    638 <hton32+0x28>
        endian = byteorder();
 624:	c7 05 78 11 00 00 d2 	movl   $0x4d2,0x1178
 62b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 62e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 630:	5d                   	pop    %ebp
 631:	c3                   	ret    
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 638:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 63e:	74 ee                	je     62e <hton32+0x1e>
}
 640:	5d                   	pop    %ebp
 641:	c3                   	ret    
 642:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000650 <ntoh32>:
 650:	f3 0f 1e fb          	endbr32 
 654:	eb ba                	jmp    610 <hton32>
 656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 660:	f3 0f 1e fb          	endbr32 
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	57                   	push   %edi
 668:	8b 4d 08             	mov    0x8(%ebp),%ecx
 66b:	56                   	push   %esi
 66c:	53                   	push   %ebx
 66d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 670:	0f b6 01             	movzbl (%ecx),%eax
 673:	3c 09                	cmp    $0x9,%al
 675:	74 09                	je     680 <strtol+0x20>
 677:	3c 20                	cmp    $0x20,%al
 679:	75 14                	jne    68f <strtol+0x2f>
 67b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
 680:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 684:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 687:	3c 20                	cmp    $0x20,%al
 689:	74 f5                	je     680 <strtol+0x20>
 68b:	3c 09                	cmp    $0x9,%al
 68d:	74 f1                	je     680 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 68f:	3c 2b                	cmp    $0x2b,%al
 691:	0f 84 a9 00 00 00    	je     740 <strtol+0xe0>
    int neg = 0;
 697:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 699:	3c 2d                	cmp    $0x2d,%al
 69b:	0f 84 8f 00 00 00    	je     730 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6a1:	0f be 11             	movsbl (%ecx),%edx
 6a4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 6aa:	75 12                	jne    6be <strtol+0x5e>
 6ac:	80 fa 30             	cmp    $0x30,%dl
 6af:	0f 84 9b 00 00 00    	je     750 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 6b5:	85 db                	test   %ebx,%ebx
 6b7:	75 05                	jne    6be <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 6b9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 6be:	89 5d 10             	mov    %ebx,0x10(%ebp)
 6c1:	31 c0                	xor    %eax,%eax
 6c3:	eb 17                	jmp    6dc <strtol+0x7c>
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 6c8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 6cb:	3b 55 10             	cmp    0x10(%ebp),%edx
 6ce:	7d 28                	jge    6f8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 6d0:	0f af 45 10          	imul   0x10(%ebp),%eax
 6d4:	83 c1 01             	add    $0x1,%ecx
 6d7:	01 d0                	add    %edx,%eax
    while (1) {
 6d9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 6dc:	8d 72 d0             	lea    -0x30(%edx),%esi
 6df:	89 f3                	mov    %esi,%ebx
 6e1:	80 fb 09             	cmp    $0x9,%bl
 6e4:	76 e2                	jbe    6c8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 6e6:	8d 72 9f             	lea    -0x61(%edx),%esi
 6e9:	89 f3                	mov    %esi,%ebx
 6eb:	80 fb 19             	cmp    $0x19,%bl
 6ee:	77 28                	ja     718 <strtol+0xb8>
            dig = *s - 'a' + 10;
 6f0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 6f3:	3b 55 10             	cmp    0x10(%ebp),%edx
 6f6:	7c d8                	jl     6d0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 6f8:	8b 55 0c             	mov    0xc(%ebp),%edx
 6fb:	85 d2                	test   %edx,%edx
 6fd:	74 05                	je     704 <strtol+0xa4>
        *endptr = (char *) s;
 6ff:	8b 75 0c             	mov    0xc(%ebp),%esi
 702:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 704:	89 c2                	mov    %eax,%edx
}
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
    return (neg ? -val : val);
 708:	f7 da                	neg    %edx
 70a:	85 ff                	test   %edi,%edi
}
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 70e:	0f 45 c2             	cmovne %edx,%eax
}
 711:	c3                   	ret    
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 718:	8d 72 bf             	lea    -0x41(%edx),%esi
 71b:	89 f3                	mov    %esi,%ebx
 71d:	80 fb 19             	cmp    $0x19,%bl
 720:	77 d6                	ja     6f8 <strtol+0x98>
            dig = *s - 'A' + 10;
 722:	83 ea 37             	sub    $0x37,%edx
 725:	eb a4                	jmp    6cb <strtol+0x6b>
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 730:	83 c1 01             	add    $0x1,%ecx
 733:	bf 01 00 00 00       	mov    $0x1,%edi
 738:	e9 64 ff ff ff       	jmp    6a1 <strtol+0x41>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 740:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 743:	31 ff                	xor    %edi,%edi
 745:	e9 57 ff ff ff       	jmp    6a1 <strtol+0x41>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 750:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 754:	3c 78                	cmp    $0x78,%al
 756:	74 18                	je     770 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 758:	85 db                	test   %ebx,%ebx
 75a:	0f 85 5e ff ff ff    	jne    6be <strtol+0x5e>
        s++, base = 8;
 760:	83 c1 01             	add    $0x1,%ecx
 763:	0f be d0             	movsbl %al,%edx
 766:	bb 08 00 00 00       	mov    $0x8,%ebx
 76b:	e9 4e ff ff ff       	jmp    6be <strtol+0x5e>
        s += 2, base = 16;
 770:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 774:	bb 10 00 00 00       	mov    $0x10,%ebx
 779:	83 c1 02             	add    $0x2,%ecx
 77c:	e9 3d ff ff ff       	jmp    6be <strtol+0x5e>
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop

00000790 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 790:	f3 0f 1e fb          	endbr32 
 794:	55                   	push   %ebp
 795:	89 e5                	mov    %esp,%ebp
 797:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 798:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 79a:	56                   	push   %esi
 79b:	53                   	push   %ebx
 79c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 79f:	83 ec 1c             	sub    $0x1c,%esp
 7a2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 7a5:	83 ec 04             	sub    $0x4,%esp
 7a8:	6a 0a                	push   $0xa
 7aa:	53                   	push   %ebx
 7ab:	56                   	push   %esi
 7ac:	e8 af fe ff ff       	call   660 <strtol>
        if (ret < 0 || ret > 255) {
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	3d ff 00 00 00       	cmp    $0xff,%eax
 7b9:	77 3d                	ja     7f8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 7bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 7be:	39 f1                	cmp    %esi,%ecx
 7c0:	74 36                	je     7f8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7c2:	0f b6 11             	movzbl (%ecx),%edx
 7c5:	83 ff 03             	cmp    $0x3,%edi
 7c8:	74 16                	je     7e0 <ip_addr_pton+0x50>
 7ca:	80 fa 2e             	cmp    $0x2e,%dl
 7cd:	75 29                	jne    7f8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 7cf:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 7d2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 7d5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 7d8:	83 c7 01             	add    $0x1,%edi
 7db:	eb c8                	jmp    7a5 <ip_addr_pton+0x15>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 7e0:	84 d2                	test   %dl,%dl
 7e2:	75 14                	jne    7f8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 7e4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 7e7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 7ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 7ed:	31 c0                	xor    %eax,%eax
}
 7ef:	5b                   	pop    %ebx
 7f0:	5e                   	pop    %esi
 7f1:	5f                   	pop    %edi
 7f2:	5d                   	pop    %ebp
 7f3:	c3                   	ret    
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 7fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 800:	5b                   	pop    %ebx
 801:	5e                   	pop    %esi
 802:	5f                   	pop    %edi
 803:	5d                   	pop    %ebp
 804:	c3                   	ret    

00000805 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 805:	b8 01 00 00 00       	mov    $0x1,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <exit>:
SYSCALL(exit)
 80d:	b8 02 00 00 00       	mov    $0x2,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <wait>:
SYSCALL(wait)
 815:	b8 03 00 00 00       	mov    $0x3,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <pipe>:
SYSCALL(pipe)
 81d:	b8 04 00 00 00       	mov    $0x4,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <read>:
SYSCALL(read)
 825:	b8 05 00 00 00       	mov    $0x5,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <write>:
SYSCALL(write)
 82d:	b8 10 00 00 00       	mov    $0x10,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <close>:
SYSCALL(close)
 835:	b8 15 00 00 00       	mov    $0x15,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <kill>:
SYSCALL(kill)
 83d:	b8 06 00 00 00       	mov    $0x6,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <exec>:
SYSCALL(exec)
 845:	b8 07 00 00 00       	mov    $0x7,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <open>:
SYSCALL(open)
 84d:	b8 0f 00 00 00       	mov    $0xf,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <mknod>:
SYSCALL(mknod)
 855:	b8 11 00 00 00       	mov    $0x11,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <unlink>:
SYSCALL(unlink)
 85d:	b8 12 00 00 00       	mov    $0x12,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <fstat>:
SYSCALL(fstat)
 865:	b8 08 00 00 00       	mov    $0x8,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <link>:
SYSCALL(link)
 86d:	b8 13 00 00 00       	mov    $0x13,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <mkdir>:
SYSCALL(mkdir)
 875:	b8 14 00 00 00       	mov    $0x14,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <chdir>:
SYSCALL(chdir)
 87d:	b8 09 00 00 00       	mov    $0x9,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <dup>:
SYSCALL(dup)
 885:	b8 0a 00 00 00       	mov    $0xa,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <getpid>:
SYSCALL(getpid)
 88d:	b8 0b 00 00 00       	mov    $0xb,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <sbrk>:
SYSCALL(sbrk)
 895:	b8 0c 00 00 00       	mov    $0xc,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <sleep>:
SYSCALL(sleep)
 89d:	b8 0d 00 00 00       	mov    $0xd,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <uptime>:
SYSCALL(uptime)
 8a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <ioctl>:
# iotcl
SYSCALL(ioctl)
 8ad:	b8 16 00 00 00       	mov    $0x16,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <socket>:
# socket
SYSCALL(socket)
 8b5:	b8 17 00 00 00       	mov    $0x17,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <bind>:
SYSCALL(bind)
 8bd:	b8 19 00 00 00       	mov    $0x19,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <listen>:
SYSCALL(listen)
 8c5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <accept>:
SYSCALL(accept)
 8cd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <recv>:
SYSCALL(recv)
 8d5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <send>:
SYSCALL(send)
 8dd:	b8 1d 00 00 00       	mov    $0x1d,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <recvfrom>:
SYSCALL(recvfrom)
 8e5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <sendto>:
SYSCALL(sendto)
 8ed:	b8 1f 00 00 00       	mov    $0x1f,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    
 8f5:	66 90                	xchg   %ax,%ax
 8f7:	66 90                	xchg   %ax,%ax
 8f9:	66 90                	xchg   %ax,%ax
 8fb:	66 90                	xchg   %ax,%ax
 8fd:	66 90                	xchg   %ax,%ax
 8ff:	90                   	nop

00000900 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 3c             	sub    $0x3c,%esp
 909:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 90c:	89 d1                	mov    %edx,%ecx
{
 90e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 911:	85 d2                	test   %edx,%edx
 913:	0f 89 7f 00 00 00    	jns    998 <printint+0x98>
 919:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 91d:	74 79                	je     998 <printint+0x98>
    neg = 1;
 91f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 926:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 928:	31 db                	xor    %ebx,%ebx
 92a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 930:	89 c8                	mov    %ecx,%eax
 932:	31 d2                	xor    %edx,%edx
 934:	89 cf                	mov    %ecx,%edi
 936:	f7 75 c4             	divl   -0x3c(%ebp)
 939:	0f b6 92 ac 0d 00 00 	movzbl 0xdac(%edx),%edx
 940:	89 45 c0             	mov    %eax,-0x40(%ebp)
 943:	89 d8                	mov    %ebx,%eax
 945:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 948:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 94b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 94e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 951:	76 dd                	jbe    930 <printint+0x30>
  if(neg)
 953:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 956:	85 c9                	test   %ecx,%ecx
 958:	74 0c                	je     966 <printint+0x66>
    buf[i++] = '-';
 95a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 95f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 961:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 966:	8b 7d b8             	mov    -0x48(%ebp),%edi
 969:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 96d:	eb 07                	jmp    976 <printint+0x76>
 96f:	90                   	nop
 970:	0f b6 13             	movzbl (%ebx),%edx
 973:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 976:	83 ec 04             	sub    $0x4,%esp
 979:	88 55 d7             	mov    %dl,-0x29(%ebp)
 97c:	6a 01                	push   $0x1
 97e:	56                   	push   %esi
 97f:	57                   	push   %edi
 980:	e8 a8 fe ff ff       	call   82d <write>
  while(--i >= 0)
 985:	83 c4 10             	add    $0x10,%esp
 988:	39 de                	cmp    %ebx,%esi
 98a:	75 e4                	jne    970 <printint+0x70>
    putc(fd, buf[i]);
}
 98c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 98f:	5b                   	pop    %ebx
 990:	5e                   	pop    %esi
 991:	5f                   	pop    %edi
 992:	5d                   	pop    %ebp
 993:	c3                   	ret    
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 998:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 99f:	eb 87                	jmp    928 <printint+0x28>
 9a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9af:	90                   	nop

000009b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 9b0:	f3 0f 1e fb          	endbr32 
 9b4:	55                   	push   %ebp
 9b5:	89 e5                	mov    %esp,%ebp
 9b7:	57                   	push   %edi
 9b8:	56                   	push   %esi
 9b9:	53                   	push   %ebx
 9ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 9c0:	0f b6 1e             	movzbl (%esi),%ebx
 9c3:	84 db                	test   %bl,%bl
 9c5:	0f 84 b4 00 00 00    	je     a7f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 9cb:	8d 45 10             	lea    0x10(%ebp),%eax
 9ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 9d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 9d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 9d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9d9:	eb 33                	jmp    a0e <printf+0x5e>
 9db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9df:	90                   	nop
 9e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 9e8:	83 f8 25             	cmp    $0x25,%eax
 9eb:	74 17                	je     a04 <printf+0x54>
  write(fd, &c, 1);
 9ed:	83 ec 04             	sub    $0x4,%esp
 9f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9f3:	6a 01                	push   $0x1
 9f5:	57                   	push   %edi
 9f6:	ff 75 08             	pushl  0x8(%ebp)
 9f9:	e8 2f fe ff ff       	call   82d <write>
 9fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a01:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a04:	0f b6 1e             	movzbl (%esi),%ebx
 a07:	83 c6 01             	add    $0x1,%esi
 a0a:	84 db                	test   %bl,%bl
 a0c:	74 71                	je     a7f <printf+0xcf>
    c = fmt[i] & 0xff;
 a0e:	0f be cb             	movsbl %bl,%ecx
 a11:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a14:	85 d2                	test   %edx,%edx
 a16:	74 c8                	je     9e0 <printf+0x30>
      }
    } else if(state == '%'){
 a18:	83 fa 25             	cmp    $0x25,%edx
 a1b:	75 e7                	jne    a04 <printf+0x54>
      if(c == 'd'){
 a1d:	83 f8 64             	cmp    $0x64,%eax
 a20:	0f 84 9a 00 00 00    	je     ac0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a26:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a2c:	83 f9 70             	cmp    $0x70,%ecx
 a2f:	74 5f                	je     a90 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a31:	83 f8 73             	cmp    $0x73,%eax
 a34:	0f 84 d6 00 00 00    	je     b10 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a3a:	83 f8 63             	cmp    $0x63,%eax
 a3d:	0f 84 8d 00 00 00    	je     ad0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a43:	83 f8 25             	cmp    $0x25,%eax
 a46:	0f 84 b4 00 00 00    	je     b00 <printf+0x150>
  write(fd, &c, 1);
 a4c:	83 ec 04             	sub    $0x4,%esp
 a4f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a53:	6a 01                	push   $0x1
 a55:	57                   	push   %edi
 a56:	ff 75 08             	pushl  0x8(%ebp)
 a59:	e8 cf fd ff ff       	call   82d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a5e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a61:	83 c4 0c             	add    $0xc,%esp
 a64:	6a 01                	push   $0x1
 a66:	83 c6 01             	add    $0x1,%esi
 a69:	57                   	push   %edi
 a6a:	ff 75 08             	pushl  0x8(%ebp)
 a6d:	e8 bb fd ff ff       	call   82d <write>
  for(i = 0; fmt[i]; i++){
 a72:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a76:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a79:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a7b:	84 db                	test   %bl,%bl
 a7d:	75 8f                	jne    a0e <printf+0x5e>
    }
  }
}
 a7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a82:	5b                   	pop    %ebx
 a83:	5e                   	pop    %esi
 a84:	5f                   	pop    %edi
 a85:	5d                   	pop    %ebp
 a86:	c3                   	ret    
 a87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a90:	83 ec 0c             	sub    $0xc,%esp
 a93:	b9 10 00 00 00       	mov    $0x10,%ecx
 a98:	6a 00                	push   $0x0
 a9a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a9d:	8b 45 08             	mov    0x8(%ebp),%eax
 aa0:	8b 13                	mov    (%ebx),%edx
 aa2:	e8 59 fe ff ff       	call   900 <printint>
        ap++;
 aa7:	89 d8                	mov    %ebx,%eax
 aa9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 aac:	31 d2                	xor    %edx,%edx
        ap++;
 aae:	83 c0 04             	add    $0x4,%eax
 ab1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ab4:	e9 4b ff ff ff       	jmp    a04 <printf+0x54>
 ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 ac0:	83 ec 0c             	sub    $0xc,%esp
 ac3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ac8:	6a 01                	push   $0x1
 aca:	eb ce                	jmp    a9a <printf+0xea>
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 ad0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 ad3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 ad6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 ad8:	6a 01                	push   $0x1
        ap++;
 ada:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 add:	57                   	push   %edi
 ade:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 ae1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ae4:	e8 44 fd ff ff       	call   82d <write>
        ap++;
 ae9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 aec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 aef:	31 d2                	xor    %edx,%edx
 af1:	e9 0e ff ff ff       	jmp    a04 <printf+0x54>
 af6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 afd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b00:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b03:	83 ec 04             	sub    $0x4,%esp
 b06:	e9 59 ff ff ff       	jmp    a64 <printf+0xb4>
 b0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b0f:	90                   	nop
        s = (char*)*ap;
 b10:	8b 45 d0             	mov    -0x30(%ebp),%eax
 b13:	8b 18                	mov    (%eax),%ebx
        ap++;
 b15:	83 c0 04             	add    $0x4,%eax
 b18:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 b1b:	85 db                	test   %ebx,%ebx
 b1d:	74 17                	je     b36 <printf+0x186>
        while(*s != 0){
 b1f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 b22:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 b24:	84 c0                	test   %al,%al
 b26:	0f 84 d8 fe ff ff    	je     a04 <printf+0x54>
 b2c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b2f:	89 de                	mov    %ebx,%esi
 b31:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b34:	eb 1a                	jmp    b50 <printf+0x1a0>
          s = "(null)";
 b36:	bb a4 0d 00 00       	mov    $0xda4,%ebx
        while(*s != 0){
 b3b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b3e:	b8 28 00 00 00       	mov    $0x28,%eax
 b43:	89 de                	mov    %ebx,%esi
 b45:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4f:	90                   	nop
  write(fd, &c, 1);
 b50:	83 ec 04             	sub    $0x4,%esp
          s++;
 b53:	83 c6 01             	add    $0x1,%esi
 b56:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b59:	6a 01                	push   $0x1
 b5b:	57                   	push   %edi
 b5c:	53                   	push   %ebx
 b5d:	e8 cb fc ff ff       	call   82d <write>
        while(*s != 0){
 b62:	0f b6 06             	movzbl (%esi),%eax
 b65:	83 c4 10             	add    $0x10,%esp
 b68:	84 c0                	test   %al,%al
 b6a:	75 e4                	jne    b50 <printf+0x1a0>
 b6c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b6f:	31 d2                	xor    %edx,%edx
 b71:	e9 8e fe ff ff       	jmp    a04 <printf+0x54>
 b76:	66 90                	xchg   %ax,%ax
 b78:	66 90                	xchg   %ax,%ax
 b7a:	66 90                	xchg   %ax,%ax
 b7c:	66 90                	xchg   %ax,%ax
 b7e:	66 90                	xchg   %ax,%ax

00000b80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b80:	f3 0f 1e fb          	endbr32 
 b84:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b85:	a1 7c 11 00 00       	mov    0x117c,%eax
{
 b8a:	89 e5                	mov    %esp,%ebp
 b8c:	57                   	push   %edi
 b8d:	56                   	push   %esi
 b8e:	53                   	push   %ebx
 b8f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b92:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 b94:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b97:	39 c8                	cmp    %ecx,%eax
 b99:	73 15                	jae    bb0 <free+0x30>
 b9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b9f:	90                   	nop
 ba0:	39 d1                	cmp    %edx,%ecx
 ba2:	72 14                	jb     bb8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ba4:	39 d0                	cmp    %edx,%eax
 ba6:	73 10                	jae    bb8 <free+0x38>
{
 ba8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 baa:	8b 10                	mov    (%eax),%edx
 bac:	39 c8                	cmp    %ecx,%eax
 bae:	72 f0                	jb     ba0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb0:	39 d0                	cmp    %edx,%eax
 bb2:	72 f4                	jb     ba8 <free+0x28>
 bb4:	39 d1                	cmp    %edx,%ecx
 bb6:	73 f0                	jae    ba8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 bb8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 bbb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 bbe:	39 fa                	cmp    %edi,%edx
 bc0:	74 1e                	je     be0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 bc2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bc5:	8b 50 04             	mov    0x4(%eax),%edx
 bc8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bcb:	39 f1                	cmp    %esi,%ecx
 bcd:	74 28                	je     bf7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 bcf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 bd1:	5b                   	pop    %ebx
  freep = p;
 bd2:	a3 7c 11 00 00       	mov    %eax,0x117c
}
 bd7:	5e                   	pop    %esi
 bd8:	5f                   	pop    %edi
 bd9:	5d                   	pop    %ebp
 bda:	c3                   	ret    
 bdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bdf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 be0:	03 72 04             	add    0x4(%edx),%esi
 be3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 be6:	8b 10                	mov    (%eax),%edx
 be8:	8b 12                	mov    (%edx),%edx
 bea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bed:	8b 50 04             	mov    0x4(%eax),%edx
 bf0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bf3:	39 f1                	cmp    %esi,%ecx
 bf5:	75 d8                	jne    bcf <free+0x4f>
    p->s.size += bp->s.size;
 bf7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bfa:	a3 7c 11 00 00       	mov    %eax,0x117c
    p->s.size += bp->s.size;
 bff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c05:	89 10                	mov    %edx,(%eax)
}
 c07:	5b                   	pop    %ebx
 c08:	5e                   	pop    %esi
 c09:	5f                   	pop    %edi
 c0a:	5d                   	pop    %ebp
 c0b:	c3                   	ret    
 c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c10:	f3 0f 1e fb          	endbr32 
 c14:	55                   	push   %ebp
 c15:	89 e5                	mov    %esp,%ebp
 c17:	57                   	push   %edi
 c18:	56                   	push   %esi
 c19:	53                   	push   %ebx
 c1a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c20:	8b 3d 7c 11 00 00    	mov    0x117c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c26:	8d 70 07             	lea    0x7(%eax),%esi
 c29:	c1 ee 03             	shr    $0x3,%esi
 c2c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 c2f:	85 ff                	test   %edi,%edi
 c31:	0f 84 a9 00 00 00    	je     ce0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c37:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c39:	8b 48 04             	mov    0x4(%eax),%ecx
 c3c:	39 f1                	cmp    %esi,%ecx
 c3e:	73 6d                	jae    cad <malloc+0x9d>
 c40:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c46:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c4b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 c4e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 c55:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 c58:	eb 17                	jmp    c71 <malloc+0x61>
 c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c60:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 c62:	8b 4a 04             	mov    0x4(%edx),%ecx
 c65:	39 f1                	cmp    %esi,%ecx
 c67:	73 4f                	jae    cb8 <malloc+0xa8>
 c69:	8b 3d 7c 11 00 00    	mov    0x117c,%edi
 c6f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c71:	39 c7                	cmp    %eax,%edi
 c73:	75 eb                	jne    c60 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 c75:	83 ec 0c             	sub    $0xc,%esp
 c78:	ff 75 e4             	pushl  -0x1c(%ebp)
 c7b:	e8 15 fc ff ff       	call   895 <sbrk>
  if(p == (char*)-1)
 c80:	83 c4 10             	add    $0x10,%esp
 c83:	83 f8 ff             	cmp    $0xffffffff,%eax
 c86:	74 1b                	je     ca3 <malloc+0x93>
  hp->s.size = nu;
 c88:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c8b:	83 ec 0c             	sub    $0xc,%esp
 c8e:	83 c0 08             	add    $0x8,%eax
 c91:	50                   	push   %eax
 c92:	e8 e9 fe ff ff       	call   b80 <free>
  return freep;
 c97:	a1 7c 11 00 00       	mov    0x117c,%eax
      if((p = morecore(nunits)) == 0)
 c9c:	83 c4 10             	add    $0x10,%esp
 c9f:	85 c0                	test   %eax,%eax
 ca1:	75 bd                	jne    c60 <malloc+0x50>
        return 0;
  }
}
 ca3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 ca6:	31 c0                	xor    %eax,%eax
}
 ca8:	5b                   	pop    %ebx
 ca9:	5e                   	pop    %esi
 caa:	5f                   	pop    %edi
 cab:	5d                   	pop    %ebp
 cac:	c3                   	ret    
    if(p->s.size >= nunits){
 cad:	89 c2                	mov    %eax,%edx
 caf:	89 f8                	mov    %edi,%eax
 cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 cb8:	39 ce                	cmp    %ecx,%esi
 cba:	74 54                	je     d10 <malloc+0x100>
        p->s.size -= nunits;
 cbc:	29 f1                	sub    %esi,%ecx
 cbe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 cc1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 cc4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 cc7:	a3 7c 11 00 00       	mov    %eax,0x117c
}
 ccc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ccf:	8d 42 08             	lea    0x8(%edx),%eax
}
 cd2:	5b                   	pop    %ebx
 cd3:	5e                   	pop    %esi
 cd4:	5f                   	pop    %edi
 cd5:	5d                   	pop    %ebp
 cd6:	c3                   	ret    
 cd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cde:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 ce0:	c7 05 7c 11 00 00 80 	movl   $0x1180,0x117c
 ce7:	11 00 00 
    base.s.size = 0;
 cea:	bf 80 11 00 00       	mov    $0x1180,%edi
    base.s.ptr = freep = prevp = &base;
 cef:	c7 05 80 11 00 00 80 	movl   $0x1180,0x1180
 cf6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cf9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 cfb:	c7 05 84 11 00 00 00 	movl   $0x0,0x1184
 d02:	00 00 00 
    if(p->s.size >= nunits){
 d05:	e9 36 ff ff ff       	jmp    c40 <malloc+0x30>
 d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 d10:	8b 0a                	mov    (%edx),%ecx
 d12:	89 08                	mov    %ecx,(%eax)
 d14:	eb b1                	jmp    cc7 <malloc+0xb7>
