
build/bin/_tcpechoserver：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "socket.h"

int
main (int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	81 ec 40 08 00 00    	sub    $0x840,%esp
    int soc, acc, peerlen, ret;
    struct sockaddr_in self, peer;
    unsigned char *addr;
    char buf[2048];

    printf(1, "Starting TCP Echo Server\n");
  1b:	68 e8 0d 00 00       	push   $0xde8
  20:	6a 01                	push   $0x1
  22:	e8 59 0a 00 00       	call   a80 <printf>
    soc = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	6a 01                	push   $0x1
  2e:	6a 02                	push   $0x2
  30:	e8 50 09 00 00       	call   985 <socket>
    if (soc == 1) {
  35:	83 c4 10             	add    $0x10,%esp
    soc = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  38:	89 85 c4 f7 ff ff    	mov    %eax,-0x83c(%ebp)
    if (soc == 1) {
  3e:	83 f8 01             	cmp    $0x1,%eax
  41:	0f 84 a0 01 00 00    	je     1e7 <main+0x1e7>
        printf(1, "socket: failure\n");
        exit();
    }
    printf(1, "socket: success, soc=%d\n", soc);
  47:	8b bd c4 f7 ff ff    	mov    -0x83c(%ebp),%edi
  4d:	50                   	push   %eax
  4e:	57                   	push   %edi
  4f:	68 13 0e 00 00       	push   $0xe13
  54:	6a 01                	push   $0x1
  56:	e8 25 0a 00 00       	call   a80 <printf>
    self.sin_family = AF_INET;
    self.sin_addr = INADDR_ANY;
    self.sin_port = hton16(7);
  5b:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
    self.sin_family = AF_INET;
  62:	66 c7 85 d8 f7 ff ff 	movw   $0x2,-0x828(%ebp)
  69:	02 00 
    self.sin_addr = INADDR_ANY;
  6b:	c7 85 dc f7 ff ff 00 	movl   $0x0,-0x824(%ebp)
  72:	00 00 00 
    self.sin_port = hton16(7);
  75:	e8 16 06 00 00       	call   690 <hton16>
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  7a:	83 c4 0c             	add    $0xc,%esp
    self.sin_port = hton16(7);
  7d:	66 89 85 da f7 ff ff 	mov    %ax,-0x826(%ebp)
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  84:	8d 85 d8 f7 ff ff    	lea    -0x828(%ebp),%eax
  8a:	6a 08                	push   $0x8
  8c:	50                   	push   %eax
  8d:	57                   	push   %edi
  8e:	e8 fa 08 00 00       	call   98d <bind>
  93:	83 c4 10             	add    $0x10,%esp
  96:	83 c0 01             	add    $0x1,%eax
  99:	0f 84 3f 01 00 00    	je     1de <main+0x1de>
        printf(1, "bind: failure\n");
        close(soc);
        exit();
    }
    addr = (unsigned char *)&self.sin_addr;
    printf(1, "bind: success, self=%d.%d.%d.%d:%d\n", addr[0], addr[1], addr[2], addr[3], ntoh16(self.sin_port));
  9f:	0f b7 85 da f7 ff ff 	movzwl -0x826(%ebp),%eax
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 21 06 00 00       	call   6d0 <ntoh16>
  af:	83 c4 0c             	add    $0xc,%esp
  b2:	0f b7 c0             	movzwl %ax,%eax
  b5:	50                   	push   %eax
  b6:	0f b6 85 df f7 ff ff 	movzbl -0x821(%ebp),%eax
  bd:	50                   	push   %eax
  be:	0f b6 85 de f7 ff ff 	movzbl -0x822(%ebp),%eax
  c5:	50                   	push   %eax
  c6:	0f b6 85 dd f7 ff ff 	movzbl -0x823(%ebp),%eax
  cd:	50                   	push   %eax
  ce:	0f b6 85 dc f7 ff ff 	movzbl -0x824(%ebp),%eax
  d5:	50                   	push   %eax
  d6:	68 8c 0e 00 00       	push   $0xe8c
  db:	6a 01                	push   $0x1
  dd:	e8 9e 09 00 00       	call   a80 <printf>
    listen(soc, 100);
  e2:	8b 9d c4 f7 ff ff    	mov    -0x83c(%ebp),%ebx
  e8:	83 c4 18             	add    $0x18,%esp
  eb:	6a 64                	push   $0x64
  ed:	53                   	push   %ebx
  ee:	e8 a2 08 00 00       	call   995 <listen>
    printf(1, "waiting for connection...\n");
  f3:	5f                   	pop    %edi
  f4:	58                   	pop    %eax
  f5:	68 3b 0e 00 00       	push   $0xe3b
  fa:	6a 01                	push   $0x1
  fc:	e8 7f 09 00 00       	call   a80 <printf>
    peerlen = sizeof(peer);
    acc = accept(soc, (struct sockaddr *)&peer, &peerlen);
 101:	83 c4 0c             	add    $0xc,%esp
 104:	8d 85 d4 f7 ff ff    	lea    -0x82c(%ebp),%eax
    peerlen = sizeof(peer);
 10a:	c7 85 d4 f7 ff ff 08 	movl   $0x8,-0x82c(%ebp)
 111:	00 00 00 
    acc = accept(soc, (struct sockaddr *)&peer, &peerlen);
 114:	50                   	push   %eax
 115:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
 11b:	50                   	push   %eax
 11c:	53                   	push   %ebx
 11d:	e8 7b 08 00 00       	call   99d <accept>
    if (acc == -1) {
 122:	83 c4 10             	add    $0x10,%esp
    acc = accept(soc, (struct sockaddr *)&peer, &peerlen);
 125:	89 c7                	mov    %eax,%edi
    if (acc == -1) {
 127:	83 f8 ff             	cmp    $0xffffffff,%eax
 12a:	0f 84 ca 00 00 00    	je     1fa <main+0x1fa>
        printf(1, "accept: failure\n");
        close(soc);
        exit();
    }
    addr = (unsigned char *)&peer.sin_addr;
    printf(1, "accept: success, peer=%d.%d.%d.%d:%d\n", addr[0], addr[1], addr[2], addr[3], ntoh16(peer.sin_port));
 130:	0f b7 85 e2 f7 ff ff 	movzwl -0x81e(%ebp),%eax
 137:	83 ec 0c             	sub    $0xc,%esp
 13a:	8d 9d e8 f7 ff ff    	lea    -0x818(%ebp),%ebx
 140:	50                   	push   %eax
 141:	e8 8a 05 00 00       	call   6d0 <ntoh16>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	0f b7 c0             	movzwl %ax,%eax
 14c:	50                   	push   %eax
 14d:	0f b6 85 e7 f7 ff ff 	movzbl -0x819(%ebp),%eax
 154:	50                   	push   %eax
 155:	0f b6 85 e6 f7 ff ff 	movzbl -0x81a(%ebp),%eax
 15c:	50                   	push   %eax
 15d:	0f b6 85 e5 f7 ff ff 	movzbl -0x81b(%ebp),%eax
 164:	50                   	push   %eax
 165:	0f b6 85 e4 f7 ff ff 	movzbl -0x81c(%ebp),%eax
 16c:	50                   	push   %eax
 16d:	68 b0 0e 00 00       	push   $0xeb0
 172:	6a 01                	push   $0x1
 174:	e8 07 09 00 00       	call   a80 <printf>
 179:	83 c4 20             	add    $0x20,%esp
 17c:	eb 29                	jmp    1a7 <main+0x1a7>
 17e:	66 90                	xchg   %ax,%ax
        ret = recv(acc, buf, sizeof(buf));
        if (ret <= 0) {
            printf(1, "EOF\n");
            break;
        }
        printf(1, "recv: %d bytes data received\n", ret);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	50                   	push   %eax
 184:	68 6c 0e 00 00       	push   $0xe6c
 189:	6a 01                	push   $0x1
 18b:	e8 f0 08 00 00       	call   a80 <printf>
        hexdump(buf, ret);
 190:	58                   	pop    %eax
 191:	5a                   	pop    %edx
 192:	56                   	push   %esi
 193:	53                   	push   %ebx
 194:	e8 d7 02 00 00       	call   470 <hexdump>
        send(acc, buf, ret);
 199:	83 c4 0c             	add    $0xc,%esp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	57                   	push   %edi
 19f:	e8 09 08 00 00       	call   9ad <send>
        ret = recv(acc, buf, sizeof(buf));
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	68 00 08 00 00       	push   $0x800
 1af:	53                   	push   %ebx
 1b0:	57                   	push   %edi
 1b1:	e8 ef 07 00 00       	call   9a5 <recv>
        if (ret <= 0) {
 1b6:	83 c4 10             	add    $0x10,%esp
        ret = recv(acc, buf, sizeof(buf));
 1b9:	89 c6                	mov    %eax,%esi
        if (ret <= 0) {
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7f c1                	jg     180 <main+0x180>
            printf(1, "EOF\n");
 1bf:	51                   	push   %ecx
 1c0:	51                   	push   %ecx
 1c1:	68 67 0e 00 00       	push   $0xe67
        printf(1, "accept: failure\n");
 1c6:	6a 01                	push   $0x1
 1c8:	e8 b3 08 00 00       	call   a80 <printf>
        close(soc);
 1cd:	5b                   	pop    %ebx
 1ce:	ff b5 c4 f7 ff ff    	pushl  -0x83c(%ebp)
 1d4:	e8 2c 07 00 00       	call   905 <close>
        exit();
 1d9:	e8 ff 06 00 00       	call   8dd <exit>
        printf(1, "bind: failure\n");
 1de:	50                   	push   %eax
 1df:	50                   	push   %eax
 1e0:	68 2c 0e 00 00       	push   $0xe2c
 1e5:	eb df                	jmp    1c6 <main+0x1c6>
        printf(1, "socket: failure\n");
 1e7:	50                   	push   %eax
 1e8:	50                   	push   %eax
 1e9:	68 02 0e 00 00       	push   $0xe02
 1ee:	6a 01                	push   $0x1
 1f0:	e8 8b 08 00 00       	call   a80 <printf>
        exit();
 1f5:	e8 e3 06 00 00       	call   8dd <exit>
        printf(1, "accept: failure\n");
 1fa:	56                   	push   %esi
 1fb:	56                   	push   %esi
 1fc:	68 56 0e 00 00       	push   $0xe56
 201:	eb c3                	jmp    1c6 <main+0x1c6>
 203:	66 90                	xchg   %ax,%ax
 205:	66 90                	xchg   %ax,%ax
 207:	66 90                	xchg   %ax,%ax
 209:	66 90                	xchg   %ax,%ax
 20b:	66 90                	xchg   %ax,%ax
 20d:	66 90                	xchg   %ax,%ax
 20f:	90                   	nop

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 215:	31 c0                	xor    %eax,%eax
{
 217:	89 e5                	mov    %esp,%ebp
 219:	53                   	push   %ebx
 21a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 21d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 220:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 224:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 227:	83 c0 01             	add    $0x1,%eax
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 22e:	89 c8                	mov    %ecx,%eax
 230:	5b                   	pop    %ebx
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	53                   	push   %ebx
 248:	8b 4d 08             	mov    0x8(%ebp),%ecx
 24b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 24e:	0f b6 01             	movzbl (%ecx),%eax
 251:	0f b6 1a             	movzbl (%edx),%ebx
 254:	84 c0                	test   %al,%al
 256:	75 19                	jne    271 <strcmp+0x31>
 258:	eb 26                	jmp    280 <strcmp+0x40>
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 260:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 264:	83 c1 01             	add    $0x1,%ecx
 267:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 26a:	0f b6 1a             	movzbl (%edx),%ebx
 26d:	84 c0                	test   %al,%al
 26f:	74 0f                	je     280 <strcmp+0x40>
 271:	38 d8                	cmp    %bl,%al
 273:	74 eb                	je     260 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 275:	29 d8                	sub    %ebx,%eax
}
 277:	5b                   	pop    %ebx
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 280:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 282:	29 d8                	sub    %ebx,%eax
}
 284:	5b                   	pop    %ebx
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax

00000290 <strlen>:

uint
strlen(const char *s)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 29a:	80 3a 00             	cmpb   $0x0,(%edx)
 29d:	74 21                	je     2c0 <strlen+0x30>
 29f:	31 c0                	xor    %eax,%eax
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a8:	83 c0 01             	add    $0x1,%eax
 2ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2af:	89 c1                	mov    %eax,%ecx
 2b1:	75 f5                	jne    2a8 <strlen+0x18>
    ;
  return n;
}
 2b3:	89 c8                	mov    %ecx,%eax
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 2c0:	31 c9                	xor    %ecx,%ecx
}
 2c2:	5d                   	pop    %ebp
 2c3:	89 c8                	mov    %ecx,%eax
 2c5:	c3                   	ret    
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	57                   	push   %edi
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2de:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e1:	89 d7                	mov    %edx,%edi
 2e3:	fc                   	cld    
 2e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2fe:	0f b6 10             	movzbl (%eax),%edx
 301:	84 d2                	test   %dl,%dl
 303:	75 16                	jne    31b <strchr+0x2b>
 305:	eb 21                	jmp    328 <strchr+0x38>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
 310:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 314:	83 c0 01             	add    $0x1,%eax
 317:	84 d2                	test   %dl,%dl
 319:	74 0d                	je     328 <strchr+0x38>
    if(*s == c)
 31b:	38 d1                	cmp    %dl,%cl
 31d:	75 f1                	jne    310 <strchr+0x20>
      return (char*)s;
  return 0;
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 328:	31 c0                	xor    %eax,%eax
}
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 339:	31 f6                	xor    %esi,%esi
{
 33b:	53                   	push   %ebx
 33c:	89 f3                	mov    %esi,%ebx
 33e:	83 ec 1c             	sub    $0x1c,%esp
 341:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 344:	eb 33                	jmp    379 <gets+0x49>
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 350:	83 ec 04             	sub    $0x4,%esp
 353:	8d 45 e7             	lea    -0x19(%ebp),%eax
 356:	6a 01                	push   $0x1
 358:	50                   	push   %eax
 359:	6a 00                	push   $0x0
 35b:	e8 95 05 00 00       	call   8f5 <read>
    if(cc < 1)
 360:	83 c4 10             	add    $0x10,%esp
 363:	85 c0                	test   %eax,%eax
 365:	7e 1c                	jle    383 <gets+0x53>
      break;
    buf[i++] = c;
 367:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 36b:	83 c7 01             	add    $0x1,%edi
 36e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 371:	3c 0a                	cmp    $0xa,%al
 373:	74 23                	je     398 <gets+0x68>
 375:	3c 0d                	cmp    $0xd,%al
 377:	74 1f                	je     398 <gets+0x68>
  for(i=0; i+1 < max; ){
 379:	83 c3 01             	add    $0x1,%ebx
 37c:	89 fe                	mov    %edi,%esi
 37e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 381:	7c cd                	jl     350 <gets+0x20>
 383:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 385:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 388:	c6 03 00             	movb   $0x0,(%ebx)
}
 38b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38e:	5b                   	pop    %ebx
 38f:	5e                   	pop    %esi
 390:	5f                   	pop    %edi
 391:	5d                   	pop    %ebp
 392:	c3                   	ret    
 393:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 397:	90                   	nop
 398:	8b 75 08             	mov    0x8(%ebp),%esi
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	01 de                	add    %ebx,%esi
 3a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 3a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a8:	5b                   	pop    %ebx
 3a9:	5e                   	pop    %esi
 3aa:	5f                   	pop    %edi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi

000003b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	56                   	push   %esi
 3b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	6a 00                	push   $0x0
 3be:	ff 75 08             	pushl  0x8(%ebp)
 3c1:	e8 57 05 00 00       	call   91d <open>
  if(fd < 0)
 3c6:	83 c4 10             	add    $0x10,%esp
 3c9:	85 c0                	test   %eax,%eax
 3cb:	78 2b                	js     3f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 3cd:	83 ec 08             	sub    $0x8,%esp
 3d0:	ff 75 0c             	pushl  0xc(%ebp)
 3d3:	89 c3                	mov    %eax,%ebx
 3d5:	50                   	push   %eax
 3d6:	e8 5a 05 00 00       	call   935 <fstat>
  close(fd);
 3db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3de:	89 c6                	mov    %eax,%esi
  close(fd);
 3e0:	e8 20 05 00 00       	call   905 <close>
  return r;
 3e5:	83 c4 10             	add    $0x10,%esp
}
 3e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3eb:	89 f0                	mov    %esi,%eax
 3ed:	5b                   	pop    %ebx
 3ee:	5e                   	pop    %esi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3fd:	eb e9                	jmp    3e8 <stat+0x38>
 3ff:	90                   	nop

00000400 <atoi>:

int
atoi(const char *s)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	53                   	push   %ebx
 408:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40b:	0f be 02             	movsbl (%edx),%eax
 40e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 411:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 414:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 419:	77 1a                	ja     435 <atoi+0x35>
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop
    n = n*10 + *s++ - '0';
 420:	83 c2 01             	add    $0x1,%edx
 423:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 426:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 42a:	0f be 02             	movsbl (%edx),%eax
 42d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 430:	80 fb 09             	cmp    $0x9,%bl
 433:	76 eb                	jbe    420 <atoi+0x20>
  return n;
}
 435:	89 c8                	mov    %ecx,%eax
 437:	5b                   	pop    %ebx
 438:	5d                   	pop    %ebp
 439:	c3                   	ret    
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000440 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	57                   	push   %edi
 448:	8b 45 10             	mov    0x10(%ebp),%eax
 44b:	8b 55 08             	mov    0x8(%ebp),%edx
 44e:	56                   	push   %esi
 44f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 452:	85 c0                	test   %eax,%eax
 454:	7e 0f                	jle    465 <memmove+0x25>
 456:	01 d0                	add    %edx,%eax
  dst = vdst;
 458:	89 d7                	mov    %edx,%edi
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 460:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 461:	39 f8                	cmp    %edi,%eax
 463:	75 fb                	jne    460 <memmove+0x20>
  return vdst;
}
 465:	5e                   	pop    %esi
 466:	89 d0                	mov    %edx,%eax
 468:	5f                   	pop    %edi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	57                   	push   %edi
 478:	56                   	push   %esi
 479:	53                   	push   %ebx
 47a:	83 ec 34             	sub    $0x34,%esp
 47d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 480:	68 d8 0e 00 00       	push   $0xed8
hexdump (void *data, size_t size) {
 485:	89 45 e0             	mov    %eax,-0x20(%ebp)
 488:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 48b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 48d:	89 c7                	mov    %eax,%edi
 48f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 492:	e8 e9 05 00 00       	call   a80 <printf>
  for (offset = 0; offset < size; offset += 16) {
 497:	83 c4 10             	add    $0x10,%esp
 49a:	85 ff                	test   %edi,%edi
 49c:	0f 84 2d 01 00 00    	je     5cf <hexdump+0x15f>
 4a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 4ac:	be 10 00 00 00       	mov    $0x10,%esi
 4b1:	83 e8 01             	sub    $0x1,%eax
 4b4:	83 e0 f0             	and    $0xfffffff0,%eax
 4b7:	83 c0 10             	add    $0x10,%eax
 4ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 4c0:	83 ec 08             	sub    $0x8,%esp
 4c3:	68 2c 0f 00 00       	push   $0xf2c
 4c8:	6a 01                	push   $0x1
 4ca:	e8 b1 05 00 00       	call   a80 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 4cf:	83 c4 10             	add    $0x10,%esp
 4d2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 4d9:	0f 8e 51 01 00 00    	jle    630 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 4df:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4e2:	83 ec 04             	sub    $0x4,%esp
 4e5:	57                   	push   %edi
 4e6:	89 fb                	mov    %edi,%ebx
 4e8:	68 29 0f 00 00       	push   $0xf29
 4ed:	6a 01                	push   $0x1
 4ef:	e8 8c 05 00 00       	call   a80 <printf>
 4f4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	8b 7d e0             	mov    -0x20(%ebp),%edi
 4fd:	eb 28                	jmp    527 <hexdump+0xb7>
 4ff:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 500:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 504:	80 fa 0f             	cmp    $0xf,%dl
 507:	0f 86 e3 00 00 00    	jbe    5f0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 50d:	83 ec 04             	sub    $0x4,%esp
 510:	83 c3 01             	add    $0x1,%ebx
 513:	52                   	push   %edx
 514:	68 2f 0f 00 00       	push   $0xf2f
 519:	6a 01                	push   $0x1
 51b:	e8 60 05 00 00       	call   a80 <printf>
 520:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 523:	39 f3                	cmp    %esi,%ebx
 525:	74 1e                	je     545 <hexdump+0xd5>
      if(offset + index < (int)size) {
 527:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 52a:	7f d4                	jg     500 <hexdump+0x90>
      } else {
        printf(1, "   ");
 52c:	83 ec 08             	sub    $0x8,%esp
 52f:	83 c3 01             	add    $0x1,%ebx
 532:	68 33 0f 00 00       	push   $0xf33
 537:	6a 01                	push   $0x1
 539:	e8 42 05 00 00       	call   a80 <printf>
 53e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 541:	39 f3                	cmp    %esi,%ebx
 543:	75 e2                	jne    527 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 545:	83 ec 08             	sub    $0x8,%esp
 548:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 54b:	68 2c 0f 00 00       	push   $0xf2c
 550:	6a 01                	push   $0x1
 552:	e8 29 05 00 00       	call   a80 <printf>
 557:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	eb 1b                	jmp    57a <hexdump+0x10a>
 55f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 560:	83 ec 04             	sub    $0x4,%esp
 563:	52                   	push   %edx
 564:	68 37 0f 00 00       	push   $0xf37
 569:	6a 01                	push   $0x1
 56b:	e8 10 05 00 00       	call   a80 <printf>
 570:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 573:	83 c3 01             	add    $0x1,%ebx
 576:	39 de                	cmp    %ebx,%esi
 578:	74 30                	je     5aa <hexdump+0x13a>
      if(offset + index < (int)size) {
 57a:	39 df                	cmp    %ebx,%edi
 57c:	0f 8e 8e 00 00 00    	jle    610 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 582:	8b 45 e0             	mov    -0x20(%ebp),%eax
 585:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 589:	8d 4a e0             	lea    -0x20(%edx),%ecx
 58c:	80 f9 5e             	cmp    $0x5e,%cl
 58f:	76 cf                	jbe    560 <hexdump+0xf0>
        } else {
          printf(1, ".");
 591:	83 ec 08             	sub    $0x8,%esp
 594:	83 c3 01             	add    $0x1,%ebx
 597:	68 3a 0f 00 00       	push   $0xf3a
 59c:	6a 01                	push   $0x1
 59e:	e8 dd 04 00 00       	call   a80 <printf>
 5a3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 5a6:	39 de                	cmp    %ebx,%esi
 5a8:	75 d0                	jne    57a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 5aa:	83 ec 08             	sub    $0x8,%esp
 5ad:	83 c6 10             	add    $0x10,%esi
 5b0:	68 3c 0f 00 00       	push   $0xf3c
 5b5:	6a 01                	push   $0x1
 5b7:	e8 c4 04 00 00       	call   a80 <printf>
  for (offset = 0; offset < size; offset += 16) {
 5bc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 5c6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 5c9:	0f 85 f1 fe ff ff    	jne    4c0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5cf:	c7 45 0c d8 0e 00 00 	movl   $0xed8,0xc(%ebp)
 5d6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 5dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5f                   	pop    %edi
 5e3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5e4:	e9 97 04 00 00       	jmp    a80 <printf>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	68 27 0f 00 00       	push   $0xf27
 5f8:	6a 01                	push   $0x1
 5fa:	e8 81 04 00 00       	call   a80 <printf>
 5ff:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 603:	83 c4 10             	add    $0x10,%esp
 606:	e9 02 ff ff ff       	jmp    50d <hexdump+0x9d>
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
        printf(1, " ");
 610:	83 ec 08             	sub    $0x8,%esp
 613:	68 35 0f 00 00       	push   $0xf35
 618:	6a 01                	push   $0x1
 61a:	e8 61 04 00 00       	call   a80 <printf>
 61f:	83 c4 10             	add    $0x10,%esp
 622:	e9 4c ff ff ff       	jmp    573 <hexdump+0x103>
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 630:	83 ec 08             	sub    $0x8,%esp
 633:	68 27 0f 00 00       	push   $0xf27
 638:	6a 01                	push   $0x1
 63a:	e8 41 04 00 00       	call   a80 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 63f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 642:	83 c4 10             	add    $0x10,%esp
 645:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 64b:	0f 8f 8e fe ff ff    	jg     4df <hexdump+0x6f>
 651:	83 ec 08             	sub    $0x8,%esp
 654:	68 27 0f 00 00       	push   $0xf27
 659:	6a 01                	push   $0x1
 65b:	e8 20 04 00 00       	call   a80 <printf>
    if (offset <= 0x000f) printf(1, "0");
 660:	83 c4 10             	add    $0x10,%esp
 663:	83 ff 0f             	cmp    $0xf,%edi
 666:	0f 8f 73 fe ff ff    	jg     4df <hexdump+0x6f>
 66c:	83 ec 08             	sub    $0x8,%esp
 66f:	68 27 0f 00 00       	push   $0xf27
 674:	6a 01                	push   $0x1
 676:	e8 05 04 00 00       	call   a80 <printf>
 67b:	83 c4 10             	add    $0x10,%esp
 67e:	e9 5c fe ff ff       	jmp    4df <hexdump+0x6f>
 683:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000690 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 690:	f3 0f 1e fb          	endbr32 
 694:	55                   	push   %ebp
    if (!endian)
 695:	a1 10 13 00 00       	mov    0x1310,%eax
{
 69a:	89 e5                	mov    %esp,%ebp
 69c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 69f:	85 c0                	test   %eax,%eax
 6a1:	75 1d                	jne    6c0 <hton16+0x30>
        endian = byteorder();
 6a3:	c7 05 10 13 00 00 d2 	movl   $0x4d2,0x1310
 6aa:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 6ad:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 6af:	5d                   	pop    %ebp
 6b0:	66 c1 c2 08          	rol    $0x8,%dx
 6b4:	89 d0                	mov    %edx,%eax
 6b6:	c3                   	ret    
 6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6be:	66 90                	xchg   %ax,%ax
 6c0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 6c2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 6c7:	74 e4                	je     6ad <hton16+0x1d>
}
 6c9:	89 d0                	mov    %edx,%eax
 6cb:	5d                   	pop    %ebp
 6cc:	c3                   	ret    
 6cd:	8d 76 00             	lea    0x0(%esi),%esi

000006d0 <ntoh16>:
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	eb ba                	jmp    690 <hton16>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi

000006e0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	55                   	push   %ebp
    if (!endian)
 6e5:	8b 15 10 13 00 00    	mov    0x1310,%edx
{
 6eb:	89 e5                	mov    %esp,%ebp
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 6f0:	85 d2                	test   %edx,%edx
 6f2:	75 14                	jne    708 <hton32+0x28>
        endian = byteorder();
 6f4:	c7 05 10 13 00 00 d2 	movl   $0x4d2,0x1310
 6fb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 6fe:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 700:	5d                   	pop    %ebp
 701:	c3                   	ret    
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 708:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 70e:	74 ee                	je     6fe <hton32+0x1e>
}
 710:	5d                   	pop    %ebp
 711:	c3                   	ret    
 712:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000720 <ntoh32>:
 720:	f3 0f 1e fb          	endbr32 
 724:	eb ba                	jmp    6e0 <hton32>
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi

00000730 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 730:	f3 0f 1e fb          	endbr32 
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	57                   	push   %edi
 738:	8b 4d 08             	mov    0x8(%ebp),%ecx
 73b:	56                   	push   %esi
 73c:	53                   	push   %ebx
 73d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 740:	0f b6 01             	movzbl (%ecx),%eax
 743:	3c 09                	cmp    $0x9,%al
 745:	74 09                	je     750 <strtol+0x20>
 747:	3c 20                	cmp    $0x20,%al
 749:	75 14                	jne    75f <strtol+0x2f>
 74b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
 750:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 754:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 757:	3c 20                	cmp    $0x20,%al
 759:	74 f5                	je     750 <strtol+0x20>
 75b:	3c 09                	cmp    $0x9,%al
 75d:	74 f1                	je     750 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 75f:	3c 2b                	cmp    $0x2b,%al
 761:	0f 84 a9 00 00 00    	je     810 <strtol+0xe0>
    int neg = 0;
 767:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 769:	3c 2d                	cmp    $0x2d,%al
 76b:	0f 84 8f 00 00 00    	je     800 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 771:	0f be 11             	movsbl (%ecx),%edx
 774:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 77a:	75 12                	jne    78e <strtol+0x5e>
 77c:	80 fa 30             	cmp    $0x30,%dl
 77f:	0f 84 9b 00 00 00    	je     820 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 785:	85 db                	test   %ebx,%ebx
 787:	75 05                	jne    78e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 789:	bb 0a 00 00 00       	mov    $0xa,%ebx
 78e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 791:	31 c0                	xor    %eax,%eax
 793:	eb 17                	jmp    7ac <strtol+0x7c>
 795:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 798:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 79b:	3b 55 10             	cmp    0x10(%ebp),%edx
 79e:	7d 28                	jge    7c8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 7a0:	0f af 45 10          	imul   0x10(%ebp),%eax
 7a4:	83 c1 01             	add    $0x1,%ecx
 7a7:	01 d0                	add    %edx,%eax
    while (1) {
 7a9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 7ac:	8d 72 d0             	lea    -0x30(%edx),%esi
 7af:	89 f3                	mov    %esi,%ebx
 7b1:	80 fb 09             	cmp    $0x9,%bl
 7b4:	76 e2                	jbe    798 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 7b6:	8d 72 9f             	lea    -0x61(%edx),%esi
 7b9:	89 f3                	mov    %esi,%ebx
 7bb:	80 fb 19             	cmp    $0x19,%bl
 7be:	77 28                	ja     7e8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 7c0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 7c3:	3b 55 10             	cmp    0x10(%ebp),%edx
 7c6:	7c d8                	jl     7a0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 7c8:	8b 55 0c             	mov    0xc(%ebp),%edx
 7cb:	85 d2                	test   %edx,%edx
 7cd:	74 05                	je     7d4 <strtol+0xa4>
        *endptr = (char *) s;
 7cf:	8b 75 0c             	mov    0xc(%ebp),%esi
 7d2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 7d4:	89 c2                	mov    %eax,%edx
}
 7d6:	5b                   	pop    %ebx
 7d7:	5e                   	pop    %esi
    return (neg ? -val : val);
 7d8:	f7 da                	neg    %edx
 7da:	85 ff                	test   %edi,%edi
}
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 7de:	0f 45 c2             	cmovne %edx,%eax
}
 7e1:	c3                   	ret    
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 7e8:	8d 72 bf             	lea    -0x41(%edx),%esi
 7eb:	89 f3                	mov    %esi,%ebx
 7ed:	80 fb 19             	cmp    $0x19,%bl
 7f0:	77 d6                	ja     7c8 <strtol+0x98>
            dig = *s - 'A' + 10;
 7f2:	83 ea 37             	sub    $0x37,%edx
 7f5:	eb a4                	jmp    79b <strtol+0x6b>
 7f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fe:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 800:	83 c1 01             	add    $0x1,%ecx
 803:	bf 01 00 00 00       	mov    $0x1,%edi
 808:	e9 64 ff ff ff       	jmp    771 <strtol+0x41>
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 810:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 813:	31 ff                	xor    %edi,%edi
 815:	e9 57 ff ff ff       	jmp    771 <strtol+0x41>
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 820:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 824:	3c 78                	cmp    $0x78,%al
 826:	74 18                	je     840 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 828:	85 db                	test   %ebx,%ebx
 82a:	0f 85 5e ff ff ff    	jne    78e <strtol+0x5e>
        s++, base = 8;
 830:	83 c1 01             	add    $0x1,%ecx
 833:	0f be d0             	movsbl %al,%edx
 836:	bb 08 00 00 00       	mov    $0x8,%ebx
 83b:	e9 4e ff ff ff       	jmp    78e <strtol+0x5e>
        s += 2, base = 16;
 840:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 844:	bb 10 00 00 00       	mov    $0x10,%ebx
 849:	83 c1 02             	add    $0x2,%ecx
 84c:	e9 3d ff ff ff       	jmp    78e <strtol+0x5e>
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop

00000860 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 860:	f3 0f 1e fb          	endbr32 
 864:	55                   	push   %ebp
 865:	89 e5                	mov    %esp,%ebp
 867:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 868:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 86a:	56                   	push   %esi
 86b:	53                   	push   %ebx
 86c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 86f:	83 ec 1c             	sub    $0x1c,%esp
 872:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 875:	83 ec 04             	sub    $0x4,%esp
 878:	6a 0a                	push   $0xa
 87a:	53                   	push   %ebx
 87b:	56                   	push   %esi
 87c:	e8 af fe ff ff       	call   730 <strtol>
        if (ret < 0 || ret > 255) {
 881:	83 c4 10             	add    $0x10,%esp
 884:	3d ff 00 00 00       	cmp    $0xff,%eax
 889:	77 3d                	ja     8c8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 88b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 88e:	39 f1                	cmp    %esi,%ecx
 890:	74 36                	je     8c8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 892:	0f b6 11             	movzbl (%ecx),%edx
 895:	83 ff 03             	cmp    $0x3,%edi
 898:	74 16                	je     8b0 <ip_addr_pton+0x50>
 89a:	80 fa 2e             	cmp    $0x2e,%dl
 89d:	75 29                	jne    8c8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 89f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 8a2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 8a5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 8a8:	83 c7 01             	add    $0x1,%edi
 8ab:	eb c8                	jmp    875 <ip_addr_pton+0x15>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 8b0:	84 d2                	test   %dl,%dl
 8b2:	75 14                	jne    8c8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 8b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8b7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 8ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 8bd:	31 c0                	xor    %eax,%eax
}
 8bf:	5b                   	pop    %ebx
 8c0:	5e                   	pop    %esi
 8c1:	5f                   	pop    %edi
 8c2:	5d                   	pop    %ebp
 8c3:	c3                   	ret    
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 8cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 8d0:	5b                   	pop    %ebx
 8d1:	5e                   	pop    %esi
 8d2:	5f                   	pop    %edi
 8d3:	5d                   	pop    %ebp
 8d4:	c3                   	ret    

000008d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 8d5:	b8 01 00 00 00       	mov    $0x1,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <exit>:
SYSCALL(exit)
 8dd:	b8 02 00 00 00       	mov    $0x2,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <wait>:
SYSCALL(wait)
 8e5:	b8 03 00 00 00       	mov    $0x3,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <pipe>:
SYSCALL(pipe)
 8ed:	b8 04 00 00 00       	mov    $0x4,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <read>:
SYSCALL(read)
 8f5:	b8 05 00 00 00       	mov    $0x5,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <write>:
SYSCALL(write)
 8fd:	b8 10 00 00 00       	mov    $0x10,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <close>:
SYSCALL(close)
 905:	b8 15 00 00 00       	mov    $0x15,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <kill>:
SYSCALL(kill)
 90d:	b8 06 00 00 00       	mov    $0x6,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <exec>:
SYSCALL(exec)
 915:	b8 07 00 00 00       	mov    $0x7,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <open>:
SYSCALL(open)
 91d:	b8 0f 00 00 00       	mov    $0xf,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <mknod>:
SYSCALL(mknod)
 925:	b8 11 00 00 00       	mov    $0x11,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <unlink>:
SYSCALL(unlink)
 92d:	b8 12 00 00 00       	mov    $0x12,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <fstat>:
SYSCALL(fstat)
 935:	b8 08 00 00 00       	mov    $0x8,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <link>:
SYSCALL(link)
 93d:	b8 13 00 00 00       	mov    $0x13,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <mkdir>:
SYSCALL(mkdir)
 945:	b8 14 00 00 00       	mov    $0x14,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <chdir>:
SYSCALL(chdir)
 94d:	b8 09 00 00 00       	mov    $0x9,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <dup>:
SYSCALL(dup)
 955:	b8 0a 00 00 00       	mov    $0xa,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <getpid>:
SYSCALL(getpid)
 95d:	b8 0b 00 00 00       	mov    $0xb,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    

00000965 <sbrk>:
SYSCALL(sbrk)
 965:	b8 0c 00 00 00       	mov    $0xc,%eax
 96a:	cd 40                	int    $0x40
 96c:	c3                   	ret    

0000096d <sleep>:
SYSCALL(sleep)
 96d:	b8 0d 00 00 00       	mov    $0xd,%eax
 972:	cd 40                	int    $0x40
 974:	c3                   	ret    

00000975 <uptime>:
SYSCALL(uptime)
 975:	b8 0e 00 00 00       	mov    $0xe,%eax
 97a:	cd 40                	int    $0x40
 97c:	c3                   	ret    

0000097d <ioctl>:
# iotcl
SYSCALL(ioctl)
 97d:	b8 16 00 00 00       	mov    $0x16,%eax
 982:	cd 40                	int    $0x40
 984:	c3                   	ret    

00000985 <socket>:
# socket
SYSCALL(socket)
 985:	b8 17 00 00 00       	mov    $0x17,%eax
 98a:	cd 40                	int    $0x40
 98c:	c3                   	ret    

0000098d <bind>:
SYSCALL(bind)
 98d:	b8 19 00 00 00       	mov    $0x19,%eax
 992:	cd 40                	int    $0x40
 994:	c3                   	ret    

00000995 <listen>:
SYSCALL(listen)
 995:	b8 1a 00 00 00       	mov    $0x1a,%eax
 99a:	cd 40                	int    $0x40
 99c:	c3                   	ret    

0000099d <accept>:
SYSCALL(accept)
 99d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 9a2:	cd 40                	int    $0x40
 9a4:	c3                   	ret    

000009a5 <recv>:
SYSCALL(recv)
 9a5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 9aa:	cd 40                	int    $0x40
 9ac:	c3                   	ret    

000009ad <send>:
SYSCALL(send)
 9ad:	b8 1d 00 00 00       	mov    $0x1d,%eax
 9b2:	cd 40                	int    $0x40
 9b4:	c3                   	ret    

000009b5 <recvfrom>:
SYSCALL(recvfrom)
 9b5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 9ba:	cd 40                	int    $0x40
 9bc:	c3                   	ret    

000009bd <sendto>:
SYSCALL(sendto)
 9bd:	b8 1f 00 00 00       	mov    $0x1f,%eax
 9c2:	cd 40                	int    $0x40
 9c4:	c3                   	ret    
 9c5:	66 90                	xchg   %ax,%ax
 9c7:	66 90                	xchg   %ax,%ax
 9c9:	66 90                	xchg   %ax,%ax
 9cb:	66 90                	xchg   %ax,%ax
 9cd:	66 90                	xchg   %ax,%ax
 9cf:	90                   	nop

000009d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 3c             	sub    $0x3c,%esp
 9d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 9dc:	89 d1                	mov    %edx,%ecx
{
 9de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 9e1:	85 d2                	test   %edx,%edx
 9e3:	0f 89 7f 00 00 00    	jns    a68 <printint+0x98>
 9e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 9ed:	74 79                	je     a68 <printint+0x98>
    neg = 1;
 9ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 9f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 9f8:	31 db                	xor    %ebx,%ebx
 9fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 9fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 a00:	89 c8                	mov    %ecx,%eax
 a02:	31 d2                	xor    %edx,%edx
 a04:	89 cf                	mov    %ecx,%edi
 a06:	f7 75 c4             	divl   -0x3c(%ebp)
 a09:	0f b6 92 48 0f 00 00 	movzbl 0xf48(%edx),%edx
 a10:	89 45 c0             	mov    %eax,-0x40(%ebp)
 a13:	89 d8                	mov    %ebx,%eax
 a15:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 a18:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 a1b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 a1e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 a21:	76 dd                	jbe    a00 <printint+0x30>
  if(neg)
 a23:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 a26:	85 c9                	test   %ecx,%ecx
 a28:	74 0c                	je     a36 <printint+0x66>
    buf[i++] = '-';
 a2a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 a2f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 a31:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 a36:	8b 7d b8             	mov    -0x48(%ebp),%edi
 a39:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 a3d:	eb 07                	jmp    a46 <printint+0x76>
 a3f:	90                   	nop
 a40:	0f b6 13             	movzbl (%ebx),%edx
 a43:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 a46:	83 ec 04             	sub    $0x4,%esp
 a49:	88 55 d7             	mov    %dl,-0x29(%ebp)
 a4c:	6a 01                	push   $0x1
 a4e:	56                   	push   %esi
 a4f:	57                   	push   %edi
 a50:	e8 a8 fe ff ff       	call   8fd <write>
  while(--i >= 0)
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	39 de                	cmp    %ebx,%esi
 a5a:	75 e4                	jne    a40 <printint+0x70>
    putc(fd, buf[i]);
}
 a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a5f:	5b                   	pop    %ebx
 a60:	5e                   	pop    %esi
 a61:	5f                   	pop    %edi
 a62:	5d                   	pop    %ebp
 a63:	c3                   	ret    
 a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 a68:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 a6f:	eb 87                	jmp    9f8 <printint+0x28>
 a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a7f:	90                   	nop

00000a80 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 a80:	f3 0f 1e fb          	endbr32 
 a84:	55                   	push   %ebp
 a85:	89 e5                	mov    %esp,%ebp
 a87:	57                   	push   %edi
 a88:	56                   	push   %esi
 a89:	53                   	push   %ebx
 a8a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a8d:	8b 75 0c             	mov    0xc(%ebp),%esi
 a90:	0f b6 1e             	movzbl (%esi),%ebx
 a93:	84 db                	test   %bl,%bl
 a95:	0f 84 b4 00 00 00    	je     b4f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 a9b:	8d 45 10             	lea    0x10(%ebp),%eax
 a9e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 aa1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 aa4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 aa6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 aa9:	eb 33                	jmp    ade <printf+0x5e>
 aab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aaf:	90                   	nop
 ab0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 ab3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 ab8:	83 f8 25             	cmp    $0x25,%eax
 abb:	74 17                	je     ad4 <printf+0x54>
  write(fd, &c, 1);
 abd:	83 ec 04             	sub    $0x4,%esp
 ac0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 ac3:	6a 01                	push   $0x1
 ac5:	57                   	push   %edi
 ac6:	ff 75 08             	pushl  0x8(%ebp)
 ac9:	e8 2f fe ff ff       	call   8fd <write>
 ace:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 ad1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 ad4:	0f b6 1e             	movzbl (%esi),%ebx
 ad7:	83 c6 01             	add    $0x1,%esi
 ada:	84 db                	test   %bl,%bl
 adc:	74 71                	je     b4f <printf+0xcf>
    c = fmt[i] & 0xff;
 ade:	0f be cb             	movsbl %bl,%ecx
 ae1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 ae4:	85 d2                	test   %edx,%edx
 ae6:	74 c8                	je     ab0 <printf+0x30>
      }
    } else if(state == '%'){
 ae8:	83 fa 25             	cmp    $0x25,%edx
 aeb:	75 e7                	jne    ad4 <printf+0x54>
      if(c == 'd'){
 aed:	83 f8 64             	cmp    $0x64,%eax
 af0:	0f 84 9a 00 00 00    	je     b90 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 af6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 afc:	83 f9 70             	cmp    $0x70,%ecx
 aff:	74 5f                	je     b60 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b01:	83 f8 73             	cmp    $0x73,%eax
 b04:	0f 84 d6 00 00 00    	je     be0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b0a:	83 f8 63             	cmp    $0x63,%eax
 b0d:	0f 84 8d 00 00 00    	je     ba0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b13:	83 f8 25             	cmp    $0x25,%eax
 b16:	0f 84 b4 00 00 00    	je     bd0 <printf+0x150>
  write(fd, &c, 1);
 b1c:	83 ec 04             	sub    $0x4,%esp
 b1f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 b23:	6a 01                	push   $0x1
 b25:	57                   	push   %edi
 b26:	ff 75 08             	pushl  0x8(%ebp)
 b29:	e8 cf fd ff ff       	call   8fd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 b2e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b31:	83 c4 0c             	add    $0xc,%esp
 b34:	6a 01                	push   $0x1
 b36:	83 c6 01             	add    $0x1,%esi
 b39:	57                   	push   %edi
 b3a:	ff 75 08             	pushl  0x8(%ebp)
 b3d:	e8 bb fd ff ff       	call   8fd <write>
  for(i = 0; fmt[i]; i++){
 b42:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 b46:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 b49:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 b4b:	84 db                	test   %bl,%bl
 b4d:	75 8f                	jne    ade <printf+0x5e>
    }
  }
}
 b4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b52:	5b                   	pop    %ebx
 b53:	5e                   	pop    %esi
 b54:	5f                   	pop    %edi
 b55:	5d                   	pop    %ebp
 b56:	c3                   	ret    
 b57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b5e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 b60:	83 ec 0c             	sub    $0xc,%esp
 b63:	b9 10 00 00 00       	mov    $0x10,%ecx
 b68:	6a 00                	push   $0x0
 b6a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 b6d:	8b 45 08             	mov    0x8(%ebp),%eax
 b70:	8b 13                	mov    (%ebx),%edx
 b72:	e8 59 fe ff ff       	call   9d0 <printint>
        ap++;
 b77:	89 d8                	mov    %ebx,%eax
 b79:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b7c:	31 d2                	xor    %edx,%edx
        ap++;
 b7e:	83 c0 04             	add    $0x4,%eax
 b81:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b84:	e9 4b ff ff ff       	jmp    ad4 <printf+0x54>
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 b90:	83 ec 0c             	sub    $0xc,%esp
 b93:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b98:	6a 01                	push   $0x1
 b9a:	eb ce                	jmp    b6a <printf+0xea>
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 ba0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 ba3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 ba6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 ba8:	6a 01                	push   $0x1
        ap++;
 baa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 bad:	57                   	push   %edi
 bae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 bb1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 bb4:	e8 44 fd ff ff       	call   8fd <write>
        ap++;
 bb9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 bbc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 bbf:	31 d2                	xor    %edx,%edx
 bc1:	e9 0e ff ff ff       	jmp    ad4 <printf+0x54>
 bc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bcd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 bd0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 bd3:	83 ec 04             	sub    $0x4,%esp
 bd6:	e9 59 ff ff ff       	jmp    b34 <printf+0xb4>
 bdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bdf:	90                   	nop
        s = (char*)*ap;
 be0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 be3:	8b 18                	mov    (%eax),%ebx
        ap++;
 be5:	83 c0 04             	add    $0x4,%eax
 be8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 beb:	85 db                	test   %ebx,%ebx
 bed:	74 17                	je     c06 <printf+0x186>
        while(*s != 0){
 bef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 bf2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 bf4:	84 c0                	test   %al,%al
 bf6:	0f 84 d8 fe ff ff    	je     ad4 <printf+0x54>
 bfc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 bff:	89 de                	mov    %ebx,%esi
 c01:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c04:	eb 1a                	jmp    c20 <printf+0x1a0>
          s = "(null)";
 c06:	bb 40 0f 00 00       	mov    $0xf40,%ebx
        while(*s != 0){
 c0b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 c0e:	b8 28 00 00 00       	mov    $0x28,%eax
 c13:	89 de                	mov    %ebx,%esi
 c15:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c1f:	90                   	nop
  write(fd, &c, 1);
 c20:	83 ec 04             	sub    $0x4,%esp
          s++;
 c23:	83 c6 01             	add    $0x1,%esi
 c26:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 c29:	6a 01                	push   $0x1
 c2b:	57                   	push   %edi
 c2c:	53                   	push   %ebx
 c2d:	e8 cb fc ff ff       	call   8fd <write>
        while(*s != 0){
 c32:	0f b6 06             	movzbl (%esi),%eax
 c35:	83 c4 10             	add    $0x10,%esp
 c38:	84 c0                	test   %al,%al
 c3a:	75 e4                	jne    c20 <printf+0x1a0>
 c3c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 c3f:	31 d2                	xor    %edx,%edx
 c41:	e9 8e fe ff ff       	jmp    ad4 <printf+0x54>
 c46:	66 90                	xchg   %ax,%ax
 c48:	66 90                	xchg   %ax,%ax
 c4a:	66 90                	xchg   %ax,%ax
 c4c:	66 90                	xchg   %ax,%ax
 c4e:	66 90                	xchg   %ax,%ax

00000c50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c50:	f3 0f 1e fb          	endbr32 
 c54:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c55:	a1 14 13 00 00       	mov    0x1314,%eax
{
 c5a:	89 e5                	mov    %esp,%ebp
 c5c:	57                   	push   %edi
 c5d:	56                   	push   %esi
 c5e:	53                   	push   %ebx
 c5f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c62:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 c64:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c67:	39 c8                	cmp    %ecx,%eax
 c69:	73 15                	jae    c80 <free+0x30>
 c6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c6f:	90                   	nop
 c70:	39 d1                	cmp    %edx,%ecx
 c72:	72 14                	jb     c88 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c74:	39 d0                	cmp    %edx,%eax
 c76:	73 10                	jae    c88 <free+0x38>
{
 c78:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c7a:	8b 10                	mov    (%eax),%edx
 c7c:	39 c8                	cmp    %ecx,%eax
 c7e:	72 f0                	jb     c70 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c80:	39 d0                	cmp    %edx,%eax
 c82:	72 f4                	jb     c78 <free+0x28>
 c84:	39 d1                	cmp    %edx,%ecx
 c86:	73 f0                	jae    c78 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c88:	8b 73 fc             	mov    -0x4(%ebx),%esi
 c8b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 c8e:	39 fa                	cmp    %edi,%edx
 c90:	74 1e                	je     cb0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 c92:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c95:	8b 50 04             	mov    0x4(%eax),%edx
 c98:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c9b:	39 f1                	cmp    %esi,%ecx
 c9d:	74 28                	je     cc7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c9f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 ca1:	5b                   	pop    %ebx
  freep = p;
 ca2:	a3 14 13 00 00       	mov    %eax,0x1314
}
 ca7:	5e                   	pop    %esi
 ca8:	5f                   	pop    %edi
 ca9:	5d                   	pop    %ebp
 caa:	c3                   	ret    
 cab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 caf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 cb0:	03 72 04             	add    0x4(%edx),%esi
 cb3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 cb6:	8b 10                	mov    (%eax),%edx
 cb8:	8b 12                	mov    (%edx),%edx
 cba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 cbd:	8b 50 04             	mov    0x4(%eax),%edx
 cc0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 cc3:	39 f1                	cmp    %esi,%ecx
 cc5:	75 d8                	jne    c9f <free+0x4f>
    p->s.size += bp->s.size;
 cc7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 cca:	a3 14 13 00 00       	mov    %eax,0x1314
    p->s.size += bp->s.size;
 ccf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 cd2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 cd5:	89 10                	mov    %edx,(%eax)
}
 cd7:	5b                   	pop    %ebx
 cd8:	5e                   	pop    %esi
 cd9:	5f                   	pop    %edi
 cda:	5d                   	pop    %ebp
 cdb:	c3                   	ret    
 cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ce0:	f3 0f 1e fb          	endbr32 
 ce4:	55                   	push   %ebp
 ce5:	89 e5                	mov    %esp,%ebp
 ce7:	57                   	push   %edi
 ce8:	56                   	push   %esi
 ce9:	53                   	push   %ebx
 cea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ced:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 cf0:	8b 3d 14 13 00 00    	mov    0x1314,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cf6:	8d 70 07             	lea    0x7(%eax),%esi
 cf9:	c1 ee 03             	shr    $0x3,%esi
 cfc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 cff:	85 ff                	test   %edi,%edi
 d01:	0f 84 a9 00 00 00    	je     db0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d07:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 d09:	8b 48 04             	mov    0x4(%eax),%ecx
 d0c:	39 f1                	cmp    %esi,%ecx
 d0e:	73 6d                	jae    d7d <malloc+0x9d>
 d10:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 d16:	bb 00 10 00 00       	mov    $0x1000,%ebx
 d1b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 d1e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 d25:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 d28:	eb 17                	jmp    d41 <malloc+0x61>
 d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d30:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 d32:	8b 4a 04             	mov    0x4(%edx),%ecx
 d35:	39 f1                	cmp    %esi,%ecx
 d37:	73 4f                	jae    d88 <malloc+0xa8>
 d39:	8b 3d 14 13 00 00    	mov    0x1314,%edi
 d3f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d41:	39 c7                	cmp    %eax,%edi
 d43:	75 eb                	jne    d30 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 d45:	83 ec 0c             	sub    $0xc,%esp
 d48:	ff 75 e4             	pushl  -0x1c(%ebp)
 d4b:	e8 15 fc ff ff       	call   965 <sbrk>
  if(p == (char*)-1)
 d50:	83 c4 10             	add    $0x10,%esp
 d53:	83 f8 ff             	cmp    $0xffffffff,%eax
 d56:	74 1b                	je     d73 <malloc+0x93>
  hp->s.size = nu;
 d58:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 d5b:	83 ec 0c             	sub    $0xc,%esp
 d5e:	83 c0 08             	add    $0x8,%eax
 d61:	50                   	push   %eax
 d62:	e8 e9 fe ff ff       	call   c50 <free>
  return freep;
 d67:	a1 14 13 00 00       	mov    0x1314,%eax
      if((p = morecore(nunits)) == 0)
 d6c:	83 c4 10             	add    $0x10,%esp
 d6f:	85 c0                	test   %eax,%eax
 d71:	75 bd                	jne    d30 <malloc+0x50>
        return 0;
  }
}
 d73:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 d76:	31 c0                	xor    %eax,%eax
}
 d78:	5b                   	pop    %ebx
 d79:	5e                   	pop    %esi
 d7a:	5f                   	pop    %edi
 d7b:	5d                   	pop    %ebp
 d7c:	c3                   	ret    
    if(p->s.size >= nunits){
 d7d:	89 c2                	mov    %eax,%edx
 d7f:	89 f8                	mov    %edi,%eax
 d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 d88:	39 ce                	cmp    %ecx,%esi
 d8a:	74 54                	je     de0 <malloc+0x100>
        p->s.size -= nunits;
 d8c:	29 f1                	sub    %esi,%ecx
 d8e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 d91:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 d94:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 d97:	a3 14 13 00 00       	mov    %eax,0x1314
}
 d9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 d9f:	8d 42 08             	lea    0x8(%edx),%eax
}
 da2:	5b                   	pop    %ebx
 da3:	5e                   	pop    %esi
 da4:	5f                   	pop    %edi
 da5:	5d                   	pop    %ebp
 da6:	c3                   	ret    
 da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 dae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 db0:	c7 05 14 13 00 00 18 	movl   $0x1318,0x1314
 db7:	13 00 00 
    base.s.size = 0;
 dba:	bf 18 13 00 00       	mov    $0x1318,%edi
    base.s.ptr = freep = prevp = &base;
 dbf:	c7 05 18 13 00 00 18 	movl   $0x1318,0x1318
 dc6:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 dc9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 dcb:	c7 05 1c 13 00 00 00 	movl   $0x0,0x131c
 dd2:	00 00 00 
    if(p->s.size >= nunits){
 dd5:	e9 36 ff ff ff       	jmp    d10 <malloc+0x30>
 dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 de0:	8b 0a                	mov    (%edx),%ecx
 de2:	89 08                	mov    %ecx,(%eax)
 de4:	eb b1                	jmp    d97 <malloc+0xb7>
