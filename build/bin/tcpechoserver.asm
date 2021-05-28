
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
  1b:	68 48 0e 00 00       	push   $0xe48
  20:	6a 01                	push   $0x1
  22:	e8 b9 0a 00 00       	call   ae0 <printf>
    soc = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	6a 01                	push   $0x1
  2e:	6a 02                	push   $0x2
  30:	e8 b0 09 00 00       	call   9e5 <socket>
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
  4f:	68 73 0e 00 00       	push   $0xe73
  54:	6a 01                	push   $0x1
  56:	e8 85 0a 00 00       	call   ae0 <printf>
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
  75:	e8 76 06 00 00       	call   6f0 <hton16>
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  7a:	83 c4 0c             	add    $0xc,%esp
    self.sin_port = hton16(7);
  7d:	66 89 85 da f7 ff ff 	mov    %ax,-0x826(%ebp)
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  84:	8d 85 d8 f7 ff ff    	lea    -0x828(%ebp),%eax
  8a:	6a 08                	push   $0x8
  8c:	50                   	push   %eax
  8d:	57                   	push   %edi
  8e:	e8 5a 09 00 00       	call   9ed <bind>
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
  aa:	e8 81 06 00 00       	call   730 <ntoh16>
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
  d6:	68 ec 0e 00 00       	push   $0xeec
  db:	6a 01                	push   $0x1
  dd:	e8 fe 09 00 00       	call   ae0 <printf>
    listen(soc, 100);
  e2:	8b 9d c4 f7 ff ff    	mov    -0x83c(%ebp),%ebx
  e8:	83 c4 18             	add    $0x18,%esp
  eb:	6a 64                	push   $0x64
  ed:	53                   	push   %ebx
  ee:	e8 02 09 00 00       	call   9f5 <listen>
    printf(1, "waiting for connection...\n");
  f3:	5f                   	pop    %edi
  f4:	58                   	pop    %eax
  f5:	68 9b 0e 00 00       	push   $0xe9b
  fa:	6a 01                	push   $0x1
  fc:	e8 df 09 00 00       	call   ae0 <printf>
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
 11d:	e8 db 08 00 00       	call   9fd <accept>
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
 141:	e8 ea 05 00 00       	call   730 <ntoh16>
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
 16d:	68 10 0f 00 00       	push   $0xf10
 172:	6a 01                	push   $0x1
 174:	e8 67 09 00 00       	call   ae0 <printf>
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
 184:	68 cc 0e 00 00       	push   $0xecc
 189:	6a 01                	push   $0x1
 18b:	e8 50 09 00 00       	call   ae0 <printf>
        hexdump(buf, ret);
 190:	58                   	pop    %eax
 191:	5a                   	pop    %edx
 192:	56                   	push   %esi
 193:	53                   	push   %ebx
 194:	e8 37 03 00 00       	call   4d0 <hexdump>
        send(acc, buf, ret);
 199:	83 c4 0c             	add    $0xc,%esp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	57                   	push   %edi
 19f:	e8 69 08 00 00       	call   a0d <send>
        ret = recv(acc, buf, sizeof(buf));
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	68 00 08 00 00       	push   $0x800
 1af:	53                   	push   %ebx
 1b0:	57                   	push   %edi
 1b1:	e8 4f 08 00 00       	call   a05 <recv>
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
 1c1:	68 c7 0e 00 00       	push   $0xec7
        printf(1, "accept: failure\n");
 1c6:	6a 01                	push   $0x1
 1c8:	e8 13 09 00 00       	call   ae0 <printf>
        close(soc);
 1cd:	5b                   	pop    %ebx
 1ce:	ff b5 c4 f7 ff ff    	pushl  -0x83c(%ebp)
 1d4:	e8 8c 07 00 00       	call   965 <close>
        exit();
 1d9:	e8 5f 07 00 00       	call   93d <exit>
        printf(1, "bind: failure\n");
 1de:	50                   	push   %eax
 1df:	50                   	push   %eax
 1e0:	68 8c 0e 00 00       	push   $0xe8c
 1e5:	eb df                	jmp    1c6 <main+0x1c6>
        printf(1, "socket: failure\n");
 1e7:	50                   	push   %eax
 1e8:	50                   	push   %eax
 1e9:	68 62 0e 00 00       	push   $0xe62
 1ee:	6a 01                	push   $0x1
 1f0:	e8 eb 08 00 00       	call   ae0 <printf>
        exit();
 1f5:	e8 43 07 00 00       	call   93d <exit>
        printf(1, "accept: failure\n");
 1fa:	56                   	push   %esi
 1fb:	56                   	push   %esi
 1fc:	68 b6 0e 00 00       	push   $0xeb6
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

00000240 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	57                   	push   %edi
 248:	8b 7d 10             	mov    0x10(%ebp),%edi
 24b:	56                   	push   %esi
 24c:	8b 75 08             	mov    0x8(%ebp),%esi
 24f:	53                   	push   %ebx
 250:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 253:	85 ff                	test   %edi,%edi
 255:	74 39                	je     290 <strcat_s+0x50>
 257:	31 c0                	xor    %eax,%eax
 259:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 25e:	eb 11                	jmp    271 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 260:	0f b6 12             	movzbl (%edx),%edx
 263:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 266:	84 d2                	test   %dl,%dl
 268:	74 26                	je     290 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 26a:	83 c0 01             	add    $0x1,%eax
 26d:	39 c7                	cmp    %eax,%edi
 26f:	74 1f                	je     290 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 271:	89 c2                	mov    %eax,%edx
 273:	29 ca                	sub    %ecx,%edx
 275:	01 da                	add    %ebx,%edx
 277:	83 f9 ff             	cmp    $0xffffffff,%ecx
 27a:	75 e4                	jne    260 <strcat_s+0x20>
 27c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 280:	75 e8                	jne    26a <strcat_s+0x2a>
 282:	89 da                	mov    %ebx,%edx
 284:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 286:	0f b6 12             	movzbl (%edx),%edx
 289:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 28c:	84 d2                	test   %dl,%dl
 28e:	75 da                	jne    26a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 290:	5b                   	pop    %ebx
 291:	89 f0                	mov    %esi,%eax
 293:	5e                   	pop    %esi
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	53                   	push   %ebx
 2a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ae:	0f b6 01             	movzbl (%ecx),%eax
 2b1:	0f b6 1a             	movzbl (%edx),%ebx
 2b4:	84 c0                	test   %al,%al
 2b6:	75 19                	jne    2d1 <strcmp+0x31>
 2b8:	eb 26                	jmp    2e0 <strcmp+0x40>
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2c4:	83 c1 01             	add    $0x1,%ecx
 2c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ca:	0f b6 1a             	movzbl (%edx),%ebx
 2cd:	84 c0                	test   %al,%al
 2cf:	74 0f                	je     2e0 <strcmp+0x40>
 2d1:	38 d8                	cmp    %bl,%al
 2d3:	74 eb                	je     2c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2d5:	29 d8                	sub    %ebx,%eax
}
 2d7:	5b                   	pop    %ebx
 2d8:	5d                   	pop    %ebp
 2d9:	c3                   	ret    
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2e2:	29 d8                	sub    %ebx,%eax
}
 2e4:	5b                   	pop    %ebx
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <strlen>:

uint
strlen(const char *s)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2fa:	80 3a 00             	cmpb   $0x0,(%edx)
 2fd:	74 21                	je     320 <strlen+0x30>
 2ff:	31 c0                	xor    %eax,%eax
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	83 c0 01             	add    $0x1,%eax
 30b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 30f:	89 c1                	mov    %eax,%ecx
 311:	75 f5                	jne    308 <strlen+0x18>
    ;
  return n;
}
 313:	89 c8                	mov    %ecx,%eax
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 320:	31 c9                	xor    %ecx,%ecx
}
 322:	5d                   	pop    %ebp
 323:	89 c8                	mov    %ecx,%eax
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <memset>:

void*
memset(void *dst, int c, uint n)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 33b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 d7                	mov    %edx,%edi
 343:	fc                   	cld    
 344:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <strchr>:

char*
strchr(const char *s, char c)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 35e:	0f b6 10             	movzbl (%eax),%edx
 361:	84 d2                	test   %dl,%dl
 363:	75 16                	jne    37b <strchr+0x2b>
 365:	eb 21                	jmp    388 <strchr+0x38>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax
 370:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 374:	83 c0 01             	add    $0x1,%eax
 377:	84 d2                	test   %dl,%dl
 379:	74 0d                	je     388 <strchr+0x38>
    if(*s == c)
 37b:	38 d1                	cmp    %dl,%cl
 37d:	75 f1                	jne    370 <strchr+0x20>
      return (char*)s;
  return 0;
}
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 388:	31 c0                	xor    %eax,%eax
}
 38a:	5d                   	pop    %ebp
 38b:	c3                   	ret    
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <gets>:

char*
gets(char *buf, int max)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	57                   	push   %edi
 398:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 399:	31 f6                	xor    %esi,%esi
{
 39b:	53                   	push   %ebx
 39c:	89 f3                	mov    %esi,%ebx
 39e:	83 ec 1c             	sub    $0x1c,%esp
 3a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3a4:	eb 33                	jmp    3d9 <gets+0x49>
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b6:	6a 01                	push   $0x1
 3b8:	50                   	push   %eax
 3b9:	6a 00                	push   $0x0
 3bb:	e8 95 05 00 00       	call   955 <read>
    if(cc < 1)
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	85 c0                	test   %eax,%eax
 3c5:	7e 1c                	jle    3e3 <gets+0x53>
      break;
    buf[i++] = c;
 3c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3cb:	83 c7 01             	add    $0x1,%edi
 3ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3d1:	3c 0a                	cmp    $0xa,%al
 3d3:	74 23                	je     3f8 <gets+0x68>
 3d5:	3c 0d                	cmp    $0xd,%al
 3d7:	74 1f                	je     3f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 3d9:	83 c3 01             	add    $0x1,%ebx
 3dc:	89 fe                	mov    %edi,%esi
 3de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e1:	7c cd                	jl     3b0 <gets+0x20>
 3e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5f                   	pop    %edi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    
 3f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f7:	90                   	nop
 3f8:	8b 75 08             	mov    0x8(%ebp),%esi
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	01 de                	add    %ebx,%esi
 400:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 402:	c6 03 00             	movb   $0x0,(%ebx)
}
 405:	8d 65 f4             	lea    -0xc(%ebp),%esp
 408:	5b                   	pop    %ebx
 409:	5e                   	pop    %esi
 40a:	5f                   	pop    %edi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <stat>:

int
stat(const char *n, struct stat *st)
{
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 419:	83 ec 08             	sub    $0x8,%esp
 41c:	6a 00                	push   $0x0
 41e:	ff 75 08             	pushl  0x8(%ebp)
 421:	e8 57 05 00 00       	call   97d <open>
  if(fd < 0)
 426:	83 c4 10             	add    $0x10,%esp
 429:	85 c0                	test   %eax,%eax
 42b:	78 2b                	js     458 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 42d:	83 ec 08             	sub    $0x8,%esp
 430:	ff 75 0c             	pushl  0xc(%ebp)
 433:	89 c3                	mov    %eax,%ebx
 435:	50                   	push   %eax
 436:	e8 5a 05 00 00       	call   995 <fstat>
  close(fd);
 43b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 43e:	89 c6                	mov    %eax,%esi
  close(fd);
 440:	e8 20 05 00 00       	call   965 <close>
  return r;
 445:	83 c4 10             	add    $0x10,%esp
}
 448:	8d 65 f8             	lea    -0x8(%ebp),%esp
 44b:	89 f0                	mov    %esi,%eax
 44d:	5b                   	pop    %ebx
 44e:	5e                   	pop    %esi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 458:	be ff ff ff ff       	mov    $0xffffffff,%esi
 45d:	eb e9                	jmp    448 <stat+0x38>
 45f:	90                   	nop

00000460 <atoi>:

int
atoi(const char *s)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	53                   	push   %ebx
 468:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 46b:	0f be 02             	movsbl (%edx),%eax
 46e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 471:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 474:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 479:	77 1a                	ja     495 <atoi+0x35>
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop
    n = n*10 + *s++ - '0';
 480:	83 c2 01             	add    $0x1,%edx
 483:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 486:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 48a:	0f be 02             	movsbl (%edx),%eax
 48d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 490:	80 fb 09             	cmp    $0x9,%bl
 493:	76 eb                	jbe    480 <atoi+0x20>
  return n;
}
 495:	89 c8                	mov    %ecx,%eax
 497:	5b                   	pop    %ebx
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	8b 45 10             	mov    0x10(%ebp),%eax
 4ab:	8b 55 08             	mov    0x8(%ebp),%edx
 4ae:	56                   	push   %esi
 4af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4b2:	85 c0                	test   %eax,%eax
 4b4:	7e 0f                	jle    4c5 <memmove+0x25>
 4b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4b8:	89 d7                	mov    %edx,%edi
 4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4c1:	39 f8                	cmp    %edi,%eax
 4c3:	75 fb                	jne    4c0 <memmove+0x20>
  return vdst;
}
 4c5:	5e                   	pop    %esi
 4c6:	89 d0                	mov    %edx,%eax
 4c8:	5f                   	pop    %edi
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    
 4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	83 ec 34             	sub    $0x34,%esp
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4e0:	68 38 0f 00 00       	push   $0xf38
hexdump (void *data, size_t size) {
 4e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 4e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4eb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 4ed:	89 c7                	mov    %eax,%edi
 4ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4f2:	e8 e9 05 00 00       	call   ae0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	85 ff                	test   %edi,%edi
 4fc:	0f 84 2d 01 00 00    	je     62f <hexdump+0x15f>
 502:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 505:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 50c:	be 10 00 00 00       	mov    $0x10,%esi
 511:	83 e8 01             	sub    $0x1,%eax
 514:	83 e0 f0             	and    $0xfffffff0,%eax
 517:	83 c0 10             	add    $0x10,%eax
 51a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 520:	83 ec 08             	sub    $0x8,%esp
 523:	68 8c 0f 00 00       	push   $0xf8c
 528:	6a 01                	push   $0x1
 52a:	e8 b1 05 00 00       	call   ae0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 52f:	83 c4 10             	add    $0x10,%esp
 532:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 539:	0f 8e 51 01 00 00    	jle    690 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 53f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 542:	83 ec 04             	sub    $0x4,%esp
 545:	57                   	push   %edi
 546:	89 fb                	mov    %edi,%ebx
 548:	68 89 0f 00 00       	push   $0xf89
 54d:	6a 01                	push   $0x1
 54f:	e8 8c 05 00 00       	call   ae0 <printf>
 554:	89 7d d8             	mov    %edi,-0x28(%ebp)
 557:	83 c4 10             	add    $0x10,%esp
 55a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 55d:	eb 28                	jmp    587 <hexdump+0xb7>
 55f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 560:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 564:	80 fa 0f             	cmp    $0xf,%dl
 567:	0f 86 e3 00 00 00    	jbe    650 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 56d:	83 ec 04             	sub    $0x4,%esp
 570:	83 c3 01             	add    $0x1,%ebx
 573:	52                   	push   %edx
 574:	68 8f 0f 00 00       	push   $0xf8f
 579:	6a 01                	push   $0x1
 57b:	e8 60 05 00 00       	call   ae0 <printf>
 580:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 583:	39 f3                	cmp    %esi,%ebx
 585:	74 1e                	je     5a5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 587:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 58a:	7f d4                	jg     560 <hexdump+0x90>
      } else {
        printf(1, "   ");
 58c:	83 ec 08             	sub    $0x8,%esp
 58f:	83 c3 01             	add    $0x1,%ebx
 592:	68 93 0f 00 00       	push   $0xf93
 597:	6a 01                	push   $0x1
 599:	e8 42 05 00 00       	call   ae0 <printf>
 59e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 5a1:	39 f3                	cmp    %esi,%ebx
 5a3:	75 e2                	jne    587 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 5a5:	83 ec 08             	sub    $0x8,%esp
 5a8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 5ab:	68 8c 0f 00 00       	push   $0xf8c
 5b0:	6a 01                	push   $0x1
 5b2:	e8 29 05 00 00       	call   ae0 <printf>
 5b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ba:	83 c4 10             	add    $0x10,%esp
 5bd:	eb 1b                	jmp    5da <hexdump+0x10a>
 5bf:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	52                   	push   %edx
 5c4:	68 97 0f 00 00       	push   $0xf97
 5c9:	6a 01                	push   $0x1
 5cb:	e8 10 05 00 00       	call   ae0 <printf>
 5d0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 5d3:	83 c3 01             	add    $0x1,%ebx
 5d6:	39 de                	cmp    %ebx,%esi
 5d8:	74 30                	je     60a <hexdump+0x13a>
      if(offset + index < (int)size) {
 5da:	39 df                	cmp    %ebx,%edi
 5dc:	0f 8e 8e 00 00 00    	jle    670 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 5e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 5e5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5e9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 5ec:	80 f9 5e             	cmp    $0x5e,%cl
 5ef:	76 cf                	jbe    5c0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 5f1:	83 ec 08             	sub    $0x8,%esp
 5f4:	83 c3 01             	add    $0x1,%ebx
 5f7:	68 9a 0f 00 00       	push   $0xf9a
 5fc:	6a 01                	push   $0x1
 5fe:	e8 dd 04 00 00       	call   ae0 <printf>
 603:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 606:	39 de                	cmp    %ebx,%esi
 608:	75 d0                	jne    5da <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 60a:	83 ec 08             	sub    $0x8,%esp
 60d:	83 c6 10             	add    $0x10,%esi
 610:	68 9c 0f 00 00       	push   $0xf9c
 615:	6a 01                	push   $0x1
 617:	e8 c4 04 00 00       	call   ae0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 61c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 620:	83 c4 10             	add    $0x10,%esp
 623:	8b 45 dc             	mov    -0x24(%ebp),%eax
 626:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 629:	0f 85 f1 fe ff ff    	jne    520 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 62f:	c7 45 0c 38 0f 00 00 	movl   $0xf38,0xc(%ebp)
 636:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 63d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 640:	5b                   	pop    %ebx
 641:	5e                   	pop    %esi
 642:	5f                   	pop    %edi
 643:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 644:	e9 97 04 00 00       	jmp    ae0 <printf>
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 650:	83 ec 08             	sub    $0x8,%esp
 653:	68 87 0f 00 00       	push   $0xf87
 658:	6a 01                	push   $0x1
 65a:	e8 81 04 00 00       	call   ae0 <printf>
 65f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 663:	83 c4 10             	add    $0x10,%esp
 666:	e9 02 ff ff ff       	jmp    56d <hexdump+0x9d>
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
        printf(1, " ");
 670:	83 ec 08             	sub    $0x8,%esp
 673:	68 95 0f 00 00       	push   $0xf95
 678:	6a 01                	push   $0x1
 67a:	e8 61 04 00 00       	call   ae0 <printf>
 67f:	83 c4 10             	add    $0x10,%esp
 682:	e9 4c ff ff ff       	jmp    5d3 <hexdump+0x103>
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 690:	83 ec 08             	sub    $0x8,%esp
 693:	68 87 0f 00 00       	push   $0xf87
 698:	6a 01                	push   $0x1
 69a:	e8 41 04 00 00       	call   ae0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 69f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 6a2:	83 c4 10             	add    $0x10,%esp
 6a5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 6ab:	0f 8f 8e fe ff ff    	jg     53f <hexdump+0x6f>
 6b1:	83 ec 08             	sub    $0x8,%esp
 6b4:	68 87 0f 00 00       	push   $0xf87
 6b9:	6a 01                	push   $0x1
 6bb:	e8 20 04 00 00       	call   ae0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 6c0:	83 c4 10             	add    $0x10,%esp
 6c3:	83 ff 0f             	cmp    $0xf,%edi
 6c6:	0f 8f 73 fe ff ff    	jg     53f <hexdump+0x6f>
 6cc:	83 ec 08             	sub    $0x8,%esp
 6cf:	68 87 0f 00 00       	push   $0xf87
 6d4:	6a 01                	push   $0x1
 6d6:	e8 05 04 00 00       	call   ae0 <printf>
 6db:	83 c4 10             	add    $0x10,%esp
 6de:	e9 5c fe ff ff       	jmp    53f <hexdump+0x6f>
 6e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006f0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	55                   	push   %ebp
    if (!endian)
 6f5:	a1 a0 13 00 00       	mov    0x13a0,%eax
{
 6fa:	89 e5                	mov    %esp,%ebp
 6fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 6ff:	85 c0                	test   %eax,%eax
 701:	75 1d                	jne    720 <hton16+0x30>
        endian = byteorder();
 703:	c7 05 a0 13 00 00 d2 	movl   $0x4d2,0x13a0
 70a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 70d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 70f:	5d                   	pop    %ebp
 710:	66 c1 c2 08          	rol    $0x8,%dx
 714:	89 d0                	mov    %edx,%eax
 716:	c3                   	ret    
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax
 720:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 722:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 727:	74 e4                	je     70d <hton16+0x1d>
}
 729:	89 d0                	mov    %edx,%eax
 72b:	5d                   	pop    %ebp
 72c:	c3                   	ret    
 72d:	8d 76 00             	lea    0x0(%esi),%esi

00000730 <ntoh16>:
 730:	f3 0f 1e fb          	endbr32 
 734:	eb ba                	jmp    6f0 <hton16>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi

00000740 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 740:	f3 0f 1e fb          	endbr32 
 744:	55                   	push   %ebp
    if (!endian)
 745:	8b 15 a0 13 00 00    	mov    0x13a0,%edx
{
 74b:	89 e5                	mov    %esp,%ebp
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 750:	85 d2                	test   %edx,%edx
 752:	75 14                	jne    768 <hton32+0x28>
        endian = byteorder();
 754:	c7 05 a0 13 00 00 d2 	movl   $0x4d2,0x13a0
 75b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 75e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 760:	5d                   	pop    %ebp
 761:	c3                   	ret    
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 768:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 76e:	74 ee                	je     75e <hton32+0x1e>
}
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    
 772:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000780 <ntoh32>:
 780:	f3 0f 1e fb          	endbr32 
 784:	eb ba                	jmp    740 <hton32>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi

00000790 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 790:	f3 0f 1e fb          	endbr32 
 794:	55                   	push   %ebp
 795:	89 e5                	mov    %esp,%ebp
 797:	57                   	push   %edi
 798:	8b 4d 08             	mov    0x8(%ebp),%ecx
 79b:	56                   	push   %esi
 79c:	53                   	push   %ebx
 79d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 7a0:	0f b6 01             	movzbl (%ecx),%eax
 7a3:	3c 09                	cmp    $0x9,%al
 7a5:	74 09                	je     7b0 <strtol+0x20>
 7a7:	3c 20                	cmp    $0x20,%al
 7a9:	75 14                	jne    7bf <strtol+0x2f>
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
 7b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 7b4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 7b7:	3c 20                	cmp    $0x20,%al
 7b9:	74 f5                	je     7b0 <strtol+0x20>
 7bb:	3c 09                	cmp    $0x9,%al
 7bd:	74 f1                	je     7b0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 7bf:	3c 2b                	cmp    $0x2b,%al
 7c1:	0f 84 a9 00 00 00    	je     870 <strtol+0xe0>
    int neg = 0;
 7c7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 7c9:	3c 2d                	cmp    $0x2d,%al
 7cb:	0f 84 8f 00 00 00    	je     860 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 7d1:	0f be 11             	movsbl (%ecx),%edx
 7d4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 7da:	75 12                	jne    7ee <strtol+0x5e>
 7dc:	80 fa 30             	cmp    $0x30,%dl
 7df:	0f 84 9b 00 00 00    	je     880 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 7e5:	85 db                	test   %ebx,%ebx
 7e7:	75 05                	jne    7ee <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 7e9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 7ee:	89 5d 10             	mov    %ebx,0x10(%ebp)
 7f1:	31 c0                	xor    %eax,%eax
 7f3:	eb 17                	jmp    80c <strtol+0x7c>
 7f5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 7f8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 7fb:	3b 55 10             	cmp    0x10(%ebp),%edx
 7fe:	7d 28                	jge    828 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 800:	0f af 45 10          	imul   0x10(%ebp),%eax
 804:	83 c1 01             	add    $0x1,%ecx
 807:	01 d0                	add    %edx,%eax
    while (1) {
 809:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 80c:	8d 72 d0             	lea    -0x30(%edx),%esi
 80f:	89 f3                	mov    %esi,%ebx
 811:	80 fb 09             	cmp    $0x9,%bl
 814:	76 e2                	jbe    7f8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 816:	8d 72 9f             	lea    -0x61(%edx),%esi
 819:	89 f3                	mov    %esi,%ebx
 81b:	80 fb 19             	cmp    $0x19,%bl
 81e:	77 28                	ja     848 <strtol+0xb8>
            dig = *s - 'a' + 10;
 820:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 823:	3b 55 10             	cmp    0x10(%ebp),%edx
 826:	7c d8                	jl     800 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 828:	8b 55 0c             	mov    0xc(%ebp),%edx
 82b:	85 d2                	test   %edx,%edx
 82d:	74 05                	je     834 <strtol+0xa4>
        *endptr = (char *) s;
 82f:	8b 75 0c             	mov    0xc(%ebp),%esi
 832:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 834:	89 c2                	mov    %eax,%edx
}
 836:	5b                   	pop    %ebx
 837:	5e                   	pop    %esi
    return (neg ? -val : val);
 838:	f7 da                	neg    %edx
 83a:	85 ff                	test   %edi,%edi
}
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 83e:	0f 45 c2             	cmovne %edx,%eax
}
 841:	c3                   	ret    
 842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 848:	8d 72 bf             	lea    -0x41(%edx),%esi
 84b:	89 f3                	mov    %esi,%ebx
 84d:	80 fb 19             	cmp    $0x19,%bl
 850:	77 d6                	ja     828 <strtol+0x98>
            dig = *s - 'A' + 10;
 852:	83 ea 37             	sub    $0x37,%edx
 855:	eb a4                	jmp    7fb <strtol+0x6b>
 857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 860:	83 c1 01             	add    $0x1,%ecx
 863:	bf 01 00 00 00       	mov    $0x1,%edi
 868:	e9 64 ff ff ff       	jmp    7d1 <strtol+0x41>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 870:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 873:	31 ff                	xor    %edi,%edi
 875:	e9 57 ff ff ff       	jmp    7d1 <strtol+0x41>
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 880:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 884:	3c 78                	cmp    $0x78,%al
 886:	74 18                	je     8a0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 888:	85 db                	test   %ebx,%ebx
 88a:	0f 85 5e ff ff ff    	jne    7ee <strtol+0x5e>
        s++, base = 8;
 890:	83 c1 01             	add    $0x1,%ecx
 893:	0f be d0             	movsbl %al,%edx
 896:	bb 08 00 00 00       	mov    $0x8,%ebx
 89b:	e9 4e ff ff ff       	jmp    7ee <strtol+0x5e>
        s += 2, base = 16;
 8a0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 8a4:	bb 10 00 00 00       	mov    $0x10,%ebx
 8a9:	83 c1 02             	add    $0x2,%ecx
 8ac:	e9 3d ff ff ff       	jmp    7ee <strtol+0x5e>
 8b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop

000008c0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 8c0:	f3 0f 1e fb          	endbr32 
 8c4:	55                   	push   %ebp
 8c5:	89 e5                	mov    %esp,%ebp
 8c7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 8c8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 8ca:	56                   	push   %esi
 8cb:	53                   	push   %ebx
 8cc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 8cf:	83 ec 1c             	sub    $0x1c,%esp
 8d2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 8d5:	83 ec 04             	sub    $0x4,%esp
 8d8:	6a 0a                	push   $0xa
 8da:	53                   	push   %ebx
 8db:	56                   	push   %esi
 8dc:	e8 af fe ff ff       	call   790 <strtol>
        if (ret < 0 || ret > 255) {
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	3d ff 00 00 00       	cmp    $0xff,%eax
 8e9:	77 3d                	ja     928 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 8eb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8ee:	39 f1                	cmp    %esi,%ecx
 8f0:	74 36                	je     928 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 8f2:	0f b6 11             	movzbl (%ecx),%edx
 8f5:	83 ff 03             	cmp    $0x3,%edi
 8f8:	74 16                	je     910 <ip_addr_pton+0x50>
 8fa:	80 fa 2e             	cmp    $0x2e,%dl
 8fd:	75 29                	jne    928 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 8ff:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 902:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 905:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 908:	83 c7 01             	add    $0x1,%edi
 90b:	eb c8                	jmp    8d5 <ip_addr_pton+0x15>
 90d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 910:	84 d2                	test   %dl,%dl
 912:	75 14                	jne    928 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 914:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 917:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 91a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 91d:	31 c0                	xor    %eax,%eax
}
 91f:	5b                   	pop    %ebx
 920:	5e                   	pop    %esi
 921:	5f                   	pop    %edi
 922:	5d                   	pop    %ebp
 923:	c3                   	ret    
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 928:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 92b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 930:	5b                   	pop    %ebx
 931:	5e                   	pop    %esi
 932:	5f                   	pop    %edi
 933:	5d                   	pop    %ebp
 934:	c3                   	ret    

00000935 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 935:	b8 01 00 00 00       	mov    $0x1,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <exit>:
SYSCALL(exit)
 93d:	b8 02 00 00 00       	mov    $0x2,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <wait>:
SYSCALL(wait)
 945:	b8 03 00 00 00       	mov    $0x3,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <pipe>:
SYSCALL(pipe)
 94d:	b8 04 00 00 00       	mov    $0x4,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <read>:
SYSCALL(read)
 955:	b8 05 00 00 00       	mov    $0x5,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <write>:
SYSCALL(write)
 95d:	b8 10 00 00 00       	mov    $0x10,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    

00000965 <close>:
SYSCALL(close)
 965:	b8 15 00 00 00       	mov    $0x15,%eax
 96a:	cd 40                	int    $0x40
 96c:	c3                   	ret    

0000096d <kill>:
SYSCALL(kill)
 96d:	b8 06 00 00 00       	mov    $0x6,%eax
 972:	cd 40                	int    $0x40
 974:	c3                   	ret    

00000975 <exec>:
SYSCALL(exec)
 975:	b8 07 00 00 00       	mov    $0x7,%eax
 97a:	cd 40                	int    $0x40
 97c:	c3                   	ret    

0000097d <open>:
SYSCALL(open)
 97d:	b8 0f 00 00 00       	mov    $0xf,%eax
 982:	cd 40                	int    $0x40
 984:	c3                   	ret    

00000985 <mknod>:
SYSCALL(mknod)
 985:	b8 11 00 00 00       	mov    $0x11,%eax
 98a:	cd 40                	int    $0x40
 98c:	c3                   	ret    

0000098d <unlink>:
SYSCALL(unlink)
 98d:	b8 12 00 00 00       	mov    $0x12,%eax
 992:	cd 40                	int    $0x40
 994:	c3                   	ret    

00000995 <fstat>:
SYSCALL(fstat)
 995:	b8 08 00 00 00       	mov    $0x8,%eax
 99a:	cd 40                	int    $0x40
 99c:	c3                   	ret    

0000099d <link>:
SYSCALL(link)
 99d:	b8 13 00 00 00       	mov    $0x13,%eax
 9a2:	cd 40                	int    $0x40
 9a4:	c3                   	ret    

000009a5 <mkdir>:
SYSCALL(mkdir)
 9a5:	b8 14 00 00 00       	mov    $0x14,%eax
 9aa:	cd 40                	int    $0x40
 9ac:	c3                   	ret    

000009ad <chdir>:
SYSCALL(chdir)
 9ad:	b8 09 00 00 00       	mov    $0x9,%eax
 9b2:	cd 40                	int    $0x40
 9b4:	c3                   	ret    

000009b5 <dup>:
SYSCALL(dup)
 9b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 9ba:	cd 40                	int    $0x40
 9bc:	c3                   	ret    

000009bd <getpid>:
SYSCALL(getpid)
 9bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 9c2:	cd 40                	int    $0x40
 9c4:	c3                   	ret    

000009c5 <sbrk>:
SYSCALL(sbrk)
 9c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 9ca:	cd 40                	int    $0x40
 9cc:	c3                   	ret    

000009cd <sleep>:
SYSCALL(sleep)
 9cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 9d2:	cd 40                	int    $0x40
 9d4:	c3                   	ret    

000009d5 <uptime>:
SYSCALL(uptime)
 9d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 9da:	cd 40                	int    $0x40
 9dc:	c3                   	ret    

000009dd <ioctl>:
# iotcl
SYSCALL(ioctl)
 9dd:	b8 16 00 00 00       	mov    $0x16,%eax
 9e2:	cd 40                	int    $0x40
 9e4:	c3                   	ret    

000009e5 <socket>:
# socket
SYSCALL(socket)
 9e5:	b8 17 00 00 00       	mov    $0x17,%eax
 9ea:	cd 40                	int    $0x40
 9ec:	c3                   	ret    

000009ed <bind>:
SYSCALL(bind)
 9ed:	b8 19 00 00 00       	mov    $0x19,%eax
 9f2:	cd 40                	int    $0x40
 9f4:	c3                   	ret    

000009f5 <listen>:
SYSCALL(listen)
 9f5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 9fa:	cd 40                	int    $0x40
 9fc:	c3                   	ret    

000009fd <accept>:
SYSCALL(accept)
 9fd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 a02:	cd 40                	int    $0x40
 a04:	c3                   	ret    

00000a05 <recv>:
SYSCALL(recv)
 a05:	b8 1c 00 00 00       	mov    $0x1c,%eax
 a0a:	cd 40                	int    $0x40
 a0c:	c3                   	ret    

00000a0d <send>:
SYSCALL(send)
 a0d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 a12:	cd 40                	int    $0x40
 a14:	c3                   	ret    

00000a15 <recvfrom>:
SYSCALL(recvfrom)
 a15:	b8 1e 00 00 00       	mov    $0x1e,%eax
 a1a:	cd 40                	int    $0x40
 a1c:	c3                   	ret    

00000a1d <sendto>:
SYSCALL(sendto)
 a1d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 a22:	cd 40                	int    $0x40
 a24:	c3                   	ret    
 a25:	66 90                	xchg   %ax,%ax
 a27:	66 90                	xchg   %ax,%ax
 a29:	66 90                	xchg   %ax,%ax
 a2b:	66 90                	xchg   %ax,%ax
 a2d:	66 90                	xchg   %ax,%ax
 a2f:	90                   	nop

00000a30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	57                   	push   %edi
 a34:	56                   	push   %esi
 a35:	53                   	push   %ebx
 a36:	83 ec 3c             	sub    $0x3c,%esp
 a39:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 a3c:	89 d1                	mov    %edx,%ecx
{
 a3e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 a41:	85 d2                	test   %edx,%edx
 a43:	0f 89 7f 00 00 00    	jns    ac8 <printint+0x98>
 a49:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 a4d:	74 79                	je     ac8 <printint+0x98>
    neg = 1;
 a4f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 a56:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 a58:	31 db                	xor    %ebx,%ebx
 a5a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 a5d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 a60:	89 c8                	mov    %ecx,%eax
 a62:	31 d2                	xor    %edx,%edx
 a64:	89 cf                	mov    %ecx,%edi
 a66:	f7 75 c4             	divl   -0x3c(%ebp)
 a69:	0f b6 92 a8 0f 00 00 	movzbl 0xfa8(%edx),%edx
 a70:	89 45 c0             	mov    %eax,-0x40(%ebp)
 a73:	89 d8                	mov    %ebx,%eax
 a75:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 a78:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 a7b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 a7e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 a81:	76 dd                	jbe    a60 <printint+0x30>
  if(neg)
 a83:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 a86:	85 c9                	test   %ecx,%ecx
 a88:	74 0c                	je     a96 <printint+0x66>
    buf[i++] = '-';
 a8a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 a8f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 a91:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 a96:	8b 7d b8             	mov    -0x48(%ebp),%edi
 a99:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 a9d:	eb 07                	jmp    aa6 <printint+0x76>
 a9f:	90                   	nop
 aa0:	0f b6 13             	movzbl (%ebx),%edx
 aa3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 aa6:	83 ec 04             	sub    $0x4,%esp
 aa9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 aac:	6a 01                	push   $0x1
 aae:	56                   	push   %esi
 aaf:	57                   	push   %edi
 ab0:	e8 a8 fe ff ff       	call   95d <write>
  while(--i >= 0)
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	39 de                	cmp    %ebx,%esi
 aba:	75 e4                	jne    aa0 <printint+0x70>
    putc(fd, buf[i]);
}
 abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 abf:	5b                   	pop    %ebx
 ac0:	5e                   	pop    %esi
 ac1:	5f                   	pop    %edi
 ac2:	5d                   	pop    %ebp
 ac3:	c3                   	ret    
 ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 ac8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 acf:	eb 87                	jmp    a58 <printint+0x28>
 ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 adf:	90                   	nop

00000ae0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 ae0:	f3 0f 1e fb          	endbr32 
 ae4:	55                   	push   %ebp
 ae5:	89 e5                	mov    %esp,%ebp
 ae7:	57                   	push   %edi
 ae8:	56                   	push   %esi
 ae9:	53                   	push   %ebx
 aea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 aed:	8b 75 0c             	mov    0xc(%ebp),%esi
 af0:	0f b6 1e             	movzbl (%esi),%ebx
 af3:	84 db                	test   %bl,%bl
 af5:	0f 84 b4 00 00 00    	je     baf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 afb:	8d 45 10             	lea    0x10(%ebp),%eax
 afe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 b01:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 b04:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 b06:	89 45 d0             	mov    %eax,-0x30(%ebp)
 b09:	eb 33                	jmp    b3e <printf+0x5e>
 b0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b0f:	90                   	nop
 b10:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 b13:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 b18:	83 f8 25             	cmp    $0x25,%eax
 b1b:	74 17                	je     b34 <printf+0x54>
  write(fd, &c, 1);
 b1d:	83 ec 04             	sub    $0x4,%esp
 b20:	88 5d e7             	mov    %bl,-0x19(%ebp)
 b23:	6a 01                	push   $0x1
 b25:	57                   	push   %edi
 b26:	ff 75 08             	pushl  0x8(%ebp)
 b29:	e8 2f fe ff ff       	call   95d <write>
 b2e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 b31:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 b34:	0f b6 1e             	movzbl (%esi),%ebx
 b37:	83 c6 01             	add    $0x1,%esi
 b3a:	84 db                	test   %bl,%bl
 b3c:	74 71                	je     baf <printf+0xcf>
    c = fmt[i] & 0xff;
 b3e:	0f be cb             	movsbl %bl,%ecx
 b41:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 b44:	85 d2                	test   %edx,%edx
 b46:	74 c8                	je     b10 <printf+0x30>
      }
    } else if(state == '%'){
 b48:	83 fa 25             	cmp    $0x25,%edx
 b4b:	75 e7                	jne    b34 <printf+0x54>
      if(c == 'd'){
 b4d:	83 f8 64             	cmp    $0x64,%eax
 b50:	0f 84 9a 00 00 00    	je     bf0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b56:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 b5c:	83 f9 70             	cmp    $0x70,%ecx
 b5f:	74 5f                	je     bc0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b61:	83 f8 73             	cmp    $0x73,%eax
 b64:	0f 84 d6 00 00 00    	je     c40 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b6a:	83 f8 63             	cmp    $0x63,%eax
 b6d:	0f 84 8d 00 00 00    	je     c00 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b73:	83 f8 25             	cmp    $0x25,%eax
 b76:	0f 84 b4 00 00 00    	je     c30 <printf+0x150>
  write(fd, &c, 1);
 b7c:	83 ec 04             	sub    $0x4,%esp
 b7f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 b83:	6a 01                	push   $0x1
 b85:	57                   	push   %edi
 b86:	ff 75 08             	pushl  0x8(%ebp)
 b89:	e8 cf fd ff ff       	call   95d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 b8e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b91:	83 c4 0c             	add    $0xc,%esp
 b94:	6a 01                	push   $0x1
 b96:	83 c6 01             	add    $0x1,%esi
 b99:	57                   	push   %edi
 b9a:	ff 75 08             	pushl  0x8(%ebp)
 b9d:	e8 bb fd ff ff       	call   95d <write>
  for(i = 0; fmt[i]; i++){
 ba2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 ba6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 ba9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 bab:	84 db                	test   %bl,%bl
 bad:	75 8f                	jne    b3e <printf+0x5e>
    }
  }
}
 baf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 bb2:	5b                   	pop    %ebx
 bb3:	5e                   	pop    %esi
 bb4:	5f                   	pop    %edi
 bb5:	5d                   	pop    %ebp
 bb6:	c3                   	ret    
 bb7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bbe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 bc0:	83 ec 0c             	sub    $0xc,%esp
 bc3:	b9 10 00 00 00       	mov    $0x10,%ecx
 bc8:	6a 00                	push   $0x0
 bca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 bcd:	8b 45 08             	mov    0x8(%ebp),%eax
 bd0:	8b 13                	mov    (%ebx),%edx
 bd2:	e8 59 fe ff ff       	call   a30 <printint>
        ap++;
 bd7:	89 d8                	mov    %ebx,%eax
 bd9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 bdc:	31 d2                	xor    %edx,%edx
        ap++;
 bde:	83 c0 04             	add    $0x4,%eax
 be1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 be4:	e9 4b ff ff ff       	jmp    b34 <printf+0x54>
 be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 bf0:	83 ec 0c             	sub    $0xc,%esp
 bf3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 bf8:	6a 01                	push   $0x1
 bfa:	eb ce                	jmp    bca <printf+0xea>
 bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 c00:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 c03:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 c06:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 c08:	6a 01                	push   $0x1
        ap++;
 c0a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 c0d:	57                   	push   %edi
 c0e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 c11:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 c14:	e8 44 fd ff ff       	call   95d <write>
        ap++;
 c19:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 c1c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 c1f:	31 d2                	xor    %edx,%edx
 c21:	e9 0e ff ff ff       	jmp    b34 <printf+0x54>
 c26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c2d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 c30:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 c33:	83 ec 04             	sub    $0x4,%esp
 c36:	e9 59 ff ff ff       	jmp    b94 <printf+0xb4>
 c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c3f:	90                   	nop
        s = (char*)*ap;
 c40:	8b 45 d0             	mov    -0x30(%ebp),%eax
 c43:	8b 18                	mov    (%eax),%ebx
        ap++;
 c45:	83 c0 04             	add    $0x4,%eax
 c48:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 c4b:	85 db                	test   %ebx,%ebx
 c4d:	74 17                	je     c66 <printf+0x186>
        while(*s != 0){
 c4f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 c52:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 c54:	84 c0                	test   %al,%al
 c56:	0f 84 d8 fe ff ff    	je     b34 <printf+0x54>
 c5c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 c5f:	89 de                	mov    %ebx,%esi
 c61:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c64:	eb 1a                	jmp    c80 <printf+0x1a0>
          s = "(null)";
 c66:	bb a0 0f 00 00       	mov    $0xfa0,%ebx
        while(*s != 0){
 c6b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 c6e:	b8 28 00 00 00       	mov    $0x28,%eax
 c73:	89 de                	mov    %ebx,%esi
 c75:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c7f:	90                   	nop
  write(fd, &c, 1);
 c80:	83 ec 04             	sub    $0x4,%esp
          s++;
 c83:	83 c6 01             	add    $0x1,%esi
 c86:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 c89:	6a 01                	push   $0x1
 c8b:	57                   	push   %edi
 c8c:	53                   	push   %ebx
 c8d:	e8 cb fc ff ff       	call   95d <write>
        while(*s != 0){
 c92:	0f b6 06             	movzbl (%esi),%eax
 c95:	83 c4 10             	add    $0x10,%esp
 c98:	84 c0                	test   %al,%al
 c9a:	75 e4                	jne    c80 <printf+0x1a0>
 c9c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 c9f:	31 d2                	xor    %edx,%edx
 ca1:	e9 8e fe ff ff       	jmp    b34 <printf+0x54>
 ca6:	66 90                	xchg   %ax,%ax
 ca8:	66 90                	xchg   %ax,%ax
 caa:	66 90                	xchg   %ax,%ax
 cac:	66 90                	xchg   %ax,%ax
 cae:	66 90                	xchg   %ax,%ax

00000cb0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 cb0:	f3 0f 1e fb          	endbr32 
 cb4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cb5:	a1 a4 13 00 00       	mov    0x13a4,%eax
{
 cba:	89 e5                	mov    %esp,%ebp
 cbc:	57                   	push   %edi
 cbd:	56                   	push   %esi
 cbe:	53                   	push   %ebx
 cbf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 cc2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 cc4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cc7:	39 c8                	cmp    %ecx,%eax
 cc9:	73 15                	jae    ce0 <free+0x30>
 ccb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ccf:	90                   	nop
 cd0:	39 d1                	cmp    %edx,%ecx
 cd2:	72 14                	jb     ce8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cd4:	39 d0                	cmp    %edx,%eax
 cd6:	73 10                	jae    ce8 <free+0x38>
{
 cd8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cda:	8b 10                	mov    (%eax),%edx
 cdc:	39 c8                	cmp    %ecx,%eax
 cde:	72 f0                	jb     cd0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ce0:	39 d0                	cmp    %edx,%eax
 ce2:	72 f4                	jb     cd8 <free+0x28>
 ce4:	39 d1                	cmp    %edx,%ecx
 ce6:	73 f0                	jae    cd8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ce8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ceb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 cee:	39 fa                	cmp    %edi,%edx
 cf0:	74 1e                	je     d10 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 cf2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 cf5:	8b 50 04             	mov    0x4(%eax),%edx
 cf8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 cfb:	39 f1                	cmp    %esi,%ecx
 cfd:	74 28                	je     d27 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 cff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 d01:	5b                   	pop    %ebx
  freep = p;
 d02:	a3 a4 13 00 00       	mov    %eax,0x13a4
}
 d07:	5e                   	pop    %esi
 d08:	5f                   	pop    %edi
 d09:	5d                   	pop    %ebp
 d0a:	c3                   	ret    
 d0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d0f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 d10:	03 72 04             	add    0x4(%edx),%esi
 d13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 d16:	8b 10                	mov    (%eax),%edx
 d18:	8b 12                	mov    (%edx),%edx
 d1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 d1d:	8b 50 04             	mov    0x4(%eax),%edx
 d20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 d23:	39 f1                	cmp    %esi,%ecx
 d25:	75 d8                	jne    cff <free+0x4f>
    p->s.size += bp->s.size;
 d27:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 d2a:	a3 a4 13 00 00       	mov    %eax,0x13a4
    p->s.size += bp->s.size;
 d2f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d32:	8b 53 f8             	mov    -0x8(%ebx),%edx
 d35:	89 10                	mov    %edx,(%eax)
}
 d37:	5b                   	pop    %ebx
 d38:	5e                   	pop    %esi
 d39:	5f                   	pop    %edi
 d3a:	5d                   	pop    %ebp
 d3b:	c3                   	ret    
 d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d40:	f3 0f 1e fb          	endbr32 
 d44:	55                   	push   %ebp
 d45:	89 e5                	mov    %esp,%ebp
 d47:	57                   	push   %edi
 d48:	56                   	push   %esi
 d49:	53                   	push   %ebx
 d4a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 d50:	8b 3d a4 13 00 00    	mov    0x13a4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d56:	8d 70 07             	lea    0x7(%eax),%esi
 d59:	c1 ee 03             	shr    $0x3,%esi
 d5c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 d5f:	85 ff                	test   %edi,%edi
 d61:	0f 84 a9 00 00 00    	je     e10 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d67:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 d69:	8b 48 04             	mov    0x4(%eax),%ecx
 d6c:	39 f1                	cmp    %esi,%ecx
 d6e:	73 6d                	jae    ddd <malloc+0x9d>
 d70:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 d76:	bb 00 10 00 00       	mov    $0x1000,%ebx
 d7b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 d7e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 d85:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 d88:	eb 17                	jmp    da1 <malloc+0x61>
 d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d90:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 d92:	8b 4a 04             	mov    0x4(%edx),%ecx
 d95:	39 f1                	cmp    %esi,%ecx
 d97:	73 4f                	jae    de8 <malloc+0xa8>
 d99:	8b 3d a4 13 00 00    	mov    0x13a4,%edi
 d9f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 da1:	39 c7                	cmp    %eax,%edi
 da3:	75 eb                	jne    d90 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 da5:	83 ec 0c             	sub    $0xc,%esp
 da8:	ff 75 e4             	pushl  -0x1c(%ebp)
 dab:	e8 15 fc ff ff       	call   9c5 <sbrk>
  if(p == (char*)-1)
 db0:	83 c4 10             	add    $0x10,%esp
 db3:	83 f8 ff             	cmp    $0xffffffff,%eax
 db6:	74 1b                	je     dd3 <malloc+0x93>
  hp->s.size = nu;
 db8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 dbb:	83 ec 0c             	sub    $0xc,%esp
 dbe:	83 c0 08             	add    $0x8,%eax
 dc1:	50                   	push   %eax
 dc2:	e8 e9 fe ff ff       	call   cb0 <free>
  return freep;
 dc7:	a1 a4 13 00 00       	mov    0x13a4,%eax
      if((p = morecore(nunits)) == 0)
 dcc:	83 c4 10             	add    $0x10,%esp
 dcf:	85 c0                	test   %eax,%eax
 dd1:	75 bd                	jne    d90 <malloc+0x50>
        return 0;
  }
}
 dd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 dd6:	31 c0                	xor    %eax,%eax
}
 dd8:	5b                   	pop    %ebx
 dd9:	5e                   	pop    %esi
 dda:	5f                   	pop    %edi
 ddb:	5d                   	pop    %ebp
 ddc:	c3                   	ret    
    if(p->s.size >= nunits){
 ddd:	89 c2                	mov    %eax,%edx
 ddf:	89 f8                	mov    %edi,%eax
 de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 de8:	39 ce                	cmp    %ecx,%esi
 dea:	74 54                	je     e40 <malloc+0x100>
        p->s.size -= nunits;
 dec:	29 f1                	sub    %esi,%ecx
 dee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 df1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 df4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 df7:	a3 a4 13 00 00       	mov    %eax,0x13a4
}
 dfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 dff:	8d 42 08             	lea    0x8(%edx),%eax
}
 e02:	5b                   	pop    %ebx
 e03:	5e                   	pop    %esi
 e04:	5f                   	pop    %edi
 e05:	5d                   	pop    %ebp
 e06:	c3                   	ret    
 e07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 e0e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 e10:	c7 05 a4 13 00 00 a8 	movl   $0x13a8,0x13a4
 e17:	13 00 00 
    base.s.size = 0;
 e1a:	bf a8 13 00 00       	mov    $0x13a8,%edi
    base.s.ptr = freep = prevp = &base;
 e1f:	c7 05 a8 13 00 00 a8 	movl   $0x13a8,0x13a8
 e26:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e29:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 e2b:	c7 05 ac 13 00 00 00 	movl   $0x0,0x13ac
 e32:	00 00 00 
    if(p->s.size >= nunits){
 e35:	e9 36 ff ff ff       	jmp    d70 <malloc+0x30>
 e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 e40:	8b 0a                	mov    (%edx),%ecx
 e42:	89 08                	mov    %ecx,(%eax)
 e44:	eb b1                	jmp    df7 <malloc+0xb7>
