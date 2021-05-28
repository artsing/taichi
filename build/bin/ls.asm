
build/bin/_ls：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 28                	jle    49 <main+0x49>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 c3 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 ec                	jne    30 <main+0x30>
  exit();
  44:	e8 24 0a 00 00       	call   a6d <exit>
    ls(".");
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	68 c0 0f 00 00       	push   $0xfc0
  51:	e8 aa 00 00 00       	call   100 <ls>
    exit();
  56:	e8 12 0a 00 00       	call   a6d <exit>
  5b:	66 90                	xchg   %ax,%ax
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <fmtname>:
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  6c:	83 ec 0c             	sub    $0xc,%esp
  6f:	56                   	push   %esi
  70:	e8 ab 03 00 00       	call   420 <strlen>
  75:	83 c4 10             	add    $0x10,%esp
  78:	01 f0                	add    %esi,%eax
  7a:	89 c3                	mov    %eax,%ebx
  7c:	73 0b                	jae    89 <fmtname+0x29>
  7e:	eb 0e                	jmp    8e <fmtname+0x2e>
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 86 03 00 00       	call   420 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 75 03 00 00       	call   420 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 a0 14 00 00       	push   $0x14a0
  b5:	e8 16 05 00 00       	call   5d0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 5e 03 00 00       	call   420 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb a0 14 00 00       	mov    $0x14a0,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 4f 03 00 00       	call   420 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 a0 14 00 00       	add    $0x14a0,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 77 03 00 00       	call   460 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	57                   	push   %edi
 108:	56                   	push   %esi
 109:	53                   	push   %ebx
 10a:	81 ec 64 02 00 00    	sub    $0x264,%esp
 110:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 113:	6a 00                	push   $0x0
 115:	57                   	push   %edi
 116:	e8 92 09 00 00       	call   aad <open>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	85 c0                	test   %eax,%eax
 120:	0f 88 9a 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 126:	83 ec 08             	sub    $0x8,%esp
 129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12f:	89 c3                	mov    %eax,%ebx
 131:	56                   	push   %esi
 132:	50                   	push   %eax
 133:	e8 8d 09 00 00       	call   ac5 <fstat>
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	0f 88 bd 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 143:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 14a:	66 83 f8 01          	cmp    $0x1,%ax
 14e:	74 60                	je     1b0 <ls+0xb0>
 150:	66 83 f8 02          	cmp    $0x2,%ax
 154:	74 1a                	je     170 <ls+0x70>
  close(fd);
 156:	83 ec 0c             	sub    $0xc,%esp
 159:	53                   	push   %ebx
 15a:	e8 36 09 00 00       	call   a95 <close>
 15f:	83 c4 10             	add    $0x10,%esp
}
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 a0 0f 00 00       	push   $0xfa0
 19d:	6a 01                	push   $0x1
 19f:	e8 6c 0a 00 00       	call   c10 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb ad                	jmp    156 <ls+0x56>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 67 02 00 00       	call   420 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 3e 02 00 00       	call   420 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 73 08 00 00       	call   a85 <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 38 ff ff ff    	jne    156 <ls+0x56>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 91 03 00 00       	call   5d0 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 ee 02 00 00       	call   540 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 a0 0f 00 00       	push   $0xfa0
 2a7:	6a 01                	push   $0x1
 2a9:	e8 62 09 00 00       	call   c10 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 78 0f 00 00       	push   $0xf78
 2c9:	6a 02                	push   $0x2
 2cb:	e8 40 09 00 00       	call   c10 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 ad 0f 00 00       	push   $0xfad
 2e8:	6a 01                	push   $0x1
 2ea:	e8 21 09 00 00       	call   c10 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5f fe ff ff       	jmp    156 <ls+0x56>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 8c 0f 00 00       	push   $0xf8c
 309:	6a 02                	push   $0x2
 30b:	e8 00 09 00 00       	call   c10 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 7d 07 00 00       	call   a95 <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 8c 0f 00 00       	push   $0xf8c
 331:	6a 01                	push   $0x1
 333:	e8 d8 08 00 00       	call   c10 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 345:	31 c0                	xor    %eax,%eax
{
 347:	89 e5                	mov    %esp,%ebp
 349:	53                   	push   %ebx
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	8b 7d 10             	mov    0x10(%ebp),%edi
 37b:	56                   	push   %esi
 37c:	8b 75 08             	mov    0x8(%ebp),%esi
 37f:	53                   	push   %ebx
 380:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
 383:	85 ff                	test   %edi,%edi
 385:	74 39                	je     3c0 <strcat_s+0x50>
 387:	31 c0                	xor    %eax,%eax
 389:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 38e:	eb 11                	jmp    3a1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
 390:	0f b6 12             	movzbl (%edx),%edx
 393:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 396:	84 d2                	test   %dl,%dl
 398:	74 26                	je     3c0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
 39a:	83 c0 01             	add    $0x1,%eax
 39d:	39 c7                	cmp    %eax,%edi
 39f:	74 1f                	je     3c0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
 3a1:	89 c2                	mov    %eax,%edx
 3a3:	29 ca                	sub    %ecx,%edx
 3a5:	01 da                	add    %ebx,%edx
 3a7:	83 f9 ff             	cmp    $0xffffffff,%ecx
 3aa:	75 e4                	jne    390 <strcat_s+0x20>
 3ac:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
 3b0:	75 e8                	jne    39a <strcat_s+0x2a>
 3b2:	89 da                	mov    %ebx,%edx
 3b4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
 3b6:	0f b6 12             	movzbl (%edx),%edx
 3b9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
 3bc:	84 d2                	test   %dl,%dl
 3be:	75 da                	jne    39a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
 3c0:	5b                   	pop    %ebx
 3c1:	89 f0                	mov    %esi,%eax
 3c3:	5e                   	pop    %esi
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	53                   	push   %ebx
 3d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3de:	0f b6 01             	movzbl (%ecx),%eax
 3e1:	0f b6 1a             	movzbl (%edx),%ebx
 3e4:	84 c0                	test   %al,%al
 3e6:	75 19                	jne    401 <strcmp+0x31>
 3e8:	eb 26                	jmp    410 <strcmp+0x40>
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 3f4:	83 c1 01             	add    $0x1,%ecx
 3f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3fa:	0f b6 1a             	movzbl (%edx),%ebx
 3fd:	84 c0                	test   %al,%al
 3ff:	74 0f                	je     410 <strcmp+0x40>
 401:	38 d8                	cmp    %bl,%al
 403:	74 eb                	je     3f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 405:	29 d8                	sub    %ebx,%eax
}
 407:	5b                   	pop    %ebx
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 410:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 412:	29 d8                	sub    %ebx,%eax
}
 414:	5b                   	pop    %ebx
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax

00000420 <strlen>:

uint
strlen(const char *s)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 42a:	80 3a 00             	cmpb   $0x0,(%edx)
 42d:	74 21                	je     450 <strlen+0x30>
 42f:	31 c0                	xor    %eax,%eax
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 438:	83 c0 01             	add    $0x1,%eax
 43b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 43f:	89 c1                	mov    %eax,%ecx
 441:	75 f5                	jne    438 <strlen+0x18>
    ;
  return n;
}
 443:	89 c8                	mov    %ecx,%eax
 445:	5d                   	pop    %ebp
 446:	c3                   	ret    
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 450:	31 c9                	xor    %ecx,%ecx
}
 452:	5d                   	pop    %ebp
 453:	89 c8                	mov    %ecx,%eax
 455:	c3                   	ret    
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 46b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 46e:	8b 45 0c             	mov    0xc(%ebp),%eax
 471:	89 d7                	mov    %edx,%edi
 473:	fc                   	cld    
 474:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 476:	89 d0                	mov    %edx,%eax
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 48e:	0f b6 10             	movzbl (%eax),%edx
 491:	84 d2                	test   %dl,%dl
 493:	75 16                	jne    4ab <strchr+0x2b>
 495:	eb 21                	jmp    4b8 <strchr+0x38>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
 4a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4a4:	83 c0 01             	add    $0x1,%eax
 4a7:	84 d2                	test   %dl,%dl
 4a9:	74 0d                	je     4b8 <strchr+0x38>
    if(*s == c)
 4ab:	38 d1                	cmp    %dl,%cl
 4ad:	75 f1                	jne    4a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4b8:	31 c0                	xor    %eax,%eax
}
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret    
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	f3 0f 1e fb          	endbr32 
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	57                   	push   %edi
 4c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c9:	31 f6                	xor    %esi,%esi
{
 4cb:	53                   	push   %ebx
 4cc:	89 f3                	mov    %esi,%ebx
 4ce:	83 ec 1c             	sub    $0x1c,%esp
 4d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 4d4:	eb 33                	jmp    509 <gets+0x49>
 4d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e6:	6a 01                	push   $0x1
 4e8:	50                   	push   %eax
 4e9:	6a 00                	push   $0x0
 4eb:	e8 95 05 00 00       	call   a85 <read>
    if(cc < 1)
 4f0:	83 c4 10             	add    $0x10,%esp
 4f3:	85 c0                	test   %eax,%eax
 4f5:	7e 1c                	jle    513 <gets+0x53>
      break;
    buf[i++] = c;
 4f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4fb:	83 c7 01             	add    $0x1,%edi
 4fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 501:	3c 0a                	cmp    $0xa,%al
 503:	74 23                	je     528 <gets+0x68>
 505:	3c 0d                	cmp    $0xd,%al
 507:	74 1f                	je     528 <gets+0x68>
  for(i=0; i+1 < max; ){
 509:	83 c3 01             	add    $0x1,%ebx
 50c:	89 fe                	mov    %edi,%esi
 50e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 511:	7c cd                	jl     4e0 <gets+0x20>
 513:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 515:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 518:	c6 03 00             	movb   $0x0,(%ebx)
}
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    
 523:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 527:	90                   	nop
 528:	8b 75 08             	mov    0x8(%ebp),%esi
 52b:	8b 45 08             	mov    0x8(%ebp),%eax
 52e:	01 de                	add    %ebx,%esi
 530:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 532:	c6 03 00             	movb   $0x0,(%ebx)
}
 535:	8d 65 f4             	lea    -0xc(%ebp),%esp
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <stat>:

int
stat(const char *n, struct stat *st)
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	56                   	push   %esi
 548:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	6a 00                	push   $0x0
 54e:	ff 75 08             	pushl  0x8(%ebp)
 551:	e8 57 05 00 00       	call   aad <open>
  if(fd < 0)
 556:	83 c4 10             	add    $0x10,%esp
 559:	85 c0                	test   %eax,%eax
 55b:	78 2b                	js     588 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 55d:	83 ec 08             	sub    $0x8,%esp
 560:	ff 75 0c             	pushl  0xc(%ebp)
 563:	89 c3                	mov    %eax,%ebx
 565:	50                   	push   %eax
 566:	e8 5a 05 00 00       	call   ac5 <fstat>
  close(fd);
 56b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 56e:	89 c6                	mov    %eax,%esi
  close(fd);
 570:	e8 20 05 00 00       	call   a95 <close>
  return r;
 575:	83 c4 10             	add    $0x10,%esp
}
 578:	8d 65 f8             	lea    -0x8(%ebp),%esp
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 588:	be ff ff ff ff       	mov    $0xffffffff,%esi
 58d:	eb e9                	jmp    578 <stat+0x38>
 58f:	90                   	nop

00000590 <atoi>:

int
atoi(const char *s)
{
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	53                   	push   %ebx
 598:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 59b:	0f be 02             	movsbl (%edx),%eax
 59e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5a9:	77 1a                	ja     5c5 <atoi+0x35>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
    n = n*10 + *s++ - '0';
 5b0:	83 c2 01             	add    $0x1,%edx
 5b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ba:	0f be 02             	movsbl (%edx),%eax
 5bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5c0:	80 fb 09             	cmp    $0x9,%bl
 5c3:	76 eb                	jbe    5b0 <atoi+0x20>
  return n;
}
 5c5:	89 c8                	mov    %ecx,%eax
 5c7:	5b                   	pop    %ebx
 5c8:	5d                   	pop    %ebp
 5c9:	c3                   	ret    
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	8b 45 10             	mov    0x10(%ebp),%eax
 5db:	8b 55 08             	mov    0x8(%ebp),%edx
 5de:	56                   	push   %esi
 5df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5e2:	85 c0                	test   %eax,%eax
 5e4:	7e 0f                	jle    5f5 <memmove+0x25>
 5e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 5e8:	89 d7                	mov    %edx,%edi
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5f1:	39 f8                	cmp    %edi,%eax
 5f3:	75 fb                	jne    5f0 <memmove+0x20>
  return vdst;
}
 5f5:	5e                   	pop    %esi
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	5f                   	pop    %edi
 5f9:	5d                   	pop    %ebp
 5fa:	c3                   	ret    
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	56                   	push   %esi
 609:	53                   	push   %ebx
 60a:	83 ec 34             	sub    $0x34,%esp
 60d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 610:	68 c4 0f 00 00       	push   $0xfc4
hexdump (void *data, size_t size) {
 615:	89 45 e0             	mov    %eax,-0x20(%ebp)
 618:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 61b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 61d:	89 c7                	mov    %eax,%edi
 61f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 622:	e8 e9 05 00 00       	call   c10 <printf>
  for (offset = 0; offset < size; offset += 16) {
 627:	83 c4 10             	add    $0x10,%esp
 62a:	85 ff                	test   %edi,%edi
 62c:	0f 84 2d 01 00 00    	je     75f <hexdump+0x15f>
 632:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 635:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 63c:	be 10 00 00 00       	mov    $0x10,%esi
 641:	83 e8 01             	sub    $0x1,%eax
 644:	83 e0 f0             	and    $0xfffffff0,%eax
 647:	83 c0 10             	add    $0x10,%eax
 64a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 650:	83 ec 08             	sub    $0x8,%esp
 653:	68 18 10 00 00       	push   $0x1018
 658:	6a 01                	push   $0x1
 65a:	e8 b1 05 00 00       	call   c10 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 65f:	83 c4 10             	add    $0x10,%esp
 662:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 669:	0f 8e 51 01 00 00    	jle    7c0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 66f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 672:	83 ec 04             	sub    $0x4,%esp
 675:	57                   	push   %edi
 676:	89 fb                	mov    %edi,%ebx
 678:	68 15 10 00 00       	push   $0x1015
 67d:	6a 01                	push   $0x1
 67f:	e8 8c 05 00 00       	call   c10 <printf>
 684:	89 7d d8             	mov    %edi,-0x28(%ebp)
 687:	83 c4 10             	add    $0x10,%esp
 68a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 68d:	eb 28                	jmp    6b7 <hexdump+0xb7>
 68f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 690:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 694:	80 fa 0f             	cmp    $0xf,%dl
 697:	0f 86 e3 00 00 00    	jbe    780 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 69d:	83 ec 04             	sub    $0x4,%esp
 6a0:	83 c3 01             	add    $0x1,%ebx
 6a3:	52                   	push   %edx
 6a4:	68 1b 10 00 00       	push   $0x101b
 6a9:	6a 01                	push   $0x1
 6ab:	e8 60 05 00 00       	call   c10 <printf>
 6b0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 6b3:	39 f3                	cmp    %esi,%ebx
 6b5:	74 1e                	je     6d5 <hexdump+0xd5>
      if(offset + index < (int)size) {
 6b7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 6ba:	7f d4                	jg     690 <hexdump+0x90>
      } else {
        printf(1, "   ");
 6bc:	83 ec 08             	sub    $0x8,%esp
 6bf:	83 c3 01             	add    $0x1,%ebx
 6c2:	68 1f 10 00 00       	push   $0x101f
 6c7:	6a 01                	push   $0x1
 6c9:	e8 42 05 00 00       	call   c10 <printf>
 6ce:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 6d1:	39 f3                	cmp    %esi,%ebx
 6d3:	75 e2                	jne    6b7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 6d5:	83 ec 08             	sub    $0x8,%esp
 6d8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 6db:	68 18 10 00 00       	push   $0x1018
 6e0:	6a 01                	push   $0x1
 6e2:	e8 29 05 00 00       	call   c10 <printf>
 6e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ea:	83 c4 10             	add    $0x10,%esp
 6ed:	eb 1b                	jmp    70a <hexdump+0x10a>
 6ef:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	52                   	push   %edx
 6f4:	68 23 10 00 00       	push   $0x1023
 6f9:	6a 01                	push   $0x1
 6fb:	e8 10 05 00 00       	call   c10 <printf>
 700:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 703:	83 c3 01             	add    $0x1,%ebx
 706:	39 de                	cmp    %ebx,%esi
 708:	74 30                	je     73a <hexdump+0x13a>
      if(offset + index < (int)size) {
 70a:	39 df                	cmp    %ebx,%edi
 70c:	0f 8e 8e 00 00 00    	jle    7a0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 712:	8b 45 e0             	mov    -0x20(%ebp),%eax
 715:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 719:	8d 4a e0             	lea    -0x20(%edx),%ecx
 71c:	80 f9 5e             	cmp    $0x5e,%cl
 71f:	76 cf                	jbe    6f0 <hexdump+0xf0>
        } else {
          printf(1, ".");
 721:	83 ec 08             	sub    $0x8,%esp
 724:	83 c3 01             	add    $0x1,%ebx
 727:	68 c0 0f 00 00       	push   $0xfc0
 72c:	6a 01                	push   $0x1
 72e:	e8 dd 04 00 00       	call   c10 <printf>
 733:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 736:	39 de                	cmp    %ebx,%esi
 738:	75 d0                	jne    70a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 73a:	83 ec 08             	sub    $0x8,%esp
 73d:	83 c6 10             	add    $0x10,%esi
 740:	68 26 10 00 00       	push   $0x1026
 745:	6a 01                	push   $0x1
 747:	e8 c4 04 00 00       	call   c10 <printf>
  for (offset = 0; offset < size; offset += 16) {
 74c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 750:	83 c4 10             	add    $0x10,%esp
 753:	8b 45 dc             	mov    -0x24(%ebp),%eax
 756:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 759:	0f 85 f1 fe ff ff    	jne    650 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 75f:	c7 45 0c c4 0f 00 00 	movl   $0xfc4,0xc(%ebp)
 766:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 76d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 770:	5b                   	pop    %ebx
 771:	5e                   	pop    %esi
 772:	5f                   	pop    %edi
 773:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 774:	e9 97 04 00 00       	jmp    c10 <printf>
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 780:	83 ec 08             	sub    $0x8,%esp
 783:	68 13 10 00 00       	push   $0x1013
 788:	6a 01                	push   $0x1
 78a:	e8 81 04 00 00       	call   c10 <printf>
 78f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 793:	83 c4 10             	add    $0x10,%esp
 796:	e9 02 ff ff ff       	jmp    69d <hexdump+0x9d>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
        printf(1, " ");
 7a0:	83 ec 08             	sub    $0x8,%esp
 7a3:	68 21 10 00 00       	push   $0x1021
 7a8:	6a 01                	push   $0x1
 7aa:	e8 61 04 00 00       	call   c10 <printf>
 7af:	83 c4 10             	add    $0x10,%esp
 7b2:	e9 4c ff ff ff       	jmp    703 <hexdump+0x103>
 7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7be:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 7c0:	83 ec 08             	sub    $0x8,%esp
 7c3:	68 13 10 00 00       	push   $0x1013
 7c8:	6a 01                	push   $0x1
 7ca:	e8 41 04 00 00       	call   c10 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 7cf:	8b 7d dc             	mov    -0x24(%ebp),%edi
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 7db:	0f 8f 8e fe ff ff    	jg     66f <hexdump+0x6f>
 7e1:	83 ec 08             	sub    $0x8,%esp
 7e4:	68 13 10 00 00       	push   $0x1013
 7e9:	6a 01                	push   $0x1
 7eb:	e8 20 04 00 00       	call   c10 <printf>
    if (offset <= 0x000f) printf(1, "0");
 7f0:	83 c4 10             	add    $0x10,%esp
 7f3:	83 ff 0f             	cmp    $0xf,%edi
 7f6:	0f 8f 73 fe ff ff    	jg     66f <hexdump+0x6f>
 7fc:	83 ec 08             	sub    $0x8,%esp
 7ff:	68 13 10 00 00       	push   $0x1013
 804:	6a 01                	push   $0x1
 806:	e8 05 04 00 00       	call   c10 <printf>
 80b:	83 c4 10             	add    $0x10,%esp
 80e:	e9 5c fe ff ff       	jmp    66f <hexdump+0x6f>
 813:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000820 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
    if (!endian)
 825:	a1 b0 14 00 00       	mov    0x14b0,%eax
{
 82a:	89 e5                	mov    %esp,%ebp
 82c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 82f:	85 c0                	test   %eax,%eax
 831:	75 1d                	jne    850 <hton16+0x30>
        endian = byteorder();
 833:	c7 05 b0 14 00 00 d2 	movl   $0x4d2,0x14b0
 83a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 83d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 83f:	5d                   	pop    %ebp
 840:	66 c1 c2 08          	rol    $0x8,%dx
 844:	89 d0                	mov    %edx,%eax
 846:	c3                   	ret    
 847:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84e:	66 90                	xchg   %ax,%ax
 850:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 852:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 857:	74 e4                	je     83d <hton16+0x1d>
}
 859:	89 d0                	mov    %edx,%eax
 85b:	5d                   	pop    %ebp
 85c:	c3                   	ret    
 85d:	8d 76 00             	lea    0x0(%esi),%esi

00000860 <ntoh16>:
 860:	f3 0f 1e fb          	endbr32 
 864:	eb ba                	jmp    820 <hton16>
 866:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86d:	8d 76 00             	lea    0x0(%esi),%esi

00000870 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 870:	f3 0f 1e fb          	endbr32 
 874:	55                   	push   %ebp
    if (!endian)
 875:	8b 15 b0 14 00 00    	mov    0x14b0,%edx
{
 87b:	89 e5                	mov    %esp,%ebp
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 880:	85 d2                	test   %edx,%edx
 882:	75 14                	jne    898 <hton32+0x28>
        endian = byteorder();
 884:	c7 05 b0 14 00 00 d2 	movl   $0x4d2,0x14b0
 88b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 88e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 890:	5d                   	pop    %ebp
 891:	c3                   	ret    
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 898:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 89e:	74 ee                	je     88e <hton32+0x1e>
}
 8a0:	5d                   	pop    %ebp
 8a1:	c3                   	ret    
 8a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008b0 <ntoh32>:
 8b0:	f3 0f 1e fb          	endbr32 
 8b4:	eb ba                	jmp    870 <hton32>
 8b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bd:	8d 76 00             	lea    0x0(%esi),%esi

000008c0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 8c0:	f3 0f 1e fb          	endbr32 
 8c4:	55                   	push   %ebp
 8c5:	89 e5                	mov    %esp,%ebp
 8c7:	57                   	push   %edi
 8c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8cb:	56                   	push   %esi
 8cc:	53                   	push   %ebx
 8cd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 8d0:	0f b6 01             	movzbl (%ecx),%eax
 8d3:	3c 09                	cmp    $0x9,%al
 8d5:	74 09                	je     8e0 <strtol+0x20>
 8d7:	3c 20                	cmp    $0x20,%al
 8d9:	75 14                	jne    8ef <strtol+0x2f>
 8db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
 8e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 8e4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 8e7:	3c 20                	cmp    $0x20,%al
 8e9:	74 f5                	je     8e0 <strtol+0x20>
 8eb:	3c 09                	cmp    $0x9,%al
 8ed:	74 f1                	je     8e0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 8ef:	3c 2b                	cmp    $0x2b,%al
 8f1:	0f 84 a9 00 00 00    	je     9a0 <strtol+0xe0>
    int neg = 0;
 8f7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 8f9:	3c 2d                	cmp    $0x2d,%al
 8fb:	0f 84 8f 00 00 00    	je     990 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 901:	0f be 11             	movsbl (%ecx),%edx
 904:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 90a:	75 12                	jne    91e <strtol+0x5e>
 90c:	80 fa 30             	cmp    $0x30,%dl
 90f:	0f 84 9b 00 00 00    	je     9b0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 915:	85 db                	test   %ebx,%ebx
 917:	75 05                	jne    91e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 919:	bb 0a 00 00 00       	mov    $0xa,%ebx
 91e:	89 5d 10             	mov    %ebx,0x10(%ebp)
 921:	31 c0                	xor    %eax,%eax
 923:	eb 17                	jmp    93c <strtol+0x7c>
 925:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 928:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 92b:	3b 55 10             	cmp    0x10(%ebp),%edx
 92e:	7d 28                	jge    958 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 930:	0f af 45 10          	imul   0x10(%ebp),%eax
 934:	83 c1 01             	add    $0x1,%ecx
 937:	01 d0                	add    %edx,%eax
    while (1) {
 939:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 93c:	8d 72 d0             	lea    -0x30(%edx),%esi
 93f:	89 f3                	mov    %esi,%ebx
 941:	80 fb 09             	cmp    $0x9,%bl
 944:	76 e2                	jbe    928 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 946:	8d 72 9f             	lea    -0x61(%edx),%esi
 949:	89 f3                	mov    %esi,%ebx
 94b:	80 fb 19             	cmp    $0x19,%bl
 94e:	77 28                	ja     978 <strtol+0xb8>
            dig = *s - 'a' + 10;
 950:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 953:	3b 55 10             	cmp    0x10(%ebp),%edx
 956:	7c d8                	jl     930 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 958:	8b 55 0c             	mov    0xc(%ebp),%edx
 95b:	85 d2                	test   %edx,%edx
 95d:	74 05                	je     964 <strtol+0xa4>
        *endptr = (char *) s;
 95f:	8b 75 0c             	mov    0xc(%ebp),%esi
 962:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 964:	89 c2                	mov    %eax,%edx
}
 966:	5b                   	pop    %ebx
 967:	5e                   	pop    %esi
    return (neg ? -val : val);
 968:	f7 da                	neg    %edx
 96a:	85 ff                	test   %edi,%edi
}
 96c:	5f                   	pop    %edi
 96d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 96e:	0f 45 c2             	cmovne %edx,%eax
}
 971:	c3                   	ret    
 972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 978:	8d 72 bf             	lea    -0x41(%edx),%esi
 97b:	89 f3                	mov    %esi,%ebx
 97d:	80 fb 19             	cmp    $0x19,%bl
 980:	77 d6                	ja     958 <strtol+0x98>
            dig = *s - 'A' + 10;
 982:	83 ea 37             	sub    $0x37,%edx
 985:	eb a4                	jmp    92b <strtol+0x6b>
 987:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 990:	83 c1 01             	add    $0x1,%ecx
 993:	bf 01 00 00 00       	mov    $0x1,%edi
 998:	e9 64 ff ff ff       	jmp    901 <strtol+0x41>
 99d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 9a0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 9a3:	31 ff                	xor    %edi,%edi
 9a5:	e9 57 ff ff ff       	jmp    901 <strtol+0x41>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 9b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 9b4:	3c 78                	cmp    $0x78,%al
 9b6:	74 18                	je     9d0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 9b8:	85 db                	test   %ebx,%ebx
 9ba:	0f 85 5e ff ff ff    	jne    91e <strtol+0x5e>
        s++, base = 8;
 9c0:	83 c1 01             	add    $0x1,%ecx
 9c3:	0f be d0             	movsbl %al,%edx
 9c6:	bb 08 00 00 00       	mov    $0x8,%ebx
 9cb:	e9 4e ff ff ff       	jmp    91e <strtol+0x5e>
        s += 2, base = 16;
 9d0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 9d4:	bb 10 00 00 00       	mov    $0x10,%ebx
 9d9:	83 c1 02             	add    $0x2,%ecx
 9dc:	e9 3d ff ff ff       	jmp    91e <strtol+0x5e>
 9e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ef:	90                   	nop

000009f0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 9f0:	f3 0f 1e fb          	endbr32 
 9f4:	55                   	push   %ebp
 9f5:	89 e5                	mov    %esp,%ebp
 9f7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 9f8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 9fa:	56                   	push   %esi
 9fb:	53                   	push   %ebx
 9fc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 9ff:	83 ec 1c             	sub    $0x1c,%esp
 a02:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 a05:	83 ec 04             	sub    $0x4,%esp
 a08:	6a 0a                	push   $0xa
 a0a:	53                   	push   %ebx
 a0b:	56                   	push   %esi
 a0c:	e8 af fe ff ff       	call   8c0 <strtol>
        if (ret < 0 || ret > 255) {
 a11:	83 c4 10             	add    $0x10,%esp
 a14:	3d ff 00 00 00       	cmp    $0xff,%eax
 a19:	77 3d                	ja     a58 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 a1b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 a1e:	39 f1                	cmp    %esi,%ecx
 a20:	74 36                	je     a58 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 a22:	0f b6 11             	movzbl (%ecx),%edx
 a25:	83 ff 03             	cmp    $0x3,%edi
 a28:	74 16                	je     a40 <ip_addr_pton+0x50>
 a2a:	80 fa 2e             	cmp    $0x2e,%dl
 a2d:	75 29                	jne    a58 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 a2f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 a32:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 a35:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 a38:	83 c7 01             	add    $0x1,%edi
 a3b:	eb c8                	jmp    a05 <ip_addr_pton+0x15>
 a3d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 a40:	84 d2                	test   %dl,%dl
 a42:	75 14                	jne    a58 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 a44:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 a47:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 a4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 a4d:	31 c0                	xor    %eax,%eax
}
 a4f:	5b                   	pop    %ebx
 a50:	5e                   	pop    %esi
 a51:	5f                   	pop    %edi
 a52:	5d                   	pop    %ebp
 a53:	c3                   	ret    
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 a5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a60:	5b                   	pop    %ebx
 a61:	5e                   	pop    %esi
 a62:	5f                   	pop    %edi
 a63:	5d                   	pop    %ebp
 a64:	c3                   	ret    

00000a65 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 a65:	b8 01 00 00 00       	mov    $0x1,%eax
 a6a:	cd 40                	int    $0x40
 a6c:	c3                   	ret    

00000a6d <exit>:
SYSCALL(exit)
 a6d:	b8 02 00 00 00       	mov    $0x2,%eax
 a72:	cd 40                	int    $0x40
 a74:	c3                   	ret    

00000a75 <wait>:
SYSCALL(wait)
 a75:	b8 03 00 00 00       	mov    $0x3,%eax
 a7a:	cd 40                	int    $0x40
 a7c:	c3                   	ret    

00000a7d <pipe>:
SYSCALL(pipe)
 a7d:	b8 04 00 00 00       	mov    $0x4,%eax
 a82:	cd 40                	int    $0x40
 a84:	c3                   	ret    

00000a85 <read>:
SYSCALL(read)
 a85:	b8 05 00 00 00       	mov    $0x5,%eax
 a8a:	cd 40                	int    $0x40
 a8c:	c3                   	ret    

00000a8d <write>:
SYSCALL(write)
 a8d:	b8 10 00 00 00       	mov    $0x10,%eax
 a92:	cd 40                	int    $0x40
 a94:	c3                   	ret    

00000a95 <close>:
SYSCALL(close)
 a95:	b8 15 00 00 00       	mov    $0x15,%eax
 a9a:	cd 40                	int    $0x40
 a9c:	c3                   	ret    

00000a9d <kill>:
SYSCALL(kill)
 a9d:	b8 06 00 00 00       	mov    $0x6,%eax
 aa2:	cd 40                	int    $0x40
 aa4:	c3                   	ret    

00000aa5 <exec>:
SYSCALL(exec)
 aa5:	b8 07 00 00 00       	mov    $0x7,%eax
 aaa:	cd 40                	int    $0x40
 aac:	c3                   	ret    

00000aad <open>:
SYSCALL(open)
 aad:	b8 0f 00 00 00       	mov    $0xf,%eax
 ab2:	cd 40                	int    $0x40
 ab4:	c3                   	ret    

00000ab5 <mknod>:
SYSCALL(mknod)
 ab5:	b8 11 00 00 00       	mov    $0x11,%eax
 aba:	cd 40                	int    $0x40
 abc:	c3                   	ret    

00000abd <unlink>:
SYSCALL(unlink)
 abd:	b8 12 00 00 00       	mov    $0x12,%eax
 ac2:	cd 40                	int    $0x40
 ac4:	c3                   	ret    

00000ac5 <fstat>:
SYSCALL(fstat)
 ac5:	b8 08 00 00 00       	mov    $0x8,%eax
 aca:	cd 40                	int    $0x40
 acc:	c3                   	ret    

00000acd <link>:
SYSCALL(link)
 acd:	b8 13 00 00 00       	mov    $0x13,%eax
 ad2:	cd 40                	int    $0x40
 ad4:	c3                   	ret    

00000ad5 <mkdir>:
SYSCALL(mkdir)
 ad5:	b8 14 00 00 00       	mov    $0x14,%eax
 ada:	cd 40                	int    $0x40
 adc:	c3                   	ret    

00000add <chdir>:
SYSCALL(chdir)
 add:	b8 09 00 00 00       	mov    $0x9,%eax
 ae2:	cd 40                	int    $0x40
 ae4:	c3                   	ret    

00000ae5 <dup>:
SYSCALL(dup)
 ae5:	b8 0a 00 00 00       	mov    $0xa,%eax
 aea:	cd 40                	int    $0x40
 aec:	c3                   	ret    

00000aed <getpid>:
SYSCALL(getpid)
 aed:	b8 0b 00 00 00       	mov    $0xb,%eax
 af2:	cd 40                	int    $0x40
 af4:	c3                   	ret    

00000af5 <sbrk>:
SYSCALL(sbrk)
 af5:	b8 0c 00 00 00       	mov    $0xc,%eax
 afa:	cd 40                	int    $0x40
 afc:	c3                   	ret    

00000afd <sleep>:
SYSCALL(sleep)
 afd:	b8 0d 00 00 00       	mov    $0xd,%eax
 b02:	cd 40                	int    $0x40
 b04:	c3                   	ret    

00000b05 <uptime>:
SYSCALL(uptime)
 b05:	b8 0e 00 00 00       	mov    $0xe,%eax
 b0a:	cd 40                	int    $0x40
 b0c:	c3                   	ret    

00000b0d <ioctl>:
# iotcl
SYSCALL(ioctl)
 b0d:	b8 16 00 00 00       	mov    $0x16,%eax
 b12:	cd 40                	int    $0x40
 b14:	c3                   	ret    

00000b15 <socket>:
# socket
SYSCALL(socket)
 b15:	b8 17 00 00 00       	mov    $0x17,%eax
 b1a:	cd 40                	int    $0x40
 b1c:	c3                   	ret    

00000b1d <bind>:
SYSCALL(bind)
 b1d:	b8 19 00 00 00       	mov    $0x19,%eax
 b22:	cd 40                	int    $0x40
 b24:	c3                   	ret    

00000b25 <listen>:
SYSCALL(listen)
 b25:	b8 1a 00 00 00       	mov    $0x1a,%eax
 b2a:	cd 40                	int    $0x40
 b2c:	c3                   	ret    

00000b2d <accept>:
SYSCALL(accept)
 b2d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 b32:	cd 40                	int    $0x40
 b34:	c3                   	ret    

00000b35 <recv>:
SYSCALL(recv)
 b35:	b8 1c 00 00 00       	mov    $0x1c,%eax
 b3a:	cd 40                	int    $0x40
 b3c:	c3                   	ret    

00000b3d <send>:
SYSCALL(send)
 b3d:	b8 1d 00 00 00       	mov    $0x1d,%eax
 b42:	cd 40                	int    $0x40
 b44:	c3                   	ret    

00000b45 <recvfrom>:
SYSCALL(recvfrom)
 b45:	b8 1e 00 00 00       	mov    $0x1e,%eax
 b4a:	cd 40                	int    $0x40
 b4c:	c3                   	ret    

00000b4d <sendto>:
SYSCALL(sendto)
 b4d:	b8 1f 00 00 00       	mov    $0x1f,%eax
 b52:	cd 40                	int    $0x40
 b54:	c3                   	ret    
 b55:	66 90                	xchg   %ax,%ax
 b57:	66 90                	xchg   %ax,%ax
 b59:	66 90                	xchg   %ax,%ax
 b5b:	66 90                	xchg   %ax,%ax
 b5d:	66 90                	xchg   %ax,%ax
 b5f:	90                   	nop

00000b60 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	57                   	push   %edi
 b64:	56                   	push   %esi
 b65:	53                   	push   %ebx
 b66:	83 ec 3c             	sub    $0x3c,%esp
 b69:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 b6c:	89 d1                	mov    %edx,%ecx
{
 b6e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 b71:	85 d2                	test   %edx,%edx
 b73:	0f 89 7f 00 00 00    	jns    bf8 <printint+0x98>
 b79:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 b7d:	74 79                	je     bf8 <printint+0x98>
    neg = 1;
 b7f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 b86:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 b88:	31 db                	xor    %ebx,%ebx
 b8a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 b8d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 b90:	89 c8                	mov    %ecx,%eax
 b92:	31 d2                	xor    %edx,%edx
 b94:	89 cf                	mov    %ecx,%edi
 b96:	f7 75 c4             	divl   -0x3c(%ebp)
 b99:	0f b6 92 34 10 00 00 	movzbl 0x1034(%edx),%edx
 ba0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 ba3:	89 d8                	mov    %ebx,%eax
 ba5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 ba8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 bab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 bae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 bb1:	76 dd                	jbe    b90 <printint+0x30>
  if(neg)
 bb3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 bb6:	85 c9                	test   %ecx,%ecx
 bb8:	74 0c                	je     bc6 <printint+0x66>
    buf[i++] = '-';
 bba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 bbf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 bc1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 bc6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 bc9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 bcd:	eb 07                	jmp    bd6 <printint+0x76>
 bcf:	90                   	nop
 bd0:	0f b6 13             	movzbl (%ebx),%edx
 bd3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 bd6:	83 ec 04             	sub    $0x4,%esp
 bd9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 bdc:	6a 01                	push   $0x1
 bde:	56                   	push   %esi
 bdf:	57                   	push   %edi
 be0:	e8 a8 fe ff ff       	call   a8d <write>
  while(--i >= 0)
 be5:	83 c4 10             	add    $0x10,%esp
 be8:	39 de                	cmp    %ebx,%esi
 bea:	75 e4                	jne    bd0 <printint+0x70>
    putc(fd, buf[i]);
}
 bec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 bef:	5b                   	pop    %ebx
 bf0:	5e                   	pop    %esi
 bf1:	5f                   	pop    %edi
 bf2:	5d                   	pop    %ebp
 bf3:	c3                   	ret    
 bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 bf8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 bff:	eb 87                	jmp    b88 <printint+0x28>
 c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c0f:	90                   	nop

00000c10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 c10:	f3 0f 1e fb          	endbr32 
 c14:	55                   	push   %ebp
 c15:	89 e5                	mov    %esp,%ebp
 c17:	57                   	push   %edi
 c18:	56                   	push   %esi
 c19:	53                   	push   %ebx
 c1a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 c1d:	8b 75 0c             	mov    0xc(%ebp),%esi
 c20:	0f b6 1e             	movzbl (%esi),%ebx
 c23:	84 db                	test   %bl,%bl
 c25:	0f 84 b4 00 00 00    	je     cdf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 c2b:	8d 45 10             	lea    0x10(%ebp),%eax
 c2e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 c31:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 c34:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 c36:	89 45 d0             	mov    %eax,-0x30(%ebp)
 c39:	eb 33                	jmp    c6e <printf+0x5e>
 c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c3f:	90                   	nop
 c40:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 c43:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 c48:	83 f8 25             	cmp    $0x25,%eax
 c4b:	74 17                	je     c64 <printf+0x54>
  write(fd, &c, 1);
 c4d:	83 ec 04             	sub    $0x4,%esp
 c50:	88 5d e7             	mov    %bl,-0x19(%ebp)
 c53:	6a 01                	push   $0x1
 c55:	57                   	push   %edi
 c56:	ff 75 08             	pushl  0x8(%ebp)
 c59:	e8 2f fe ff ff       	call   a8d <write>
 c5e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 c61:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 c64:	0f b6 1e             	movzbl (%esi),%ebx
 c67:	83 c6 01             	add    $0x1,%esi
 c6a:	84 db                	test   %bl,%bl
 c6c:	74 71                	je     cdf <printf+0xcf>
    c = fmt[i] & 0xff;
 c6e:	0f be cb             	movsbl %bl,%ecx
 c71:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 c74:	85 d2                	test   %edx,%edx
 c76:	74 c8                	je     c40 <printf+0x30>
      }
    } else if(state == '%'){
 c78:	83 fa 25             	cmp    $0x25,%edx
 c7b:	75 e7                	jne    c64 <printf+0x54>
      if(c == 'd'){
 c7d:	83 f8 64             	cmp    $0x64,%eax
 c80:	0f 84 9a 00 00 00    	je     d20 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 c86:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 c8c:	83 f9 70             	cmp    $0x70,%ecx
 c8f:	74 5f                	je     cf0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 c91:	83 f8 73             	cmp    $0x73,%eax
 c94:	0f 84 d6 00 00 00    	je     d70 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c9a:	83 f8 63             	cmp    $0x63,%eax
 c9d:	0f 84 8d 00 00 00    	je     d30 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 ca3:	83 f8 25             	cmp    $0x25,%eax
 ca6:	0f 84 b4 00 00 00    	je     d60 <printf+0x150>
  write(fd, &c, 1);
 cac:	83 ec 04             	sub    $0x4,%esp
 caf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 cb3:	6a 01                	push   $0x1
 cb5:	57                   	push   %edi
 cb6:	ff 75 08             	pushl  0x8(%ebp)
 cb9:	e8 cf fd ff ff       	call   a8d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 cbe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 cc1:	83 c4 0c             	add    $0xc,%esp
 cc4:	6a 01                	push   $0x1
 cc6:	83 c6 01             	add    $0x1,%esi
 cc9:	57                   	push   %edi
 cca:	ff 75 08             	pushl  0x8(%ebp)
 ccd:	e8 bb fd ff ff       	call   a8d <write>
  for(i = 0; fmt[i]; i++){
 cd2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 cd6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 cd9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 cdb:	84 db                	test   %bl,%bl
 cdd:	75 8f                	jne    c6e <printf+0x5e>
    }
  }
}
 cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ce2:	5b                   	pop    %ebx
 ce3:	5e                   	pop    %esi
 ce4:	5f                   	pop    %edi
 ce5:	5d                   	pop    %ebp
 ce6:	c3                   	ret    
 ce7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 cf0:	83 ec 0c             	sub    $0xc,%esp
 cf3:	b9 10 00 00 00       	mov    $0x10,%ecx
 cf8:	6a 00                	push   $0x0
 cfa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 cfd:	8b 45 08             	mov    0x8(%ebp),%eax
 d00:	8b 13                	mov    (%ebx),%edx
 d02:	e8 59 fe ff ff       	call   b60 <printint>
        ap++;
 d07:	89 d8                	mov    %ebx,%eax
 d09:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d0c:	31 d2                	xor    %edx,%edx
        ap++;
 d0e:	83 c0 04             	add    $0x4,%eax
 d11:	89 45 d0             	mov    %eax,-0x30(%ebp)
 d14:	e9 4b ff ff ff       	jmp    c64 <printf+0x54>
 d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 d20:	83 ec 0c             	sub    $0xc,%esp
 d23:	b9 0a 00 00 00       	mov    $0xa,%ecx
 d28:	6a 01                	push   $0x1
 d2a:	eb ce                	jmp    cfa <printf+0xea>
 d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 d30:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 d33:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 d36:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 d38:	6a 01                	push   $0x1
        ap++;
 d3a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 d3d:	57                   	push   %edi
 d3e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 d41:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 d44:	e8 44 fd ff ff       	call   a8d <write>
        ap++;
 d49:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 d4c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 d4f:	31 d2                	xor    %edx,%edx
 d51:	e9 0e ff ff ff       	jmp    c64 <printf+0x54>
 d56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d5d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 d60:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 d63:	83 ec 04             	sub    $0x4,%esp
 d66:	e9 59 ff ff ff       	jmp    cc4 <printf+0xb4>
 d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d6f:	90                   	nop
        s = (char*)*ap;
 d70:	8b 45 d0             	mov    -0x30(%ebp),%eax
 d73:	8b 18                	mov    (%eax),%ebx
        ap++;
 d75:	83 c0 04             	add    $0x4,%eax
 d78:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 d7b:	85 db                	test   %ebx,%ebx
 d7d:	74 17                	je     d96 <printf+0x186>
        while(*s != 0){
 d7f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 d82:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 d84:	84 c0                	test   %al,%al
 d86:	0f 84 d8 fe ff ff    	je     c64 <printf+0x54>
 d8c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 d8f:	89 de                	mov    %ebx,%esi
 d91:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d94:	eb 1a                	jmp    db0 <printf+0x1a0>
          s = "(null)";
 d96:	bb 2a 10 00 00       	mov    $0x102a,%ebx
        while(*s != 0){
 d9b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 d9e:	b8 28 00 00 00       	mov    $0x28,%eax
 da3:	89 de                	mov    %ebx,%esi
 da5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 da8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 daf:	90                   	nop
  write(fd, &c, 1);
 db0:	83 ec 04             	sub    $0x4,%esp
          s++;
 db3:	83 c6 01             	add    $0x1,%esi
 db6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 db9:	6a 01                	push   $0x1
 dbb:	57                   	push   %edi
 dbc:	53                   	push   %ebx
 dbd:	e8 cb fc ff ff       	call   a8d <write>
        while(*s != 0){
 dc2:	0f b6 06             	movzbl (%esi),%eax
 dc5:	83 c4 10             	add    $0x10,%esp
 dc8:	84 c0                	test   %al,%al
 dca:	75 e4                	jne    db0 <printf+0x1a0>
 dcc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 dcf:	31 d2                	xor    %edx,%edx
 dd1:	e9 8e fe ff ff       	jmp    c64 <printf+0x54>
 dd6:	66 90                	xchg   %ax,%ax
 dd8:	66 90                	xchg   %ax,%ax
 dda:	66 90                	xchg   %ax,%ax
 ddc:	66 90                	xchg   %ax,%ax
 dde:	66 90                	xchg   %ax,%ax

00000de0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 de0:	f3 0f 1e fb          	endbr32 
 de4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 de5:	a1 b4 14 00 00       	mov    0x14b4,%eax
{
 dea:	89 e5                	mov    %esp,%ebp
 dec:	57                   	push   %edi
 ded:	56                   	push   %esi
 dee:	53                   	push   %ebx
 def:	8b 5d 08             	mov    0x8(%ebp),%ebx
 df2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 df4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 df7:	39 c8                	cmp    %ecx,%eax
 df9:	73 15                	jae    e10 <free+0x30>
 dfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 dff:	90                   	nop
 e00:	39 d1                	cmp    %edx,%ecx
 e02:	72 14                	jb     e18 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e04:	39 d0                	cmp    %edx,%eax
 e06:	73 10                	jae    e18 <free+0x38>
{
 e08:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e0a:	8b 10                	mov    (%eax),%edx
 e0c:	39 c8                	cmp    %ecx,%eax
 e0e:	72 f0                	jb     e00 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e10:	39 d0                	cmp    %edx,%eax
 e12:	72 f4                	jb     e08 <free+0x28>
 e14:	39 d1                	cmp    %edx,%ecx
 e16:	73 f0                	jae    e08 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 e18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 e1e:	39 fa                	cmp    %edi,%edx
 e20:	74 1e                	je     e40 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 e22:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 e25:	8b 50 04             	mov    0x4(%eax),%edx
 e28:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 e2b:	39 f1                	cmp    %esi,%ecx
 e2d:	74 28                	je     e57 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 e2f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 e31:	5b                   	pop    %ebx
  freep = p;
 e32:	a3 b4 14 00 00       	mov    %eax,0x14b4
}
 e37:	5e                   	pop    %esi
 e38:	5f                   	pop    %edi
 e39:	5d                   	pop    %ebp
 e3a:	c3                   	ret    
 e3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e3f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 e40:	03 72 04             	add    0x4(%edx),%esi
 e43:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 e46:	8b 10                	mov    (%eax),%edx
 e48:	8b 12                	mov    (%edx),%edx
 e4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 e4d:	8b 50 04             	mov    0x4(%eax),%edx
 e50:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 e53:	39 f1                	cmp    %esi,%ecx
 e55:	75 d8                	jne    e2f <free+0x4f>
    p->s.size += bp->s.size;
 e57:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 e5a:	a3 b4 14 00 00       	mov    %eax,0x14b4
    p->s.size += bp->s.size;
 e5f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 e62:	8b 53 f8             	mov    -0x8(%ebx),%edx
 e65:	89 10                	mov    %edx,(%eax)
}
 e67:	5b                   	pop    %ebx
 e68:	5e                   	pop    %esi
 e69:	5f                   	pop    %edi
 e6a:	5d                   	pop    %ebp
 e6b:	c3                   	ret    
 e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 e70:	f3 0f 1e fb          	endbr32 
 e74:	55                   	push   %ebp
 e75:	89 e5                	mov    %esp,%ebp
 e77:	57                   	push   %edi
 e78:	56                   	push   %esi
 e79:	53                   	push   %ebx
 e7a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e7d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 e80:	8b 3d b4 14 00 00    	mov    0x14b4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e86:	8d 70 07             	lea    0x7(%eax),%esi
 e89:	c1 ee 03             	shr    $0x3,%esi
 e8c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 e8f:	85 ff                	test   %edi,%edi
 e91:	0f 84 a9 00 00 00    	je     f40 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e97:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 e99:	8b 48 04             	mov    0x4(%eax),%ecx
 e9c:	39 f1                	cmp    %esi,%ecx
 e9e:	73 6d                	jae    f0d <malloc+0x9d>
 ea0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ea6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 eab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 eae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 eb5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 eb8:	eb 17                	jmp    ed1 <malloc+0x61>
 eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ec0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 ec2:	8b 4a 04             	mov    0x4(%edx),%ecx
 ec5:	39 f1                	cmp    %esi,%ecx
 ec7:	73 4f                	jae    f18 <malloc+0xa8>
 ec9:	8b 3d b4 14 00 00    	mov    0x14b4,%edi
 ecf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ed1:	39 c7                	cmp    %eax,%edi
 ed3:	75 eb                	jne    ec0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ed5:	83 ec 0c             	sub    $0xc,%esp
 ed8:	ff 75 e4             	pushl  -0x1c(%ebp)
 edb:	e8 15 fc ff ff       	call   af5 <sbrk>
  if(p == (char*)-1)
 ee0:	83 c4 10             	add    $0x10,%esp
 ee3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ee6:	74 1b                	je     f03 <malloc+0x93>
  hp->s.size = nu;
 ee8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 eeb:	83 ec 0c             	sub    $0xc,%esp
 eee:	83 c0 08             	add    $0x8,%eax
 ef1:	50                   	push   %eax
 ef2:	e8 e9 fe ff ff       	call   de0 <free>
  return freep;
 ef7:	a1 b4 14 00 00       	mov    0x14b4,%eax
      if((p = morecore(nunits)) == 0)
 efc:	83 c4 10             	add    $0x10,%esp
 eff:	85 c0                	test   %eax,%eax
 f01:	75 bd                	jne    ec0 <malloc+0x50>
        return 0;
  }
}
 f03:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 f06:	31 c0                	xor    %eax,%eax
}
 f08:	5b                   	pop    %ebx
 f09:	5e                   	pop    %esi
 f0a:	5f                   	pop    %edi
 f0b:	5d                   	pop    %ebp
 f0c:	c3                   	ret    
    if(p->s.size >= nunits){
 f0d:	89 c2                	mov    %eax,%edx
 f0f:	89 f8                	mov    %edi,%eax
 f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 f18:	39 ce                	cmp    %ecx,%esi
 f1a:	74 54                	je     f70 <malloc+0x100>
        p->s.size -= nunits;
 f1c:	29 f1                	sub    %esi,%ecx
 f1e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 f21:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 f24:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 f27:	a3 b4 14 00 00       	mov    %eax,0x14b4
}
 f2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 f2f:	8d 42 08             	lea    0x8(%edx),%eax
}
 f32:	5b                   	pop    %ebx
 f33:	5e                   	pop    %esi
 f34:	5f                   	pop    %edi
 f35:	5d                   	pop    %ebp
 f36:	c3                   	ret    
 f37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 f3e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 f40:	c7 05 b4 14 00 00 b8 	movl   $0x14b8,0x14b4
 f47:	14 00 00 
    base.s.size = 0;
 f4a:	bf b8 14 00 00       	mov    $0x14b8,%edi
    base.s.ptr = freep = prevp = &base;
 f4f:	c7 05 b8 14 00 00 b8 	movl   $0x14b8,0x14b8
 f56:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f59:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 f5b:	c7 05 bc 14 00 00 00 	movl   $0x0,0x14bc
 f62:	00 00 00 
    if(p->s.size >= nunits){
 f65:	e9 36 ff ff ff       	jmp    ea0 <malloc+0x30>
 f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 f70:	8b 0a                	mov    (%edx),%ecx
 f72:	89 08                	mov    %ecx,(%eax)
 f74:	eb b1                	jmp    f27 <malloc+0xb7>
