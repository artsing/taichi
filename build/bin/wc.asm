
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
  37:	e8 c1 08 00 00       	call   8fd <open>
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
  59:	e8 87 08 00 00       	call   8e5 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 52 08 00 00       	call   8bd <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 eb 0d 00 00       	push   $0xdeb
  73:	6a 01                	push   $0x1
  75:	e8 e6 09 00 00       	call   a60 <printf>
      exit();
  7a:	e8 3e 08 00 00       	call   8bd <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 dd 0d 00 00       	push   $0xddd
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 2b 08 00 00       	call   8bd <exit>
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
  d0:	68 c0 12 00 00       	push   $0x12c0
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 f8 07 00 00       	call   8d5 <read>
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
  fe:	0f be 87 c0 12 00 00 	movsbl 0x12c0(%edi),%eax
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
 112:	68 c8 0d 00 00       	push   $0xdc8
 117:	e8 b4 01 00 00       	call   2d0 <strchr>
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
 157:	68 de 0d 00 00       	push   $0xdde
 15c:	6a 01                	push   $0x1
 15e:	e8 fd 08 00 00       	call   a60 <printf>
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
 170:	68 ce 0d 00 00       	push   $0xdce
 175:	6a 01                	push   $0x1
 177:	e8 e4 08 00 00       	call   a60 <printf>
    exit();
 17c:	e8 3c 07 00 00       	call   8bd <exit>
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

000001c0 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	8b 7d 10             	mov    0x10(%ebp),%edi
 1cb:	56                   	push   %esi
 1cc:	8b 75 08             	mov    0x8(%ebp),%esi
 1cf:	53                   	push   %ebx
 1d0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 1d3:	85 ff                	test   %edi,%edi
 1d5:	74 39                	je     210 <strcat_s+0x50>
 1d7:	31 c0                	xor    %eax,%eax
 1d9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 1de:	eb 11                	jmp    1f1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 1e0:	0f b6 12             	movzbl (%edx),%edx
 1e3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 1e6:	84 d2                	test   %dl,%dl
 1e8:	74 26                	je     210 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 1ea:	83 c0 01             	add    $0x1,%eax
 1ed:	39 c7                	cmp    %eax,%edi
 1ef:	74 1f                	je     210 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 1f1:	89 c2                	mov    %eax,%edx
 1f3:	29 ca                	sub    %ecx,%edx
 1f5:	01 da                	add    %ebx,%edx
 1f7:	83 f9 ff             	cmp    $0xffffffff,%ecx
 1fa:	75 e4                	jne    1e0 <strcat_s+0x20>
 1fc:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 200:	75 e8                	jne    1ea <strcat_s+0x2a>
 202:	89 da                	mov    %ebx,%edx
 204:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 206:	0f b6 12             	movzbl (%edx),%edx
 209:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 20c:	84 d2                	test   %dl,%dl
 20e:	75 da                	jne    1ea <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 210:	5b                   	pop    %ebx
 211:	89 f0                	mov    %esi,%eax
 213:	5e                   	pop    %esi
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
 22b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 22e:	0f b6 01             	movzbl (%ecx),%eax
 231:	0f b6 1a             	movzbl (%edx),%ebx
 234:	84 c0                	test   %al,%al
 236:	75 19                	jne    251 <strcmp+0x31>
 238:	eb 26                	jmp    260 <strcmp+0x40>
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 240:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 244:	83 c1 01             	add    $0x1,%ecx
 247:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 24a:	0f b6 1a             	movzbl (%edx),%ebx
 24d:	84 c0                	test   %al,%al
 24f:	74 0f                	je     260 <strcmp+0x40>
 251:	38 d8                	cmp    %bl,%al
 253:	74 eb                	je     240 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 255:	29 d8                	sub    %ebx,%eax
}
 257:	5b                   	pop    %ebx
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 260:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 262:	29 d8                	sub    %ebx,%eax
}
 264:	5b                   	pop    %ebx
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 27a:	80 3a 00             	cmpb   $0x0,(%edx)
 27d:	74 21                	je     2a0 <strlen+0x30>
 27f:	31 c0                	xor    %eax,%eax
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 288:	83 c0 01             	add    $0x1,%eax
 28b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 28f:	89 c1                	mov    %eax,%ecx
 291:	75 f5                	jne    288 <strlen+0x18>
    ;
  return n;
}
 293:	89 c8                	mov    %ecx,%eax
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 2a0:	31 c9                	xor    %ecx,%ecx
}
 2a2:	5d                   	pop    %ebp
 2a3:	89 c8                	mov    %ecx,%eax
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 d7                	mov    %edx,%edi
 2c3:	fc                   	cld    
 2c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2de:	0f b6 10             	movzbl (%eax),%edx
 2e1:	84 d2                	test   %dl,%dl
 2e3:	75 16                	jne    2fb <strchr+0x2b>
 2e5:	eb 21                	jmp    308 <strchr+0x38>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
 2f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	84 d2                	test   %dl,%dl
 2f9:	74 0d                	je     308 <strchr+0x38>
    if(*s == c)
 2fb:	38 d1                	cmp    %dl,%cl
 2fd:	75 f1                	jne    2f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 308:	31 c0                	xor    %eax,%eax
}
 30a:	5d                   	pop    %ebp
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <gets>:

char*
gets(char *buf, int max)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	57                   	push   %edi
 318:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 319:	31 f6                	xor    %esi,%esi
{
 31b:	53                   	push   %ebx
 31c:	89 f3                	mov    %esi,%ebx
 31e:	83 ec 1c             	sub    $0x1c,%esp
 321:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 324:	eb 33                	jmp    359 <gets+0x49>
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	8d 45 e7             	lea    -0x19(%ebp),%eax
 336:	6a 01                	push   $0x1
 338:	50                   	push   %eax
 339:	6a 00                	push   $0x0
 33b:	e8 95 05 00 00       	call   8d5 <read>
    if(cc < 1)
 340:	83 c4 10             	add    $0x10,%esp
 343:	85 c0                	test   %eax,%eax
 345:	7e 1c                	jle    363 <gets+0x53>
      break;
    buf[i++] = c;
 347:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 34b:	83 c7 01             	add    $0x1,%edi
 34e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 351:	3c 0a                	cmp    $0xa,%al
 353:	74 23                	je     378 <gets+0x68>
 355:	3c 0d                	cmp    $0xd,%al
 357:	74 1f                	je     378 <gets+0x68>
  for(i=0; i+1 < max; ){
 359:	83 c3 01             	add    $0x1,%ebx
 35c:	89 fe                	mov    %edi,%esi
 35e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 361:	7c cd                	jl     330 <gets+0x20>
 363:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 365:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 368:	c6 03 00             	movb   $0x0,(%ebx)
}
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 377:	90                   	nop
 378:	8b 75 08             	mov    0x8(%ebp),%esi
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	01 de                	add    %ebx,%esi
 380:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 382:	c6 03 00             	movb   $0x0,(%ebx)
}
 385:	8d 65 f4             	lea    -0xc(%ebp),%esp
 388:	5b                   	pop    %ebx
 389:	5e                   	pop    %esi
 38a:	5f                   	pop    %edi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi

00000390 <stat>:

int
stat(const char *n, struct stat *st)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	56                   	push   %esi
 398:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	6a 00                	push   $0x0
 39e:	ff 75 08             	pushl  0x8(%ebp)
 3a1:	e8 57 05 00 00       	call   8fd <open>
  if(fd < 0)
 3a6:	83 c4 10             	add    $0x10,%esp
 3a9:	85 c0                	test   %eax,%eax
 3ab:	78 2b                	js     3d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	pushl  0xc(%ebp)
 3b3:	89 c3                	mov    %eax,%ebx
 3b5:	50                   	push   %eax
 3b6:	e8 5a 05 00 00       	call   915 <fstat>
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3be:	89 c6                	mov    %eax,%esi
  close(fd);
 3c0:	e8 20 05 00 00       	call   8e5 <close>
  return r;
 3c5:	83 c4 10             	add    $0x10,%esp
}
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	5b                   	pop    %ebx
 3ce:	5e                   	pop    %esi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3dd:	eb e9                	jmp    3c8 <stat+0x38>
 3df:	90                   	nop

000003e0 <atoi>:

int
atoi(const char *s)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	53                   	push   %ebx
 3e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3eb:	0f be 02             	movsbl (%edx),%eax
 3ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3f9:	77 1a                	ja     415 <atoi+0x35>
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
    n = n*10 + *s++ - '0';
 400:	83 c2 01             	add    $0x1,%edx
 403:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 406:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 40a:	0f be 02             	movsbl (%edx),%eax
 40d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
  return n;
}
 415:	89 c8                	mov    %ecx,%eax
 417:	5b                   	pop    %ebx
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	57                   	push   %edi
 428:	8b 45 10             	mov    0x10(%ebp),%eax
 42b:	8b 55 08             	mov    0x8(%ebp),%edx
 42e:	56                   	push   %esi
 42f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 432:	85 c0                	test   %eax,%eax
 434:	7e 0f                	jle    445 <memmove+0x25>
 436:	01 d0                	add    %edx,%eax
  dst = vdst;
 438:	89 d7                	mov    %edx,%edi
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 440:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 441:	39 f8                	cmp    %edi,%eax
 443:	75 fb                	jne    440 <memmove+0x20>
  return vdst;
}
 445:	5e                   	pop    %esi
 446:	89 d0                	mov    %edx,%eax
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	57                   	push   %edi
 458:	56                   	push   %esi
 459:	53                   	push   %ebx
 45a:	83 ec 34             	sub    $0x34,%esp
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 460:	68 00 0e 00 00       	push   $0xe00
hexdump (void *data, size_t size) {
 465:	89 45 e0             	mov    %eax,-0x20(%ebp)
 468:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 46b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 46d:	89 c7                	mov    %eax,%edi
 46f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 472:	e8 e9 05 00 00       	call   a60 <printf>
  for (offset = 0; offset < size; offset += 16) {
 477:	83 c4 10             	add    $0x10,%esp
 47a:	85 ff                	test   %edi,%edi
 47c:	0f 84 2d 01 00 00    	je     5af <hexdump+0x15f>
 482:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 485:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 48c:	be 10 00 00 00       	mov    $0x10,%esi
 491:	83 e8 01             	sub    $0x1,%eax
 494:	83 e0 f0             	and    $0xfffffff0,%eax
 497:	83 c0 10             	add    $0x10,%eax
 49a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 49d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 4a0:	83 ec 08             	sub    $0x8,%esp
 4a3:	68 54 0e 00 00       	push   $0xe54
 4a8:	6a 01                	push   $0x1
 4aa:	e8 b1 05 00 00       	call   a60 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 4b9:	0f 8e 51 01 00 00    	jle    610 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 4bf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4c2:	83 ec 04             	sub    $0x4,%esp
 4c5:	57                   	push   %edi
 4c6:	89 fb                	mov    %edi,%ebx
 4c8:	68 51 0e 00 00       	push   $0xe51
 4cd:	6a 01                	push   $0x1
 4cf:	e8 8c 05 00 00       	call   a60 <printf>
 4d4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 4d7:	83 c4 10             	add    $0x10,%esp
 4da:	8b 7d e0             	mov    -0x20(%ebp),%edi
 4dd:	eb 28                	jmp    507 <hexdump+0xb7>
 4df:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4e0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4e4:	80 fa 0f             	cmp    $0xf,%dl
 4e7:	0f 86 e3 00 00 00    	jbe    5d0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 4ed:	83 ec 04             	sub    $0x4,%esp
 4f0:	83 c3 01             	add    $0x1,%ebx
 4f3:	52                   	push   %edx
 4f4:	68 57 0e 00 00       	push   $0xe57
 4f9:	6a 01                	push   $0x1
 4fb:	e8 60 05 00 00       	call   a60 <printf>
 500:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 503:	39 f3                	cmp    %esi,%ebx
 505:	74 1e                	je     525 <hexdump+0xd5>
      if(offset + index < (int)size) {
 507:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 50a:	7f d4                	jg     4e0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 50c:	83 ec 08             	sub    $0x8,%esp
 50f:	83 c3 01             	add    $0x1,%ebx
 512:	68 5b 0e 00 00       	push   $0xe5b
 517:	6a 01                	push   $0x1
 519:	e8 42 05 00 00       	call   a60 <printf>
 51e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 521:	39 f3                	cmp    %esi,%ebx
 523:	75 e2                	jne    507 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 525:	83 ec 08             	sub    $0x8,%esp
 528:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 52b:	68 54 0e 00 00       	push   $0xe54
 530:	6a 01                	push   $0x1
 532:	e8 29 05 00 00       	call   a60 <printf>
 537:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 53a:	83 c4 10             	add    $0x10,%esp
 53d:	eb 1b                	jmp    55a <hexdump+0x10a>
 53f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	52                   	push   %edx
 544:	68 5f 0e 00 00       	push   $0xe5f
 549:	6a 01                	push   $0x1
 54b:	e8 10 05 00 00       	call   a60 <printf>
 550:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 553:	83 c3 01             	add    $0x1,%ebx
 556:	39 de                	cmp    %ebx,%esi
 558:	74 30                	je     58a <hexdump+0x13a>
      if(offset + index < (int)size) {
 55a:	39 df                	cmp    %ebx,%edi
 55c:	0f 8e 8e 00 00 00    	jle    5f0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 562:	8b 45 e0             	mov    -0x20(%ebp),%eax
 565:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 569:	8d 4a e0             	lea    -0x20(%edx),%ecx
 56c:	80 f9 5e             	cmp    $0x5e,%cl
 56f:	76 cf                	jbe    540 <hexdump+0xf0>
        } else {
          printf(1, ".");
 571:	83 ec 08             	sub    $0x8,%esp
 574:	83 c3 01             	add    $0x1,%ebx
 577:	68 62 0e 00 00       	push   $0xe62
 57c:	6a 01                	push   $0x1
 57e:	e8 dd 04 00 00       	call   a60 <printf>
 583:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 586:	39 de                	cmp    %ebx,%esi
 588:	75 d0                	jne    55a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 58a:	83 ec 08             	sub    $0x8,%esp
 58d:	83 c6 10             	add    $0x10,%esi
 590:	68 64 0e 00 00       	push   $0xe64
 595:	6a 01                	push   $0x1
 597:	e8 c4 04 00 00       	call   a60 <printf>
  for (offset = 0; offset < size; offset += 16) {
 59c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 5a0:	83 c4 10             	add    $0x10,%esp
 5a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 5a6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 5a9:	0f 85 f1 fe ff ff    	jne    4a0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5af:	c7 45 0c 00 0e 00 00 	movl   $0xe00,0xc(%ebp)
 5b6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 5bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c0:	5b                   	pop    %ebx
 5c1:	5e                   	pop    %esi
 5c2:	5f                   	pop    %edi
 5c3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5c4:	e9 97 04 00 00       	jmp    a60 <printf>
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 5d0:	83 ec 08             	sub    $0x8,%esp
 5d3:	68 4f 0e 00 00       	push   $0xe4f
 5d8:	6a 01                	push   $0x1
 5da:	e8 81 04 00 00       	call   a60 <printf>
 5df:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 5e3:	83 c4 10             	add    $0x10,%esp
 5e6:	e9 02 ff ff ff       	jmp    4ed <hexdump+0x9d>
 5eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop
        printf(1, " ");
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	68 5d 0e 00 00       	push   $0xe5d
 5f8:	6a 01                	push   $0x1
 5fa:	e8 61 04 00 00       	call   a60 <printf>
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	e9 4c ff ff ff       	jmp    553 <hexdump+0x103>
 607:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 610:	83 ec 08             	sub    $0x8,%esp
 613:	68 4f 0e 00 00       	push   $0xe4f
 618:	6a 01                	push   $0x1
 61a:	e8 41 04 00 00       	call   a60 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 61f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 622:	83 c4 10             	add    $0x10,%esp
 625:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 62b:	0f 8f 8e fe ff ff    	jg     4bf <hexdump+0x6f>
 631:	83 ec 08             	sub    $0x8,%esp
 634:	68 4f 0e 00 00       	push   $0xe4f
 639:	6a 01                	push   $0x1
 63b:	e8 20 04 00 00       	call   a60 <printf>
    if (offset <= 0x000f) printf(1, "0");
 640:	83 c4 10             	add    $0x10,%esp
 643:	83 ff 0f             	cmp    $0xf,%edi
 646:	0f 8f 73 fe ff ff    	jg     4bf <hexdump+0x6f>
 64c:	83 ec 08             	sub    $0x8,%esp
 64f:	68 4f 0e 00 00       	push   $0xe4f
 654:	6a 01                	push   $0x1
 656:	e8 05 04 00 00       	call   a60 <printf>
 65b:	83 c4 10             	add    $0x10,%esp
 65e:	e9 5c fe ff ff       	jmp    4bf <hexdump+0x6f>
 663:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000670 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
    if (!endian)
 675:	a1 a0 12 00 00       	mov    0x12a0,%eax
{
 67a:	89 e5                	mov    %esp,%ebp
 67c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 67f:	85 c0                	test   %eax,%eax
 681:	75 1d                	jne    6a0 <hton16+0x30>
        endian = byteorder();
 683:	c7 05 a0 12 00 00 d2 	movl   $0x4d2,0x12a0
 68a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 68d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 68f:	5d                   	pop    %ebp
 690:	66 c1 c2 08          	rol    $0x8,%dx
 694:	89 d0                	mov    %edx,%eax
 696:	c3                   	ret    
 697:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69e:	66 90                	xchg   %ax,%ax
 6a0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 6a2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 6a7:	74 e4                	je     68d <hton16+0x1d>
}
 6a9:	89 d0                	mov    %edx,%eax
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret    
 6ad:	8d 76 00             	lea    0x0(%esi),%esi

000006b0 <ntoh16>:
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	eb ba                	jmp    670 <hton16>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi

000006c0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 6c0:	f3 0f 1e fb          	endbr32 
 6c4:	55                   	push   %ebp
    if (!endian)
 6c5:	8b 15 a0 12 00 00    	mov    0x12a0,%edx
{
 6cb:	89 e5                	mov    %esp,%ebp
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 6d0:	85 d2                	test   %edx,%edx
 6d2:	75 14                	jne    6e8 <hton32+0x28>
        endian = byteorder();
 6d4:	c7 05 a0 12 00 00 d2 	movl   $0x4d2,0x12a0
 6db:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 6de:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 6e0:	5d                   	pop    %ebp
 6e1:	c3                   	ret    
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 6e8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 6ee:	74 ee                	je     6de <hton32+0x1e>
}
 6f0:	5d                   	pop    %ebp
 6f1:	c3                   	ret    
 6f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000700 <ntoh32>:
 700:	f3 0f 1e fb          	endbr32 
 704:	eb ba                	jmp    6c0 <hton32>
 706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70d:	8d 76 00             	lea    0x0(%esi),%esi

00000710 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 710:	f3 0f 1e fb          	endbr32 
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	57                   	push   %edi
 718:	8b 4d 08             	mov    0x8(%ebp),%ecx
 71b:	56                   	push   %esi
 71c:	53                   	push   %ebx
 71d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 720:	0f b6 01             	movzbl (%ecx),%eax
 723:	3c 09                	cmp    $0x9,%al
 725:	74 09                	je     730 <strtol+0x20>
 727:	3c 20                	cmp    $0x20,%al
 729:	75 14                	jne    73f <strtol+0x2f>
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
 730:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 734:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 737:	3c 20                	cmp    $0x20,%al
 739:	74 f5                	je     730 <strtol+0x20>
 73b:	3c 09                	cmp    $0x9,%al
 73d:	74 f1                	je     730 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 73f:	3c 2b                	cmp    $0x2b,%al
 741:	0f 84 a9 00 00 00    	je     7f0 <strtol+0xe0>
    int neg = 0;
 747:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 749:	3c 2d                	cmp    $0x2d,%al
 74b:	0f 84 8f 00 00 00    	je     7e0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 751:	0f be 11             	movsbl (%ecx),%edx
 754:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 75a:	75 12                	jne    76e <strtol+0x5e>
 75c:	80 fa 30             	cmp    $0x30,%dl
 75f:	0f 84 9b 00 00 00    	je     800 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 765:	85 db                	test   %ebx,%ebx
 767:	75 05                	jne    76e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 769:	bb 0a 00 00 00       	mov    $0xa,%ebx
 76e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 771:	31 c0                	xor    %eax,%eax
 773:	eb 17                	jmp    78c <strtol+0x7c>
 775:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 778:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 77b:	3b 55 10             	cmp    0x10(%ebp),%edx
 77e:	7d 28                	jge    7a8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 780:	0f af 45 10          	imul   0x10(%ebp),%eax
 784:	83 c1 01             	add    $0x1,%ecx
 787:	01 d0                	add    %edx,%eax
    while (1) {
 789:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 78c:	8d 72 d0             	lea    -0x30(%edx),%esi
 78f:	89 f3                	mov    %esi,%ebx
 791:	80 fb 09             	cmp    $0x9,%bl
 794:	76 e2                	jbe    778 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 796:	8d 72 9f             	lea    -0x61(%edx),%esi
 799:	89 f3                	mov    %esi,%ebx
 79b:	80 fb 19             	cmp    $0x19,%bl
 79e:	77 28                	ja     7c8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 7a0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 7a3:	3b 55 10             	cmp    0x10(%ebp),%edx
 7a6:	7c d8                	jl     780 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 7a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 7ab:	85 d2                	test   %edx,%edx
 7ad:	74 05                	je     7b4 <strtol+0xa4>
        *endptr = (char *) s;
 7af:	8b 75 0c             	mov    0xc(%ebp),%esi
 7b2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 7b4:	89 c2                	mov    %eax,%edx
}
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
    return (neg ? -val : val);
 7b8:	f7 da                	neg    %edx
 7ba:	85 ff                	test   %edi,%edi
}
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 7be:	0f 45 c2             	cmovne %edx,%eax
}
 7c1:	c3                   	ret    
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 7c8:	8d 72 bf             	lea    -0x41(%edx),%esi
 7cb:	89 f3                	mov    %esi,%ebx
 7cd:	80 fb 19             	cmp    $0x19,%bl
 7d0:	77 d6                	ja     7a8 <strtol+0x98>
            dig = *s - 'A' + 10;
 7d2:	83 ea 37             	sub    $0x37,%edx
 7d5:	eb a4                	jmp    77b <strtol+0x6b>
 7d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7de:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 7e0:	83 c1 01             	add    $0x1,%ecx
 7e3:	bf 01 00 00 00       	mov    $0x1,%edi
 7e8:	e9 64 ff ff ff       	jmp    751 <strtol+0x41>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 7f0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 7f3:	31 ff                	xor    %edi,%edi
 7f5:	e9 57 ff ff ff       	jmp    751 <strtol+0x41>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 800:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 804:	3c 78                	cmp    $0x78,%al
 806:	74 18                	je     820 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 808:	85 db                	test   %ebx,%ebx
 80a:	0f 85 5e ff ff ff    	jne    76e <strtol+0x5e>
        s++, base = 8;
 810:	83 c1 01             	add    $0x1,%ecx
 813:	0f be d0             	movsbl %al,%edx
 816:	bb 08 00 00 00       	mov    $0x8,%ebx
 81b:	e9 4e ff ff ff       	jmp    76e <strtol+0x5e>
        s += 2, base = 16;
 820:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 824:	bb 10 00 00 00       	mov    $0x10,%ebx
 829:	83 c1 02             	add    $0x2,%ecx
 82c:	e9 3d ff ff ff       	jmp    76e <strtol+0x5e>
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop

00000840 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 840:	f3 0f 1e fb          	endbr32 
 844:	55                   	push   %ebp
 845:	89 e5                	mov    %esp,%ebp
 847:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 848:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 84a:	56                   	push   %esi
 84b:	53                   	push   %ebx
 84c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 84f:	83 ec 1c             	sub    $0x1c,%esp
 852:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 855:	83 ec 04             	sub    $0x4,%esp
 858:	6a 0a                	push   $0xa
 85a:	53                   	push   %ebx
 85b:	56                   	push   %esi
 85c:	e8 af fe ff ff       	call   710 <strtol>
        if (ret < 0 || ret > 255) {
 861:	83 c4 10             	add    $0x10,%esp
 864:	3d ff 00 00 00       	cmp    $0xff,%eax
 869:	77 3d                	ja     8a8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 86b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 86e:	39 f1                	cmp    %esi,%ecx
 870:	74 36                	je     8a8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 872:	0f b6 11             	movzbl (%ecx),%edx
 875:	83 ff 03             	cmp    $0x3,%edi
 878:	74 16                	je     890 <ip_addr_pton+0x50>
 87a:	80 fa 2e             	cmp    $0x2e,%dl
 87d:	75 29                	jne    8a8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 87f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 882:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 885:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 888:	83 c7 01             	add    $0x1,%edi
 88b:	eb c8                	jmp    855 <ip_addr_pton+0x15>
 88d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 890:	84 d2                	test   %dl,%dl
 892:	75 14                	jne    8a8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 894:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 897:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 89a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 89d:	31 c0                	xor    %eax,%eax
}
 89f:	5b                   	pop    %ebx
 8a0:	5e                   	pop    %esi
 8a1:	5f                   	pop    %edi
 8a2:	5d                   	pop    %ebp
 8a3:	c3                   	ret    
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 8ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 8b0:	5b                   	pop    %ebx
 8b1:	5e                   	pop    %esi
 8b2:	5f                   	pop    %edi
 8b3:	5d                   	pop    %ebp
 8b4:	c3                   	ret    

000008b5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 8b5:	b8 01 00 00 00       	mov    $0x1,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <exit>:
SYSCALL(exit)
 8bd:	b8 02 00 00 00       	mov    $0x2,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <wait>:
SYSCALL(wait)
 8c5:	b8 03 00 00 00       	mov    $0x3,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <pipe>:
SYSCALL(pipe)
 8cd:	b8 04 00 00 00       	mov    $0x4,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <read>:
SYSCALL(read)
 8d5:	b8 05 00 00 00       	mov    $0x5,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <write>:
SYSCALL(write)
 8dd:	b8 10 00 00 00       	mov    $0x10,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <close>:
SYSCALL(close)
 8e5:	b8 15 00 00 00       	mov    $0x15,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <kill>:
SYSCALL(kill)
 8ed:	b8 06 00 00 00       	mov    $0x6,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <exec>:
SYSCALL(exec)
 8f5:	b8 07 00 00 00       	mov    $0x7,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <open>:
SYSCALL(open)
 8fd:	b8 0f 00 00 00       	mov    $0xf,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <mknod>:
SYSCALL(mknod)
 905:	b8 11 00 00 00       	mov    $0x11,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <unlink>:
SYSCALL(unlink)
 90d:	b8 12 00 00 00       	mov    $0x12,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <fstat>:
SYSCALL(fstat)
 915:	b8 08 00 00 00       	mov    $0x8,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <link>:
SYSCALL(link)
 91d:	b8 13 00 00 00       	mov    $0x13,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <mkdir>:
SYSCALL(mkdir)
 925:	b8 14 00 00 00       	mov    $0x14,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <chdir>:
SYSCALL(chdir)
 92d:	b8 09 00 00 00       	mov    $0x9,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <dup>:
SYSCALL(dup)
 935:	b8 0a 00 00 00       	mov    $0xa,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <getpid>:
SYSCALL(getpid)
 93d:	b8 0b 00 00 00       	mov    $0xb,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <sbrk>:
SYSCALL(sbrk)
 945:	b8 0c 00 00 00       	mov    $0xc,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <sleep>:
SYSCALL(sleep)
 94d:	b8 0d 00 00 00       	mov    $0xd,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <uptime>:
SYSCALL(uptime)
 955:	b8 0e 00 00 00       	mov    $0xe,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <ioctl>:
# iotcl
SYSCALL(ioctl)
 95d:	b8 16 00 00 00       	mov    $0x16,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    

00000965 <socket>:
# socket
SYSCALL(socket)
 965:	b8 17 00 00 00       	mov    $0x17,%eax
 96a:	cd 40                	int    $0x40
 96c:	c3                   	ret    

0000096d <bind>:
SYSCALL(bind)
 96d:	b8 19 00 00 00       	mov    $0x19,%eax
 972:	cd 40                	int    $0x40
 974:	c3                   	ret    

00000975 <listen>:
SYSCALL(listen)
 975:	b8 1a 00 00 00       	mov    $0x1a,%eax
 97a:	cd 40                	int    $0x40
 97c:	c3                   	ret    

0000097d <accept>:
SYSCALL(accept)
 97d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 982:	cd 40                	int    $0x40
 984:	c3                   	ret    

00000985 <recv>:
SYSCALL(recv)
 985:	b8 1c 00 00 00       	mov    $0x1c,%eax
 98a:	cd 40                	int    $0x40
 98c:	c3                   	ret    

0000098d <send>:
SYSCALL(send)
 98d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 992:	cd 40                	int    $0x40
 994:	c3                   	ret    

00000995 <recvfrom>:
SYSCALL(recvfrom)
 995:	b8 1e 00 00 00       	mov    $0x1e,%eax
 99a:	cd 40                	int    $0x40
 99c:	c3                   	ret    

0000099d <sendto>:
SYSCALL(sendto)
 99d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 9a2:	cd 40                	int    $0x40
 9a4:	c3                   	ret    
 9a5:	66 90                	xchg   %ax,%ax
 9a7:	66 90                	xchg   %ax,%ax
 9a9:	66 90                	xchg   %ax,%ax
 9ab:	66 90                	xchg   %ax,%ax
 9ad:	66 90                	xchg   %ax,%ax
 9af:	90                   	nop

000009b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	57                   	push   %edi
 9b4:	56                   	push   %esi
 9b5:	53                   	push   %ebx
 9b6:	83 ec 3c             	sub    $0x3c,%esp
 9b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 9bc:	89 d1                	mov    %edx,%ecx
{
 9be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 9c1:	85 d2                	test   %edx,%edx
 9c3:	0f 89 7f 00 00 00    	jns    a48 <printint+0x98>
 9c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 9cd:	74 79                	je     a48 <printint+0x98>
    neg = 1;
 9cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 9d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 9d8:	31 db                	xor    %ebx,%ebx
 9da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 9e0:	89 c8                	mov    %ecx,%eax
 9e2:	31 d2                	xor    %edx,%edx
 9e4:	89 cf                	mov    %ecx,%edi
 9e6:	f7 75 c4             	divl   -0x3c(%ebp)
 9e9:	0f b6 92 70 0e 00 00 	movzbl 0xe70(%edx),%edx
 9f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 9f3:	89 d8                	mov    %ebx,%eax
 9f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 9f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 9fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 9fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 a01:	76 dd                	jbe    9e0 <printint+0x30>
  if(neg)
 a03:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 a06:	85 c9                	test   %ecx,%ecx
 a08:	74 0c                	je     a16 <printint+0x66>
    buf[i++] = '-';
 a0a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 a0f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 a11:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 a16:	8b 7d b8             	mov    -0x48(%ebp),%edi
 a19:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 a1d:	eb 07                	jmp    a26 <printint+0x76>
 a1f:	90                   	nop
 a20:	0f b6 13             	movzbl (%ebx),%edx
 a23:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 a26:	83 ec 04             	sub    $0x4,%esp
 a29:	88 55 d7             	mov    %dl,-0x29(%ebp)
 a2c:	6a 01                	push   $0x1
 a2e:	56                   	push   %esi
 a2f:	57                   	push   %edi
 a30:	e8 a8 fe ff ff       	call   8dd <write>
  while(--i >= 0)
 a35:	83 c4 10             	add    $0x10,%esp
 a38:	39 de                	cmp    %ebx,%esi
 a3a:	75 e4                	jne    a20 <printint+0x70>
    putc(fd, buf[i]);
}
 a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a3f:	5b                   	pop    %ebx
 a40:	5e                   	pop    %esi
 a41:	5f                   	pop    %edi
 a42:	5d                   	pop    %ebp
 a43:	c3                   	ret    
 a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 a48:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 a4f:	eb 87                	jmp    9d8 <printint+0x28>
 a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5f:	90                   	nop

00000a60 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 a60:	f3 0f 1e fb          	endbr32 
 a64:	55                   	push   %ebp
 a65:	89 e5                	mov    %esp,%ebp
 a67:	57                   	push   %edi
 a68:	56                   	push   %esi
 a69:	53                   	push   %ebx
 a6a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a6d:	8b 75 0c             	mov    0xc(%ebp),%esi
 a70:	0f b6 1e             	movzbl (%esi),%ebx
 a73:	84 db                	test   %bl,%bl
 a75:	0f 84 b4 00 00 00    	je     b2f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 a7b:	8d 45 10             	lea    0x10(%ebp),%eax
 a7e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 a81:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 a84:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 a86:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a89:	eb 33                	jmp    abe <printf+0x5e>
 a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
 a90:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a93:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 a98:	83 f8 25             	cmp    $0x25,%eax
 a9b:	74 17                	je     ab4 <printf+0x54>
  write(fd, &c, 1);
 a9d:	83 ec 04             	sub    $0x4,%esp
 aa0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 aa3:	6a 01                	push   $0x1
 aa5:	57                   	push   %edi
 aa6:	ff 75 08             	pushl  0x8(%ebp)
 aa9:	e8 2f fe ff ff       	call   8dd <write>
 aae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 ab1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 ab4:	0f b6 1e             	movzbl (%esi),%ebx
 ab7:	83 c6 01             	add    $0x1,%esi
 aba:	84 db                	test   %bl,%bl
 abc:	74 71                	je     b2f <printf+0xcf>
    c = fmt[i] & 0xff;
 abe:	0f be cb             	movsbl %bl,%ecx
 ac1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 ac4:	85 d2                	test   %edx,%edx
 ac6:	74 c8                	je     a90 <printf+0x30>
      }
    } else if(state == '%'){
 ac8:	83 fa 25             	cmp    $0x25,%edx
 acb:	75 e7                	jne    ab4 <printf+0x54>
      if(c == 'd'){
 acd:	83 f8 64             	cmp    $0x64,%eax
 ad0:	0f 84 9a 00 00 00    	je     b70 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 ad6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 adc:	83 f9 70             	cmp    $0x70,%ecx
 adf:	74 5f                	je     b40 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 ae1:	83 f8 73             	cmp    $0x73,%eax
 ae4:	0f 84 d6 00 00 00    	je     bc0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 aea:	83 f8 63             	cmp    $0x63,%eax
 aed:	0f 84 8d 00 00 00    	je     b80 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 af3:	83 f8 25             	cmp    $0x25,%eax
 af6:	0f 84 b4 00 00 00    	je     bb0 <printf+0x150>
  write(fd, &c, 1);
 afc:	83 ec 04             	sub    $0x4,%esp
 aff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 b03:	6a 01                	push   $0x1
 b05:	57                   	push   %edi
 b06:	ff 75 08             	pushl  0x8(%ebp)
 b09:	e8 cf fd ff ff       	call   8dd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 b0e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b11:	83 c4 0c             	add    $0xc,%esp
 b14:	6a 01                	push   $0x1
 b16:	83 c6 01             	add    $0x1,%esi
 b19:	57                   	push   %edi
 b1a:	ff 75 08             	pushl  0x8(%ebp)
 b1d:	e8 bb fd ff ff       	call   8dd <write>
  for(i = 0; fmt[i]; i++){
 b22:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 b26:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 b29:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 b2b:	84 db                	test   %bl,%bl
 b2d:	75 8f                	jne    abe <printf+0x5e>
    }
  }
}
 b2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b32:	5b                   	pop    %ebx
 b33:	5e                   	pop    %esi
 b34:	5f                   	pop    %edi
 b35:	5d                   	pop    %ebp
 b36:	c3                   	ret    
 b37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b3e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 b40:	83 ec 0c             	sub    $0xc,%esp
 b43:	b9 10 00 00 00       	mov    $0x10,%ecx
 b48:	6a 00                	push   $0x0
 b4a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 b4d:	8b 45 08             	mov    0x8(%ebp),%eax
 b50:	8b 13                	mov    (%ebx),%edx
 b52:	e8 59 fe ff ff       	call   9b0 <printint>
        ap++;
 b57:	89 d8                	mov    %ebx,%eax
 b59:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b5c:	31 d2                	xor    %edx,%edx
        ap++;
 b5e:	83 c0 04             	add    $0x4,%eax
 b61:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b64:	e9 4b ff ff ff       	jmp    ab4 <printf+0x54>
 b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 b70:	83 ec 0c             	sub    $0xc,%esp
 b73:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b78:	6a 01                	push   $0x1
 b7a:	eb ce                	jmp    b4a <printf+0xea>
 b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 b80:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b83:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b86:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 b88:	6a 01                	push   $0x1
        ap++;
 b8a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 b8d:	57                   	push   %edi
 b8e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 b91:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b94:	e8 44 fd ff ff       	call   8dd <write>
        ap++;
 b99:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b9c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b9f:	31 d2                	xor    %edx,%edx
 ba1:	e9 0e ff ff ff       	jmp    ab4 <printf+0x54>
 ba6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 bb0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 bb3:	83 ec 04             	sub    $0x4,%esp
 bb6:	e9 59 ff ff ff       	jmp    b14 <printf+0xb4>
 bbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bbf:	90                   	nop
        s = (char*)*ap;
 bc0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 bc3:	8b 18                	mov    (%eax),%ebx
        ap++;
 bc5:	83 c0 04             	add    $0x4,%eax
 bc8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 bcb:	85 db                	test   %ebx,%ebx
 bcd:	74 17                	je     be6 <printf+0x186>
        while(*s != 0){
 bcf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 bd2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 bd4:	84 c0                	test   %al,%al
 bd6:	0f 84 d8 fe ff ff    	je     ab4 <printf+0x54>
 bdc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 bdf:	89 de                	mov    %ebx,%esi
 be1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 be4:	eb 1a                	jmp    c00 <printf+0x1a0>
          s = "(null)";
 be6:	bb 68 0e 00 00       	mov    $0xe68,%ebx
        while(*s != 0){
 beb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 bee:	b8 28 00 00 00       	mov    $0x28,%eax
 bf3:	89 de                	mov    %ebx,%esi
 bf5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bf8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bff:	90                   	nop
  write(fd, &c, 1);
 c00:	83 ec 04             	sub    $0x4,%esp
          s++;
 c03:	83 c6 01             	add    $0x1,%esi
 c06:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 c09:	6a 01                	push   $0x1
 c0b:	57                   	push   %edi
 c0c:	53                   	push   %ebx
 c0d:	e8 cb fc ff ff       	call   8dd <write>
        while(*s != 0){
 c12:	0f b6 06             	movzbl (%esi),%eax
 c15:	83 c4 10             	add    $0x10,%esp
 c18:	84 c0                	test   %al,%al
 c1a:	75 e4                	jne    c00 <printf+0x1a0>
 c1c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 c1f:	31 d2                	xor    %edx,%edx
 c21:	e9 8e fe ff ff       	jmp    ab4 <printf+0x54>
 c26:	66 90                	xchg   %ax,%ax
 c28:	66 90                	xchg   %ax,%ax
 c2a:	66 90                	xchg   %ax,%ax
 c2c:	66 90                	xchg   %ax,%ax
 c2e:	66 90                	xchg   %ax,%ax

00000c30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c30:	f3 0f 1e fb          	endbr32 
 c34:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c35:	a1 a4 12 00 00       	mov    0x12a4,%eax
{
 c3a:	89 e5                	mov    %esp,%ebp
 c3c:	57                   	push   %edi
 c3d:	56                   	push   %esi
 c3e:	53                   	push   %ebx
 c3f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c42:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 c44:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c47:	39 c8                	cmp    %ecx,%eax
 c49:	73 15                	jae    c60 <free+0x30>
 c4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c4f:	90                   	nop
 c50:	39 d1                	cmp    %edx,%ecx
 c52:	72 14                	jb     c68 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c54:	39 d0                	cmp    %edx,%eax
 c56:	73 10                	jae    c68 <free+0x38>
{
 c58:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c5a:	8b 10                	mov    (%eax),%edx
 c5c:	39 c8                	cmp    %ecx,%eax
 c5e:	72 f0                	jb     c50 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c60:	39 d0                	cmp    %edx,%eax
 c62:	72 f4                	jb     c58 <free+0x28>
 c64:	39 d1                	cmp    %edx,%ecx
 c66:	73 f0                	jae    c58 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c68:	8b 73 fc             	mov    -0x4(%ebx),%esi
 c6b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 c6e:	39 fa                	cmp    %edi,%edx
 c70:	74 1e                	je     c90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 c72:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c75:	8b 50 04             	mov    0x4(%eax),%edx
 c78:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c7b:	39 f1                	cmp    %esi,%ecx
 c7d:	74 28                	je     ca7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c7f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 c81:	5b                   	pop    %ebx
  freep = p;
 c82:	a3 a4 12 00 00       	mov    %eax,0x12a4
}
 c87:	5e                   	pop    %esi
 c88:	5f                   	pop    %edi
 c89:	5d                   	pop    %ebp
 c8a:	c3                   	ret    
 c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c8f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 c90:	03 72 04             	add    0x4(%edx),%esi
 c93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 c96:	8b 10                	mov    (%eax),%edx
 c98:	8b 12                	mov    (%edx),%edx
 c9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c9d:	8b 50 04             	mov    0x4(%eax),%edx
 ca0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ca3:	39 f1                	cmp    %esi,%ecx
 ca5:	75 d8                	jne    c7f <free+0x4f>
    p->s.size += bp->s.size;
 ca7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 caa:	a3 a4 12 00 00       	mov    %eax,0x12a4
    p->s.size += bp->s.size;
 caf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 cb2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 cb5:	89 10                	mov    %edx,(%eax)
}
 cb7:	5b                   	pop    %ebx
 cb8:	5e                   	pop    %esi
 cb9:	5f                   	pop    %edi
 cba:	5d                   	pop    %ebp
 cbb:	c3                   	ret    
 cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 cc0:	f3 0f 1e fb          	endbr32 
 cc4:	55                   	push   %ebp
 cc5:	89 e5                	mov    %esp,%ebp
 cc7:	57                   	push   %edi
 cc8:	56                   	push   %esi
 cc9:	53                   	push   %ebx
 cca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 cd0:	8b 3d a4 12 00 00    	mov    0x12a4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cd6:	8d 70 07             	lea    0x7(%eax),%esi
 cd9:	c1 ee 03             	shr    $0x3,%esi
 cdc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 cdf:	85 ff                	test   %edi,%edi
 ce1:	0f 84 a9 00 00 00    	je     d90 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ce7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 ce9:	8b 48 04             	mov    0x4(%eax),%ecx
 cec:	39 f1                	cmp    %esi,%ecx
 cee:	73 6d                	jae    d5d <malloc+0x9d>
 cf0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 cf6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 cfb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 cfe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 d05:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 d08:	eb 17                	jmp    d21 <malloc+0x61>
 d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d10:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 d12:	8b 4a 04             	mov    0x4(%edx),%ecx
 d15:	39 f1                	cmp    %esi,%ecx
 d17:	73 4f                	jae    d68 <malloc+0xa8>
 d19:	8b 3d a4 12 00 00    	mov    0x12a4,%edi
 d1f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d21:	39 c7                	cmp    %eax,%edi
 d23:	75 eb                	jne    d10 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 d25:	83 ec 0c             	sub    $0xc,%esp
 d28:	ff 75 e4             	pushl  -0x1c(%ebp)
 d2b:	e8 15 fc ff ff       	call   945 <sbrk>
  if(p == (char*)-1)
 d30:	83 c4 10             	add    $0x10,%esp
 d33:	83 f8 ff             	cmp    $0xffffffff,%eax
 d36:	74 1b                	je     d53 <malloc+0x93>
  hp->s.size = nu;
 d38:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 d3b:	83 ec 0c             	sub    $0xc,%esp
 d3e:	83 c0 08             	add    $0x8,%eax
 d41:	50                   	push   %eax
 d42:	e8 e9 fe ff ff       	call   c30 <free>
  return freep;
 d47:	a1 a4 12 00 00       	mov    0x12a4,%eax
      if((p = morecore(nunits)) == 0)
 d4c:	83 c4 10             	add    $0x10,%esp
 d4f:	85 c0                	test   %eax,%eax
 d51:	75 bd                	jne    d10 <malloc+0x50>
        return 0;
  }
}
 d53:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 d56:	31 c0                	xor    %eax,%eax
}
 d58:	5b                   	pop    %ebx
 d59:	5e                   	pop    %esi
 d5a:	5f                   	pop    %edi
 d5b:	5d                   	pop    %ebp
 d5c:	c3                   	ret    
    if(p->s.size >= nunits){
 d5d:	89 c2                	mov    %eax,%edx
 d5f:	89 f8                	mov    %edi,%eax
 d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 d68:	39 ce                	cmp    %ecx,%esi
 d6a:	74 54                	je     dc0 <malloc+0x100>
        p->s.size -= nunits;
 d6c:	29 f1                	sub    %esi,%ecx
 d6e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 d71:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 d74:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 d77:	a3 a4 12 00 00       	mov    %eax,0x12a4
}
 d7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 d7f:	8d 42 08             	lea    0x8(%edx),%eax
}
 d82:	5b                   	pop    %ebx
 d83:	5e                   	pop    %esi
 d84:	5f                   	pop    %edi
 d85:	5d                   	pop    %ebp
 d86:	c3                   	ret    
 d87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d8e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 d90:	c7 05 a4 12 00 00 a8 	movl   $0x12a8,0x12a4
 d97:	12 00 00 
    base.s.size = 0;
 d9a:	bf a8 12 00 00       	mov    $0x12a8,%edi
    base.s.ptr = freep = prevp = &base;
 d9f:	c7 05 a8 12 00 00 a8 	movl   $0x12a8,0x12a8
 da6:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 da9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 dab:	c7 05 ac 12 00 00 00 	movl   $0x0,0x12ac
 db2:	00 00 00 
    if(p->s.size >= nunits){
 db5:	e9 36 ff ff ff       	jmp    cf0 <malloc+0x30>
 dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 dc0:	8b 0a                	mov    (%edx),%ecx
 dc2:	89 08                	mov    %ecx,(%eax)
 dc4:	eb b1                	jmp    d77 <malloc+0xb7>
