
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
  1b:	68 08 0e 00 00       	push   $0xe08
  20:	6a 01                	push   $0x1
  22:	e8 79 0a 00 00       	call   aa0 <printf>
    soc = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	6a 02                	push   $0x2
  2e:	6a 02                	push   $0x2
  30:	e8 70 09 00 00       	call   9a5 <socket>
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
  45:	68 33 0e 00 00       	push   $0xe33
  4a:	6a 01                	push   $0x1
  4c:	e8 4f 0a 00 00       	call   aa0 <printf>
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
  6b:	e8 40 06 00 00       	call   6b0 <hton16>
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  70:	83 c4 0c             	add    $0xc,%esp
    self.sin_port = hton16(7);
  73:	66 89 85 da f7 ff ff 	mov    %ax,-0x826(%ebp)
    if (bind(soc, (struct sockaddr *)&self, sizeof(self)) == -1) {
  7a:	8d 85 d8 f7 ff ff    	lea    -0x828(%ebp),%eax
  80:	6a 08                	push   $0x8
  82:	50                   	push   %eax
  83:	56                   	push   %esi
  84:	e8 24 09 00 00       	call   9ad <bind>
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
  a6:	e8 45 06 00 00       	call   6f0 <ntoh16>
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
  d2:	68 78 0e 00 00       	push   $0xe78
  d7:	6a 01                	push   $0x1
  d9:	e8 c2 09 00 00       	call   aa0 <printf>
    printf(1, "waiting for message...\n");
  de:	83 c4 18             	add    $0x18,%esp
  e1:	68 5b 0e 00 00       	push   $0xe5b
  e6:	6a 01                	push   $0x1
  e8:	e8 b3 09 00 00       	call   aa0 <printf>
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
 103:	e8 e8 05 00 00       	call   6f0 <ntoh16>
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
 12d:	68 9c 0e 00 00       	push   $0xe9c
 132:	6a 01                	push   $0x1
 134:	e8 67 09 00 00       	call   aa0 <printf>
        hexdump(buf, ret);
 139:	83 c4 28             	add    $0x28,%esp
 13c:	53                   	push   %ebx
 13d:	57                   	push   %edi
 13e:	e8 4d 03 00 00       	call   490 <hexdump>
        sendto(soc, buf, ret, (struct sockaddr *)&peer, peerlen);
 143:	58                   	pop    %eax
 144:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
 14a:	ff b5 d4 f7 ff ff    	pushl  -0x82c(%ebp)
 150:	50                   	push   %eax
 151:	53                   	push   %ebx
 152:	57                   	push   %edi
 153:	56                   	push   %esi
 154:	e8 84 08 00 00       	call   9dd <sendto>
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
 17e:	e8 52 08 00 00       	call   9d5 <recvfrom>
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
 192:	68 73 0e 00 00       	push   $0xe73
 197:	6a 01                	push   $0x1
 199:	e8 02 09 00 00       	call   aa0 <printf>
    }
    close(soc);  
 19e:	89 34 24             	mov    %esi,(%esp)
 1a1:	e8 7f 07 00 00       	call   925 <close>
    exit();
 1a6:	e8 52 07 00 00       	call   8fd <exit>
        printf(1, "bind: failure\n");
 1ab:	51                   	push   %ecx
 1ac:	51                   	push   %ecx
 1ad:	68 4c 0e 00 00       	push   $0xe4c
 1b2:	eb e3                	jmp    197 <main+0x197>
        printf(1, "socket: failure\n");
 1b4:	56                   	push   %esi
 1b5:	56                   	push   %esi
 1b6:	68 22 0e 00 00       	push   $0xe22
 1bb:	6a 01                	push   $0x1
 1bd:	e8 de 08 00 00       	call   aa0 <printf>
        exit();
 1c2:	e8 36 07 00 00       	call   8fd <exit>
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

00000200 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	8b 7d 10             	mov    0x10(%ebp),%edi
 20b:	56                   	push   %esi
 20c:	8b 75 08             	mov    0x8(%ebp),%esi
 20f:	53                   	push   %ebx
 210:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 213:	85 ff                	test   %edi,%edi
 215:	74 39                	je     250 <strcat_s+0x50>
 217:	31 c0                	xor    %eax,%eax
 219:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 21e:	eb 11                	jmp    231 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 220:	0f b6 12             	movzbl (%edx),%edx
 223:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 226:	84 d2                	test   %dl,%dl
 228:	74 26                	je     250 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 22a:	83 c0 01             	add    $0x1,%eax
 22d:	39 c7                	cmp    %eax,%edi
 22f:	74 1f                	je     250 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 231:	89 c2                	mov    %eax,%edx
 233:	29 ca                	sub    %ecx,%edx
 235:	01 da                	add    %ebx,%edx
 237:	83 f9 ff             	cmp    $0xffffffff,%ecx
 23a:	75 e4                	jne    220 <strcat_s+0x20>
 23c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 240:	75 e8                	jne    22a <strcat_s+0x2a>
 242:	89 da                	mov    %ebx,%edx
 244:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 246:	0f b6 12             	movzbl (%edx),%edx
 249:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 24c:	84 d2                	test   %dl,%dl
 24e:	75 da                	jne    22a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 250:	5b                   	pop    %ebx
 251:	89 f0                	mov    %esi,%eax
 253:	5e                   	pop    %esi
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

00000260 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 26e:	0f b6 01             	movzbl (%ecx),%eax
 271:	0f b6 1a             	movzbl (%edx),%ebx
 274:	84 c0                	test   %al,%al
 276:	75 19                	jne    291 <strcmp+0x31>
 278:	eb 26                	jmp    2a0 <strcmp+0x40>
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 280:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 284:	83 c1 01             	add    $0x1,%ecx
 287:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 28a:	0f b6 1a             	movzbl (%edx),%ebx
 28d:	84 c0                	test   %al,%al
 28f:	74 0f                	je     2a0 <strcmp+0x40>
 291:	38 d8                	cmp    %bl,%al
 293:	74 eb                	je     280 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 295:	29 d8                	sub    %ebx,%eax
}
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2a2:	29 d8                	sub    %ebx,%eax
}
 2a4:	5b                   	pop    %ebx
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <strlen>:

uint
strlen(const char *s)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2ba:	80 3a 00             	cmpb   $0x0,(%edx)
 2bd:	74 21                	je     2e0 <strlen+0x30>
 2bf:	31 c0                	xor    %eax,%eax
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	83 c0 01             	add    $0x1,%eax
 2cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2cf:	89 c1                	mov    %eax,%ecx
 2d1:	75 f5                	jne    2c8 <strlen+0x18>
    ;
  return n;
}
 2d3:	89 c8                	mov    %ecx,%eax
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 2e0:	31 c9                	xor    %ecx,%ecx
}
 2e2:	5d                   	pop    %ebp
 2e3:	89 c8                	mov    %ecx,%eax
 2e5:	c3                   	ret    
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	57                   	push   %edi
 2f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 301:	89 d7                	mov    %edx,%edi
 303:	fc                   	cld    
 304:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 306:	89 d0                	mov    %edx,%eax
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <strchr>:

char*
strchr(const char *s, char c)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 31e:	0f b6 10             	movzbl (%eax),%edx
 321:	84 d2                	test   %dl,%dl
 323:	75 16                	jne    33b <strchr+0x2b>
 325:	eb 21                	jmp    348 <strchr+0x38>
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax
 330:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 334:	83 c0 01             	add    $0x1,%eax
 337:	84 d2                	test   %dl,%dl
 339:	74 0d                	je     348 <strchr+0x38>
    if(*s == c)
 33b:	38 d1                	cmp    %dl,%cl
 33d:	75 f1                	jne    330 <strchr+0x20>
      return (char*)s;
  return 0;
}
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 348:	31 c0                	xor    %eax,%eax
}
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <gets>:

char*
gets(char *buf, int max)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 359:	31 f6                	xor    %esi,%esi
{
 35b:	53                   	push   %ebx
 35c:	89 f3                	mov    %esi,%ebx
 35e:	83 ec 1c             	sub    $0x1c,%esp
 361:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 364:	eb 33                	jmp    399 <gets+0x49>
 366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 370:	83 ec 04             	sub    $0x4,%esp
 373:	8d 45 e7             	lea    -0x19(%ebp),%eax
 376:	6a 01                	push   $0x1
 378:	50                   	push   %eax
 379:	6a 00                	push   $0x0
 37b:	e8 95 05 00 00       	call   915 <read>
    if(cc < 1)
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 1c                	jle    3a3 <gets+0x53>
      break;
    buf[i++] = c;
 387:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 38b:	83 c7 01             	add    $0x1,%edi
 38e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 391:	3c 0a                	cmp    $0xa,%al
 393:	74 23                	je     3b8 <gets+0x68>
 395:	3c 0d                	cmp    $0xd,%al
 397:	74 1f                	je     3b8 <gets+0x68>
  for(i=0; i+1 < max; ){
 399:	83 c3 01             	add    $0x1,%ebx
 39c:	89 fe                	mov    %edi,%esi
 39e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a1:	7c cd                	jl     370 <gets+0x20>
 3a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3a8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ae:	5b                   	pop    %ebx
 3af:	5e                   	pop    %esi
 3b0:	5f                   	pop    %edi
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	8b 75 08             	mov    0x8(%ebp),%esi
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	01 de                	add    %ebx,%esi
 3c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3c2:	c6 03 00             	movb   $0x0,(%ebx)
}
 3c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c8:	5b                   	pop    %ebx
 3c9:	5e                   	pop    %esi
 3ca:	5f                   	pop    %edi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	56                   	push   %esi
 3d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d9:	83 ec 08             	sub    $0x8,%esp
 3dc:	6a 00                	push   $0x0
 3de:	ff 75 08             	pushl  0x8(%ebp)
 3e1:	e8 57 05 00 00       	call   93d <open>
  if(fd < 0)
 3e6:	83 c4 10             	add    $0x10,%esp
 3e9:	85 c0                	test   %eax,%eax
 3eb:	78 2b                	js     418 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 3ed:	83 ec 08             	sub    $0x8,%esp
 3f0:	ff 75 0c             	pushl  0xc(%ebp)
 3f3:	89 c3                	mov    %eax,%ebx
 3f5:	50                   	push   %eax
 3f6:	e8 5a 05 00 00       	call   955 <fstat>
  close(fd);
 3fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3fe:	89 c6                	mov    %eax,%esi
  close(fd);
 400:	e8 20 05 00 00       	call   925 <close>
  return r;
 405:	83 c4 10             	add    $0x10,%esp
}
 408:	8d 65 f8             	lea    -0x8(%ebp),%esp
 40b:	89 f0                	mov    %esi,%eax
 40d:	5b                   	pop    %ebx
 40e:	5e                   	pop    %esi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 418:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41d:	eb e9                	jmp    408 <stat+0x38>
 41f:	90                   	nop

00000420 <atoi>:

int
atoi(const char *s)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 42b:	0f be 02             	movsbl (%edx),%eax
 42e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 431:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 434:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 439:	77 1a                	ja     455 <atoi+0x35>
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop
    n = n*10 + *s++ - '0';
 440:	83 c2 01             	add    $0x1,%edx
 443:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 446:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 44a:	0f be 02             	movsbl (%edx),%eax
 44d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 450:	80 fb 09             	cmp    $0x9,%bl
 453:	76 eb                	jbe    440 <atoi+0x20>
  return n;
}
 455:	89 c8                	mov    %ecx,%eax
 457:	5b                   	pop    %ebx
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	8b 45 10             	mov    0x10(%ebp),%eax
 46b:	8b 55 08             	mov    0x8(%ebp),%edx
 46e:	56                   	push   %esi
 46f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 472:	85 c0                	test   %eax,%eax
 474:	7e 0f                	jle    485 <memmove+0x25>
 476:	01 d0                	add    %edx,%eax
  dst = vdst;
 478:	89 d7                	mov    %edx,%edi
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 480:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 481:	39 f8                	cmp    %edi,%eax
 483:	75 fb                	jne    480 <memmove+0x20>
  return vdst;
}
 485:	5e                   	pop    %esi
 486:	89 d0                	mov    %edx,%eax
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	57                   	push   %edi
 498:	56                   	push   %esi
 499:	53                   	push   %ebx
 49a:	83 ec 34             	sub    $0x34,%esp
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4a0:	68 d4 0e 00 00       	push   $0xed4
hexdump (void *data, size_t size) {
 4a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 4a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4ab:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 4ad:	89 c7                	mov    %eax,%edi
 4af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 4b2:	e8 e9 05 00 00       	call   aa0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 4b7:	83 c4 10             	add    $0x10,%esp
 4ba:	85 ff                	test   %edi,%edi
 4bc:	0f 84 2d 01 00 00    	je     5ef <hexdump+0x15f>
 4c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 4cc:	be 10 00 00 00       	mov    $0x10,%esi
 4d1:	83 e8 01             	sub    $0x1,%eax
 4d4:	83 e0 f0             	and    $0xfffffff0,%eax
 4d7:	83 c0 10             	add    $0x10,%eax
 4da:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 4e0:	83 ec 08             	sub    $0x8,%esp
 4e3:	68 28 0f 00 00       	push   $0xf28
 4e8:	6a 01                	push   $0x1
 4ea:	e8 b1 05 00 00       	call   aa0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 4f9:	0f 8e 51 01 00 00    	jle    650 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 4ff:	8b 7d dc             	mov    -0x24(%ebp),%edi
 502:	83 ec 04             	sub    $0x4,%esp
 505:	57                   	push   %edi
 506:	89 fb                	mov    %edi,%ebx
 508:	68 25 0f 00 00       	push   $0xf25
 50d:	6a 01                	push   $0x1
 50f:	e8 8c 05 00 00       	call   aa0 <printf>
 514:	89 7d d8             	mov    %edi,-0x28(%ebp)
 517:	83 c4 10             	add    $0x10,%esp
 51a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 51d:	eb 28                	jmp    547 <hexdump+0xb7>
 51f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 520:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 524:	80 fa 0f             	cmp    $0xf,%dl
 527:	0f 86 e3 00 00 00    	jbe    610 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 52d:	83 ec 04             	sub    $0x4,%esp
 530:	83 c3 01             	add    $0x1,%ebx
 533:	52                   	push   %edx
 534:	68 2b 0f 00 00       	push   $0xf2b
 539:	6a 01                	push   $0x1
 53b:	e8 60 05 00 00       	call   aa0 <printf>
 540:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 543:	39 f3                	cmp    %esi,%ebx
 545:	74 1e                	je     565 <hexdump+0xd5>
      if(offset + index < (int)size) {
 547:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 54a:	7f d4                	jg     520 <hexdump+0x90>
      } else {
        printf(1, "   ");
 54c:	83 ec 08             	sub    $0x8,%esp
 54f:	83 c3 01             	add    $0x1,%ebx
 552:	68 2f 0f 00 00       	push   $0xf2f
 557:	6a 01                	push   $0x1
 559:	e8 42 05 00 00       	call   aa0 <printf>
 55e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 561:	39 f3                	cmp    %esi,%ebx
 563:	75 e2                	jne    547 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 565:	83 ec 08             	sub    $0x8,%esp
 568:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 56b:	68 28 0f 00 00       	push   $0xf28
 570:	6a 01                	push   $0x1
 572:	e8 29 05 00 00       	call   aa0 <printf>
 577:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57a:	83 c4 10             	add    $0x10,%esp
 57d:	eb 1b                	jmp    59a <hexdump+0x10a>
 57f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	52                   	push   %edx
 584:	68 33 0f 00 00       	push   $0xf33
 589:	6a 01                	push   $0x1
 58b:	e8 10 05 00 00       	call   aa0 <printf>
 590:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 593:	83 c3 01             	add    $0x1,%ebx
 596:	39 de                	cmp    %ebx,%esi
 598:	74 30                	je     5ca <hexdump+0x13a>
      if(offset + index < (int)size) {
 59a:	39 df                	cmp    %ebx,%edi
 59c:	0f 8e 8e 00 00 00    	jle    630 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 5a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 5a5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5a9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 5ac:	80 f9 5e             	cmp    $0x5e,%cl
 5af:	76 cf                	jbe    580 <hexdump+0xf0>
        } else {
          printf(1, ".");
 5b1:	83 ec 08             	sub    $0x8,%esp
 5b4:	83 c3 01             	add    $0x1,%ebx
 5b7:	68 36 0f 00 00       	push   $0xf36
 5bc:	6a 01                	push   $0x1
 5be:	e8 dd 04 00 00       	call   aa0 <printf>
 5c3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 5c6:	39 de                	cmp    %ebx,%esi
 5c8:	75 d0                	jne    59a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 5ca:	83 ec 08             	sub    $0x8,%esp
 5cd:	83 c6 10             	add    $0x10,%esi
 5d0:	68 38 0f 00 00       	push   $0xf38
 5d5:	6a 01                	push   $0x1
 5d7:	e8 c4 04 00 00       	call   aa0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 5dc:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 5e6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 5e9:	0f 85 f1 fe ff ff    	jne    4e0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5ef:	c7 45 0c d4 0e 00 00 	movl   $0xed4,0xc(%ebp)
 5f6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 5fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 600:	5b                   	pop    %ebx
 601:	5e                   	pop    %esi
 602:	5f                   	pop    %edi
 603:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 604:	e9 97 04 00 00       	jmp    aa0 <printf>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 610:	83 ec 08             	sub    $0x8,%esp
 613:	68 23 0f 00 00       	push   $0xf23
 618:	6a 01                	push   $0x1
 61a:	e8 81 04 00 00       	call   aa0 <printf>
 61f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 623:	83 c4 10             	add    $0x10,%esp
 626:	e9 02 ff ff ff       	jmp    52d <hexdump+0x9d>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
        printf(1, " ");
 630:	83 ec 08             	sub    $0x8,%esp
 633:	68 31 0f 00 00       	push   $0xf31
 638:	6a 01                	push   $0x1
 63a:	e8 61 04 00 00       	call   aa0 <printf>
 63f:	83 c4 10             	add    $0x10,%esp
 642:	e9 4c ff ff ff       	jmp    593 <hexdump+0x103>
 647:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 650:	83 ec 08             	sub    $0x8,%esp
 653:	68 23 0f 00 00       	push   $0xf23
 658:	6a 01                	push   $0x1
 65a:	e8 41 04 00 00       	call   aa0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 65f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 662:	83 c4 10             	add    $0x10,%esp
 665:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 66b:	0f 8f 8e fe ff ff    	jg     4ff <hexdump+0x6f>
 671:	83 ec 08             	sub    $0x8,%esp
 674:	68 23 0f 00 00       	push   $0xf23
 679:	6a 01                	push   $0x1
 67b:	e8 20 04 00 00       	call   aa0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 680:	83 c4 10             	add    $0x10,%esp
 683:	83 ff 0f             	cmp    $0xf,%edi
 686:	0f 8f 73 fe ff ff    	jg     4ff <hexdump+0x6f>
 68c:	83 ec 08             	sub    $0x8,%esp
 68f:	68 23 0f 00 00       	push   $0xf23
 694:	6a 01                	push   $0x1
 696:	e8 05 04 00 00       	call   aa0 <printf>
 69b:	83 c4 10             	add    $0x10,%esp
 69e:	e9 5c fe ff ff       	jmp    4ff <hexdump+0x6f>
 6a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006b0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
    if (!endian)
 6b5:	a1 3c 13 00 00       	mov    0x133c,%eax
{
 6ba:	89 e5                	mov    %esp,%ebp
 6bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 6bf:	85 c0                	test   %eax,%eax
 6c1:	75 1d                	jne    6e0 <hton16+0x30>
        endian = byteorder();
 6c3:	c7 05 3c 13 00 00 d2 	movl   $0x4d2,0x133c
 6ca:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 6cd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 6cf:	5d                   	pop    %ebp
 6d0:	66 c1 c2 08          	rol    $0x8,%dx
 6d4:	89 d0                	mov    %edx,%eax
 6d6:	c3                   	ret    
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax
 6e0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 6e2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 6e7:	74 e4                	je     6cd <hton16+0x1d>
}
 6e9:	89 d0                	mov    %edx,%eax
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret    
 6ed:	8d 76 00             	lea    0x0(%esi),%esi

000006f0 <ntoh16>:
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	eb ba                	jmp    6b0 <hton16>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi

00000700 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 700:	f3 0f 1e fb          	endbr32 
 704:	55                   	push   %ebp
    if (!endian)
 705:	8b 15 3c 13 00 00    	mov    0x133c,%edx
{
 70b:	89 e5                	mov    %esp,%ebp
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 710:	85 d2                	test   %edx,%edx
 712:	75 14                	jne    728 <hton32+0x28>
        endian = byteorder();
 714:	c7 05 3c 13 00 00 d2 	movl   $0x4d2,0x133c
 71b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 71e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 720:	5d                   	pop    %ebp
 721:	c3                   	ret    
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 728:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 72e:	74 ee                	je     71e <hton32+0x1e>
}
 730:	5d                   	pop    %ebp
 731:	c3                   	ret    
 732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000740 <ntoh32>:
 740:	f3 0f 1e fb          	endbr32 
 744:	eb ba                	jmp    700 <hton32>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi

00000750 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 750:	f3 0f 1e fb          	endbr32 
 754:	55                   	push   %ebp
 755:	89 e5                	mov    %esp,%ebp
 757:	57                   	push   %edi
 758:	8b 4d 08             	mov    0x8(%ebp),%ecx
 75b:	56                   	push   %esi
 75c:	53                   	push   %ebx
 75d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 760:	0f b6 01             	movzbl (%ecx),%eax
 763:	3c 09                	cmp    $0x9,%al
 765:	74 09                	je     770 <strtol+0x20>
 767:	3c 20                	cmp    $0x20,%al
 769:	75 14                	jne    77f <strtol+0x2f>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
 770:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 774:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 777:	3c 20                	cmp    $0x20,%al
 779:	74 f5                	je     770 <strtol+0x20>
 77b:	3c 09                	cmp    $0x9,%al
 77d:	74 f1                	je     770 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 77f:	3c 2b                	cmp    $0x2b,%al
 781:	0f 84 a9 00 00 00    	je     830 <strtol+0xe0>
    int neg = 0;
 787:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 789:	3c 2d                	cmp    $0x2d,%al
 78b:	0f 84 8f 00 00 00    	je     820 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 791:	0f be 11             	movsbl (%ecx),%edx
 794:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 79a:	75 12                	jne    7ae <strtol+0x5e>
 79c:	80 fa 30             	cmp    $0x30,%dl
 79f:	0f 84 9b 00 00 00    	je     840 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 7a5:	85 db                	test   %ebx,%ebx
 7a7:	75 05                	jne    7ae <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 7a9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 7ae:	89 5d 10             	mov    %ebx,0x10(%ebp)
 7b1:	31 c0                	xor    %eax,%eax
 7b3:	eb 17                	jmp    7cc <strtol+0x7c>
 7b5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 7b8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 7bb:	3b 55 10             	cmp    0x10(%ebp),%edx
 7be:	7d 28                	jge    7e8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 7c0:	0f af 45 10          	imul   0x10(%ebp),%eax
 7c4:	83 c1 01             	add    $0x1,%ecx
 7c7:	01 d0                	add    %edx,%eax
    while (1) {
 7c9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 7cc:	8d 72 d0             	lea    -0x30(%edx),%esi
 7cf:	89 f3                	mov    %esi,%ebx
 7d1:	80 fb 09             	cmp    $0x9,%bl
 7d4:	76 e2                	jbe    7b8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 7d6:	8d 72 9f             	lea    -0x61(%edx),%esi
 7d9:	89 f3                	mov    %esi,%ebx
 7db:	80 fb 19             	cmp    $0x19,%bl
 7de:	77 28                	ja     808 <strtol+0xb8>
            dig = *s - 'a' + 10;
 7e0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 7e3:	3b 55 10             	cmp    0x10(%ebp),%edx
 7e6:	7c d8                	jl     7c0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 7e8:	8b 55 0c             	mov    0xc(%ebp),%edx
 7eb:	85 d2                	test   %edx,%edx
 7ed:	74 05                	je     7f4 <strtol+0xa4>
        *endptr = (char *) s;
 7ef:	8b 75 0c             	mov    0xc(%ebp),%esi
 7f2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 7f4:	89 c2                	mov    %eax,%edx
}
 7f6:	5b                   	pop    %ebx
 7f7:	5e                   	pop    %esi
    return (neg ? -val : val);
 7f8:	f7 da                	neg    %edx
 7fa:	85 ff                	test   %edi,%edi
}
 7fc:	5f                   	pop    %edi
 7fd:	5d                   	pop    %ebp
    return (neg ? -val : val);
 7fe:	0f 45 c2             	cmovne %edx,%eax
}
 801:	c3                   	ret    
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 808:	8d 72 bf             	lea    -0x41(%edx),%esi
 80b:	89 f3                	mov    %esi,%ebx
 80d:	80 fb 19             	cmp    $0x19,%bl
 810:	77 d6                	ja     7e8 <strtol+0x98>
            dig = *s - 'A' + 10;
 812:	83 ea 37             	sub    $0x37,%edx
 815:	eb a4                	jmp    7bb <strtol+0x6b>
 817:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 820:	83 c1 01             	add    $0x1,%ecx
 823:	bf 01 00 00 00       	mov    $0x1,%edi
 828:	e9 64 ff ff ff       	jmp    791 <strtol+0x41>
 82d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 830:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 833:	31 ff                	xor    %edi,%edi
 835:	e9 57 ff ff ff       	jmp    791 <strtol+0x41>
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 840:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 844:	3c 78                	cmp    $0x78,%al
 846:	74 18                	je     860 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 848:	85 db                	test   %ebx,%ebx
 84a:	0f 85 5e ff ff ff    	jne    7ae <strtol+0x5e>
        s++, base = 8;
 850:	83 c1 01             	add    $0x1,%ecx
 853:	0f be d0             	movsbl %al,%edx
 856:	bb 08 00 00 00       	mov    $0x8,%ebx
 85b:	e9 4e ff ff ff       	jmp    7ae <strtol+0x5e>
        s += 2, base = 16;
 860:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 864:	bb 10 00 00 00       	mov    $0x10,%ebx
 869:	83 c1 02             	add    $0x2,%ecx
 86c:	e9 3d ff ff ff       	jmp    7ae <strtol+0x5e>
 871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop

00000880 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 880:	f3 0f 1e fb          	endbr32 
 884:	55                   	push   %ebp
 885:	89 e5                	mov    %esp,%ebp
 887:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 888:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 88a:	56                   	push   %esi
 88b:	53                   	push   %ebx
 88c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 88f:	83 ec 1c             	sub    $0x1c,%esp
 892:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 895:	83 ec 04             	sub    $0x4,%esp
 898:	6a 0a                	push   $0xa
 89a:	53                   	push   %ebx
 89b:	56                   	push   %esi
 89c:	e8 af fe ff ff       	call   750 <strtol>
        if (ret < 0 || ret > 255) {
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	3d ff 00 00 00       	cmp    $0xff,%eax
 8a9:	77 3d                	ja     8e8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 8ab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8ae:	39 f1                	cmp    %esi,%ecx
 8b0:	74 36                	je     8e8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 8b2:	0f b6 11             	movzbl (%ecx),%edx
 8b5:	83 ff 03             	cmp    $0x3,%edi
 8b8:	74 16                	je     8d0 <ip_addr_pton+0x50>
 8ba:	80 fa 2e             	cmp    $0x2e,%dl
 8bd:	75 29                	jne    8e8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 8bf:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 8c2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 8c5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 8c8:	83 c7 01             	add    $0x1,%edi
 8cb:	eb c8                	jmp    895 <ip_addr_pton+0x15>
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 8d0:	84 d2                	test   %dl,%dl
 8d2:	75 14                	jne    8e8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 8d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8d7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 8da:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 8dd:	31 c0                	xor    %eax,%eax
}
 8df:	5b                   	pop    %ebx
 8e0:	5e                   	pop    %esi
 8e1:	5f                   	pop    %edi
 8e2:	5d                   	pop    %ebp
 8e3:	c3                   	ret    
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 8eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 8f0:	5b                   	pop    %ebx
 8f1:	5e                   	pop    %esi
 8f2:	5f                   	pop    %edi
 8f3:	5d                   	pop    %ebp
 8f4:	c3                   	ret    

000008f5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 8f5:	b8 01 00 00 00       	mov    $0x1,%eax
 8fa:	cd 40                	int    $0x40
 8fc:	c3                   	ret    

000008fd <exit>:
SYSCALL(exit)
 8fd:	b8 02 00 00 00       	mov    $0x2,%eax
 902:	cd 40                	int    $0x40
 904:	c3                   	ret    

00000905 <wait>:
SYSCALL(wait)
 905:	b8 03 00 00 00       	mov    $0x3,%eax
 90a:	cd 40                	int    $0x40
 90c:	c3                   	ret    

0000090d <pipe>:
SYSCALL(pipe)
 90d:	b8 04 00 00 00       	mov    $0x4,%eax
 912:	cd 40                	int    $0x40
 914:	c3                   	ret    

00000915 <read>:
SYSCALL(read)
 915:	b8 05 00 00 00       	mov    $0x5,%eax
 91a:	cd 40                	int    $0x40
 91c:	c3                   	ret    

0000091d <write>:
SYSCALL(write)
 91d:	b8 10 00 00 00       	mov    $0x10,%eax
 922:	cd 40                	int    $0x40
 924:	c3                   	ret    

00000925 <close>:
SYSCALL(close)
 925:	b8 15 00 00 00       	mov    $0x15,%eax
 92a:	cd 40                	int    $0x40
 92c:	c3                   	ret    

0000092d <kill>:
SYSCALL(kill)
 92d:	b8 06 00 00 00       	mov    $0x6,%eax
 932:	cd 40                	int    $0x40
 934:	c3                   	ret    

00000935 <exec>:
SYSCALL(exec)
 935:	b8 07 00 00 00       	mov    $0x7,%eax
 93a:	cd 40                	int    $0x40
 93c:	c3                   	ret    

0000093d <open>:
SYSCALL(open)
 93d:	b8 0f 00 00 00       	mov    $0xf,%eax
 942:	cd 40                	int    $0x40
 944:	c3                   	ret    

00000945 <mknod>:
SYSCALL(mknod)
 945:	b8 11 00 00 00       	mov    $0x11,%eax
 94a:	cd 40                	int    $0x40
 94c:	c3                   	ret    

0000094d <unlink>:
SYSCALL(unlink)
 94d:	b8 12 00 00 00       	mov    $0x12,%eax
 952:	cd 40                	int    $0x40
 954:	c3                   	ret    

00000955 <fstat>:
SYSCALL(fstat)
 955:	b8 08 00 00 00       	mov    $0x8,%eax
 95a:	cd 40                	int    $0x40
 95c:	c3                   	ret    

0000095d <link>:
SYSCALL(link)
 95d:	b8 13 00 00 00       	mov    $0x13,%eax
 962:	cd 40                	int    $0x40
 964:	c3                   	ret    

00000965 <mkdir>:
SYSCALL(mkdir)
 965:	b8 14 00 00 00       	mov    $0x14,%eax
 96a:	cd 40                	int    $0x40
 96c:	c3                   	ret    

0000096d <chdir>:
SYSCALL(chdir)
 96d:	b8 09 00 00 00       	mov    $0x9,%eax
 972:	cd 40                	int    $0x40
 974:	c3                   	ret    

00000975 <dup>:
SYSCALL(dup)
 975:	b8 0a 00 00 00       	mov    $0xa,%eax
 97a:	cd 40                	int    $0x40
 97c:	c3                   	ret    

0000097d <getpid>:
SYSCALL(getpid)
 97d:	b8 0b 00 00 00       	mov    $0xb,%eax
 982:	cd 40                	int    $0x40
 984:	c3                   	ret    

00000985 <sbrk>:
SYSCALL(sbrk)
 985:	b8 0c 00 00 00       	mov    $0xc,%eax
 98a:	cd 40                	int    $0x40
 98c:	c3                   	ret    

0000098d <sleep>:
SYSCALL(sleep)
 98d:	b8 0d 00 00 00       	mov    $0xd,%eax
 992:	cd 40                	int    $0x40
 994:	c3                   	ret    

00000995 <uptime>:
SYSCALL(uptime)
 995:	b8 0e 00 00 00       	mov    $0xe,%eax
 99a:	cd 40                	int    $0x40
 99c:	c3                   	ret    

0000099d <ioctl>:
# iotcl
SYSCALL(ioctl)
 99d:	b8 16 00 00 00       	mov    $0x16,%eax
 9a2:	cd 40                	int    $0x40
 9a4:	c3                   	ret    

000009a5 <socket>:
# socket
SYSCALL(socket)
 9a5:	b8 17 00 00 00       	mov    $0x17,%eax
 9aa:	cd 40                	int    $0x40
 9ac:	c3                   	ret    

000009ad <bind>:
SYSCALL(bind)
 9ad:	b8 19 00 00 00       	mov    $0x19,%eax
 9b2:	cd 40                	int    $0x40
 9b4:	c3                   	ret    

000009b5 <listen>:
SYSCALL(listen)
 9b5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 9ba:	cd 40                	int    $0x40
 9bc:	c3                   	ret    

000009bd <accept>:
SYSCALL(accept)
 9bd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 9c2:	cd 40                	int    $0x40
 9c4:	c3                   	ret    

000009c5 <recv>:
SYSCALL(recv)
 9c5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 9ca:	cd 40                	int    $0x40
 9cc:	c3                   	ret    

000009cd <send>:
SYSCALL(send)
 9cd:	b8 1d 00 00 00       	mov    $0x1d,%eax
 9d2:	cd 40                	int    $0x40
 9d4:	c3                   	ret    

000009d5 <recvfrom>:
SYSCALL(recvfrom)
 9d5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 9da:	cd 40                	int    $0x40
 9dc:	c3                   	ret    

000009dd <sendto>:
SYSCALL(sendto)
 9dd:	b8 1f 00 00 00       	mov    $0x1f,%eax
 9e2:	cd 40                	int    $0x40
 9e4:	c3                   	ret    
 9e5:	66 90                	xchg   %ax,%ax
 9e7:	66 90                	xchg   %ax,%ax
 9e9:	66 90                	xchg   %ax,%ax
 9eb:	66 90                	xchg   %ax,%ax
 9ed:	66 90                	xchg   %ax,%ax
 9ef:	90                   	nop

000009f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	83 ec 3c             	sub    $0x3c,%esp
 9f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 9fc:	89 d1                	mov    %edx,%ecx
{
 9fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 a01:	85 d2                	test   %edx,%edx
 a03:	0f 89 7f 00 00 00    	jns    a88 <printint+0x98>
 a09:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 a0d:	74 79                	je     a88 <printint+0x98>
    neg = 1;
 a0f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 a16:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 a18:	31 db                	xor    %ebx,%ebx
 a1a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 a20:	89 c8                	mov    %ecx,%eax
 a22:	31 d2                	xor    %edx,%edx
 a24:	89 cf                	mov    %ecx,%edi
 a26:	f7 75 c4             	divl   -0x3c(%ebp)
 a29:	0f b6 92 44 0f 00 00 	movzbl 0xf44(%edx),%edx
 a30:	89 45 c0             	mov    %eax,-0x40(%ebp)
 a33:	89 d8                	mov    %ebx,%eax
 a35:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 a38:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 a3b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 a3e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 a41:	76 dd                	jbe    a20 <printint+0x30>
  if(neg)
 a43:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 a46:	85 c9                	test   %ecx,%ecx
 a48:	74 0c                	je     a56 <printint+0x66>
    buf[i++] = '-';
 a4a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 a4f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 a51:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 a56:	8b 7d b8             	mov    -0x48(%ebp),%edi
 a59:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 a5d:	eb 07                	jmp    a66 <printint+0x76>
 a5f:	90                   	nop
 a60:	0f b6 13             	movzbl (%ebx),%edx
 a63:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 a66:	83 ec 04             	sub    $0x4,%esp
 a69:	88 55 d7             	mov    %dl,-0x29(%ebp)
 a6c:	6a 01                	push   $0x1
 a6e:	56                   	push   %esi
 a6f:	57                   	push   %edi
 a70:	e8 a8 fe ff ff       	call   91d <write>
  while(--i >= 0)
 a75:	83 c4 10             	add    $0x10,%esp
 a78:	39 de                	cmp    %ebx,%esi
 a7a:	75 e4                	jne    a60 <printint+0x70>
    putc(fd, buf[i]);
}
 a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a7f:	5b                   	pop    %ebx
 a80:	5e                   	pop    %esi
 a81:	5f                   	pop    %edi
 a82:	5d                   	pop    %ebp
 a83:	c3                   	ret    
 a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 a88:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 a8f:	eb 87                	jmp    a18 <printint+0x28>
 a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop

00000aa0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 aa0:	f3 0f 1e fb          	endbr32 
 aa4:	55                   	push   %ebp
 aa5:	89 e5                	mov    %esp,%ebp
 aa7:	57                   	push   %edi
 aa8:	56                   	push   %esi
 aa9:	53                   	push   %ebx
 aaa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 aad:	8b 75 0c             	mov    0xc(%ebp),%esi
 ab0:	0f b6 1e             	movzbl (%esi),%ebx
 ab3:	84 db                	test   %bl,%bl
 ab5:	0f 84 b4 00 00 00    	je     b6f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 abb:	8d 45 10             	lea    0x10(%ebp),%eax
 abe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 ac1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 ac4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 ac6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ac9:	eb 33                	jmp    afe <printf+0x5e>
 acb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop
 ad0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 ad3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 ad8:	83 f8 25             	cmp    $0x25,%eax
 adb:	74 17                	je     af4 <printf+0x54>
  write(fd, &c, 1);
 add:	83 ec 04             	sub    $0x4,%esp
 ae0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 ae3:	6a 01                	push   $0x1
 ae5:	57                   	push   %edi
 ae6:	ff 75 08             	pushl  0x8(%ebp)
 ae9:	e8 2f fe ff ff       	call   91d <write>
 aee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 af1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 af4:	0f b6 1e             	movzbl (%esi),%ebx
 af7:	83 c6 01             	add    $0x1,%esi
 afa:	84 db                	test   %bl,%bl
 afc:	74 71                	je     b6f <printf+0xcf>
    c = fmt[i] & 0xff;
 afe:	0f be cb             	movsbl %bl,%ecx
 b01:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 b04:	85 d2                	test   %edx,%edx
 b06:	74 c8                	je     ad0 <printf+0x30>
      }
    } else if(state == '%'){
 b08:	83 fa 25             	cmp    $0x25,%edx
 b0b:	75 e7                	jne    af4 <printf+0x54>
      if(c == 'd'){
 b0d:	83 f8 64             	cmp    $0x64,%eax
 b10:	0f 84 9a 00 00 00    	je     bb0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b16:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 b1c:	83 f9 70             	cmp    $0x70,%ecx
 b1f:	74 5f                	je     b80 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b21:	83 f8 73             	cmp    $0x73,%eax
 b24:	0f 84 d6 00 00 00    	je     c00 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b2a:	83 f8 63             	cmp    $0x63,%eax
 b2d:	0f 84 8d 00 00 00    	je     bc0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b33:	83 f8 25             	cmp    $0x25,%eax
 b36:	0f 84 b4 00 00 00    	je     bf0 <printf+0x150>
  write(fd, &c, 1);
 b3c:	83 ec 04             	sub    $0x4,%esp
 b3f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 b43:	6a 01                	push   $0x1
 b45:	57                   	push   %edi
 b46:	ff 75 08             	pushl  0x8(%ebp)
 b49:	e8 cf fd ff ff       	call   91d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 b4e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 b51:	83 c4 0c             	add    $0xc,%esp
 b54:	6a 01                	push   $0x1
 b56:	83 c6 01             	add    $0x1,%esi
 b59:	57                   	push   %edi
 b5a:	ff 75 08             	pushl  0x8(%ebp)
 b5d:	e8 bb fd ff ff       	call   91d <write>
  for(i = 0; fmt[i]; i++){
 b62:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 b66:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 b69:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 b6b:	84 db                	test   %bl,%bl
 b6d:	75 8f                	jne    afe <printf+0x5e>
    }
  }
}
 b6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b72:	5b                   	pop    %ebx
 b73:	5e                   	pop    %esi
 b74:	5f                   	pop    %edi
 b75:	5d                   	pop    %ebp
 b76:	c3                   	ret    
 b77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b7e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 b80:	83 ec 0c             	sub    $0xc,%esp
 b83:	b9 10 00 00 00       	mov    $0x10,%ecx
 b88:	6a 00                	push   $0x0
 b8a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 b8d:	8b 45 08             	mov    0x8(%ebp),%eax
 b90:	8b 13                	mov    (%ebx),%edx
 b92:	e8 59 fe ff ff       	call   9f0 <printint>
        ap++;
 b97:	89 d8                	mov    %ebx,%eax
 b99:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b9c:	31 d2                	xor    %edx,%edx
        ap++;
 b9e:	83 c0 04             	add    $0x4,%eax
 ba1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ba4:	e9 4b ff ff ff       	jmp    af4 <printf+0x54>
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 bb0:	83 ec 0c             	sub    $0xc,%esp
 bb3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 bb8:	6a 01                	push   $0x1
 bba:	eb ce                	jmp    b8a <printf+0xea>
 bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 bc0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 bc3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 bc6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 bc8:	6a 01                	push   $0x1
        ap++;
 bca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 bcd:	57                   	push   %edi
 bce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 bd1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 bd4:	e8 44 fd ff ff       	call   91d <write>
        ap++;
 bd9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 bdc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 bdf:	31 d2                	xor    %edx,%edx
 be1:	e9 0e ff ff ff       	jmp    af4 <printf+0x54>
 be6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 bf0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 bf3:	83 ec 04             	sub    $0x4,%esp
 bf6:	e9 59 ff ff ff       	jmp    b54 <printf+0xb4>
 bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bff:	90                   	nop
        s = (char*)*ap;
 c00:	8b 45 d0             	mov    -0x30(%ebp),%eax
 c03:	8b 18                	mov    (%eax),%ebx
        ap++;
 c05:	83 c0 04             	add    $0x4,%eax
 c08:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 c0b:	85 db                	test   %ebx,%ebx
 c0d:	74 17                	je     c26 <printf+0x186>
        while(*s != 0){
 c0f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 c12:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 c14:	84 c0                	test   %al,%al
 c16:	0f 84 d8 fe ff ff    	je     af4 <printf+0x54>
 c1c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 c1f:	89 de                	mov    %ebx,%esi
 c21:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c24:	eb 1a                	jmp    c40 <printf+0x1a0>
          s = "(null)";
 c26:	bb 3c 0f 00 00       	mov    $0xf3c,%ebx
        while(*s != 0){
 c2b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 c2e:	b8 28 00 00 00       	mov    $0x28,%eax
 c33:	89 de                	mov    %ebx,%esi
 c35:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c3f:	90                   	nop
  write(fd, &c, 1);
 c40:	83 ec 04             	sub    $0x4,%esp
          s++;
 c43:	83 c6 01             	add    $0x1,%esi
 c46:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 c49:	6a 01                	push   $0x1
 c4b:	57                   	push   %edi
 c4c:	53                   	push   %ebx
 c4d:	e8 cb fc ff ff       	call   91d <write>
        while(*s != 0){
 c52:	0f b6 06             	movzbl (%esi),%eax
 c55:	83 c4 10             	add    $0x10,%esp
 c58:	84 c0                	test   %al,%al
 c5a:	75 e4                	jne    c40 <printf+0x1a0>
 c5c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 c5f:	31 d2                	xor    %edx,%edx
 c61:	e9 8e fe ff ff       	jmp    af4 <printf+0x54>
 c66:	66 90                	xchg   %ax,%ax
 c68:	66 90                	xchg   %ax,%ax
 c6a:	66 90                	xchg   %ax,%ax
 c6c:	66 90                	xchg   %ax,%ax
 c6e:	66 90                	xchg   %ax,%ax

00000c70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c70:	f3 0f 1e fb          	endbr32 
 c74:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c75:	a1 40 13 00 00       	mov    0x1340,%eax
{
 c7a:	89 e5                	mov    %esp,%ebp
 c7c:	57                   	push   %edi
 c7d:	56                   	push   %esi
 c7e:	53                   	push   %ebx
 c7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c82:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 c84:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c87:	39 c8                	cmp    %ecx,%eax
 c89:	73 15                	jae    ca0 <free+0x30>
 c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c8f:	90                   	nop
 c90:	39 d1                	cmp    %edx,%ecx
 c92:	72 14                	jb     ca8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c94:	39 d0                	cmp    %edx,%eax
 c96:	73 10                	jae    ca8 <free+0x38>
{
 c98:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c9a:	8b 10                	mov    (%eax),%edx
 c9c:	39 c8                	cmp    %ecx,%eax
 c9e:	72 f0                	jb     c90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ca0:	39 d0                	cmp    %edx,%eax
 ca2:	72 f4                	jb     c98 <free+0x28>
 ca4:	39 d1                	cmp    %edx,%ecx
 ca6:	73 f0                	jae    c98 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ca8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 cab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 cae:	39 fa                	cmp    %edi,%edx
 cb0:	74 1e                	je     cd0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 cb2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 cb5:	8b 50 04             	mov    0x4(%eax),%edx
 cb8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 cbb:	39 f1                	cmp    %esi,%ecx
 cbd:	74 28                	je     ce7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 cbf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 cc1:	5b                   	pop    %ebx
  freep = p;
 cc2:	a3 40 13 00 00       	mov    %eax,0x1340
}
 cc7:	5e                   	pop    %esi
 cc8:	5f                   	pop    %edi
 cc9:	5d                   	pop    %ebp
 cca:	c3                   	ret    
 ccb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ccf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 cd0:	03 72 04             	add    0x4(%edx),%esi
 cd3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 cd6:	8b 10                	mov    (%eax),%edx
 cd8:	8b 12                	mov    (%edx),%edx
 cda:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 cdd:	8b 50 04             	mov    0x4(%eax),%edx
 ce0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ce3:	39 f1                	cmp    %esi,%ecx
 ce5:	75 d8                	jne    cbf <free+0x4f>
    p->s.size += bp->s.size;
 ce7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 cea:	a3 40 13 00 00       	mov    %eax,0x1340
    p->s.size += bp->s.size;
 cef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 cf2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 cf5:	89 10                	mov    %edx,(%eax)
}
 cf7:	5b                   	pop    %ebx
 cf8:	5e                   	pop    %esi
 cf9:	5f                   	pop    %edi
 cfa:	5d                   	pop    %ebp
 cfb:	c3                   	ret    
 cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d00:	f3 0f 1e fb          	endbr32 
 d04:	55                   	push   %ebp
 d05:	89 e5                	mov    %esp,%ebp
 d07:	57                   	push   %edi
 d08:	56                   	push   %esi
 d09:	53                   	push   %ebx
 d0a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d0d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 d10:	8b 3d 40 13 00 00    	mov    0x1340,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d16:	8d 70 07             	lea    0x7(%eax),%esi
 d19:	c1 ee 03             	shr    $0x3,%esi
 d1c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 d1f:	85 ff                	test   %edi,%edi
 d21:	0f 84 a9 00 00 00    	je     dd0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d27:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 d29:	8b 48 04             	mov    0x4(%eax),%ecx
 d2c:	39 f1                	cmp    %esi,%ecx
 d2e:	73 6d                	jae    d9d <malloc+0x9d>
 d30:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 d36:	bb 00 10 00 00       	mov    $0x1000,%ebx
 d3b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 d3e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 d45:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 d48:	eb 17                	jmp    d61 <malloc+0x61>
 d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d50:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 d52:	8b 4a 04             	mov    0x4(%edx),%ecx
 d55:	39 f1                	cmp    %esi,%ecx
 d57:	73 4f                	jae    da8 <malloc+0xa8>
 d59:	8b 3d 40 13 00 00    	mov    0x1340,%edi
 d5f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d61:	39 c7                	cmp    %eax,%edi
 d63:	75 eb                	jne    d50 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 d65:	83 ec 0c             	sub    $0xc,%esp
 d68:	ff 75 e4             	pushl  -0x1c(%ebp)
 d6b:	e8 15 fc ff ff       	call   985 <sbrk>
  if(p == (char*)-1)
 d70:	83 c4 10             	add    $0x10,%esp
 d73:	83 f8 ff             	cmp    $0xffffffff,%eax
 d76:	74 1b                	je     d93 <malloc+0x93>
  hp->s.size = nu;
 d78:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 d7b:	83 ec 0c             	sub    $0xc,%esp
 d7e:	83 c0 08             	add    $0x8,%eax
 d81:	50                   	push   %eax
 d82:	e8 e9 fe ff ff       	call   c70 <free>
  return freep;
 d87:	a1 40 13 00 00       	mov    0x1340,%eax
      if((p = morecore(nunits)) == 0)
 d8c:	83 c4 10             	add    $0x10,%esp
 d8f:	85 c0                	test   %eax,%eax
 d91:	75 bd                	jne    d50 <malloc+0x50>
        return 0;
  }
}
 d93:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 d96:	31 c0                	xor    %eax,%eax
}
 d98:	5b                   	pop    %ebx
 d99:	5e                   	pop    %esi
 d9a:	5f                   	pop    %edi
 d9b:	5d                   	pop    %ebp
 d9c:	c3                   	ret    
    if(p->s.size >= nunits){
 d9d:	89 c2                	mov    %eax,%edx
 d9f:	89 f8                	mov    %edi,%eax
 da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 da8:	39 ce                	cmp    %ecx,%esi
 daa:	74 54                	je     e00 <malloc+0x100>
        p->s.size -= nunits;
 dac:	29 f1                	sub    %esi,%ecx
 dae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 db1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 db4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 db7:	a3 40 13 00 00       	mov    %eax,0x1340
}
 dbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 dbf:	8d 42 08             	lea    0x8(%edx),%eax
}
 dc2:	5b                   	pop    %ebx
 dc3:	5e                   	pop    %esi
 dc4:	5f                   	pop    %edi
 dc5:	5d                   	pop    %ebp
 dc6:	c3                   	ret    
 dc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 dce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 dd0:	c7 05 40 13 00 00 44 	movl   $0x1344,0x1340
 dd7:	13 00 00 
    base.s.size = 0;
 dda:	bf 44 13 00 00       	mov    $0x1344,%edi
    base.s.ptr = freep = prevp = &base;
 ddf:	c7 05 44 13 00 00 44 	movl   $0x1344,0x1344
 de6:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 de9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 deb:	c7 05 48 13 00 00 00 	movl   $0x0,0x1348
 df2:	00 00 00 
    if(p->s.size >= nunits){
 df5:	e9 36 ff ff ff       	jmp    d30 <malloc+0x30>
 dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 e00:	8b 0a                	mov    (%edx),%ecx
 e02:	89 08                	mov    %ecx,(%eax)
 e04:	eb b1                	jmp    db7 <malloc+0xb7>
