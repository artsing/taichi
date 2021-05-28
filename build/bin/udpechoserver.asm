
build/bin/_udpechoserver：     文件格式 elf32-i386


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
  15:	81 ec 30 08 00 00    	sub    $0x830,%esp
    int soc, peerlen, ret;
    struct sockaddr_in self, peer;
    unsigned char *addr;
    char buf[2048];

    printf(1, "Starting UDP Echo Server\n");
  1b:	68 a8 0d 00 00       	push   $0xda8
  20:	6a 01                	push   $0x1
  22:	e8 19 0a 00 00       	call   a40 <printf>
    soc = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	6a 02                	push   $0x2
  2e:	6a 02                	push   $0x2
  30:	e8 10 09 00 00       	call   945 <socket>
    if (soc == 1) {
  35:	83 c4 10             	add    $0x10,%esp
  38:	83 f8 01             	cmp    $0x1,%eax
  3b:	0f 84 73 01 00 00    	je     1b4 <main+0x1b4>
        printf(1, "socket: failure\n");
        exit();
    }
    printf(1, "socket: success, soc=%d\n", soc);
  41:	53                   	push   %ebx
  42:	89 c6                	mov    %eax,%esi
  44:	50                   	push   %eax
  45:	68 d3 0d 00 00       	push   $0xdd3
  4a:	6a 01                	push   $0x1
  4c:	e8 ef 09 00 00       	call   a40 <printf>
    self.sin_family = AF_INET;
    self.sin_addr = INADDR_ANY;
    self.sin_port = hton16(7);
  51:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
    self.sin_family = AF_INET;
  58:	66 c7 85 d8 f7 ff ff 	movw   $0x2,-0x828(%ebp)
  5f:	02 00 
    self.sin_addr = INADDR_ANY;
  61:	c7 85 dc f7 ff ff 00 	movl   $0x0,-0x824(%ebp)
  68:	00 00 00 
    self.sin_port = hton16(7);
  6b:	e8 e0 05 00 00       	call   650 <hton16>
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  70:	83 c4 0c             	add    $0xc,%esp
    self.sin_port = hton16(7);
  73:	66 89 85 da f7 ff ff 	mov    %ax,-0x826(%ebp)
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  7a:	8d 85 d8 f7 ff ff    	lea    -0x828(%ebp),%eax
  80:	6a 08                	push   $0x8
  82:	50                   	push   %eax
  83:	56                   	push   %esi
  84:	e8 c4 08 00 00       	call   94d <bind>
  89:	83 c4 10             	add    $0x10,%esp
  8c:	83 c0 01             	add    $0x1,%eax
  8f:	0f 84 16 01 00 00    	je     1ab <main+0x1ab>
        printf(1, "bind: failure\n");
        close(soc);
        exit();
    }
    addr = (unsigned char *)&self.sin_addr;
    printf(1, "bind: success, self=%d.%d.%d.%d:%d\n", addr[0], addr[1], addr[2], addr[3], ntoh16(self.sin_port));
  95:	0f b7 85 da f7 ff ff 	movzwl -0x826(%ebp),%eax
  9c:	83 ec 0c             	sub    $0xc,%esp
  9f:	8d bd e8 f7 ff ff    	lea    -0x818(%ebp),%edi
  a5:	50                   	push   %eax
  a6:	e8 e5 05 00 00       	call   690 <ntoh16>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	0f b7 c0             	movzwl %ax,%eax
  b1:	50                   	push   %eax
  b2:	0f b6 85 df f7 ff ff 	movzbl -0x821(%ebp),%eax
  b9:	50                   	push   %eax
  ba:	0f b6 85 de f7 ff ff 	movzbl -0x822(%ebp),%eax
  c1:	50                   	push   %eax
  c2:	0f b6 85 dd f7 ff ff 	movzbl -0x823(%ebp),%eax
  c9:	50                   	push   %eax
  ca:	0f b6 85 dc f7 ff ff 	movzbl -0x824(%ebp),%eax
  d1:	50                   	push   %eax
  d2:	68 18 0e 00 00       	push   $0xe18
  d7:	6a 01                	push   $0x1
  d9:	e8 62 09 00 00       	call   a40 <printf>
    printf(1, "waiting for message...\n");
  de:	83 c4 18             	add    $0x18,%esp
  e1:	68 fb 0d 00 00       	push   $0xdfb
  e6:	6a 01                	push   $0x1
  e8:	e8 53 09 00 00       	call   a40 <printf>
  ed:	83 c4 10             	add    $0x10,%esp
  f0:	eb 6a                	jmp    15c <main+0x15c>
  f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (ret <= 0) {
            printf(1, "EOF\n");
            break;
        }
        addr = (unsigned char *)&peer.sin_addr;
        printf(1, "recvfrom: %d bytes data received, peer=%d.%d.%d.%d:%d\n", ret, addr[0], addr[1], addr[2], addr[3], ntoh16(peer.sin_port));
  f8:	0f b7 85 e2 f7 ff ff 	movzwl -0x81e(%ebp),%eax
  ff:	83 ec 0c             	sub    $0xc,%esp
 102:	50                   	push   %eax
 103:	e8 88 05 00 00       	call   690 <ntoh16>
 108:	0f b7 c0             	movzwl %ax,%eax
 10b:	50                   	push   %eax
 10c:	0f b6 85 e7 f7 ff ff 	movzbl -0x819(%ebp),%eax
 113:	50                   	push   %eax
 114:	0f b6 85 e6 f7 ff ff 	movzbl -0x81a(%ebp),%eax
 11b:	50                   	push   %eax
 11c:	0f b6 85 e5 f7 ff ff 	movzbl -0x81b(%ebp),%eax
 123:	50                   	push   %eax
 124:	0f b6 85 e4 f7 ff ff 	movzbl -0x81c(%ebp),%eax
 12b:	50                   	push   %eax
 12c:	53                   	push   %ebx
 12d:	68 3c 0e 00 00       	push   $0xe3c
 132:	6a 01                	push   $0x1
 134:	e8 07 09 00 00       	call   a40 <printf>
        hexdump(buf, ret);
 139:	83 c4 28             	add    $0x28,%esp
 13c:	53                   	push   %ebx
 13d:	57                   	push   %edi
 13e:	e8 ed 02 00 00       	call   430 <hexdump>
        sendto(soc, buf, ret, (struct sockaddr *)&peer, peerlen);
 143:	58                   	pop    %eax
 144:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
 14a:	ff b5 d4 f7 ff ff    	pushl  -0x82c(%ebp)
 150:	50                   	push   %eax
 151:	53                   	push   %ebx
 152:	57                   	push   %edi
 153:	56                   	push   %esi
 154:	e8 24 08 00 00       	call   97d <sendto>
        peerlen = sizeof(peer);
 159:	83 c4 20             	add    $0x20,%esp
        ret = recvfrom(soc, buf, sizeof(buf), (struct sockaddr *)&peer, &peerlen);
 15c:	83 ec 0c             	sub    $0xc,%esp
 15f:	8d 85 d4 f7 ff ff    	lea    -0x82c(%ebp),%eax
        peerlen = sizeof(peer);
 165:	c7 85 d4 f7 ff ff 08 	movl   $0x8,-0x82c(%ebp)
 16c:	00 00 00 
        ret = recvfrom(soc, buf, sizeof(buf), (struct sockaddr *)&peer, &peerlen);
 16f:	50                   	push   %eax
 170:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
 176:	50                   	push   %eax
 177:	68 00 08 00 00       	push   $0x800
 17c:	57                   	push   %edi
 17d:	56                   	push   %esi
 17e:	e8 f2 07 00 00       	call   975 <recvfrom>
        if (ret <= 0) {
 183:	83 c4 20             	add    $0x20,%esp
        ret = recvfrom(soc, buf, sizeof(buf), (struct sockaddr *)&peer, &peerlen);
 186:	89 c3                	mov    %eax,%ebx
        if (ret <= 0) {
 188:	85 c0                	test   %eax,%eax
 18a:	0f 8f 68 ff ff ff    	jg     f8 <main+0xf8>
            printf(1, "EOF\n");
 190:	52                   	push   %edx
 191:	52                   	push   %edx
 192:	68 13 0e 00 00       	push   $0xe13
 197:	6a 01                	push   $0x1
 199:	e8 a2 08 00 00       	call   a40 <printf>
    }
    close(soc);  
 19e:	89 34 24             	mov    %esi,(%esp)
 1a1:	e8 1f 07 00 00       	call   8c5 <close>
    exit();
 1a6:	e8 f2 06 00 00       	call   89d <exit>
        printf(1, "bind: failure\n");
 1ab:	51                   	push   %ecx
 1ac:	51                   	push   %ecx
 1ad:	68 ec 0d 00 00       	push   $0xdec
 1b2:	eb e3                	jmp    197 <main+0x197>
        printf(1, "socket: failure\n");
 1b4:	56                   	push   %esi
 1b5:	56                   	push   %esi
 1b6:	68 c2 0d 00 00       	push   $0xdc2
 1bb:	6a 01                	push   $0x1
 1bd:	e8 7e 08 00 00       	call   a40 <printf>
        exit();
 1c2:	e8 d6 06 00 00       	call   89d <exit>
 1c7:	66 90                	xchg   %ax,%ax
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d5:	31 c0                	xor    %eax,%eax
{
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	53                   	push   %ebx
 1da:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1dd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	89 c8                	mov    %ecx,%eax
 1f0:	5b                   	pop    %ebx
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	53                   	push   %ebx
 208:	8b 4d 08             	mov    0x8(%ebp),%ecx
 20b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 20e:	0f b6 01             	movzbl (%ecx),%eax
 211:	0f b6 1a             	movzbl (%edx),%ebx
 214:	84 c0                	test   %al,%al
 216:	75 19                	jne    231 <strcmp+0x31>
 218:	eb 26                	jmp    240 <strcmp+0x40>
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 220:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 224:	83 c1 01             	add    $0x1,%ecx
 227:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 22a:	0f b6 1a             	movzbl (%edx),%ebx
 22d:	84 c0                	test   %al,%al
 22f:	74 0f                	je     240 <strcmp+0x40>
 231:	38 d8                	cmp    %bl,%al
 233:	74 eb                	je     220 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 235:	29 d8                	sub    %ebx,%eax
}
 237:	5b                   	pop    %ebx
 238:	5d                   	pop    %ebp
 239:	c3                   	ret    
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 240:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 242:	29 d8                	sub    %ebx,%eax
}
 244:	5b                   	pop    %ebx
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 25a:	80 3a 00             	cmpb   $0x0,(%edx)
 25d:	74 21                	je     280 <strlen+0x30>
 25f:	31 c0                	xor    %eax,%eax
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 268:	83 c0 01             	add    $0x1,%eax
 26b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 26f:	89 c1                	mov    %eax,%ecx
 271:	75 f5                	jne    268 <strlen+0x18>
    ;
  return n;
}
 273:	89 c8                	mov    %ecx,%eax
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 280:	31 c9                	xor    %ecx,%ecx
}
 282:	5d                   	pop    %ebp
 283:	89 c8                	mov    %ecx,%eax
 285:	c3                   	ret    
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 29b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29e:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a1:	89 d7                	mov    %edx,%edi
 2a3:	fc                   	cld    
 2a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2be:	0f b6 10             	movzbl (%eax),%edx
 2c1:	84 d2                	test   %dl,%dl
 2c3:	75 16                	jne    2db <strchr+0x2b>
 2c5:	eb 21                	jmp    2e8 <strchr+0x38>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax
 2d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2d4:	83 c0 01             	add    $0x1,%eax
 2d7:	84 d2                	test   %dl,%dl
 2d9:	74 0d                	je     2e8 <strchr+0x38>
    if(*s == c)
 2db:	38 d1                	cmp    %dl,%cl
 2dd:	75 f1                	jne    2d0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    
 2e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2e8:	31 c0                	xor    %eax,%eax
}
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	57                   	push   %edi
 2f8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f9:	31 f6                	xor    %esi,%esi
{
 2fb:	53                   	push   %ebx
 2fc:	89 f3                	mov    %esi,%ebx
 2fe:	83 ec 1c             	sub    $0x1c,%esp
 301:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 304:	eb 33                	jmp    339 <gets+0x49>
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	8d 45 e7             	lea    -0x19(%ebp),%eax
 316:	6a 01                	push   $0x1
 318:	50                   	push   %eax
 319:	6a 00                	push   $0x0
 31b:	e8 95 05 00 00       	call   8b5 <read>
    if(cc < 1)
 320:	83 c4 10             	add    $0x10,%esp
 323:	85 c0                	test   %eax,%eax
 325:	7e 1c                	jle    343 <gets+0x53>
      break;
    buf[i++] = c;
 327:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 32b:	83 c7 01             	add    $0x1,%edi
 32e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 331:	3c 0a                	cmp    $0xa,%al
 333:	74 23                	je     358 <gets+0x68>
 335:	3c 0d                	cmp    $0xd,%al
 337:	74 1f                	je     358 <gets+0x68>
  for(i=0; i+1 < max; ){
 339:	83 c3 01             	add    $0x1,%ebx
 33c:	89 fe                	mov    %edi,%esi
 33e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 341:	7c cd                	jl     310 <gets+0x20>
 343:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 345:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 348:	c6 03 00             	movb   $0x0,(%ebx)
}
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    
 353:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 357:	90                   	nop
 358:	8b 75 08             	mov    0x8(%ebp),%esi
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	01 de                	add    %ebx,%esi
 360:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 362:	c6 03 00             	movb   $0x0,(%ebx)
}
 365:	8d 65 f4             	lea    -0xc(%ebp),%esp
 368:	5b                   	pop    %ebx
 369:	5e                   	pop    %esi
 36a:	5f                   	pop    %edi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	56                   	push   %esi
 378:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	6a 00                	push   $0x0
 37e:	ff 75 08             	pushl  0x8(%ebp)
 381:	e8 57 05 00 00       	call   8dd <open>
  if(fd < 0)
 386:	83 c4 10             	add    $0x10,%esp
 389:	85 c0                	test   %eax,%eax
 38b:	78 2b                	js     3b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 38d:	83 ec 08             	sub    $0x8,%esp
 390:	ff 75 0c             	pushl  0xc(%ebp)
 393:	89 c3                	mov    %eax,%ebx
 395:	50                   	push   %eax
 396:	e8 5a 05 00 00       	call   8f5 <fstat>
  close(fd);
 39b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 39e:	89 c6                	mov    %eax,%esi
  close(fd);
 3a0:	e8 20 05 00 00       	call   8c5 <close>
  return r;
 3a5:	83 c4 10             	add    $0x10,%esp
}
 3a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ab:	89 f0                	mov    %esi,%eax
 3ad:	5b                   	pop    %ebx
 3ae:	5e                   	pop    %esi
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3bd:	eb e9                	jmp    3a8 <stat+0x38>
 3bf:	90                   	nop

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	53                   	push   %ebx
 3c8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3cb:	0f be 02             	movsbl (%edx),%eax
 3ce:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3d1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3d9:	77 1a                	ja     3f5 <atoi+0x35>
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop
    n = n*10 + *s++ - '0';
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ea:	0f be 02             	movsbl (%edx),%eax
 3ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
  return n;
}
 3f5:	89 c8                	mov    %ecx,%eax
 3f7:	5b                   	pop    %ebx
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 45 10             	mov    0x10(%ebp),%eax
 40b:	8b 55 08             	mov    0x8(%ebp),%edx
 40e:	56                   	push   %esi
 40f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 412:	85 c0                	test   %eax,%eax
 414:	7e 0f                	jle    425 <memmove+0x25>
 416:	01 d0                	add    %edx,%eax
  dst = vdst;
 418:	89 d7                	mov    %edx,%edi
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 420:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 421:	39 f8                	cmp    %edi,%eax
 423:	75 fb                	jne    420 <memmove+0x20>
  return vdst;
}
 425:	5e                   	pop    %esi
 426:	89 d0                	mov    %edx,%eax
 428:	5f                   	pop    %edi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	57                   	push   %edi
 438:	56                   	push   %esi
 439:	53                   	push   %ebx
 43a:	83 ec 34             	sub    $0x34,%esp
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 440:	68 74 0e 00 00       	push   $0xe74
hexdump (void *data, size_t size) {
 445:	89 45 e0             	mov    %eax,-0x20(%ebp)
 448:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 44b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 44d:	89 c7                	mov    %eax,%edi
 44f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 452:	e8 e9 05 00 00       	call   a40 <printf>
  for (offset = 0; offset < size; offset += 16) {
 457:	83 c4 10             	add    $0x10,%esp
 45a:	85 ff                	test   %edi,%edi
 45c:	0f 84 2d 01 00 00    	je     58f <hexdump+0x15f>
 462:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 465:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 46c:	be 10 00 00 00       	mov    $0x10,%esi
 471:	83 e8 01             	sub    $0x1,%eax
 474:	83 e0 f0             	and    $0xfffffff0,%eax
 477:	83 c0 10             	add    $0x10,%eax
 47a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 480:	83 ec 08             	sub    $0x8,%esp
 483:	68 c8 0e 00 00       	push   $0xec8
 488:	6a 01                	push   $0x1
 48a:	e8 b1 05 00 00       	call   a40 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 48f:	83 c4 10             	add    $0x10,%esp
 492:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 499:	0f 8e 51 01 00 00    	jle    5f0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 49f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 4a2:	83 ec 04             	sub    $0x4,%esp
 4a5:	57                   	push   %edi
 4a6:	89 fb                	mov    %edi,%ebx
 4a8:	68 c5 0e 00 00       	push   $0xec5
 4ad:	6a 01                	push   $0x1
 4af:	e8 8c 05 00 00       	call   a40 <printf>
 4b4:	89 7d d8             	mov    %edi,-0x28(%ebp)
 4b7:	83 c4 10             	add    $0x10,%esp
 4ba:	8b 7d e0             	mov    -0x20(%ebp),%edi
 4bd:	eb 28                	jmp    4e7 <hexdump+0xb7>
 4bf:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 4c0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4c4:	80 fa 0f             	cmp    $0xf,%dl
 4c7:	0f 86 e3 00 00 00    	jbe    5b0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 4cd:	83 ec 04             	sub    $0x4,%esp
 4d0:	83 c3 01             	add    $0x1,%ebx
 4d3:	52                   	push   %edx
 4d4:	68 cb 0e 00 00       	push   $0xecb
 4d9:	6a 01                	push   $0x1
 4db:	e8 60 05 00 00       	call   a40 <printf>
 4e0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 4e3:	39 f3                	cmp    %esi,%ebx
 4e5:	74 1e                	je     505 <hexdump+0xd5>
      if(offset + index < (int)size) {
 4e7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 4ea:	7f d4                	jg     4c0 <hexdump+0x90>
      } else {
        printf(1, "   ");
 4ec:	83 ec 08             	sub    $0x8,%esp
 4ef:	83 c3 01             	add    $0x1,%ebx
 4f2:	68 cf 0e 00 00       	push   $0xecf
 4f7:	6a 01                	push   $0x1
 4f9:	e8 42 05 00 00       	call   a40 <printf>
 4fe:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 501:	39 f3                	cmp    %esi,%ebx
 503:	75 e2                	jne    4e7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 505:	83 ec 08             	sub    $0x8,%esp
 508:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 50b:	68 c8 0e 00 00       	push   $0xec8
 510:	6a 01                	push   $0x1
 512:	e8 29 05 00 00       	call   a40 <printf>
 517:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 51a:	83 c4 10             	add    $0x10,%esp
 51d:	eb 1b                	jmp    53a <hexdump+0x10a>
 51f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	52                   	push   %edx
 524:	68 d3 0e 00 00       	push   $0xed3
 529:	6a 01                	push   $0x1
 52b:	e8 10 05 00 00       	call   a40 <printf>
 530:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 533:	83 c3 01             	add    $0x1,%ebx
 536:	39 de                	cmp    %ebx,%esi
 538:	74 30                	je     56a <hexdump+0x13a>
      if(offset + index < (int)size) {
 53a:	39 df                	cmp    %ebx,%edi
 53c:	0f 8e 8e 00 00 00    	jle    5d0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 542:	8b 45 e0             	mov    -0x20(%ebp),%eax
 545:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 549:	8d 4a e0             	lea    -0x20(%edx),%ecx
 54c:	80 f9 5e             	cmp    $0x5e,%cl
 54f:	76 cf                	jbe    520 <hexdump+0xf0>
        } else {
          printf(1, ".");
 551:	83 ec 08             	sub    $0x8,%esp
 554:	83 c3 01             	add    $0x1,%ebx
 557:	68 d6 0e 00 00       	push   $0xed6
 55c:	6a 01                	push   $0x1
 55e:	e8 dd 04 00 00       	call   a40 <printf>
 563:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 566:	39 de                	cmp    %ebx,%esi
 568:	75 d0                	jne    53a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 56a:	83 ec 08             	sub    $0x8,%esp
 56d:	83 c6 10             	add    $0x10,%esi
 570:	68 d8 0e 00 00       	push   $0xed8
 575:	6a 01                	push   $0x1
 577:	e8 c4 04 00 00       	call   a40 <printf>
  for (offset = 0; offset < size; offset += 16) {
 57c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 580:	83 c4 10             	add    $0x10,%esp
 583:	8b 45 dc             	mov    -0x24(%ebp),%eax
 586:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 589:	0f 85 f1 fe ff ff    	jne    480 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 58f:	c7 45 0c 74 0e 00 00 	movl   $0xe74,0xc(%ebp)
 596:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 59d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a0:	5b                   	pop    %ebx
 5a1:	5e                   	pop    %esi
 5a2:	5f                   	pop    %edi
 5a3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5a4:	e9 97 04 00 00       	jmp    a40 <printf>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 5b0:	83 ec 08             	sub    $0x8,%esp
 5b3:	68 c3 0e 00 00       	push   $0xec3
 5b8:	6a 01                	push   $0x1
 5ba:	e8 81 04 00 00       	call   a40 <printf>
 5bf:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 5c3:	83 c4 10             	add    $0x10,%esp
 5c6:	e9 02 ff ff ff       	jmp    4cd <hexdump+0x9d>
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
        printf(1, " ");
 5d0:	83 ec 08             	sub    $0x8,%esp
 5d3:	68 d1 0e 00 00       	push   $0xed1
 5d8:	6a 01                	push   $0x1
 5da:	e8 61 04 00 00       	call   a40 <printf>
 5df:	83 c4 10             	add    $0x10,%esp
 5e2:	e9 4c ff ff ff       	jmp    533 <hexdump+0x103>
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	68 c3 0e 00 00       	push   $0xec3
 5f8:	6a 01                	push   $0x1
 5fa:	e8 41 04 00 00       	call   a40 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 5ff:	8b 7d dc             	mov    -0x24(%ebp),%edi
 602:	83 c4 10             	add    $0x10,%esp
 605:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 60b:	0f 8f 8e fe ff ff    	jg     49f <hexdump+0x6f>
 611:	83 ec 08             	sub    $0x8,%esp
 614:	68 c3 0e 00 00       	push   $0xec3
 619:	6a 01                	push   $0x1
 61b:	e8 20 04 00 00       	call   a40 <printf>
    if (offset <= 0x000f) printf(1, "0");
 620:	83 c4 10             	add    $0x10,%esp
 623:	83 ff 0f             	cmp    $0xf,%edi
 626:	0f 8f 73 fe ff ff    	jg     49f <hexdump+0x6f>
 62c:	83 ec 08             	sub    $0x8,%esp
 62f:	68 c3 0e 00 00       	push   $0xec3
 634:	6a 01                	push   $0x1
 636:	e8 05 04 00 00       	call   a40 <printf>
 63b:	83 c4 10             	add    $0x10,%esp
 63e:	e9 5c fe ff ff       	jmp    49f <hexdump+0x6f>
 643:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000650 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
    if (!endian)
 655:	a1 ac 12 00 00       	mov    0x12ac,%eax
{
 65a:	89 e5                	mov    %esp,%ebp
 65c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 65f:	85 c0                	test   %eax,%eax
 661:	75 1d                	jne    680 <hton16+0x30>
        endian = byteorder();
 663:	c7 05 ac 12 00 00 d2 	movl   $0x4d2,0x12ac
 66a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 66d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 66f:	5d                   	pop    %ebp
 670:	66 c1 c2 08          	rol    $0x8,%dx
 674:	89 d0                	mov    %edx,%eax
 676:	c3                   	ret    
 677:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67e:	66 90                	xchg   %ax,%ax
 680:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 682:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 687:	74 e4                	je     66d <hton16+0x1d>
}
 689:	89 d0                	mov    %edx,%eax
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8d 76 00             	lea    0x0(%esi),%esi

00000690 <ntoh16>:
 690:	f3 0f 1e fb          	endbr32 
 694:	eb ba                	jmp    650 <hton16>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi

000006a0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 6a0:	f3 0f 1e fb          	endbr32 
 6a4:	55                   	push   %ebp
    if (!endian)
 6a5:	8b 15 ac 12 00 00    	mov    0x12ac,%edx
{
 6ab:	89 e5                	mov    %esp,%ebp
 6ad:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 6b0:	85 d2                	test   %edx,%edx
 6b2:	75 14                	jne    6c8 <hton32+0x28>
        endian = byteorder();
 6b4:	c7 05 ac 12 00 00 d2 	movl   $0x4d2,0x12ac
 6bb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 6be:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 6c0:	5d                   	pop    %ebp
 6c1:	c3                   	ret    
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 6c8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 6ce:	74 ee                	je     6be <hton32+0x1e>
}
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006e0 <ntoh32>:
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	eb ba                	jmp    6a0 <hton32>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi

000006f0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	55                   	push   %ebp
 6f5:	89 e5                	mov    %esp,%ebp
 6f7:	57                   	push   %edi
 6f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6fb:	56                   	push   %esi
 6fc:	53                   	push   %ebx
 6fd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 700:	0f b6 01             	movzbl (%ecx),%eax
 703:	3c 09                	cmp    $0x9,%al
 705:	74 09                	je     710 <strtol+0x20>
 707:	3c 20                	cmp    $0x20,%al
 709:	75 14                	jne    71f <strtol+0x2f>
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
 710:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 714:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 717:	3c 20                	cmp    $0x20,%al
 719:	74 f5                	je     710 <strtol+0x20>
 71b:	3c 09                	cmp    $0x9,%al
 71d:	74 f1                	je     710 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 71f:	3c 2b                	cmp    $0x2b,%al
 721:	0f 84 a9 00 00 00    	je     7d0 <strtol+0xe0>
    int neg = 0;
 727:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 729:	3c 2d                	cmp    $0x2d,%al
 72b:	0f 84 8f 00 00 00    	je     7c0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 731:	0f be 11             	movsbl (%ecx),%edx
 734:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 73a:	75 12                	jne    74e <strtol+0x5e>
 73c:	80 fa 30             	cmp    $0x30,%dl
 73f:	0f 84 9b 00 00 00    	je     7e0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 745:	85 db                	test   %ebx,%ebx
 747:	75 05                	jne    74e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 749:	bb 0a 00 00 00       	mov    $0xa,%ebx
 74e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 751:	31 c0                	xor    %eax,%eax
 753:	eb 17                	jmp    76c <strtol+0x7c>
 755:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 758:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 75b:	3b 55 10             	cmp    0x10(%ebp),%edx
 75e:	7d 28                	jge    788 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 760:	0f af 45 10          	imul   0x10(%ebp),%eax
 764:	83 c1 01             	add    $0x1,%ecx
 767:	01 d0                	add    %edx,%eax
    while (1) {
 769:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 76c:	8d 72 d0             	lea    -0x30(%edx),%esi
 76f:	89 f3                	mov    %esi,%ebx
 771:	80 fb 09             	cmp    $0x9,%bl
 774:	76 e2                	jbe    758 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 776:	8d 72 9f             	lea    -0x61(%edx),%esi
 779:	89 f3                	mov    %esi,%ebx
 77b:	80 fb 19             	cmp    $0x19,%bl
 77e:	77 28                	ja     7a8 <strtol+0xb8>
            dig = *s - 'a' + 10;
 780:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 783:	3b 55 10             	cmp    0x10(%ebp),%edx
 786:	7c d8                	jl     760 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 788:	8b 55 0c             	mov    0xc(%ebp),%edx
 78b:	85 d2                	test   %edx,%edx
 78d:	74 05                	je     794 <strtol+0xa4>
        *endptr = (char *) s;
 78f:	8b 75 0c             	mov    0xc(%ebp),%esi
 792:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 794:	89 c2                	mov    %eax,%edx
}
 796:	5b                   	pop    %ebx
 797:	5e                   	pop    %esi
    return (neg ? -val : val);
 798:	f7 da                	neg    %edx
 79a:	85 ff                	test   %edi,%edi
}
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 79e:	0f 45 c2             	cmovne %edx,%eax
}
 7a1:	c3                   	ret    
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 7a8:	8d 72 bf             	lea    -0x41(%edx),%esi
 7ab:	89 f3                	mov    %esi,%ebx
 7ad:	80 fb 19             	cmp    $0x19,%bl
 7b0:	77 d6                	ja     788 <strtol+0x98>
            dig = *s - 'A' + 10;
 7b2:	83 ea 37             	sub    $0x37,%edx
 7b5:	eb a4                	jmp    75b <strtol+0x6b>
 7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7be:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 7c0:	83 c1 01             	add    $0x1,%ecx
 7c3:	bf 01 00 00 00       	mov    $0x1,%edi
 7c8:	e9 64 ff ff ff       	jmp    731 <strtol+0x41>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 7d0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 7d3:	31 ff                	xor    %edi,%edi
 7d5:	e9 57 ff ff ff       	jmp    731 <strtol+0x41>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 7e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 7e4:	3c 78                	cmp    $0x78,%al
 7e6:	74 18                	je     800 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 7e8:	85 db                	test   %ebx,%ebx
 7ea:	0f 85 5e ff ff ff    	jne    74e <strtol+0x5e>
        s++, base = 8;
 7f0:	83 c1 01             	add    $0x1,%ecx
 7f3:	0f be d0             	movsbl %al,%edx
 7f6:	bb 08 00 00 00       	mov    $0x8,%ebx
 7fb:	e9 4e ff ff ff       	jmp    74e <strtol+0x5e>
        s += 2, base = 16;
 800:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 804:	bb 10 00 00 00       	mov    $0x10,%ebx
 809:	83 c1 02             	add    $0x2,%ecx
 80c:	e9 3d ff ff ff       	jmp    74e <strtol+0x5e>
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop

00000820 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
 825:	89 e5                	mov    %esp,%ebp
 827:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 828:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 82a:	56                   	push   %esi
 82b:	53                   	push   %ebx
 82c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 82f:	83 ec 1c             	sub    $0x1c,%esp
 832:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 835:	83 ec 04             	sub    $0x4,%esp
 838:	6a 0a                	push   $0xa
 83a:	53                   	push   %ebx
 83b:	56                   	push   %esi
 83c:	e8 af fe ff ff       	call   6f0 <strtol>
        if (ret < 0 || ret > 255) {
 841:	83 c4 10             	add    $0x10,%esp
 844:	3d ff 00 00 00       	cmp    $0xff,%eax
 849:	77 3d                	ja     888 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 84b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 84e:	39 f1                	cmp    %esi,%ecx
 850:	74 36                	je     888 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 852:	0f b6 11             	movzbl (%ecx),%edx
 855:	83 ff 03             	cmp    $0x3,%edi
 858:	74 16                	je     870 <ip_addr_pton+0x50>
 85a:	80 fa 2e             	cmp    $0x2e,%dl
 85d:	75 29                	jne    888 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 85f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 862:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 865:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 868:	83 c7 01             	add    $0x1,%edi
 86b:	eb c8                	jmp    835 <ip_addr_pton+0x15>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 870:	84 d2                	test   %dl,%dl
 872:	75 14                	jne    888 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 874:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 877:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 87a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 87d:	31 c0                	xor    %eax,%eax
}
 87f:	5b                   	pop    %ebx
 880:	5e                   	pop    %esi
 881:	5f                   	pop    %edi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret    
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 888:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 88b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 890:	5b                   	pop    %ebx
 891:	5e                   	pop    %esi
 892:	5f                   	pop    %edi
 893:	5d                   	pop    %ebp
 894:	c3                   	ret    

00000895 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 895:	b8 01 00 00 00       	mov    $0x1,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <exit>:
SYSCALL(exit)
 89d:	b8 02 00 00 00       	mov    $0x2,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <wait>:
SYSCALL(wait)
 8a5:	b8 03 00 00 00       	mov    $0x3,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    

000008ad <pipe>:
SYSCALL(pipe)
 8ad:	b8 04 00 00 00       	mov    $0x4,%eax
 8b2:	cd 40                	int    $0x40
 8b4:	c3                   	ret    

000008b5 <read>:
SYSCALL(read)
 8b5:	b8 05 00 00 00       	mov    $0x5,%eax
 8ba:	cd 40                	int    $0x40
 8bc:	c3                   	ret    

000008bd <write>:
SYSCALL(write)
 8bd:	b8 10 00 00 00       	mov    $0x10,%eax
 8c2:	cd 40                	int    $0x40
 8c4:	c3                   	ret    

000008c5 <close>:
SYSCALL(close)
 8c5:	b8 15 00 00 00       	mov    $0x15,%eax
 8ca:	cd 40                	int    $0x40
 8cc:	c3                   	ret    

000008cd <kill>:
SYSCALL(kill)
 8cd:	b8 06 00 00 00       	mov    $0x6,%eax
 8d2:	cd 40                	int    $0x40
 8d4:	c3                   	ret    

000008d5 <exec>:
SYSCALL(exec)
 8d5:	b8 07 00 00 00       	mov    $0x7,%eax
 8da:	cd 40                	int    $0x40
 8dc:	c3                   	ret    

000008dd <open>:
SYSCALL(open)
 8dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 8e2:	cd 40                	int    $0x40
 8e4:	c3                   	ret    

000008e5 <mknod>:
SYSCALL(mknod)
 8e5:	b8 11 00 00 00       	mov    $0x11,%eax
 8ea:	cd 40                	int    $0x40
 8ec:	c3                   	ret    

000008ed <unlink>:
SYSCALL(unlink)
 8ed:	b8 12 00 00 00       	mov    $0x12,%eax
 8f2:	cd 40                	int    $0x40
 8f4:	c3                   	ret    

000008f5 <fstat>:
SYSCALL(fstat)
 8f5:	b8 08 00 00 00       	mov    $0x8,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <link>:
SYSCALL(link)
 8fd:	b8 13 00 00 00       	mov    $0x13,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <mkdir>:
SYSCALL(mkdir)
 905:	b8 14 00 00 00       	mov    $0x14,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <chdir>:
SYSCALL(chdir)
 90d:	b8 09 00 00 00       	mov    $0x9,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <dup>:
SYSCALL(dup)
 915:	b8 0a 00 00 00       	mov    $0xa,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <getpid>:
SYSCALL(getpid)
 91d:	b8 0b 00 00 00       	mov    $0xb,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <sbrk>:
SYSCALL(sbrk)
 925:	b8 0c 00 00 00       	mov    $0xc,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <sleep>:
SYSCALL(sleep)
 92d:	b8 0d 00 00 00       	mov    $0xd,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <uptime>:
SYSCALL(uptime)
 935:	b8 0e 00 00 00       	mov    $0xe,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <ioctl>:
# iotcl
SYSCALL(ioctl)
 93d:	b8 16 00 00 00       	mov    $0x16,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <socket>:
# socket
SYSCALL(socket)
 945:	b8 17 00 00 00       	mov    $0x17,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <bind>:
SYSCALL(bind)
 94d:	b8 19 00 00 00       	mov    $0x19,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <listen>:
SYSCALL(listen)
 955:	b8 1a 00 00 00       	mov    $0x1a,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <accept>:
SYSCALL(accept)
 95d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    

00000965 <recv>:
SYSCALL(recv)
 965:	b8 1c 00 00 00       	mov    $0x1c,%eax
 96a:	cd 40                	int    $0x40
 96c:	c3                   	ret    

0000096d <send>:
SYSCALL(send)
 96d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 972:	cd 40                	int    $0x40
 974:	c3                   	ret    

00000975 <recvfrom>:
SYSCALL(recvfrom)
 975:	b8 1e 00 00 00       	mov    $0x1e,%eax
 97a:	cd 40                	int    $0x40
 97c:	c3                   	ret    

0000097d <sendto>:
SYSCALL(sendto)
 97d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 982:	cd 40                	int    $0x40
 984:	c3                   	ret    
 985:	66 90                	xchg   %ax,%ax
 987:	66 90                	xchg   %ax,%ax
 989:	66 90                	xchg   %ax,%ax
 98b:	66 90                	xchg   %ax,%ax
 98d:	66 90                	xchg   %ax,%ax
 98f:	90                   	nop

00000990 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 3c             	sub    $0x3c,%esp
 999:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 99c:	89 d1                	mov    %edx,%ecx
{
 99e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 9a1:	85 d2                	test   %edx,%edx
 9a3:	0f 89 7f 00 00 00    	jns    a28 <printint+0x98>
 9a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 9ad:	74 79                	je     a28 <printint+0x98>
    neg = 1;
 9af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 9b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 9b8:	31 db                	xor    %ebx,%ebx
 9ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 9bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 9c0:	89 c8                	mov    %ecx,%eax
 9c2:	31 d2                	xor    %edx,%edx
 9c4:	89 cf                	mov    %ecx,%edi
 9c6:	f7 75 c4             	divl   -0x3c(%ebp)
 9c9:	0f b6 92 e4 0e 00 00 	movzbl 0xee4(%edx),%edx
 9d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 9d3:	89 d8                	mov    %ebx,%eax
 9d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 9d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 9db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 9de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 9e1:	76 dd                	jbe    9c0 <printint+0x30>
  if(neg)
 9e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 9e6:	85 c9                	test   %ecx,%ecx
 9e8:	74 0c                	je     9f6 <printint+0x66>
    buf[i++] = '-';
 9ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 9ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 9f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 9f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 9f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 9fd:	eb 07                	jmp    a06 <printint+0x76>
 9ff:	90                   	nop
 a00:	0f b6 13             	movzbl (%ebx),%edx
 a03:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 a06:	83 ec 04             	sub    $0x4,%esp
 a09:	88 55 d7             	mov    %dl,-0x29(%ebp)
 a0c:	6a 01                	push   $0x1
 a0e:	56                   	push   %esi
 a0f:	57                   	push   %edi
 a10:	e8 a8 fe ff ff       	call   8bd <write>
  while(--i >= 0)
 a15:	83 c4 10             	add    $0x10,%esp
 a18:	39 de                	cmp    %ebx,%esi
 a1a:	75 e4                	jne    a00 <printint+0x70>
    putc(fd, buf[i]);
}
 a1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a1f:	5b                   	pop    %ebx
 a20:	5e                   	pop    %esi
 a21:	5f                   	pop    %edi
 a22:	5d                   	pop    %ebp
 a23:	c3                   	ret    
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 a28:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 a2f:	eb 87                	jmp    9b8 <printint+0x28>
 a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3f:	90                   	nop

00000a40 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 a40:	f3 0f 1e fb          	endbr32 
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	57                   	push   %edi
 a48:	56                   	push   %esi
 a49:	53                   	push   %ebx
 a4a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a4d:	8b 75 0c             	mov    0xc(%ebp),%esi
 a50:	0f b6 1e             	movzbl (%esi),%ebx
 a53:	84 db                	test   %bl,%bl
 a55:	0f 84 b4 00 00 00    	je     b0f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 a5b:	8d 45 10             	lea    0x10(%ebp),%eax
 a5e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 a61:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 a64:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 a66:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a69:	eb 33                	jmp    a9e <printf+0x5e>
 a6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a6f:	90                   	nop
 a70:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a73:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 a78:	83 f8 25             	cmp    $0x25,%eax
 a7b:	74 17                	je     a94 <printf+0x54>
  write(fd, &c, 1);
 a7d:	83 ec 04             	sub    $0x4,%esp
 a80:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a83:	6a 01                	push   $0x1
 a85:	57                   	push   %edi
 a86:	ff 75 08             	pushl  0x8(%ebp)
 a89:	e8 2f fe ff ff       	call   8bd <write>
 a8e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a91:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a94:	0f b6 1e             	movzbl (%esi),%ebx
 a97:	83 c6 01             	add    $0x1,%esi
 a9a:	84 db                	test   %bl,%bl
 a9c:	74 71                	je     b0f <printf+0xcf>
    c = fmt[i] & 0xff;
 a9e:	0f be cb             	movsbl %bl,%ecx
 aa1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 aa4:	85 d2                	test   %edx,%edx
 aa6:	74 c8                	je     a70 <printf+0x30>
      }
    } else if(state == '%'){
 aa8:	83 fa 25             	cmp    $0x25,%edx
 aab:	75 e7                	jne    a94 <printf+0x54>
      if(c == 'd'){
 aad:	83 f8 64             	cmp    $0x64,%eax
 ab0:	0f 84 9a 00 00 00    	je     b50 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 ab6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 abc:	83 f9 70             	cmp    $0x70,%ecx
 abf:	74 5f                	je     b20 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 ac1:	83 f8 73             	cmp    $0x73,%eax
 ac4:	0f 84 d6 00 00 00    	je     ba0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 aca:	83 f8 63             	cmp    $0x63,%eax
 acd:	0f 84 8d 00 00 00    	je     b60 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 ad3:	83 f8 25             	cmp    $0x25,%eax
 ad6:	0f 84 b4 00 00 00    	je     b90 <printf+0x150>
  write(fd, &c, 1);
 adc:	83 ec 04             	sub    $0x4,%esp
 adf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 ae3:	6a 01                	push   $0x1
 ae5:	57                   	push   %edi
 ae6:	ff 75 08             	pushl  0x8(%ebp)
 ae9:	e8 cf fd ff ff       	call   8bd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 aee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 af1:	83 c4 0c             	add    $0xc,%esp
 af4:	6a 01                	push   $0x1
 af6:	83 c6 01             	add    $0x1,%esi
 af9:	57                   	push   %edi
 afa:	ff 75 08             	pushl  0x8(%ebp)
 afd:	e8 bb fd ff ff       	call   8bd <write>
  for(i = 0; fmt[i]; i++){
 b02:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 b06:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 b09:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 b0b:	84 db                	test   %bl,%bl
 b0d:	75 8f                	jne    a9e <printf+0x5e>
    }
  }
}
 b0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b12:	5b                   	pop    %ebx
 b13:	5e                   	pop    %esi
 b14:	5f                   	pop    %edi
 b15:	5d                   	pop    %ebp
 b16:	c3                   	ret    
 b17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b1e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 b20:	83 ec 0c             	sub    $0xc,%esp
 b23:	b9 10 00 00 00       	mov    $0x10,%ecx
 b28:	6a 00                	push   $0x0
 b2a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 b2d:	8b 45 08             	mov    0x8(%ebp),%eax
 b30:	8b 13                	mov    (%ebx),%edx
 b32:	e8 59 fe ff ff       	call   990 <printint>
        ap++;
 b37:	89 d8                	mov    %ebx,%eax
 b39:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b3c:	31 d2                	xor    %edx,%edx
        ap++;
 b3e:	83 c0 04             	add    $0x4,%eax
 b41:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b44:	e9 4b ff ff ff       	jmp    a94 <printf+0x54>
 b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 b50:	83 ec 0c             	sub    $0xc,%esp
 b53:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b58:	6a 01                	push   $0x1
 b5a:	eb ce                	jmp    b2a <printf+0xea>
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 b60:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b63:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b66:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 b68:	6a 01                	push   $0x1
        ap++;
 b6a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 b6d:	57                   	push   %edi
 b6e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 b71:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b74:	e8 44 fd ff ff       	call   8bd <write>
        ap++;
 b79:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b7c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b7f:	31 d2                	xor    %edx,%edx
 b81:	e9 0e ff ff ff       	jmp    a94 <printf+0x54>
 b86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b8d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 b90:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b93:	83 ec 04             	sub    $0x4,%esp
 b96:	e9 59 ff ff ff       	jmp    af4 <printf+0xb4>
 b9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b9f:	90                   	nop
        s = (char*)*ap;
 ba0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ba3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ba5:	83 c0 04             	add    $0x4,%eax
 ba8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 bab:	85 db                	test   %ebx,%ebx
 bad:	74 17                	je     bc6 <printf+0x186>
        while(*s != 0){
 baf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 bb2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 bb4:	84 c0                	test   %al,%al
 bb6:	0f 84 d8 fe ff ff    	je     a94 <printf+0x54>
 bbc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 bbf:	89 de                	mov    %ebx,%esi
 bc1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bc4:	eb 1a                	jmp    be0 <printf+0x1a0>
          s = "(null)";
 bc6:	bb dc 0e 00 00       	mov    $0xedc,%ebx
        while(*s != 0){
 bcb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 bce:	b8 28 00 00 00       	mov    $0x28,%eax
 bd3:	89 de                	mov    %ebx,%esi
 bd5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bdf:	90                   	nop
  write(fd, &c, 1);
 be0:	83 ec 04             	sub    $0x4,%esp
          s++;
 be3:	83 c6 01             	add    $0x1,%esi
 be6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 be9:	6a 01                	push   $0x1
 beb:	57                   	push   %edi
 bec:	53                   	push   %ebx
 bed:	e8 cb fc ff ff       	call   8bd <write>
        while(*s != 0){
 bf2:	0f b6 06             	movzbl (%esi),%eax
 bf5:	83 c4 10             	add    $0x10,%esp
 bf8:	84 c0                	test   %al,%al
 bfa:	75 e4                	jne    be0 <printf+0x1a0>
 bfc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 bff:	31 d2                	xor    %edx,%edx
 c01:	e9 8e fe ff ff       	jmp    a94 <printf+0x54>
 c06:	66 90                	xchg   %ax,%ax
 c08:	66 90                	xchg   %ax,%ax
 c0a:	66 90                	xchg   %ax,%ax
 c0c:	66 90                	xchg   %ax,%ax
 c0e:	66 90                	xchg   %ax,%ax

00000c10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c10:	f3 0f 1e fb          	endbr32 
 c14:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c15:	a1 b0 12 00 00       	mov    0x12b0,%eax
{
 c1a:	89 e5                	mov    %esp,%ebp
 c1c:	57                   	push   %edi
 c1d:	56                   	push   %esi
 c1e:	53                   	push   %ebx
 c1f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c22:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 c24:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c27:	39 c8                	cmp    %ecx,%eax
 c29:	73 15                	jae    c40 <free+0x30>
 c2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c2f:	90                   	nop
 c30:	39 d1                	cmp    %edx,%ecx
 c32:	72 14                	jb     c48 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c34:	39 d0                	cmp    %edx,%eax
 c36:	73 10                	jae    c48 <free+0x38>
{
 c38:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c3a:	8b 10                	mov    (%eax),%edx
 c3c:	39 c8                	cmp    %ecx,%eax
 c3e:	72 f0                	jb     c30 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c40:	39 d0                	cmp    %edx,%eax
 c42:	72 f4                	jb     c38 <free+0x28>
 c44:	39 d1                	cmp    %edx,%ecx
 c46:	73 f0                	jae    c38 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 c4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 c4e:	39 fa                	cmp    %edi,%edx
 c50:	74 1e                	je     c70 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 c52:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c55:	8b 50 04             	mov    0x4(%eax),%edx
 c58:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c5b:	39 f1                	cmp    %esi,%ecx
 c5d:	74 28                	je     c87 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c5f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 c61:	5b                   	pop    %ebx
  freep = p;
 c62:	a3 b0 12 00 00       	mov    %eax,0x12b0
}
 c67:	5e                   	pop    %esi
 c68:	5f                   	pop    %edi
 c69:	5d                   	pop    %ebp
 c6a:	c3                   	ret    
 c6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c6f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 c70:	03 72 04             	add    0x4(%edx),%esi
 c73:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 c76:	8b 10                	mov    (%eax),%edx
 c78:	8b 12                	mov    (%edx),%edx
 c7a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 c7d:	8b 50 04             	mov    0x4(%eax),%edx
 c80:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 c83:	39 f1                	cmp    %esi,%ecx
 c85:	75 d8                	jne    c5f <free+0x4f>
    p->s.size += bp->s.size;
 c87:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 c8a:	a3 b0 12 00 00       	mov    %eax,0x12b0
    p->s.size += bp->s.size;
 c8f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c92:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c95:	89 10                	mov    %edx,(%eax)
}
 c97:	5b                   	pop    %ebx
 c98:	5e                   	pop    %esi
 c99:	5f                   	pop    %edi
 c9a:	5d                   	pop    %ebp
 c9b:	c3                   	ret    
 c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ca0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ca0:	f3 0f 1e fb          	endbr32 
 ca4:	55                   	push   %ebp
 ca5:	89 e5                	mov    %esp,%ebp
 ca7:	57                   	push   %edi
 ca8:	56                   	push   %esi
 ca9:	53                   	push   %ebx
 caa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 cb0:	8b 3d b0 12 00 00    	mov    0x12b0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cb6:	8d 70 07             	lea    0x7(%eax),%esi
 cb9:	c1 ee 03             	shr    $0x3,%esi
 cbc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 cbf:	85 ff                	test   %edi,%edi
 cc1:	0f 84 a9 00 00 00    	je     d70 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cc7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 cc9:	8b 48 04             	mov    0x4(%eax),%ecx
 ccc:	39 f1                	cmp    %esi,%ecx
 cce:	73 6d                	jae    d3d <malloc+0x9d>
 cd0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 cd6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 cdb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 cde:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ce5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ce8:	eb 17                	jmp    d01 <malloc+0x61>
 cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cf0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 cf2:	8b 4a 04             	mov    0x4(%edx),%ecx
 cf5:	39 f1                	cmp    %esi,%ecx
 cf7:	73 4f                	jae    d48 <malloc+0xa8>
 cf9:	8b 3d b0 12 00 00    	mov    0x12b0,%edi
 cff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d01:	39 c7                	cmp    %eax,%edi
 d03:	75 eb                	jne    cf0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 d05:	83 ec 0c             	sub    $0xc,%esp
 d08:	ff 75 e4             	pushl  -0x1c(%ebp)
 d0b:	e8 15 fc ff ff       	call   925 <sbrk>
  if(p == (char*)-1)
 d10:	83 c4 10             	add    $0x10,%esp
 d13:	83 f8 ff             	cmp    $0xffffffff,%eax
 d16:	74 1b                	je     d33 <malloc+0x93>
  hp->s.size = nu;
 d18:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 d1b:	83 ec 0c             	sub    $0xc,%esp
 d1e:	83 c0 08             	add    $0x8,%eax
 d21:	50                   	push   %eax
 d22:	e8 e9 fe ff ff       	call   c10 <free>
  return freep;
 d27:	a1 b0 12 00 00       	mov    0x12b0,%eax
      if((p = morecore(nunits)) == 0)
 d2c:	83 c4 10             	add    $0x10,%esp
 d2f:	85 c0                	test   %eax,%eax
 d31:	75 bd                	jne    cf0 <malloc+0x50>
        return 0;
  }
}
 d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 d36:	31 c0                	xor    %eax,%eax
}
 d38:	5b                   	pop    %ebx
 d39:	5e                   	pop    %esi
 d3a:	5f                   	pop    %edi
 d3b:	5d                   	pop    %ebp
 d3c:	c3                   	ret    
    if(p->s.size >= nunits){
 d3d:	89 c2                	mov    %eax,%edx
 d3f:	89 f8                	mov    %edi,%eax
 d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 d48:	39 ce                	cmp    %ecx,%esi
 d4a:	74 54                	je     da0 <malloc+0x100>
        p->s.size -= nunits;
 d4c:	29 f1                	sub    %esi,%ecx
 d4e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 d51:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 d54:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 d57:	a3 b0 12 00 00       	mov    %eax,0x12b0
}
 d5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 d5f:	8d 42 08             	lea    0x8(%edx),%eax
}
 d62:	5b                   	pop    %ebx
 d63:	5e                   	pop    %esi
 d64:	5f                   	pop    %edi
 d65:	5d                   	pop    %ebp
 d66:	c3                   	ret    
 d67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d6e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 d70:	c7 05 b0 12 00 00 b4 	movl   $0x12b4,0x12b0
 d77:	12 00 00 
    base.s.size = 0;
 d7a:	bf b4 12 00 00       	mov    $0x12b4,%edi
    base.s.ptr = freep = prevp = &base;
 d7f:	c7 05 b4 12 00 00 b4 	movl   $0x12b4,0x12b4
 d86:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d89:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 d8b:	c7 05 b8 12 00 00 00 	movl   $0x0,0x12b8
 d92:	00 00 00 
    if(p->s.size >= nunits){
 d95:	e9 36 ff ff ff       	jmp    cd0 <malloc+0x30>
 d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 da0:	8b 0a                	mov    (%edx),%ecx
 da2:	89 08                	mov    %ecx,(%eax)
 da4:	eb b1                	jmp    d57 <malloc+0xb7>
