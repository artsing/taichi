
build/bin/_sh：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       8:	83 e4 f0             	and    $0xfffffff0,%esp
       b:	ff 71 fc             	pushl  -0x4(%ecx)
       e:	55                   	push   %ebp
       f:	89 e5                	mov    %esp,%ebp
      11:	51                   	push   %ecx
      12:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("/dev/console", O_RDWR)) >= 0){
      15:	eb 12                	jmp    29 <main+0x29>
      17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      1e:	66 90                	xchg   %ax,%ax
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f b7 00 00 00    	jg     e0 <main+0xe0>
  while((fd = open("/dev/console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 4f 18 00 00       	push   $0x184f
      33:	e8 a5 12 00 00       	call   12dd <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
      3f:	eb 32                	jmp    73 <main+0x73>
      41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      48:	80 3d 42 20 00 00 20 	cmpb   $0x20,0x2042
      4f:	74 51                	je     a2 <main+0xa2>
      51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      58:	e8 38 12 00 00       	call   1295 <fork>
  if(pid == -1)
      5d:	83 f8 ff             	cmp    $0xffffffff,%eax
      60:	0f 84 9d 00 00 00    	je     103 <main+0x103>
    if(fork1() == 0)
      66:	85 c0                	test   %eax,%eax
      68:	0f 84 80 00 00 00    	je     ee <main+0xee>
    wait();
      6e:	e8 32 12 00 00       	call   12a5 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      73:	83 ec 08             	sub    $0x8,%esp
      76:	6a 64                	push   $0x64
      78:	68 40 20 00 00       	push   $0x2040
      7d:	e8 8e 00 00 00       	call   110 <getcmd>
      82:	83 c4 10             	add    $0x10,%esp
      85:	85 c0                	test   %eax,%eax
      87:	78 14                	js     9d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      89:	80 3d 40 20 00 00 63 	cmpb   $0x63,0x2040
      90:	75 c6                	jne    58 <main+0x58>
      92:	80 3d 41 20 00 00 64 	cmpb   $0x64,0x2041
      99:	75 bd                	jne    58 <main+0x58>
      9b:	eb ab                	jmp    48 <main+0x48>
  exit();
      9d:	e8 fb 11 00 00       	call   129d <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
      a2:	83 ec 0c             	sub    $0xc,%esp
      a5:	68 40 20 00 00       	push   $0x2040
      aa:	e8 a1 0b 00 00       	call   c50 <strlen>
      if(chdir(buf+3) < 0)
      af:	c7 04 24 43 20 00 00 	movl   $0x2043,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      b6:	c6 80 3f 20 00 00 00 	movb   $0x0,0x203f(%eax)
      if(chdir(buf+3) < 0)
      bd:	e8 4b 12 00 00       	call   130d <chdir>
      c2:	83 c4 10             	add    $0x10,%esp
      c5:	85 c0                	test   %eax,%eax
      c7:	79 aa                	jns    73 <main+0x73>
        printf(2, "cannot cd %s\n", buf+3);
      c9:	50                   	push   %eax
      ca:	68 43 20 00 00       	push   $0x2043
      cf:	68 5c 18 00 00       	push   $0x185c
      d4:	6a 02                	push   $0x2
      d6:	e8 65 13 00 00       	call   1440 <printf>
      db:	83 c4 10             	add    $0x10,%esp
      de:	eb 93                	jmp    73 <main+0x73>
      close(fd);
      e0:	83 ec 0c             	sub    $0xc,%esp
      e3:	50                   	push   %eax
      e4:	e8 dc 11 00 00       	call   12c5 <close>
      break;
      e9:	83 c4 10             	add    $0x10,%esp
      ec:	eb 85                	jmp    73 <main+0x73>
      runcmd(parsecmd(buf));
      ee:	83 ec 0c             	sub    $0xc,%esp
      f1:	68 40 20 00 00       	push   $0x2040
      f6:	e8 05 0a 00 00       	call   b00 <parsecmd>
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 7d 00 00 00       	call   180 <runcmd>
    panic("fork");
     103:	83 ec 0c             	sub    $0xc,%esp
     106:	68 d8 17 00 00       	push   $0x17d8
     10b:	e8 50 00 00 00       	call   160 <panic>

00000110 <getcmd>:
{
     110:	f3 0f 1e fb          	endbr32 
     114:	55                   	push   %ebp
     115:	89 e5                	mov    %esp,%ebp
     117:	56                   	push   %esi
     118:	53                   	push   %ebx
     119:	8b 75 0c             	mov    0xc(%ebp),%esi
     11c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     11f:	83 ec 08             	sub    $0x8,%esp
     122:	68 a8 17 00 00       	push   $0x17a8
     127:	6a 02                	push   $0x2
     129:	e8 12 13 00 00       	call   1440 <printf>
  memset(buf, 0, nbuf);
     12e:	83 c4 0c             	add    $0xc,%esp
     131:	56                   	push   %esi
     132:	6a 00                	push   $0x0
     134:	53                   	push   %ebx
     135:	e8 56 0b 00 00       	call   c90 <memset>
  gets(buf, nbuf);
     13a:	58                   	pop    %eax
     13b:	5a                   	pop    %edx
     13c:	56                   	push   %esi
     13d:	53                   	push   %ebx
     13e:	e8 ad 0b 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
     143:	83 c4 10             	add    $0x10,%esp
     146:	31 c0                	xor    %eax,%eax
     148:	80 3b 00             	cmpb   $0x0,(%ebx)
     14b:	0f 94 c0             	sete   %al
}
     14e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     151:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
     152:	f7 d8                	neg    %eax
}
     154:	5e                   	pop    %esi
     155:	5d                   	pop    %ebp
     156:	c3                   	ret    
     157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     15e:	66 90                	xchg   %ax,%ax

00000160 <panic>:
{
     160:	f3 0f 1e fb          	endbr32 
     164:	55                   	push   %ebp
     165:	89 e5                	mov    %esp,%ebp
     167:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     16a:	ff 75 08             	pushl  0x8(%ebp)
     16d:	68 4b 18 00 00       	push   $0x184b
     172:	6a 02                	push   $0x2
     174:	e8 c7 12 00 00       	call   1440 <printf>
  exit();
     179:	e8 1f 11 00 00       	call   129d <exit>
     17e:	66 90                	xchg   %ax,%ax

00000180 <runcmd>:
{
     180:	f3 0f 1e fb          	endbr32 
     184:	55                   	push   %ebp
     185:	89 e5                	mov    %esp,%ebp
     187:	56                   	push   %esi
     188:	53                   	push   %ebx
     189:	81 ec 10 01 00 00    	sub    $0x110,%esp
     18f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     192:	85 db                	test   %ebx,%ebx
     194:	0f 84 86 00 00 00    	je     220 <runcmd+0xa0>
  switch(cmd->type){
     19a:	83 3b 05             	cmpl   $0x5,(%ebx)
     19d:	0f 87 32 01 00 00    	ja     2d5 <runcmd+0x155>
     1a3:	8b 03                	mov    (%ebx),%eax
     1a5:	3e ff 24 85 6c 18 00 	notrack jmp *0x186c(,%eax,4)
     1ac:	00 
    if(pipe(p) < 0)
     1ad:	83 ec 0c             	sub    $0xc,%esp
     1b0:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
     1b6:	50                   	push   %eax
     1b7:	e8 f1 10 00 00       	call   12ad <pipe>
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	85 c0                	test   %eax,%eax
     1c1:	0f 88 30 01 00 00    	js     2f7 <runcmd+0x177>
  pid = fork();
     1c7:	e8 c9 10 00 00       	call   1295 <fork>
  if(pid == -1)
     1cc:	83 f8 ff             	cmp    $0xffffffff,%eax
     1cf:	0f 84 9d 01 00 00    	je     372 <runcmd+0x1f2>
    if(fork1() == 0){
     1d5:	85 c0                	test   %eax,%eax
     1d7:	0f 84 27 01 00 00    	je     304 <runcmd+0x184>
  pid = fork();
     1dd:	e8 b3 10 00 00       	call   1295 <fork>
  if(pid == -1)
     1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1e5:	0f 84 87 01 00 00    	je     372 <runcmd+0x1f2>
    if(fork1() == 0){
     1eb:	85 c0                	test   %eax,%eax
     1ed:	0f 84 48 01 00 00    	je     33b <runcmd+0x1bb>
    close(p[0]);
     1f3:	83 ec 0c             	sub    $0xc,%esp
     1f6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
     1fc:	e8 c4 10 00 00       	call   12c5 <close>
    close(p[1]);
     201:	58                   	pop    %eax
     202:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
     208:	e8 b8 10 00 00       	call   12c5 <close>
    wait();
     20d:	e8 93 10 00 00       	call   12a5 <wait>
    wait();
     212:	e8 8e 10 00 00       	call   12a5 <wait>
    break;
     217:	83 c4 10             	add    $0x10,%esp
     21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     220:	e8 78 10 00 00       	call   129d <exit>
  pid = fork();
     225:	e8 6b 10 00 00       	call   1295 <fork>
  if(pid == -1)
     22a:	83 f8 ff             	cmp    $0xffffffff,%eax
     22d:	0f 84 3f 01 00 00    	je     372 <runcmd+0x1f2>
    if(fork1() == 0)
     233:	85 c0                	test   %eax,%eax
     235:	75 e9                	jne    220 <runcmd+0xa0>
     237:	e9 8e 00 00 00       	jmp    2ca <runcmd+0x14a>
    if(ecmd->argv[0] == 0)
     23c:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
     240:	74 de                	je     220 <runcmd+0xa0>
    strcpy(buf, "/bin/");
     242:	8d b5 f8 fe ff ff    	lea    -0x108(%ebp),%esi
     248:	50                   	push   %eax
     249:	50                   	push   %eax
     24a:	68 b2 17 00 00       	push   $0x17b2
     24f:	56                   	push   %esi
     250:	e8 1b 09 00 00       	call   b70 <strcpy>
    strcat_s(buf, ecmd->argv[0], 256);
     255:	83 c4 0c             	add    $0xc,%esp
     258:	68 00 01 00 00       	push   $0x100
     25d:	ff 73 04             	pushl  0x4(%ebx)
     260:	56                   	push   %esi
     261:	e8 3a 09 00 00       	call   ba0 <strcat_s>
    exec(buf, ecmd->argv);
     266:	58                   	pop    %eax
     267:	8d 43 04             	lea    0x4(%ebx),%eax
     26a:	5a                   	pop    %edx
     26b:	50                   	push   %eax
     26c:	56                   	push   %esi
     26d:	e8 63 10 00 00       	call   12d5 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     272:	83 c4 0c             	add    $0xc,%esp
     275:	ff 73 04             	pushl  0x4(%ebx)
     278:	68 b8 17 00 00       	push   $0x17b8
     27d:	6a 02                	push   $0x2
     27f:	e8 bc 11 00 00       	call   1440 <printf>
    break;
     284:	83 c4 10             	add    $0x10,%esp
     287:	eb 97                	jmp    220 <runcmd+0xa0>
  pid = fork();
     289:	e8 07 10 00 00       	call   1295 <fork>
  if(pid == -1)
     28e:	83 f8 ff             	cmp    $0xffffffff,%eax
     291:	0f 84 db 00 00 00    	je     372 <runcmd+0x1f2>
    if(fork1() == 0)
     297:	85 c0                	test   %eax,%eax
     299:	74 2f                	je     2ca <runcmd+0x14a>
    wait();
     29b:	e8 05 10 00 00       	call   12a5 <wait>
    runcmd(lcmd->right);
     2a0:	83 ec 0c             	sub    $0xc,%esp
     2a3:	ff 73 08             	pushl  0x8(%ebx)
     2a6:	e8 d5 fe ff ff       	call   180 <runcmd>
    close(rcmd->fd);
     2ab:	83 ec 0c             	sub    $0xc,%esp
     2ae:	ff 73 14             	pushl  0x14(%ebx)
     2b1:	e8 0f 10 00 00       	call   12c5 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     2b6:	59                   	pop    %ecx
     2b7:	5e                   	pop    %esi
     2b8:	ff 73 10             	pushl  0x10(%ebx)
     2bb:	ff 73 08             	pushl  0x8(%ebx)
     2be:	e8 1a 10 00 00       	call   12dd <open>
     2c3:	83 c4 10             	add    $0x10,%esp
     2c6:	85 c0                	test   %eax,%eax
     2c8:	78 18                	js     2e2 <runcmd+0x162>
      runcmd(bcmd->cmd);
     2ca:	83 ec 0c             	sub    $0xc,%esp
     2cd:	ff 73 04             	pushl  0x4(%ebx)
     2d0:	e8 ab fe ff ff       	call   180 <runcmd>
    panic("runcmd");
     2d5:	83 ec 0c             	sub    $0xc,%esp
     2d8:	68 ab 17 00 00       	push   $0x17ab
     2dd:	e8 7e fe ff ff       	call   160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2e2:	52                   	push   %edx
     2e3:	ff 73 08             	pushl  0x8(%ebx)
     2e6:	68 c8 17 00 00       	push   $0x17c8
     2eb:	6a 02                	push   $0x2
     2ed:	e8 4e 11 00 00       	call   1440 <printf>
      exit();
     2f2:	e8 a6 0f 00 00       	call   129d <exit>
      panic("pipe");
     2f7:	83 ec 0c             	sub    $0xc,%esp
     2fa:	68 dd 17 00 00       	push   $0x17dd
     2ff:	e8 5c fe ff ff       	call   160 <panic>
      close(1);
     304:	83 ec 0c             	sub    $0xc,%esp
     307:	6a 01                	push   $0x1
     309:	e8 b7 0f 00 00       	call   12c5 <close>
      dup(p[1]);
     30e:	58                   	pop    %eax
     30f:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
     315:	e8 fb 0f 00 00       	call   1315 <dup>
      close(p[0]);
     31a:	58                   	pop    %eax
     31b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
     321:	e8 9f 0f 00 00       	call   12c5 <close>
      close(p[1]);
     326:	58                   	pop    %eax
     327:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
     32d:	e8 93 0f 00 00       	call   12c5 <close>
      runcmd(pcmd->left);
     332:	58                   	pop    %eax
     333:	ff 73 04             	pushl  0x4(%ebx)
     336:	e8 45 fe ff ff       	call   180 <runcmd>
      close(0);
     33b:	83 ec 0c             	sub    $0xc,%esp
     33e:	6a 00                	push   $0x0
     340:	e8 80 0f 00 00       	call   12c5 <close>
      dup(p[0]);
     345:	5a                   	pop    %edx
     346:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
     34c:	e8 c4 0f 00 00       	call   1315 <dup>
      close(p[0]);
     351:	59                   	pop    %ecx
     352:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
     358:	e8 68 0f 00 00       	call   12c5 <close>
      close(p[1]);
     35d:	5e                   	pop    %esi
     35e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
     364:	e8 5c 0f 00 00       	call   12c5 <close>
      runcmd(pcmd->right);
     369:	58                   	pop    %eax
     36a:	ff 73 08             	pushl  0x8(%ebx)
     36d:	e8 0e fe ff ff       	call   180 <runcmd>
    panic("fork");
     372:	83 ec 0c             	sub    $0xc,%esp
     375:	68 d8 17 00 00       	push   $0x17d8
     37a:	e8 e1 fd ff ff       	call   160 <panic>
     37f:	90                   	nop

00000380 <fork1>:
{
     380:	f3 0f 1e fb          	endbr32 
     384:	55                   	push   %ebp
     385:	89 e5                	mov    %esp,%ebp
     387:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     38a:	e8 06 0f 00 00       	call   1295 <fork>
  if(pid == -1)
     38f:	83 f8 ff             	cmp    $0xffffffff,%eax
     392:	74 02                	je     396 <fork1+0x16>
  return pid;
}
     394:	c9                   	leave  
     395:	c3                   	ret    
    panic("fork");
     396:	83 ec 0c             	sub    $0xc,%esp
     399:	68 d8 17 00 00       	push   $0x17d8
     39e:	e8 bd fd ff ff       	call   160 <panic>
     3a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003b0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3b0:	f3 0f 1e fb          	endbr32 
     3b4:	55                   	push   %ebp
     3b5:	89 e5                	mov    %esp,%ebp
     3b7:	53                   	push   %ebx
     3b8:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3bb:	6a 54                	push   $0x54
     3bd:	e8 de 12 00 00       	call   16a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3c2:	83 c4 0c             	add    $0xc,%esp
     3c5:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     3c7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c9:	6a 00                	push   $0x0
     3cb:	50                   	push   %eax
     3cc:	e8 bf 08 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     3d1:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3d7:	89 d8                	mov    %ebx,%eax
     3d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3dc:	c9                   	leave  
     3dd:	c3                   	ret    
     3de:	66 90                	xchg   %ax,%ax

000003e0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e0:	f3 0f 1e fb          	endbr32 
     3e4:	55                   	push   %ebp
     3e5:	89 e5                	mov    %esp,%ebp
     3e7:	53                   	push   %ebx
     3e8:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3eb:	6a 18                	push   $0x18
     3ed:	e8 ae 12 00 00       	call   16a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3f2:	83 c4 0c             	add    $0xc,%esp
     3f5:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     3f7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f9:	6a 00                	push   $0x0
     3fb:	50                   	push   %eax
     3fc:	e8 8f 08 00 00       	call   c90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     401:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     404:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     40a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     40d:	8b 45 0c             	mov    0xc(%ebp),%eax
     410:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     413:	8b 45 10             	mov    0x10(%ebp),%eax
     416:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     419:	8b 45 14             	mov    0x14(%ebp),%eax
     41c:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     41f:	8b 45 18             	mov    0x18(%ebp),%eax
     422:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     425:	89 d8                	mov    %ebx,%eax
     427:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     42a:	c9                   	leave  
     42b:	c3                   	ret    
     42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     430:	f3 0f 1e fb          	endbr32 
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	53                   	push   %ebx
     438:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     43b:	6a 0c                	push   $0xc
     43d:	e8 5e 12 00 00       	call   16a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     442:	83 c4 0c             	add    $0xc,%esp
     445:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     447:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     449:	6a 00                	push   $0x0
     44b:	50                   	push   %eax
     44c:	e8 3f 08 00 00       	call   c90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     451:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     454:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     45a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     45d:	8b 45 0c             	mov    0xc(%ebp),%eax
     460:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     463:	89 d8                	mov    %ebx,%eax
     465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     468:	c9                   	leave  
     469:	c3                   	ret    
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000470 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     470:	f3 0f 1e fb          	endbr32 
     474:	55                   	push   %ebp
     475:	89 e5                	mov    %esp,%ebp
     477:	53                   	push   %ebx
     478:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     47b:	6a 0c                	push   $0xc
     47d:	e8 1e 12 00 00       	call   16a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     482:	83 c4 0c             	add    $0xc,%esp
     485:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     487:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     489:	6a 00                	push   $0x0
     48b:	50                   	push   %eax
     48c:	e8 ff 07 00 00       	call   c90 <memset>
  cmd->type = LIST;
  cmd->left = left;
     491:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     494:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     49a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     49d:	8b 45 0c             	mov    0xc(%ebp),%eax
     4a0:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     4a3:	89 d8                	mov    %ebx,%eax
     4a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4a8:	c9                   	leave  
     4a9:	c3                   	ret    
     4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4b0:	f3 0f 1e fb          	endbr32 
     4b4:	55                   	push   %ebp
     4b5:	89 e5                	mov    %esp,%ebp
     4b7:	53                   	push   %ebx
     4b8:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4bb:	6a 08                	push   $0x8
     4bd:	e8 de 11 00 00       	call   16a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4c2:	83 c4 0c             	add    $0xc,%esp
     4c5:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     4c7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4c9:	6a 00                	push   $0x0
     4cb:	50                   	push   %eax
     4cc:	e8 bf 07 00 00       	call   c90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4d1:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     4d4:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4da:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4dd:	89 d8                	mov    %ebx,%eax
     4df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4e2:	c9                   	leave  
     4e3:	c3                   	ret    
     4e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4ef:	90                   	nop

000004f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4f0:	f3 0f 1e fb          	endbr32 
     4f4:	55                   	push   %ebp
     4f5:	89 e5                	mov    %esp,%ebp
     4f7:	57                   	push   %edi
     4f8:	56                   	push   %esi
     4f9:	53                   	push   %ebx
     4fa:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     4fd:	8b 45 08             	mov    0x8(%ebp),%eax
{
     500:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     503:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     506:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     508:	39 df                	cmp    %ebx,%edi
     50a:	72 0b                	jb     517 <gettoken+0x27>
     50c:	eb 21                	jmp    52f <gettoken+0x3f>
     50e:	66 90                	xchg   %ax,%ax
    s++;
     510:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     513:	39 fb                	cmp    %edi,%ebx
     515:	74 18                	je     52f <gettoken+0x3f>
     517:	0f be 07             	movsbl (%edi),%eax
     51a:	83 ec 08             	sub    $0x8,%esp
     51d:	50                   	push   %eax
     51e:	68 2c 20 00 00       	push   $0x202c
     523:	e8 88 07 00 00       	call   cb0 <strchr>
     528:	83 c4 10             	add    $0x10,%esp
     52b:	85 c0                	test   %eax,%eax
     52d:	75 e1                	jne    510 <gettoken+0x20>
  if(q)
     52f:	85 f6                	test   %esi,%esi
     531:	74 02                	je     535 <gettoken+0x45>
    *q = s;
     533:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     535:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     538:	3c 3c                	cmp    $0x3c,%al
     53a:	0f 8f d0 00 00 00    	jg     610 <gettoken+0x120>
     540:	3c 3a                	cmp    $0x3a,%al
     542:	0f 8f b4 00 00 00    	jg     5fc <gettoken+0x10c>
     548:	84 c0                	test   %al,%al
     54a:	75 44                	jne    590 <gettoken+0xa0>
     54c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     54e:	8b 55 14             	mov    0x14(%ebp),%edx
     551:	85 d2                	test   %edx,%edx
     553:	74 05                	je     55a <gettoken+0x6a>
    *eq = s;
     555:	8b 45 14             	mov    0x14(%ebp),%eax
     558:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     55a:	39 df                	cmp    %ebx,%edi
     55c:	72 09                	jb     567 <gettoken+0x77>
     55e:	eb 1f                	jmp    57f <gettoken+0x8f>
    s++;
     560:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     563:	39 fb                	cmp    %edi,%ebx
     565:	74 18                	je     57f <gettoken+0x8f>
     567:	0f be 07             	movsbl (%edi),%eax
     56a:	83 ec 08             	sub    $0x8,%esp
     56d:	50                   	push   %eax
     56e:	68 2c 20 00 00       	push   $0x202c
     573:	e8 38 07 00 00       	call   cb0 <strchr>
     578:	83 c4 10             	add    $0x10,%esp
     57b:	85 c0                	test   %eax,%eax
     57d:	75 e1                	jne    560 <gettoken+0x70>
  *ps = s;
     57f:	8b 45 08             	mov    0x8(%ebp),%eax
     582:	89 38                	mov    %edi,(%eax)
  return ret;
}
     584:	8d 65 f4             	lea    -0xc(%ebp),%esp
     587:	89 f0                	mov    %esi,%eax
     589:	5b                   	pop    %ebx
     58a:	5e                   	pop    %esi
     58b:	5f                   	pop    %edi
     58c:	5d                   	pop    %ebp
     58d:	c3                   	ret    
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	79 5e                	jns    5f0 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     592:	39 fb                	cmp    %edi,%ebx
     594:	77 34                	ja     5ca <gettoken+0xda>
  if(eq)
     596:	8b 45 14             	mov    0x14(%ebp),%eax
     599:	be 61 00 00 00       	mov    $0x61,%esi
     59e:	85 c0                	test   %eax,%eax
     5a0:	75 b3                	jne    555 <gettoken+0x65>
     5a2:	eb db                	jmp    57f <gettoken+0x8f>
     5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5a8:	0f be 07             	movsbl (%edi),%eax
     5ab:	83 ec 08             	sub    $0x8,%esp
     5ae:	50                   	push   %eax
     5af:	68 24 20 00 00       	push   $0x2024
     5b4:	e8 f7 06 00 00       	call   cb0 <strchr>
     5b9:	83 c4 10             	add    $0x10,%esp
     5bc:	85 c0                	test   %eax,%eax
     5be:	75 22                	jne    5e2 <gettoken+0xf2>
      s++;
     5c0:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5c3:	39 fb                	cmp    %edi,%ebx
     5c5:	74 cf                	je     596 <gettoken+0xa6>
     5c7:	0f b6 07             	movzbl (%edi),%eax
     5ca:	83 ec 08             	sub    $0x8,%esp
     5cd:	0f be f0             	movsbl %al,%esi
     5d0:	56                   	push   %esi
     5d1:	68 2c 20 00 00       	push   $0x202c
     5d6:	e8 d5 06 00 00       	call   cb0 <strchr>
     5db:	83 c4 10             	add    $0x10,%esp
     5de:	85 c0                	test   %eax,%eax
     5e0:	74 c6                	je     5a8 <gettoken+0xb8>
    ret = 'a';
     5e2:	be 61 00 00 00       	mov    $0x61,%esi
     5e7:	e9 62 ff ff ff       	jmp    54e <gettoken+0x5e>
     5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5f0:	3c 26                	cmp    $0x26,%al
     5f2:	74 08                	je     5fc <gettoken+0x10c>
     5f4:	8d 48 d8             	lea    -0x28(%eax),%ecx
     5f7:	80 f9 01             	cmp    $0x1,%cl
     5fa:	77 96                	ja     592 <gettoken+0xa2>
  ret = *s;
     5fc:	0f be f0             	movsbl %al,%esi
    s++;
     5ff:	83 c7 01             	add    $0x1,%edi
    break;
     602:	e9 47 ff ff ff       	jmp    54e <gettoken+0x5e>
     607:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     60e:	66 90                	xchg   %ax,%ax
  switch(*s){
     610:	3c 3e                	cmp    $0x3e,%al
     612:	75 1c                	jne    630 <gettoken+0x140>
    if(*s == '>'){
     614:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     618:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     61b:	74 1c                	je     639 <gettoken+0x149>
    s++;
     61d:	89 c7                	mov    %eax,%edi
     61f:	be 3e 00 00 00       	mov    $0x3e,%esi
     624:	e9 25 ff ff ff       	jmp    54e <gettoken+0x5e>
     629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     630:	3c 7c                	cmp    $0x7c,%al
     632:	74 c8                	je     5fc <gettoken+0x10c>
     634:	e9 59 ff ff ff       	jmp    592 <gettoken+0xa2>
      s++;
     639:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     63c:	be 2b 00 00 00       	mov    $0x2b,%esi
     641:	e9 08 ff ff ff       	jmp    54e <gettoken+0x5e>
     646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64d:	8d 76 00             	lea    0x0(%esi),%esi

00000650 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     650:	f3 0f 1e fb          	endbr32 
     654:	55                   	push   %ebp
     655:	89 e5                	mov    %esp,%ebp
     657:	57                   	push   %edi
     658:	56                   	push   %esi
     659:	53                   	push   %ebx
     65a:	83 ec 0c             	sub    $0xc,%esp
     65d:	8b 7d 08             	mov    0x8(%ebp),%edi
     660:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     663:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     665:	39 f3                	cmp    %esi,%ebx
     667:	72 0e                	jb     677 <peek+0x27>
     669:	eb 24                	jmp    68f <peek+0x3f>
     66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     66f:	90                   	nop
    s++;
     670:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     673:	39 de                	cmp    %ebx,%esi
     675:	74 18                	je     68f <peek+0x3f>
     677:	0f be 03             	movsbl (%ebx),%eax
     67a:	83 ec 08             	sub    $0x8,%esp
     67d:	50                   	push   %eax
     67e:	68 2c 20 00 00       	push   $0x202c
     683:	e8 28 06 00 00       	call   cb0 <strchr>
     688:	83 c4 10             	add    $0x10,%esp
     68b:	85 c0                	test   %eax,%eax
     68d:	75 e1                	jne    670 <peek+0x20>
  *ps = s;
     68f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     691:	0f be 03             	movsbl (%ebx),%eax
     694:	31 d2                	xor    %edx,%edx
     696:	84 c0                	test   %al,%al
     698:	75 0e                	jne    6a8 <peek+0x58>
}
     69a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     69d:	89 d0                	mov    %edx,%eax
     69f:	5b                   	pop    %ebx
     6a0:	5e                   	pop    %esi
     6a1:	5f                   	pop    %edi
     6a2:	5d                   	pop    %ebp
     6a3:	c3                   	ret    
     6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     6a8:	83 ec 08             	sub    $0x8,%esp
     6ab:	50                   	push   %eax
     6ac:	ff 75 10             	pushl  0x10(%ebp)
     6af:	e8 fc 05 00 00       	call   cb0 <strchr>
     6b4:	83 c4 10             	add    $0x10,%esp
     6b7:	31 d2                	xor    %edx,%edx
     6b9:	85 c0                	test   %eax,%eax
     6bb:	0f 95 c2             	setne  %dl
}
     6be:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6c1:	5b                   	pop    %ebx
     6c2:	89 d0                	mov    %edx,%eax
     6c4:	5e                   	pop    %esi
     6c5:	5f                   	pop    %edi
     6c6:	5d                   	pop    %ebp
     6c7:	c3                   	ret    
     6c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6cf:	90                   	nop

000006d0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6d0:	f3 0f 1e fb          	endbr32 
     6d4:	55                   	push   %ebp
     6d5:	89 e5                	mov    %esp,%ebp
     6d7:	57                   	push   %edi
     6d8:	56                   	push   %esi
     6d9:	53                   	push   %ebx
     6da:	83 ec 1c             	sub    $0x1c,%esp
     6dd:	8b 75 0c             	mov    0xc(%ebp),%esi
     6e0:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     6e7:	90                   	nop
     6e8:	83 ec 04             	sub    $0x4,%esp
     6eb:	68 ff 17 00 00       	push   $0x17ff
     6f0:	53                   	push   %ebx
     6f1:	56                   	push   %esi
     6f2:	e8 59 ff ff ff       	call   650 <peek>
     6f7:	83 c4 10             	add    $0x10,%esp
     6fa:	85 c0                	test   %eax,%eax
     6fc:	74 6a                	je     768 <parseredirs+0x98>
    tok = gettoken(ps, es, 0, 0);
     6fe:	6a 00                	push   $0x0
     700:	6a 00                	push   $0x0
     702:	53                   	push   %ebx
     703:	56                   	push   %esi
     704:	e8 e7 fd ff ff       	call   4f0 <gettoken>
     709:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     70b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     70e:	50                   	push   %eax
     70f:	8d 45 e0             	lea    -0x20(%ebp),%eax
     712:	50                   	push   %eax
     713:	53                   	push   %ebx
     714:	56                   	push   %esi
     715:	e8 d6 fd ff ff       	call   4f0 <gettoken>
     71a:	83 c4 20             	add    $0x20,%esp
     71d:	83 f8 61             	cmp    $0x61,%eax
     720:	75 51                	jne    773 <parseredirs+0xa3>
      panic("missing file for redirection");
    switch(tok){
     722:	83 ff 3c             	cmp    $0x3c,%edi
     725:	74 31                	je     758 <parseredirs+0x88>
     727:	83 ff 3e             	cmp    $0x3e,%edi
     72a:	74 05                	je     731 <parseredirs+0x61>
     72c:	83 ff 2b             	cmp    $0x2b,%edi
     72f:	75 b7                	jne    6e8 <parseredirs+0x18>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     731:	83 ec 0c             	sub    $0xc,%esp
     734:	6a 01                	push   $0x1
     736:	68 01 02 00 00       	push   $0x201
     73b:	ff 75 e4             	pushl  -0x1c(%ebp)
     73e:	ff 75 e0             	pushl  -0x20(%ebp)
     741:	ff 75 08             	pushl  0x8(%ebp)
     744:	e8 97 fc ff ff       	call   3e0 <redircmd>
      break;
     749:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     74c:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     74f:	eb 97                	jmp    6e8 <parseredirs+0x18>
     751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     758:	83 ec 0c             	sub    $0xc,%esp
     75b:	6a 00                	push   $0x0
     75d:	6a 00                	push   $0x0
     75f:	eb da                	jmp    73b <parseredirs+0x6b>
     761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     768:	8b 45 08             	mov    0x8(%ebp),%eax
     76b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     76e:	5b                   	pop    %ebx
     76f:	5e                   	pop    %esi
     770:	5f                   	pop    %edi
     771:	5d                   	pop    %ebp
     772:	c3                   	ret    
      panic("missing file for redirection");
     773:	83 ec 0c             	sub    $0xc,%esp
     776:	68 e2 17 00 00       	push   $0x17e2
     77b:	e8 e0 f9 ff ff       	call   160 <panic>

00000780 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     780:	f3 0f 1e fb          	endbr32 
     784:	55                   	push   %ebp
     785:	89 e5                	mov    %esp,%ebp
     787:	57                   	push   %edi
     788:	56                   	push   %esi
     789:	53                   	push   %ebx
     78a:	83 ec 30             	sub    $0x30,%esp
     78d:	8b 75 08             	mov    0x8(%ebp),%esi
     790:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     793:	68 02 18 00 00       	push   $0x1802
     798:	57                   	push   %edi
     799:	56                   	push   %esi
     79a:	e8 b1 fe ff ff       	call   650 <peek>
     79f:	83 c4 10             	add    $0x10,%esp
     7a2:	85 c0                	test   %eax,%eax
     7a4:	0f 85 96 00 00 00    	jne    840 <parseexec+0xc0>
     7aa:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     7ac:	e8 ff fb ff ff       	call   3b0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7b1:	83 ec 04             	sub    $0x4,%esp
     7b4:	57                   	push   %edi
     7b5:	56                   	push   %esi
     7b6:	50                   	push   %eax
  ret = execcmd();
     7b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     7ba:	e8 11 ff ff ff       	call   6d0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7bf:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7c5:	eb 1c                	jmp    7e3 <parseexec+0x63>
     7c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7ce:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7d0:	83 ec 04             	sub    $0x4,%esp
     7d3:	57                   	push   %edi
     7d4:	56                   	push   %esi
     7d5:	ff 75 d4             	pushl  -0x2c(%ebp)
     7d8:	e8 f3 fe ff ff       	call   6d0 <parseredirs>
     7dd:	83 c4 10             	add    $0x10,%esp
     7e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7e3:	83 ec 04             	sub    $0x4,%esp
     7e6:	68 19 18 00 00       	push   $0x1819
     7eb:	57                   	push   %edi
     7ec:	56                   	push   %esi
     7ed:	e8 5e fe ff ff       	call   650 <peek>
     7f2:	83 c4 10             	add    $0x10,%esp
     7f5:	85 c0                	test   %eax,%eax
     7f7:	75 67                	jne    860 <parseexec+0xe0>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7fc:	50                   	push   %eax
     7fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     800:	50                   	push   %eax
     801:	57                   	push   %edi
     802:	56                   	push   %esi
     803:	e8 e8 fc ff ff       	call   4f0 <gettoken>
     808:	83 c4 10             	add    $0x10,%esp
     80b:	85 c0                	test   %eax,%eax
     80d:	74 51                	je     860 <parseexec+0xe0>
    if(tok != 'a')
     80f:	83 f8 61             	cmp    $0x61,%eax
     812:	75 6b                	jne    87f <parseexec+0xff>
    cmd->argv[argc] = q;
     814:	8b 45 e0             	mov    -0x20(%ebp),%eax
     817:	8b 55 d0             	mov    -0x30(%ebp),%edx
     81a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     81e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     821:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     825:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     828:	83 fb 0a             	cmp    $0xa,%ebx
     82b:	75 a3                	jne    7d0 <parseexec+0x50>
      panic("too many args");
     82d:	83 ec 0c             	sub    $0xc,%esp
     830:	68 0b 18 00 00       	push   $0x180b
     835:	e8 26 f9 ff ff       	call   160 <panic>
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     840:	83 ec 08             	sub    $0x8,%esp
     843:	57                   	push   %edi
     844:	56                   	push   %esi
     845:	e8 66 01 00 00       	call   9b0 <parseblock>
     84a:	83 c4 10             	add    $0x10,%esp
     84d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     850:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     853:	8d 65 f4             	lea    -0xc(%ebp),%esp
     856:	5b                   	pop    %ebx
     857:	5e                   	pop    %esi
     858:	5f                   	pop    %edi
     859:	5d                   	pop    %ebp
     85a:	c3                   	ret    
     85b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     85f:	90                   	nop
  cmd->argv[argc] = 0;
     860:	8b 45 d0             	mov    -0x30(%ebp),%eax
     863:	8d 04 98             	lea    (%eax,%ebx,4),%eax
     866:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     86d:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     874:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     877:	8d 65 f4             	lea    -0xc(%ebp),%esp
     87a:	5b                   	pop    %ebx
     87b:	5e                   	pop    %esi
     87c:	5f                   	pop    %edi
     87d:	5d                   	pop    %ebp
     87e:	c3                   	ret    
      panic("syntax");
     87f:	83 ec 0c             	sub    $0xc,%esp
     882:	68 04 18 00 00       	push   $0x1804
     887:	e8 d4 f8 ff ff       	call   160 <panic>
     88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000890 <parsepipe>:
{
     890:	f3 0f 1e fb          	endbr32 
     894:	55                   	push   %ebp
     895:	89 e5                	mov    %esp,%ebp
     897:	57                   	push   %edi
     898:	56                   	push   %esi
     899:	53                   	push   %ebx
     89a:	83 ec 14             	sub    $0x14,%esp
     89d:	8b 75 08             	mov    0x8(%ebp),%esi
     8a0:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	e8 d6 fe ff ff       	call   780 <parseexec>
  if(peek(ps, es, "|")){
     8aa:	83 c4 0c             	add    $0xc,%esp
     8ad:	68 1e 18 00 00       	push   $0x181e
  cmd = parseexec(ps, es);
     8b2:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8b4:	57                   	push   %edi
     8b5:	56                   	push   %esi
     8b6:	e8 95 fd ff ff       	call   650 <peek>
     8bb:	83 c4 10             	add    $0x10,%esp
     8be:	85 c0                	test   %eax,%eax
     8c0:	75 0e                	jne    8d0 <parsepipe+0x40>
}
     8c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8c5:	89 d8                	mov    %ebx,%eax
     8c7:	5b                   	pop    %ebx
     8c8:	5e                   	pop    %esi
     8c9:	5f                   	pop    %edi
     8ca:	5d                   	pop    %ebp
     8cb:	c3                   	ret    
     8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     8d0:	6a 00                	push   $0x0
     8d2:	6a 00                	push   $0x0
     8d4:	57                   	push   %edi
     8d5:	56                   	push   %esi
     8d6:	e8 15 fc ff ff       	call   4f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8db:	58                   	pop    %eax
     8dc:	5a                   	pop    %edx
     8dd:	57                   	push   %edi
     8de:	56                   	push   %esi
     8df:	e8 ac ff ff ff       	call   890 <parsepipe>
     8e4:	89 5d 08             	mov    %ebx,0x8(%ebp)
     8e7:	83 c4 10             	add    $0x10,%esp
     8ea:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     8ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f0:	5b                   	pop    %ebx
     8f1:	5e                   	pop    %esi
     8f2:	5f                   	pop    %edi
     8f3:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8f4:	e9 37 fb ff ff       	jmp    430 <pipecmd>
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <parseline>:
{
     900:	f3 0f 1e fb          	endbr32 
     904:	55                   	push   %ebp
     905:	89 e5                	mov    %esp,%ebp
     907:	57                   	push   %edi
     908:	56                   	push   %esi
     909:	53                   	push   %ebx
     90a:	83 ec 14             	sub    $0x14,%esp
     90d:	8b 75 08             	mov    0x8(%ebp),%esi
     910:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     913:	57                   	push   %edi
     914:	56                   	push   %esi
     915:	e8 76 ff ff ff       	call   890 <parsepipe>
  while(peek(ps, es, "&")){
     91a:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     91d:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     91f:	eb 1f                	jmp    940 <parseline+0x40>
     921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     928:	6a 00                	push   $0x0
     92a:	6a 00                	push   $0x0
     92c:	57                   	push   %edi
     92d:	56                   	push   %esi
     92e:	e8 bd fb ff ff       	call   4f0 <gettoken>
    cmd = backcmd(cmd);
     933:	89 1c 24             	mov    %ebx,(%esp)
     936:	e8 75 fb ff ff       	call   4b0 <backcmd>
     93b:	83 c4 10             	add    $0x10,%esp
     93e:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     940:	83 ec 04             	sub    $0x4,%esp
     943:	68 20 18 00 00       	push   $0x1820
     948:	57                   	push   %edi
     949:	56                   	push   %esi
     94a:	e8 01 fd ff ff       	call   650 <peek>
     94f:	83 c4 10             	add    $0x10,%esp
     952:	85 c0                	test   %eax,%eax
     954:	75 d2                	jne    928 <parseline+0x28>
  if(peek(ps, es, ";")){
     956:	83 ec 04             	sub    $0x4,%esp
     959:	68 1c 18 00 00       	push   $0x181c
     95e:	57                   	push   %edi
     95f:	56                   	push   %esi
     960:	e8 eb fc ff ff       	call   650 <peek>
     965:	83 c4 10             	add    $0x10,%esp
     968:	85 c0                	test   %eax,%eax
     96a:	75 14                	jne    980 <parseline+0x80>
}
     96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     96f:	89 d8                	mov    %ebx,%eax
     971:	5b                   	pop    %ebx
     972:	5e                   	pop    %esi
     973:	5f                   	pop    %edi
     974:	5d                   	pop    %ebp
     975:	c3                   	ret    
     976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     97d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     980:	6a 00                	push   $0x0
     982:	6a 00                	push   $0x0
     984:	57                   	push   %edi
     985:	56                   	push   %esi
     986:	e8 65 fb ff ff       	call   4f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     98b:	58                   	pop    %eax
     98c:	5a                   	pop    %edx
     98d:	57                   	push   %edi
     98e:	56                   	push   %esi
     98f:	e8 6c ff ff ff       	call   900 <parseline>
     994:	89 5d 08             	mov    %ebx,0x8(%ebp)
     997:	83 c4 10             	add    $0x10,%esp
     99a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     99d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a0:	5b                   	pop    %ebx
     9a1:	5e                   	pop    %esi
     9a2:	5f                   	pop    %edi
     9a3:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     9a4:	e9 c7 fa ff ff       	jmp    470 <listcmd>
     9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009b0 <parseblock>:
{
     9b0:	f3 0f 1e fb          	endbr32 
     9b4:	55                   	push   %ebp
     9b5:	89 e5                	mov    %esp,%ebp
     9b7:	57                   	push   %edi
     9b8:	56                   	push   %esi
     9b9:	53                   	push   %ebx
     9ba:	83 ec 10             	sub    $0x10,%esp
     9bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9c0:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9c3:	68 02 18 00 00       	push   $0x1802
     9c8:	56                   	push   %esi
     9c9:	53                   	push   %ebx
     9ca:	e8 81 fc ff ff       	call   650 <peek>
     9cf:	83 c4 10             	add    $0x10,%esp
     9d2:	85 c0                	test   %eax,%eax
     9d4:	74 4a                	je     a20 <parseblock+0x70>
  gettoken(ps, es, 0, 0);
     9d6:	6a 00                	push   $0x0
     9d8:	6a 00                	push   $0x0
     9da:	56                   	push   %esi
     9db:	53                   	push   %ebx
     9dc:	e8 0f fb ff ff       	call   4f0 <gettoken>
  cmd = parseline(ps, es);
     9e1:	58                   	pop    %eax
     9e2:	5a                   	pop    %edx
     9e3:	56                   	push   %esi
     9e4:	53                   	push   %ebx
     9e5:	e8 16 ff ff ff       	call   900 <parseline>
  if(!peek(ps, es, ")"))
     9ea:	83 c4 0c             	add    $0xc,%esp
     9ed:	68 3e 18 00 00       	push   $0x183e
  cmd = parseline(ps, es);
     9f2:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     9f4:	56                   	push   %esi
     9f5:	53                   	push   %ebx
     9f6:	e8 55 fc ff ff       	call   650 <peek>
     9fb:	83 c4 10             	add    $0x10,%esp
     9fe:	85 c0                	test   %eax,%eax
     a00:	74 2b                	je     a2d <parseblock+0x7d>
  gettoken(ps, es, 0, 0);
     a02:	6a 00                	push   $0x0
     a04:	6a 00                	push   $0x0
     a06:	56                   	push   %esi
     a07:	53                   	push   %ebx
     a08:	e8 e3 fa ff ff       	call   4f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a0d:	83 c4 0c             	add    $0xc,%esp
     a10:	56                   	push   %esi
     a11:	53                   	push   %ebx
     a12:	57                   	push   %edi
     a13:	e8 b8 fc ff ff       	call   6d0 <parseredirs>
}
     a18:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a1b:	5b                   	pop    %ebx
     a1c:	5e                   	pop    %esi
     a1d:	5f                   	pop    %edi
     a1e:	5d                   	pop    %ebp
     a1f:	c3                   	ret    
    panic("parseblock");
     a20:	83 ec 0c             	sub    $0xc,%esp
     a23:	68 22 18 00 00       	push   $0x1822
     a28:	e8 33 f7 ff ff       	call   160 <panic>
    panic("syntax - missing )");
     a2d:	83 ec 0c             	sub    $0xc,%esp
     a30:	68 2d 18 00 00       	push   $0x182d
     a35:	e8 26 f7 ff ff       	call   160 <panic>
     a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a40 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a40:	f3 0f 1e fb          	endbr32 
     a44:	55                   	push   %ebp
     a45:	89 e5                	mov    %esp,%ebp
     a47:	53                   	push   %ebx
     a48:	83 ec 04             	sub    $0x4,%esp
     a4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a4e:	85 db                	test   %ebx,%ebx
     a50:	0f 84 9a 00 00 00    	je     af0 <nulterminate+0xb0>
    return 0;

  switch(cmd->type){
     a56:	83 3b 05             	cmpl   $0x5,(%ebx)
     a59:	77 6d                	ja     ac8 <nulterminate+0x88>
     a5b:	8b 03                	mov    (%ebx),%eax
     a5d:	3e ff 24 85 84 18 00 	notrack jmp *0x1884(,%eax,4)
     a64:	00 
     a65:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a68:	83 ec 0c             	sub    $0xc,%esp
     a6b:	ff 73 04             	pushl  0x4(%ebx)
     a6e:	e8 cd ff ff ff       	call   a40 <nulterminate>
    nulterminate(lcmd->right);
     a73:	58                   	pop    %eax
     a74:	ff 73 08             	pushl  0x8(%ebx)
     a77:	e8 c4 ff ff ff       	call   a40 <nulterminate>
    break;
     a7c:	83 c4 10             	add    $0x10,%esp
     a7f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a84:	c9                   	leave  
     a85:	c3                   	ret    
     a86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a8d:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(bcmd->cmd);
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	ff 73 04             	pushl  0x4(%ebx)
     a96:	e8 a5 ff ff ff       	call   a40 <nulterminate>
    break;
     a9b:	89 d8                	mov    %ebx,%eax
     a9d:	83 c4 10             	add    $0x10,%esp
}
     aa0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aa3:	c9                   	leave  
     aa4:	c3                   	ret    
     aa5:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     aa8:	8b 4b 04             	mov    0x4(%ebx),%ecx
     aab:	8d 43 08             	lea    0x8(%ebx),%eax
     aae:	85 c9                	test   %ecx,%ecx
     ab0:	74 16                	je     ac8 <nulterminate+0x88>
     ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ab8:	8b 50 24             	mov    0x24(%eax),%edx
     abb:	83 c0 04             	add    $0x4,%eax
     abe:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     ac1:	8b 50 fc             	mov    -0x4(%eax),%edx
     ac4:	85 d2                	test   %edx,%edx
     ac6:	75 f0                	jne    ab8 <nulterminate+0x78>
  switch(cmd->type){
     ac8:	89 d8                	mov    %ebx,%eax
}
     aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     acd:	c9                   	leave  
     ace:	c3                   	ret    
     acf:	90                   	nop
    nulterminate(rcmd->cmd);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	pushl  0x4(%ebx)
     ad6:	e8 65 ff ff ff       	call   a40 <nulterminate>
    *rcmd->efile = 0;
     adb:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     ade:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ae1:	c6 00 00             	movb   $0x0,(%eax)
    break;
     ae4:	89 d8                	mov    %ebx,%eax
}
     ae6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ae9:	c9                   	leave  
     aea:	c3                   	ret    
     aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aef:	90                   	nop
    return 0;
     af0:	31 c0                	xor    %eax,%eax
     af2:	eb 8d                	jmp    a81 <nulterminate+0x41>
     af4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     afb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aff:	90                   	nop

00000b00 <parsecmd>:
{
     b00:	f3 0f 1e fb          	endbr32 
     b04:	55                   	push   %ebp
     b05:	89 e5                	mov    %esp,%ebp
     b07:	56                   	push   %esi
     b08:	53                   	push   %ebx
  es = s + strlen(s);
     b09:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b0c:	83 ec 0c             	sub    $0xc,%esp
     b0f:	53                   	push   %ebx
     b10:	e8 3b 01 00 00       	call   c50 <strlen>
  cmd = parseline(&s, es);
     b15:	59                   	pop    %ecx
     b16:	5e                   	pop    %esi
  es = s + strlen(s);
     b17:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b19:	8d 45 08             	lea    0x8(%ebp),%eax
     b1c:	53                   	push   %ebx
     b1d:	50                   	push   %eax
     b1e:	e8 dd fd ff ff       	call   900 <parseline>
  peek(&s, es, "");
     b23:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(&s, es);
     b26:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b28:	8d 45 08             	lea    0x8(%ebp),%eax
     b2b:	68 c7 17 00 00       	push   $0x17c7
     b30:	53                   	push   %ebx
     b31:	50                   	push   %eax
     b32:	e8 19 fb ff ff       	call   650 <peek>
  if(s != es){
     b37:	8b 45 08             	mov    0x8(%ebp),%eax
     b3a:	83 c4 10             	add    $0x10,%esp
     b3d:	39 d8                	cmp    %ebx,%eax
     b3f:	75 12                	jne    b53 <parsecmd+0x53>
  nulterminate(cmd);
     b41:	83 ec 0c             	sub    $0xc,%esp
     b44:	56                   	push   %esi
     b45:	e8 f6 fe ff ff       	call   a40 <nulterminate>
}
     b4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b4d:	89 f0                	mov    %esi,%eax
     b4f:	5b                   	pop    %ebx
     b50:	5e                   	pop    %esi
     b51:	5d                   	pop    %ebp
     b52:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     b53:	52                   	push   %edx
     b54:	50                   	push   %eax
     b55:	68 40 18 00 00       	push   $0x1840
     b5a:	6a 02                	push   $0x2
     b5c:	e8 df 08 00 00       	call   1440 <printf>
    panic("syntax");
     b61:	c7 04 24 04 18 00 00 	movl   $0x1804,(%esp)
     b68:	e8 f3 f5 ff ff       	call   160 <panic>
     b6d:	66 90                	xchg   %ax,%ax
     b6f:	90                   	nop

00000b70 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     b70:	f3 0f 1e fb          	endbr32 
     b74:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b75:	31 c0                	xor    %eax,%eax
{
     b77:	89 e5                	mov    %esp,%ebp
     b79:	53                   	push   %ebx
     b7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
     b80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b87:	83 c0 01             	add    $0x1,%eax
     b8a:	84 d2                	test   %dl,%dl
     b8c:	75 f2                	jne    b80 <strcpy+0x10>
    ;
  return os;
}
     b8e:	89 c8                	mov    %ecx,%eax
     b90:	5b                   	pop    %ebx
     b91:	5d                   	pop    %ebp
     b92:	c3                   	ret    
     b93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ba0 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
     ba0:	f3 0f 1e fb          	endbr32 
     ba4:	55                   	push   %ebp
     ba5:	89 e5                	mov    %esp,%ebp
     ba7:	57                   	push   %edi
     ba8:	8b 7d 10             	mov    0x10(%ebp),%edi
     bab:	56                   	push   %esi
     bac:	8b 75 08             	mov    0x8(%ebp),%esi
     baf:	53                   	push   %ebx
     bb0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
     bb3:	85 ff                	test   %edi,%edi
     bb5:	74 39                	je     bf0 <strcat_s+0x50>
     bb7:	31 c0                	xor    %eax,%eax
     bb9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     bbe:	eb 11                	jmp    bd1 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
     bc0:	0f b6 12             	movzbl (%edx),%edx
     bc3:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
     bc6:	84 d2                	test   %dl,%dl
     bc8:	74 26                	je     bf0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
     bca:	83 c0 01             	add    $0x1,%eax
     bcd:	39 c7                	cmp    %eax,%edi
     bcf:	74 1f                	je     bf0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
     bd1:	89 c2                	mov    %eax,%edx
     bd3:	29 ca                	sub    %ecx,%edx
     bd5:	01 da                	add    %ebx,%edx
     bd7:	83 f9 ff             	cmp    $0xffffffff,%ecx
     bda:	75 e4                	jne    bc0 <strcat_s+0x20>
     bdc:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
     be0:	75 e8                	jne    bca <strcat_s+0x2a>
     be2:	89 da                	mov    %ebx,%edx
     be4:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
     be6:	0f b6 12             	movzbl (%edx),%edx
     be9:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
     bec:	84 d2                	test   %dl,%dl
     bee:	75 da                	jne    bca <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
     bf0:	5b                   	pop    %ebx
     bf1:	89 f0                	mov    %esi,%eax
     bf3:	5e                   	pop    %esi
     bf4:	5f                   	pop    %edi
     bf5:	5d                   	pop    %ebp
     bf6:	c3                   	ret    
     bf7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfe:	66 90                	xchg   %ax,%ax

00000c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c00:	f3 0f 1e fb          	endbr32 
     c04:	55                   	push   %ebp
     c05:	89 e5                	mov    %esp,%ebp
     c07:	53                   	push   %ebx
     c08:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c0b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     c0e:	0f b6 01             	movzbl (%ecx),%eax
     c11:	0f b6 1a             	movzbl (%edx),%ebx
     c14:	84 c0                	test   %al,%al
     c16:	75 19                	jne    c31 <strcmp+0x31>
     c18:	eb 26                	jmp    c40 <strcmp+0x40>
     c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c20:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     c24:	83 c1 01             	add    $0x1,%ecx
     c27:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     c2a:	0f b6 1a             	movzbl (%edx),%ebx
     c2d:	84 c0                	test   %al,%al
     c2f:	74 0f                	je     c40 <strcmp+0x40>
     c31:	38 d8                	cmp    %bl,%al
     c33:	74 eb                	je     c20 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     c35:	29 d8                	sub    %ebx,%eax
}
     c37:	5b                   	pop    %ebx
     c38:	5d                   	pop    %ebp
     c39:	c3                   	ret    
     c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c40:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     c42:	29 d8                	sub    %ebx,%eax
}
     c44:	5b                   	pop    %ebx
     c45:	5d                   	pop    %ebp
     c46:	c3                   	ret    
     c47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c4e:	66 90                	xchg   %ax,%ax

00000c50 <strlen>:

uint
strlen(const char *s)
{
     c50:	f3 0f 1e fb          	endbr32 
     c54:	55                   	push   %ebp
     c55:	89 e5                	mov    %esp,%ebp
     c57:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c5a:	80 3a 00             	cmpb   $0x0,(%edx)
     c5d:	74 21                	je     c80 <strlen+0x30>
     c5f:	31 c0                	xor    %eax,%eax
     c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c68:	83 c0 01             	add    $0x1,%eax
     c6b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c6f:	89 c1                	mov    %eax,%ecx
     c71:	75 f5                	jne    c68 <strlen+0x18>
    ;
  return n;
}
     c73:	89 c8                	mov    %ecx,%eax
     c75:	5d                   	pop    %ebp
     c76:	c3                   	ret    
     c77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c7e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     c80:	31 c9                	xor    %ecx,%ecx
}
     c82:	5d                   	pop    %ebp
     c83:	89 c8                	mov    %ecx,%eax
     c85:	c3                   	ret    
     c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8d:	8d 76 00             	lea    0x0(%esi),%esi

00000c90 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c90:	f3 0f 1e fb          	endbr32 
     c94:	55                   	push   %ebp
     c95:	89 e5                	mov    %esp,%ebp
     c97:	57                   	push   %edi
     c98:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c9e:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca1:	89 d7                	mov    %edx,%edi
     ca3:	fc                   	cld    
     ca4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ca6:	89 d0                	mov    %edx,%eax
     ca8:	5f                   	pop    %edi
     ca9:	5d                   	pop    %ebp
     caa:	c3                   	ret    
     cab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     caf:	90                   	nop

00000cb0 <strchr>:

char*
strchr(const char *s, char c)
{
     cb0:	f3 0f 1e fb          	endbr32 
     cb4:	55                   	push   %ebp
     cb5:	89 e5                	mov    %esp,%ebp
     cb7:	8b 45 08             	mov    0x8(%ebp),%eax
     cba:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cbe:	0f b6 10             	movzbl (%eax),%edx
     cc1:	84 d2                	test   %dl,%dl
     cc3:	75 16                	jne    cdb <strchr+0x2b>
     cc5:	eb 21                	jmp    ce8 <strchr+0x38>
     cc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cce:	66 90                	xchg   %ax,%ax
     cd0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     cd4:	83 c0 01             	add    $0x1,%eax
     cd7:	84 d2                	test   %dl,%dl
     cd9:	74 0d                	je     ce8 <strchr+0x38>
    if(*s == c)
     cdb:	38 d1                	cmp    %dl,%cl
     cdd:	75 f1                	jne    cd0 <strchr+0x20>
      return (char*)s;
  return 0;
}
     cdf:	5d                   	pop    %ebp
     ce0:	c3                   	ret    
     ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     ce8:	31 c0                	xor    %eax,%eax
}
     cea:	5d                   	pop    %ebp
     ceb:	c3                   	ret    
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cf0 <gets>:

char*
gets(char *buf, int max)
{
     cf0:	f3 0f 1e fb          	endbr32 
     cf4:	55                   	push   %ebp
     cf5:	89 e5                	mov    %esp,%ebp
     cf7:	57                   	push   %edi
     cf8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     cf9:	31 f6                	xor    %esi,%esi
{
     cfb:	53                   	push   %ebx
     cfc:	89 f3                	mov    %esi,%ebx
     cfe:	83 ec 1c             	sub    $0x1c,%esp
     d01:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     d04:	eb 33                	jmp    d39 <gets+0x49>
     d06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d0d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     d10:	83 ec 04             	sub    $0x4,%esp
     d13:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d16:	6a 01                	push   $0x1
     d18:	50                   	push   %eax
     d19:	6a 00                	push   $0x0
     d1b:	e8 95 05 00 00       	call   12b5 <read>
    if(cc < 1)
     d20:	83 c4 10             	add    $0x10,%esp
     d23:	85 c0                	test   %eax,%eax
     d25:	7e 1c                	jle    d43 <gets+0x53>
      break;
    buf[i++] = c;
     d27:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d2b:	83 c7 01             	add    $0x1,%edi
     d2e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     d31:	3c 0a                	cmp    $0xa,%al
     d33:	74 23                	je     d58 <gets+0x68>
     d35:	3c 0d                	cmp    $0xd,%al
     d37:	74 1f                	je     d58 <gets+0x68>
  for(i=0; i+1 < max; ){
     d39:	83 c3 01             	add    $0x1,%ebx
     d3c:	89 fe                	mov    %edi,%esi
     d3e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d41:	7c cd                	jl     d10 <gets+0x20>
     d43:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     d45:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     d48:	c6 03 00             	movb   $0x0,(%ebx)
}
     d4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d4e:	5b                   	pop    %ebx
     d4f:	5e                   	pop    %esi
     d50:	5f                   	pop    %edi
     d51:	5d                   	pop    %ebp
     d52:	c3                   	ret    
     d53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d57:	90                   	nop
     d58:	8b 75 08             	mov    0x8(%ebp),%esi
     d5b:	8b 45 08             	mov    0x8(%ebp),%eax
     d5e:	01 de                	add    %ebx,%esi
     d60:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     d62:	c6 03 00             	movb   $0x0,(%ebx)
}
     d65:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d68:	5b                   	pop    %ebx
     d69:	5e                   	pop    %esi
     d6a:	5f                   	pop    %edi
     d6b:	5d                   	pop    %ebp
     d6c:	c3                   	ret    
     d6d:	8d 76 00             	lea    0x0(%esi),%esi

00000d70 <stat>:

int
stat(const char *n, struct stat *st)
{
     d70:	f3 0f 1e fb          	endbr32 
     d74:	55                   	push   %ebp
     d75:	89 e5                	mov    %esp,%ebp
     d77:	56                   	push   %esi
     d78:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d79:	83 ec 08             	sub    $0x8,%esp
     d7c:	6a 00                	push   $0x0
     d7e:	ff 75 08             	pushl  0x8(%ebp)
     d81:	e8 57 05 00 00       	call   12dd <open>
  if(fd < 0)
     d86:	83 c4 10             	add    $0x10,%esp
     d89:	85 c0                	test   %eax,%eax
     d8b:	78 2b                	js     db8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     d8d:	83 ec 08             	sub    $0x8,%esp
     d90:	ff 75 0c             	pushl  0xc(%ebp)
     d93:	89 c3                	mov    %eax,%ebx
     d95:	50                   	push   %eax
     d96:	e8 5a 05 00 00       	call   12f5 <fstat>
  close(fd);
     d9b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d9e:	89 c6                	mov    %eax,%esi
  close(fd);
     da0:	e8 20 05 00 00       	call   12c5 <close>
  return r;
     da5:	83 c4 10             	add    $0x10,%esp
}
     da8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dab:	89 f0                	mov    %esi,%eax
     dad:	5b                   	pop    %ebx
     dae:	5e                   	pop    %esi
     daf:	5d                   	pop    %ebp
     db0:	c3                   	ret    
     db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     db8:	be ff ff ff ff       	mov    $0xffffffff,%esi
     dbd:	eb e9                	jmp    da8 <stat+0x38>
     dbf:	90                   	nop

00000dc0 <atoi>:

int
atoi(const char *s)
{
     dc0:	f3 0f 1e fb          	endbr32 
     dc4:	55                   	push   %ebp
     dc5:	89 e5                	mov    %esp,%ebp
     dc7:	53                   	push   %ebx
     dc8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     dcb:	0f be 02             	movsbl (%edx),%eax
     dce:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dd1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     dd4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     dd9:	77 1a                	ja     df5 <atoi+0x35>
     ddb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ddf:	90                   	nop
    n = n*10 + *s++ - '0';
     de0:	83 c2 01             	add    $0x1,%edx
     de3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     de6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dea:	0f be 02             	movsbl (%edx),%eax
     ded:	8d 58 d0             	lea    -0x30(%eax),%ebx
     df0:	80 fb 09             	cmp    $0x9,%bl
     df3:	76 eb                	jbe    de0 <atoi+0x20>
  return n;
}
     df5:	89 c8                	mov    %ecx,%eax
     df7:	5b                   	pop    %ebx
     df8:	5d                   	pop    %ebp
     df9:	c3                   	ret    
     dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000e00 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e00:	f3 0f 1e fb          	endbr32 
     e04:	55                   	push   %ebp
     e05:	89 e5                	mov    %esp,%ebp
     e07:	57                   	push   %edi
     e08:	8b 45 10             	mov    0x10(%ebp),%eax
     e0b:	8b 55 08             	mov    0x8(%ebp),%edx
     e0e:	56                   	push   %esi
     e0f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e12:	85 c0                	test   %eax,%eax
     e14:	7e 0f                	jle    e25 <memmove+0x25>
     e16:	01 d0                	add    %edx,%eax
  dst = vdst;
     e18:	89 d7                	mov    %edx,%edi
     e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e20:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e21:	39 f8                	cmp    %edi,%eax
     e23:	75 fb                	jne    e20 <memmove+0x20>
  return vdst;
}
     e25:	5e                   	pop    %esi
     e26:	89 d0                	mov    %edx,%eax
     e28:	5f                   	pop    %edi
     e29:	5d                   	pop    %ebp
     e2a:	c3                   	ret    
     e2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e2f:	90                   	nop

00000e30 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
     e30:	f3 0f 1e fb          	endbr32 
     e34:	55                   	push   %ebp
     e35:	89 e5                	mov    %esp,%ebp
     e37:	57                   	push   %edi
     e38:	56                   	push   %esi
     e39:	53                   	push   %ebx
     e3a:	83 ec 34             	sub    $0x34,%esp
     e3d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     e40:	68 9c 18 00 00       	push   $0x189c
hexdump (void *data, size_t size) {
     e45:	89 45 e0             	mov    %eax,-0x20(%ebp)
     e48:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     e4b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
     e4d:	89 c7                	mov    %eax,%edi
     e4f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     e52:	e8 e9 05 00 00       	call   1440 <printf>
  for (offset = 0; offset < size; offset += 16) {
     e57:	83 c4 10             	add    $0x10,%esp
     e5a:	85 ff                	test   %edi,%edi
     e5c:	0f 84 2d 01 00 00    	je     f8f <hexdump+0x15f>
     e62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e65:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     e6c:	be 10 00 00 00       	mov    $0x10,%esi
     e71:	83 e8 01             	sub    $0x1,%eax
     e74:	83 e0 f0             	and    $0xfffffff0,%eax
     e77:	83 c0 10             	add    $0x10,%eax
     e7a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     e7d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
     e80:	83 ec 08             	sub    $0x8,%esp
     e83:	68 f0 18 00 00       	push   $0x18f0
     e88:	6a 01                	push   $0x1
     e8a:	e8 b1 05 00 00       	call   1440 <printf>
    if (offset <= 0x0fff) printf(1, "0");
     e8f:	83 c4 10             	add    $0x10,%esp
     e92:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
     e99:	0f 8e 51 01 00 00    	jle    ff0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
     e9f:	8b 7d dc             	mov    -0x24(%ebp),%edi
     ea2:	83 ec 04             	sub    $0x4,%esp
     ea5:	57                   	push   %edi
     ea6:	89 fb                	mov    %edi,%ebx
     ea8:	68 ed 18 00 00       	push   $0x18ed
     ead:	6a 01                	push   $0x1
     eaf:	e8 8c 05 00 00       	call   1440 <printf>
     eb4:	89 7d d8             	mov    %edi,-0x28(%ebp)
     eb7:	83 c4 10             	add    $0x10,%esp
     eba:	8b 7d e0             	mov    -0x20(%ebp),%edi
     ebd:	eb 28                	jmp    ee7 <hexdump+0xb7>
     ebf:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
     ec0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     ec4:	80 fa 0f             	cmp    $0xf,%dl
     ec7:	0f 86 e3 00 00 00    	jbe    fb0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
     ecd:	83 ec 04             	sub    $0x4,%esp
     ed0:	83 c3 01             	add    $0x1,%ebx
     ed3:	52                   	push   %edx
     ed4:	68 f3 18 00 00       	push   $0x18f3
     ed9:	6a 01                	push   $0x1
     edb:	e8 60 05 00 00       	call   1440 <printf>
     ee0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     ee3:	39 f3                	cmp    %esi,%ebx
     ee5:	74 1e                	je     f05 <hexdump+0xd5>
      if(offset + index < (int)size) {
     ee7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
     eea:	7f d4                	jg     ec0 <hexdump+0x90>
      } else {
        printf(1, "   ");
     eec:	83 ec 08             	sub    $0x8,%esp
     eef:	83 c3 01             	add    $0x1,%ebx
     ef2:	68 f7 18 00 00       	push   $0x18f7
     ef7:	6a 01                	push   $0x1
     ef9:	e8 42 05 00 00       	call   1440 <printf>
     efe:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     f01:	39 f3                	cmp    %esi,%ebx
     f03:	75 e2                	jne    ee7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
     f05:	83 ec 08             	sub    $0x8,%esp
     f08:	8b 5d d8             	mov    -0x28(%ebp),%ebx
     f0b:	68 f0 18 00 00       	push   $0x18f0
     f10:	6a 01                	push   $0x1
     f12:	e8 29 05 00 00       	call   1440 <printf>
     f17:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f1a:	83 c4 10             	add    $0x10,%esp
     f1d:	eb 1b                	jmp    f3a <hexdump+0x10a>
     f1f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	52                   	push   %edx
     f24:	68 fb 18 00 00       	push   $0x18fb
     f29:	6a 01                	push   $0x1
     f2b:	e8 10 05 00 00       	call   1440 <printf>
     f30:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     f33:	83 c3 01             	add    $0x1,%ebx
     f36:	39 de                	cmp    %ebx,%esi
     f38:	74 30                	je     f6a <hexdump+0x13a>
      if(offset + index < (int)size) {
     f3a:	39 df                	cmp    %ebx,%edi
     f3c:	0f 8e 8e 00 00 00    	jle    fd0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
     f42:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f45:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     f49:	8d 4a e0             	lea    -0x20(%edx),%ecx
     f4c:	80 f9 5e             	cmp    $0x5e,%cl
     f4f:	76 cf                	jbe    f20 <hexdump+0xf0>
        } else {
          printf(1, ".");
     f51:	83 ec 08             	sub    $0x8,%esp
     f54:	83 c3 01             	add    $0x1,%ebx
     f57:	68 fe 18 00 00       	push   $0x18fe
     f5c:	6a 01                	push   $0x1
     f5e:	e8 dd 04 00 00       	call   1440 <printf>
     f63:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     f66:	39 de                	cmp    %ebx,%esi
     f68:	75 d0                	jne    f3a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
     f6a:	83 ec 08             	sub    $0x8,%esp
     f6d:	83 c6 10             	add    $0x10,%esi
     f70:	68 00 19 00 00       	push   $0x1900
     f75:	6a 01                	push   $0x1
     f77:	e8 c4 04 00 00       	call   1440 <printf>
  for (offset = 0; offset < size; offset += 16) {
     f7c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
     f80:	83 c4 10             	add    $0x10,%esp
     f83:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f86:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
     f89:	0f 85 f1 fe ff ff    	jne    e80 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     f8f:	c7 45 0c 9c 18 00 00 	movl   $0x189c,0xc(%ebp)
     f96:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     f9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa0:	5b                   	pop    %ebx
     fa1:	5e                   	pop    %esi
     fa2:	5f                   	pop    %edi
     fa3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     fa4:	e9 97 04 00 00       	jmp    1440 <printf>
     fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
     fb0:	83 ec 08             	sub    $0x8,%esp
     fb3:	68 eb 18 00 00       	push   $0x18eb
     fb8:	6a 01                	push   $0x1
     fba:	e8 81 04 00 00       	call   1440 <printf>
     fbf:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     fc3:	83 c4 10             	add    $0x10,%esp
     fc6:	e9 02 ff ff ff       	jmp    ecd <hexdump+0x9d>
     fcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fcf:	90                   	nop
        printf(1, " ");
     fd0:	83 ec 08             	sub    $0x8,%esp
     fd3:	68 f9 18 00 00       	push   $0x18f9
     fd8:	6a 01                	push   $0x1
     fda:	e8 61 04 00 00       	call   1440 <printf>
     fdf:	83 c4 10             	add    $0x10,%esp
     fe2:	e9 4c ff ff ff       	jmp    f33 <hexdump+0x103>
     fe7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fee:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
     ff0:	83 ec 08             	sub    $0x8,%esp
     ff3:	68 eb 18 00 00       	push   $0x18eb
     ff8:	6a 01                	push   $0x1
     ffa:	e8 41 04 00 00       	call   1440 <printf>
    if (offset <= 0x00ff) printf(1, "0");
     fff:	8b 7d dc             	mov    -0x24(%ebp),%edi
    1002:	83 c4 10             	add    $0x10,%esp
    1005:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    100b:	0f 8f 8e fe ff ff    	jg     e9f <hexdump+0x6f>
    1011:	83 ec 08             	sub    $0x8,%esp
    1014:	68 eb 18 00 00       	push   $0x18eb
    1019:	6a 01                	push   $0x1
    101b:	e8 20 04 00 00       	call   1440 <printf>
    if (offset <= 0x000f) printf(1, "0");
    1020:	83 c4 10             	add    $0x10,%esp
    1023:	83 ff 0f             	cmp    $0xf,%edi
    1026:	0f 8f 73 fe ff ff    	jg     e9f <hexdump+0x6f>
    102c:	83 ec 08             	sub    $0x8,%esp
    102f:	68 eb 18 00 00       	push   $0x18eb
    1034:	6a 01                	push   $0x1
    1036:	e8 05 04 00 00       	call   1440 <printf>
    103b:	83 c4 10             	add    $0x10,%esp
    103e:	e9 5c fe ff ff       	jmp    e9f <hexdump+0x6f>
    1043:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001050 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
    1050:	f3 0f 1e fb          	endbr32 
    1054:	55                   	push   %ebp
    if (!endian)
    1055:	a1 a4 20 00 00       	mov    0x20a4,%eax
{
    105a:	89 e5                	mov    %esp,%ebp
    105c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
    105f:	85 c0                	test   %eax,%eax
    1061:	75 1d                	jne    1080 <hton16+0x30>
        endian = byteorder();
    1063:	c7 05 a4 20 00 00 d2 	movl   $0x4d2,0x20a4
    106a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
    106d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
    106f:	5d                   	pop    %ebp
    1070:	66 c1 c2 08          	rol    $0x8,%dx
    1074:	89 d0                	mov    %edx,%eax
    1076:	c3                   	ret    
    1077:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    107e:	66 90                	xchg   %ax,%ax
    1080:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
    1082:	3d d2 04 00 00       	cmp    $0x4d2,%eax
    1087:	74 e4                	je     106d <hton16+0x1d>
}
    1089:	89 d0                	mov    %edx,%eax
    108b:	5d                   	pop    %ebp
    108c:	c3                   	ret    
    108d:	8d 76 00             	lea    0x0(%esi),%esi

00001090 <ntoh16>:
    1090:	f3 0f 1e fb          	endbr32 
    1094:	eb ba                	jmp    1050 <hton16>
    1096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109d:	8d 76 00             	lea    0x0(%esi),%esi

000010a0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
    10a0:	f3 0f 1e fb          	endbr32 
    10a4:	55                   	push   %ebp
    if (!endian)
    10a5:	8b 15 a4 20 00 00    	mov    0x20a4,%edx
{
    10ab:	89 e5                	mov    %esp,%ebp
    10ad:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
    10b0:	85 d2                	test   %edx,%edx
    10b2:	75 14                	jne    10c8 <hton32+0x28>
        endian = byteorder();
    10b4:	c7 05 a4 20 00 00 d2 	movl   $0x4d2,0x20a4
    10bb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
    10be:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
    10c0:	5d                   	pop    %ebp
    10c1:	c3                   	ret    
    10c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
    10c8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
    10ce:	74 ee                	je     10be <hton32+0x1e>
}
    10d0:	5d                   	pop    %ebp
    10d1:	c3                   	ret    
    10d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010e0 <ntoh32>:
    10e0:	f3 0f 1e fb          	endbr32 
    10e4:	eb ba                	jmp    10a0 <hton32>
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi

000010f0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
    10f0:	f3 0f 1e fb          	endbr32 
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	57                   	push   %edi
    10f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10fb:	56                   	push   %esi
    10fc:	53                   	push   %ebx
    10fd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
    1100:	0f b6 01             	movzbl (%ecx),%eax
    1103:	3c 09                	cmp    $0x9,%al
    1105:	74 09                	je     1110 <strtol+0x20>
    1107:	3c 20                	cmp    $0x20,%al
    1109:	75 14                	jne    111f <strtol+0x2f>
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop
    1110:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
    1114:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
    1117:	3c 20                	cmp    $0x20,%al
    1119:	74 f5                	je     1110 <strtol+0x20>
    111b:	3c 09                	cmp    $0x9,%al
    111d:	74 f1                	je     1110 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
    111f:	3c 2b                	cmp    $0x2b,%al
    1121:	0f 84 a9 00 00 00    	je     11d0 <strtol+0xe0>
    int neg = 0;
    1127:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
    1129:	3c 2d                	cmp    $0x2d,%al
    112b:	0f 84 8f 00 00 00    	je     11c0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
    1131:	0f be 11             	movsbl (%ecx),%edx
    1134:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
    113a:	75 12                	jne    114e <strtol+0x5e>
    113c:	80 fa 30             	cmp    $0x30,%dl
    113f:	0f 84 9b 00 00 00    	je     11e0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
    1145:	85 db                	test   %ebx,%ebx
    1147:	75 05                	jne    114e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
    1149:	bb 0a 00 00 00       	mov    $0xa,%ebx
    114e:	89 5d 10             	mov    %ebx,0x10(%ebp)
    1151:	31 c0                	xor    %eax,%eax
    1153:	eb 17                	jmp    116c <strtol+0x7c>
    1155:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
    1158:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
    115b:	3b 55 10             	cmp    0x10(%ebp),%edx
    115e:	7d 28                	jge    1188 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
    1160:	0f af 45 10          	imul   0x10(%ebp),%eax
    1164:	83 c1 01             	add    $0x1,%ecx
    1167:	01 d0                	add    %edx,%eax
    while (1) {
    1169:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
    116c:	8d 72 d0             	lea    -0x30(%edx),%esi
    116f:	89 f3                	mov    %esi,%ebx
    1171:	80 fb 09             	cmp    $0x9,%bl
    1174:	76 e2                	jbe    1158 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
    1176:	8d 72 9f             	lea    -0x61(%edx),%esi
    1179:	89 f3                	mov    %esi,%ebx
    117b:	80 fb 19             	cmp    $0x19,%bl
    117e:	77 28                	ja     11a8 <strtol+0xb8>
            dig = *s - 'a' + 10;
    1180:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
    1183:	3b 55 10             	cmp    0x10(%ebp),%edx
    1186:	7c d8                	jl     1160 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
    1188:	8b 55 0c             	mov    0xc(%ebp),%edx
    118b:	85 d2                	test   %edx,%edx
    118d:	74 05                	je     1194 <strtol+0xa4>
        *endptr = (char *) s;
    118f:	8b 75 0c             	mov    0xc(%ebp),%esi
    1192:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
    1194:	89 c2                	mov    %eax,%edx
}
    1196:	5b                   	pop    %ebx
    1197:	5e                   	pop    %esi
    return (neg ? -val : val);
    1198:	f7 da                	neg    %edx
    119a:	85 ff                	test   %edi,%edi
}
    119c:	5f                   	pop    %edi
    119d:	5d                   	pop    %ebp
    return (neg ? -val : val);
    119e:	0f 45 c2             	cmovne %edx,%eax
}
    11a1:	c3                   	ret    
    11a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
    11a8:	8d 72 bf             	lea    -0x41(%edx),%esi
    11ab:	89 f3                	mov    %esi,%ebx
    11ad:	80 fb 19             	cmp    $0x19,%bl
    11b0:	77 d6                	ja     1188 <strtol+0x98>
            dig = *s - 'A' + 10;
    11b2:	83 ea 37             	sub    $0x37,%edx
    11b5:	eb a4                	jmp    115b <strtol+0x6b>
    11b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11be:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
    11c0:	83 c1 01             	add    $0x1,%ecx
    11c3:	bf 01 00 00 00       	mov    $0x1,%edi
    11c8:	e9 64 ff ff ff       	jmp    1131 <strtol+0x41>
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
    11d0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
    11d3:	31 ff                	xor    %edi,%edi
    11d5:	e9 57 ff ff ff       	jmp    1131 <strtol+0x41>
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
    11e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    11e4:	3c 78                	cmp    $0x78,%al
    11e6:	74 18                	je     1200 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
    11e8:	85 db                	test   %ebx,%ebx
    11ea:	0f 85 5e ff ff ff    	jne    114e <strtol+0x5e>
        s++, base = 8;
    11f0:	83 c1 01             	add    $0x1,%ecx
    11f3:	0f be d0             	movsbl %al,%edx
    11f6:	bb 08 00 00 00       	mov    $0x8,%ebx
    11fb:	e9 4e ff ff ff       	jmp    114e <strtol+0x5e>
        s += 2, base = 16;
    1200:	0f be 51 02          	movsbl 0x2(%ecx),%edx
    1204:	bb 10 00 00 00       	mov    $0x10,%ebx
    1209:	83 c1 02             	add    $0x2,%ecx
    120c:	e9 3d ff ff ff       	jmp    114e <strtol+0x5e>
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1218:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    121f:	90                   	nop

00001220 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
    1220:	f3 0f 1e fb          	endbr32 
    1224:	55                   	push   %ebp
    1225:	89 e5                	mov    %esp,%ebp
    1227:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
    1228:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
    122a:	56                   	push   %esi
    122b:	53                   	push   %ebx
    122c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
    122f:	83 ec 1c             	sub    $0x1c,%esp
    1232:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
    1235:	83 ec 04             	sub    $0x4,%esp
    1238:	6a 0a                	push   $0xa
    123a:	53                   	push   %ebx
    123b:	56                   	push   %esi
    123c:	e8 af fe ff ff       	call   10f0 <strtol>
        if (ret < 0 || ret > 255) {
    1241:	83 c4 10             	add    $0x10,%esp
    1244:	3d ff 00 00 00       	cmp    $0xff,%eax
    1249:	77 3d                	ja     1288 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
    124b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    124e:	39 f1                	cmp    %esi,%ecx
    1250:	74 36                	je     1288 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
    1252:	0f b6 11             	movzbl (%ecx),%edx
    1255:	83 ff 03             	cmp    $0x3,%edi
    1258:	74 16                	je     1270 <ip_addr_pton+0x50>
    125a:	80 fa 2e             	cmp    $0x2e,%dl
    125d:	75 29                	jne    1288 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
    125f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
    1262:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
    1265:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
    1268:	83 c7 01             	add    $0x1,%edi
    126b:	eb c8                	jmp    1235 <ip_addr_pton+0x15>
    126d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
    1270:	84 d2                	test   %dl,%dl
    1272:	75 14                	jne    1288 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
    1274:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1277:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
    127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
    127d:	31 c0                	xor    %eax,%eax
}
    127f:	5b                   	pop    %ebx
    1280:	5e                   	pop    %esi
    1281:	5f                   	pop    %edi
    1282:	5d                   	pop    %ebp
    1283:	c3                   	ret    
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1288:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
    128b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1290:	5b                   	pop    %ebx
    1291:	5e                   	pop    %esi
    1292:	5f                   	pop    %edi
    1293:	5d                   	pop    %ebp
    1294:	c3                   	ret    

00001295 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1295:	b8 01 00 00 00       	mov    $0x1,%eax
    129a:	cd 40                	int    $0x40
    129c:	c3                   	ret    

0000129d <exit>:
SYSCALL(exit)
    129d:	b8 02 00 00 00       	mov    $0x2,%eax
    12a2:	cd 40                	int    $0x40
    12a4:	c3                   	ret    

000012a5 <wait>:
SYSCALL(wait)
    12a5:	b8 03 00 00 00       	mov    $0x3,%eax
    12aa:	cd 40                	int    $0x40
    12ac:	c3                   	ret    

000012ad <pipe>:
SYSCALL(pipe)
    12ad:	b8 04 00 00 00       	mov    $0x4,%eax
    12b2:	cd 40                	int    $0x40
    12b4:	c3                   	ret    

000012b5 <read>:
SYSCALL(read)
    12b5:	b8 05 00 00 00       	mov    $0x5,%eax
    12ba:	cd 40                	int    $0x40
    12bc:	c3                   	ret    

000012bd <write>:
SYSCALL(write)
    12bd:	b8 10 00 00 00       	mov    $0x10,%eax
    12c2:	cd 40                	int    $0x40
    12c4:	c3                   	ret    

000012c5 <close>:
SYSCALL(close)
    12c5:	b8 15 00 00 00       	mov    $0x15,%eax
    12ca:	cd 40                	int    $0x40
    12cc:	c3                   	ret    

000012cd <kill>:
SYSCALL(kill)
    12cd:	b8 06 00 00 00       	mov    $0x6,%eax
    12d2:	cd 40                	int    $0x40
    12d4:	c3                   	ret    

000012d5 <exec>:
SYSCALL(exec)
    12d5:	b8 07 00 00 00       	mov    $0x7,%eax
    12da:	cd 40                	int    $0x40
    12dc:	c3                   	ret    

000012dd <open>:
SYSCALL(open)
    12dd:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e2:	cd 40                	int    $0x40
    12e4:	c3                   	ret    

000012e5 <mknod>:
SYSCALL(mknod)
    12e5:	b8 11 00 00 00       	mov    $0x11,%eax
    12ea:	cd 40                	int    $0x40
    12ec:	c3                   	ret    

000012ed <unlink>:
SYSCALL(unlink)
    12ed:	b8 12 00 00 00       	mov    $0x12,%eax
    12f2:	cd 40                	int    $0x40
    12f4:	c3                   	ret    

000012f5 <fstat>:
SYSCALL(fstat)
    12f5:	b8 08 00 00 00       	mov    $0x8,%eax
    12fa:	cd 40                	int    $0x40
    12fc:	c3                   	ret    

000012fd <link>:
SYSCALL(link)
    12fd:	b8 13 00 00 00       	mov    $0x13,%eax
    1302:	cd 40                	int    $0x40
    1304:	c3                   	ret    

00001305 <mkdir>:
SYSCALL(mkdir)
    1305:	b8 14 00 00 00       	mov    $0x14,%eax
    130a:	cd 40                	int    $0x40
    130c:	c3                   	ret    

0000130d <chdir>:
SYSCALL(chdir)
    130d:	b8 09 00 00 00       	mov    $0x9,%eax
    1312:	cd 40                	int    $0x40
    1314:	c3                   	ret    

00001315 <dup>:
SYSCALL(dup)
    1315:	b8 0a 00 00 00       	mov    $0xa,%eax
    131a:	cd 40                	int    $0x40
    131c:	c3                   	ret    

0000131d <getpid>:
SYSCALL(getpid)
    131d:	b8 0b 00 00 00       	mov    $0xb,%eax
    1322:	cd 40                	int    $0x40
    1324:	c3                   	ret    

00001325 <sbrk>:
SYSCALL(sbrk)
    1325:	b8 0c 00 00 00       	mov    $0xc,%eax
    132a:	cd 40                	int    $0x40
    132c:	c3                   	ret    

0000132d <sleep>:
SYSCALL(sleep)
    132d:	b8 0d 00 00 00       	mov    $0xd,%eax
    1332:	cd 40                	int    $0x40
    1334:	c3                   	ret    

00001335 <uptime>:
SYSCALL(uptime)
    1335:	b8 0e 00 00 00       	mov    $0xe,%eax
    133a:	cd 40                	int    $0x40
    133c:	c3                   	ret    

0000133d <ioctl>:
# iotcl
SYSCALL(ioctl)
    133d:	b8 16 00 00 00       	mov    $0x16,%eax
    1342:	cd 40                	int    $0x40
    1344:	c3                   	ret    

00001345 <socket>:
# socket
SYSCALL(socket)
    1345:	b8 17 00 00 00       	mov    $0x17,%eax
    134a:	cd 40                	int    $0x40
    134c:	c3                   	ret    

0000134d <bind>:
SYSCALL(bind)
    134d:	b8 19 00 00 00       	mov    $0x19,%eax
    1352:	cd 40                	int    $0x40
    1354:	c3                   	ret    

00001355 <listen>:
SYSCALL(listen)
    1355:	b8 1a 00 00 00       	mov    $0x1a,%eax
    135a:	cd 40                	int    $0x40
    135c:	c3                   	ret    

0000135d <accept>:
SYSCALL(accept)
    135d:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1362:	cd 40                	int    $0x40
    1364:	c3                   	ret    

00001365 <recv>:
SYSCALL(recv)
    1365:	b8 1c 00 00 00       	mov    $0x1c,%eax
    136a:	cd 40                	int    $0x40
    136c:	c3                   	ret    

0000136d <send>:
SYSCALL(send)
    136d:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1372:	cd 40                	int    $0x40
    1374:	c3                   	ret    

00001375 <recvfrom>:
SYSCALL(recvfrom)
    1375:	b8 1e 00 00 00       	mov    $0x1e,%eax
    137a:	cd 40                	int    $0x40
    137c:	c3                   	ret    

0000137d <sendto>:
SYSCALL(sendto)
    137d:	b8 1f 00 00 00       	mov    $0x1f,%eax
    1382:	cd 40                	int    $0x40
    1384:	c3                   	ret    
    1385:	66 90                	xchg   %ax,%ax
    1387:	66 90                	xchg   %ax,%ax
    1389:	66 90                	xchg   %ax,%ax
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	83 ec 3c             	sub    $0x3c,%esp
    1399:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    139c:	89 d1                	mov    %edx,%ecx
{
    139e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13a1:	85 d2                	test   %edx,%edx
    13a3:	0f 89 7f 00 00 00    	jns    1428 <printint+0x98>
    13a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13ad:	74 79                	je     1428 <printint+0x98>
    neg = 1;
    13af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13b8:	31 db                	xor    %ebx,%ebx
    13ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13c0:	89 c8                	mov    %ecx,%eax
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	89 cf                	mov    %ecx,%edi
    13c6:	f7 75 c4             	divl   -0x3c(%ebp)
    13c9:	0f b6 92 0c 19 00 00 	movzbl 0x190c(%edx),%edx
    13d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13d3:	89 d8                	mov    %ebx,%eax
    13d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13e1:	76 dd                	jbe    13c0 <printint+0x30>
  if(neg)
    13e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13e6:	85 c9                	test   %ecx,%ecx
    13e8:	74 0c                	je     13f6 <printint+0x66>
    buf[i++] = '-';
    13ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13fd:	eb 07                	jmp    1406 <printint+0x76>
    13ff:	90                   	nop
    1400:	0f b6 13             	movzbl (%ebx),%edx
    1403:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1406:	83 ec 04             	sub    $0x4,%esp
    1409:	88 55 d7             	mov    %dl,-0x29(%ebp)
    140c:	6a 01                	push   $0x1
    140e:	56                   	push   %esi
    140f:	57                   	push   %edi
    1410:	e8 a8 fe ff ff       	call   12bd <write>
  while(--i >= 0)
    1415:	83 c4 10             	add    $0x10,%esp
    1418:	39 de                	cmp    %ebx,%esi
    141a:	75 e4                	jne    1400 <printint+0x70>
    putc(fd, buf[i]);
}
    141c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    141f:	5b                   	pop    %ebx
    1420:	5e                   	pop    %esi
    1421:	5f                   	pop    %edi
    1422:	5d                   	pop    %ebp
    1423:	c3                   	ret    
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1428:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    142f:	eb 87                	jmp    13b8 <printint+0x28>
    1431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143f:	90                   	nop

00001440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1440:	f3 0f 1e fb          	endbr32 
    1444:	55                   	push   %ebp
    1445:	89 e5                	mov    %esp,%ebp
    1447:	57                   	push   %edi
    1448:	56                   	push   %esi
    1449:	53                   	push   %ebx
    144a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    144d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1450:	0f b6 1e             	movzbl (%esi),%ebx
    1453:	84 db                	test   %bl,%bl
    1455:	0f 84 b4 00 00 00    	je     150f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    145b:	8d 45 10             	lea    0x10(%ebp),%eax
    145e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1461:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1464:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1466:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1469:	eb 33                	jmp    149e <printf+0x5e>
    146b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop
    1470:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1473:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1478:	83 f8 25             	cmp    $0x25,%eax
    147b:	74 17                	je     1494 <printf+0x54>
  write(fd, &c, 1);
    147d:	83 ec 04             	sub    $0x4,%esp
    1480:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	ff 75 08             	pushl  0x8(%ebp)
    1489:	e8 2f fe ff ff       	call   12bd <write>
    148e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1491:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1494:	0f b6 1e             	movzbl (%esi),%ebx
    1497:	83 c6 01             	add    $0x1,%esi
    149a:	84 db                	test   %bl,%bl
    149c:	74 71                	je     150f <printf+0xcf>
    c = fmt[i] & 0xff;
    149e:	0f be cb             	movsbl %bl,%ecx
    14a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14a4:	85 d2                	test   %edx,%edx
    14a6:	74 c8                	je     1470 <printf+0x30>
      }
    } else if(state == '%'){
    14a8:	83 fa 25             	cmp    $0x25,%edx
    14ab:	75 e7                	jne    1494 <printf+0x54>
      if(c == 'd'){
    14ad:	83 f8 64             	cmp    $0x64,%eax
    14b0:	0f 84 9a 00 00 00    	je     1550 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14bc:	83 f9 70             	cmp    $0x70,%ecx
    14bf:	74 5f                	je     1520 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14c1:	83 f8 73             	cmp    $0x73,%eax
    14c4:	0f 84 d6 00 00 00    	je     15a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ca:	83 f8 63             	cmp    $0x63,%eax
    14cd:	0f 84 8d 00 00 00    	je     1560 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14d3:	83 f8 25             	cmp    $0x25,%eax
    14d6:	0f 84 b4 00 00 00    	je     1590 <printf+0x150>
  write(fd, &c, 1);
    14dc:	83 ec 04             	sub    $0x4,%esp
    14df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14e3:	6a 01                	push   $0x1
    14e5:	57                   	push   %edi
    14e6:	ff 75 08             	pushl  0x8(%ebp)
    14e9:	e8 cf fd ff ff       	call   12bd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14f1:	83 c4 0c             	add    $0xc,%esp
    14f4:	6a 01                	push   $0x1
    14f6:	83 c6 01             	add    $0x1,%esi
    14f9:	57                   	push   %edi
    14fa:	ff 75 08             	pushl  0x8(%ebp)
    14fd:	e8 bb fd ff ff       	call   12bd <write>
  for(i = 0; fmt[i]; i++){
    1502:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1506:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1509:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    150b:	84 db                	test   %bl,%bl
    150d:	75 8f                	jne    149e <printf+0x5e>
    }
  }
}
    150f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1512:	5b                   	pop    %ebx
    1513:	5e                   	pop    %esi
    1514:	5f                   	pop    %edi
    1515:	5d                   	pop    %ebp
    1516:	c3                   	ret    
    1517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 10 00 00 00       	mov    $0x10,%ecx
    1528:	6a 00                	push   $0x0
    152a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    152d:	8b 45 08             	mov    0x8(%ebp),%eax
    1530:	8b 13                	mov    (%ebx),%edx
    1532:	e8 59 fe ff ff       	call   1390 <printint>
        ap++;
    1537:	89 d8                	mov    %ebx,%eax
    1539:	83 c4 10             	add    $0x10,%esp
      state = 0;
    153c:	31 d2                	xor    %edx,%edx
        ap++;
    153e:	83 c0 04             	add    $0x4,%eax
    1541:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1544:	e9 4b ff ff ff       	jmp    1494 <printf+0x54>
    1549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1558:	6a 01                	push   $0x1
    155a:	eb ce                	jmp    152a <printf+0xea>
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1560:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1566:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1568:	6a 01                	push   $0x1
        ap++;
    156a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    156d:	57                   	push   %edi
    156e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1571:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1574:	e8 44 fd ff ff       	call   12bd <write>
        ap++;
    1579:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    157c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    157f:	31 d2                	xor    %edx,%edx
    1581:	e9 0e ff ff ff       	jmp    1494 <printf+0x54>
    1586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1590:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1593:	83 ec 04             	sub    $0x4,%esp
    1596:	e9 59 ff ff ff       	jmp    14f4 <printf+0xb4>
    159b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop
        s = (char*)*ap;
    15a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15a3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15a5:	83 c0 04             	add    $0x4,%eax
    15a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15ab:	85 db                	test   %ebx,%ebx
    15ad:	74 17                	je     15c6 <printf+0x186>
        while(*s != 0){
    15af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    15b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    15b4:	84 c0                	test   %al,%al
    15b6:	0f 84 d8 fe ff ff    	je     1494 <printf+0x54>
    15bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15bf:	89 de                	mov    %ebx,%esi
    15c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15c4:	eb 1a                	jmp    15e0 <printf+0x1a0>
          s = "(null)";
    15c6:	bb 04 19 00 00       	mov    $0x1904,%ebx
        while(*s != 0){
    15cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15ce:	b8 28 00 00 00       	mov    $0x28,%eax
    15d3:	89 de                	mov    %ebx,%esi
    15d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15df:	90                   	nop
  write(fd, &c, 1);
    15e0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15e3:	83 c6 01             	add    $0x1,%esi
    15e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15e9:	6a 01                	push   $0x1
    15eb:	57                   	push   %edi
    15ec:	53                   	push   %ebx
    15ed:	e8 cb fc ff ff       	call   12bd <write>
        while(*s != 0){
    15f2:	0f b6 06             	movzbl (%esi),%eax
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	84 c0                	test   %al,%al
    15fa:	75 e4                	jne    15e0 <printf+0x1a0>
    15fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15ff:	31 d2                	xor    %edx,%edx
    1601:	e9 8e fe ff ff       	jmp    1494 <printf+0x54>
    1606:	66 90                	xchg   %ax,%ax
    1608:	66 90                	xchg   %ax,%ax
    160a:	66 90                	xchg   %ax,%ax
    160c:	66 90                	xchg   %ax,%ax
    160e:	66 90                	xchg   %ax,%ax

00001610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1610:	f3 0f 1e fb          	endbr32 
    1614:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1615:	a1 a8 20 00 00       	mov    0x20a8,%eax
{
    161a:	89 e5                	mov    %esp,%ebp
    161c:	57                   	push   %edi
    161d:	56                   	push   %esi
    161e:	53                   	push   %ebx
    161f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1622:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1624:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1627:	39 c8                	cmp    %ecx,%eax
    1629:	73 15                	jae    1640 <free+0x30>
    162b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
    1630:	39 d1                	cmp    %edx,%ecx
    1632:	72 14                	jb     1648 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1634:	39 d0                	cmp    %edx,%eax
    1636:	73 10                	jae    1648 <free+0x38>
{
    1638:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    163a:	8b 10                	mov    (%eax),%edx
    163c:	39 c8                	cmp    %ecx,%eax
    163e:	72 f0                	jb     1630 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1640:	39 d0                	cmp    %edx,%eax
    1642:	72 f4                	jb     1638 <free+0x28>
    1644:	39 d1                	cmp    %edx,%ecx
    1646:	73 f0                	jae    1638 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1648:	8b 73 fc             	mov    -0x4(%ebx),%esi
    164b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    164e:	39 fa                	cmp    %edi,%edx
    1650:	74 1e                	je     1670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1655:	8b 50 04             	mov    0x4(%eax),%edx
    1658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    165b:	39 f1                	cmp    %esi,%ecx
    165d:	74 28                	je     1687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    165f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1661:	5b                   	pop    %ebx
  freep = p;
    1662:	a3 a8 20 00 00       	mov    %eax,0x20a8
}
    1667:	5e                   	pop    %esi
    1668:	5f                   	pop    %edi
    1669:	5d                   	pop    %ebp
    166a:	c3                   	ret    
    166b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    166f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1670:	03 72 04             	add    0x4(%edx),%esi
    1673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1676:	8b 10                	mov    (%eax),%edx
    1678:	8b 12                	mov    (%edx),%edx
    167a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    167d:	8b 50 04             	mov    0x4(%eax),%edx
    1680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1683:	39 f1                	cmp    %esi,%ecx
    1685:	75 d8                	jne    165f <free+0x4f>
    p->s.size += bp->s.size;
    1687:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    168a:	a3 a8 20 00 00       	mov    %eax,0x20a8
    p->s.size += bp->s.size;
    168f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1692:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1695:	89 10                	mov    %edx,(%eax)
}
    1697:	5b                   	pop    %ebx
    1698:	5e                   	pop    %esi
    1699:	5f                   	pop    %edi
    169a:	5d                   	pop    %ebp
    169b:	c3                   	ret    
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16a0:	f3 0f 1e fb          	endbr32 
    16a4:	55                   	push   %ebp
    16a5:	89 e5                	mov    %esp,%ebp
    16a7:	57                   	push   %edi
    16a8:	56                   	push   %esi
    16a9:	53                   	push   %ebx
    16aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16b0:	8b 3d a8 20 00 00    	mov    0x20a8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b6:	8d 70 07             	lea    0x7(%eax),%esi
    16b9:	c1 ee 03             	shr    $0x3,%esi
    16bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16bf:	85 ff                	test   %edi,%edi
    16c1:	0f 84 a9 00 00 00    	je     1770 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    16c9:	8b 48 04             	mov    0x4(%eax),%ecx
    16cc:	39 f1                	cmp    %esi,%ecx
    16ce:	73 6d                	jae    173d <malloc+0x9d>
    16d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16e8:	eb 17                	jmp    1701 <malloc+0x61>
    16ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16f2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16f5:	39 f1                	cmp    %esi,%ecx
    16f7:	73 4f                	jae    1748 <malloc+0xa8>
    16f9:	8b 3d a8 20 00 00    	mov    0x20a8,%edi
    16ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1701:	39 c7                	cmp    %eax,%edi
    1703:	75 eb                	jne    16f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1705:	83 ec 0c             	sub    $0xc,%esp
    1708:	ff 75 e4             	pushl  -0x1c(%ebp)
    170b:	e8 15 fc ff ff       	call   1325 <sbrk>
  if(p == (char*)-1)
    1710:	83 c4 10             	add    $0x10,%esp
    1713:	83 f8 ff             	cmp    $0xffffffff,%eax
    1716:	74 1b                	je     1733 <malloc+0x93>
  hp->s.size = nu;
    1718:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    171b:	83 ec 0c             	sub    $0xc,%esp
    171e:	83 c0 08             	add    $0x8,%eax
    1721:	50                   	push   %eax
    1722:	e8 e9 fe ff ff       	call   1610 <free>
  return freep;
    1727:	a1 a8 20 00 00       	mov    0x20a8,%eax
      if((p = morecore(nunits)) == 0)
    172c:	83 c4 10             	add    $0x10,%esp
    172f:	85 c0                	test   %eax,%eax
    1731:	75 bd                	jne    16f0 <malloc+0x50>
        return 0;
  }
}
    1733:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1736:	31 c0                	xor    %eax,%eax
}
    1738:	5b                   	pop    %ebx
    1739:	5e                   	pop    %esi
    173a:	5f                   	pop    %edi
    173b:	5d                   	pop    %ebp
    173c:	c3                   	ret    
    if(p->s.size >= nunits){
    173d:	89 c2                	mov    %eax,%edx
    173f:	89 f8                	mov    %edi,%eax
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1748:	39 ce                	cmp    %ecx,%esi
    174a:	74 54                	je     17a0 <malloc+0x100>
        p->s.size -= nunits;
    174c:	29 f1                	sub    %esi,%ecx
    174e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1751:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1754:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1757:	a3 a8 20 00 00       	mov    %eax,0x20a8
}
    175c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    175f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1762:	5b                   	pop    %ebx
    1763:	5e                   	pop    %esi
    1764:	5f                   	pop    %edi
    1765:	5d                   	pop    %ebp
    1766:	c3                   	ret    
    1767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    176e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1770:	c7 05 a8 20 00 00 ac 	movl   $0x20ac,0x20a8
    1777:	20 00 00 
    base.s.size = 0;
    177a:	bf ac 20 00 00       	mov    $0x20ac,%edi
    base.s.ptr = freep = prevp = &base;
    177f:	c7 05 ac 20 00 00 ac 	movl   $0x20ac,0x20ac
    1786:	20 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1789:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    178b:	c7 05 b0 20 00 00 00 	movl   $0x0,0x20b0
    1792:	00 00 00 
    if(p->s.size >= nunits){
    1795:	e9 36 ff ff ff       	jmp    16d0 <malloc+0x30>
    179a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17a0:	8b 0a                	mov    (%edx),%ecx
    17a2:	89 08                	mov    %ecx,(%eax)
    17a4:	eb b1                	jmp    1757 <malloc+0xb7>
