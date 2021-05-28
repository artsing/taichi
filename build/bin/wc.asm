
build/bin/_wc：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 61 08 00 00       	call   89d <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 27 08 00 00       	call   885 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 f2 07 00 00       	call   85d <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 8b 0d 00 00       	push   $0xd8b
  73:	6a 01                	push   $0x1
  75:	e8 86 09 00 00       	call   a00 <printf>
      exit();
  7a:	e8 de 07 00 00       	call   85d <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 7d 0d 00 00       	push   $0xd7d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 cb 07 00 00       	call   85d <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 40 12 00 00       	push   $0x1240
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 98 07 00 00       	call   875 <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 40 12 00 00 	movsbl 0x1240(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 68 0d 00 00       	push   $0xd68
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 7e 0d 00 00       	push   $0xd7e
 15c:	6a 01                	push   $0x1
 15e:	e8 9d 08 00 00       	call   a00 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 6e 0d 00 00       	push   $0xd6e
 175:	6a 01                	push   $0x1
 177:	e8 84 08 00 00       	call   a00 <printf>
    exit();
 17c:	e8 dc 06 00 00       	call   85d <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 95 05 00 00       	call   875 <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 57 05 00 00       	call   89d <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 5a 05 00 00       	call   8b5 <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 20 05 00 00       	call   885 <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 34             	sub    $0x34,%esp
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 400:	68 a0 0d 00 00       	push   $0xda0
hexdump (void *data, size_t size) {
 405:	89 45 e0             	mov    %eax,-0x20(%ebp)
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 40b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 40d:	89 c7                	mov    %eax,%edi
 40f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 412:	e8 e9 05 00 00       	call   a00 <printf>
  for (offset = 0; offset < size; offset += 16) {
 417:	83 c4 10             	add    $0x10,%esp
 41a:	85 ff                	test   %edi,%edi
 41c:	0f 84 2d 01 00 00    	je     54f <hexdump+0x15f>
 422:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 425:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 42c:	be 10 00 00 00       	mov    $0x10,%esi
 431:	83 e8 01             	sub    $0x1,%eax
 434:	83 e0 f0             	and    $0xfffffff0,%eax
 437:	83 c0 10             	add    $0x10,%eax
 43a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 440:	83 ec 08             	sub    $0x8,%esp
 443:	68 f4 0d 00 00       	push   $0xdf4
 448:	6a 01                	push   $0x1
 44a:	e8 b1 05 00 00       	call   a00 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 44f:	83 c4 10             	add    $0x10,%esp
 452:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 459:	0f 8e 51 01 00 00    	jle    5b0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 45f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 462:	83 ec 04             	sub    $0x4,%esp
 465:	57                   	push   %edi
 466:	89 fb                	mov    %edi,%ebx
 468:	68 f1 0d 00 00       	push   $0xdf1
 46d:	6a 01                	push   $0x1
 46f:	e8 8c 05 00 00       	call   a00 <printf>
 474:	89 7d d8             	mov    %edi,-0x28(%ebp)
 477:	83 c4 10             	add    $0x10,%esp
 47a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 47d:	eb 28                	jmp    4a7 <hexdump+0xb7>
 47f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 480:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 484:	80 fa 0f             	cmp    $0xf,%dl
 487:	0f 86 e3 00 00 00    	jbe    570 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 48d:	83 ec 04             	sub    $0x4,%esp
 490:	83 c3 01             	add    $0x1,%ebx
 493:	52                   	push   %edx
 494:	68 f7 0d 00 00       	push   $0xdf7
 499:	6a 01                	push   $0x1
 49b:	e8 60 05 00 00       	call   a00 <printf>
 4a0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4a3:	39 f3                	cmp    %esi,%ebx
 4a5:	74 1e                	je     4c5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 4a7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 4aa:	7f d4                	jg     480 <hexdump+0x90>
      } else {
        printf(1, "   ");
 4ac:	83 ec 08             	sub    $0x8,%esp
 4af:	83 c3 01             	add    $0x1,%ebx
 4b2:	68 fb 0d 00 00       	push   $0xdfb
 4b7:	6a 01                	push   $0x1
 4b9:	e8 42 05 00 00       	call   a00 <printf>
 4be:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4c1:	39 f3                	cmp    %esi,%ebx
 4c3:	75 e2                	jne    4a7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 4cb:	68 f4 0d 00 00       	push   $0xdf4
 4d0:	6a 01                	push   $0x1
 4d2:	e8 29 05 00 00       	call   a00 <printf>
 4d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4da:	83 c4 10             	add    $0x10,%esp
 4dd:	eb 1b                	jmp    4fa <hexdump+0x10a>
 4df:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	52                   	push   %edx
 4e4:	68 ff 0d 00 00       	push   $0xdff
 4e9:	6a 01                	push   $0x1
 4eb:	e8 10 05 00 00       	call   a00 <printf>
 4f0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 4f3:	83 c3 01             	add    $0x1,%ebx
 4f6:	39 de                	cmp    %ebx,%esi
 4f8:	74 30                	je     52a <hexdump+0x13a>
      if(offset + index < (int)size) {
 4fa:	39 df                	cmp    %ebx,%edi
 4fc:	0f 8e 8e 00 00 00    	jle    590 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 502:	8b 45 e0             	mov    -0x20(%ebp),%eax
 505:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 509:	8d 4a e0             	lea    -0x20(%edx),%ecx
 50c:	80 f9 5e             	cmp    $0x5e,%cl
 50f:	76 cf                	jbe    4e0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 511:	83 ec 08             	sub    $0x8,%esp
 514:	83 c3 01             	add    $0x1,%ebx
 517:	68 02 0e 00 00       	push   $0xe02
 51c:	6a 01                	push   $0x1
 51e:	e8 dd 04 00 00       	call   a00 <printf>
 523:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 526:	39 de                	cmp    %ebx,%esi
 528:	75 d0                	jne    4fa <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 52a:	83 ec 08             	sub    $0x8,%esp
 52d:	83 c6 10             	add    $0x10,%esi
 530:	68 04 0e 00 00       	push   $0xe04
 535:	6a 01                	push   $0x1
 537:	e8 c4 04 00 00       	call   a00 <printf>
  for (offset = 0; offset < size; offset += 16) {
 53c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 540:	83 c4 10             	add    $0x10,%esp
 543:	8b 45 dc             	mov    -0x24(%ebp),%eax
 546:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 549:	0f 85 f1 fe ff ff    	jne    440 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 54f:	c7 45 0c a0 0d 00 00 	movl   $0xda0,0xc(%ebp)
 556:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 55d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 564:	e9 97 04 00 00       	jmp    a00 <printf>
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 570:	83 ec 08             	sub    $0x8,%esp
 573:	68 ef 0d 00 00       	push   $0xdef
 578:	6a 01                	push   $0x1
 57a:	e8 81 04 00 00       	call   a00 <printf>
 57f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 583:	83 c4 10             	add    $0x10,%esp
 586:	e9 02 ff ff ff       	jmp    48d <hexdump+0x9d>
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop
        printf(1, " ");
 590:	83 ec 08             	sub    $0x8,%esp
 593:	68 fd 0d 00 00       	push   $0xdfd
 598:	6a 01                	push   $0x1
 59a:	e8 61 04 00 00       	call   a00 <printf>
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	e9 4c ff ff ff       	jmp    4f3 <hexdump+0x103>
 5a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ae:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 5b0:	83 ec 08             	sub    $0x8,%esp
 5b3:	68 ef 0d 00 00       	push   $0xdef
 5b8:	6a 01                	push   $0x1
 5ba:	e8 41 04 00 00       	call   a00 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 5bf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 5c2:	83 c4 10             	add    $0x10,%esp
 5c5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 5cb:	0f 8f 8e fe ff ff    	jg     45f <hexdump+0x6f>
 5d1:	83 ec 08             	sub    $0x8,%esp
 5d4:	68 ef 0d 00 00       	push   $0xdef
 5d9:	6a 01                	push   $0x1
 5db:	e8 20 04 00 00       	call   a00 <printf>
    if (offset <= 0x000f) printf(1, "0");
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	83 ff 0f             	cmp    $0xf,%edi
 5e6:	0f 8f 73 fe ff ff    	jg     45f <hexdump+0x6f>
 5ec:	83 ec 08             	sub    $0x8,%esp
 5ef:	68 ef 0d 00 00       	push   $0xdef
 5f4:	6a 01                	push   $0x1
 5f6:	e8 05 04 00 00       	call   a00 <printf>
 5fb:	83 c4 10             	add    $0x10,%esp
 5fe:	e9 5c fe ff ff       	jmp    45f <hexdump+0x6f>
 603:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000610 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
    if (!endian)
 615:	a1 20 12 00 00       	mov    0x1220,%eax
{
 61a:	89 e5                	mov    %esp,%ebp
 61c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 61f:	85 c0                	test   %eax,%eax
 621:	75 1d                	jne    640 <hton16+0x30>
        endian = byteorder();
 623:	c7 05 20 12 00 00 d2 	movl   $0x4d2,0x1220
 62a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 62d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 62f:	5d                   	pop    %ebp
 630:	66 c1 c2 08          	rol    $0x8,%dx
 634:	89 d0                	mov    %edx,%eax
 636:	c3                   	ret    
 637:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63e:	66 90                	xchg   %ax,%ax
 640:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 642:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 647:	74 e4                	je     62d <hton16+0x1d>
}
 649:	89 d0                	mov    %edx,%eax
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret    
 64d:	8d 76 00             	lea    0x0(%esi),%esi

00000650 <ntoh16>:
 650:	f3 0f 1e fb          	endbr32 
 654:	eb ba                	jmp    610 <hton16>
 656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 660:	f3 0f 1e fb          	endbr32 
 664:	55                   	push   %ebp
    if (!endian)
 665:	8b 15 20 12 00 00    	mov    0x1220,%edx
{
 66b:	89 e5                	mov    %esp,%ebp
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 670:	85 d2                	test   %edx,%edx
 672:	75 14                	jne    688 <hton32+0x28>
        endian = byteorder();
 674:	c7 05 20 12 00 00 d2 	movl   $0x4d2,0x1220
 67b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 67e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 680:	5d                   	pop    %ebp
 681:	c3                   	ret    
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 688:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 68e:	74 ee                	je     67e <hton32+0x1e>
}
 690:	5d                   	pop    %ebp
 691:	c3                   	ret    
 692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006a0 <ntoh32>:
 6a0:	f3 0f 1e fb          	endbr32 
 6a4:	eb ba                	jmp    660 <hton32>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi

000006b0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6bb:	56                   	push   %esi
 6bc:	53                   	push   %ebx
 6bd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 6c0:	0f b6 01             	movzbl (%ecx),%eax
 6c3:	3c 09                	cmp    $0x9,%al
 6c5:	74 09                	je     6d0 <strtol+0x20>
 6c7:	3c 20                	cmp    $0x20,%al
 6c9:	75 14                	jne    6df <strtol+0x2f>
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
 6d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 6d4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 6d7:	3c 20                	cmp    $0x20,%al
 6d9:	74 f5                	je     6d0 <strtol+0x20>
 6db:	3c 09                	cmp    $0x9,%al
 6dd:	74 f1                	je     6d0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 6df:	3c 2b                	cmp    $0x2b,%al
 6e1:	0f 84 a9 00 00 00    	je     790 <strtol+0xe0>
    int neg = 0;
 6e7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 6e9:	3c 2d                	cmp    $0x2d,%al
 6eb:	0f 84 8f 00 00 00    	je     780 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 6f1:	0f be 11             	movsbl (%ecx),%edx
 6f4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 6fa:	75 12                	jne    70e <strtol+0x5e>
 6fc:	80 fa 30             	cmp    $0x30,%dl
 6ff:	0f 84 9b 00 00 00    	je     7a0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 705:	85 db                	test   %ebx,%ebx
 707:	75 05                	jne    70e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 709:	bb 0a 00 00 00       	mov    $0xa,%ebx
 70e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 711:	31 c0                	xor    %eax,%eax
 713:	eb 17                	jmp    72c <strtol+0x7c>
 715:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 718:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 71b:	3b 55 10             	cmp    0x10(%ebp),%edx
 71e:	7d 28                	jge    748 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 720:	0f af 45 10          	imul   0x10(%ebp),%eax
 724:	83 c1 01             	add    $0x1,%ecx
 727:	01 d0                	add    %edx,%eax
    while (1) {
 729:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 72c:	8d 72 d0             	lea    -0x30(%edx),%esi
 72f:	89 f3                	mov    %esi,%ebx
 731:	80 fb 09             	cmp    $0x9,%bl
 734:	76 e2                	jbe    718 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 736:	8d 72 9f             	lea    -0x61(%edx),%esi
 739:	89 f3                	mov    %esi,%ebx
 73b:	80 fb 19             	cmp    $0x19,%bl
 73e:	77 28                	ja     768 <strtol+0xb8>
            dig = *s - 'a' + 10;
 740:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 743:	3b 55 10             	cmp    0x10(%ebp),%edx
 746:	7c d8                	jl     720 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 748:	8b 55 0c             	mov    0xc(%ebp),%edx
 74b:	85 d2                	test   %edx,%edx
 74d:	74 05                	je     754 <strtol+0xa4>
        *endptr = (char *) s;
 74f:	8b 75 0c             	mov    0xc(%ebp),%esi
 752:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 754:	89 c2                	mov    %eax,%edx
}
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
    return (neg ? -val : val);
 758:	f7 da                	neg    %edx
 75a:	85 ff                	test   %edi,%edi
}
 75c:	5f                   	pop    %edi
 75d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 75e:	0f 45 c2             	cmovne %edx,%eax
}
 761:	c3                   	ret    
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 768:	8d 72 bf             	lea    -0x41(%edx),%esi
 76b:	89 f3                	mov    %esi,%ebx
 76d:	80 fb 19             	cmp    $0x19,%bl
 770:	77 d6                	ja     748 <strtol+0x98>
            dig = *s - 'A' + 10;
 772:	83 ea 37             	sub    $0x37,%edx
 775:	eb a4                	jmp    71b <strtol+0x6b>
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 780:	83 c1 01             	add    $0x1,%ecx
 783:	bf 01 00 00 00       	mov    $0x1,%edi
 788:	e9 64 ff ff ff       	jmp    6f1 <strtol+0x41>
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 790:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 793:	31 ff                	xor    %edi,%edi
 795:	e9 57 ff ff ff       	jmp    6f1 <strtol+0x41>
 79a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 7a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 7a4:	3c 78                	cmp    $0x78,%al
 7a6:	74 18                	je     7c0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 7a8:	85 db                	test   %ebx,%ebx
 7aa:	0f 85 5e ff ff ff    	jne    70e <strtol+0x5e>
        s++, base = 8;
 7b0:	83 c1 01             	add    $0x1,%ecx
 7b3:	0f be d0             	movsbl %al,%edx
 7b6:	bb 08 00 00 00       	mov    $0x8,%ebx
 7bb:	e9 4e ff ff ff       	jmp    70e <strtol+0x5e>
        s += 2, base = 16;
 7c0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 7c4:	bb 10 00 00 00       	mov    $0x10,%ebx
 7c9:	83 c1 02             	add    $0x2,%ecx
 7cc:	e9 3d ff ff ff       	jmp    70e <strtol+0x5e>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop

000007e0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
 7e5:	89 e5                	mov    %esp,%ebp
 7e7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 7e8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 7ea:	56                   	push   %esi
 7eb:	53                   	push   %ebx
 7ec:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 7ef:	83 ec 1c             	sub    $0x1c,%esp
 7f2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 7f5:	83 ec 04             	sub    $0x4,%esp
 7f8:	6a 0a                	push   $0xa
 7fa:	53                   	push   %ebx
 7fb:	56                   	push   %esi
 7fc:	e8 af fe ff ff       	call   6b0 <strtol>
        if (ret < 0 || ret > 255) {
 801:	83 c4 10             	add    $0x10,%esp
 804:	3d ff 00 00 00       	cmp    $0xff,%eax
 809:	77 3d                	ja     848 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 80b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80e:	39 f1                	cmp    %esi,%ecx
 810:	74 36                	je     848 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 812:	0f b6 11             	movzbl (%ecx),%edx
 815:	83 ff 03             	cmp    $0x3,%edi
 818:	74 16                	je     830 <ip_addr_pton+0x50>
 81a:	80 fa 2e             	cmp    $0x2e,%dl
 81d:	75 29                	jne    848 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 81f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 822:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 825:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 828:	83 c7 01             	add    $0x1,%edi
 82b:	eb c8                	jmp    7f5 <ip_addr_pton+0x15>
 82d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 830:	84 d2                	test   %dl,%dl
 832:	75 14                	jne    848 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 834:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 837:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 83a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 83d:	31 c0                	xor    %eax,%eax
}
 83f:	5b                   	pop    %ebx
 840:	5e                   	pop    %esi
 841:	5f                   	pop    %edi
 842:	5d                   	pop    %ebp
 843:	c3                   	ret    
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 848:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 84b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 850:	5b                   	pop    %ebx
 851:	5e                   	pop    %esi
 852:	5f                   	pop    %edi
 853:	5d                   	pop    %ebp
 854:	c3                   	ret    

00000855 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 855:	b8 01 00 00 00       	mov    $0x1,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <exit>:
SYSCALL(exit)
 85d:	b8 02 00 00 00       	mov    $0x2,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <wait>:
SYSCALL(wait)
 865:	b8 03 00 00 00       	mov    $0x3,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <pipe>:
SYSCALL(pipe)
 86d:	b8 04 00 00 00       	mov    $0x4,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <read>:
SYSCALL(read)
 875:	b8 05 00 00 00       	mov    $0x5,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <write>:
SYSCALL(write)
 87d:	b8 10 00 00 00       	mov    $0x10,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <close>:
SYSCALL(close)
 885:	b8 15 00 00 00       	mov    $0x15,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <kill>:
SYSCALL(kill)
 88d:	b8 06 00 00 00       	mov    $0x6,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <exec>:
SYSCALL(exec)
 895:	b8 07 00 00 00       	mov    $0x7,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <open>:
SYSCALL(open)
 89d:	b8 0f 00 00 00       	mov    $0xf,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <mknod>:
SYSCALL(mknod)
 8a5:	b8 11 00 00 00       	mov    $0x11,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <unlink>:
SYSCALL(unlink)
 8ad:	b8 12 00 00 00       	mov    $0x12,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <fstat>:
SYSCALL(fstat)
 8b5:	b8 08 00 00 00       	mov    $0x8,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <link>:
SYSCALL(link)
 8bd:	b8 13 00 00 00       	mov    $0x13,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <mkdir>:
SYSCALL(mkdir)
 8c5:	b8 14 00 00 00       	mov    $0x14,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <chdir>:
SYSCALL(chdir)
 8cd:	b8 09 00 00 00       	mov    $0x9,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <dup>:
SYSCALL(dup)
 8d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <getpid>:
SYSCALL(getpid)
 8dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <sbrk>:
SYSCALL(sbrk)
 8e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <sleep>:
SYSCALL(sleep)
 8ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <uptime>:
SYSCALL(uptime)
 8f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <ioctl>:
# iotcl
SYSCALL(ioctl)
 8fd:	b8 16 00 00 00       	mov    $0x16,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <socket>:
# socket
SYSCALL(socket)
 905:	b8 17 00 00 00       	mov    $0x17,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <bind>:
SYSCALL(bind)
 90d:	b8 19 00 00 00       	mov    $0x19,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <listen>:
SYSCALL(listen)
 915:	b8 1a 00 00 00       	mov    $0x1a,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <accept>:
SYSCALL(accept)
 91d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <recv>:
SYSCALL(recv)
 925:	b8 1c 00 00 00       	mov    $0x1c,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <send>:
SYSCALL(send)
 92d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <recvfrom>:
SYSCALL(recvfrom)
 935:	b8 1e 00 00 00       	mov    $0x1e,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <sendto>:
SYSCALL(sendto)
 93d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    
 945:	66 90                	xchg   %ax,%ax
 947:	66 90                	xchg   %ax,%ax
 949:	66 90                	xchg   %ax,%ax
 94b:	66 90                	xchg   %ax,%ax
 94d:	66 90                	xchg   %ax,%ax
 94f:	90                   	nop

00000950 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 3c             	sub    $0x3c,%esp
 959:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 95c:	89 d1                	mov    %edx,%ecx
{
 95e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 961:	85 d2                	test   %edx,%edx
 963:	0f 89 7f 00 00 00    	jns    9e8 <printint+0x98>
 969:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 96d:	74 79                	je     9e8 <printint+0x98>
    neg = 1;
 96f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 976:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 978:	31 db                	xor    %ebx,%ebx
 97a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 97d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 980:	89 c8                	mov    %ecx,%eax
 982:	31 d2                	xor    %edx,%edx
 984:	89 cf                	mov    %ecx,%edi
 986:	f7 75 c4             	divl   -0x3c(%ebp)
 989:	0f b6 92 10 0e 00 00 	movzbl 0xe10(%edx),%edx
 990:	89 45 c0             	mov    %eax,-0x40(%ebp)
 993:	89 d8                	mov    %ebx,%eax
 995:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 998:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 99b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 99e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 9a1:	76 dd                	jbe    980 <printint+0x30>
  if(neg)
 9a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 9a6:	85 c9                	test   %ecx,%ecx
 9a8:	74 0c                	je     9b6 <printint+0x66>
    buf[i++] = '-';
 9aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 9af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 9b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 9b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 9b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 9bd:	eb 07                	jmp    9c6 <printint+0x76>
 9bf:	90                   	nop
 9c0:	0f b6 13             	movzbl (%ebx),%edx
 9c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 9c6:	83 ec 04             	sub    $0x4,%esp
 9c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 9cc:	6a 01                	push   $0x1
 9ce:	56                   	push   %esi
 9cf:	57                   	push   %edi
 9d0:	e8 a8 fe ff ff       	call   87d <write>
  while(--i >= 0)
 9d5:	83 c4 10             	add    $0x10,%esp
 9d8:	39 de                	cmp    %ebx,%esi
 9da:	75 e4                	jne    9c0 <printint+0x70>
    putc(fd, buf[i]);
}
 9dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9df:	5b                   	pop    %ebx
 9e0:	5e                   	pop    %esi
 9e1:	5f                   	pop    %edi
 9e2:	5d                   	pop    %ebp
 9e3:	c3                   	ret    
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 9e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 9ef:	eb 87                	jmp    978 <printint+0x28>
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ff:	90                   	nop

00000a00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 a00:	f3 0f 1e fb          	endbr32 
 a04:	55                   	push   %ebp
 a05:	89 e5                	mov    %esp,%ebp
 a07:	57                   	push   %edi
 a08:	56                   	push   %esi
 a09:	53                   	push   %ebx
 a0a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a0d:	8b 75 0c             	mov    0xc(%ebp),%esi
 a10:	0f b6 1e             	movzbl (%esi),%ebx
 a13:	84 db                	test   %bl,%bl
 a15:	0f 84 b4 00 00 00    	je     acf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 a1b:	8d 45 10             	lea    0x10(%ebp),%eax
 a1e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 a21:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 a24:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 a26:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a29:	eb 33                	jmp    a5e <printf+0x5e>
 a2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop
 a30:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a33:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 a38:	83 f8 25             	cmp    $0x25,%eax
 a3b:	74 17                	je     a54 <printf+0x54>
  write(fd, &c, 1);
 a3d:	83 ec 04             	sub    $0x4,%esp
 a40:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a43:	6a 01                	push   $0x1
 a45:	57                   	push   %edi
 a46:	ff 75 08             	pushl  0x8(%ebp)
 a49:	e8 2f fe ff ff       	call   87d <write>
 a4e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a51:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a54:	0f b6 1e             	movzbl (%esi),%ebx
 a57:	83 c6 01             	add    $0x1,%esi
 a5a:	84 db                	test   %bl,%bl
 a5c:	74 71                	je     acf <printf+0xcf>
    c = fmt[i] & 0xff;
 a5e:	0f be cb             	movsbl %bl,%ecx
 a61:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a64:	85 d2                	test   %edx,%edx
 a66:	74 c8                	je     a30 <printf+0x30>
      }
    } else if(state == '%'){
 a68:	83 fa 25             	cmp    $0x25,%edx
 a6b:	75 e7                	jne    a54 <printf+0x54>
      if(c == 'd'){
 a6d:	83 f8 64             	cmp    $0x64,%eax
 a70:	0f 84 9a 00 00 00    	je     b10 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a76:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a7c:	83 f9 70             	cmp    $0x70,%ecx
 a7f:	74 5f                	je     ae0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a81:	83 f8 73             	cmp    $0x73,%eax
 a84:	0f 84 d6 00 00 00    	je     b60 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a8a:	83 f8 63             	cmp    $0x63,%eax
 a8d:	0f 84 8d 00 00 00    	je     b20 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a93:	83 f8 25             	cmp    $0x25,%eax
 a96:	0f 84 b4 00 00 00    	je     b50 <printf+0x150>
  write(fd, &c, 1);
 a9c:	83 ec 04             	sub    $0x4,%esp
 a9f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 aa3:	6a 01                	push   $0x1
 aa5:	57                   	push   %edi
 aa6:	ff 75 08             	pushl  0x8(%ebp)
 aa9:	e8 cf fd ff ff       	call   87d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 aae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 ab1:	83 c4 0c             	add    $0xc,%esp
 ab4:	6a 01                	push   $0x1
 ab6:	83 c6 01             	add    $0x1,%esi
 ab9:	57                   	push   %edi
 aba:	ff 75 08             	pushl  0x8(%ebp)
 abd:	e8 bb fd ff ff       	call   87d <write>
  for(i = 0; fmt[i]; i++){
 ac2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 ac6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 ac9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 acb:	84 db                	test   %bl,%bl
 acd:	75 8f                	jne    a5e <printf+0x5e>
    }
  }
}
 acf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ad2:	5b                   	pop    %ebx
 ad3:	5e                   	pop    %esi
 ad4:	5f                   	pop    %edi
 ad5:	5d                   	pop    %ebp
 ad6:	c3                   	ret    
 ad7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ade:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 ae0:	83 ec 0c             	sub    $0xc,%esp
 ae3:	b9 10 00 00 00       	mov    $0x10,%ecx
 ae8:	6a 00                	push   $0x0
 aea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 aed:	8b 45 08             	mov    0x8(%ebp),%eax
 af0:	8b 13                	mov    (%ebx),%edx
 af2:	e8 59 fe ff ff       	call   950 <printint>
        ap++;
 af7:	89 d8                	mov    %ebx,%eax
 af9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 afc:	31 d2                	xor    %edx,%edx
        ap++;
 afe:	83 c0 04             	add    $0x4,%eax
 b01:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b04:	e9 4b ff ff ff       	jmp    a54 <printf+0x54>
 b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 b10:	83 ec 0c             	sub    $0xc,%esp
 b13:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b18:	6a 01                	push   $0x1
 b1a:	eb ce                	jmp    aea <printf+0xea>
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 b20:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b23:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b26:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 b28:	6a 01                	push   $0x1
        ap++;
 b2a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 b2d:	57                   	push   %edi
 b2e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 b31:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b34:	e8 44 fd ff ff       	call   87d <write>
        ap++;
 b39:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b3c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b3f:	31 d2                	xor    %edx,%edx
 b41:	e9 0e ff ff ff       	jmp    a54 <printf+0x54>
 b46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b50:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b53:	83 ec 04             	sub    $0x4,%esp
 b56:	e9 59 ff ff ff       	jmp    ab4 <printf+0xb4>
 b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b5f:	90                   	nop
        s = (char*)*ap;
 b60:	8b 45 d0             	mov    -0x30(%ebp),%eax
 b63:	8b 18                	mov    (%eax),%ebx
        ap++;
 b65:	83 c0 04             	add    $0x4,%eax
 b68:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 b6b:	85 db                	test   %ebx,%ebx
 b6d:	74 17                	je     b86 <printf+0x186>
        while(*s != 0){
 b6f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 b72:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 b74:	84 c0                	test   %al,%al
 b76:	0f 84 d8 fe ff ff    	je     a54 <printf+0x54>
 b7c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b7f:	89 de                	mov    %ebx,%esi
 b81:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b84:	eb 1a                	jmp    ba0 <printf+0x1a0>
          s = "(null)";
 b86:	bb 08 0e 00 00       	mov    $0xe08,%ebx
        while(*s != 0){
 b8b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 b8e:	b8 28 00 00 00       	mov    $0x28,%eax
 b93:	89 de                	mov    %ebx,%esi
 b95:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b9f:	90                   	nop
  write(fd, &c, 1);
 ba0:	83 ec 04             	sub    $0x4,%esp
          s++;
 ba3:	83 c6 01             	add    $0x1,%esi
 ba6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ba9:	6a 01                	push   $0x1
 bab:	57                   	push   %edi
 bac:	53                   	push   %ebx
 bad:	e8 cb fc ff ff       	call   87d <write>
        while(*s != 0){
 bb2:	0f b6 06             	movzbl (%esi),%eax
 bb5:	83 c4 10             	add    $0x10,%esp
 bb8:	84 c0                	test   %al,%al
 bba:	75 e4                	jne    ba0 <printf+0x1a0>
 bbc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 bbf:	31 d2                	xor    %edx,%edx
 bc1:	e9 8e fe ff ff       	jmp    a54 <printf+0x54>
 bc6:	66 90                	xchg   %ax,%ax
 bc8:	66 90                	xchg   %ax,%ax
 bca:	66 90                	xchg   %ax,%ax
 bcc:	66 90                	xchg   %ax,%ax
 bce:	66 90                	xchg   %ax,%ax

00000bd0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 bd0:	f3 0f 1e fb          	endbr32 
 bd4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bd5:	a1 24 12 00 00       	mov    0x1224,%eax
{
 bda:	89 e5                	mov    %esp,%ebp
 bdc:	57                   	push   %edi
 bdd:	56                   	push   %esi
 bde:	53                   	push   %ebx
 bdf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 be2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 be4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 be7:	39 c8                	cmp    %ecx,%eax
 be9:	73 15                	jae    c00 <free+0x30>
 beb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bef:	90                   	nop
 bf0:	39 d1                	cmp    %edx,%ecx
 bf2:	72 14                	jb     c08 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bf4:	39 d0                	cmp    %edx,%eax
 bf6:	73 10                	jae    c08 <free+0x38>
{
 bf8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bfa:	8b 10                	mov    (%eax),%edx
 bfc:	39 c8                	cmp    %ecx,%eax
 bfe:	72 f0                	jb     bf0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c00:	39 d0                	cmp    %edx,%eax
 c02:	72 f4                	jb     bf8 <free+0x28>
 c04:	39 d1                	cmp    %edx,%ecx
 c06:	73 f0                	jae    bf8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 c0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 c0e:	39 fa                	cmp    %edi,%edx
 c10:	74 1e                	je     c30 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 c12:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c15:	8b 50 04             	mov    0x4(%eax),%edx
 c18:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c1b:	39 f1                	cmp    %esi,%ecx
 c1d:	74 28                	je     c47 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c1f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 c21:	5b                   	pop    %ebx
  freep = p;
 c22:	a3 24 12 00 00       	mov    %eax,0x1224
}
 c27:	5e                   	pop    %esi
 c28:	5f                   	pop    %edi
 c29:	5d                   	pop    %ebp
 c2a:	c3                   	ret    
 c2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c2f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 c30:	03 72 04             	add    0x4(%edx),%esi
 c33:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 c36:	8b 10                	mov    (%eax),%edx
 c38:	8b 12                	mov    (%edx),%edx
 c3a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c3d:	8b 50 04             	mov    0x4(%eax),%edx
 c40:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c43:	39 f1                	cmp    %esi,%ecx
 c45:	75 d8                	jne    c1f <free+0x4f>
    p->s.size += bp->s.size;
 c47:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 c4a:	a3 24 12 00 00       	mov    %eax,0x1224
    p->s.size += bp->s.size;
 c4f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c52:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c55:	89 10                	mov    %edx,(%eax)
}
 c57:	5b                   	pop    %ebx
 c58:	5e                   	pop    %esi
 c59:	5f                   	pop    %edi
 c5a:	5d                   	pop    %ebp
 c5b:	c3                   	ret    
 c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c60:	f3 0f 1e fb          	endbr32 
 c64:	55                   	push   %ebp
 c65:	89 e5                	mov    %esp,%ebp
 c67:	57                   	push   %edi
 c68:	56                   	push   %esi
 c69:	53                   	push   %ebx
 c6a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c70:	8b 3d 24 12 00 00    	mov    0x1224,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c76:	8d 70 07             	lea    0x7(%eax),%esi
 c79:	c1 ee 03             	shr    $0x3,%esi
 c7c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 c7f:	85 ff                	test   %edi,%edi
 c81:	0f 84 a9 00 00 00    	je     d30 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c87:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 c89:	8b 48 04             	mov    0x4(%eax),%ecx
 c8c:	39 f1                	cmp    %esi,%ecx
 c8e:	73 6d                	jae    cfd <malloc+0x9d>
 c90:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c96:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c9b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 c9e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ca5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ca8:	eb 17                	jmp    cc1 <malloc+0x61>
 caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cb0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 cb2:	8b 4a 04             	mov    0x4(%edx),%ecx
 cb5:	39 f1                	cmp    %esi,%ecx
 cb7:	73 4f                	jae    d08 <malloc+0xa8>
 cb9:	8b 3d 24 12 00 00    	mov    0x1224,%edi
 cbf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 cc1:	39 c7                	cmp    %eax,%edi
 cc3:	75 eb                	jne    cb0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 cc5:	83 ec 0c             	sub    $0xc,%esp
 cc8:	ff 75 e4             	pushl  -0x1c(%ebp)
 ccb:	e8 15 fc ff ff       	call   8e5 <sbrk>
  if(p == (char*)-1)
 cd0:	83 c4 10             	add    $0x10,%esp
 cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
 cd6:	74 1b                	je     cf3 <malloc+0x93>
  hp->s.size = nu;
 cd8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 cdb:	83 ec 0c             	sub    $0xc,%esp
 cde:	83 c0 08             	add    $0x8,%eax
 ce1:	50                   	push   %eax
 ce2:	e8 e9 fe ff ff       	call   bd0 <free>
  return freep;
 ce7:	a1 24 12 00 00       	mov    0x1224,%eax
      if((p = morecore(nunits)) == 0)
 cec:	83 c4 10             	add    $0x10,%esp
 cef:	85 c0                	test   %eax,%eax
 cf1:	75 bd                	jne    cb0 <malloc+0x50>
        return 0;
  }
}
 cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 cf6:	31 c0                	xor    %eax,%eax
}
 cf8:	5b                   	pop    %ebx
 cf9:	5e                   	pop    %esi
 cfa:	5f                   	pop    %edi
 cfb:	5d                   	pop    %ebp
 cfc:	c3                   	ret    
    if(p->s.size >= nunits){
 cfd:	89 c2                	mov    %eax,%edx
 cff:	89 f8                	mov    %edi,%eax
 d01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 d08:	39 ce                	cmp    %ecx,%esi
 d0a:	74 54                	je     d60 <malloc+0x100>
        p->s.size -= nunits;
 d0c:	29 f1                	sub    %esi,%ecx
 d0e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 d11:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 d14:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 d17:	a3 24 12 00 00       	mov    %eax,0x1224
}
 d1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 d1f:	8d 42 08             	lea    0x8(%edx),%eax
}
 d22:	5b                   	pop    %ebx
 d23:	5e                   	pop    %esi
 d24:	5f                   	pop    %edi
 d25:	5d                   	pop    %ebp
 d26:	c3                   	ret    
 d27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d2e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 d30:	c7 05 24 12 00 00 28 	movl   $0x1228,0x1224
 d37:	12 00 00 
    base.s.size = 0;
 d3a:	bf 28 12 00 00       	mov    $0x1228,%edi
    base.s.ptr = freep = prevp = &base;
 d3f:	c7 05 28 12 00 00 28 	movl   $0x1228,0x1228
 d46:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d49:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 d4b:	c7 05 2c 12 00 00 00 	movl   $0x0,0x122c
 d52:	00 00 00 
    if(p->s.size >= nunits){
 d55:	e9 36 ff ff ff       	jmp    c90 <malloc+0x30>
 d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 d60:	8b 0a                	mov    (%edx),%ecx
 d62:	89 08                	mov    %ecx,(%eax)
 d64:	eb b1                	jmp    d17 <malloc+0xb7>
