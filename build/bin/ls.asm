
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
  44:	e8 c4 09 00 00       	call   a0d <exit>
    ls(".");
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	68 60 0f 00 00       	push   $0xf60
  51:	e8 aa 00 00 00       	call   100 <ls>
    exit();
  56:	e8 b2 09 00 00       	call   a0d <exit>
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
  70:	e8 4b 03 00 00       	call   3c0 <strlen>
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
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 10 14 00 00       	push   $0x1410
  b5:	e8 b6 04 00 00       	call   570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 10 14 00 00       	mov    $0x1410,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 10 14 00 00       	add    $0x1410,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
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
 116:	e8 32 09 00 00       	call   a4d <open>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	85 c0                	test   %eax,%eax
 120:	0f 88 9a 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 126:	83 ec 08             	sub    $0x8,%esp
 129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12f:	89 c3                	mov    %eax,%ebx
 131:	56                   	push   %esi
 132:	50                   	push   %eax
 133:	e8 2d 09 00 00       	call   a65 <fstat>
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
 15a:	e8 d6 08 00 00       	call   a35 <close>
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
 198:	68 40 0f 00 00       	push   $0xf40
 19d:	6a 01                	push   $0x1
 19f:	e8 0c 0a 00 00       	call   bb0 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb ad                	jmp    156 <ls+0x56>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
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
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
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
 20d:	e8 13 08 00 00       	call   a25 <read>
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
 23a:	e8 31 03 00 00       	call   570 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 8e 02 00 00       	call   4e0 <stat>
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
 2a2:	68 40 0f 00 00       	push   $0xf40
 2a7:	6a 01                	push   $0x1
 2a9:	e8 02 09 00 00       	call   bb0 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 18 0f 00 00       	push   $0xf18
 2c9:	6a 02                	push   $0x2
 2cb:	e8 e0 08 00 00       	call   bb0 <printf>
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
 2e3:	68 4d 0f 00 00       	push   $0xf4d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 c1 08 00 00       	call   bb0 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5f fe ff ff       	jmp    156 <ls+0x56>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 2c 0f 00 00       	push   $0xf2c
 309:	6a 02                	push   $0x2
 30b:	e8 a0 08 00 00       	call   bb0 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 1d 07 00 00       	call   a35 <close>
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
 32c:	68 2c 0f 00 00       	push   $0xf2c
 331:	6a 01                	push   $0x1
 333:	e8 78 08 00 00       	call   bb0 <printf>
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

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
 37b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	0f b6 1a             	movzbl (%edx),%ebx
 384:	84 c0                	test   %al,%al
 386:	75 19                	jne    3a1 <strcmp+0x31>
 388:	eb 26                	jmp    3b0 <strcmp+0x40>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3ca:	80 3a 00             	cmpb   $0x0,(%edx)
 3cd:	74 21                	je     3f0 <strlen+0x30>
 3cf:	31 c0                	xor    %eax,%eax
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3df:	89 c1                	mov    %eax,%ecx
 3e1:	75 f5                	jne    3d8 <strlen+0x18>
    ;
  return n;
}
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 d7                	mov    %edx,%edi
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42e:	0f b6 10             	movzbl (%eax),%edx
 431:	84 d2                	test   %dl,%dl
 433:	75 16                	jne    44b <strchr+0x2b>
 435:	eb 21                	jmp    458 <strchr+0x38>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 444:	83 c0 01             	add    $0x1,%eax
 447:	84 d2                	test   %dl,%dl
 449:	74 0d                	je     458 <strchr+0x38>
    if(*s == c)
 44b:	38 d1                	cmp    %dl,%cl
 44d:	75 f1                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 458:	31 c0                	xor    %eax,%eax
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	31 f6                	xor    %esi,%esi
{
 46b:	53                   	push   %ebx
 46c:	89 f3                	mov    %esi,%ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 474:	eb 33                	jmp    4a9 <gets+0x49>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8d 45 e7             	lea    -0x19(%ebp),%eax
 486:	6a 01                	push   $0x1
 488:	50                   	push   %eax
 489:	6a 00                	push   $0x0
 48b:	e8 95 05 00 00       	call   a25 <read>
    if(cc < 1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	7e 1c                	jle    4b3 <gets+0x53>
      break;
    buf[i++] = c;
 497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49b:	83 c7 01             	add    $0x1,%edi
 49e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	74 23                	je     4c8 <gets+0x68>
 4a5:	3c 0d                	cmp    $0xd,%al
 4a7:	74 1f                	je     4c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	89 fe                	mov    %edi,%esi
 4ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b1:	7c cd                	jl     480 <gets+0x20>
 4b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	8b 75 08             	mov    0x8(%ebp),%esi
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	01 de                	add    %ebx,%esi
 4d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5f                   	pop    %edi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	6a 00                	push   $0x0
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 57 05 00 00       	call   a4d <open>
  if(fd < 0)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 2b                	js     528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4fd:	83 ec 08             	sub    $0x8,%esp
 500:	ff 75 0c             	pushl  0xc(%ebp)
 503:	89 c3                	mov    %eax,%ebx
 505:	50                   	push   %eax
 506:	e8 5a 05 00 00       	call   a65 <fstat>
  close(fd);
 50b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50e:	89 c6                	mov    %eax,%esi
  close(fd);
 510:	e8 20 05 00 00       	call   a35 <close>
  return r;
 515:	83 c4 10             	add    $0x10,%esp
}
 518:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51b:	89 f0                	mov    %esi,%eax
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb e9                	jmp    518 <stat+0x38>
 52f:	90                   	nop

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	0f be 02             	movsbl (%edx),%eax
 53e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 549:	77 1a                	ja     565 <atoi+0x35>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	89 c8                	mov    %ecx,%eax
 567:	5b                   	pop    %ebx
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	8b 45 10             	mov    0x10(%ebp),%eax
 57b:	8b 55 08             	mov    0x8(%ebp),%edx
 57e:	56                   	push   %esi
 57f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	85 c0                	test   %eax,%eax
 584:	7e 0f                	jle    595 <memmove+0x25>
 586:	01 d0                	add    %edx,%eax
  dst = vdst;
 588:	89 d7                	mov    %edx,%edi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	57                   	push   %edi
 5a8:	56                   	push   %esi
 5a9:	53                   	push   %ebx
 5aa:	83 ec 34             	sub    $0x34,%esp
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5b0:	68 64 0f 00 00       	push   $0xf64
hexdump (void *data, size_t size) {
 5b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 5b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5bb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
 5bd:	89 c7                	mov    %eax,%edi
 5bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 5c2:	e8 e9 05 00 00       	call   bb0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	85 ff                	test   %edi,%edi
 5cc:	0f 84 2d 01 00 00    	je     6ff <hexdump+0x15f>
 5d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 5dc:	be 10 00 00 00       	mov    $0x10,%esi
 5e1:	83 e8 01             	sub    $0x1,%eax
 5e4:	83 e0 f0             	and    $0xfffffff0,%eax
 5e7:	83 c0 10             	add    $0x10,%eax
 5ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	68 b8 0f 00 00       	push   $0xfb8
 5f8:	6a 01                	push   $0x1
 5fa:	e8 b1 05 00 00       	call   bb0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
 609:	0f 8e 51 01 00 00    	jle    760 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
 60f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 612:	83 ec 04             	sub    $0x4,%esp
 615:	57                   	push   %edi
 616:	89 fb                	mov    %edi,%ebx
 618:	68 b5 0f 00 00       	push   $0xfb5
 61d:	6a 01                	push   $0x1
 61f:	e8 8c 05 00 00       	call   bb0 <printf>
 624:	89 7d d8             	mov    %edi,-0x28(%ebp)
 627:	83 c4 10             	add    $0x10,%esp
 62a:	8b 7d e0             	mov    -0x20(%ebp),%edi
 62d:	eb 28                	jmp    657 <hexdump+0xb7>
 62f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
 630:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 634:	80 fa 0f             	cmp    $0xf,%dl
 637:	0f 86 e3 00 00 00    	jbe    720 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	83 c3 01             	add    $0x1,%ebx
 643:	52                   	push   %edx
 644:	68 bb 0f 00 00       	push   $0xfbb
 649:	6a 01                	push   $0x1
 64b:	e8 60 05 00 00       	call   bb0 <printf>
 650:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 653:	39 f3                	cmp    %esi,%ebx
 655:	74 1e                	je     675 <hexdump+0xd5>
      if(offset + index < (int)size) {
 657:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 65a:	7f d4                	jg     630 <hexdump+0x90>
      } else {
        printf(1, "   ");
 65c:	83 ec 08             	sub    $0x8,%esp
 65f:	83 c3 01             	add    $0x1,%ebx
 662:	68 bf 0f 00 00       	push   $0xfbf
 667:	6a 01                	push   $0x1
 669:	e8 42 05 00 00       	call   bb0 <printf>
 66e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
 671:	39 f3                	cmp    %esi,%ebx
 673:	75 e2                	jne    657 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
 675:	83 ec 08             	sub    $0x8,%esp
 678:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 67b:	68 b8 0f 00 00       	push   $0xfb8
 680:	6a 01                	push   $0x1
 682:	e8 29 05 00 00       	call   bb0 <printf>
 687:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68a:	83 c4 10             	add    $0x10,%esp
 68d:	eb 1b                	jmp    6aa <hexdump+0x10a>
 68f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	52                   	push   %edx
 694:	68 c3 0f 00 00       	push   $0xfc3
 699:	6a 01                	push   $0x1
 69b:	e8 10 05 00 00       	call   bb0 <printf>
 6a0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 6a3:	83 c3 01             	add    $0x1,%ebx
 6a6:	39 de                	cmp    %ebx,%esi
 6a8:	74 30                	je     6da <hexdump+0x13a>
      if(offset + index < (int)size) {
 6aa:	39 df                	cmp    %ebx,%edi
 6ac:	0f 8e 8e 00 00 00    	jle    740 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
 6b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 6b5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 6b9:	8d 4a e0             	lea    -0x20(%edx),%ecx
 6bc:	80 f9 5e             	cmp    $0x5e,%cl
 6bf:	76 cf                	jbe    690 <hexdump+0xf0>
        } else {
          printf(1, ".");
 6c1:	83 ec 08             	sub    $0x8,%esp
 6c4:	83 c3 01             	add    $0x1,%ebx
 6c7:	68 60 0f 00 00       	push   $0xf60
 6cc:	6a 01                	push   $0x1
 6ce:	e8 dd 04 00 00       	call   bb0 <printf>
 6d3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
 6d6:	39 de                	cmp    %ebx,%esi
 6d8:	75 d0                	jne    6aa <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
 6da:	83 ec 08             	sub    $0x8,%esp
 6dd:	83 c6 10             	add    $0x10,%esi
 6e0:	68 c6 0f 00 00       	push   $0xfc6
 6e5:	6a 01                	push   $0x1
 6e7:	e8 c4 04 00 00       	call   bb0 <printf>
  for (offset = 0; offset < size; offset += 16) {
 6ec:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
 6f0:	83 c4 10             	add    $0x10,%esp
 6f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 6f6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 6f9:	0f 85 f1 fe ff ff    	jne    5f0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 6ff:	c7 45 0c 64 0f 00 00 	movl   $0xf64,0xc(%ebp)
 706:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 70d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 710:	5b                   	pop    %ebx
 711:	5e                   	pop    %esi
 712:	5f                   	pop    %edi
 713:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
 714:	e9 97 04 00 00       	jmp    bb0 <printf>
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
 720:	83 ec 08             	sub    $0x8,%esp
 723:	68 b3 0f 00 00       	push   $0xfb3
 728:	6a 01                	push   $0x1
 72a:	e8 81 04 00 00       	call   bb0 <printf>
 72f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 733:	83 c4 10             	add    $0x10,%esp
 736:	e9 02 ff ff ff       	jmp    63d <hexdump+0x9d>
 73b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
        printf(1, " ");
 740:	83 ec 08             	sub    $0x8,%esp
 743:	68 c1 0f 00 00       	push   $0xfc1
 748:	6a 01                	push   $0x1
 74a:	e8 61 04 00 00       	call   bb0 <printf>
 74f:	83 c4 10             	add    $0x10,%esp
 752:	e9 4c ff ff ff       	jmp    6a3 <hexdump+0x103>
 757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
 760:	83 ec 08             	sub    $0x8,%esp
 763:	68 b3 0f 00 00       	push   $0xfb3
 768:	6a 01                	push   $0x1
 76a:	e8 41 04 00 00       	call   bb0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
 76f:	8b 7d dc             	mov    -0x24(%ebp),%edi
 772:	83 c4 10             	add    $0x10,%esp
 775:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 77b:	0f 8f 8e fe ff ff    	jg     60f <hexdump+0x6f>
 781:	83 ec 08             	sub    $0x8,%esp
 784:	68 b3 0f 00 00       	push   $0xfb3
 789:	6a 01                	push   $0x1
 78b:	e8 20 04 00 00       	call   bb0 <printf>
    if (offset <= 0x000f) printf(1, "0");
 790:	83 c4 10             	add    $0x10,%esp
 793:	83 ff 0f             	cmp    $0xf,%edi
 796:	0f 8f 73 fe ff ff    	jg     60f <hexdump+0x6f>
 79c:	83 ec 08             	sub    $0x8,%esp
 79f:	68 b3 0f 00 00       	push   $0xfb3
 7a4:	6a 01                	push   $0x1
 7a6:	e8 05 04 00 00       	call   bb0 <printf>
 7ab:	83 c4 10             	add    $0x10,%esp
 7ae:	e9 5c fe ff ff       	jmp    60f <hexdump+0x6f>
 7b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000007c0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
 7c0:	f3 0f 1e fb          	endbr32 
 7c4:	55                   	push   %ebp
    if (!endian)
 7c5:	a1 20 14 00 00       	mov    0x1420,%eax
{
 7ca:	89 e5                	mov    %esp,%ebp
 7cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
 7cf:	85 c0                	test   %eax,%eax
 7d1:	75 1d                	jne    7f0 <hton16+0x30>
        endian = byteorder();
 7d3:	c7 05 20 14 00 00 d2 	movl   $0x4d2,0x1420
 7da:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
 7dd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
 7df:	5d                   	pop    %ebp
 7e0:	66 c1 c2 08          	rol    $0x8,%dx
 7e4:	89 d0                	mov    %edx,%eax
 7e6:	c3                   	ret    
 7e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ee:	66 90                	xchg   %ax,%ax
 7f0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
 7f2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
 7f7:	74 e4                	je     7dd <hton16+0x1d>
}
 7f9:	89 d0                	mov    %edx,%eax
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret    
 7fd:	8d 76 00             	lea    0x0(%esi),%esi

00000800 <ntoh16>:
 800:	f3 0f 1e fb          	endbr32 
 804:	eb ba                	jmp    7c0 <hton16>
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi

00000810 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
 810:	f3 0f 1e fb          	endbr32 
 814:	55                   	push   %ebp
    if (!endian)
 815:	8b 15 20 14 00 00    	mov    0x1420,%edx
{
 81b:	89 e5                	mov    %esp,%ebp
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
 820:	85 d2                	test   %edx,%edx
 822:	75 14                	jne    838 <hton32+0x28>
        endian = byteorder();
 824:	c7 05 20 14 00 00 d2 	movl   $0x4d2,0x1420
 82b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
 82e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
 830:	5d                   	pop    %ebp
 831:	c3                   	ret    
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
 838:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
 83e:	74 ee                	je     82e <hton32+0x1e>
}
 840:	5d                   	pop    %ebp
 841:	c3                   	ret    
 842:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000850 <ntoh32>:
 850:	f3 0f 1e fb          	endbr32 
 854:	eb ba                	jmp    810 <hton32>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi

00000860 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
 860:	f3 0f 1e fb          	endbr32 
 864:	55                   	push   %ebp
 865:	89 e5                	mov    %esp,%ebp
 867:	57                   	push   %edi
 868:	8b 4d 08             	mov    0x8(%ebp),%ecx
 86b:	56                   	push   %esi
 86c:	53                   	push   %ebx
 86d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
 870:	0f b6 01             	movzbl (%ecx),%eax
 873:	3c 09                	cmp    $0x9,%al
 875:	74 09                	je     880 <strtol+0x20>
 877:	3c 20                	cmp    $0x20,%al
 879:	75 14                	jne    88f <strtol+0x2f>
 87b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
 880:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
 884:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
 887:	3c 20                	cmp    $0x20,%al
 889:	74 f5                	je     880 <strtol+0x20>
 88b:	3c 09                	cmp    $0x9,%al
 88d:	74 f1                	je     880 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
 88f:	3c 2b                	cmp    $0x2b,%al
 891:	0f 84 a9 00 00 00    	je     940 <strtol+0xe0>
    int neg = 0;
 897:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
 899:	3c 2d                	cmp    $0x2d,%al
 89b:	0f 84 8f 00 00 00    	je     930 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 8a1:	0f be 11             	movsbl (%ecx),%edx
 8a4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
 8aa:	75 12                	jne    8be <strtol+0x5e>
 8ac:	80 fa 30             	cmp    $0x30,%dl
 8af:	0f 84 9b 00 00 00    	je     950 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
 8b5:	85 db                	test   %ebx,%ebx
 8b7:	75 05                	jne    8be <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
 8b9:	bb 0a 00 00 00       	mov    $0xa,%ebx
 8be:	89 5d 10             	mov    %ebx,0x10(%ebp)
 8c1:	31 c0                	xor    %eax,%eax
 8c3:	eb 17                	jmp    8dc <strtol+0x7c>
 8c5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
 8c8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
 8cb:	3b 55 10             	cmp    0x10(%ebp),%edx
 8ce:	7d 28                	jge    8f8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
 8d0:	0f af 45 10          	imul   0x10(%ebp),%eax
 8d4:	83 c1 01             	add    $0x1,%ecx
 8d7:	01 d0                	add    %edx,%eax
    while (1) {
 8d9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
 8dc:	8d 72 d0             	lea    -0x30(%edx),%esi
 8df:	89 f3                	mov    %esi,%ebx
 8e1:	80 fb 09             	cmp    $0x9,%bl
 8e4:	76 e2                	jbe    8c8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
 8e6:	8d 72 9f             	lea    -0x61(%edx),%esi
 8e9:	89 f3                	mov    %esi,%ebx
 8eb:	80 fb 19             	cmp    $0x19,%bl
 8ee:	77 28                	ja     918 <strtol+0xb8>
            dig = *s - 'a' + 10;
 8f0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
 8f3:	3b 55 10             	cmp    0x10(%ebp),%edx
 8f6:	7c d8                	jl     8d0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
 8f8:	8b 55 0c             	mov    0xc(%ebp),%edx
 8fb:	85 d2                	test   %edx,%edx
 8fd:	74 05                	je     904 <strtol+0xa4>
        *endptr = (char *) s;
 8ff:	8b 75 0c             	mov    0xc(%ebp),%esi
 902:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
 904:	89 c2                	mov    %eax,%edx
}
 906:	5b                   	pop    %ebx
 907:	5e                   	pop    %esi
    return (neg ? -val : val);
 908:	f7 da                	neg    %edx
 90a:	85 ff                	test   %edi,%edi
}
 90c:	5f                   	pop    %edi
 90d:	5d                   	pop    %ebp
    return (neg ? -val : val);
 90e:	0f 45 c2             	cmovne %edx,%eax
}
 911:	c3                   	ret    
 912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
 918:	8d 72 bf             	lea    -0x41(%edx),%esi
 91b:	89 f3                	mov    %esi,%ebx
 91d:	80 fb 19             	cmp    $0x19,%bl
 920:	77 d6                	ja     8f8 <strtol+0x98>
            dig = *s - 'A' + 10;
 922:	83 ea 37             	sub    $0x37,%edx
 925:	eb a4                	jmp    8cb <strtol+0x6b>
 927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
 930:	83 c1 01             	add    $0x1,%ecx
 933:	bf 01 00 00 00       	mov    $0x1,%edi
 938:	e9 64 ff ff ff       	jmp    8a1 <strtol+0x41>
 93d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
 940:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
 943:	31 ff                	xor    %edi,%edi
 945:	e9 57 ff ff ff       	jmp    8a1 <strtol+0x41>
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 950:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 954:	3c 78                	cmp    $0x78,%al
 956:	74 18                	je     970 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
 958:	85 db                	test   %ebx,%ebx
 95a:	0f 85 5e ff ff ff    	jne    8be <strtol+0x5e>
        s++, base = 8;
 960:	83 c1 01             	add    $0x1,%ecx
 963:	0f be d0             	movsbl %al,%edx
 966:	bb 08 00 00 00       	mov    $0x8,%ebx
 96b:	e9 4e ff ff ff       	jmp    8be <strtol+0x5e>
        s += 2, base = 16;
 970:	0f be 51 02          	movsbl 0x2(%ecx),%edx
 974:	bb 10 00 00 00       	mov    $0x10,%ebx
 979:	83 c1 02             	add    $0x2,%ecx
 97c:	e9 3d ff ff ff       	jmp    8be <strtol+0x5e>
 981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop

00000990 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
 990:	f3 0f 1e fb          	endbr32 
 994:	55                   	push   %ebp
 995:	89 e5                	mov    %esp,%ebp
 997:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
 998:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
 99a:	56                   	push   %esi
 99b:	53                   	push   %ebx
 99c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 99f:	83 ec 1c             	sub    $0x1c,%esp
 9a2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
 9a5:	83 ec 04             	sub    $0x4,%esp
 9a8:	6a 0a                	push   $0xa
 9aa:	53                   	push   %ebx
 9ab:	56                   	push   %esi
 9ac:	e8 af fe ff ff       	call   860 <strtol>
        if (ret < 0 || ret > 255) {
 9b1:	83 c4 10             	add    $0x10,%esp
 9b4:	3d ff 00 00 00       	cmp    $0xff,%eax
 9b9:	77 3d                	ja     9f8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
 9bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 9be:	39 f1                	cmp    %esi,%ecx
 9c0:	74 36                	je     9f8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 9c2:	0f b6 11             	movzbl (%ecx),%edx
 9c5:	83 ff 03             	cmp    $0x3,%edi
 9c8:	74 16                	je     9e0 <ip_addr_pton+0x50>
 9ca:	80 fa 2e             	cmp    $0x2e,%dl
 9cd:	75 29                	jne    9f8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
 9cf:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
 9d2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
 9d5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
 9d8:	83 c7 01             	add    $0x1,%edi
 9db:	eb c8                	jmp    9a5 <ip_addr_pton+0x15>
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
 9e0:	84 d2                	test   %dl,%dl
 9e2:	75 14                	jne    9f8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
 9e4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 9e7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
 9ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
 9ed:	31 c0                	xor    %eax,%eax
}
 9ef:	5b                   	pop    %ebx
 9f0:	5e                   	pop    %esi
 9f1:	5f                   	pop    %edi
 9f2:	5d                   	pop    %ebp
 9f3:	c3                   	ret    
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
 9fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a00:	5b                   	pop    %ebx
 a01:	5e                   	pop    %esi
 a02:	5f                   	pop    %edi
 a03:	5d                   	pop    %ebp
 a04:	c3                   	ret    

00000a05 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 a05:	b8 01 00 00 00       	mov    $0x1,%eax
 a0a:	cd 40                	int    $0x40
 a0c:	c3                   	ret    

00000a0d <exit>:
SYSCALL(exit)
 a0d:	b8 02 00 00 00       	mov    $0x2,%eax
 a12:	cd 40                	int    $0x40
 a14:	c3                   	ret    

00000a15 <wait>:
SYSCALL(wait)
 a15:	b8 03 00 00 00       	mov    $0x3,%eax
 a1a:	cd 40                	int    $0x40
 a1c:	c3                   	ret    

00000a1d <pipe>:
SYSCALL(pipe)
 a1d:	b8 04 00 00 00       	mov    $0x4,%eax
 a22:	cd 40                	int    $0x40
 a24:	c3                   	ret    

00000a25 <read>:
SYSCALL(read)
 a25:	b8 05 00 00 00       	mov    $0x5,%eax
 a2a:	cd 40                	int    $0x40
 a2c:	c3                   	ret    

00000a2d <write>:
SYSCALL(write)
 a2d:	b8 10 00 00 00       	mov    $0x10,%eax
 a32:	cd 40                	int    $0x40
 a34:	c3                   	ret    

00000a35 <close>:
SYSCALL(close)
 a35:	b8 15 00 00 00       	mov    $0x15,%eax
 a3a:	cd 40                	int    $0x40
 a3c:	c3                   	ret    

00000a3d <kill>:
SYSCALL(kill)
 a3d:	b8 06 00 00 00       	mov    $0x6,%eax
 a42:	cd 40                	int    $0x40
 a44:	c3                   	ret    

00000a45 <exec>:
SYSCALL(exec)
 a45:	b8 07 00 00 00       	mov    $0x7,%eax
 a4a:	cd 40                	int    $0x40
 a4c:	c3                   	ret    

00000a4d <open>:
SYSCALL(open)
 a4d:	b8 0f 00 00 00       	mov    $0xf,%eax
 a52:	cd 40                	int    $0x40
 a54:	c3                   	ret    

00000a55 <mknod>:
SYSCALL(mknod)
 a55:	b8 11 00 00 00       	mov    $0x11,%eax
 a5a:	cd 40                	int    $0x40
 a5c:	c3                   	ret    

00000a5d <unlink>:
SYSCALL(unlink)
 a5d:	b8 12 00 00 00       	mov    $0x12,%eax
 a62:	cd 40                	int    $0x40
 a64:	c3                   	ret    

00000a65 <fstat>:
SYSCALL(fstat)
 a65:	b8 08 00 00 00       	mov    $0x8,%eax
 a6a:	cd 40                	int    $0x40
 a6c:	c3                   	ret    

00000a6d <link>:
SYSCALL(link)
 a6d:	b8 13 00 00 00       	mov    $0x13,%eax
 a72:	cd 40                	int    $0x40
 a74:	c3                   	ret    

00000a75 <mkdir>:
SYSCALL(mkdir)
 a75:	b8 14 00 00 00       	mov    $0x14,%eax
 a7a:	cd 40                	int    $0x40
 a7c:	c3                   	ret    

00000a7d <chdir>:
SYSCALL(chdir)
 a7d:	b8 09 00 00 00       	mov    $0x9,%eax
 a82:	cd 40                	int    $0x40
 a84:	c3                   	ret    

00000a85 <dup>:
SYSCALL(dup)
 a85:	b8 0a 00 00 00       	mov    $0xa,%eax
 a8a:	cd 40                	int    $0x40
 a8c:	c3                   	ret    

00000a8d <getpid>:
SYSCALL(getpid)
 a8d:	b8 0b 00 00 00       	mov    $0xb,%eax
 a92:	cd 40                	int    $0x40
 a94:	c3                   	ret    

00000a95 <sbrk>:
SYSCALL(sbrk)
 a95:	b8 0c 00 00 00       	mov    $0xc,%eax
 a9a:	cd 40                	int    $0x40
 a9c:	c3                   	ret    

00000a9d <sleep>:
SYSCALL(sleep)
 a9d:	b8 0d 00 00 00       	mov    $0xd,%eax
 aa2:	cd 40                	int    $0x40
 aa4:	c3                   	ret    

00000aa5 <uptime>:
SYSCALL(uptime)
 aa5:	b8 0e 00 00 00       	mov    $0xe,%eax
 aaa:	cd 40                	int    $0x40
 aac:	c3                   	ret    

00000aad <ioctl>:
# iotcl
SYSCALL(ioctl)
 aad:	b8 16 00 00 00       	mov    $0x16,%eax
 ab2:	cd 40                	int    $0x40
 ab4:	c3                   	ret    

00000ab5 <socket>:
# socket
SYSCALL(socket)
 ab5:	b8 17 00 00 00       	mov    $0x17,%eax
 aba:	cd 40                	int    $0x40
 abc:	c3                   	ret    

00000abd <bind>:
SYSCALL(bind)
 abd:	b8 19 00 00 00       	mov    $0x19,%eax
 ac2:	cd 40                	int    $0x40
 ac4:	c3                   	ret    

00000ac5 <listen>:
SYSCALL(listen)
 ac5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 aca:	cd 40                	int    $0x40
 acc:	c3                   	ret    

00000acd <accept>:
SYSCALL(accept)
 acd:	b8 1b 00 00 00       	mov    $0x1b,%eax
 ad2:	cd 40                	int    $0x40
 ad4:	c3                   	ret    

00000ad5 <recv>:
SYSCALL(recv)
 ad5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 ada:	cd 40                	int    $0x40
 adc:	c3                   	ret    

00000add <send>:
SYSCALL(send)
 add:	b8 1d 00 00 00       	mov    $0x1d,%eax
 ae2:	cd 40                	int    $0x40
 ae4:	c3                   	ret    

00000ae5 <recvfrom>:
SYSCALL(recvfrom)
 ae5:	b8 1e 00 00 00       	mov    $0x1e,%eax
 aea:	cd 40                	int    $0x40
 aec:	c3                   	ret    

00000aed <sendto>:
SYSCALL(sendto)
 aed:	b8 1f 00 00 00       	mov    $0x1f,%eax
 af2:	cd 40                	int    $0x40
 af4:	c3                   	ret    
 af5:	66 90                	xchg   %ax,%ax
 af7:	66 90                	xchg   %ax,%ax
 af9:	66 90                	xchg   %ax,%ax
 afb:	66 90                	xchg   %ax,%ax
 afd:	66 90                	xchg   %ax,%ax
 aff:	90                   	nop

00000b00 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	57                   	push   %edi
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
 b06:	83 ec 3c             	sub    $0x3c,%esp
 b09:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 b0c:	89 d1                	mov    %edx,%ecx
{
 b0e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 b11:	85 d2                	test   %edx,%edx
 b13:	0f 89 7f 00 00 00    	jns    b98 <printint+0x98>
 b19:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 b1d:	74 79                	je     b98 <printint+0x98>
    neg = 1;
 b1f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 b26:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 b28:	31 db                	xor    %ebx,%ebx
 b2a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 b2d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 b30:	89 c8                	mov    %ecx,%eax
 b32:	31 d2                	xor    %edx,%edx
 b34:	89 cf                	mov    %ecx,%edi
 b36:	f7 75 c4             	divl   -0x3c(%ebp)
 b39:	0f b6 92 d4 0f 00 00 	movzbl 0xfd4(%edx),%edx
 b40:	89 45 c0             	mov    %eax,-0x40(%ebp)
 b43:	89 d8                	mov    %ebx,%eax
 b45:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 b48:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 b4b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 b4e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 b51:	76 dd                	jbe    b30 <printint+0x30>
  if(neg)
 b53:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 b56:	85 c9                	test   %ecx,%ecx
 b58:	74 0c                	je     b66 <printint+0x66>
    buf[i++] = '-';
 b5a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 b5f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 b61:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 b66:	8b 7d b8             	mov    -0x48(%ebp),%edi
 b69:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 b6d:	eb 07                	jmp    b76 <printint+0x76>
 b6f:	90                   	nop
 b70:	0f b6 13             	movzbl (%ebx),%edx
 b73:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 b76:	83 ec 04             	sub    $0x4,%esp
 b79:	88 55 d7             	mov    %dl,-0x29(%ebp)
 b7c:	6a 01                	push   $0x1
 b7e:	56                   	push   %esi
 b7f:	57                   	push   %edi
 b80:	e8 a8 fe ff ff       	call   a2d <write>
  while(--i >= 0)
 b85:	83 c4 10             	add    $0x10,%esp
 b88:	39 de                	cmp    %ebx,%esi
 b8a:	75 e4                	jne    b70 <printint+0x70>
    putc(fd, buf[i]);
}
 b8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b8f:	5b                   	pop    %ebx
 b90:	5e                   	pop    %esi
 b91:	5f                   	pop    %edi
 b92:	5d                   	pop    %ebp
 b93:	c3                   	ret    
 b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 b98:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 b9f:	eb 87                	jmp    b28 <printint+0x28>
 ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ba8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 baf:	90                   	nop

00000bb0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 bb0:	f3 0f 1e fb          	endbr32 
 bb4:	55                   	push   %ebp
 bb5:	89 e5                	mov    %esp,%ebp
 bb7:	57                   	push   %edi
 bb8:	56                   	push   %esi
 bb9:	53                   	push   %ebx
 bba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bbd:	8b 75 0c             	mov    0xc(%ebp),%esi
 bc0:	0f b6 1e             	movzbl (%esi),%ebx
 bc3:	84 db                	test   %bl,%bl
 bc5:	0f 84 b4 00 00 00    	je     c7f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 bcb:	8d 45 10             	lea    0x10(%ebp),%eax
 bce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 bd1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 bd4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 bd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 bd9:	eb 33                	jmp    c0e <printf+0x5e>
 bdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bdf:	90                   	nop
 be0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 be3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 be8:	83 f8 25             	cmp    $0x25,%eax
 beb:	74 17                	je     c04 <printf+0x54>
  write(fd, &c, 1);
 bed:	83 ec 04             	sub    $0x4,%esp
 bf0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 bf3:	6a 01                	push   $0x1
 bf5:	57                   	push   %edi
 bf6:	ff 75 08             	pushl  0x8(%ebp)
 bf9:	e8 2f fe ff ff       	call   a2d <write>
 bfe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 c01:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 c04:	0f b6 1e             	movzbl (%esi),%ebx
 c07:	83 c6 01             	add    $0x1,%esi
 c0a:	84 db                	test   %bl,%bl
 c0c:	74 71                	je     c7f <printf+0xcf>
    c = fmt[i] & 0xff;
 c0e:	0f be cb             	movsbl %bl,%ecx
 c11:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 c14:	85 d2                	test   %edx,%edx
 c16:	74 c8                	je     be0 <printf+0x30>
      }
    } else if(state == '%'){
 c18:	83 fa 25             	cmp    $0x25,%edx
 c1b:	75 e7                	jne    c04 <printf+0x54>
      if(c == 'd'){
 c1d:	83 f8 64             	cmp    $0x64,%eax
 c20:	0f 84 9a 00 00 00    	je     cc0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 c26:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 c2c:	83 f9 70             	cmp    $0x70,%ecx
 c2f:	74 5f                	je     c90 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 c31:	83 f8 73             	cmp    $0x73,%eax
 c34:	0f 84 d6 00 00 00    	je     d10 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c3a:	83 f8 63             	cmp    $0x63,%eax
 c3d:	0f 84 8d 00 00 00    	je     cd0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 c43:	83 f8 25             	cmp    $0x25,%eax
 c46:	0f 84 b4 00 00 00    	je     d00 <printf+0x150>
  write(fd, &c, 1);
 c4c:	83 ec 04             	sub    $0x4,%esp
 c4f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 c53:	6a 01                	push   $0x1
 c55:	57                   	push   %edi
 c56:	ff 75 08             	pushl  0x8(%ebp)
 c59:	e8 cf fd ff ff       	call   a2d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 c5e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 c61:	83 c4 0c             	add    $0xc,%esp
 c64:	6a 01                	push   $0x1
 c66:	83 c6 01             	add    $0x1,%esi
 c69:	57                   	push   %edi
 c6a:	ff 75 08             	pushl  0x8(%ebp)
 c6d:	e8 bb fd ff ff       	call   a2d <write>
  for(i = 0; fmt[i]; i++){
 c72:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 c76:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 c79:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 c7b:	84 db                	test   %bl,%bl
 c7d:	75 8f                	jne    c0e <printf+0x5e>
    }
  }
}
 c7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c82:	5b                   	pop    %ebx
 c83:	5e                   	pop    %esi
 c84:	5f                   	pop    %edi
 c85:	5d                   	pop    %ebp
 c86:	c3                   	ret    
 c87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c8e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 c90:	83 ec 0c             	sub    $0xc,%esp
 c93:	b9 10 00 00 00       	mov    $0x10,%ecx
 c98:	6a 00                	push   $0x0
 c9a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 c9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ca0:	8b 13                	mov    (%ebx),%edx
 ca2:	e8 59 fe ff ff       	call   b00 <printint>
        ap++;
 ca7:	89 d8                	mov    %ebx,%eax
 ca9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 cac:	31 d2                	xor    %edx,%edx
        ap++;
 cae:	83 c0 04             	add    $0x4,%eax
 cb1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 cb4:	e9 4b ff ff ff       	jmp    c04 <printf+0x54>
 cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 cc0:	83 ec 0c             	sub    $0xc,%esp
 cc3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 cc8:	6a 01                	push   $0x1
 cca:	eb ce                	jmp    c9a <printf+0xea>
 ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 cd0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 cd3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 cd6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 cd8:	6a 01                	push   $0x1
        ap++;
 cda:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 cdd:	57                   	push   %edi
 cde:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 ce1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 ce4:	e8 44 fd ff ff       	call   a2d <write>
        ap++;
 ce9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 cec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 cef:	31 d2                	xor    %edx,%edx
 cf1:	e9 0e ff ff ff       	jmp    c04 <printf+0x54>
 cf6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cfd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 d00:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 d03:	83 ec 04             	sub    $0x4,%esp
 d06:	e9 59 ff ff ff       	jmp    c64 <printf+0xb4>
 d0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d0f:	90                   	nop
        s = (char*)*ap;
 d10:	8b 45 d0             	mov    -0x30(%ebp),%eax
 d13:	8b 18                	mov    (%eax),%ebx
        ap++;
 d15:	83 c0 04             	add    $0x4,%eax
 d18:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 d1b:	85 db                	test   %ebx,%ebx
 d1d:	74 17                	je     d36 <printf+0x186>
        while(*s != 0){
 d1f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 d22:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 d24:	84 c0                	test   %al,%al
 d26:	0f 84 d8 fe ff ff    	je     c04 <printf+0x54>
 d2c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 d2f:	89 de                	mov    %ebx,%esi
 d31:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d34:	eb 1a                	jmp    d50 <printf+0x1a0>
          s = "(null)";
 d36:	bb ca 0f 00 00       	mov    $0xfca,%ebx
        while(*s != 0){
 d3b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 d3e:	b8 28 00 00 00       	mov    $0x28,%eax
 d43:	89 de                	mov    %ebx,%esi
 d45:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d4f:	90                   	nop
  write(fd, &c, 1);
 d50:	83 ec 04             	sub    $0x4,%esp
          s++;
 d53:	83 c6 01             	add    $0x1,%esi
 d56:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 d59:	6a 01                	push   $0x1
 d5b:	57                   	push   %edi
 d5c:	53                   	push   %ebx
 d5d:	e8 cb fc ff ff       	call   a2d <write>
        while(*s != 0){
 d62:	0f b6 06             	movzbl (%esi),%eax
 d65:	83 c4 10             	add    $0x10,%esp
 d68:	84 c0                	test   %al,%al
 d6a:	75 e4                	jne    d50 <printf+0x1a0>
 d6c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 d6f:	31 d2                	xor    %edx,%edx
 d71:	e9 8e fe ff ff       	jmp    c04 <printf+0x54>
 d76:	66 90                	xchg   %ax,%ax
 d78:	66 90                	xchg   %ax,%ax
 d7a:	66 90                	xchg   %ax,%ax
 d7c:	66 90                	xchg   %ax,%ax
 d7e:	66 90                	xchg   %ax,%ax

00000d80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 d80:	f3 0f 1e fb          	endbr32 
 d84:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d85:	a1 24 14 00 00       	mov    0x1424,%eax
{
 d8a:	89 e5                	mov    %esp,%ebp
 d8c:	57                   	push   %edi
 d8d:	56                   	push   %esi
 d8e:	53                   	push   %ebx
 d8f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d92:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 d94:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d97:	39 c8                	cmp    %ecx,%eax
 d99:	73 15                	jae    db0 <free+0x30>
 d9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d9f:	90                   	nop
 da0:	39 d1                	cmp    %edx,%ecx
 da2:	72 14                	jb     db8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 da4:	39 d0                	cmp    %edx,%eax
 da6:	73 10                	jae    db8 <free+0x38>
{
 da8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 daa:	8b 10                	mov    (%eax),%edx
 dac:	39 c8                	cmp    %ecx,%eax
 dae:	72 f0                	jb     da0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 db0:	39 d0                	cmp    %edx,%eax
 db2:	72 f4                	jb     da8 <free+0x28>
 db4:	39 d1                	cmp    %edx,%ecx
 db6:	73 f0                	jae    da8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 db8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 dbb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 dbe:	39 fa                	cmp    %edi,%edx
 dc0:	74 1e                	je     de0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 dc2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 dc5:	8b 50 04             	mov    0x4(%eax),%edx
 dc8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 dcb:	39 f1                	cmp    %esi,%ecx
 dcd:	74 28                	je     df7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 dcf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 dd1:	5b                   	pop    %ebx
  freep = p;
 dd2:	a3 24 14 00 00       	mov    %eax,0x1424
}
 dd7:	5e                   	pop    %esi
 dd8:	5f                   	pop    %edi
 dd9:	5d                   	pop    %ebp
 dda:	c3                   	ret    
 ddb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ddf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 de0:	03 72 04             	add    0x4(%edx),%esi
 de3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 de6:	8b 10                	mov    (%eax),%edx
 de8:	8b 12                	mov    (%edx),%edx
 dea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ded:	8b 50 04             	mov    0x4(%eax),%edx
 df0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 df3:	39 f1                	cmp    %esi,%ecx
 df5:	75 d8                	jne    dcf <free+0x4f>
    p->s.size += bp->s.size;
 df7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 dfa:	a3 24 14 00 00       	mov    %eax,0x1424
    p->s.size += bp->s.size;
 dff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 e02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 e05:	89 10                	mov    %edx,(%eax)
}
 e07:	5b                   	pop    %ebx
 e08:	5e                   	pop    %esi
 e09:	5f                   	pop    %edi
 e0a:	5d                   	pop    %ebp
 e0b:	c3                   	ret    
 e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 e10:	f3 0f 1e fb          	endbr32 
 e14:	55                   	push   %ebp
 e15:	89 e5                	mov    %esp,%ebp
 e17:	57                   	push   %edi
 e18:	56                   	push   %esi
 e19:	53                   	push   %ebx
 e1a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e1d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 e20:	8b 3d 24 14 00 00    	mov    0x1424,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e26:	8d 70 07             	lea    0x7(%eax),%esi
 e29:	c1 ee 03             	shr    $0x3,%esi
 e2c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 e2f:	85 ff                	test   %edi,%edi
 e31:	0f 84 a9 00 00 00    	je     ee0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e37:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 e39:	8b 48 04             	mov    0x4(%eax),%ecx
 e3c:	39 f1                	cmp    %esi,%ecx
 e3e:	73 6d                	jae    ead <malloc+0x9d>
 e40:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 e46:	bb 00 10 00 00       	mov    $0x1000,%ebx
 e4b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 e4e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 e55:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 e58:	eb 17                	jmp    e71 <malloc+0x61>
 e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e60:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 e62:	8b 4a 04             	mov    0x4(%edx),%ecx
 e65:	39 f1                	cmp    %esi,%ecx
 e67:	73 4f                	jae    eb8 <malloc+0xa8>
 e69:	8b 3d 24 14 00 00    	mov    0x1424,%edi
 e6f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 e71:	39 c7                	cmp    %eax,%edi
 e73:	75 eb                	jne    e60 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 e75:	83 ec 0c             	sub    $0xc,%esp
 e78:	ff 75 e4             	pushl  -0x1c(%ebp)
 e7b:	e8 15 fc ff ff       	call   a95 <sbrk>
  if(p == (char*)-1)
 e80:	83 c4 10             	add    $0x10,%esp
 e83:	83 f8 ff             	cmp    $0xffffffff,%eax
 e86:	74 1b                	je     ea3 <malloc+0x93>
  hp->s.size = nu;
 e88:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 e8b:	83 ec 0c             	sub    $0xc,%esp
 e8e:	83 c0 08             	add    $0x8,%eax
 e91:	50                   	push   %eax
 e92:	e8 e9 fe ff ff       	call   d80 <free>
  return freep;
 e97:	a1 24 14 00 00       	mov    0x1424,%eax
      if((p = morecore(nunits)) == 0)
 e9c:	83 c4 10             	add    $0x10,%esp
 e9f:	85 c0                	test   %eax,%eax
 ea1:	75 bd                	jne    e60 <malloc+0x50>
        return 0;
  }
}
 ea3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 ea6:	31 c0                	xor    %eax,%eax
}
 ea8:	5b                   	pop    %ebx
 ea9:	5e                   	pop    %esi
 eaa:	5f                   	pop    %edi
 eab:	5d                   	pop    %ebp
 eac:	c3                   	ret    
    if(p->s.size >= nunits){
 ead:	89 c2                	mov    %eax,%edx
 eaf:	89 f8                	mov    %edi,%eax
 eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 eb8:	39 ce                	cmp    %ecx,%esi
 eba:	74 54                	je     f10 <malloc+0x100>
        p->s.size -= nunits;
 ebc:	29 f1                	sub    %esi,%ecx
 ebe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 ec1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 ec4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 ec7:	a3 24 14 00 00       	mov    %eax,0x1424
}
 ecc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ecf:	8d 42 08             	lea    0x8(%edx),%eax
}
 ed2:	5b                   	pop    %ebx
 ed3:	5e                   	pop    %esi
 ed4:	5f                   	pop    %edi
 ed5:	5d                   	pop    %ebp
 ed6:	c3                   	ret    
 ed7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ede:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 ee0:	c7 05 24 14 00 00 28 	movl   $0x1428,0x1424
 ee7:	14 00 00 
    base.s.size = 0;
 eea:	bf 28 14 00 00       	mov    $0x1428,%edi
    base.s.ptr = freep = prevp = &base;
 eef:	c7 05 28 14 00 00 28 	movl   $0x1428,0x1428
 ef6:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ef9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 efb:	c7 05 2c 14 00 00 00 	movl   $0x0,0x142c
 f02:	00 00 00 
    if(p->s.size >= nunits){
 f05:	e9 36 ff ff ff       	jmp    e40 <malloc+0x30>
 f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 f10:	8b 0a                	mov    (%edx),%ecx
 f12:	89 08                	mov    %ecx,(%eax)
 f14:	eb b1                	jmp    ec7 <malloc+0xb7>
