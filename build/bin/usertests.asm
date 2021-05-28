
build/bin/_usertests：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
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
      11:	51                   	push   %ecx
      12:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      15:	68 46 53 00 00       	push   $0x5346
      1a:	6a 01                	push   $0x1
      1c:	e8 cf 3f 00 00       	call   3ff0 <printf>

  if(open("usertests.ran", 0) >= 0){
      21:	59                   	pop    %ecx
      22:	58                   	pop    %eax
      23:	6a 00                	push   $0x0
      25:	68 5a 53 00 00       	push   $0x535a
      2a:	e8 5e 3e 00 00       	call   3e8d <open>
      2f:	83 c4 10             	add    $0x10,%esp
      32:	85 c0                	test   %eax,%eax
      34:	78 13                	js     49 <main+0x49>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      36:	52                   	push   %edx
      37:	52                   	push   %edx
      38:	68 c4 5a 00 00       	push   $0x5ac4
      3d:	6a 01                	push   $0x1
      3f:	e8 ac 3f 00 00       	call   3ff0 <printf>
    exit();
      44:	e8 04 3e 00 00       	call   3e4d <exit>
  }
  close(open("usertests.ran", O_CREATE));
      49:	50                   	push   %eax
      4a:	50                   	push   %eax
      4b:	68 00 02 00 00       	push   $0x200
      50:	68 5a 53 00 00       	push   $0x535a
      55:	e8 33 3e 00 00       	call   3e8d <open>
      5a:	89 04 24             	mov    %eax,(%esp)
      5d:	e8 13 3e 00 00       	call   3e75 <close>

  argptest();
      62:	e8 29 36 00 00       	call   3690 <argptest>
  createdelete();
      67:	e8 04 12 00 00       	call   1270 <createdelete>
  linkunlink();
      6c:	e8 df 1a 00 00       	call   1b50 <linkunlink>
  concreate();
      71:	e8 da 17 00 00       	call   1850 <concreate>
  fourfiles();
      76:	e8 f5 0f 00 00       	call   1070 <fourfiles>
  sharedfd();
      7b:	e8 30 0e 00 00       	call   eb0 <sharedfd>

  bigargtest();
      80:	e8 ab 32 00 00       	call   3330 <bigargtest>
  bigwrite();
      85:	e8 06 24 00 00       	call   2490 <bigwrite>
  bigargtest();
      8a:	e8 a1 32 00 00       	call   3330 <bigargtest>
  bsstest();
      8f:	e8 2c 32 00 00       	call   32c0 <bsstest>
  sbrktest();
      94:	e8 37 2d 00 00       	call   2dd0 <sbrktest>
  validatetest();
      99:	e8 62 31 00 00       	call   3200 <validatetest>

  opentest();
      9e:	e8 6d 03 00 00       	call   410 <opentest>
  writetest();
      a3:	e8 08 04 00 00       	call   4b0 <writetest>
  writetest1();
      a8:	e8 e3 05 00 00       	call   690 <writetest1>
  createtest();
      ad:	e8 ae 07 00 00       	call   860 <createtest>

  openiputtest();
      b2:	e8 59 02 00 00       	call   310 <openiputtest>
  exitiputtest();
      b7:	e8 54 01 00 00       	call   210 <exitiputtest>
  iputtest();
      bc:	e8 5f 00 00 00       	call   120 <iputtest>

  mem();
      c1:	e8 1a 0d 00 00       	call   de0 <mem>
  pipe1();
      c6:	e8 95 09 00 00       	call   a60 <pipe1>
  preempt();
      cb:	e8 30 0b 00 00       	call   c00 <preempt>
  exitwait();
      d0:	e8 8b 0c 00 00       	call   d60 <exitwait>

  rmdot();
      d5:	e8 a6 27 00 00       	call   2880 <rmdot>
  fourteen();
      da:	e8 61 26 00 00       	call   2740 <fourteen>
  bigfile();
      df:	e8 8c 24 00 00       	call   2570 <bigfile>
  subdir();
      e4:	e8 b7 1c 00 00       	call   1da0 <subdir>
  linktest();
      e9:	e8 42 15 00 00       	call   1630 <linktest>
  unlinkread();
      ee:	e8 ad 13 00 00       	call   14a0 <unlinkread>
  dirfile();
      f3:	e8 08 29 00 00       	call   2a00 <dirfile>
  iref();
      f8:	e8 03 2b 00 00       	call   2c00 <iref>
  forktest();
      fd:	e8 1e 2c 00 00       	call   2d20 <forktest>
  bigdir(); // slow
     102:	e8 59 1b 00 00       	call   1c60 <bigdir>

  uio();
     107:	e8 04 35 00 00       	call   3610 <uio>

  exectest();
     10c:	e8 ff 08 00 00       	call   a10 <exectest>

  exit();
     111:	e8 37 3d 00 00       	call   3e4d <exit>
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <iputtest>:
{
     120:	f3 0f 1e fb          	endbr32 
     124:	55                   	push   %ebp
     125:	89 e5                	mov    %esp,%ebp
     127:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     12a:	68 ec 43 00 00       	push   $0x43ec
     12f:	ff 35 98 65 00 00    	pushl  0x6598
     135:	e8 b6 3e 00 00       	call   3ff0 <printf>
  if(mkdir("iputdir") < 0){
     13a:	c7 04 24 7f 43 00 00 	movl   $0x437f,(%esp)
     141:	e8 6f 3d 00 00       	call   3eb5 <mkdir>
     146:	83 c4 10             	add    $0x10,%esp
     149:	85 c0                	test   %eax,%eax
     14b:	78 58                	js     1a5 <iputtest+0x85>
  if(chdir("iputdir") < 0){
     14d:	83 ec 0c             	sub    $0xc,%esp
     150:	68 7f 43 00 00       	push   $0x437f
     155:	e8 63 3d 00 00       	call   3ebd <chdir>
     15a:	83 c4 10             	add    $0x10,%esp
     15d:	85 c0                	test   %eax,%eax
     15f:	0f 88 85 00 00 00    	js     1ea <iputtest+0xca>
  if(unlink("../iputdir") < 0){
     165:	83 ec 0c             	sub    $0xc,%esp
     168:	68 7c 43 00 00       	push   $0x437c
     16d:	e8 2b 3d 00 00       	call   3e9d <unlink>
     172:	83 c4 10             	add    $0x10,%esp
     175:	85 c0                	test   %eax,%eax
     177:	78 5a                	js     1d3 <iputtest+0xb3>
  if(chdir("/") < 0){
     179:	83 ec 0c             	sub    $0xc,%esp
     17c:	68 a1 43 00 00       	push   $0x43a1
     181:	e8 37 3d 00 00       	call   3ebd <chdir>
     186:	83 c4 10             	add    $0x10,%esp
     189:	85 c0                	test   %eax,%eax
     18b:	78 2f                	js     1bc <iputtest+0x9c>
  printf(stdout, "iput test ok\n");
     18d:	83 ec 08             	sub    $0x8,%esp
     190:	68 24 44 00 00       	push   $0x4424
     195:	ff 35 98 65 00 00    	pushl  0x6598
     19b:	e8 50 3e 00 00       	call   3ff0 <printf>
}
     1a0:	83 c4 10             	add    $0x10,%esp
     1a3:	c9                   	leave  
     1a4:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1a5:	50                   	push   %eax
     1a6:	50                   	push   %eax
     1a7:	68 58 43 00 00       	push   $0x4358
     1ac:	ff 35 98 65 00 00    	pushl  0x6598
     1b2:	e8 39 3e 00 00       	call   3ff0 <printf>
    exit();
     1b7:	e8 91 3c 00 00       	call   3e4d <exit>
    printf(stdout, "chdir / failed\n");
     1bc:	50                   	push   %eax
     1bd:	50                   	push   %eax
     1be:	68 a3 43 00 00       	push   $0x43a3
     1c3:	ff 35 98 65 00 00    	pushl  0x6598
     1c9:	e8 22 3e 00 00       	call   3ff0 <printf>
    exit();
     1ce:	e8 7a 3c 00 00       	call   3e4d <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1d3:	52                   	push   %edx
     1d4:	52                   	push   %edx
     1d5:	68 87 43 00 00       	push   $0x4387
     1da:	ff 35 98 65 00 00    	pushl  0x6598
     1e0:	e8 0b 3e 00 00       	call   3ff0 <printf>
    exit();
     1e5:	e8 63 3c 00 00       	call   3e4d <exit>
    printf(stdout, "chdir iputdir failed\n");
     1ea:	51                   	push   %ecx
     1eb:	51                   	push   %ecx
     1ec:	68 66 43 00 00       	push   $0x4366
     1f1:	ff 35 98 65 00 00    	pushl  0x6598
     1f7:	e8 f4 3d 00 00       	call   3ff0 <printf>
    exit();
     1fc:	e8 4c 3c 00 00       	call   3e4d <exit>
     201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     20f:	90                   	nop

00000210 <exitiputtest>:
{
     210:	f3 0f 1e fb          	endbr32 
     214:	55                   	push   %ebp
     215:	89 e5                	mov    %esp,%ebp
     217:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     21a:	68 b3 43 00 00       	push   $0x43b3
     21f:	ff 35 98 65 00 00    	pushl  0x6598
     225:	e8 c6 3d 00 00       	call   3ff0 <printf>
  pid = fork();
     22a:	e8 16 3c 00 00       	call   3e45 <fork>
  if(pid < 0){
     22f:	83 c4 10             	add    $0x10,%esp
     232:	85 c0                	test   %eax,%eax
     234:	0f 88 86 00 00 00    	js     2c0 <exitiputtest+0xb0>
  if(pid == 0){
     23a:	75 4c                	jne    288 <exitiputtest+0x78>
    if(mkdir("iputdir") < 0){
     23c:	83 ec 0c             	sub    $0xc,%esp
     23f:	68 7f 43 00 00       	push   $0x437f
     244:	e8 6c 3c 00 00       	call   3eb5 <mkdir>
     249:	83 c4 10             	add    $0x10,%esp
     24c:	85 c0                	test   %eax,%eax
     24e:	0f 88 83 00 00 00    	js     2d7 <exitiputtest+0xc7>
    if(chdir("iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 7f 43 00 00       	push   $0x437f
     25c:	e8 5c 3c 00 00       	call   3ebd <chdir>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	0f 88 82 00 00 00    	js     2ee <exitiputtest+0xde>
    if(unlink("../iputdir") < 0){
     26c:	83 ec 0c             	sub    $0xc,%esp
     26f:	68 7c 43 00 00       	push   $0x437c
     274:	e8 24 3c 00 00       	call   3e9d <unlink>
     279:	83 c4 10             	add    $0x10,%esp
     27c:	85 c0                	test   %eax,%eax
     27e:	78 28                	js     2a8 <exitiputtest+0x98>
    exit();
     280:	e8 c8 3b 00 00       	call   3e4d <exit>
     285:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     288:	e8 c8 3b 00 00       	call   3e55 <wait>
  printf(stdout, "exitiput test ok\n");
     28d:	83 ec 08             	sub    $0x8,%esp
     290:	68 d6 43 00 00       	push   $0x43d6
     295:	ff 35 98 65 00 00    	pushl  0x6598
     29b:	e8 50 3d 00 00       	call   3ff0 <printf>
}
     2a0:	83 c4 10             	add    $0x10,%esp
     2a3:	c9                   	leave  
     2a4:	c3                   	ret    
     2a5:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	68 87 43 00 00       	push   $0x4387
     2b0:	ff 35 98 65 00 00    	pushl  0x6598
     2b6:	e8 35 3d 00 00       	call   3ff0 <printf>
      exit();
     2bb:	e8 8d 3b 00 00       	call   3e4d <exit>
    printf(stdout, "fork failed\n");
     2c0:	51                   	push   %ecx
     2c1:	51                   	push   %ecx
     2c2:	68 99 52 00 00       	push   $0x5299
     2c7:	ff 35 98 65 00 00    	pushl  0x6598
     2cd:	e8 1e 3d 00 00       	call   3ff0 <printf>
    exit();
     2d2:	e8 76 3b 00 00       	call   3e4d <exit>
      printf(stdout, "mkdir failed\n");
     2d7:	52                   	push   %edx
     2d8:	52                   	push   %edx
     2d9:	68 58 43 00 00       	push   $0x4358
     2de:	ff 35 98 65 00 00    	pushl  0x6598
     2e4:	e8 07 3d 00 00       	call   3ff0 <printf>
      exit();
     2e9:	e8 5f 3b 00 00       	call   3e4d <exit>
      printf(stdout, "child chdir failed\n");
     2ee:	50                   	push   %eax
     2ef:	50                   	push   %eax
     2f0:	68 c2 43 00 00       	push   $0x43c2
     2f5:	ff 35 98 65 00 00    	pushl  0x6598
     2fb:	e8 f0 3c 00 00       	call   3ff0 <printf>
      exit();
     300:	e8 48 3b 00 00       	call   3e4d <exit>
     305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <openiputtest>:
{
     310:	f3 0f 1e fb          	endbr32 
     314:	55                   	push   %ebp
     315:	89 e5                	mov    %esp,%ebp
     317:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     31a:	68 e8 43 00 00       	push   $0x43e8
     31f:	ff 35 98 65 00 00    	pushl  0x6598
     325:	e8 c6 3c 00 00       	call   3ff0 <printf>
  if(mkdir("oidir") < 0){
     32a:	c7 04 24 f7 43 00 00 	movl   $0x43f7,(%esp)
     331:	e8 7f 3b 00 00       	call   3eb5 <mkdir>
     336:	83 c4 10             	add    $0x10,%esp
     339:	85 c0                	test   %eax,%eax
     33b:	0f 88 9b 00 00 00    	js     3dc <openiputtest+0xcc>
  pid = fork();
     341:	e8 ff 3a 00 00       	call   3e45 <fork>
  if(pid < 0){
     346:	85 c0                	test   %eax,%eax
     348:	78 7b                	js     3c5 <openiputtest+0xb5>
  if(pid == 0){
     34a:	75 34                	jne    380 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     34c:	83 ec 08             	sub    $0x8,%esp
     34f:	6a 02                	push   $0x2
     351:	68 f7 43 00 00       	push   $0x43f7
     356:	e8 32 3b 00 00       	call   3e8d <open>
    if(fd >= 0){
     35b:	83 c4 10             	add    $0x10,%esp
     35e:	85 c0                	test   %eax,%eax
     360:	78 5e                	js     3c0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     362:	83 ec 08             	sub    $0x8,%esp
     365:	68 7c 53 00 00       	push   $0x537c
     36a:	ff 35 98 65 00 00    	pushl  0x6598
     370:	e8 7b 3c 00 00       	call   3ff0 <printf>
      exit();
     375:	e8 d3 3a 00 00       	call   3e4d <exit>
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     380:	83 ec 0c             	sub    $0xc,%esp
     383:	6a 01                	push   $0x1
     385:	e8 53 3b 00 00       	call   3edd <sleep>
  if(unlink("oidir") != 0){
     38a:	c7 04 24 f7 43 00 00 	movl   $0x43f7,(%esp)
     391:	e8 07 3b 00 00       	call   3e9d <unlink>
     396:	83 c4 10             	add    $0x10,%esp
     399:	85 c0                	test   %eax,%eax
     39b:	75 56                	jne    3f3 <openiputtest+0xe3>
  wait();
     39d:	e8 b3 3a 00 00       	call   3e55 <wait>
  printf(stdout, "openiput test ok\n");
     3a2:	83 ec 08             	sub    $0x8,%esp
     3a5:	68 20 44 00 00       	push   $0x4420
     3aa:	ff 35 98 65 00 00    	pushl  0x6598
     3b0:	e8 3b 3c 00 00       	call   3ff0 <printf>
     3b5:	83 c4 10             	add    $0x10,%esp
}
     3b8:	c9                   	leave  
     3b9:	c3                   	ret    
     3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     3c0:	e8 88 3a 00 00       	call   3e4d <exit>
    printf(stdout, "fork failed\n");
     3c5:	52                   	push   %edx
     3c6:	52                   	push   %edx
     3c7:	68 99 52 00 00       	push   $0x5299
     3cc:	ff 35 98 65 00 00    	pushl  0x6598
     3d2:	e8 19 3c 00 00       	call   3ff0 <printf>
    exit();
     3d7:	e8 71 3a 00 00       	call   3e4d <exit>
    printf(stdout, "mkdir oidir failed\n");
     3dc:	51                   	push   %ecx
     3dd:	51                   	push   %ecx
     3de:	68 fd 43 00 00       	push   $0x43fd
     3e3:	ff 35 98 65 00 00    	pushl  0x6598
     3e9:	e8 02 3c 00 00       	call   3ff0 <printf>
    exit();
     3ee:	e8 5a 3a 00 00       	call   3e4d <exit>
    printf(stdout, "unlink failed\n");
     3f3:	50                   	push   %eax
     3f4:	50                   	push   %eax
     3f5:	68 11 44 00 00       	push   $0x4411
     3fa:	ff 35 98 65 00 00    	pushl  0x6598
     400:	e8 eb 3b 00 00       	call   3ff0 <printf>
    exit();
     405:	e8 43 3a 00 00       	call   3e4d <exit>
     40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000410 <opentest>:
{
     410:	f3 0f 1e fb          	endbr32 
     414:	55                   	push   %ebp
     415:	89 e5                	mov    %esp,%ebp
     417:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     41a:	68 32 44 00 00       	push   $0x4432
     41f:	ff 35 98 65 00 00    	pushl  0x6598
     425:	e8 c6 3b 00 00       	call   3ff0 <printf>
  fd = open("echo", 0);
     42a:	58                   	pop    %eax
     42b:	5a                   	pop    %edx
     42c:	6a 00                	push   $0x0
     42e:	68 3d 44 00 00       	push   $0x443d
     433:	e8 55 3a 00 00       	call   3e8d <open>
  if(fd < 0){
     438:	83 c4 10             	add    $0x10,%esp
     43b:	85 c0                	test   %eax,%eax
     43d:	78 36                	js     475 <opentest+0x65>
  close(fd);
     43f:	83 ec 0c             	sub    $0xc,%esp
     442:	50                   	push   %eax
     443:	e8 2d 3a 00 00       	call   3e75 <close>
  fd = open("doesnotexist", 0);
     448:	5a                   	pop    %edx
     449:	59                   	pop    %ecx
     44a:	6a 00                	push   $0x0
     44c:	68 55 44 00 00       	push   $0x4455
     451:	e8 37 3a 00 00       	call   3e8d <open>
  if(fd >= 0){
     456:	83 c4 10             	add    $0x10,%esp
     459:	85 c0                	test   %eax,%eax
     45b:	79 2f                	jns    48c <opentest+0x7c>
  printf(stdout, "open test ok\n");
     45d:	83 ec 08             	sub    $0x8,%esp
     460:	68 80 44 00 00       	push   $0x4480
     465:	ff 35 98 65 00 00    	pushl  0x6598
     46b:	e8 80 3b 00 00       	call   3ff0 <printf>
}
     470:	83 c4 10             	add    $0x10,%esp
     473:	c9                   	leave  
     474:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     475:	50                   	push   %eax
     476:	50                   	push   %eax
     477:	68 42 44 00 00       	push   $0x4442
     47c:	ff 35 98 65 00 00    	pushl  0x6598
     482:	e8 69 3b 00 00       	call   3ff0 <printf>
    exit();
     487:	e8 c1 39 00 00       	call   3e4d <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     48c:	50                   	push   %eax
     48d:	50                   	push   %eax
     48e:	68 62 44 00 00       	push   $0x4462
     493:	ff 35 98 65 00 00    	pushl  0x6598
     499:	e8 52 3b 00 00       	call   3ff0 <printf>
    exit();
     49e:	e8 aa 39 00 00       	call   3e4d <exit>
     4a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <writetest>:
{
     4b0:	f3 0f 1e fb          	endbr32 
     4b4:	55                   	push   %ebp
     4b5:	89 e5                	mov    %esp,%ebp
     4b7:	56                   	push   %esi
     4b8:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     4b9:	83 ec 08             	sub    $0x8,%esp
     4bc:	68 8e 44 00 00       	push   $0x448e
     4c1:	ff 35 98 65 00 00    	pushl  0x6598
     4c7:	e8 24 3b 00 00       	call   3ff0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     4cc:	58                   	pop    %eax
     4cd:	5a                   	pop    %edx
     4ce:	68 02 02 00 00       	push   $0x202
     4d3:	68 9f 44 00 00       	push   $0x449f
     4d8:	e8 b0 39 00 00       	call   3e8d <open>
  if(fd >= 0){
     4dd:	83 c4 10             	add    $0x10,%esp
     4e0:	85 c0                	test   %eax,%eax
     4e2:	0f 88 8c 01 00 00    	js     674 <writetest+0x1c4>
    printf(stdout, "creat small succeeded; ok\n");
     4e8:	83 ec 08             	sub    $0x8,%esp
     4eb:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     4ed:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4ef:	68 a5 44 00 00       	push   $0x44a5
     4f4:	ff 35 98 65 00 00    	pushl  0x6598
     4fa:	e8 f1 3a 00 00       	call   3ff0 <printf>
     4ff:	83 c4 10             	add    $0x10,%esp
     502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     508:	83 ec 04             	sub    $0x4,%esp
     50b:	6a 0a                	push   $0xa
     50d:	68 dc 44 00 00       	push   $0x44dc
     512:	56                   	push   %esi
     513:	e8 55 39 00 00       	call   3e6d <write>
     518:	83 c4 10             	add    $0x10,%esp
     51b:	83 f8 0a             	cmp    $0xa,%eax
     51e:	0f 85 d9 00 00 00    	jne    5fd <writetest+0x14d>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     524:	83 ec 04             	sub    $0x4,%esp
     527:	6a 0a                	push   $0xa
     529:	68 e7 44 00 00       	push   $0x44e7
     52e:	56                   	push   %esi
     52f:	e8 39 39 00 00       	call   3e6d <write>
     534:	83 c4 10             	add    $0x10,%esp
     537:	83 f8 0a             	cmp    $0xa,%eax
     53a:	0f 85 d6 00 00 00    	jne    616 <writetest+0x166>
  for(i = 0; i < 100; i++){
     540:	83 c3 01             	add    $0x1,%ebx
     543:	83 fb 64             	cmp    $0x64,%ebx
     546:	75 c0                	jne    508 <writetest+0x58>
  printf(stdout, "writes ok\n");
     548:	83 ec 08             	sub    $0x8,%esp
     54b:	68 f2 44 00 00       	push   $0x44f2
     550:	ff 35 98 65 00 00    	pushl  0x6598
     556:	e8 95 3a 00 00       	call   3ff0 <printf>
  close(fd);
     55b:	89 34 24             	mov    %esi,(%esp)
     55e:	e8 12 39 00 00       	call   3e75 <close>
  fd = open("small", O_RDONLY);
     563:	5b                   	pop    %ebx
     564:	5e                   	pop    %esi
     565:	6a 00                	push   $0x0
     567:	68 9f 44 00 00       	push   $0x449f
     56c:	e8 1c 39 00 00       	call   3e8d <open>
  if(fd >= 0){
     571:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     574:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     576:	85 c0                	test   %eax,%eax
     578:	0f 88 b1 00 00 00    	js     62f <writetest+0x17f>
    printf(stdout, "open small succeeded ok\n");
     57e:	83 ec 08             	sub    $0x8,%esp
     581:	68 fd 44 00 00       	push   $0x44fd
     586:	ff 35 98 65 00 00    	pushl  0x6598
     58c:	e8 5f 3a 00 00       	call   3ff0 <printf>
  i = read(fd, buf, 2000);
     591:	83 c4 0c             	add    $0xc,%esp
     594:	68 d0 07 00 00       	push   $0x7d0
     599:	68 80 8d 00 00       	push   $0x8d80
     59e:	53                   	push   %ebx
     59f:	e8 c1 38 00 00       	call   3e65 <read>
  if(i == 2000){
     5a4:	83 c4 10             	add    $0x10,%esp
     5a7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     5ac:	0f 85 94 00 00 00    	jne    646 <writetest+0x196>
    printf(stdout, "read succeeded ok\n");
     5b2:	83 ec 08             	sub    $0x8,%esp
     5b5:	68 31 45 00 00       	push   $0x4531
     5ba:	ff 35 98 65 00 00    	pushl  0x6598
     5c0:	e8 2b 3a 00 00       	call   3ff0 <printf>
  close(fd);
     5c5:	89 1c 24             	mov    %ebx,(%esp)
     5c8:	e8 a8 38 00 00       	call   3e75 <close>
  if(unlink("small") < 0){
     5cd:	c7 04 24 9f 44 00 00 	movl   $0x449f,(%esp)
     5d4:	e8 c4 38 00 00       	call   3e9d <unlink>
     5d9:	83 c4 10             	add    $0x10,%esp
     5dc:	85 c0                	test   %eax,%eax
     5de:	78 7d                	js     65d <writetest+0x1ad>
  printf(stdout, "small file test ok\n");
     5e0:	83 ec 08             	sub    $0x8,%esp
     5e3:	68 59 45 00 00       	push   $0x4559
     5e8:	ff 35 98 65 00 00    	pushl  0x6598
     5ee:	e8 fd 39 00 00       	call   3ff0 <printf>
}
     5f3:	83 c4 10             	add    $0x10,%esp
     5f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5f9:	5b                   	pop    %ebx
     5fa:	5e                   	pop    %esi
     5fb:	5d                   	pop    %ebp
     5fc:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5fd:	83 ec 04             	sub    $0x4,%esp
     600:	53                   	push   %ebx
     601:	68 a0 53 00 00       	push   $0x53a0
     606:	ff 35 98 65 00 00    	pushl  0x6598
     60c:	e8 df 39 00 00       	call   3ff0 <printf>
      exit();
     611:	e8 37 38 00 00       	call   3e4d <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     616:	83 ec 04             	sub    $0x4,%esp
     619:	53                   	push   %ebx
     61a:	68 c4 53 00 00       	push   $0x53c4
     61f:	ff 35 98 65 00 00    	pushl  0x6598
     625:	e8 c6 39 00 00       	call   3ff0 <printf>
      exit();
     62a:	e8 1e 38 00 00       	call   3e4d <exit>
    printf(stdout, "error: open small failed!\n");
     62f:	51                   	push   %ecx
     630:	51                   	push   %ecx
     631:	68 16 45 00 00       	push   $0x4516
     636:	ff 35 98 65 00 00    	pushl  0x6598
     63c:	e8 af 39 00 00       	call   3ff0 <printf>
    exit();
     641:	e8 07 38 00 00       	call   3e4d <exit>
    printf(stdout, "read failed\n");
     646:	52                   	push   %edx
     647:	52                   	push   %edx
     648:	68 5d 48 00 00       	push   $0x485d
     64d:	ff 35 98 65 00 00    	pushl  0x6598
     653:	e8 98 39 00 00       	call   3ff0 <printf>
    exit();
     658:	e8 f0 37 00 00       	call   3e4d <exit>
    printf(stdout, "unlink small failed\n");
     65d:	50                   	push   %eax
     65e:	50                   	push   %eax
     65f:	68 44 45 00 00       	push   $0x4544
     664:	ff 35 98 65 00 00    	pushl  0x6598
     66a:	e8 81 39 00 00       	call   3ff0 <printf>
    exit();
     66f:	e8 d9 37 00 00       	call   3e4d <exit>
    printf(stdout, "error: creat small failed!\n");
     674:	50                   	push   %eax
     675:	50                   	push   %eax
     676:	68 c0 44 00 00       	push   $0x44c0
     67b:	ff 35 98 65 00 00    	pushl  0x6598
     681:	e8 6a 39 00 00       	call   3ff0 <printf>
    exit();
     686:	e8 c2 37 00 00       	call   3e4d <exit>
     68b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     68f:	90                   	nop

00000690 <writetest1>:
{
     690:	f3 0f 1e fb          	endbr32 
     694:	55                   	push   %ebp
     695:	89 e5                	mov    %esp,%ebp
     697:	56                   	push   %esi
     698:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     699:	83 ec 08             	sub    $0x8,%esp
     69c:	68 6d 45 00 00       	push   $0x456d
     6a1:	ff 35 98 65 00 00    	pushl  0x6598
     6a7:	e8 44 39 00 00       	call   3ff0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     6ac:	58                   	pop    %eax
     6ad:	5a                   	pop    %edx
     6ae:	68 02 02 00 00       	push   $0x202
     6b3:	68 e7 45 00 00       	push   $0x45e7
     6b8:	e8 d0 37 00 00       	call   3e8d <open>
  if(fd < 0){
     6bd:	83 c4 10             	add    $0x10,%esp
     6c0:	85 c0                	test   %eax,%eax
     6c2:	0f 88 5d 01 00 00    	js     825 <writetest1+0x195>
     6c8:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     6ca:	31 db                	xor    %ebx,%ebx
     6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     6d0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     6d3:	89 1d 80 8d 00 00    	mov    %ebx,0x8d80
    if(write(fd, buf, 512) != 512){
     6d9:	68 00 02 00 00       	push   $0x200
     6de:	68 80 8d 00 00       	push   $0x8d80
     6e3:	56                   	push   %esi
     6e4:	e8 84 37 00 00       	call   3e6d <write>
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	3d 00 02 00 00       	cmp    $0x200,%eax
     6f1:	0f 85 b3 00 00 00    	jne    7aa <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     6f7:	83 c3 01             	add    $0x1,%ebx
     6fa:	81 fb 0c 01 00 00    	cmp    $0x10c,%ebx
     700:	75 ce                	jne    6d0 <writetest1+0x40>
  close(fd);
     702:	83 ec 0c             	sub    $0xc,%esp
     705:	56                   	push   %esi
     706:	e8 6a 37 00 00       	call   3e75 <close>
  fd = open("big", O_RDONLY);
     70b:	5b                   	pop    %ebx
     70c:	5e                   	pop    %esi
     70d:	6a 00                	push   $0x0
     70f:	68 e7 45 00 00       	push   $0x45e7
     714:	e8 74 37 00 00       	call   3e8d <open>
  if(fd < 0){
     719:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
     71c:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     71e:	85 c0                	test   %eax,%eax
     720:	0f 88 e8 00 00 00    	js     80e <writetest1+0x17e>
  n = 0;
     726:	31 f6                	xor    %esi,%esi
     728:	eb 1d                	jmp    747 <writetest1+0xb7>
     72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     730:	3d 00 02 00 00       	cmp    $0x200,%eax
     735:	0f 85 9f 00 00 00    	jne    7da <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     73b:	a1 80 8d 00 00       	mov    0x8d80,%eax
     740:	39 f0                	cmp    %esi,%eax
     742:	75 7f                	jne    7c3 <writetest1+0x133>
    n++;
     744:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
     747:	83 ec 04             	sub    $0x4,%esp
     74a:	68 00 02 00 00       	push   $0x200
     74f:	68 80 8d 00 00       	push   $0x8d80
     754:	53                   	push   %ebx
     755:	e8 0b 37 00 00       	call   3e65 <read>
    if(i == 0){
     75a:	83 c4 10             	add    $0x10,%esp
     75d:	85 c0                	test   %eax,%eax
     75f:	75 cf                	jne    730 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     761:	81 fe 0b 01 00 00    	cmp    $0x10b,%esi
     767:	0f 84 86 00 00 00    	je     7f3 <writetest1+0x163>
  close(fd);
     76d:	83 ec 0c             	sub    $0xc,%esp
     770:	53                   	push   %ebx
     771:	e8 ff 36 00 00       	call   3e75 <close>
  if(unlink("big") < 0){
     776:	c7 04 24 e7 45 00 00 	movl   $0x45e7,(%esp)
     77d:	e8 1b 37 00 00       	call   3e9d <unlink>
     782:	83 c4 10             	add    $0x10,%esp
     785:	85 c0                	test   %eax,%eax
     787:	0f 88 af 00 00 00    	js     83c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
     78d:	83 ec 08             	sub    $0x8,%esp
     790:	68 0e 46 00 00       	push   $0x460e
     795:	ff 35 98 65 00 00    	pushl  0x6598
     79b:	e8 50 38 00 00       	call   3ff0 <printf>
}
     7a0:	83 c4 10             	add    $0x10,%esp
     7a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     7a6:	5b                   	pop    %ebx
     7a7:	5e                   	pop    %esi
     7a8:	5d                   	pop    %ebp
     7a9:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	53                   	push   %ebx
     7ae:	68 97 45 00 00       	push   $0x4597
     7b3:	ff 35 98 65 00 00    	pushl  0x6598
     7b9:	e8 32 38 00 00       	call   3ff0 <printf>
      exit();
     7be:	e8 8a 36 00 00       	call   3e4d <exit>
      printf(stdout, "read content of block %d is %d\n",
     7c3:	50                   	push   %eax
     7c4:	56                   	push   %esi
     7c5:	68 e8 53 00 00       	push   $0x53e8
     7ca:	ff 35 98 65 00 00    	pushl  0x6598
     7d0:	e8 1b 38 00 00       	call   3ff0 <printf>
      exit();
     7d5:	e8 73 36 00 00       	call   3e4d <exit>
      printf(stdout, "read failed %d\n", i);
     7da:	83 ec 04             	sub    $0x4,%esp
     7dd:	50                   	push   %eax
     7de:	68 eb 45 00 00       	push   $0x45eb
     7e3:	ff 35 98 65 00 00    	pushl  0x6598
     7e9:	e8 02 38 00 00       	call   3ff0 <printf>
      exit();
     7ee:	e8 5a 36 00 00       	call   3e4d <exit>
        printf(stdout, "read only %d blocks from big", n);
     7f3:	52                   	push   %edx
     7f4:	68 0b 01 00 00       	push   $0x10b
     7f9:	68 ce 45 00 00       	push   $0x45ce
     7fe:	ff 35 98 65 00 00    	pushl  0x6598
     804:	e8 e7 37 00 00       	call   3ff0 <printf>
        exit();
     809:	e8 3f 36 00 00       	call   3e4d <exit>
    printf(stdout, "error: open big failed!\n");
     80e:	51                   	push   %ecx
     80f:	51                   	push   %ecx
     810:	68 b5 45 00 00       	push   $0x45b5
     815:	ff 35 98 65 00 00    	pushl  0x6598
     81b:	e8 d0 37 00 00       	call   3ff0 <printf>
    exit();
     820:	e8 28 36 00 00       	call   3e4d <exit>
    printf(stdout, "error: creat big failed!\n");
     825:	50                   	push   %eax
     826:	50                   	push   %eax
     827:	68 7d 45 00 00       	push   $0x457d
     82c:	ff 35 98 65 00 00    	pushl  0x6598
     832:	e8 b9 37 00 00       	call   3ff0 <printf>
    exit();
     837:	e8 11 36 00 00       	call   3e4d <exit>
    printf(stdout, "unlink big failed\n");
     83c:	50                   	push   %eax
     83d:	50                   	push   %eax
     83e:	68 fb 45 00 00       	push   $0x45fb
     843:	ff 35 98 65 00 00    	pushl  0x6598
     849:	e8 a2 37 00 00       	call   3ff0 <printf>
    exit();
     84e:	e8 fa 35 00 00       	call   3e4d <exit>
     853:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000860 <createtest>:
{
     860:	f3 0f 1e fb          	endbr32 
     864:	55                   	push   %ebp
     865:	89 e5                	mov    %esp,%ebp
     867:	53                   	push   %ebx
  name[2] = '\0';
     868:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     86d:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     870:	68 08 54 00 00       	push   $0x5408
     875:	ff 35 98 65 00 00    	pushl  0x6598
     87b:	e8 70 37 00 00       	call   3ff0 <printf>
  name[0] = 'a';
     880:	c6 05 80 ad 00 00 61 	movb   $0x61,0xad80
  name[2] = '\0';
     887:	83 c4 10             	add    $0x10,%esp
     88a:	c6 05 82 ad 00 00 00 	movb   $0x0,0xad82
  for(i = 0; i < 52; i++){
     891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open(name, O_CREATE|O_RDWR);
     898:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     89b:	88 1d 81 ad 00 00    	mov    %bl,0xad81
    fd = open(name, O_CREATE|O_RDWR);
     8a1:	83 c3 01             	add    $0x1,%ebx
     8a4:	68 02 02 00 00       	push   $0x202
     8a9:	68 80 ad 00 00       	push   $0xad80
     8ae:	e8 da 35 00 00       	call   3e8d <open>
    close(fd);
     8b3:	89 04 24             	mov    %eax,(%esp)
     8b6:	e8 ba 35 00 00       	call   3e75 <close>
  for(i = 0; i < 52; i++){
     8bb:	83 c4 10             	add    $0x10,%esp
     8be:	80 fb 64             	cmp    $0x64,%bl
     8c1:	75 d5                	jne    898 <createtest+0x38>
  name[0] = 'a';
     8c3:	c6 05 80 ad 00 00 61 	movb   $0x61,0xad80
  name[2] = '\0';
     8ca:	bb 30 00 00 00       	mov    $0x30,%ebx
     8cf:	c6 05 82 ad 00 00 00 	movb   $0x0,0xad82
  for(i = 0; i < 52; i++){
     8d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8dd:	8d 76 00             	lea    0x0(%esi),%esi
    unlink(name);
     8e0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     8e3:	88 1d 81 ad 00 00    	mov    %bl,0xad81
    unlink(name);
     8e9:	83 c3 01             	add    $0x1,%ebx
     8ec:	68 80 ad 00 00       	push   $0xad80
     8f1:	e8 a7 35 00 00       	call   3e9d <unlink>
  for(i = 0; i < 52; i++){
     8f6:	83 c4 10             	add    $0x10,%esp
     8f9:	80 fb 64             	cmp    $0x64,%bl
     8fc:	75 e2                	jne    8e0 <createtest+0x80>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8fe:	83 ec 08             	sub    $0x8,%esp
     901:	68 30 54 00 00       	push   $0x5430
     906:	ff 35 98 65 00 00    	pushl  0x6598
     90c:	e8 df 36 00 00       	call   3ff0 <printf>
}
     911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     914:	83 c4 10             	add    $0x10,%esp
     917:	c9                   	leave  
     918:	c3                   	ret    
     919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000920 <dirtest>:
{
     920:	f3 0f 1e fb          	endbr32 
     924:	55                   	push   %ebp
     925:	89 e5                	mov    %esp,%ebp
     927:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     92a:	68 1c 46 00 00       	push   $0x461c
     92f:	ff 35 98 65 00 00    	pushl  0x6598
     935:	e8 b6 36 00 00       	call   3ff0 <printf>
  if(mkdir("dir0") < 0){
     93a:	c7 04 24 28 46 00 00 	movl   $0x4628,(%esp)
     941:	e8 6f 35 00 00       	call   3eb5 <mkdir>
     946:	83 c4 10             	add    $0x10,%esp
     949:	85 c0                	test   %eax,%eax
     94b:	78 58                	js     9a5 <dirtest+0x85>
  if(chdir("dir0") < 0){
     94d:	83 ec 0c             	sub    $0xc,%esp
     950:	68 28 46 00 00       	push   $0x4628
     955:	e8 63 35 00 00       	call   3ebd <chdir>
     95a:	83 c4 10             	add    $0x10,%esp
     95d:	85 c0                	test   %eax,%eax
     95f:	0f 88 85 00 00 00    	js     9ea <dirtest+0xca>
  if(chdir("..") < 0){
     965:	83 ec 0c             	sub    $0xc,%esp
     968:	68 cd 4b 00 00       	push   $0x4bcd
     96d:	e8 4b 35 00 00       	call   3ebd <chdir>
     972:	83 c4 10             	add    $0x10,%esp
     975:	85 c0                	test   %eax,%eax
     977:	78 5a                	js     9d3 <dirtest+0xb3>
  if(unlink("dir0") < 0){
     979:	83 ec 0c             	sub    $0xc,%esp
     97c:	68 28 46 00 00       	push   $0x4628
     981:	e8 17 35 00 00       	call   3e9d <unlink>
     986:	83 c4 10             	add    $0x10,%esp
     989:	85 c0                	test   %eax,%eax
     98b:	78 2f                	js     9bc <dirtest+0x9c>
  printf(stdout, "mkdir test ok\n");
     98d:	83 ec 08             	sub    $0x8,%esp
     990:	68 65 46 00 00       	push   $0x4665
     995:	ff 35 98 65 00 00    	pushl  0x6598
     99b:	e8 50 36 00 00       	call   3ff0 <printf>
}
     9a0:	83 c4 10             	add    $0x10,%esp
     9a3:	c9                   	leave  
     9a4:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     9a5:	50                   	push   %eax
     9a6:	50                   	push   %eax
     9a7:	68 58 43 00 00       	push   $0x4358
     9ac:	ff 35 98 65 00 00    	pushl  0x6598
     9b2:	e8 39 36 00 00       	call   3ff0 <printf>
    exit();
     9b7:	e8 91 34 00 00       	call   3e4d <exit>
    printf(stdout, "unlink dir0 failed\n");
     9bc:	50                   	push   %eax
     9bd:	50                   	push   %eax
     9be:	68 51 46 00 00       	push   $0x4651
     9c3:	ff 35 98 65 00 00    	pushl  0x6598
     9c9:	e8 22 36 00 00       	call   3ff0 <printf>
    exit();
     9ce:	e8 7a 34 00 00       	call   3e4d <exit>
    printf(stdout, "chdir .. failed\n");
     9d3:	52                   	push   %edx
     9d4:	52                   	push   %edx
     9d5:	68 40 46 00 00       	push   $0x4640
     9da:	ff 35 98 65 00 00    	pushl  0x6598
     9e0:	e8 0b 36 00 00       	call   3ff0 <printf>
    exit();
     9e5:	e8 63 34 00 00       	call   3e4d <exit>
    printf(stdout, "chdir dir0 failed\n");
     9ea:	51                   	push   %ecx
     9eb:	51                   	push   %ecx
     9ec:	68 2d 46 00 00       	push   $0x462d
     9f1:	ff 35 98 65 00 00    	pushl  0x6598
     9f7:	e8 f4 35 00 00       	call   3ff0 <printf>
    exit();
     9fc:	e8 4c 34 00 00       	call   3e4d <exit>
     a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a0f:	90                   	nop

00000a10 <exectest>:
{
     a10:	f3 0f 1e fb          	endbr32 
     a14:	55                   	push   %ebp
     a15:	89 e5                	mov    %esp,%ebp
     a17:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     a1a:	68 74 46 00 00       	push   $0x4674
     a1f:	ff 35 98 65 00 00    	pushl  0x6598
     a25:	e8 c6 35 00 00       	call   3ff0 <printf>
  if(exec("echo", echoargv) < 0){
     a2a:	5a                   	pop    %edx
     a2b:	59                   	pop    %ecx
     a2c:	68 9c 65 00 00       	push   $0x659c
     a31:	68 3d 44 00 00       	push   $0x443d
     a36:	e8 4a 34 00 00       	call   3e85 <exec>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	78 02                	js     a44 <exectest+0x34>
}
     a42:	c9                   	leave  
     a43:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     a44:	50                   	push   %eax
     a45:	50                   	push   %eax
     a46:	68 7f 46 00 00       	push   $0x467f
     a4b:	ff 35 98 65 00 00    	pushl  0x6598
     a51:	e8 9a 35 00 00       	call   3ff0 <printf>
    exit();
     a56:	e8 f2 33 00 00       	call   3e4d <exit>
     a5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a5f:	90                   	nop

00000a60 <pipe1>:
{
     a60:	f3 0f 1e fb          	endbr32 
     a64:	55                   	push   %ebp
     a65:	89 e5                	mov    %esp,%ebp
     a67:	57                   	push   %edi
     a68:	56                   	push   %esi
  if(pipe(fds) != 0){
     a69:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a6c:	53                   	push   %ebx
     a6d:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a70:	50                   	push   %eax
     a71:	e8 e7 33 00 00       	call   3e5d <pipe>
     a76:	83 c4 10             	add    $0x10,%esp
     a79:	85 c0                	test   %eax,%eax
     a7b:	0f 85 38 01 00 00    	jne    bb9 <pipe1+0x159>
  pid = fork();
     a81:	e8 bf 33 00 00       	call   3e45 <fork>
  if(pid == 0){
     a86:	85 c0                	test   %eax,%eax
     a88:	0f 84 8d 00 00 00    	je     b1b <pipe1+0xbb>
  } else if(pid > 0){
     a8e:	0f 8e 38 01 00 00    	jle    bcc <pipe1+0x16c>
    close(fds[1]);
     a94:	83 ec 0c             	sub    $0xc,%esp
     a97:	ff 75 e4             	pushl  -0x1c(%ebp)
  seq = 0;
     a9a:	31 db                	xor    %ebx,%ebx
    cc = 1;
     a9c:	be 01 00 00 00       	mov    $0x1,%esi
    close(fds[1]);
     aa1:	e8 cf 33 00 00       	call   3e75 <close>
    total = 0;
     aa6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     aad:	83 c4 10             	add    $0x10,%esp
     ab0:	83 ec 04             	sub    $0x4,%esp
     ab3:	56                   	push   %esi
     ab4:	68 80 8d 00 00       	push   $0x8d80
     ab9:	ff 75 e0             	pushl  -0x20(%ebp)
     abc:	e8 a4 33 00 00       	call   3e65 <read>
     ac1:	83 c4 10             	add    $0x10,%esp
     ac4:	89 c7                	mov    %eax,%edi
     ac6:	85 c0                	test   %eax,%eax
     ac8:	0f 8e a7 00 00 00    	jle    b75 <pipe1+0x115>
     ace:	8d 0c 3b             	lea    (%ebx,%edi,1),%ecx
      for(i = 0; i < n; i++){
     ad1:	31 c0                	xor    %eax,%eax
     ad3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ad7:	90                   	nop
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ad8:	89 da                	mov    %ebx,%edx
     ada:	83 c3 01             	add    $0x1,%ebx
     add:	38 90 80 8d 00 00    	cmp    %dl,0x8d80(%eax)
     ae3:	75 1c                	jne    b01 <pipe1+0xa1>
      for(i = 0; i < n; i++){
     ae5:	83 c0 01             	add    $0x1,%eax
     ae8:	39 d9                	cmp    %ebx,%ecx
     aea:	75 ec                	jne    ad8 <pipe1+0x78>
      cc = cc * 2;
     aec:	01 f6                	add    %esi,%esi
      total += n;
     aee:	01 7d d4             	add    %edi,-0x2c(%ebp)
     af1:	b8 00 20 00 00       	mov    $0x2000,%eax
     af6:	81 fe 00 20 00 00    	cmp    $0x2000,%esi
     afc:	0f 4f f0             	cmovg  %eax,%esi
     aff:	eb af                	jmp    ab0 <pipe1+0x50>
          printf(1, "pipe1 oops 2\n");
     b01:	83 ec 08             	sub    $0x8,%esp
     b04:	68 ae 46 00 00       	push   $0x46ae
     b09:	6a 01                	push   $0x1
     b0b:	e8 e0 34 00 00       	call   3ff0 <printf>
          return;
     b10:	83 c4 10             	add    $0x10,%esp
}
     b13:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b16:	5b                   	pop    %ebx
     b17:	5e                   	pop    %esi
     b18:	5f                   	pop    %edi
     b19:	5d                   	pop    %ebp
     b1a:	c3                   	ret    
    close(fds[0]);
     b1b:	83 ec 0c             	sub    $0xc,%esp
     b1e:	ff 75 e0             	pushl  -0x20(%ebp)
  seq = 0;
     b21:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
     b23:	e8 4d 33 00 00       	call   3e75 <close>
     b28:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 1033; i++)
     b2b:	31 c0                	xor    %eax,%eax
     b2d:	8d 76 00             	lea    0x0(%esi),%esi
        buf[i] = seq++;
     b30:	8d 14 18             	lea    (%eax,%ebx,1),%edx
      for(i = 0; i < 1033; i++)
     b33:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     b36:	88 90 7f 8d 00 00    	mov    %dl,0x8d7f(%eax)
      for(i = 0; i < 1033; i++)
     b3c:	3d 09 04 00 00       	cmp    $0x409,%eax
     b41:	75 ed                	jne    b30 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     b43:	83 ec 04             	sub    $0x4,%esp
     b46:	81 c3 09 04 00 00    	add    $0x409,%ebx
     b4c:	68 09 04 00 00       	push   $0x409
     b51:	68 80 8d 00 00       	push   $0x8d80
     b56:	ff 75 e4             	pushl  -0x1c(%ebp)
     b59:	e8 0f 33 00 00       	call   3e6d <write>
     b5e:	83 c4 10             	add    $0x10,%esp
     b61:	3d 09 04 00 00       	cmp    $0x409,%eax
     b66:	75 77                	jne    bdf <pipe1+0x17f>
    for(n = 0; n < 5; n++){
     b68:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b6e:	75 bb                	jne    b2b <pipe1+0xcb>
    exit();
     b70:	e8 d8 32 00 00       	call   3e4d <exit>
    if(total != 5 * 1033){
     b75:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b7c:	75 26                	jne    ba4 <pipe1+0x144>
    close(fds[0]);
     b7e:	83 ec 0c             	sub    $0xc,%esp
     b81:	ff 75 e0             	pushl  -0x20(%ebp)
     b84:	e8 ec 32 00 00       	call   3e75 <close>
    wait();
     b89:	e8 c7 32 00 00       	call   3e55 <wait>
  printf(1, "pipe1 ok\n");
     b8e:	5a                   	pop    %edx
     b8f:	59                   	pop    %ecx
     b90:	68 d3 46 00 00       	push   $0x46d3
     b95:	6a 01                	push   $0x1
     b97:	e8 54 34 00 00       	call   3ff0 <printf>
     b9c:	83 c4 10             	add    $0x10,%esp
     b9f:	e9 6f ff ff ff       	jmp    b13 <pipe1+0xb3>
      printf(1, "pipe1 oops 3 total %d\n", total);
     ba4:	53                   	push   %ebx
     ba5:	ff 75 d4             	pushl  -0x2c(%ebp)
     ba8:	68 bc 46 00 00       	push   $0x46bc
     bad:	6a 01                	push   $0x1
     baf:	e8 3c 34 00 00       	call   3ff0 <printf>
      exit();
     bb4:	e8 94 32 00 00       	call   3e4d <exit>
    printf(1, "pipe() failed\n");
     bb9:	57                   	push   %edi
     bba:	57                   	push   %edi
     bbb:	68 91 46 00 00       	push   $0x4691
     bc0:	6a 01                	push   $0x1
     bc2:	e8 29 34 00 00       	call   3ff0 <printf>
    exit();
     bc7:	e8 81 32 00 00       	call   3e4d <exit>
    printf(1, "fork() failed\n");
     bcc:	50                   	push   %eax
     bcd:	50                   	push   %eax
     bce:	68 dd 46 00 00       	push   $0x46dd
     bd3:	6a 01                	push   $0x1
     bd5:	e8 16 34 00 00       	call   3ff0 <printf>
    exit();
     bda:	e8 6e 32 00 00       	call   3e4d <exit>
        printf(1, "pipe1 oops 1\n");
     bdf:	56                   	push   %esi
     be0:	56                   	push   %esi
     be1:	68 a0 46 00 00       	push   $0x46a0
     be6:	6a 01                	push   $0x1
     be8:	e8 03 34 00 00       	call   3ff0 <printf>
        exit();
     bed:	e8 5b 32 00 00       	call   3e4d <exit>
     bf2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c00 <preempt>:
{
     c00:	f3 0f 1e fb          	endbr32 
     c04:	55                   	push   %ebp
     c05:	89 e5                	mov    %esp,%ebp
     c07:	57                   	push   %edi
     c08:	56                   	push   %esi
     c09:	53                   	push   %ebx
     c0a:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     c0d:	68 ec 46 00 00       	push   $0x46ec
     c12:	6a 01                	push   $0x1
     c14:	e8 d7 33 00 00       	call   3ff0 <printf>
  pid1 = fork();
     c19:	e8 27 32 00 00       	call   3e45 <fork>
  if(pid1 == 0)
     c1e:	83 c4 10             	add    $0x10,%esp
     c21:	85 c0                	test   %eax,%eax
     c23:	75 0b                	jne    c30 <preempt+0x30>
    for(;;)
     c25:	eb fe                	jmp    c25 <preempt+0x25>
     c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c2e:	66 90                	xchg   %ax,%ax
     c30:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     c32:	e8 0e 32 00 00       	call   3e45 <fork>
     c37:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     c39:	85 c0                	test   %eax,%eax
     c3b:	75 03                	jne    c40 <preempt+0x40>
    for(;;)
     c3d:	eb fe                	jmp    c3d <preempt+0x3d>
     c3f:	90                   	nop
  pipe(pfds);
     c40:	83 ec 0c             	sub    $0xc,%esp
     c43:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c46:	50                   	push   %eax
     c47:	e8 11 32 00 00       	call   3e5d <pipe>
  pid3 = fork();
     c4c:	e8 f4 31 00 00       	call   3e45 <fork>
  if(pid3 == 0){
     c51:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     c54:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     c56:	85 c0                	test   %eax,%eax
     c58:	75 3e                	jne    c98 <preempt+0x98>
    close(pfds[0]);
     c5a:	83 ec 0c             	sub    $0xc,%esp
     c5d:	ff 75 e0             	pushl  -0x20(%ebp)
     c60:	e8 10 32 00 00       	call   3e75 <close>
    if(write(pfds[1], "x", 1) != 1)
     c65:	83 c4 0c             	add    $0xc,%esp
     c68:	6a 01                	push   $0x1
     c6a:	68 b1 4c 00 00       	push   $0x4cb1
     c6f:	ff 75 e4             	pushl  -0x1c(%ebp)
     c72:	e8 f6 31 00 00       	call   3e6d <write>
     c77:	83 c4 10             	add    $0x10,%esp
     c7a:	83 f8 01             	cmp    $0x1,%eax
     c7d:	0f 85 a4 00 00 00    	jne    d27 <preempt+0x127>
    close(pfds[1]);
     c83:	83 ec 0c             	sub    $0xc,%esp
     c86:	ff 75 e4             	pushl  -0x1c(%ebp)
     c89:	e8 e7 31 00 00       	call   3e75 <close>
     c8e:	83 c4 10             	add    $0x10,%esp
    for(;;)
     c91:	eb fe                	jmp    c91 <preempt+0x91>
     c93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c97:	90                   	nop
  close(pfds[1]);
     c98:	83 ec 0c             	sub    $0xc,%esp
     c9b:	ff 75 e4             	pushl  -0x1c(%ebp)
     c9e:	e8 d2 31 00 00       	call   3e75 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ca3:	83 c4 0c             	add    $0xc,%esp
     ca6:	68 00 20 00 00       	push   $0x2000
     cab:	68 80 8d 00 00       	push   $0x8d80
     cb0:	ff 75 e0             	pushl  -0x20(%ebp)
     cb3:	e8 ad 31 00 00       	call   3e65 <read>
     cb8:	83 c4 10             	add    $0x10,%esp
     cbb:	83 f8 01             	cmp    $0x1,%eax
     cbe:	75 7e                	jne    d3e <preempt+0x13e>
  close(pfds[0]);
     cc0:	83 ec 0c             	sub    $0xc,%esp
     cc3:	ff 75 e0             	pushl  -0x20(%ebp)
     cc6:	e8 aa 31 00 00       	call   3e75 <close>
  printf(1, "kill... ");
     ccb:	58                   	pop    %eax
     ccc:	5a                   	pop    %edx
     ccd:	68 1d 47 00 00       	push   $0x471d
     cd2:	6a 01                	push   $0x1
     cd4:	e8 17 33 00 00       	call   3ff0 <printf>
  kill(pid1);
     cd9:	89 3c 24             	mov    %edi,(%esp)
     cdc:	e8 9c 31 00 00       	call   3e7d <kill>
  kill(pid2);
     ce1:	89 34 24             	mov    %esi,(%esp)
     ce4:	e8 94 31 00 00       	call   3e7d <kill>
  kill(pid3);
     ce9:	89 1c 24             	mov    %ebx,(%esp)
     cec:	e8 8c 31 00 00       	call   3e7d <kill>
  printf(1, "wait... ");
     cf1:	59                   	pop    %ecx
     cf2:	5b                   	pop    %ebx
     cf3:	68 26 47 00 00       	push   $0x4726
     cf8:	6a 01                	push   $0x1
     cfa:	e8 f1 32 00 00       	call   3ff0 <printf>
  wait();
     cff:	e8 51 31 00 00       	call   3e55 <wait>
  wait();
     d04:	e8 4c 31 00 00       	call   3e55 <wait>
  wait();
     d09:	e8 47 31 00 00       	call   3e55 <wait>
  printf(1, "preempt ok\n");
     d0e:	5e                   	pop    %esi
     d0f:	5f                   	pop    %edi
     d10:	68 2f 47 00 00       	push   $0x472f
     d15:	6a 01                	push   $0x1
     d17:	e8 d4 32 00 00       	call   3ff0 <printf>
     d1c:	83 c4 10             	add    $0x10,%esp
}
     d1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d22:	5b                   	pop    %ebx
     d23:	5e                   	pop    %esi
     d24:	5f                   	pop    %edi
     d25:	5d                   	pop    %ebp
     d26:	c3                   	ret    
      printf(1, "preempt write error");
     d27:	83 ec 08             	sub    $0x8,%esp
     d2a:	68 f6 46 00 00       	push   $0x46f6
     d2f:	6a 01                	push   $0x1
     d31:	e8 ba 32 00 00       	call   3ff0 <printf>
     d36:	83 c4 10             	add    $0x10,%esp
     d39:	e9 45 ff ff ff       	jmp    c83 <preempt+0x83>
    printf(1, "preempt read error");
     d3e:	83 ec 08             	sub    $0x8,%esp
     d41:	68 0a 47 00 00       	push   $0x470a
     d46:	6a 01                	push   $0x1
     d48:	e8 a3 32 00 00       	call   3ff0 <printf>
    return;
     d4d:	83 c4 10             	add    $0x10,%esp
     d50:	eb cd                	jmp    d1f <preempt+0x11f>
     d52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d60 <exitwait>:
{
     d60:	f3 0f 1e fb          	endbr32 
     d64:	55                   	push   %ebp
     d65:	89 e5                	mov    %esp,%ebp
     d67:	56                   	push   %esi
     d68:	be 64 00 00 00       	mov    $0x64,%esi
     d6d:	53                   	push   %ebx
     d6e:	eb 10                	jmp    d80 <exitwait+0x20>
    if(pid){
     d70:	74 68                	je     dda <exitwait+0x7a>
      if(wait() != pid){
     d72:	e8 de 30 00 00       	call   3e55 <wait>
     d77:	39 d8                	cmp    %ebx,%eax
     d79:	75 2d                	jne    da8 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     d7b:	83 ee 01             	sub    $0x1,%esi
     d7e:	74 41                	je     dc1 <exitwait+0x61>
    pid = fork();
     d80:	e8 c0 30 00 00       	call   3e45 <fork>
     d85:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d87:	85 c0                	test   %eax,%eax
     d89:	79 e5                	jns    d70 <exitwait+0x10>
      printf(1, "fork failed\n");
     d8b:	83 ec 08             	sub    $0x8,%esp
     d8e:	68 99 52 00 00       	push   $0x5299
     d93:	6a 01                	push   $0x1
     d95:	e8 56 32 00 00       	call   3ff0 <printf>
      return;
     d9a:	83 c4 10             	add    $0x10,%esp
}
     d9d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     da0:	5b                   	pop    %ebx
     da1:	5e                   	pop    %esi
     da2:	5d                   	pop    %ebp
     da3:	c3                   	ret    
     da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     da8:	83 ec 08             	sub    $0x8,%esp
     dab:	68 3b 47 00 00       	push   $0x473b
     db0:	6a 01                	push   $0x1
     db2:	e8 39 32 00 00       	call   3ff0 <printf>
        return;
     db7:	83 c4 10             	add    $0x10,%esp
}
     dba:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dbd:	5b                   	pop    %ebx
     dbe:	5e                   	pop    %esi
     dbf:	5d                   	pop    %ebp
     dc0:	c3                   	ret    
  printf(1, "exitwait ok\n");
     dc1:	83 ec 08             	sub    $0x8,%esp
     dc4:	68 4b 47 00 00       	push   $0x474b
     dc9:	6a 01                	push   $0x1
     dcb:	e8 20 32 00 00       	call   3ff0 <printf>
     dd0:	83 c4 10             	add    $0x10,%esp
}
     dd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dd6:	5b                   	pop    %ebx
     dd7:	5e                   	pop    %esi
     dd8:	5d                   	pop    %ebp
     dd9:	c3                   	ret    
      exit();
     dda:	e8 6e 30 00 00       	call   3e4d <exit>
     ddf:	90                   	nop

00000de0 <mem>:
{
     de0:	f3 0f 1e fb          	endbr32 
     de4:	55                   	push   %ebp
     de5:	89 e5                	mov    %esp,%ebp
     de7:	56                   	push   %esi
     de8:	31 f6                	xor    %esi,%esi
     dea:	53                   	push   %ebx
  printf(1, "mem test\n");
     deb:	83 ec 08             	sub    $0x8,%esp
     dee:	68 58 47 00 00       	push   $0x4758
     df3:	6a 01                	push   $0x1
     df5:	e8 f6 31 00 00       	call   3ff0 <printf>
  ppid = getpid();
     dfa:	e8 ce 30 00 00       	call   3ecd <getpid>
     dff:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
     e01:	e8 3f 30 00 00       	call   3e45 <fork>
     e06:	83 c4 10             	add    $0x10,%esp
     e09:	85 c0                	test   %eax,%eax
     e0b:	74 0f                	je     e1c <mem+0x3c>
     e0d:	e9 8e 00 00 00       	jmp    ea0 <mem+0xc0>
     e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *(char**)m2 = m1;
     e18:	89 30                	mov    %esi,(%eax)
     e1a:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
     e1c:	83 ec 0c             	sub    $0xc,%esp
     e1f:	68 11 27 00 00       	push   $0x2711
     e24:	e8 27 34 00 00       	call   4250 <malloc>
     e29:	83 c4 10             	add    $0x10,%esp
     e2c:	85 c0                	test   %eax,%eax
     e2e:	75 e8                	jne    e18 <mem+0x38>
    while(m1){
     e30:	85 f6                	test   %esi,%esi
     e32:	74 18                	je     e4c <mem+0x6c>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     e38:	89 f0                	mov    %esi,%eax
      free(m1);
     e3a:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
     e3d:	8b 36                	mov    (%esi),%esi
      free(m1);
     e3f:	50                   	push   %eax
     e40:	e8 7b 33 00 00       	call   41c0 <free>
    while(m1){
     e45:	83 c4 10             	add    $0x10,%esp
     e48:	85 f6                	test   %esi,%esi
     e4a:	75 ec                	jne    e38 <mem+0x58>
    m1 = malloc(1024*20);
     e4c:	83 ec 0c             	sub    $0xc,%esp
     e4f:	68 00 50 00 00       	push   $0x5000
     e54:	e8 f7 33 00 00       	call   4250 <malloc>
    if(m1 == 0){
     e59:	83 c4 10             	add    $0x10,%esp
     e5c:	85 c0                	test   %eax,%eax
     e5e:	74 20                	je     e80 <mem+0xa0>
    free(m1);
     e60:	83 ec 0c             	sub    $0xc,%esp
     e63:	50                   	push   %eax
     e64:	e8 57 33 00 00       	call   41c0 <free>
    printf(1, "mem ok\n");
     e69:	58                   	pop    %eax
     e6a:	5a                   	pop    %edx
     e6b:	68 7c 47 00 00       	push   $0x477c
     e70:	6a 01                	push   $0x1
     e72:	e8 79 31 00 00       	call   3ff0 <printf>
    exit();
     e77:	e8 d1 2f 00 00       	call   3e4d <exit>
     e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e80:	83 ec 08             	sub    $0x8,%esp
     e83:	68 62 47 00 00       	push   $0x4762
     e88:	6a 01                	push   $0x1
     e8a:	e8 61 31 00 00       	call   3ff0 <printf>
      kill(ppid);
     e8f:	89 1c 24             	mov    %ebx,(%esp)
     e92:	e8 e6 2f 00 00       	call   3e7d <kill>
      exit();
     e97:	e8 b1 2f 00 00       	call   3e4d <exit>
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     ea0:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ea3:	5b                   	pop    %ebx
     ea4:	5e                   	pop    %esi
     ea5:	5d                   	pop    %ebp
    wait();
     ea6:	e9 aa 2f 00 00       	jmp    3e55 <wait>
     eab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eaf:	90                   	nop

00000eb0 <sharedfd>:
{
     eb0:	f3 0f 1e fb          	endbr32 
     eb4:	55                   	push   %ebp
     eb5:	89 e5                	mov    %esp,%ebp
     eb7:	57                   	push   %edi
     eb8:	56                   	push   %esi
     eb9:	53                   	push   %ebx
     eba:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     ebd:	68 84 47 00 00       	push   $0x4784
     ec2:	6a 01                	push   $0x1
     ec4:	e8 27 31 00 00       	call   3ff0 <printf>
  unlink("sharedfd");
     ec9:	c7 04 24 93 47 00 00 	movl   $0x4793,(%esp)
     ed0:	e8 c8 2f 00 00       	call   3e9d <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ed5:	5b                   	pop    %ebx
     ed6:	5e                   	pop    %esi
     ed7:	68 02 02 00 00       	push   $0x202
     edc:	68 93 47 00 00       	push   $0x4793
     ee1:	e8 a7 2f 00 00       	call   3e8d <open>
  if(fd < 0){
     ee6:	83 c4 10             	add    $0x10,%esp
     ee9:	85 c0                	test   %eax,%eax
     eeb:	0f 88 26 01 00 00    	js     1017 <sharedfd+0x167>
     ef1:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ef3:	8d 75 de             	lea    -0x22(%ebp),%esi
     ef6:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     efb:	e8 45 2f 00 00       	call   3e45 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f00:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     f03:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f06:	19 c0                	sbb    %eax,%eax
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	83 e0 f3             	and    $0xfffffff3,%eax
     f0e:	6a 0a                	push   $0xa
     f10:	83 c0 70             	add    $0x70,%eax
     f13:	50                   	push   %eax
     f14:	56                   	push   %esi
     f15:	e8 26 29 00 00       	call   3840 <memset>
     f1a:	83 c4 10             	add    $0x10,%esp
     f1d:	eb 06                	jmp    f25 <sharedfd+0x75>
     f1f:	90                   	nop
  for(i = 0; i < 1000; i++){
     f20:	83 eb 01             	sub    $0x1,%ebx
     f23:	74 26                	je     f4b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	6a 0a                	push   $0xa
     f2a:	56                   	push   %esi
     f2b:	57                   	push   %edi
     f2c:	e8 3c 2f 00 00       	call   3e6d <write>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	83 f8 0a             	cmp    $0xa,%eax
     f37:	74 e7                	je     f20 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     f39:	83 ec 08             	sub    $0x8,%esp
     f3c:	68 84 54 00 00       	push   $0x5484
     f41:	6a 01                	push   $0x1
     f43:	e8 a8 30 00 00       	call   3ff0 <printf>
      break;
     f48:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     f4b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     f4e:	85 c9                	test   %ecx,%ecx
     f50:	0f 84 f5 00 00 00    	je     104b <sharedfd+0x19b>
    wait();
     f56:	e8 fa 2e 00 00       	call   3e55 <wait>
  close(fd);
     f5b:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     f5e:	31 db                	xor    %ebx,%ebx
  close(fd);
     f60:	57                   	push   %edi
     f61:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f64:	e8 0c 2f 00 00       	call   3e75 <close>
  fd = open("sharedfd", 0);
     f69:	58                   	pop    %eax
     f6a:	5a                   	pop    %edx
     f6b:	6a 00                	push   $0x0
     f6d:	68 93 47 00 00       	push   $0x4793
     f72:	e8 16 2f 00 00       	call   3e8d <open>
  if(fd < 0){
     f77:	83 c4 10             	add    $0x10,%esp
  nc = np = 0;
     f7a:	31 d2                	xor    %edx,%edx
  fd = open("sharedfd", 0);
     f7c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f7f:	85 c0                	test   %eax,%eax
     f81:	0f 88 aa 00 00 00    	js     1031 <sharedfd+0x181>
     f87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f8e:	66 90                	xchg   %ax,%ax
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f96:	6a 0a                	push   $0xa
     f98:	56                   	push   %esi
     f99:	ff 75 d0             	pushl  -0x30(%ebp)
     f9c:	e8 c4 2e 00 00       	call   3e65 <read>
     fa1:	83 c4 10             	add    $0x10,%esp
     fa4:	85 c0                	test   %eax,%eax
     fa6:	7e 28                	jle    fd0 <sharedfd+0x120>
    for(i = 0; i < sizeof(buf); i++){
     fa8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fab:	89 f0                	mov    %esi,%eax
     fad:	eb 13                	jmp    fc2 <sharedfd+0x112>
     faf:	90                   	nop
        np++;
     fb0:	80 f9 70             	cmp    $0x70,%cl
     fb3:	0f 94 c1             	sete   %cl
     fb6:	0f b6 c9             	movzbl %cl,%ecx
     fb9:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
     fbb:	83 c0 01             	add    $0x1,%eax
     fbe:	39 c7                	cmp    %eax,%edi
     fc0:	74 ce                	je     f90 <sharedfd+0xe0>
      if(buf[i] == 'c')
     fc2:	0f b6 08             	movzbl (%eax),%ecx
     fc5:	80 f9 63             	cmp    $0x63,%cl
     fc8:	75 e6                	jne    fb0 <sharedfd+0x100>
        nc++;
     fca:	83 c2 01             	add    $0x1,%edx
      if(buf[i] == 'p')
     fcd:	eb ec                	jmp    fbb <sharedfd+0x10b>
     fcf:	90                   	nop
  close(fd);
     fd0:	83 ec 0c             	sub    $0xc,%esp
     fd3:	ff 75 d0             	pushl  -0x30(%ebp)
     fd6:	e8 9a 2e 00 00       	call   3e75 <close>
  unlink("sharedfd");
     fdb:	c7 04 24 93 47 00 00 	movl   $0x4793,(%esp)
     fe2:	e8 b6 2e 00 00       	call   3e9d <unlink>
  if(nc == 10000 && np == 10000){
     fe7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fea:	83 c4 10             	add    $0x10,%esp
     fed:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     ff3:	75 5b                	jne    1050 <sharedfd+0x1a0>
     ff5:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     ffb:	75 53                	jne    1050 <sharedfd+0x1a0>
    printf(1, "sharedfd ok\n");
     ffd:	83 ec 08             	sub    $0x8,%esp
    1000:	68 9c 47 00 00       	push   $0x479c
    1005:	6a 01                	push   $0x1
    1007:	e8 e4 2f 00 00       	call   3ff0 <printf>
    100c:	83 c4 10             	add    $0x10,%esp
}
    100f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1012:	5b                   	pop    %ebx
    1013:	5e                   	pop    %esi
    1014:	5f                   	pop    %edi
    1015:	5d                   	pop    %ebp
    1016:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
    1017:	83 ec 08             	sub    $0x8,%esp
    101a:	68 58 54 00 00       	push   $0x5458
    101f:	6a 01                	push   $0x1
    1021:	e8 ca 2f 00 00       	call   3ff0 <printf>
    return;
    1026:	83 c4 10             	add    $0x10,%esp
}
    1029:	8d 65 f4             	lea    -0xc(%ebp),%esp
    102c:	5b                   	pop    %ebx
    102d:	5e                   	pop    %esi
    102e:	5f                   	pop    %edi
    102f:	5d                   	pop    %ebp
    1030:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1031:	83 ec 08             	sub    $0x8,%esp
    1034:	68 a4 54 00 00       	push   $0x54a4
    1039:	6a 01                	push   $0x1
    103b:	e8 b0 2f 00 00       	call   3ff0 <printf>
    return;
    1040:	83 c4 10             	add    $0x10,%esp
}
    1043:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1046:	5b                   	pop    %ebx
    1047:	5e                   	pop    %esi
    1048:	5f                   	pop    %edi
    1049:	5d                   	pop    %ebp
    104a:	c3                   	ret    
    exit();
    104b:	e8 fd 2d 00 00       	call   3e4d <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1050:	53                   	push   %ebx
    1051:	52                   	push   %edx
    1052:	68 a9 47 00 00       	push   $0x47a9
    1057:	6a 01                	push   $0x1
    1059:	e8 92 2f 00 00       	call   3ff0 <printf>
    exit();
    105e:	e8 ea 2d 00 00       	call   3e4d <exit>
    1063:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001070 <fourfiles>:
{
    1070:	f3 0f 1e fb          	endbr32 
    1074:	55                   	push   %ebp
    1075:	89 e5                	mov    %esp,%ebp
    1077:	57                   	push   %edi
    1078:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    1079:	be be 47 00 00       	mov    $0x47be,%esi
{
    107e:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    107f:	31 db                	xor    %ebx,%ebx
{
    1081:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1084:	c7 45 d8 be 47 00 00 	movl   $0x47be,-0x28(%ebp)
  printf(1, "fourfiles test\n");
    108b:	68 c4 47 00 00       	push   $0x47c4
    1090:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    1092:	c7 45 dc 07 49 00 00 	movl   $0x4907,-0x24(%ebp)
    1099:	c7 45 e0 0b 49 00 00 	movl   $0x490b,-0x20(%ebp)
    10a0:	c7 45 e4 c1 47 00 00 	movl   $0x47c1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    10a7:	e8 44 2f 00 00       	call   3ff0 <printf>
    10ac:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    10af:	83 ec 0c             	sub    $0xc,%esp
    10b2:	56                   	push   %esi
    10b3:	e8 e5 2d 00 00       	call   3e9d <unlink>
    pid = fork();
    10b8:	e8 88 2d 00 00       	call   3e45 <fork>
    if(pid < 0){
    10bd:	83 c4 10             	add    $0x10,%esp
    10c0:	85 c0                	test   %eax,%eax
    10c2:	0f 88 60 01 00 00    	js     1228 <fourfiles+0x1b8>
    if(pid == 0){
    10c8:	0f 84 e5 00 00 00    	je     11b3 <fourfiles+0x143>
  for(pi = 0; pi < 4; pi++){
    10ce:	83 c3 01             	add    $0x1,%ebx
    10d1:	83 fb 04             	cmp    $0x4,%ebx
    10d4:	74 06                	je     10dc <fourfiles+0x6c>
    10d6:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    10da:	eb d3                	jmp    10af <fourfiles+0x3f>
    wait();
    10dc:	e8 74 2d 00 00       	call   3e55 <wait>
  for(i = 0; i < 2; i++){
    10e1:	31 f6                	xor    %esi,%esi
    wait();
    10e3:	e8 6d 2d 00 00       	call   3e55 <wait>
    10e8:	e8 68 2d 00 00       	call   3e55 <wait>
    10ed:	e8 63 2d 00 00       	call   3e55 <wait>
    fname = names[i];
    10f2:	8b 44 b5 d8          	mov    -0x28(%ebp,%esi,4),%eax
    fd = open(fname, 0);
    10f6:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10f9:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    10fb:	6a 00                	push   $0x0
    10fd:	50                   	push   %eax
    fname = names[i];
    10fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
    1101:	e8 87 2d 00 00       	call   3e8d <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1106:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    1109:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1110:	83 ec 04             	sub    $0x4,%esp
    1113:	68 00 20 00 00       	push   $0x2000
    1118:	68 80 8d 00 00       	push   $0x8d80
    111d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1120:	e8 40 2d 00 00       	call   3e65 <read>
    1125:	83 c4 10             	add    $0x10,%esp
    1128:	85 c0                	test   %eax,%eax
    112a:	7e 22                	jle    114e <fourfiles+0xde>
      for(j = 0; j < n; j++){
    112c:	31 d2                	xor    %edx,%edx
    112e:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    1130:	83 fe 01             	cmp    $0x1,%esi
    1133:	0f be ba 80 8d 00 00 	movsbl 0x8d80(%edx),%edi
    113a:	19 c9                	sbb    %ecx,%ecx
    113c:	83 c1 31             	add    $0x31,%ecx
    113f:	39 cf                	cmp    %ecx,%edi
    1141:	75 5c                	jne    119f <fourfiles+0x12f>
      for(j = 0; j < n; j++){
    1143:	83 c2 01             	add    $0x1,%edx
    1146:	39 d0                	cmp    %edx,%eax
    1148:	75 e6                	jne    1130 <fourfiles+0xc0>
      total += n;
    114a:	01 c3                	add    %eax,%ebx
    114c:	eb c2                	jmp    1110 <fourfiles+0xa0>
    close(fd);
    114e:	83 ec 0c             	sub    $0xc,%esp
    1151:	ff 75 d4             	pushl  -0x2c(%ebp)
    1154:	e8 1c 2d 00 00       	call   3e75 <close>
    if(total != 12*500){
    1159:	83 c4 10             	add    $0x10,%esp
    115c:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1162:	0f 85 d4 00 00 00    	jne    123c <fourfiles+0x1cc>
    unlink(fname);
    1168:	83 ec 0c             	sub    $0xc,%esp
    116b:	ff 75 d0             	pushl  -0x30(%ebp)
    116e:	e8 2a 2d 00 00       	call   3e9d <unlink>
  for(i = 0; i < 2; i++){
    1173:	83 c4 10             	add    $0x10,%esp
    1176:	83 fe 01             	cmp    $0x1,%esi
    1179:	75 1a                	jne    1195 <fourfiles+0x125>
  printf(1, "fourfiles ok\n");
    117b:	83 ec 08             	sub    $0x8,%esp
    117e:	68 02 48 00 00       	push   $0x4802
    1183:	6a 01                	push   $0x1
    1185:	e8 66 2e 00 00       	call   3ff0 <printf>
}
    118a:	83 c4 10             	add    $0x10,%esp
    118d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1190:	5b                   	pop    %ebx
    1191:	5e                   	pop    %esi
    1192:	5f                   	pop    %edi
    1193:	5d                   	pop    %ebp
    1194:	c3                   	ret    
    1195:	be 01 00 00 00       	mov    $0x1,%esi
    119a:	e9 53 ff ff ff       	jmp    10f2 <fourfiles+0x82>
          printf(1, "wrong char\n");
    119f:	83 ec 08             	sub    $0x8,%esp
    11a2:	68 e5 47 00 00       	push   $0x47e5
    11a7:	6a 01                	push   $0x1
    11a9:	e8 42 2e 00 00       	call   3ff0 <printf>
          exit();
    11ae:	e8 9a 2c 00 00       	call   3e4d <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    11b3:	83 ec 08             	sub    $0x8,%esp
    11b6:	68 02 02 00 00       	push   $0x202
    11bb:	56                   	push   %esi
    11bc:	e8 cc 2c 00 00       	call   3e8d <open>
      if(fd < 0){
    11c1:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
    11c4:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    11c6:	85 c0                	test   %eax,%eax
    11c8:	78 45                	js     120f <fourfiles+0x19f>
      memset(buf, '0'+pi, 512);
    11ca:	83 ec 04             	sub    $0x4,%esp
    11cd:	83 c3 30             	add    $0x30,%ebx
    11d0:	68 00 02 00 00       	push   $0x200
    11d5:	53                   	push   %ebx
    11d6:	bb 0c 00 00 00       	mov    $0xc,%ebx
    11db:	68 80 8d 00 00       	push   $0x8d80
    11e0:	e8 5b 26 00 00       	call   3840 <memset>
    11e5:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    11e8:	83 ec 04             	sub    $0x4,%esp
    11eb:	68 f4 01 00 00       	push   $0x1f4
    11f0:	68 80 8d 00 00       	push   $0x8d80
    11f5:	56                   	push   %esi
    11f6:	e8 72 2c 00 00       	call   3e6d <write>
    11fb:	83 c4 10             	add    $0x10,%esp
    11fe:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1203:	75 4a                	jne    124f <fourfiles+0x1df>
      for(i = 0; i < 12; i++){
    1205:	83 eb 01             	sub    $0x1,%ebx
    1208:	75 de                	jne    11e8 <fourfiles+0x178>
      exit();
    120a:	e8 3e 2c 00 00       	call   3e4d <exit>
        printf(1, "create failed\n");
    120f:	51                   	push   %ecx
    1210:	51                   	push   %ecx
    1211:	68 5f 4a 00 00       	push   $0x4a5f
    1216:	6a 01                	push   $0x1
    1218:	e8 d3 2d 00 00       	call   3ff0 <printf>
        exit();
    121d:	e8 2b 2c 00 00       	call   3e4d <exit>
    1222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "fork failed\n");
    1228:	83 ec 08             	sub    $0x8,%esp
    122b:	68 99 52 00 00       	push   $0x5299
    1230:	6a 01                	push   $0x1
    1232:	e8 b9 2d 00 00       	call   3ff0 <printf>
      exit();
    1237:	e8 11 2c 00 00       	call   3e4d <exit>
      printf(1, "wrong length %d\n", total);
    123c:	50                   	push   %eax
    123d:	53                   	push   %ebx
    123e:	68 f1 47 00 00       	push   $0x47f1
    1243:	6a 01                	push   $0x1
    1245:	e8 a6 2d 00 00       	call   3ff0 <printf>
      exit();
    124a:	e8 fe 2b 00 00       	call   3e4d <exit>
          printf(1, "write failed %d\n", n);
    124f:	52                   	push   %edx
    1250:	50                   	push   %eax
    1251:	68 d4 47 00 00       	push   $0x47d4
    1256:	6a 01                	push   $0x1
    1258:	e8 93 2d 00 00       	call   3ff0 <printf>
          exit();
    125d:	e8 eb 2b 00 00       	call   3e4d <exit>
    1262:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001270 <createdelete>:
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	57                   	push   %edi
    1278:	56                   	push   %esi
    1279:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    127a:	31 db                	xor    %ebx,%ebx
{
    127c:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    127f:	68 10 48 00 00       	push   $0x4810
    1284:	6a 01                	push   $0x1
    1286:	e8 65 2d 00 00       	call   3ff0 <printf>
    128b:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    128e:	e8 b2 2b 00 00       	call   3e45 <fork>
    if(pid < 0){
    1293:	85 c0                	test   %eax,%eax
    1295:	0f 88 ce 01 00 00    	js     1469 <createdelete+0x1f9>
    if(pid == 0){
    129b:	0f 84 17 01 00 00    	je     13b8 <createdelete+0x148>
  for(pi = 0; pi < 4; pi++){
    12a1:	83 c3 01             	add    $0x1,%ebx
    12a4:	83 fb 04             	cmp    $0x4,%ebx
    12a7:	75 e5                	jne    128e <createdelete+0x1e>
    wait();
    12a9:	e8 a7 2b 00 00       	call   3e55 <wait>
    12ae:	8d 7d c8             	lea    -0x38(%ebp),%edi
  name[0] = name[1] = name[2] = 0;
    12b1:	be ff ff ff ff       	mov    $0xffffffff,%esi
    wait();
    12b6:	e8 9a 2b 00 00       	call   3e55 <wait>
    12bb:	e8 95 2b 00 00       	call   3e55 <wait>
    12c0:	e8 90 2b 00 00       	call   3e55 <wait>
  name[0] = name[1] = name[2] = 0;
    12c5:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    12c9:	89 7d c0             	mov    %edi,-0x40(%ebp)
    12cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(pi = 0; pi < 4; pi++){
    12d0:	8d 46 31             	lea    0x31(%esi),%eax
    12d3:	89 f7                	mov    %esi,%edi
    12d5:	83 c6 01             	add    $0x1,%esi
    12d8:	83 fe 09             	cmp    $0x9,%esi
    12db:	88 45 c7             	mov    %al,-0x39(%ebp)
    12de:	0f 9f c3             	setg   %bl
    12e1:	85 f6                	test   %esi,%esi
    12e3:	0f 94 c0             	sete   %al
    12e6:	09 c3                	or     %eax,%ebx
    12e8:	88 5d c6             	mov    %bl,-0x3a(%ebp)
      name[2] = '\0';
    12eb:	bb 70 00 00 00       	mov    $0x70,%ebx
      fd = open(name, 0);
    12f0:	83 ec 08             	sub    $0x8,%esp
      name[1] = '0' + i;
    12f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      name[0] = 'p' + pi;
    12f7:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    12fa:	6a 00                	push   $0x0
    12fc:	ff 75 c0             	pushl  -0x40(%ebp)
      name[1] = '0' + i;
    12ff:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1302:	e8 86 2b 00 00       	call   3e8d <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1307:	83 c4 10             	add    $0x10,%esp
    130a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    130e:	0f 84 8c 00 00 00    	je     13a0 <createdelete+0x130>
    1314:	85 c0                	test   %eax,%eax
    1316:	0f 88 21 01 00 00    	js     143d <createdelete+0x1cd>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    131c:	83 ff 08             	cmp    $0x8,%edi
    131f:	0f 86 60 01 00 00    	jbe    1485 <createdelete+0x215>
        close(fd);
    1325:	83 ec 0c             	sub    $0xc,%esp
    1328:	50                   	push   %eax
    1329:	e8 47 2b 00 00       	call   3e75 <close>
    132e:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    1331:	83 c3 01             	add    $0x1,%ebx
    1334:	80 fb 74             	cmp    $0x74,%bl
    1337:	75 b7                	jne    12f0 <createdelete+0x80>
  for(i = 0; i < N; i++){
    1339:	83 fe 13             	cmp    $0x13,%esi
    133c:	75 92                	jne    12d0 <createdelete+0x60>
    133e:	8b 7d c0             	mov    -0x40(%ebp),%edi
    1341:	be 70 00 00 00       	mov    $0x70,%esi
    1346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    for(pi = 0; pi < 4; pi++){
    1350:	8d 46 c0             	lea    -0x40(%esi),%eax
  name[0] = name[1] = name[2] = 0;
    1353:	bb 04 00 00 00       	mov    $0x4,%ebx
    1358:	88 45 c7             	mov    %al,-0x39(%ebp)
      unlink(name);
    135b:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    135e:	89 f0                	mov    %esi,%eax
      unlink(name);
    1360:	57                   	push   %edi
      name[0] = 'p' + i;
    1361:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1364:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    1368:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    136b:	e8 2d 2b 00 00       	call   3e9d <unlink>
    for(pi = 0; pi < 4; pi++){
    1370:	83 c4 10             	add    $0x10,%esp
    1373:	83 eb 01             	sub    $0x1,%ebx
    1376:	75 e3                	jne    135b <createdelete+0xeb>
  for(i = 0; i < N; i++){
    1378:	83 c6 01             	add    $0x1,%esi
    137b:	89 f0                	mov    %esi,%eax
    137d:	3c 84                	cmp    $0x84,%al
    137f:	75 cf                	jne    1350 <createdelete+0xe0>
  printf(1, "createdelete ok\n");
    1381:	83 ec 08             	sub    $0x8,%esp
    1384:	68 23 48 00 00       	push   $0x4823
    1389:	6a 01                	push   $0x1
    138b:	e8 60 2c 00 00       	call   3ff0 <printf>
}
    1390:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1393:	5b                   	pop    %ebx
    1394:	5e                   	pop    %esi
    1395:	5f                   	pop    %edi
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    
    1398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    139f:	90                   	nop
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13a0:	83 ff 08             	cmp    $0x8,%edi
    13a3:	0f 86 d4 00 00 00    	jbe    147d <createdelete+0x20d>
      if(fd >= 0)
    13a9:	85 c0                	test   %eax,%eax
    13ab:	78 84                	js     1331 <createdelete+0xc1>
    13ad:	e9 73 ff ff ff       	jmp    1325 <createdelete+0xb5>
    13b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    13b8:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    13bb:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13bf:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    13c2:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    13c5:	31 db                	xor    %ebx,%ebx
    13c7:	eb 0f                	jmp    13d8 <createdelete+0x168>
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    13d0:	83 fb 13             	cmp    $0x13,%ebx
    13d3:	74 63                	je     1438 <createdelete+0x1c8>
    13d5:	83 c3 01             	add    $0x1,%ebx
        fd = open(name, O_CREATE | O_RDWR);
    13d8:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    13db:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    13de:	68 02 02 00 00       	push   $0x202
    13e3:	57                   	push   %edi
        name[1] = '0' + i;
    13e4:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    13e7:	e8 a1 2a 00 00       	call   3e8d <open>
        if(fd < 0){
    13ec:	83 c4 10             	add    $0x10,%esp
    13ef:	85 c0                	test   %eax,%eax
    13f1:	78 62                	js     1455 <createdelete+0x1e5>
        close(fd);
    13f3:	83 ec 0c             	sub    $0xc,%esp
    13f6:	50                   	push   %eax
    13f7:	e8 79 2a 00 00       	call   3e75 <close>
        if(i > 0 && (i % 2 ) == 0){
    13fc:	83 c4 10             	add    $0x10,%esp
    13ff:	85 db                	test   %ebx,%ebx
    1401:	74 d2                	je     13d5 <createdelete+0x165>
    1403:	f6 c3 01             	test   $0x1,%bl
    1406:	75 c8                	jne    13d0 <createdelete+0x160>
          if(unlink(name) < 0){
    1408:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    140b:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    140d:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    140e:	d1 f8                	sar    %eax
    1410:	83 c0 30             	add    $0x30,%eax
    1413:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1416:	e8 82 2a 00 00       	call   3e9d <unlink>
    141b:	83 c4 10             	add    $0x10,%esp
    141e:	85 c0                	test   %eax,%eax
    1420:	79 ae                	jns    13d0 <createdelete+0x160>
            printf(1, "unlink failed\n");
    1422:	52                   	push   %edx
    1423:	52                   	push   %edx
    1424:	68 11 44 00 00       	push   $0x4411
    1429:	6a 01                	push   $0x1
    142b:	e8 c0 2b 00 00       	call   3ff0 <printf>
            exit();
    1430:	e8 18 2a 00 00       	call   3e4d <exit>
    1435:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    1438:	e8 10 2a 00 00       	call   3e4d <exit>
    143d:	8b 7d c0             	mov    -0x40(%ebp),%edi
        printf(1, "oops createdelete %s didn't exist\n", name);
    1440:	83 ec 04             	sub    $0x4,%esp
    1443:	57                   	push   %edi
    1444:	68 d0 54 00 00       	push   $0x54d0
    1449:	6a 01                	push   $0x1
    144b:	e8 a0 2b 00 00       	call   3ff0 <printf>
        exit();
    1450:	e8 f8 29 00 00       	call   3e4d <exit>
          printf(1, "create failed\n");
    1455:	83 ec 08             	sub    $0x8,%esp
    1458:	68 5f 4a 00 00       	push   $0x4a5f
    145d:	6a 01                	push   $0x1
    145f:	e8 8c 2b 00 00       	call   3ff0 <printf>
          exit();
    1464:	e8 e4 29 00 00       	call   3e4d <exit>
      printf(1, "fork failed\n");
    1469:	83 ec 08             	sub    $0x8,%esp
    146c:	68 99 52 00 00       	push   $0x5299
    1471:	6a 01                	push   $0x1
    1473:	e8 78 2b 00 00       	call   3ff0 <printf>
      exit();
    1478:	e8 d0 29 00 00       	call   3e4d <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    147d:	85 c0                	test   %eax,%eax
    147f:	0f 88 ac fe ff ff    	js     1331 <createdelete+0xc1>
    1485:	8b 7d c0             	mov    -0x40(%ebp),%edi
        printf(1, "oops createdelete %s did exist\n", name);
    1488:	50                   	push   %eax
    1489:	57                   	push   %edi
    148a:	68 f4 54 00 00       	push   $0x54f4
    148f:	6a 01                	push   $0x1
    1491:	e8 5a 2b 00 00       	call   3ff0 <printf>
        exit();
    1496:	e8 b2 29 00 00       	call   3e4d <exit>
    149b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop

000014a0 <unlinkread>:
{
    14a0:	f3 0f 1e fb          	endbr32 
    14a4:	55                   	push   %ebp
    14a5:	89 e5                	mov    %esp,%ebp
    14a7:	56                   	push   %esi
    14a8:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    14a9:	83 ec 08             	sub    $0x8,%esp
    14ac:	68 34 48 00 00       	push   $0x4834
    14b1:	6a 01                	push   $0x1
    14b3:	e8 38 2b 00 00       	call   3ff0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    14b8:	5b                   	pop    %ebx
    14b9:	5e                   	pop    %esi
    14ba:	68 02 02 00 00       	push   $0x202
    14bf:	68 45 48 00 00       	push   $0x4845
    14c4:	e8 c4 29 00 00       	call   3e8d <open>
  if(fd < 0){
    14c9:	83 c4 10             	add    $0x10,%esp
    14cc:	85 c0                	test   %eax,%eax
    14ce:	0f 88 e6 00 00 00    	js     15ba <unlinkread+0x11a>
  write(fd, "hello", 5);
    14d4:	83 ec 04             	sub    $0x4,%esp
    14d7:	89 c3                	mov    %eax,%ebx
    14d9:	6a 05                	push   $0x5
    14db:	68 6a 48 00 00       	push   $0x486a
    14e0:	50                   	push   %eax
    14e1:	e8 87 29 00 00       	call   3e6d <write>
  close(fd);
    14e6:	89 1c 24             	mov    %ebx,(%esp)
    14e9:	e8 87 29 00 00       	call   3e75 <close>
  fd = open("unlinkread", O_RDWR);
    14ee:	58                   	pop    %eax
    14ef:	5a                   	pop    %edx
    14f0:	6a 02                	push   $0x2
    14f2:	68 45 48 00 00       	push   $0x4845
    14f7:	e8 91 29 00 00       	call   3e8d <open>
  if(fd < 0){
    14fc:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    14ff:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1501:	85 c0                	test   %eax,%eax
    1503:	0f 88 10 01 00 00    	js     1619 <unlinkread+0x179>
  if(unlink("unlinkread") != 0){
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	68 45 48 00 00       	push   $0x4845
    1511:	e8 87 29 00 00       	call   3e9d <unlink>
    1516:	83 c4 10             	add    $0x10,%esp
    1519:	85 c0                	test   %eax,%eax
    151b:	0f 85 e5 00 00 00    	jne    1606 <unlinkread+0x166>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1521:	83 ec 08             	sub    $0x8,%esp
    1524:	68 02 02 00 00       	push   $0x202
    1529:	68 45 48 00 00       	push   $0x4845
    152e:	e8 5a 29 00 00       	call   3e8d <open>
  write(fd1, "yyy", 3);
    1533:	83 c4 0c             	add    $0xc,%esp
    1536:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1538:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    153a:	68 a2 48 00 00       	push   $0x48a2
    153f:	50                   	push   %eax
    1540:	e8 28 29 00 00       	call   3e6d <write>
  close(fd1);
    1545:	89 34 24             	mov    %esi,(%esp)
    1548:	e8 28 29 00 00       	call   3e75 <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    154d:	83 c4 0c             	add    $0xc,%esp
    1550:	68 00 20 00 00       	push   $0x2000
    1555:	68 80 8d 00 00       	push   $0x8d80
    155a:	53                   	push   %ebx
    155b:	e8 05 29 00 00       	call   3e65 <read>
    1560:	83 c4 10             	add    $0x10,%esp
    1563:	83 f8 05             	cmp    $0x5,%eax
    1566:	0f 85 87 00 00 00    	jne    15f3 <unlinkread+0x153>
  if(buf[0] != 'h'){
    156c:	80 3d 80 8d 00 00 68 	cmpb   $0x68,0x8d80
    1573:	75 6b                	jne    15e0 <unlinkread+0x140>
  if(write(fd, buf, 10) != 10){
    1575:	83 ec 04             	sub    $0x4,%esp
    1578:	6a 0a                	push   $0xa
    157a:	68 80 8d 00 00       	push   $0x8d80
    157f:	53                   	push   %ebx
    1580:	e8 e8 28 00 00       	call   3e6d <write>
    1585:	83 c4 10             	add    $0x10,%esp
    1588:	83 f8 0a             	cmp    $0xa,%eax
    158b:	75 40                	jne    15cd <unlinkread+0x12d>
  close(fd);
    158d:	83 ec 0c             	sub    $0xc,%esp
    1590:	53                   	push   %ebx
    1591:	e8 df 28 00 00       	call   3e75 <close>
  unlink("unlinkread");
    1596:	c7 04 24 45 48 00 00 	movl   $0x4845,(%esp)
    159d:	e8 fb 28 00 00       	call   3e9d <unlink>
  printf(1, "unlinkread ok\n");
    15a2:	58                   	pop    %eax
    15a3:	5a                   	pop    %edx
    15a4:	68 ed 48 00 00       	push   $0x48ed
    15a9:	6a 01                	push   $0x1
    15ab:	e8 40 2a 00 00       	call   3ff0 <printf>
}
    15b0:	83 c4 10             	add    $0x10,%esp
    15b3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15b6:	5b                   	pop    %ebx
    15b7:	5e                   	pop    %esi
    15b8:	5d                   	pop    %ebp
    15b9:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    15ba:	51                   	push   %ecx
    15bb:	51                   	push   %ecx
    15bc:	68 50 48 00 00       	push   $0x4850
    15c1:	6a 01                	push   $0x1
    15c3:	e8 28 2a 00 00       	call   3ff0 <printf>
    exit();
    15c8:	e8 80 28 00 00       	call   3e4d <exit>
    printf(1, "unlinkread write failed\n");
    15cd:	51                   	push   %ecx
    15ce:	51                   	push   %ecx
    15cf:	68 d4 48 00 00       	push   $0x48d4
    15d4:	6a 01                	push   $0x1
    15d6:	e8 15 2a 00 00       	call   3ff0 <printf>
    exit();
    15db:	e8 6d 28 00 00       	call   3e4d <exit>
    printf(1, "unlinkread wrong data\n");
    15e0:	53                   	push   %ebx
    15e1:	53                   	push   %ebx
    15e2:	68 bd 48 00 00       	push   $0x48bd
    15e7:	6a 01                	push   $0x1
    15e9:	e8 02 2a 00 00       	call   3ff0 <printf>
    exit();
    15ee:	e8 5a 28 00 00       	call   3e4d <exit>
    printf(1, "unlinkread read failed");
    15f3:	56                   	push   %esi
    15f4:	56                   	push   %esi
    15f5:	68 a6 48 00 00       	push   $0x48a6
    15fa:	6a 01                	push   $0x1
    15fc:	e8 ef 29 00 00       	call   3ff0 <printf>
    exit();
    1601:	e8 47 28 00 00       	call   3e4d <exit>
    printf(1, "unlink unlinkread failed\n");
    1606:	50                   	push   %eax
    1607:	50                   	push   %eax
    1608:	68 88 48 00 00       	push   $0x4888
    160d:	6a 01                	push   $0x1
    160f:	e8 dc 29 00 00       	call   3ff0 <printf>
    exit();
    1614:	e8 34 28 00 00       	call   3e4d <exit>
    printf(1, "open unlinkread failed\n");
    1619:	50                   	push   %eax
    161a:	50                   	push   %eax
    161b:	68 70 48 00 00       	push   $0x4870
    1620:	6a 01                	push   $0x1
    1622:	e8 c9 29 00 00       	call   3ff0 <printf>
    exit();
    1627:	e8 21 28 00 00       	call   3e4d <exit>
    162c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001630 <linktest>:
{
    1630:	f3 0f 1e fb          	endbr32 
    1634:	55                   	push   %ebp
    1635:	89 e5                	mov    %esp,%ebp
    1637:	53                   	push   %ebx
    1638:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    163b:	68 fc 48 00 00       	push   $0x48fc
    1640:	6a 01                	push   $0x1
    1642:	e8 a9 29 00 00       	call   3ff0 <printf>
  unlink("lf1");
    1647:	c7 04 24 06 49 00 00 	movl   $0x4906,(%esp)
    164e:	e8 4a 28 00 00       	call   3e9d <unlink>
  unlink("lf2");
    1653:	c7 04 24 0a 49 00 00 	movl   $0x490a,(%esp)
    165a:	e8 3e 28 00 00       	call   3e9d <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    165f:	58                   	pop    %eax
    1660:	5a                   	pop    %edx
    1661:	68 02 02 00 00       	push   $0x202
    1666:	68 06 49 00 00       	push   $0x4906
    166b:	e8 1d 28 00 00       	call   3e8d <open>
  if(fd < 0){
    1670:	83 c4 10             	add    $0x10,%esp
    1673:	85 c0                	test   %eax,%eax
    1675:	0f 88 1e 01 00 00    	js     1799 <linktest+0x169>
  if(write(fd, "hello", 5) != 5){
    167b:	83 ec 04             	sub    $0x4,%esp
    167e:	89 c3                	mov    %eax,%ebx
    1680:	6a 05                	push   $0x5
    1682:	68 6a 48 00 00       	push   $0x486a
    1687:	50                   	push   %eax
    1688:	e8 e0 27 00 00       	call   3e6d <write>
    168d:	83 c4 10             	add    $0x10,%esp
    1690:	83 f8 05             	cmp    $0x5,%eax
    1693:	0f 85 98 01 00 00    	jne    1831 <linktest+0x201>
  close(fd);
    1699:	83 ec 0c             	sub    $0xc,%esp
    169c:	53                   	push   %ebx
    169d:	e8 d3 27 00 00       	call   3e75 <close>
  if(link("lf1", "lf2") < 0){
    16a2:	5b                   	pop    %ebx
    16a3:	58                   	pop    %eax
    16a4:	68 0a 49 00 00       	push   $0x490a
    16a9:	68 06 49 00 00       	push   $0x4906
    16ae:	e8 fa 27 00 00       	call   3ead <link>
    16b3:	83 c4 10             	add    $0x10,%esp
    16b6:	85 c0                	test   %eax,%eax
    16b8:	0f 88 60 01 00 00    	js     181e <linktest+0x1ee>
  unlink("lf1");
    16be:	83 ec 0c             	sub    $0xc,%esp
    16c1:	68 06 49 00 00       	push   $0x4906
    16c6:	e8 d2 27 00 00       	call   3e9d <unlink>
  if(open("lf1", 0) >= 0){
    16cb:	58                   	pop    %eax
    16cc:	5a                   	pop    %edx
    16cd:	6a 00                	push   $0x0
    16cf:	68 06 49 00 00       	push   $0x4906
    16d4:	e8 b4 27 00 00       	call   3e8d <open>
    16d9:	83 c4 10             	add    $0x10,%esp
    16dc:	85 c0                	test   %eax,%eax
    16de:	0f 89 27 01 00 00    	jns    180b <linktest+0x1db>
  fd = open("lf2", 0);
    16e4:	83 ec 08             	sub    $0x8,%esp
    16e7:	6a 00                	push   $0x0
    16e9:	68 0a 49 00 00       	push   $0x490a
    16ee:	e8 9a 27 00 00       	call   3e8d <open>
  if(fd < 0){
    16f3:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    16f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16f8:	85 c0                	test   %eax,%eax
    16fa:	0f 88 f8 00 00 00    	js     17f8 <linktest+0x1c8>
  if(read(fd, buf, sizeof(buf)) != 5){
    1700:	83 ec 04             	sub    $0x4,%esp
    1703:	68 00 20 00 00       	push   $0x2000
    1708:	68 80 8d 00 00       	push   $0x8d80
    170d:	50                   	push   %eax
    170e:	e8 52 27 00 00       	call   3e65 <read>
    1713:	83 c4 10             	add    $0x10,%esp
    1716:	83 f8 05             	cmp    $0x5,%eax
    1719:	0f 85 c6 00 00 00    	jne    17e5 <linktest+0x1b5>
  close(fd);
    171f:	83 ec 0c             	sub    $0xc,%esp
    1722:	53                   	push   %ebx
    1723:	e8 4d 27 00 00       	call   3e75 <close>
  if(link("lf2", "lf2") >= 0){
    1728:	58                   	pop    %eax
    1729:	5a                   	pop    %edx
    172a:	68 0a 49 00 00       	push   $0x490a
    172f:	68 0a 49 00 00       	push   $0x490a
    1734:	e8 74 27 00 00       	call   3ead <link>
    1739:	83 c4 10             	add    $0x10,%esp
    173c:	85 c0                	test   %eax,%eax
    173e:	0f 89 8e 00 00 00    	jns    17d2 <linktest+0x1a2>
  unlink("lf2");
    1744:	83 ec 0c             	sub    $0xc,%esp
    1747:	68 0a 49 00 00       	push   $0x490a
    174c:	e8 4c 27 00 00       	call   3e9d <unlink>
  if(link("lf2", "lf1") >= 0){
    1751:	59                   	pop    %ecx
    1752:	5b                   	pop    %ebx
    1753:	68 06 49 00 00       	push   $0x4906
    1758:	68 0a 49 00 00       	push   $0x490a
    175d:	e8 4b 27 00 00       	call   3ead <link>
    1762:	83 c4 10             	add    $0x10,%esp
    1765:	85 c0                	test   %eax,%eax
    1767:	79 56                	jns    17bf <linktest+0x18f>
  if(link(".", "lf1") >= 0){
    1769:	83 ec 08             	sub    $0x8,%esp
    176c:	68 06 49 00 00       	push   $0x4906
    1771:	68 ce 4b 00 00       	push   $0x4bce
    1776:	e8 32 27 00 00       	call   3ead <link>
    177b:	83 c4 10             	add    $0x10,%esp
    177e:	85 c0                	test   %eax,%eax
    1780:	79 2a                	jns    17ac <linktest+0x17c>
  printf(1, "linktest ok\n");
    1782:	83 ec 08             	sub    $0x8,%esp
    1785:	68 a4 49 00 00       	push   $0x49a4
    178a:	6a 01                	push   $0x1
    178c:	e8 5f 28 00 00       	call   3ff0 <printf>
}
    1791:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1794:	83 c4 10             	add    $0x10,%esp
    1797:	c9                   	leave  
    1798:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1799:	50                   	push   %eax
    179a:	50                   	push   %eax
    179b:	68 0e 49 00 00       	push   $0x490e
    17a0:	6a 01                	push   $0x1
    17a2:	e8 49 28 00 00       	call   3ff0 <printf>
    exit();
    17a7:	e8 a1 26 00 00       	call   3e4d <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    17ac:	50                   	push   %eax
    17ad:	50                   	push   %eax
    17ae:	68 88 49 00 00       	push   $0x4988
    17b3:	6a 01                	push   $0x1
    17b5:	e8 36 28 00 00       	call   3ff0 <printf>
    exit();
    17ba:	e8 8e 26 00 00       	call   3e4d <exit>
    printf(1, "link non-existant succeeded! oops\n");
    17bf:	52                   	push   %edx
    17c0:	52                   	push   %edx
    17c1:	68 3c 55 00 00       	push   $0x553c
    17c6:	6a 01                	push   $0x1
    17c8:	e8 23 28 00 00       	call   3ff0 <printf>
    exit();
    17cd:	e8 7b 26 00 00       	call   3e4d <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    17d2:	50                   	push   %eax
    17d3:	50                   	push   %eax
    17d4:	68 6a 49 00 00       	push   $0x496a
    17d9:	6a 01                	push   $0x1
    17db:	e8 10 28 00 00       	call   3ff0 <printf>
    exit();
    17e0:	e8 68 26 00 00       	call   3e4d <exit>
    printf(1, "read lf2 failed\n");
    17e5:	51                   	push   %ecx
    17e6:	51                   	push   %ecx
    17e7:	68 59 49 00 00       	push   $0x4959
    17ec:	6a 01                	push   $0x1
    17ee:	e8 fd 27 00 00       	call   3ff0 <printf>
    exit();
    17f3:	e8 55 26 00 00       	call   3e4d <exit>
    printf(1, "open lf2 failed\n");
    17f8:	53                   	push   %ebx
    17f9:	53                   	push   %ebx
    17fa:	68 48 49 00 00       	push   $0x4948
    17ff:	6a 01                	push   $0x1
    1801:	e8 ea 27 00 00       	call   3ff0 <printf>
    exit();
    1806:	e8 42 26 00 00       	call   3e4d <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    180b:	50                   	push   %eax
    180c:	50                   	push   %eax
    180d:	68 14 55 00 00       	push   $0x5514
    1812:	6a 01                	push   $0x1
    1814:	e8 d7 27 00 00       	call   3ff0 <printf>
    exit();
    1819:	e8 2f 26 00 00       	call   3e4d <exit>
    printf(1, "link lf1 lf2 failed\n");
    181e:	51                   	push   %ecx
    181f:	51                   	push   %ecx
    1820:	68 33 49 00 00       	push   $0x4933
    1825:	6a 01                	push   $0x1
    1827:	e8 c4 27 00 00       	call   3ff0 <printf>
    exit();
    182c:	e8 1c 26 00 00       	call   3e4d <exit>
    printf(1, "write lf1 failed\n");
    1831:	50                   	push   %eax
    1832:	50                   	push   %eax
    1833:	68 21 49 00 00       	push   $0x4921
    1838:	6a 01                	push   $0x1
    183a:	e8 b1 27 00 00       	call   3ff0 <printf>
    exit();
    183f:	e8 09 26 00 00       	call   3e4d <exit>
    1844:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    184b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    184f:	90                   	nop

00001850 <concreate>:
{
    1850:	f3 0f 1e fb          	endbr32 
    1854:	55                   	push   %ebp
    1855:	89 e5                	mov    %esp,%ebp
    1857:	57                   	push   %edi
    1858:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    1859:	31 f6                	xor    %esi,%esi
{
    185b:	53                   	push   %ebx
    185c:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    185f:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1862:	68 b1 49 00 00       	push   $0x49b1
    1867:	6a 01                	push   $0x1
    1869:	e8 82 27 00 00       	call   3ff0 <printf>
  file[0] = 'C';
    186e:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1872:	83 c4 10             	add    $0x10,%esp
    1875:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    1879:	eb 48                	jmp    18c3 <concreate+0x73>
    187b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    187f:	90                   	nop
    1880:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    if(pid && (i % 3) == 1){
    1886:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    188b:	0f 83 af 00 00 00    	jae    1940 <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    1891:	83 ec 08             	sub    $0x8,%esp
    1894:	68 02 02 00 00       	push   $0x202
    1899:	53                   	push   %ebx
    189a:	e8 ee 25 00 00       	call   3e8d <open>
      if(fd < 0){
    189f:	83 c4 10             	add    $0x10,%esp
    18a2:	85 c0                	test   %eax,%eax
    18a4:	78 5f                	js     1905 <concreate+0xb5>
      close(fd);
    18a6:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    18a9:	83 c6 01             	add    $0x1,%esi
      close(fd);
    18ac:	50                   	push   %eax
    18ad:	e8 c3 25 00 00       	call   3e75 <close>
    18b2:	83 c4 10             	add    $0x10,%esp
      wait();
    18b5:	e8 9b 25 00 00       	call   3e55 <wait>
  for(i = 0; i < 40; i++){
    18ba:	83 fe 28             	cmp    $0x28,%esi
    18bd:	0f 84 9f 00 00 00    	je     1962 <concreate+0x112>
    unlink(file);
    18c3:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    18c6:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    18c9:	53                   	push   %ebx
    file[1] = '0' + i;
    18ca:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    18cd:	e8 cb 25 00 00       	call   3e9d <unlink>
    pid = fork();
    18d2:	e8 6e 25 00 00       	call   3e45 <fork>
    if(pid && (i % 3) == 1){
    18d7:	83 c4 10             	add    $0x10,%esp
    18da:	85 c0                	test   %eax,%eax
    18dc:	75 a2                	jne    1880 <concreate+0x30>
      link("C0", file);
    18de:	69 f6 cd cc cc cc    	imul   $0xcccccccd,%esi,%esi
    } else if(pid == 0 && (i % 5) == 1){
    18e4:	81 fe cd cc cc cc    	cmp    $0xcccccccd,%esi
    18ea:	73 34                	jae    1920 <concreate+0xd0>
      fd = open(file, O_CREATE | O_RDWR);
    18ec:	83 ec 08             	sub    $0x8,%esp
    18ef:	68 02 02 00 00       	push   $0x202
    18f4:	53                   	push   %ebx
    18f5:	e8 93 25 00 00       	call   3e8d <open>
      if(fd < 0){
    18fa:	83 c4 10             	add    $0x10,%esp
    18fd:	85 c0                	test   %eax,%eax
    18ff:	0f 89 39 02 00 00    	jns    1b3e <concreate+0x2ee>
        printf(1, "concreate create %s failed\n", file);
    1905:	83 ec 04             	sub    $0x4,%esp
    1908:	53                   	push   %ebx
    1909:	68 c4 49 00 00       	push   $0x49c4
    190e:	6a 01                	push   $0x1
    1910:	e8 db 26 00 00       	call   3ff0 <printf>
        exit();
    1915:	e8 33 25 00 00       	call   3e4d <exit>
    191a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("C0", file);
    1920:	83 ec 08             	sub    $0x8,%esp
    1923:	53                   	push   %ebx
    1924:	68 c1 49 00 00       	push   $0x49c1
    1929:	e8 7f 25 00 00       	call   3ead <link>
    192e:	83 c4 10             	add    $0x10,%esp
      exit();
    1931:	e8 17 25 00 00       	call   3e4d <exit>
    1936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193d:	8d 76 00             	lea    0x0(%esi),%esi
      link("C0", file);
    1940:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1943:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1946:	53                   	push   %ebx
    1947:	68 c1 49 00 00       	push   $0x49c1
    194c:	e8 5c 25 00 00       	call   3ead <link>
    1951:	83 c4 10             	add    $0x10,%esp
      wait();
    1954:	e8 fc 24 00 00       	call   3e55 <wait>
  for(i = 0; i < 40; i++){
    1959:	83 fe 28             	cmp    $0x28,%esi
    195c:	0f 85 61 ff ff ff    	jne    18c3 <concreate+0x73>
  memset(fa, 0, sizeof(fa));
    1962:	83 ec 04             	sub    $0x4,%esp
    1965:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1968:	6a 28                	push   $0x28
    196a:	6a 00                	push   $0x0
    196c:	50                   	push   %eax
    196d:	e8 ce 1e 00 00       	call   3840 <memset>
  fd = open(".", 0);
    1972:	5e                   	pop    %esi
    1973:	5f                   	pop    %edi
    1974:	6a 00                	push   $0x0
    1976:	68 ce 4b 00 00       	push   $0x4bce
    197b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    197e:	e8 0a 25 00 00       	call   3e8d <open>
  n = 0;
    1983:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    198a:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    198d:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    198f:	90                   	nop
    1990:	83 ec 04             	sub    $0x4,%esp
    1993:	6a 10                	push   $0x10
    1995:	57                   	push   %edi
    1996:	56                   	push   %esi
    1997:	e8 c9 24 00 00       	call   3e65 <read>
    199c:	83 c4 10             	add    $0x10,%esp
    199f:	85 c0                	test   %eax,%eax
    19a1:	7e 3d                	jle    19e0 <concreate+0x190>
    if(de.inum == 0)
    19a3:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    19a8:	74 e6                	je     1990 <concreate+0x140>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    19aa:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    19ae:	75 e0                	jne    1990 <concreate+0x140>
    19b0:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    19b4:	75 da                	jne    1990 <concreate+0x140>
      i = de.name[1] - '0';
    19b6:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    19ba:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    19bd:	83 f8 27             	cmp    $0x27,%eax
    19c0:	0f 87 60 01 00 00    	ja     1b26 <concreate+0x2d6>
      if(fa[i]){
    19c6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    19cb:	0f 85 3d 01 00 00    	jne    1b0e <concreate+0x2be>
      n++;
    19d1:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    19d5:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    19da:	eb b4                	jmp    1990 <concreate+0x140>
    19dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	56                   	push   %esi
    19e4:	e8 8c 24 00 00       	call   3e75 <close>
  if(n != 40){
    19e9:	83 c4 10             	add    $0x10,%esp
    19ec:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    19f0:	0f 85 05 01 00 00    	jne    1afb <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    19f6:	31 f6                	xor    %esi,%esi
    19f8:	eb 4c                	jmp    1a46 <concreate+0x1f6>
    19fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    1a00:	85 ff                	test   %edi,%edi
    1a02:	74 05                	je     1a09 <concreate+0x1b9>
    1a04:	83 f8 01             	cmp    $0x1,%eax
    1a07:	74 6c                	je     1a75 <concreate+0x225>
      unlink(file);
    1a09:	83 ec 0c             	sub    $0xc,%esp
    1a0c:	53                   	push   %ebx
    1a0d:	e8 8b 24 00 00       	call   3e9d <unlink>
      unlink(file);
    1a12:	89 1c 24             	mov    %ebx,(%esp)
    1a15:	e8 83 24 00 00       	call   3e9d <unlink>
      unlink(file);
    1a1a:	89 1c 24             	mov    %ebx,(%esp)
    1a1d:	e8 7b 24 00 00       	call   3e9d <unlink>
      unlink(file);
    1a22:	89 1c 24             	mov    %ebx,(%esp)
    1a25:	e8 73 24 00 00       	call   3e9d <unlink>
    1a2a:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1a2d:	85 ff                	test   %edi,%edi
    1a2f:	0f 84 fc fe ff ff    	je     1931 <concreate+0xe1>
      wait();
    1a35:	e8 1b 24 00 00       	call   3e55 <wait>
  for(i = 0; i < 40; i++){
    1a3a:	83 c6 01             	add    $0x1,%esi
    1a3d:	83 fe 28             	cmp    $0x28,%esi
    1a40:	0f 84 8a 00 00 00    	je     1ad0 <concreate+0x280>
    file[1] = '0' + i;
    1a46:	8d 46 30             	lea    0x30(%esi),%eax
    1a49:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1a4c:	e8 f4 23 00 00       	call   3e45 <fork>
    1a51:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a53:	85 c0                	test   %eax,%eax
    1a55:	0f 88 8c 00 00 00    	js     1ae7 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    1a5b:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1a60:	f7 e6                	mul    %esi
    1a62:	89 d0                	mov    %edx,%eax
    1a64:	83 e2 fe             	and    $0xfffffffe,%edx
    1a67:	d1 e8                	shr    %eax
    1a69:	01 c2                	add    %eax,%edx
    1a6b:	89 f0                	mov    %esi,%eax
    1a6d:	29 d0                	sub    %edx,%eax
    1a6f:	89 c1                	mov    %eax,%ecx
    1a71:	09 f9                	or     %edi,%ecx
    1a73:	75 8b                	jne    1a00 <concreate+0x1b0>
      close(open(file, 0));
    1a75:	83 ec 08             	sub    $0x8,%esp
    1a78:	6a 00                	push   $0x0
    1a7a:	53                   	push   %ebx
    1a7b:	e8 0d 24 00 00       	call   3e8d <open>
    1a80:	89 04 24             	mov    %eax,(%esp)
    1a83:	e8 ed 23 00 00       	call   3e75 <close>
      close(open(file, 0));
    1a88:	58                   	pop    %eax
    1a89:	5a                   	pop    %edx
    1a8a:	6a 00                	push   $0x0
    1a8c:	53                   	push   %ebx
    1a8d:	e8 fb 23 00 00       	call   3e8d <open>
    1a92:	89 04 24             	mov    %eax,(%esp)
    1a95:	e8 db 23 00 00       	call   3e75 <close>
      close(open(file, 0));
    1a9a:	59                   	pop    %ecx
    1a9b:	58                   	pop    %eax
    1a9c:	6a 00                	push   $0x0
    1a9e:	53                   	push   %ebx
    1a9f:	e8 e9 23 00 00       	call   3e8d <open>
    1aa4:	89 04 24             	mov    %eax,(%esp)
    1aa7:	e8 c9 23 00 00       	call   3e75 <close>
      close(open(file, 0));
    1aac:	58                   	pop    %eax
    1aad:	5a                   	pop    %edx
    1aae:	6a 00                	push   $0x0
    1ab0:	53                   	push   %ebx
    1ab1:	e8 d7 23 00 00       	call   3e8d <open>
    1ab6:	89 04 24             	mov    %eax,(%esp)
    1ab9:	e8 b7 23 00 00       	call   3e75 <close>
    1abe:	83 c4 10             	add    $0x10,%esp
    1ac1:	e9 67 ff ff ff       	jmp    1a2d <concreate+0x1dd>
    1ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1acd:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "concreate ok\n");
    1ad0:	83 ec 08             	sub    $0x8,%esp
    1ad3:	68 16 4a 00 00       	push   $0x4a16
    1ad8:	6a 01                	push   $0x1
    1ada:	e8 11 25 00 00       	call   3ff0 <printf>
}
    1adf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ae2:	5b                   	pop    %ebx
    1ae3:	5e                   	pop    %esi
    1ae4:	5f                   	pop    %edi
    1ae5:	5d                   	pop    %ebp
    1ae6:	c3                   	ret    
      printf(1, "fork failed\n");
    1ae7:	83 ec 08             	sub    $0x8,%esp
    1aea:	68 99 52 00 00       	push   $0x5299
    1aef:	6a 01                	push   $0x1
    1af1:	e8 fa 24 00 00       	call   3ff0 <printf>
      exit();
    1af6:	e8 52 23 00 00       	call   3e4d <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1afb:	51                   	push   %ecx
    1afc:	51                   	push   %ecx
    1afd:	68 60 55 00 00       	push   $0x5560
    1b02:	6a 01                	push   $0x1
    1b04:	e8 e7 24 00 00       	call   3ff0 <printf>
    exit();
    1b09:	e8 3f 23 00 00       	call   3e4d <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1b0e:	83 ec 04             	sub    $0x4,%esp
    1b11:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1b14:	50                   	push   %eax
    1b15:	68 f9 49 00 00       	push   $0x49f9
    1b1a:	6a 01                	push   $0x1
    1b1c:	e8 cf 24 00 00       	call   3ff0 <printf>
        exit();
    1b21:	e8 27 23 00 00       	call   3e4d <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1b26:	83 ec 04             	sub    $0x4,%esp
    1b29:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1b2c:	50                   	push   %eax
    1b2d:	68 e0 49 00 00       	push   $0x49e0
    1b32:	6a 01                	push   $0x1
    1b34:	e8 b7 24 00 00       	call   3ff0 <printf>
        exit();
    1b39:	e8 0f 23 00 00       	call   3e4d <exit>
      close(fd);
    1b3e:	83 ec 0c             	sub    $0xc,%esp
    1b41:	50                   	push   %eax
    1b42:	e8 2e 23 00 00       	call   3e75 <close>
    1b47:	83 c4 10             	add    $0x10,%esp
    1b4a:	e9 e2 fd ff ff       	jmp    1931 <concreate+0xe1>
    1b4f:	90                   	nop

00001b50 <linkunlink>:
{
    1b50:	f3 0f 1e fb          	endbr32 
    1b54:	55                   	push   %ebp
    1b55:	89 e5                	mov    %esp,%ebp
    1b57:	57                   	push   %edi
    1b58:	56                   	push   %esi
    1b59:	53                   	push   %ebx
    1b5a:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1b5d:	68 24 4a 00 00       	push   $0x4a24
    1b62:	6a 01                	push   $0x1
    1b64:	e8 87 24 00 00       	call   3ff0 <printf>
  unlink("x");
    1b69:	c7 04 24 b1 4c 00 00 	movl   $0x4cb1,(%esp)
    1b70:	e8 28 23 00 00       	call   3e9d <unlink>
  pid = fork();
    1b75:	e8 cb 22 00 00       	call   3e45 <fork>
  if(pid < 0){
    1b7a:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1b7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b80:	85 c0                	test   %eax,%eax
    1b82:	0f 88 b2 00 00 00    	js     1c3a <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1b88:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b8c:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b91:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b96:	19 ff                	sbb    %edi,%edi
    1b98:	83 e7 60             	and    $0x60,%edi
    1b9b:	83 c7 01             	add    $0x1,%edi
    1b9e:	eb 1a                	jmp    1bba <linkunlink+0x6a>
    } else if((x % 3) == 1){
    1ba0:	83 f8 01             	cmp    $0x1,%eax
    1ba3:	74 7b                	je     1c20 <linkunlink+0xd0>
      unlink("x");
    1ba5:	83 ec 0c             	sub    $0xc,%esp
    1ba8:	68 b1 4c 00 00       	push   $0x4cb1
    1bad:	e8 eb 22 00 00       	call   3e9d <unlink>
    1bb2:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1bb5:	83 eb 01             	sub    $0x1,%ebx
    1bb8:	74 41                	je     1bfb <linkunlink+0xab>
    x = x * 1103515245 + 12345;
    1bba:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1bc0:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1bc6:	89 f8                	mov    %edi,%eax
    1bc8:	f7 e6                	mul    %esi
    1bca:	89 d0                	mov    %edx,%eax
    1bcc:	83 e2 fe             	and    $0xfffffffe,%edx
    1bcf:	d1 e8                	shr    %eax
    1bd1:	01 c2                	add    %eax,%edx
    1bd3:	89 f8                	mov    %edi,%eax
    1bd5:	29 d0                	sub    %edx,%eax
    1bd7:	75 c7                	jne    1ba0 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1bd9:	83 ec 08             	sub    $0x8,%esp
    1bdc:	68 02 02 00 00       	push   $0x202
    1be1:	68 b1 4c 00 00       	push   $0x4cb1
    1be6:	e8 a2 22 00 00       	call   3e8d <open>
    1beb:	89 04 24             	mov    %eax,(%esp)
    1bee:	e8 82 22 00 00       	call   3e75 <close>
    1bf3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1bf6:	83 eb 01             	sub    $0x1,%ebx
    1bf9:	75 bf                	jne    1bba <linkunlink+0x6a>
  if(pid)
    1bfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bfe:	85 c0                	test   %eax,%eax
    1c00:	74 4b                	je     1c4d <linkunlink+0xfd>
    wait();
    1c02:	e8 4e 22 00 00       	call   3e55 <wait>
  printf(1, "linkunlink ok\n");
    1c07:	83 ec 08             	sub    $0x8,%esp
    1c0a:	68 39 4a 00 00       	push   $0x4a39
    1c0f:	6a 01                	push   $0x1
    1c11:	e8 da 23 00 00       	call   3ff0 <printf>
}
    1c16:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c19:	5b                   	pop    %ebx
    1c1a:	5e                   	pop    %esi
    1c1b:	5f                   	pop    %edi
    1c1c:	5d                   	pop    %ebp
    1c1d:	c3                   	ret    
    1c1e:	66 90                	xchg   %ax,%ax
      link("cat", "x");
    1c20:	83 ec 08             	sub    $0x8,%esp
    1c23:	68 b1 4c 00 00       	push   $0x4cb1
    1c28:	68 35 4a 00 00       	push   $0x4a35
    1c2d:	e8 7b 22 00 00       	call   3ead <link>
    1c32:	83 c4 10             	add    $0x10,%esp
    1c35:	e9 7b ff ff ff       	jmp    1bb5 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1c3a:	52                   	push   %edx
    1c3b:	52                   	push   %edx
    1c3c:	68 99 52 00 00       	push   $0x5299
    1c41:	6a 01                	push   $0x1
    1c43:	e8 a8 23 00 00       	call   3ff0 <printf>
    exit();
    1c48:	e8 00 22 00 00       	call   3e4d <exit>
    exit();
    1c4d:	e8 fb 21 00 00       	call   3e4d <exit>
    1c52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001c60 <bigdir>:
{
    1c60:	f3 0f 1e fb          	endbr32 
    1c64:	55                   	push   %ebp
    1c65:	89 e5                	mov    %esp,%ebp
    1c67:	57                   	push   %edi
    1c68:	56                   	push   %esi
    1c69:	53                   	push   %ebx
    1c6a:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1c6d:	68 48 4a 00 00       	push   $0x4a48
    1c72:	6a 01                	push   $0x1
    1c74:	e8 77 23 00 00       	call   3ff0 <printf>
  unlink("bd");
    1c79:	c7 04 24 55 4a 00 00 	movl   $0x4a55,(%esp)
    1c80:	e8 18 22 00 00       	call   3e9d <unlink>
  fd = open("bd", O_CREATE);
    1c85:	5a                   	pop    %edx
    1c86:	59                   	pop    %ecx
    1c87:	68 00 02 00 00       	push   $0x200
    1c8c:	68 55 4a 00 00       	push   $0x4a55
    1c91:	e8 f7 21 00 00       	call   3e8d <open>
  if(fd < 0){
    1c96:	83 c4 10             	add    $0x10,%esp
    1c99:	85 c0                	test   %eax,%eax
    1c9b:	0f 88 ea 00 00 00    	js     1d8b <bigdir+0x12b>
  close(fd);
    1ca1:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1ca4:	31 f6                	xor    %esi,%esi
    1ca6:	8d 7d de             	lea    -0x22(%ebp),%edi
  close(fd);
    1ca9:	50                   	push   %eax
    1caa:	e8 c6 21 00 00       	call   3e75 <close>
    1caf:	83 c4 10             	add    $0x10,%esp
    1cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + (i / 64);
    1cb8:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1cba:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1cbd:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1cc1:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1cc4:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1cc5:	83 c0 30             	add    $0x30,%eax
    if(link("bd", name) != 0){
    1cc8:	68 55 4a 00 00       	push   $0x4a55
    name[1] = '0' + (i / 64);
    1ccd:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1cd0:	89 f0                	mov    %esi,%eax
    1cd2:	83 e0 3f             	and    $0x3f,%eax
    name[3] = '\0';
    1cd5:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[2] = '0' + (i % 64);
    1cd9:	83 c0 30             	add    $0x30,%eax
    1cdc:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1cdf:	e8 c9 21 00 00       	call   3ead <link>
    1ce4:	83 c4 10             	add    $0x10,%esp
    1ce7:	89 c3                	mov    %eax,%ebx
    1ce9:	85 c0                	test   %eax,%eax
    1ceb:	75 76                	jne    1d63 <bigdir+0x103>
  for(i = 0; i < 500; i++){
    1ced:	83 c6 01             	add    $0x1,%esi
    1cf0:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1cf6:	75 c0                	jne    1cb8 <bigdir+0x58>
  unlink("bd");
    1cf8:	83 ec 0c             	sub    $0xc,%esp
    1cfb:	68 55 4a 00 00       	push   $0x4a55
    1d00:	e8 98 21 00 00       	call   3e9d <unlink>
    1d05:	83 c4 10             	add    $0x10,%esp
    1d08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1d0f:	90                   	nop
    name[1] = '0' + (i / 64);
    1d10:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1d12:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1d15:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1d19:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1d1c:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1d1d:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1d20:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1d24:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1d27:	89 d8                	mov    %ebx,%eax
    1d29:	83 e0 3f             	and    $0x3f,%eax
    1d2c:	83 c0 30             	add    $0x30,%eax
    1d2f:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1d32:	e8 66 21 00 00       	call   3e9d <unlink>
    1d37:	83 c4 10             	add    $0x10,%esp
    1d3a:	85 c0                	test   %eax,%eax
    1d3c:	75 39                	jne    1d77 <bigdir+0x117>
  for(i = 0; i < 500; i++){
    1d3e:	83 c3 01             	add    $0x1,%ebx
    1d41:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1d47:	75 c7                	jne    1d10 <bigdir+0xb0>
  printf(1, "bigdir ok\n");
    1d49:	83 ec 08             	sub    $0x8,%esp
    1d4c:	68 97 4a 00 00       	push   $0x4a97
    1d51:	6a 01                	push   $0x1
    1d53:	e8 98 22 00 00       	call   3ff0 <printf>
    1d58:	83 c4 10             	add    $0x10,%esp
}
    1d5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d5e:	5b                   	pop    %ebx
    1d5f:	5e                   	pop    %esi
    1d60:	5f                   	pop    %edi
    1d61:	5d                   	pop    %ebp
    1d62:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1d63:	83 ec 08             	sub    $0x8,%esp
    1d66:	68 6e 4a 00 00       	push   $0x4a6e
    1d6b:	6a 01                	push   $0x1
    1d6d:	e8 7e 22 00 00       	call   3ff0 <printf>
      exit();
    1d72:	e8 d6 20 00 00       	call   3e4d <exit>
      printf(1, "bigdir unlink failed");
    1d77:	83 ec 08             	sub    $0x8,%esp
    1d7a:	68 82 4a 00 00       	push   $0x4a82
    1d7f:	6a 01                	push   $0x1
    1d81:	e8 6a 22 00 00       	call   3ff0 <printf>
      exit();
    1d86:	e8 c2 20 00 00       	call   3e4d <exit>
    printf(1, "bigdir create failed\n");
    1d8b:	50                   	push   %eax
    1d8c:	50                   	push   %eax
    1d8d:	68 58 4a 00 00       	push   $0x4a58
    1d92:	6a 01                	push   $0x1
    1d94:	e8 57 22 00 00       	call   3ff0 <printf>
    exit();
    1d99:	e8 af 20 00 00       	call   3e4d <exit>
    1d9e:	66 90                	xchg   %ax,%ax

00001da0 <subdir>:
{
    1da0:	f3 0f 1e fb          	endbr32 
    1da4:	55                   	push   %ebp
    1da5:	89 e5                	mov    %esp,%ebp
    1da7:	53                   	push   %ebx
    1da8:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1dab:	68 a2 4a 00 00       	push   $0x4aa2
    1db0:	6a 01                	push   $0x1
    1db2:	e8 39 22 00 00       	call   3ff0 <printf>
  unlink("ff");
    1db7:	c7 04 24 2b 4b 00 00 	movl   $0x4b2b,(%esp)
    1dbe:	e8 da 20 00 00       	call   3e9d <unlink>
  if(mkdir("dd") != 0){
    1dc3:	c7 04 24 c8 4b 00 00 	movl   $0x4bc8,(%esp)
    1dca:	e8 e6 20 00 00       	call   3eb5 <mkdir>
    1dcf:	83 c4 10             	add    $0x10,%esp
    1dd2:	85 c0                	test   %eax,%eax
    1dd4:	0f 85 b3 05 00 00    	jne    238d <subdir+0x5ed>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1dda:	83 ec 08             	sub    $0x8,%esp
    1ddd:	68 02 02 00 00       	push   $0x202
    1de2:	68 01 4b 00 00       	push   $0x4b01
    1de7:	e8 a1 20 00 00       	call   3e8d <open>
  if(fd < 0){
    1dec:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1def:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1df1:	85 c0                	test   %eax,%eax
    1df3:	0f 88 81 05 00 00    	js     237a <subdir+0x5da>
  write(fd, "ff", 2);
    1df9:	83 ec 04             	sub    $0x4,%esp
    1dfc:	6a 02                	push   $0x2
    1dfe:	68 2b 4b 00 00       	push   $0x4b2b
    1e03:	50                   	push   %eax
    1e04:	e8 64 20 00 00       	call   3e6d <write>
  close(fd);
    1e09:	89 1c 24             	mov    %ebx,(%esp)
    1e0c:	e8 64 20 00 00       	call   3e75 <close>
  if(unlink("dd") >= 0){
    1e11:	c7 04 24 c8 4b 00 00 	movl   $0x4bc8,(%esp)
    1e18:	e8 80 20 00 00       	call   3e9d <unlink>
    1e1d:	83 c4 10             	add    $0x10,%esp
    1e20:	85 c0                	test   %eax,%eax
    1e22:	0f 89 3f 05 00 00    	jns    2367 <subdir+0x5c7>
  if(mkdir("/dd/dd") != 0){
    1e28:	83 ec 0c             	sub    $0xc,%esp
    1e2b:	68 dc 4a 00 00       	push   $0x4adc
    1e30:	e8 80 20 00 00       	call   3eb5 <mkdir>
    1e35:	83 c4 10             	add    $0x10,%esp
    1e38:	85 c0                	test   %eax,%eax
    1e3a:	0f 85 14 05 00 00    	jne    2354 <subdir+0x5b4>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e40:	83 ec 08             	sub    $0x8,%esp
    1e43:	68 02 02 00 00       	push   $0x202
    1e48:	68 fe 4a 00 00       	push   $0x4afe
    1e4d:	e8 3b 20 00 00       	call   3e8d <open>
  if(fd < 0){
    1e52:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e55:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e57:	85 c0                	test   %eax,%eax
    1e59:	0f 88 24 04 00 00    	js     2283 <subdir+0x4e3>
  write(fd, "FF", 2);
    1e5f:	83 ec 04             	sub    $0x4,%esp
    1e62:	6a 02                	push   $0x2
    1e64:	68 1f 4b 00 00       	push   $0x4b1f
    1e69:	50                   	push   %eax
    1e6a:	e8 fe 1f 00 00       	call   3e6d <write>
  close(fd);
    1e6f:	89 1c 24             	mov    %ebx,(%esp)
    1e72:	e8 fe 1f 00 00       	call   3e75 <close>
  fd = open("dd/dd/../ff", 0);
    1e77:	58                   	pop    %eax
    1e78:	5a                   	pop    %edx
    1e79:	6a 00                	push   $0x0
    1e7b:	68 22 4b 00 00       	push   $0x4b22
    1e80:	e8 08 20 00 00       	call   3e8d <open>
  if(fd < 0){
    1e85:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    1e88:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e8a:	85 c0                	test   %eax,%eax
    1e8c:	0f 88 de 03 00 00    	js     2270 <subdir+0x4d0>
  cc = read(fd, buf, sizeof(buf));
    1e92:	83 ec 04             	sub    $0x4,%esp
    1e95:	68 00 20 00 00       	push   $0x2000
    1e9a:	68 80 8d 00 00       	push   $0x8d80
    1e9f:	50                   	push   %eax
    1ea0:	e8 c0 1f 00 00       	call   3e65 <read>
  if(cc != 2 || buf[0] != 'f'){
    1ea5:	83 c4 10             	add    $0x10,%esp
    1ea8:	83 f8 02             	cmp    $0x2,%eax
    1eab:	0f 85 3a 03 00 00    	jne    21eb <subdir+0x44b>
    1eb1:	80 3d 80 8d 00 00 66 	cmpb   $0x66,0x8d80
    1eb8:	0f 85 2d 03 00 00    	jne    21eb <subdir+0x44b>
  close(fd);
    1ebe:	83 ec 0c             	sub    $0xc,%esp
    1ec1:	53                   	push   %ebx
    1ec2:	e8 ae 1f 00 00       	call   3e75 <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1ec7:	59                   	pop    %ecx
    1ec8:	5b                   	pop    %ebx
    1ec9:	68 62 4b 00 00       	push   $0x4b62
    1ece:	68 fe 4a 00 00       	push   $0x4afe
    1ed3:	e8 d5 1f 00 00       	call   3ead <link>
    1ed8:	83 c4 10             	add    $0x10,%esp
    1edb:	85 c0                	test   %eax,%eax
    1edd:	0f 85 c6 03 00 00    	jne    22a9 <subdir+0x509>
  if(unlink("dd/dd/ff") != 0){
    1ee3:	83 ec 0c             	sub    $0xc,%esp
    1ee6:	68 fe 4a 00 00       	push   $0x4afe
    1eeb:	e8 ad 1f 00 00       	call   3e9d <unlink>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	85 c0                	test   %eax,%eax
    1ef5:	0f 85 16 03 00 00    	jne    2211 <subdir+0x471>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1efb:	83 ec 08             	sub    $0x8,%esp
    1efe:	6a 00                	push   $0x0
    1f00:	68 fe 4a 00 00       	push   $0x4afe
    1f05:	e8 83 1f 00 00       	call   3e8d <open>
    1f0a:	83 c4 10             	add    $0x10,%esp
    1f0d:	85 c0                	test   %eax,%eax
    1f0f:	0f 89 2c 04 00 00    	jns    2341 <subdir+0x5a1>
  if(chdir("dd") != 0){
    1f15:	83 ec 0c             	sub    $0xc,%esp
    1f18:	68 c8 4b 00 00       	push   $0x4bc8
    1f1d:	e8 9b 1f 00 00       	call   3ebd <chdir>
    1f22:	83 c4 10             	add    $0x10,%esp
    1f25:	85 c0                	test   %eax,%eax
    1f27:	0f 85 01 04 00 00    	jne    232e <subdir+0x58e>
  if(chdir("dd/../../dd") != 0){
    1f2d:	83 ec 0c             	sub    $0xc,%esp
    1f30:	68 96 4b 00 00       	push   $0x4b96
    1f35:	e8 83 1f 00 00       	call   3ebd <chdir>
    1f3a:	83 c4 10             	add    $0x10,%esp
    1f3d:	85 c0                	test   %eax,%eax
    1f3f:	0f 85 b9 02 00 00    	jne    21fe <subdir+0x45e>
  if(chdir("dd/../../../dd") != 0){
    1f45:	83 ec 0c             	sub    $0xc,%esp
    1f48:	68 bc 4b 00 00       	push   $0x4bbc
    1f4d:	e8 6b 1f 00 00       	call   3ebd <chdir>
    1f52:	83 c4 10             	add    $0x10,%esp
    1f55:	85 c0                	test   %eax,%eax
    1f57:	0f 85 a1 02 00 00    	jne    21fe <subdir+0x45e>
  if(chdir("./..") != 0){
    1f5d:	83 ec 0c             	sub    $0xc,%esp
    1f60:	68 cb 4b 00 00       	push   $0x4bcb
    1f65:	e8 53 1f 00 00       	call   3ebd <chdir>
    1f6a:	83 c4 10             	add    $0x10,%esp
    1f6d:	85 c0                	test   %eax,%eax
    1f6f:	0f 85 21 03 00 00    	jne    2296 <subdir+0x4f6>
  fd = open("dd/dd/ffff", 0);
    1f75:	83 ec 08             	sub    $0x8,%esp
    1f78:	6a 00                	push   $0x0
    1f7a:	68 62 4b 00 00       	push   $0x4b62
    1f7f:	e8 09 1f 00 00       	call   3e8d <open>
  if(fd < 0){
    1f84:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    1f87:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f89:	85 c0                	test   %eax,%eax
    1f8b:	0f 88 e0 04 00 00    	js     2471 <subdir+0x6d1>
  if(read(fd, buf, sizeof(buf)) != 2){
    1f91:	83 ec 04             	sub    $0x4,%esp
    1f94:	68 00 20 00 00       	push   $0x2000
    1f99:	68 80 8d 00 00       	push   $0x8d80
    1f9e:	50                   	push   %eax
    1f9f:	e8 c1 1e 00 00       	call   3e65 <read>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	83 f8 02             	cmp    $0x2,%eax
    1faa:	0f 85 ae 04 00 00    	jne    245e <subdir+0x6be>
  close(fd);
    1fb0:	83 ec 0c             	sub    $0xc,%esp
    1fb3:	53                   	push   %ebx
    1fb4:	e8 bc 1e 00 00       	call   3e75 <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1fb9:	58                   	pop    %eax
    1fba:	5a                   	pop    %edx
    1fbb:	6a 00                	push   $0x0
    1fbd:	68 fe 4a 00 00       	push   $0x4afe
    1fc2:	e8 c6 1e 00 00       	call   3e8d <open>
    1fc7:	83 c4 10             	add    $0x10,%esp
    1fca:	85 c0                	test   %eax,%eax
    1fcc:	0f 89 65 02 00 00    	jns    2237 <subdir+0x497>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1fd2:	83 ec 08             	sub    $0x8,%esp
    1fd5:	68 02 02 00 00       	push   $0x202
    1fda:	68 16 4c 00 00       	push   $0x4c16
    1fdf:	e8 a9 1e 00 00       	call   3e8d <open>
    1fe4:	83 c4 10             	add    $0x10,%esp
    1fe7:	85 c0                	test   %eax,%eax
    1fe9:	0f 89 35 02 00 00    	jns    2224 <subdir+0x484>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1fef:	83 ec 08             	sub    $0x8,%esp
    1ff2:	68 02 02 00 00       	push   $0x202
    1ff7:	68 3b 4c 00 00       	push   $0x4c3b
    1ffc:	e8 8c 1e 00 00       	call   3e8d <open>
    2001:	83 c4 10             	add    $0x10,%esp
    2004:	85 c0                	test   %eax,%eax
    2006:	0f 89 0f 03 00 00    	jns    231b <subdir+0x57b>
  if(open("dd", O_CREATE) >= 0){
    200c:	83 ec 08             	sub    $0x8,%esp
    200f:	68 00 02 00 00       	push   $0x200
    2014:	68 c8 4b 00 00       	push   $0x4bc8
    2019:	e8 6f 1e 00 00       	call   3e8d <open>
    201e:	83 c4 10             	add    $0x10,%esp
    2021:	85 c0                	test   %eax,%eax
    2023:	0f 89 df 02 00 00    	jns    2308 <subdir+0x568>
  if(open("dd", O_RDWR) >= 0){
    2029:	83 ec 08             	sub    $0x8,%esp
    202c:	6a 02                	push   $0x2
    202e:	68 c8 4b 00 00       	push   $0x4bc8
    2033:	e8 55 1e 00 00       	call   3e8d <open>
    2038:	83 c4 10             	add    $0x10,%esp
    203b:	85 c0                	test   %eax,%eax
    203d:	0f 89 b2 02 00 00    	jns    22f5 <subdir+0x555>
  if(open("dd", O_WRONLY) >= 0){
    2043:	83 ec 08             	sub    $0x8,%esp
    2046:	6a 01                	push   $0x1
    2048:	68 c8 4b 00 00       	push   $0x4bc8
    204d:	e8 3b 1e 00 00       	call   3e8d <open>
    2052:	83 c4 10             	add    $0x10,%esp
    2055:	85 c0                	test   %eax,%eax
    2057:	0f 89 85 02 00 00    	jns    22e2 <subdir+0x542>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    205d:	83 ec 08             	sub    $0x8,%esp
    2060:	68 aa 4c 00 00       	push   $0x4caa
    2065:	68 16 4c 00 00       	push   $0x4c16
    206a:	e8 3e 1e 00 00       	call   3ead <link>
    206f:	83 c4 10             	add    $0x10,%esp
    2072:	85 c0                	test   %eax,%eax
    2074:	0f 84 55 02 00 00    	je     22cf <subdir+0x52f>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    207a:	83 ec 08             	sub    $0x8,%esp
    207d:	68 aa 4c 00 00       	push   $0x4caa
    2082:	68 3b 4c 00 00       	push   $0x4c3b
    2087:	e8 21 1e 00 00       	call   3ead <link>
    208c:	83 c4 10             	add    $0x10,%esp
    208f:	85 c0                	test   %eax,%eax
    2091:	0f 84 25 02 00 00    	je     22bc <subdir+0x51c>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2097:	83 ec 08             	sub    $0x8,%esp
    209a:	68 62 4b 00 00       	push   $0x4b62
    209f:	68 01 4b 00 00       	push   $0x4b01
    20a4:	e8 04 1e 00 00       	call   3ead <link>
    20a9:	83 c4 10             	add    $0x10,%esp
    20ac:	85 c0                	test   %eax,%eax
    20ae:	0f 84 a9 01 00 00    	je     225d <subdir+0x4bd>
  if(mkdir("dd/ff/ff") == 0){
    20b4:	83 ec 0c             	sub    $0xc,%esp
    20b7:	68 16 4c 00 00       	push   $0x4c16
    20bc:	e8 f4 1d 00 00       	call   3eb5 <mkdir>
    20c1:	83 c4 10             	add    $0x10,%esp
    20c4:	85 c0                	test   %eax,%eax
    20c6:	0f 84 7e 01 00 00    	je     224a <subdir+0x4aa>
  if(mkdir("dd/xx/ff") == 0){
    20cc:	83 ec 0c             	sub    $0xc,%esp
    20cf:	68 3b 4c 00 00       	push   $0x4c3b
    20d4:	e8 dc 1d 00 00       	call   3eb5 <mkdir>
    20d9:	83 c4 10             	add    $0x10,%esp
    20dc:	85 c0                	test   %eax,%eax
    20de:	0f 84 67 03 00 00    	je     244b <subdir+0x6ab>
  if(mkdir("dd/dd/ffff") == 0){
    20e4:	83 ec 0c             	sub    $0xc,%esp
    20e7:	68 62 4b 00 00       	push   $0x4b62
    20ec:	e8 c4 1d 00 00       	call   3eb5 <mkdir>
    20f1:	83 c4 10             	add    $0x10,%esp
    20f4:	85 c0                	test   %eax,%eax
    20f6:	0f 84 3c 03 00 00    	je     2438 <subdir+0x698>
  if(unlink("dd/xx/ff") == 0){
    20fc:	83 ec 0c             	sub    $0xc,%esp
    20ff:	68 3b 4c 00 00       	push   $0x4c3b
    2104:	e8 94 1d 00 00       	call   3e9d <unlink>
    2109:	83 c4 10             	add    $0x10,%esp
    210c:	85 c0                	test   %eax,%eax
    210e:	0f 84 11 03 00 00    	je     2425 <subdir+0x685>
  if(unlink("dd/ff/ff") == 0){
    2114:	83 ec 0c             	sub    $0xc,%esp
    2117:	68 16 4c 00 00       	push   $0x4c16
    211c:	e8 7c 1d 00 00       	call   3e9d <unlink>
    2121:	83 c4 10             	add    $0x10,%esp
    2124:	85 c0                	test   %eax,%eax
    2126:	0f 84 e6 02 00 00    	je     2412 <subdir+0x672>
  if(chdir("dd/ff") == 0){
    212c:	83 ec 0c             	sub    $0xc,%esp
    212f:	68 01 4b 00 00       	push   $0x4b01
    2134:	e8 84 1d 00 00       	call   3ebd <chdir>
    2139:	83 c4 10             	add    $0x10,%esp
    213c:	85 c0                	test   %eax,%eax
    213e:	0f 84 bb 02 00 00    	je     23ff <subdir+0x65f>
  if(chdir("dd/xx") == 0){
    2144:	83 ec 0c             	sub    $0xc,%esp
    2147:	68 ad 4c 00 00       	push   $0x4cad
    214c:	e8 6c 1d 00 00       	call   3ebd <chdir>
    2151:	83 c4 10             	add    $0x10,%esp
    2154:	85 c0                	test   %eax,%eax
    2156:	0f 84 90 02 00 00    	je     23ec <subdir+0x64c>
  if(unlink("dd/dd/ffff") != 0){
    215c:	83 ec 0c             	sub    $0xc,%esp
    215f:	68 62 4b 00 00       	push   $0x4b62
    2164:	e8 34 1d 00 00       	call   3e9d <unlink>
    2169:	83 c4 10             	add    $0x10,%esp
    216c:	85 c0                	test   %eax,%eax
    216e:	0f 85 9d 00 00 00    	jne    2211 <subdir+0x471>
  if(unlink("dd/ff") != 0){
    2174:	83 ec 0c             	sub    $0xc,%esp
    2177:	68 01 4b 00 00       	push   $0x4b01
    217c:	e8 1c 1d 00 00       	call   3e9d <unlink>
    2181:	83 c4 10             	add    $0x10,%esp
    2184:	85 c0                	test   %eax,%eax
    2186:	0f 85 4d 02 00 00    	jne    23d9 <subdir+0x639>
  if(unlink("dd") == 0){
    218c:	83 ec 0c             	sub    $0xc,%esp
    218f:	68 c8 4b 00 00       	push   $0x4bc8
    2194:	e8 04 1d 00 00       	call   3e9d <unlink>
    2199:	83 c4 10             	add    $0x10,%esp
    219c:	85 c0                	test   %eax,%eax
    219e:	0f 84 22 02 00 00    	je     23c6 <subdir+0x626>
  if(unlink("dd/dd") < 0){
    21a4:	83 ec 0c             	sub    $0xc,%esp
    21a7:	68 dd 4a 00 00       	push   $0x4add
    21ac:	e8 ec 1c 00 00       	call   3e9d <unlink>
    21b1:	83 c4 10             	add    $0x10,%esp
    21b4:	85 c0                	test   %eax,%eax
    21b6:	0f 88 f7 01 00 00    	js     23b3 <subdir+0x613>
  if(unlink("dd") < 0){
    21bc:	83 ec 0c             	sub    $0xc,%esp
    21bf:	68 c8 4b 00 00       	push   $0x4bc8
    21c4:	e8 d4 1c 00 00       	call   3e9d <unlink>
    21c9:	83 c4 10             	add    $0x10,%esp
    21cc:	85 c0                	test   %eax,%eax
    21ce:	0f 88 cc 01 00 00    	js     23a0 <subdir+0x600>
  printf(1, "subdir ok\n");
    21d4:	83 ec 08             	sub    $0x8,%esp
    21d7:	68 aa 4d 00 00       	push   $0x4daa
    21dc:	6a 01                	push   $0x1
    21de:	e8 0d 1e 00 00       	call   3ff0 <printf>
}
    21e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    21e6:	83 c4 10             	add    $0x10,%esp
    21e9:	c9                   	leave  
    21ea:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    21eb:	50                   	push   %eax
    21ec:	50                   	push   %eax
    21ed:	68 47 4b 00 00       	push   $0x4b47
    21f2:	6a 01                	push   $0x1
    21f4:	e8 f7 1d 00 00       	call   3ff0 <printf>
    exit();
    21f9:	e8 4f 1c 00 00       	call   3e4d <exit>
    printf(1, "chdir dd/../../dd failed\n");
    21fe:	50                   	push   %eax
    21ff:	50                   	push   %eax
    2200:	68 a2 4b 00 00       	push   $0x4ba2
    2205:	6a 01                	push   $0x1
    2207:	e8 e4 1d 00 00       	call   3ff0 <printf>
    exit();
    220c:	e8 3c 1c 00 00       	call   3e4d <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    2211:	50                   	push   %eax
    2212:	50                   	push   %eax
    2213:	68 6d 4b 00 00       	push   $0x4b6d
    2218:	6a 01                	push   $0x1
    221a:	e8 d1 1d 00 00       	call   3ff0 <printf>
    exit();
    221f:	e8 29 1c 00 00       	call   3e4d <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2224:	51                   	push   %ecx
    2225:	51                   	push   %ecx
    2226:	68 1f 4c 00 00       	push   $0x4c1f
    222b:	6a 01                	push   $0x1
    222d:	e8 be 1d 00 00       	call   3ff0 <printf>
    exit();
    2232:	e8 16 1c 00 00       	call   3e4d <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2237:	53                   	push   %ebx
    2238:	53                   	push   %ebx
    2239:	68 04 56 00 00       	push   $0x5604
    223e:	6a 01                	push   $0x1
    2240:	e8 ab 1d 00 00       	call   3ff0 <printf>
    exit();
    2245:	e8 03 1c 00 00       	call   3e4d <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    224a:	51                   	push   %ecx
    224b:	51                   	push   %ecx
    224c:	68 b3 4c 00 00       	push   $0x4cb3
    2251:	6a 01                	push   $0x1
    2253:	e8 98 1d 00 00       	call   3ff0 <printf>
    exit();
    2258:	e8 f0 1b 00 00       	call   3e4d <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    225d:	53                   	push   %ebx
    225e:	53                   	push   %ebx
    225f:	68 74 56 00 00       	push   $0x5674
    2264:	6a 01                	push   $0x1
    2266:	e8 85 1d 00 00       	call   3ff0 <printf>
    exit();
    226b:	e8 dd 1b 00 00       	call   3e4d <exit>
    printf(1, "open dd/dd/../ff failed\n");
    2270:	50                   	push   %eax
    2271:	50                   	push   %eax
    2272:	68 2e 4b 00 00       	push   $0x4b2e
    2277:	6a 01                	push   $0x1
    2279:	e8 72 1d 00 00       	call   3ff0 <printf>
    exit();
    227e:	e8 ca 1b 00 00       	call   3e4d <exit>
    printf(1, "create dd/dd/ff failed\n");
    2283:	51                   	push   %ecx
    2284:	51                   	push   %ecx
    2285:	68 07 4b 00 00       	push   $0x4b07
    228a:	6a 01                	push   $0x1
    228c:	e8 5f 1d 00 00       	call   3ff0 <printf>
    exit();
    2291:	e8 b7 1b 00 00       	call   3e4d <exit>
    printf(1, "chdir ./.. failed\n");
    2296:	50                   	push   %eax
    2297:	50                   	push   %eax
    2298:	68 d0 4b 00 00       	push   $0x4bd0
    229d:	6a 01                	push   $0x1
    229f:	e8 4c 1d 00 00       	call   3ff0 <printf>
    exit();
    22a4:	e8 a4 1b 00 00       	call   3e4d <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    22a9:	52                   	push   %edx
    22aa:	52                   	push   %edx
    22ab:	68 bc 55 00 00       	push   $0x55bc
    22b0:	6a 01                	push   $0x1
    22b2:	e8 39 1d 00 00       	call   3ff0 <printf>
    exit();
    22b7:	e8 91 1b 00 00       	call   3e4d <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    22bc:	50                   	push   %eax
    22bd:	50                   	push   %eax
    22be:	68 50 56 00 00       	push   $0x5650
    22c3:	6a 01                	push   $0x1
    22c5:	e8 26 1d 00 00       	call   3ff0 <printf>
    exit();
    22ca:	e8 7e 1b 00 00       	call   3e4d <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    22cf:	50                   	push   %eax
    22d0:	50                   	push   %eax
    22d1:	68 2c 56 00 00       	push   $0x562c
    22d6:	6a 01                	push   $0x1
    22d8:	e8 13 1d 00 00       	call   3ff0 <printf>
    exit();
    22dd:	e8 6b 1b 00 00       	call   3e4d <exit>
    printf(1, "open dd wronly succeeded!\n");
    22e2:	50                   	push   %eax
    22e3:	50                   	push   %eax
    22e4:	68 8f 4c 00 00       	push   $0x4c8f
    22e9:	6a 01                	push   $0x1
    22eb:	e8 00 1d 00 00       	call   3ff0 <printf>
    exit();
    22f0:	e8 58 1b 00 00       	call   3e4d <exit>
    printf(1, "open dd rdwr succeeded!\n");
    22f5:	50                   	push   %eax
    22f6:	50                   	push   %eax
    22f7:	68 76 4c 00 00       	push   $0x4c76
    22fc:	6a 01                	push   $0x1
    22fe:	e8 ed 1c 00 00       	call   3ff0 <printf>
    exit();
    2303:	e8 45 1b 00 00       	call   3e4d <exit>
    printf(1, "create dd succeeded!\n");
    2308:	50                   	push   %eax
    2309:	50                   	push   %eax
    230a:	68 60 4c 00 00       	push   $0x4c60
    230f:	6a 01                	push   $0x1
    2311:	e8 da 1c 00 00       	call   3ff0 <printf>
    exit();
    2316:	e8 32 1b 00 00       	call   3e4d <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    231b:	52                   	push   %edx
    231c:	52                   	push   %edx
    231d:	68 44 4c 00 00       	push   $0x4c44
    2322:	6a 01                	push   $0x1
    2324:	e8 c7 1c 00 00       	call   3ff0 <printf>
    exit();
    2329:	e8 1f 1b 00 00       	call   3e4d <exit>
    printf(1, "chdir dd failed\n");
    232e:	50                   	push   %eax
    232f:	50                   	push   %eax
    2330:	68 85 4b 00 00       	push   $0x4b85
    2335:	6a 01                	push   $0x1
    2337:	e8 b4 1c 00 00       	call   3ff0 <printf>
    exit();
    233c:	e8 0c 1b 00 00       	call   3e4d <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    2341:	50                   	push   %eax
    2342:	50                   	push   %eax
    2343:	68 e0 55 00 00       	push   $0x55e0
    2348:	6a 01                	push   $0x1
    234a:	e8 a1 1c 00 00       	call   3ff0 <printf>
    exit();
    234f:	e8 f9 1a 00 00       	call   3e4d <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2354:	53                   	push   %ebx
    2355:	53                   	push   %ebx
    2356:	68 e3 4a 00 00       	push   $0x4ae3
    235b:	6a 01                	push   $0x1
    235d:	e8 8e 1c 00 00       	call   3ff0 <printf>
    exit();
    2362:	e8 e6 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2367:	50                   	push   %eax
    2368:	50                   	push   %eax
    2369:	68 94 55 00 00       	push   $0x5594
    236e:	6a 01                	push   $0x1
    2370:	e8 7b 1c 00 00       	call   3ff0 <printf>
    exit();
    2375:	e8 d3 1a 00 00       	call   3e4d <exit>
    printf(1, "create dd/ff failed\n");
    237a:	50                   	push   %eax
    237b:	50                   	push   %eax
    237c:	68 c7 4a 00 00       	push   $0x4ac7
    2381:	6a 01                	push   $0x1
    2383:	e8 68 1c 00 00       	call   3ff0 <printf>
    exit();
    2388:	e8 c0 1a 00 00       	call   3e4d <exit>
    printf(1, "subdir mkdir dd failed\n");
    238d:	50                   	push   %eax
    238e:	50                   	push   %eax
    238f:	68 af 4a 00 00       	push   $0x4aaf
    2394:	6a 01                	push   $0x1
    2396:	e8 55 1c 00 00       	call   3ff0 <printf>
    exit();
    239b:	e8 ad 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd failed\n");
    23a0:	50                   	push   %eax
    23a1:	50                   	push   %eax
    23a2:	68 98 4d 00 00       	push   $0x4d98
    23a7:	6a 01                	push   $0x1
    23a9:	e8 42 1c 00 00       	call   3ff0 <printf>
    exit();
    23ae:	e8 9a 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd/dd failed\n");
    23b3:	52                   	push   %edx
    23b4:	52                   	push   %edx
    23b5:	68 83 4d 00 00       	push   $0x4d83
    23ba:	6a 01                	push   $0x1
    23bc:	e8 2f 1c 00 00       	call   3ff0 <printf>
    exit();
    23c1:	e8 87 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    23c6:	51                   	push   %ecx
    23c7:	51                   	push   %ecx
    23c8:	68 98 56 00 00       	push   $0x5698
    23cd:	6a 01                	push   $0x1
    23cf:	e8 1c 1c 00 00       	call   3ff0 <printf>
    exit();
    23d4:	e8 74 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd/ff failed\n");
    23d9:	53                   	push   %ebx
    23da:	53                   	push   %ebx
    23db:	68 6e 4d 00 00       	push   $0x4d6e
    23e0:	6a 01                	push   $0x1
    23e2:	e8 09 1c 00 00       	call   3ff0 <printf>
    exit();
    23e7:	e8 61 1a 00 00       	call   3e4d <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    23ec:	50                   	push   %eax
    23ed:	50                   	push   %eax
    23ee:	68 56 4d 00 00       	push   $0x4d56
    23f3:	6a 01                	push   $0x1
    23f5:	e8 f6 1b 00 00       	call   3ff0 <printf>
    exit();
    23fa:	e8 4e 1a 00 00       	call   3e4d <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    23ff:	50                   	push   %eax
    2400:	50                   	push   %eax
    2401:	68 3e 4d 00 00       	push   $0x4d3e
    2406:	6a 01                	push   $0x1
    2408:	e8 e3 1b 00 00       	call   3ff0 <printf>
    exit();
    240d:	e8 3b 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2412:	50                   	push   %eax
    2413:	50                   	push   %eax
    2414:	68 22 4d 00 00       	push   $0x4d22
    2419:	6a 01                	push   $0x1
    241b:	e8 d0 1b 00 00       	call   3ff0 <printf>
    exit();
    2420:	e8 28 1a 00 00       	call   3e4d <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2425:	50                   	push   %eax
    2426:	50                   	push   %eax
    2427:	68 06 4d 00 00       	push   $0x4d06
    242c:	6a 01                	push   $0x1
    242e:	e8 bd 1b 00 00       	call   3ff0 <printf>
    exit();
    2433:	e8 15 1a 00 00       	call   3e4d <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2438:	50                   	push   %eax
    2439:	50                   	push   %eax
    243a:	68 e9 4c 00 00       	push   $0x4ce9
    243f:	6a 01                	push   $0x1
    2441:	e8 aa 1b 00 00       	call   3ff0 <printf>
    exit();
    2446:	e8 02 1a 00 00       	call   3e4d <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    244b:	52                   	push   %edx
    244c:	52                   	push   %edx
    244d:	68 ce 4c 00 00       	push   $0x4cce
    2452:	6a 01                	push   $0x1
    2454:	e8 97 1b 00 00       	call   3ff0 <printf>
    exit();
    2459:	e8 ef 19 00 00       	call   3e4d <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    245e:	51                   	push   %ecx
    245f:	51                   	push   %ecx
    2460:	68 fb 4b 00 00       	push   $0x4bfb
    2465:	6a 01                	push   $0x1
    2467:	e8 84 1b 00 00       	call   3ff0 <printf>
    exit();
    246c:	e8 dc 19 00 00       	call   3e4d <exit>
    printf(1, "open dd/dd/ffff failed\n");
    2471:	53                   	push   %ebx
    2472:	53                   	push   %ebx
    2473:	68 e3 4b 00 00       	push   $0x4be3
    2478:	6a 01                	push   $0x1
    247a:	e8 71 1b 00 00       	call   3ff0 <printf>
    exit();
    247f:	e8 c9 19 00 00       	call   3e4d <exit>
    2484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    248b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    248f:	90                   	nop

00002490 <bigwrite>:
{
    2490:	f3 0f 1e fb          	endbr32 
    2494:	55                   	push   %ebp
    2495:	89 e5                	mov    %esp,%ebp
    2497:	56                   	push   %esi
    2498:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2499:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    249e:	83 ec 08             	sub    $0x8,%esp
    24a1:	68 b5 4d 00 00       	push   $0x4db5
    24a6:	6a 01                	push   $0x1
    24a8:	e8 43 1b 00 00       	call   3ff0 <printf>
  unlink("bigwrite");
    24ad:	c7 04 24 c4 4d 00 00 	movl   $0x4dc4,(%esp)
    24b4:	e8 e4 19 00 00       	call   3e9d <unlink>
    24b9:	83 c4 10             	add    $0x10,%esp
    24bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    24c0:	83 ec 08             	sub    $0x8,%esp
    24c3:	68 02 02 00 00       	push   $0x202
    24c8:	68 c4 4d 00 00       	push   $0x4dc4
    24cd:	e8 bb 19 00 00       	call   3e8d <open>
    if(fd < 0){
    24d2:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    24d5:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    24d7:	85 c0                	test   %eax,%eax
    24d9:	78 7e                	js     2559 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    24db:	83 ec 04             	sub    $0x4,%esp
    24de:	53                   	push   %ebx
    24df:	68 80 8d 00 00       	push   $0x8d80
    24e4:	50                   	push   %eax
    24e5:	e8 83 19 00 00       	call   3e6d <write>
      if(cc != sz){
    24ea:	83 c4 10             	add    $0x10,%esp
    24ed:	39 d8                	cmp    %ebx,%eax
    24ef:	75 55                	jne    2546 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    24f1:	83 ec 04             	sub    $0x4,%esp
    24f4:	53                   	push   %ebx
    24f5:	68 80 8d 00 00       	push   $0x8d80
    24fa:	56                   	push   %esi
    24fb:	e8 6d 19 00 00       	call   3e6d <write>
      if(cc != sz){
    2500:	83 c4 10             	add    $0x10,%esp
    2503:	39 d8                	cmp    %ebx,%eax
    2505:	75 3f                	jne    2546 <bigwrite+0xb6>
    close(fd);
    2507:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    250a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2510:	56                   	push   %esi
    2511:	e8 5f 19 00 00       	call   3e75 <close>
    unlink("bigwrite");
    2516:	c7 04 24 c4 4d 00 00 	movl   $0x4dc4,(%esp)
    251d:	e8 7b 19 00 00       	call   3e9d <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    252b:	75 93                	jne    24c0 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    252d:	83 ec 08             	sub    $0x8,%esp
    2530:	68 f7 4d 00 00       	push   $0x4df7
    2535:	6a 01                	push   $0x1
    2537:	e8 b4 1a 00 00       	call   3ff0 <printf>
}
    253c:	83 c4 10             	add    $0x10,%esp
    253f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2542:	5b                   	pop    %ebx
    2543:	5e                   	pop    %esi
    2544:	5d                   	pop    %ebp
    2545:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    2546:	50                   	push   %eax
    2547:	53                   	push   %ebx
    2548:	68 e5 4d 00 00       	push   $0x4de5
    254d:	6a 01                	push   $0x1
    254f:	e8 9c 1a 00 00       	call   3ff0 <printf>
        exit();
    2554:	e8 f4 18 00 00       	call   3e4d <exit>
      printf(1, "cannot create bigwrite\n");
    2559:	83 ec 08             	sub    $0x8,%esp
    255c:	68 cd 4d 00 00       	push   $0x4dcd
    2561:	6a 01                	push   $0x1
    2563:	e8 88 1a 00 00       	call   3ff0 <printf>
      exit();
    2568:	e8 e0 18 00 00       	call   3e4d <exit>
    256d:	8d 76 00             	lea    0x0(%esi),%esi

00002570 <bigfile>:
{
    2570:	f3 0f 1e fb          	endbr32 
    2574:	55                   	push   %ebp
    2575:	89 e5                	mov    %esp,%ebp
    2577:	57                   	push   %edi
    2578:	56                   	push   %esi
    2579:	53                   	push   %ebx
    257a:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    257d:	68 04 4e 00 00       	push   $0x4e04
    2582:	6a 01                	push   $0x1
    2584:	e8 67 1a 00 00       	call   3ff0 <printf>
  unlink("bigfile");
    2589:	c7 04 24 20 4e 00 00 	movl   $0x4e20,(%esp)
    2590:	e8 08 19 00 00       	call   3e9d <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2595:	58                   	pop    %eax
    2596:	5a                   	pop    %edx
    2597:	68 02 02 00 00       	push   $0x202
    259c:	68 20 4e 00 00       	push   $0x4e20
    25a1:	e8 e7 18 00 00       	call   3e8d <open>
  if(fd < 0){
    25a6:	83 c4 10             	add    $0x10,%esp
    25a9:	85 c0                	test   %eax,%eax
    25ab:	0f 88 5a 01 00 00    	js     270b <bigfile+0x19b>
    25b1:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    25b3:	31 db                	xor    %ebx,%ebx
    25b5:	8d 76 00             	lea    0x0(%esi),%esi
    memset(buf, i, 600);
    25b8:	83 ec 04             	sub    $0x4,%esp
    25bb:	68 58 02 00 00       	push   $0x258
    25c0:	53                   	push   %ebx
    25c1:	68 80 8d 00 00       	push   $0x8d80
    25c6:	e8 75 12 00 00       	call   3840 <memset>
    if(write(fd, buf, 600) != 600){
    25cb:	83 c4 0c             	add    $0xc,%esp
    25ce:	68 58 02 00 00       	push   $0x258
    25d3:	68 80 8d 00 00       	push   $0x8d80
    25d8:	56                   	push   %esi
    25d9:	e8 8f 18 00 00       	call   3e6d <write>
    25de:	83 c4 10             	add    $0x10,%esp
    25e1:	3d 58 02 00 00       	cmp    $0x258,%eax
    25e6:	0f 85 f8 00 00 00    	jne    26e4 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    25ec:	83 c3 01             	add    $0x1,%ebx
    25ef:	83 fb 14             	cmp    $0x14,%ebx
    25f2:	75 c4                	jne    25b8 <bigfile+0x48>
  close(fd);
    25f4:	83 ec 0c             	sub    $0xc,%esp
    25f7:	56                   	push   %esi
    25f8:	e8 78 18 00 00       	call   3e75 <close>
  fd = open("bigfile", 0);
    25fd:	5e                   	pop    %esi
    25fe:	5f                   	pop    %edi
    25ff:	6a 00                	push   $0x0
    2601:	68 20 4e 00 00       	push   $0x4e20
    2606:	e8 82 18 00 00       	call   3e8d <open>
  if(fd < 0){
    260b:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    260e:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2610:	85 c0                	test   %eax,%eax
    2612:	0f 88 e0 00 00 00    	js     26f8 <bigfile+0x188>
  total = 0;
    2618:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    261a:	31 ff                	xor    %edi,%edi
    261c:	eb 30                	jmp    264e <bigfile+0xde>
    261e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    2620:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2625:	0f 85 91 00 00 00    	jne    26bc <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    262b:	89 fa                	mov    %edi,%edx
    262d:	0f be 05 80 8d 00 00 	movsbl 0x8d80,%eax
    2634:	d1 fa                	sar    %edx
    2636:	39 d0                	cmp    %edx,%eax
    2638:	75 6e                	jne    26a8 <bigfile+0x138>
    263a:	0f be 15 ab 8e 00 00 	movsbl 0x8eab,%edx
    2641:	39 d0                	cmp    %edx,%eax
    2643:	75 63                	jne    26a8 <bigfile+0x138>
    total += cc;
    2645:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    264b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    264e:	83 ec 04             	sub    $0x4,%esp
    2651:	68 2c 01 00 00       	push   $0x12c
    2656:	68 80 8d 00 00       	push   $0x8d80
    265b:	56                   	push   %esi
    265c:	e8 04 18 00 00       	call   3e65 <read>
    if(cc < 0){
    2661:	83 c4 10             	add    $0x10,%esp
    2664:	85 c0                	test   %eax,%eax
    2666:	78 68                	js     26d0 <bigfile+0x160>
    if(cc == 0)
    2668:	75 b6                	jne    2620 <bigfile+0xb0>
  close(fd);
    266a:	83 ec 0c             	sub    $0xc,%esp
    266d:	56                   	push   %esi
    266e:	e8 02 18 00 00       	call   3e75 <close>
  if(total != 20*600){
    2673:	83 c4 10             	add    $0x10,%esp
    2676:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    267c:	0f 85 9c 00 00 00    	jne    271e <bigfile+0x1ae>
  unlink("bigfile");
    2682:	83 ec 0c             	sub    $0xc,%esp
    2685:	68 20 4e 00 00       	push   $0x4e20
    268a:	e8 0e 18 00 00       	call   3e9d <unlink>
  printf(1, "bigfile test ok\n");
    268f:	58                   	pop    %eax
    2690:	5a                   	pop    %edx
    2691:	68 af 4e 00 00       	push   $0x4eaf
    2696:	6a 01                	push   $0x1
    2698:	e8 53 19 00 00       	call   3ff0 <printf>
}
    269d:	83 c4 10             	add    $0x10,%esp
    26a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    26a3:	5b                   	pop    %ebx
    26a4:	5e                   	pop    %esi
    26a5:	5f                   	pop    %edi
    26a6:	5d                   	pop    %ebp
    26a7:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    26a8:	83 ec 08             	sub    $0x8,%esp
    26ab:	68 7c 4e 00 00       	push   $0x4e7c
    26b0:	6a 01                	push   $0x1
    26b2:	e8 39 19 00 00       	call   3ff0 <printf>
      exit();
    26b7:	e8 91 17 00 00       	call   3e4d <exit>
      printf(1, "short read bigfile\n");
    26bc:	83 ec 08             	sub    $0x8,%esp
    26bf:	68 68 4e 00 00       	push   $0x4e68
    26c4:	6a 01                	push   $0x1
    26c6:	e8 25 19 00 00       	call   3ff0 <printf>
      exit();
    26cb:	e8 7d 17 00 00       	call   3e4d <exit>
      printf(1, "read bigfile failed\n");
    26d0:	83 ec 08             	sub    $0x8,%esp
    26d3:	68 53 4e 00 00       	push   $0x4e53
    26d8:	6a 01                	push   $0x1
    26da:	e8 11 19 00 00       	call   3ff0 <printf>
      exit();
    26df:	e8 69 17 00 00       	call   3e4d <exit>
      printf(1, "write bigfile failed\n");
    26e4:	83 ec 08             	sub    $0x8,%esp
    26e7:	68 28 4e 00 00       	push   $0x4e28
    26ec:	6a 01                	push   $0x1
    26ee:	e8 fd 18 00 00       	call   3ff0 <printf>
      exit();
    26f3:	e8 55 17 00 00       	call   3e4d <exit>
    printf(1, "cannot open bigfile\n");
    26f8:	53                   	push   %ebx
    26f9:	53                   	push   %ebx
    26fa:	68 3e 4e 00 00       	push   $0x4e3e
    26ff:	6a 01                	push   $0x1
    2701:	e8 ea 18 00 00       	call   3ff0 <printf>
    exit();
    2706:	e8 42 17 00 00       	call   3e4d <exit>
    printf(1, "cannot create bigfile");
    270b:	50                   	push   %eax
    270c:	50                   	push   %eax
    270d:	68 12 4e 00 00       	push   $0x4e12
    2712:	6a 01                	push   $0x1
    2714:	e8 d7 18 00 00       	call   3ff0 <printf>
    exit();
    2719:	e8 2f 17 00 00       	call   3e4d <exit>
    printf(1, "read bigfile wrong total\n");
    271e:	51                   	push   %ecx
    271f:	51                   	push   %ecx
    2720:	68 95 4e 00 00       	push   $0x4e95
    2725:	6a 01                	push   $0x1
    2727:	e8 c4 18 00 00       	call   3ff0 <printf>
    exit();
    272c:	e8 1c 17 00 00       	call   3e4d <exit>
    2731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    273f:	90                   	nop

00002740 <fourteen>:
{
    2740:	f3 0f 1e fb          	endbr32 
    2744:	55                   	push   %ebp
    2745:	89 e5                	mov    %esp,%ebp
    2747:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    274a:	68 c0 4e 00 00       	push   $0x4ec0
    274f:	6a 01                	push   $0x1
    2751:	e8 9a 18 00 00       	call   3ff0 <printf>
  if(mkdir("12345678901234") != 0){
    2756:	c7 04 24 fb 4e 00 00 	movl   $0x4efb,(%esp)
    275d:	e8 53 17 00 00       	call   3eb5 <mkdir>
    2762:	83 c4 10             	add    $0x10,%esp
    2765:	85 c0                	test   %eax,%eax
    2767:	0f 85 97 00 00 00    	jne    2804 <fourteen+0xc4>
  if(mkdir("12345678901234/123456789012345") != 0){
    276d:	83 ec 0c             	sub    $0xc,%esp
    2770:	68 b8 56 00 00       	push   $0x56b8
    2775:	e8 3b 17 00 00       	call   3eb5 <mkdir>
    277a:	83 c4 10             	add    $0x10,%esp
    277d:	85 c0                	test   %eax,%eax
    277f:	0f 85 de 00 00 00    	jne    2863 <fourteen+0x123>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2785:	83 ec 08             	sub    $0x8,%esp
    2788:	68 00 02 00 00       	push   $0x200
    278d:	68 08 57 00 00       	push   $0x5708
    2792:	e8 f6 16 00 00       	call   3e8d <open>
  if(fd < 0){
    2797:	83 c4 10             	add    $0x10,%esp
    279a:	85 c0                	test   %eax,%eax
    279c:	0f 88 ae 00 00 00    	js     2850 <fourteen+0x110>
  close(fd);
    27a2:	83 ec 0c             	sub    $0xc,%esp
    27a5:	50                   	push   %eax
    27a6:	e8 ca 16 00 00       	call   3e75 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    27ab:	58                   	pop    %eax
    27ac:	5a                   	pop    %edx
    27ad:	6a 00                	push   $0x0
    27af:	68 78 57 00 00       	push   $0x5778
    27b4:	e8 d4 16 00 00       	call   3e8d <open>
  if(fd < 0){
    27b9:	83 c4 10             	add    $0x10,%esp
    27bc:	85 c0                	test   %eax,%eax
    27be:	78 7d                	js     283d <fourteen+0xfd>
  close(fd);
    27c0:	83 ec 0c             	sub    $0xc,%esp
    27c3:	50                   	push   %eax
    27c4:	e8 ac 16 00 00       	call   3e75 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    27c9:	c7 04 24 ec 4e 00 00 	movl   $0x4eec,(%esp)
    27d0:	e8 e0 16 00 00       	call   3eb5 <mkdir>
    27d5:	83 c4 10             	add    $0x10,%esp
    27d8:	85 c0                	test   %eax,%eax
    27da:	74 4e                	je     282a <fourteen+0xea>
  if(mkdir("123456789012345/12345678901234") == 0){
    27dc:	83 ec 0c             	sub    $0xc,%esp
    27df:	68 14 58 00 00       	push   $0x5814
    27e4:	e8 cc 16 00 00       	call   3eb5 <mkdir>
    27e9:	83 c4 10             	add    $0x10,%esp
    27ec:	85 c0                	test   %eax,%eax
    27ee:	74 27                	je     2817 <fourteen+0xd7>
  printf(1, "fourteen ok\n");
    27f0:	83 ec 08             	sub    $0x8,%esp
    27f3:	68 0a 4f 00 00       	push   $0x4f0a
    27f8:	6a 01                	push   $0x1
    27fa:	e8 f1 17 00 00       	call   3ff0 <printf>
}
    27ff:	83 c4 10             	add    $0x10,%esp
    2802:	c9                   	leave  
    2803:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2804:	50                   	push   %eax
    2805:	50                   	push   %eax
    2806:	68 cf 4e 00 00       	push   $0x4ecf
    280b:	6a 01                	push   $0x1
    280d:	e8 de 17 00 00       	call   3ff0 <printf>
    exit();
    2812:	e8 36 16 00 00       	call   3e4d <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2817:	50                   	push   %eax
    2818:	50                   	push   %eax
    2819:	68 34 58 00 00       	push   $0x5834
    281e:	6a 01                	push   $0x1
    2820:	e8 cb 17 00 00       	call   3ff0 <printf>
    exit();
    2825:	e8 23 16 00 00       	call   3e4d <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    282a:	52                   	push   %edx
    282b:	52                   	push   %edx
    282c:	68 e4 57 00 00       	push   $0x57e4
    2831:	6a 01                	push   $0x1
    2833:	e8 b8 17 00 00       	call   3ff0 <printf>
    exit();
    2838:	e8 10 16 00 00       	call   3e4d <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    283d:	51                   	push   %ecx
    283e:	51                   	push   %ecx
    283f:	68 a8 57 00 00       	push   $0x57a8
    2844:	6a 01                	push   $0x1
    2846:	e8 a5 17 00 00       	call   3ff0 <printf>
    exit();
    284b:	e8 fd 15 00 00       	call   3e4d <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2850:	51                   	push   %ecx
    2851:	51                   	push   %ecx
    2852:	68 38 57 00 00       	push   $0x5738
    2857:	6a 01                	push   $0x1
    2859:	e8 92 17 00 00       	call   3ff0 <printf>
    exit();
    285e:	e8 ea 15 00 00       	call   3e4d <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2863:	50                   	push   %eax
    2864:	50                   	push   %eax
    2865:	68 d8 56 00 00       	push   $0x56d8
    286a:	6a 01                	push   $0x1
    286c:	e8 7f 17 00 00       	call   3ff0 <printf>
    exit();
    2871:	e8 d7 15 00 00       	call   3e4d <exit>
    2876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    287d:	8d 76 00             	lea    0x0(%esi),%esi

00002880 <rmdot>:
{
    2880:	f3 0f 1e fb          	endbr32 
    2884:	55                   	push   %ebp
    2885:	89 e5                	mov    %esp,%ebp
    2887:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    288a:	68 17 4f 00 00       	push   $0x4f17
    288f:	6a 01                	push   $0x1
    2891:	e8 5a 17 00 00       	call   3ff0 <printf>
  if(mkdir("dots") != 0){
    2896:	c7 04 24 23 4f 00 00 	movl   $0x4f23,(%esp)
    289d:	e8 13 16 00 00       	call   3eb5 <mkdir>
    28a2:	83 c4 10             	add    $0x10,%esp
    28a5:	85 c0                	test   %eax,%eax
    28a7:	0f 85 b0 00 00 00    	jne    295d <rmdot+0xdd>
  if(chdir("dots") != 0){
    28ad:	83 ec 0c             	sub    $0xc,%esp
    28b0:	68 23 4f 00 00       	push   $0x4f23
    28b5:	e8 03 16 00 00       	call   3ebd <chdir>
    28ba:	83 c4 10             	add    $0x10,%esp
    28bd:	85 c0                	test   %eax,%eax
    28bf:	0f 85 1d 01 00 00    	jne    29e2 <rmdot+0x162>
  if(unlink(".") == 0){
    28c5:	83 ec 0c             	sub    $0xc,%esp
    28c8:	68 ce 4b 00 00       	push   $0x4bce
    28cd:	e8 cb 15 00 00       	call   3e9d <unlink>
    28d2:	83 c4 10             	add    $0x10,%esp
    28d5:	85 c0                	test   %eax,%eax
    28d7:	0f 84 f2 00 00 00    	je     29cf <rmdot+0x14f>
  if(unlink("..") == 0){
    28dd:	83 ec 0c             	sub    $0xc,%esp
    28e0:	68 cd 4b 00 00       	push   $0x4bcd
    28e5:	e8 b3 15 00 00       	call   3e9d <unlink>
    28ea:	83 c4 10             	add    $0x10,%esp
    28ed:	85 c0                	test   %eax,%eax
    28ef:	0f 84 c7 00 00 00    	je     29bc <rmdot+0x13c>
  if(chdir("/") != 0){
    28f5:	83 ec 0c             	sub    $0xc,%esp
    28f8:	68 a1 43 00 00       	push   $0x43a1
    28fd:	e8 bb 15 00 00       	call   3ebd <chdir>
    2902:	83 c4 10             	add    $0x10,%esp
    2905:	85 c0                	test   %eax,%eax
    2907:	0f 85 9c 00 00 00    	jne    29a9 <rmdot+0x129>
  if(unlink("dots/.") == 0){
    290d:	83 ec 0c             	sub    $0xc,%esp
    2910:	68 6b 4f 00 00       	push   $0x4f6b
    2915:	e8 83 15 00 00       	call   3e9d <unlink>
    291a:	83 c4 10             	add    $0x10,%esp
    291d:	85 c0                	test   %eax,%eax
    291f:	74 75                	je     2996 <rmdot+0x116>
  if(unlink("dots/..") == 0){
    2921:	83 ec 0c             	sub    $0xc,%esp
    2924:	68 89 4f 00 00       	push   $0x4f89
    2929:	e8 6f 15 00 00       	call   3e9d <unlink>
    292e:	83 c4 10             	add    $0x10,%esp
    2931:	85 c0                	test   %eax,%eax
    2933:	74 4e                	je     2983 <rmdot+0x103>
  if(unlink("dots") != 0){
    2935:	83 ec 0c             	sub    $0xc,%esp
    2938:	68 23 4f 00 00       	push   $0x4f23
    293d:	e8 5b 15 00 00       	call   3e9d <unlink>
    2942:	83 c4 10             	add    $0x10,%esp
    2945:	85 c0                	test   %eax,%eax
    2947:	75 27                	jne    2970 <rmdot+0xf0>
  printf(1, "rmdot ok\n");
    2949:	83 ec 08             	sub    $0x8,%esp
    294c:	68 be 4f 00 00       	push   $0x4fbe
    2951:	6a 01                	push   $0x1
    2953:	e8 98 16 00 00       	call   3ff0 <printf>
}
    2958:	83 c4 10             	add    $0x10,%esp
    295b:	c9                   	leave  
    295c:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    295d:	50                   	push   %eax
    295e:	50                   	push   %eax
    295f:	68 28 4f 00 00       	push   $0x4f28
    2964:	6a 01                	push   $0x1
    2966:	e8 85 16 00 00       	call   3ff0 <printf>
    exit();
    296b:	e8 dd 14 00 00       	call   3e4d <exit>
    printf(1, "unlink dots failed!\n");
    2970:	50                   	push   %eax
    2971:	50                   	push   %eax
    2972:	68 a9 4f 00 00       	push   $0x4fa9
    2977:	6a 01                	push   $0x1
    2979:	e8 72 16 00 00       	call   3ff0 <printf>
    exit();
    297e:	e8 ca 14 00 00       	call   3e4d <exit>
    printf(1, "unlink dots/.. worked!\n");
    2983:	52                   	push   %edx
    2984:	52                   	push   %edx
    2985:	68 91 4f 00 00       	push   $0x4f91
    298a:	6a 01                	push   $0x1
    298c:	e8 5f 16 00 00       	call   3ff0 <printf>
    exit();
    2991:	e8 b7 14 00 00       	call   3e4d <exit>
    printf(1, "unlink dots/. worked!\n");
    2996:	51                   	push   %ecx
    2997:	51                   	push   %ecx
    2998:	68 72 4f 00 00       	push   $0x4f72
    299d:	6a 01                	push   $0x1
    299f:	e8 4c 16 00 00       	call   3ff0 <printf>
    exit();
    29a4:	e8 a4 14 00 00       	call   3e4d <exit>
    printf(1, "chdir / failed\n");
    29a9:	50                   	push   %eax
    29aa:	50                   	push   %eax
    29ab:	68 a3 43 00 00       	push   $0x43a3
    29b0:	6a 01                	push   $0x1
    29b2:	e8 39 16 00 00       	call   3ff0 <printf>
    exit();
    29b7:	e8 91 14 00 00       	call   3e4d <exit>
    printf(1, "rm .. worked!\n");
    29bc:	50                   	push   %eax
    29bd:	50                   	push   %eax
    29be:	68 5c 4f 00 00       	push   $0x4f5c
    29c3:	6a 01                	push   $0x1
    29c5:	e8 26 16 00 00       	call   3ff0 <printf>
    exit();
    29ca:	e8 7e 14 00 00       	call   3e4d <exit>
    printf(1, "rm . worked!\n");
    29cf:	50                   	push   %eax
    29d0:	50                   	push   %eax
    29d1:	68 4e 4f 00 00       	push   $0x4f4e
    29d6:	6a 01                	push   $0x1
    29d8:	e8 13 16 00 00       	call   3ff0 <printf>
    exit();
    29dd:	e8 6b 14 00 00       	call   3e4d <exit>
    printf(1, "chdir dots failed\n");
    29e2:	50                   	push   %eax
    29e3:	50                   	push   %eax
    29e4:	68 3b 4f 00 00       	push   $0x4f3b
    29e9:	6a 01                	push   $0x1
    29eb:	e8 00 16 00 00       	call   3ff0 <printf>
    exit();
    29f0:	e8 58 14 00 00       	call   3e4d <exit>
    29f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    29fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002a00 <dirfile>:
{
    2a00:	f3 0f 1e fb          	endbr32 
    2a04:	55                   	push   %ebp
    2a05:	89 e5                	mov    %esp,%ebp
    2a07:	53                   	push   %ebx
    2a08:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2a0b:	68 c8 4f 00 00       	push   $0x4fc8
    2a10:	6a 01                	push   $0x1
    2a12:	e8 d9 15 00 00       	call   3ff0 <printf>
  fd = open("dirfile", O_CREATE);
    2a17:	5b                   	pop    %ebx
    2a18:	58                   	pop    %eax
    2a19:	68 00 02 00 00       	push   $0x200
    2a1e:	68 d5 4f 00 00       	push   $0x4fd5
    2a23:	e8 65 14 00 00       	call   3e8d <open>
  if(fd < 0){
    2a28:	83 c4 10             	add    $0x10,%esp
    2a2b:	85 c0                	test   %eax,%eax
    2a2d:	0f 88 43 01 00 00    	js     2b76 <dirfile+0x176>
  close(fd);
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	50                   	push   %eax
    2a37:	e8 39 14 00 00       	call   3e75 <close>
  if(chdir("dirfile") == 0){
    2a3c:	c7 04 24 d5 4f 00 00 	movl   $0x4fd5,(%esp)
    2a43:	e8 75 14 00 00       	call   3ebd <chdir>
    2a48:	83 c4 10             	add    $0x10,%esp
    2a4b:	85 c0                	test   %eax,%eax
    2a4d:	0f 84 10 01 00 00    	je     2b63 <dirfile+0x163>
  fd = open("dirfile/xx", 0);
    2a53:	83 ec 08             	sub    $0x8,%esp
    2a56:	6a 00                	push   $0x0
    2a58:	68 0e 50 00 00       	push   $0x500e
    2a5d:	e8 2b 14 00 00       	call   3e8d <open>
  if(fd >= 0){
    2a62:	83 c4 10             	add    $0x10,%esp
    2a65:	85 c0                	test   %eax,%eax
    2a67:	0f 89 e3 00 00 00    	jns    2b50 <dirfile+0x150>
  fd = open("dirfile/xx", O_CREATE);
    2a6d:	83 ec 08             	sub    $0x8,%esp
    2a70:	68 00 02 00 00       	push   $0x200
    2a75:	68 0e 50 00 00       	push   $0x500e
    2a7a:	e8 0e 14 00 00       	call   3e8d <open>
  if(fd >= 0){
    2a7f:	83 c4 10             	add    $0x10,%esp
    2a82:	85 c0                	test   %eax,%eax
    2a84:	0f 89 c6 00 00 00    	jns    2b50 <dirfile+0x150>
  if(mkdir("dirfile/xx") == 0){
    2a8a:	83 ec 0c             	sub    $0xc,%esp
    2a8d:	68 0e 50 00 00       	push   $0x500e
    2a92:	e8 1e 14 00 00       	call   3eb5 <mkdir>
    2a97:	83 c4 10             	add    $0x10,%esp
    2a9a:	85 c0                	test   %eax,%eax
    2a9c:	0f 84 46 01 00 00    	je     2be8 <dirfile+0x1e8>
  if(unlink("dirfile/xx") == 0){
    2aa2:	83 ec 0c             	sub    $0xc,%esp
    2aa5:	68 0e 50 00 00       	push   $0x500e
    2aaa:	e8 ee 13 00 00       	call   3e9d <unlink>
    2aaf:	83 c4 10             	add    $0x10,%esp
    2ab2:	85 c0                	test   %eax,%eax
    2ab4:	0f 84 1b 01 00 00    	je     2bd5 <dirfile+0x1d5>
  if(link("README", "dirfile/xx") == 0){
    2aba:	83 ec 08             	sub    $0x8,%esp
    2abd:	68 0e 50 00 00       	push   $0x500e
    2ac2:	68 72 50 00 00       	push   $0x5072
    2ac7:	e8 e1 13 00 00       	call   3ead <link>
    2acc:	83 c4 10             	add    $0x10,%esp
    2acf:	85 c0                	test   %eax,%eax
    2ad1:	0f 84 eb 00 00 00    	je     2bc2 <dirfile+0x1c2>
  if(unlink("dirfile") != 0){
    2ad7:	83 ec 0c             	sub    $0xc,%esp
    2ada:	68 d5 4f 00 00       	push   $0x4fd5
    2adf:	e8 b9 13 00 00       	call   3e9d <unlink>
    2ae4:	83 c4 10             	add    $0x10,%esp
    2ae7:	85 c0                	test   %eax,%eax
    2ae9:	0f 85 c0 00 00 00    	jne    2baf <dirfile+0x1af>
  fd = open(".", O_RDWR);
    2aef:	83 ec 08             	sub    $0x8,%esp
    2af2:	6a 02                	push   $0x2
    2af4:	68 ce 4b 00 00       	push   $0x4bce
    2af9:	e8 8f 13 00 00       	call   3e8d <open>
  if(fd >= 0){
    2afe:	83 c4 10             	add    $0x10,%esp
    2b01:	85 c0                	test   %eax,%eax
    2b03:	0f 89 93 00 00 00    	jns    2b9c <dirfile+0x19c>
  fd = open(".", 0);
    2b09:	83 ec 08             	sub    $0x8,%esp
    2b0c:	6a 00                	push   $0x0
    2b0e:	68 ce 4b 00 00       	push   $0x4bce
    2b13:	e8 75 13 00 00       	call   3e8d <open>
  if(write(fd, "x", 1) > 0){
    2b18:	83 c4 0c             	add    $0xc,%esp
    2b1b:	6a 01                	push   $0x1
  fd = open(".", 0);
    2b1d:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2b1f:	68 b1 4c 00 00       	push   $0x4cb1
    2b24:	50                   	push   %eax
    2b25:	e8 43 13 00 00       	call   3e6d <write>
    2b2a:	83 c4 10             	add    $0x10,%esp
    2b2d:	85 c0                	test   %eax,%eax
    2b2f:	7f 58                	jg     2b89 <dirfile+0x189>
  close(fd);
    2b31:	83 ec 0c             	sub    $0xc,%esp
    2b34:	53                   	push   %ebx
    2b35:	e8 3b 13 00 00       	call   3e75 <close>
  printf(1, "dir vs file OK\n");
    2b3a:	58                   	pop    %eax
    2b3b:	5a                   	pop    %edx
    2b3c:	68 a5 50 00 00       	push   $0x50a5
    2b41:	6a 01                	push   $0x1
    2b43:	e8 a8 14 00 00       	call   3ff0 <printf>
}
    2b48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b4b:	83 c4 10             	add    $0x10,%esp
    2b4e:	c9                   	leave  
    2b4f:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2b50:	50                   	push   %eax
    2b51:	50                   	push   %eax
    2b52:	68 19 50 00 00       	push   $0x5019
    2b57:	6a 01                	push   $0x1
    2b59:	e8 92 14 00 00       	call   3ff0 <printf>
    exit();
    2b5e:	e8 ea 12 00 00       	call   3e4d <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2b63:	52                   	push   %edx
    2b64:	52                   	push   %edx
    2b65:	68 f4 4f 00 00       	push   $0x4ff4
    2b6a:	6a 01                	push   $0x1
    2b6c:	e8 7f 14 00 00       	call   3ff0 <printf>
    exit();
    2b71:	e8 d7 12 00 00       	call   3e4d <exit>
    printf(1, "create dirfile failed\n");
    2b76:	51                   	push   %ecx
    2b77:	51                   	push   %ecx
    2b78:	68 dd 4f 00 00       	push   $0x4fdd
    2b7d:	6a 01                	push   $0x1
    2b7f:	e8 6c 14 00 00       	call   3ff0 <printf>
    exit();
    2b84:	e8 c4 12 00 00       	call   3e4d <exit>
    printf(1, "write . succeeded!\n");
    2b89:	51                   	push   %ecx
    2b8a:	51                   	push   %ecx
    2b8b:	68 91 50 00 00       	push   $0x5091
    2b90:	6a 01                	push   $0x1
    2b92:	e8 59 14 00 00       	call   3ff0 <printf>
    exit();
    2b97:	e8 b1 12 00 00       	call   3e4d <exit>
    printf(1, "open . for writing succeeded!\n");
    2b9c:	53                   	push   %ebx
    2b9d:	53                   	push   %ebx
    2b9e:	68 88 58 00 00       	push   $0x5888
    2ba3:	6a 01                	push   $0x1
    2ba5:	e8 46 14 00 00       	call   3ff0 <printf>
    exit();
    2baa:	e8 9e 12 00 00       	call   3e4d <exit>
    printf(1, "unlink dirfile failed!\n");
    2baf:	50                   	push   %eax
    2bb0:	50                   	push   %eax
    2bb1:	68 79 50 00 00       	push   $0x5079
    2bb6:	6a 01                	push   $0x1
    2bb8:	e8 33 14 00 00       	call   3ff0 <printf>
    exit();
    2bbd:	e8 8b 12 00 00       	call   3e4d <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2bc2:	50                   	push   %eax
    2bc3:	50                   	push   %eax
    2bc4:	68 68 58 00 00       	push   $0x5868
    2bc9:	6a 01                	push   $0x1
    2bcb:	e8 20 14 00 00       	call   3ff0 <printf>
    exit();
    2bd0:	e8 78 12 00 00       	call   3e4d <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2bd5:	50                   	push   %eax
    2bd6:	50                   	push   %eax
    2bd7:	68 54 50 00 00       	push   $0x5054
    2bdc:	6a 01                	push   $0x1
    2bde:	e8 0d 14 00 00       	call   3ff0 <printf>
    exit();
    2be3:	e8 65 12 00 00       	call   3e4d <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2be8:	50                   	push   %eax
    2be9:	50                   	push   %eax
    2bea:	68 37 50 00 00       	push   $0x5037
    2bef:	6a 01                	push   $0x1
    2bf1:	e8 fa 13 00 00       	call   3ff0 <printf>
    exit();
    2bf6:	e8 52 12 00 00       	call   3e4d <exit>
    2bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2bff:	90                   	nop

00002c00 <iref>:
{
    2c00:	f3 0f 1e fb          	endbr32 
    2c04:	55                   	push   %ebp
    2c05:	89 e5                	mov    %esp,%ebp
    2c07:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2c08:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2c0d:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2c10:	68 b5 50 00 00       	push   $0x50b5
    2c15:	6a 01                	push   $0x1
    2c17:	e8 d4 13 00 00       	call   3ff0 <printf>
    2c1c:	83 c4 10             	add    $0x10,%esp
    2c1f:	90                   	nop
    if(mkdir("irefd") != 0){
    2c20:	83 ec 0c             	sub    $0xc,%esp
    2c23:	68 c6 50 00 00       	push   $0x50c6
    2c28:	e8 88 12 00 00       	call   3eb5 <mkdir>
    2c2d:	83 c4 10             	add    $0x10,%esp
    2c30:	85 c0                	test   %eax,%eax
    2c32:	0f 85 bb 00 00 00    	jne    2cf3 <iref+0xf3>
    if(chdir("irefd") != 0){
    2c38:	83 ec 0c             	sub    $0xc,%esp
    2c3b:	68 c6 50 00 00       	push   $0x50c6
    2c40:	e8 78 12 00 00       	call   3ebd <chdir>
    2c45:	83 c4 10             	add    $0x10,%esp
    2c48:	85 c0                	test   %eax,%eax
    2c4a:	0f 85 b7 00 00 00    	jne    2d07 <iref+0x107>
    mkdir("");
    2c50:	83 ec 0c             	sub    $0xc,%esp
    2c53:	68 7b 47 00 00       	push   $0x477b
    2c58:	e8 58 12 00 00       	call   3eb5 <mkdir>
    link("README", "");
    2c5d:	59                   	pop    %ecx
    2c5e:	58                   	pop    %eax
    2c5f:	68 7b 47 00 00       	push   $0x477b
    2c64:	68 72 50 00 00       	push   $0x5072
    2c69:	e8 3f 12 00 00       	call   3ead <link>
    fd = open("", O_CREATE);
    2c6e:	58                   	pop    %eax
    2c6f:	5a                   	pop    %edx
    2c70:	68 00 02 00 00       	push   $0x200
    2c75:	68 7b 47 00 00       	push   $0x477b
    2c7a:	e8 0e 12 00 00       	call   3e8d <open>
    if(fd >= 0)
    2c7f:	83 c4 10             	add    $0x10,%esp
    2c82:	85 c0                	test   %eax,%eax
    2c84:	78 0c                	js     2c92 <iref+0x92>
      close(fd);
    2c86:	83 ec 0c             	sub    $0xc,%esp
    2c89:	50                   	push   %eax
    2c8a:	e8 e6 11 00 00       	call   3e75 <close>
    2c8f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c92:	83 ec 08             	sub    $0x8,%esp
    2c95:	68 00 02 00 00       	push   $0x200
    2c9a:	68 b0 4c 00 00       	push   $0x4cb0
    2c9f:	e8 e9 11 00 00       	call   3e8d <open>
    if(fd >= 0)
    2ca4:	83 c4 10             	add    $0x10,%esp
    2ca7:	85 c0                	test   %eax,%eax
    2ca9:	78 0c                	js     2cb7 <iref+0xb7>
      close(fd);
    2cab:	83 ec 0c             	sub    $0xc,%esp
    2cae:	50                   	push   %eax
    2caf:	e8 c1 11 00 00       	call   3e75 <close>
    2cb4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2cb7:	83 ec 0c             	sub    $0xc,%esp
    2cba:	68 b0 4c 00 00       	push   $0x4cb0
    2cbf:	e8 d9 11 00 00       	call   3e9d <unlink>
  for(i = 0; i < 50 + 1; i++){
    2cc4:	83 c4 10             	add    $0x10,%esp
    2cc7:	83 eb 01             	sub    $0x1,%ebx
    2cca:	0f 85 50 ff ff ff    	jne    2c20 <iref+0x20>
  chdir("/");
    2cd0:	83 ec 0c             	sub    $0xc,%esp
    2cd3:	68 a1 43 00 00       	push   $0x43a1
    2cd8:	e8 e0 11 00 00       	call   3ebd <chdir>
  printf(1, "empty file name OK\n");
    2cdd:	58                   	pop    %eax
    2cde:	5a                   	pop    %edx
    2cdf:	68 f4 50 00 00       	push   $0x50f4
    2ce4:	6a 01                	push   $0x1
    2ce6:	e8 05 13 00 00       	call   3ff0 <printf>
}
    2ceb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cee:	83 c4 10             	add    $0x10,%esp
    2cf1:	c9                   	leave  
    2cf2:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2cf3:	83 ec 08             	sub    $0x8,%esp
    2cf6:	68 cc 50 00 00       	push   $0x50cc
    2cfb:	6a 01                	push   $0x1
    2cfd:	e8 ee 12 00 00       	call   3ff0 <printf>
      exit();
    2d02:	e8 46 11 00 00       	call   3e4d <exit>
      printf(1, "chdir irefd failed\n");
    2d07:	83 ec 08             	sub    $0x8,%esp
    2d0a:	68 e0 50 00 00       	push   $0x50e0
    2d0f:	6a 01                	push   $0x1
    2d11:	e8 da 12 00 00       	call   3ff0 <printf>
      exit();
    2d16:	e8 32 11 00 00       	call   3e4d <exit>
    2d1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2d1f:	90                   	nop

00002d20 <forktest>:
{
    2d20:	f3 0f 1e fb          	endbr32 
    2d24:	55                   	push   %ebp
    2d25:	89 e5                	mov    %esp,%ebp
    2d27:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2d28:	31 db                	xor    %ebx,%ebx
{
    2d2a:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2d2d:	68 08 51 00 00       	push   $0x5108
    2d32:	6a 01                	push   $0x1
    2d34:	e8 b7 12 00 00       	call   3ff0 <printf>
    2d39:	83 c4 10             	add    $0x10,%esp
    2d3c:	eb 0f                	jmp    2d4d <forktest+0x2d>
    2d3e:	66 90                	xchg   %ax,%ax
    if(pid == 0)
    2d40:	74 4a                	je     2d8c <forktest+0x6c>
  for(n=0; n<1000; n++){
    2d42:	83 c3 01             	add    $0x1,%ebx
    2d45:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2d4b:	74 6b                	je     2db8 <forktest+0x98>
    pid = fork();
    2d4d:	e8 f3 10 00 00       	call   3e45 <fork>
    if(pid < 0)
    2d52:	85 c0                	test   %eax,%eax
    2d54:	79 ea                	jns    2d40 <forktest+0x20>
  for(; n > 0; n--){
    2d56:	85 db                	test   %ebx,%ebx
    2d58:	74 14                	je     2d6e <forktest+0x4e>
    2d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2d60:	e8 f0 10 00 00       	call   3e55 <wait>
    2d65:	85 c0                	test   %eax,%eax
    2d67:	78 28                	js     2d91 <forktest+0x71>
  for(; n > 0; n--){
    2d69:	83 eb 01             	sub    $0x1,%ebx
    2d6c:	75 f2                	jne    2d60 <forktest+0x40>
  if(wait() != -1){
    2d6e:	e8 e2 10 00 00       	call   3e55 <wait>
    2d73:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d76:	75 2d                	jne    2da5 <forktest+0x85>
  printf(1, "fork test OK\n");
    2d78:	83 ec 08             	sub    $0x8,%esp
    2d7b:	68 3a 51 00 00       	push   $0x513a
    2d80:	6a 01                	push   $0x1
    2d82:	e8 69 12 00 00       	call   3ff0 <printf>
}
    2d87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d8a:	c9                   	leave  
    2d8b:	c3                   	ret    
      exit();
    2d8c:	e8 bc 10 00 00       	call   3e4d <exit>
      printf(1, "wait stopped early\n");
    2d91:	83 ec 08             	sub    $0x8,%esp
    2d94:	68 13 51 00 00       	push   $0x5113
    2d99:	6a 01                	push   $0x1
    2d9b:	e8 50 12 00 00       	call   3ff0 <printf>
      exit();
    2da0:	e8 a8 10 00 00       	call   3e4d <exit>
    printf(1, "wait got too many\n");
    2da5:	52                   	push   %edx
    2da6:	52                   	push   %edx
    2da7:	68 27 51 00 00       	push   $0x5127
    2dac:	6a 01                	push   $0x1
    2dae:	e8 3d 12 00 00       	call   3ff0 <printf>
    exit();
    2db3:	e8 95 10 00 00       	call   3e4d <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    2db8:	50                   	push   %eax
    2db9:	50                   	push   %eax
    2dba:	68 a8 58 00 00       	push   $0x58a8
    2dbf:	6a 01                	push   $0x1
    2dc1:	e8 2a 12 00 00       	call   3ff0 <printf>
    exit();
    2dc6:	e8 82 10 00 00       	call   3e4d <exit>
    2dcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2dcf:	90                   	nop

00002dd0 <sbrktest>:
{
    2dd0:	f3 0f 1e fb          	endbr32 
    2dd4:	55                   	push   %ebp
    2dd5:	89 e5                	mov    %esp,%ebp
    2dd7:	57                   	push   %edi
  for(i = 0; i < 5000; i++){
    2dd8:	31 ff                	xor    %edi,%edi
{
    2dda:	56                   	push   %esi
    2ddb:	53                   	push   %ebx
    2ddc:	83 ec 54             	sub    $0x54,%esp
  printf(stdout, "sbrk test\n");
    2ddf:	68 48 51 00 00       	push   $0x5148
    2de4:	ff 35 98 65 00 00    	pushl  0x6598
    2dea:	e8 01 12 00 00       	call   3ff0 <printf>
  oldbrk = sbrk(0);
    2def:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2df6:	e8 da 10 00 00       	call   3ed5 <sbrk>
  a = sbrk(0);
    2dfb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2e02:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    2e04:	e8 cc 10 00 00       	call   3ed5 <sbrk>
    2e09:	83 c4 10             	add    $0x10,%esp
    2e0c:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 5000; i++){
    2e0e:	eb 02                	jmp    2e12 <sbrktest+0x42>
    a = b + 1;
    2e10:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    2e12:	83 ec 0c             	sub    $0xc,%esp
    2e15:	6a 01                	push   $0x1
    2e17:	e8 b9 10 00 00       	call   3ed5 <sbrk>
    if(b != a){
    2e1c:	83 c4 10             	add    $0x10,%esp
    2e1f:	39 f0                	cmp    %esi,%eax
    2e21:	0f 85 84 02 00 00    	jne    30ab <sbrktest+0x2db>
  for(i = 0; i < 5000; i++){
    2e27:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    2e2a:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    2e2d:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    2e30:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2e36:	75 d8                	jne    2e10 <sbrktest+0x40>
  pid = fork();
    2e38:	e8 08 10 00 00       	call   3e45 <fork>
    2e3d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2e3f:	85 c0                	test   %eax,%eax
    2e41:	0f 88 91 03 00 00    	js     31d8 <sbrktest+0x408>
  c = sbrk(1);
    2e47:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2e4a:	83 c6 02             	add    $0x2,%esi
  c = sbrk(1);
    2e4d:	6a 01                	push   $0x1
    2e4f:	e8 81 10 00 00       	call   3ed5 <sbrk>
  c = sbrk(1);
    2e54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e5b:	e8 75 10 00 00       	call   3ed5 <sbrk>
  if(c != a + 1){
    2e60:	83 c4 10             	add    $0x10,%esp
    2e63:	39 c6                	cmp    %eax,%esi
    2e65:	0f 85 56 03 00 00    	jne    31c1 <sbrktest+0x3f1>
  if(pid == 0)
    2e6b:	85 ff                	test   %edi,%edi
    2e6d:	0f 84 49 03 00 00    	je     31bc <sbrktest+0x3ec>
  wait();
    2e73:	e8 dd 0f 00 00       	call   3e55 <wait>
  a = sbrk(0);
    2e78:	83 ec 0c             	sub    $0xc,%esp
    2e7b:	6a 00                	push   $0x0
    2e7d:	e8 53 10 00 00       	call   3ed5 <sbrk>
    2e82:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    2e84:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e89:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    2e8b:	89 04 24             	mov    %eax,(%esp)
    2e8e:	e8 42 10 00 00       	call   3ed5 <sbrk>
  if (p != a) {
    2e93:	83 c4 10             	add    $0x10,%esp
    2e96:	39 c6                	cmp    %eax,%esi
    2e98:	0f 85 07 03 00 00    	jne    31a5 <sbrktest+0x3d5>
  a = sbrk(0);
    2e9e:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2ea1:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2ea8:	6a 00                	push   $0x0
    2eaa:	e8 26 10 00 00       	call   3ed5 <sbrk>
  c = sbrk(-4096);
    2eaf:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2eb6:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    2eb8:	e8 18 10 00 00       	call   3ed5 <sbrk>
  if(c == (char*)0xffffffff){
    2ebd:	83 c4 10             	add    $0x10,%esp
    2ec0:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ec3:	0f 84 c5 02 00 00    	je     318e <sbrktest+0x3be>
  c = sbrk(0);
    2ec9:	83 ec 0c             	sub    $0xc,%esp
    2ecc:	6a 00                	push   $0x0
    2ece:	e8 02 10 00 00       	call   3ed5 <sbrk>
  if(c != a - 4096){
    2ed3:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2ed9:	83 c4 10             	add    $0x10,%esp
    2edc:	39 d0                	cmp    %edx,%eax
    2ede:	0f 85 93 02 00 00    	jne    3177 <sbrktest+0x3a7>
  a = sbrk(0);
    2ee4:	83 ec 0c             	sub    $0xc,%esp
    2ee7:	6a 00                	push   $0x0
    2ee9:	e8 e7 0f 00 00       	call   3ed5 <sbrk>
  c = sbrk(4096);
    2eee:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    2ef5:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    2ef7:	e8 d9 0f 00 00       	call   3ed5 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2efc:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    2eff:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2f01:	39 c6                	cmp    %eax,%esi
    2f03:	0f 85 57 02 00 00    	jne    3160 <sbrktest+0x390>
    2f09:	83 ec 0c             	sub    $0xc,%esp
    2f0c:	6a 00                	push   $0x0
    2f0e:	e8 c2 0f 00 00       	call   3ed5 <sbrk>
    2f13:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2f19:	83 c4 10             	add    $0x10,%esp
    2f1c:	39 c2                	cmp    %eax,%edx
    2f1e:	0f 85 3c 02 00 00    	jne    3160 <sbrktest+0x390>
  if(*lastaddr == 99){
    2f24:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2f2b:	0f 84 18 02 00 00    	je     3149 <sbrktest+0x379>
  a = sbrk(0);
    2f31:	83 ec 0c             	sub    $0xc,%esp
    2f34:	6a 00                	push   $0x0
    2f36:	e8 9a 0f 00 00       	call   3ed5 <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2f3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2f42:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    2f44:	e8 8c 0f 00 00       	call   3ed5 <sbrk>
    2f49:	89 d9                	mov    %ebx,%ecx
    2f4b:	29 c1                	sub    %eax,%ecx
    2f4d:	89 0c 24             	mov    %ecx,(%esp)
    2f50:	e8 80 0f 00 00       	call   3ed5 <sbrk>
  if(c != a){
    2f55:	83 c4 10             	add    $0x10,%esp
    2f58:	39 c6                	cmp    %eax,%esi
    2f5a:	0f 85 d2 01 00 00    	jne    3132 <sbrktest+0x362>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f60:	be 00 00 00 80       	mov    $0x80000000,%esi
    2f65:	8d 76 00             	lea    0x0(%esi),%esi
    ppid = getpid();
    2f68:	e8 60 0f 00 00       	call   3ecd <getpid>
    2f6d:	89 c7                	mov    %eax,%edi
    pid = fork();
    2f6f:	e8 d1 0e 00 00       	call   3e45 <fork>
    if(pid < 0){
    2f74:	85 c0                	test   %eax,%eax
    2f76:	0f 88 9e 01 00 00    	js     311a <sbrktest+0x34a>
    if(pid == 0){
    2f7c:	0f 84 76 01 00 00    	je     30f8 <sbrktest+0x328>
    wait();
    2f82:	e8 ce 0e 00 00       	call   3e55 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f87:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    2f8d:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2f93:	75 d3                	jne    2f68 <sbrktest+0x198>
  if(pipe(fds) != 0){
    2f95:	83 ec 0c             	sub    $0xc,%esp
    2f98:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f9b:	50                   	push   %eax
    2f9c:	e8 bc 0e 00 00       	call   3e5d <pipe>
    2fa1:	83 c4 10             	add    $0x10,%esp
    2fa4:	85 c0                	test   %eax,%eax
    2fa6:	0f 85 34 01 00 00    	jne    30e0 <sbrktest+0x310>
    2fac:	8d 75 c0             	lea    -0x40(%ebp),%esi
    2faf:	89 f7                	mov    %esi,%edi
    if((pids[i] = fork()) == 0){
    2fb1:	e8 8f 0e 00 00       	call   3e45 <fork>
    2fb6:	89 07                	mov    %eax,(%edi)
    2fb8:	85 c0                	test   %eax,%eax
    2fba:	0f 84 8f 00 00 00    	je     304f <sbrktest+0x27f>
    if(pids[i] != -1)
    2fc0:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fc3:	74 14                	je     2fd9 <sbrktest+0x209>
      read(fds[0], &scratch, 1);
    2fc5:	83 ec 04             	sub    $0x4,%esp
    2fc8:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2fcb:	6a 01                	push   $0x1
    2fcd:	50                   	push   %eax
    2fce:	ff 75 b8             	pushl  -0x48(%ebp)
    2fd1:	e8 8f 0e 00 00       	call   3e65 <read>
    2fd6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fd9:	83 c7 04             	add    $0x4,%edi
    2fdc:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2fdf:	39 c7                	cmp    %eax,%edi
    2fe1:	75 ce                	jne    2fb1 <sbrktest+0x1e1>
  c = sbrk(4096);
    2fe3:	83 ec 0c             	sub    $0xc,%esp
    2fe6:	68 00 10 00 00       	push   $0x1000
    2feb:	e8 e5 0e 00 00       	call   3ed5 <sbrk>
    2ff0:	83 c4 10             	add    $0x10,%esp
    2ff3:	89 c7                	mov    %eax,%edi
    if(pids[i] == -1)
    2ff5:	8b 06                	mov    (%esi),%eax
    2ff7:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ffa:	74 11                	je     300d <sbrktest+0x23d>
    kill(pids[i]);
    2ffc:	83 ec 0c             	sub    $0xc,%esp
    2fff:	50                   	push   %eax
    3000:	e8 78 0e 00 00       	call   3e7d <kill>
    wait();
    3005:	e8 4b 0e 00 00       	call   3e55 <wait>
    300a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    300d:	83 c6 04             	add    $0x4,%esi
    3010:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3013:	39 f0                	cmp    %esi,%eax
    3015:	75 de                	jne    2ff5 <sbrktest+0x225>
  if(c == (char*)0xffffffff){
    3017:	83 ff ff             	cmp    $0xffffffff,%edi
    301a:	0f 84 a9 00 00 00    	je     30c9 <sbrktest+0x2f9>
  if(sbrk(0) > oldbrk)
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	6a 00                	push   $0x0
    3025:	e8 ab 0e 00 00       	call   3ed5 <sbrk>
    302a:	83 c4 10             	add    $0x10,%esp
    302d:	39 c3                	cmp    %eax,%ebx
    302f:	72 61                	jb     3092 <sbrktest+0x2c2>
  printf(stdout, "sbrk test OK\n");
    3031:	83 ec 08             	sub    $0x8,%esp
    3034:	68 f0 51 00 00       	push   $0x51f0
    3039:	ff 35 98 65 00 00    	pushl  0x6598
    303f:	e8 ac 0f 00 00       	call   3ff0 <printf>
}
    3044:	83 c4 10             	add    $0x10,%esp
    3047:	8d 65 f4             	lea    -0xc(%ebp),%esp
    304a:	5b                   	pop    %ebx
    304b:	5e                   	pop    %esi
    304c:	5f                   	pop    %edi
    304d:	5d                   	pop    %ebp
    304e:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    304f:	83 ec 0c             	sub    $0xc,%esp
    3052:	6a 00                	push   $0x0
    3054:	e8 7c 0e 00 00       	call   3ed5 <sbrk>
    3059:	89 c2                	mov    %eax,%edx
    305b:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3060:	29 d0                	sub    %edx,%eax
    3062:	89 04 24             	mov    %eax,(%esp)
    3065:	e8 6b 0e 00 00       	call   3ed5 <sbrk>
      write(fds[1], "x", 1);
    306a:	83 c4 0c             	add    $0xc,%esp
    306d:	6a 01                	push   $0x1
    306f:	68 b1 4c 00 00       	push   $0x4cb1
    3074:	ff 75 bc             	pushl  -0x44(%ebp)
    3077:	e8 f1 0d 00 00       	call   3e6d <write>
    307c:	83 c4 10             	add    $0x10,%esp
    307f:	90                   	nop
      for(;;) sleep(1000);
    3080:	83 ec 0c             	sub    $0xc,%esp
    3083:	68 e8 03 00 00       	push   $0x3e8
    3088:	e8 50 0e 00 00       	call   3edd <sleep>
    308d:	83 c4 10             	add    $0x10,%esp
    3090:	eb ee                	jmp    3080 <sbrktest+0x2b0>
    sbrk(-(sbrk(0) - oldbrk));
    3092:	83 ec 0c             	sub    $0xc,%esp
    3095:	6a 00                	push   $0x0
    3097:	e8 39 0e 00 00       	call   3ed5 <sbrk>
    309c:	29 c3                	sub    %eax,%ebx
    309e:	89 1c 24             	mov    %ebx,(%esp)
    30a1:	e8 2f 0e 00 00       	call   3ed5 <sbrk>
    30a6:	83 c4 10             	add    $0x10,%esp
    30a9:	eb 86                	jmp    3031 <sbrktest+0x261>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    30ab:	83 ec 0c             	sub    $0xc,%esp
    30ae:	50                   	push   %eax
    30af:	56                   	push   %esi
    30b0:	57                   	push   %edi
    30b1:	68 53 51 00 00       	push   $0x5153
    30b6:	ff 35 98 65 00 00    	pushl  0x6598
    30bc:	e8 2f 0f 00 00       	call   3ff0 <printf>
      exit();
    30c1:	83 c4 20             	add    $0x20,%esp
    30c4:	e8 84 0d 00 00       	call   3e4d <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    30c9:	50                   	push   %eax
    30ca:	50                   	push   %eax
    30cb:	68 d5 51 00 00       	push   $0x51d5
    30d0:	ff 35 98 65 00 00    	pushl  0x6598
    30d6:	e8 15 0f 00 00       	call   3ff0 <printf>
    exit();
    30db:	e8 6d 0d 00 00       	call   3e4d <exit>
    printf(1, "pipe() failed\n");
    30e0:	52                   	push   %edx
    30e1:	52                   	push   %edx
    30e2:	68 91 46 00 00       	push   $0x4691
    30e7:	6a 01                	push   $0x1
    30e9:	e8 02 0f 00 00       	call   3ff0 <printf>
    exit();
    30ee:	e8 5a 0d 00 00       	call   3e4d <exit>
    30f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    30f7:	90                   	nop
      printf(stdout, "oops could read %x = %x\n", a, *a);
    30f8:	0f be 06             	movsbl (%esi),%eax
    30fb:	50                   	push   %eax
    30fc:	56                   	push   %esi
    30fd:	68 bc 51 00 00       	push   $0x51bc
    3102:	ff 35 98 65 00 00    	pushl  0x6598
    3108:	e8 e3 0e 00 00       	call   3ff0 <printf>
      kill(ppid);
    310d:	89 3c 24             	mov    %edi,(%esp)
    3110:	e8 68 0d 00 00       	call   3e7d <kill>
      exit();
    3115:	e8 33 0d 00 00       	call   3e4d <exit>
      printf(stdout, "fork failed\n");
    311a:	83 ec 08             	sub    $0x8,%esp
    311d:	68 99 52 00 00       	push   $0x5299
    3122:	ff 35 98 65 00 00    	pushl  0x6598
    3128:	e8 c3 0e 00 00       	call   3ff0 <printf>
      exit();
    312d:	e8 1b 0d 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3132:	50                   	push   %eax
    3133:	56                   	push   %esi
    3134:	68 9c 59 00 00       	push   $0x599c
    3139:	ff 35 98 65 00 00    	pushl  0x6598
    313f:	e8 ac 0e 00 00       	call   3ff0 <printf>
    exit();
    3144:	e8 04 0d 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3149:	51                   	push   %ecx
    314a:	51                   	push   %ecx
    314b:	68 6c 59 00 00       	push   $0x596c
    3150:	ff 35 98 65 00 00    	pushl  0x6598
    3156:	e8 95 0e 00 00       	call   3ff0 <printf>
    exit();
    315b:	e8 ed 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3160:	57                   	push   %edi
    3161:	56                   	push   %esi
    3162:	68 44 59 00 00       	push   $0x5944
    3167:	ff 35 98 65 00 00    	pushl  0x6598
    316d:	e8 7e 0e 00 00       	call   3ff0 <printf>
    exit();
    3172:	e8 d6 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3177:	50                   	push   %eax
    3178:	56                   	push   %esi
    3179:	68 0c 59 00 00       	push   $0x590c
    317e:	ff 35 98 65 00 00    	pushl  0x6598
    3184:	e8 67 0e 00 00       	call   3ff0 <printf>
    exit();
    3189:	e8 bf 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk could not deallocate\n");
    318e:	53                   	push   %ebx
    318f:	53                   	push   %ebx
    3190:	68 a1 51 00 00       	push   $0x51a1
    3195:	ff 35 98 65 00 00    	pushl  0x6598
    319b:	e8 50 0e 00 00       	call   3ff0 <printf>
    exit();
    31a0:	e8 a8 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    31a5:	56                   	push   %esi
    31a6:	56                   	push   %esi
    31a7:	68 cc 58 00 00       	push   $0x58cc
    31ac:	ff 35 98 65 00 00    	pushl  0x6598
    31b2:	e8 39 0e 00 00       	call   3ff0 <printf>
    exit();
    31b7:	e8 91 0c 00 00       	call   3e4d <exit>
    exit();
    31bc:	e8 8c 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    31c1:	57                   	push   %edi
    31c2:	57                   	push   %edi
    31c3:	68 85 51 00 00       	push   $0x5185
    31c8:	ff 35 98 65 00 00    	pushl  0x6598
    31ce:	e8 1d 0e 00 00       	call   3ff0 <printf>
    exit();
    31d3:	e8 75 0c 00 00       	call   3e4d <exit>
    printf(stdout, "sbrk test fork failed\n");
    31d8:	50                   	push   %eax
    31d9:	50                   	push   %eax
    31da:	68 6e 51 00 00       	push   $0x516e
    31df:	ff 35 98 65 00 00    	pushl  0x6598
    31e5:	e8 06 0e 00 00       	call   3ff0 <printf>
    exit();
    31ea:	e8 5e 0c 00 00       	call   3e4d <exit>
    31ef:	90                   	nop

000031f0 <validateint>:
{
    31f0:	f3 0f 1e fb          	endbr32 
}
    31f4:	c3                   	ret    
    31f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <validatetest>:
{
    3200:	f3 0f 1e fb          	endbr32 
    3204:	55                   	push   %ebp
    3205:	89 e5                	mov    %esp,%ebp
    3207:	56                   	push   %esi
  for(p = 0; p <= (uint)hi; p += 4096){
    3208:	31 f6                	xor    %esi,%esi
{
    320a:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    320b:	83 ec 08             	sub    $0x8,%esp
    320e:	68 fe 51 00 00       	push   $0x51fe
    3213:	ff 35 98 65 00 00    	pushl  0x6598
    3219:	e8 d2 0d 00 00       	call   3ff0 <printf>
    321e:	83 c4 10             	add    $0x10,%esp
    3221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if((pid = fork()) == 0){
    3228:	e8 18 0c 00 00       	call   3e45 <fork>
    322d:	89 c3                	mov    %eax,%ebx
    322f:	85 c0                	test   %eax,%eax
    3231:	74 63                	je     3296 <validatetest+0x96>
    sleep(0);
    3233:	83 ec 0c             	sub    $0xc,%esp
    3236:	6a 00                	push   $0x0
    3238:	e8 a0 0c 00 00       	call   3edd <sleep>
    sleep(0);
    323d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3244:	e8 94 0c 00 00       	call   3edd <sleep>
    kill(pid);
    3249:	89 1c 24             	mov    %ebx,(%esp)
    324c:	e8 2c 0c 00 00       	call   3e7d <kill>
    wait();
    3251:	e8 ff 0b 00 00       	call   3e55 <wait>
    if(link("nosuchfile", (char*)p) != -1){
    3256:	58                   	pop    %eax
    3257:	5a                   	pop    %edx
    3258:	56                   	push   %esi
    3259:	68 0d 52 00 00       	push   $0x520d
    325e:	e8 4a 0c 00 00       	call   3ead <link>
    3263:	83 c4 10             	add    $0x10,%esp
    3266:	83 f8 ff             	cmp    $0xffffffff,%eax
    3269:	75 30                	jne    329b <validatetest+0x9b>
  for(p = 0; p <= (uint)hi; p += 4096){
    326b:	81 c6 00 10 00 00    	add    $0x1000,%esi
    3271:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    3277:	75 af                	jne    3228 <validatetest+0x28>
  printf(stdout, "validate ok\n");
    3279:	83 ec 08             	sub    $0x8,%esp
    327c:	68 31 52 00 00       	push   $0x5231
    3281:	ff 35 98 65 00 00    	pushl  0x6598
    3287:	e8 64 0d 00 00       	call   3ff0 <printf>
}
    328c:	83 c4 10             	add    $0x10,%esp
    328f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3292:	5b                   	pop    %ebx
    3293:	5e                   	pop    %esi
    3294:	5d                   	pop    %ebp
    3295:	c3                   	ret    
      exit();
    3296:	e8 b2 0b 00 00       	call   3e4d <exit>
      printf(stdout, "link should not succeed\n");
    329b:	83 ec 08             	sub    $0x8,%esp
    329e:	68 18 52 00 00       	push   $0x5218
    32a3:	ff 35 98 65 00 00    	pushl  0x6598
    32a9:	e8 42 0d 00 00       	call   3ff0 <printf>
      exit();
    32ae:	e8 9a 0b 00 00       	call   3e4d <exit>
    32b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    32ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000032c0 <bsstest>:
{
    32c0:	f3 0f 1e fb          	endbr32 
    32c4:	55                   	push   %ebp
    32c5:	89 e5                	mov    %esp,%ebp
    32c7:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    32ca:	68 3e 52 00 00       	push   $0x523e
    32cf:	ff 35 98 65 00 00    	pushl  0x6598
    32d5:	e8 16 0d 00 00       	call   3ff0 <printf>
    32da:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    32dd:	31 c0                	xor    %eax,%eax
    32df:	90                   	nop
    if(uninit[i] != '\0'){
    32e0:	80 b8 60 66 00 00 00 	cmpb   $0x0,0x6660(%eax)
    32e7:	75 22                	jne    330b <bsstest+0x4b>
  for(i = 0; i < sizeof(uninit); i++){
    32e9:	83 c0 01             	add    $0x1,%eax
    32ec:	3d 10 27 00 00       	cmp    $0x2710,%eax
    32f1:	75 ed                	jne    32e0 <bsstest+0x20>
  printf(stdout, "bss test ok\n");
    32f3:	83 ec 08             	sub    $0x8,%esp
    32f6:	68 59 52 00 00       	push   $0x5259
    32fb:	ff 35 98 65 00 00    	pushl  0x6598
    3301:	e8 ea 0c 00 00       	call   3ff0 <printf>
}
    3306:	83 c4 10             	add    $0x10,%esp
    3309:	c9                   	leave  
    330a:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    330b:	83 ec 08             	sub    $0x8,%esp
    330e:	68 48 52 00 00       	push   $0x5248
    3313:	ff 35 98 65 00 00    	pushl  0x6598
    3319:	e8 d2 0c 00 00       	call   3ff0 <printf>
      exit();
    331e:	e8 2a 0b 00 00       	call   3e4d <exit>
    3323:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    332a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003330 <bigargtest>:
{
    3330:	f3 0f 1e fb          	endbr32 
    3334:	55                   	push   %ebp
    3335:	89 e5                	mov    %esp,%ebp
    3337:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    333a:	68 66 52 00 00       	push   $0x5266
    333f:	e8 59 0b 00 00       	call   3e9d <unlink>
  pid = fork();
    3344:	e8 fc 0a 00 00       	call   3e45 <fork>
  if(pid == 0){
    3349:	83 c4 10             	add    $0x10,%esp
    334c:	85 c0                	test   %eax,%eax
    334e:	74 40                	je     3390 <bigargtest+0x60>
  } else if(pid < 0){
    3350:	0f 88 c1 00 00 00    	js     3417 <bigargtest+0xe7>
  wait();
    3356:	e8 fa 0a 00 00       	call   3e55 <wait>
  fd = open("bigarg-ok", 0);
    335b:	83 ec 08             	sub    $0x8,%esp
    335e:	6a 00                	push   $0x0
    3360:	68 66 52 00 00       	push   $0x5266
    3365:	e8 23 0b 00 00       	call   3e8d <open>
  if(fd < 0){
    336a:	83 c4 10             	add    $0x10,%esp
    336d:	85 c0                	test   %eax,%eax
    336f:	0f 88 8b 00 00 00    	js     3400 <bigargtest+0xd0>
  close(fd);
    3375:	83 ec 0c             	sub    $0xc,%esp
    3378:	50                   	push   %eax
    3379:	e8 f7 0a 00 00       	call   3e75 <close>
  unlink("bigarg-ok");
    337e:	c7 04 24 66 52 00 00 	movl   $0x5266,(%esp)
    3385:	e8 13 0b 00 00       	call   3e9d <unlink>
}
    338a:	83 c4 10             	add    $0x10,%esp
    338d:	c9                   	leave  
    338e:	c3                   	ret    
    338f:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3390:	c7 04 85 c0 65 00 00 	movl   $0x59c0,0x65c0(,%eax,4)
    3397:	c0 59 00 00 
    for(i = 0; i < MAXARG-1; i++)
    339b:	83 c0 01             	add    $0x1,%eax
    339e:	83 f8 1f             	cmp    $0x1f,%eax
    33a1:	75 ed                	jne    3390 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    33a3:	51                   	push   %ecx
    33a4:	51                   	push   %ecx
    33a5:	68 70 52 00 00       	push   $0x5270
    33aa:	ff 35 98 65 00 00    	pushl  0x6598
    args[MAXARG-1] = 0;
    33b0:	c7 05 3c 66 00 00 00 	movl   $0x0,0x663c
    33b7:	00 00 00 
    printf(stdout, "bigarg test\n");
    33ba:	e8 31 0c 00 00       	call   3ff0 <printf>
    exec("echo", args);
    33bf:	58                   	pop    %eax
    33c0:	5a                   	pop    %edx
    33c1:	68 c0 65 00 00       	push   $0x65c0
    33c6:	68 3d 44 00 00       	push   $0x443d
    33cb:	e8 b5 0a 00 00       	call   3e85 <exec>
    printf(stdout, "bigarg test ok\n");
    33d0:	59                   	pop    %ecx
    33d1:	58                   	pop    %eax
    33d2:	68 7d 52 00 00       	push   $0x527d
    33d7:	ff 35 98 65 00 00    	pushl  0x6598
    33dd:	e8 0e 0c 00 00       	call   3ff0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    33e2:	58                   	pop    %eax
    33e3:	5a                   	pop    %edx
    33e4:	68 00 02 00 00       	push   $0x200
    33e9:	68 66 52 00 00       	push   $0x5266
    33ee:	e8 9a 0a 00 00       	call   3e8d <open>
    close(fd);
    33f3:	89 04 24             	mov    %eax,(%esp)
    33f6:	e8 7a 0a 00 00       	call   3e75 <close>
    exit();
    33fb:	e8 4d 0a 00 00       	call   3e4d <exit>
    printf(stdout, "bigarg test failed!\n");
    3400:	50                   	push   %eax
    3401:	50                   	push   %eax
    3402:	68 a6 52 00 00       	push   $0x52a6
    3407:	ff 35 98 65 00 00    	pushl  0x6598
    340d:	e8 de 0b 00 00       	call   3ff0 <printf>
    exit();
    3412:	e8 36 0a 00 00       	call   3e4d <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3417:	52                   	push   %edx
    3418:	52                   	push   %edx
    3419:	68 8d 52 00 00       	push   $0x528d
    341e:	ff 35 98 65 00 00    	pushl  0x6598
    3424:	e8 c7 0b 00 00       	call   3ff0 <printf>
    exit();
    3429:	e8 1f 0a 00 00       	call   3e4d <exit>
    342e:	66 90                	xchg   %ax,%ax

00003430 <fsfull>:
{
    3430:	f3 0f 1e fb          	endbr32 
    3434:	55                   	push   %ebp
    3435:	89 e5                	mov    %esp,%ebp
    3437:	57                   	push   %edi
    3438:	56                   	push   %esi
  for(nfiles = 0; ; nfiles++){
    3439:	31 f6                	xor    %esi,%esi
{
    343b:	53                   	push   %ebx
    343c:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    343f:	68 bb 52 00 00       	push   $0x52bb
    3444:	6a 01                	push   $0x1
    3446:	e8 a5 0b 00 00       	call   3ff0 <printf>
    344b:	83 c4 10             	add    $0x10,%esp
    344e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + nfiles / 1000;
    3450:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3455:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    345a:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    345d:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3461:	f7 e6                	mul    %esi
    name[5] = '\0';
    3463:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3467:	c1 ea 06             	shr    $0x6,%edx
    346a:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    346d:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3473:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3476:	89 f0                	mov    %esi,%eax
    3478:	29 d0                	sub    %edx,%eax
    347a:	89 c2                	mov    %eax,%edx
    347c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3481:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    3483:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3488:	c1 ea 05             	shr    $0x5,%edx
    348b:	83 c2 30             	add    $0x30,%edx
    348e:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3491:	f7 e6                	mul    %esi
    3493:	89 f0                	mov    %esi,%eax
    3495:	c1 ea 05             	shr    $0x5,%edx
    3498:	6b d2 64             	imul   $0x64,%edx,%edx
    349b:	29 d0                	sub    %edx,%eax
    349d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    349f:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    34a1:	c1 ea 03             	shr    $0x3,%edx
    34a4:	83 c2 30             	add    $0x30,%edx
    34a7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    34aa:	f7 e1                	mul    %ecx
    34ac:	89 f1                	mov    %esi,%ecx
    34ae:	c1 ea 03             	shr    $0x3,%edx
    34b1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    34b4:	01 c0                	add    %eax,%eax
    34b6:	29 c1                	sub    %eax,%ecx
    34b8:	89 c8                	mov    %ecx,%eax
    34ba:	83 c0 30             	add    $0x30,%eax
    34bd:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    34c0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34c3:	50                   	push   %eax
    34c4:	68 c8 52 00 00       	push   $0x52c8
    34c9:	6a 01                	push   $0x1
    34cb:	e8 20 0b 00 00       	call   3ff0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    34d0:	58                   	pop    %eax
    34d1:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34d4:	5a                   	pop    %edx
    34d5:	68 02 02 00 00       	push   $0x202
    34da:	50                   	push   %eax
    34db:	e8 ad 09 00 00       	call   3e8d <open>
    if(fd < 0){
    34e0:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    34e3:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    34e5:	85 c0                	test   %eax,%eax
    34e7:	78 4d                	js     3536 <fsfull+0x106>
    int total = 0;
    34e9:	31 db                	xor    %ebx,%ebx
    34eb:	eb 05                	jmp    34f2 <fsfull+0xc2>
    34ed:	8d 76 00             	lea    0x0(%esi),%esi
      total += cc;
    34f0:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    34f2:	83 ec 04             	sub    $0x4,%esp
    34f5:	68 00 02 00 00       	push   $0x200
    34fa:	68 80 8d 00 00       	push   $0x8d80
    34ff:	57                   	push   %edi
    3500:	e8 68 09 00 00       	call   3e6d <write>
      if(cc < 512)
    3505:	83 c4 10             	add    $0x10,%esp
    3508:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    350d:	7f e1                	jg     34f0 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    350f:	83 ec 04             	sub    $0x4,%esp
    3512:	53                   	push   %ebx
    3513:	68 e4 52 00 00       	push   $0x52e4
    3518:	6a 01                	push   $0x1
    351a:	e8 d1 0a 00 00       	call   3ff0 <printf>
    close(fd);
    351f:	89 3c 24             	mov    %edi,(%esp)
    3522:	e8 4e 09 00 00       	call   3e75 <close>
    if(total == 0)
    3527:	83 c4 10             	add    $0x10,%esp
    352a:	85 db                	test   %ebx,%ebx
    352c:	74 1e                	je     354c <fsfull+0x11c>
  for(nfiles = 0; ; nfiles++){
    352e:	83 c6 01             	add    $0x1,%esi
    3531:	e9 1a ff ff ff       	jmp    3450 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    3536:	83 ec 04             	sub    $0x4,%esp
    3539:	8d 45 a8             	lea    -0x58(%ebp),%eax
    353c:	50                   	push   %eax
    353d:	68 d4 52 00 00       	push   $0x52d4
    3542:	6a 01                	push   $0x1
    3544:	e8 a7 0a 00 00       	call   3ff0 <printf>
      break;
    3549:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    354c:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    3551:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    3556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    355d:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3560:	89 f0                	mov    %esi,%eax
    3562:	89 f1                	mov    %esi,%ecx
    unlink(name);
    3564:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    3567:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    356b:	f7 ef                	imul   %edi
    356d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[5] = '\0';
    3570:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3574:	c1 fa 06             	sar    $0x6,%edx
    3577:	29 ca                	sub    %ecx,%edx
    3579:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    357c:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3582:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3585:	89 f0                	mov    %esi,%eax
    3587:	29 d0                	sub    %edx,%eax
    3589:	f7 e3                	mul    %ebx
    name[3] = '0' + (nfiles % 100) / 10;
    358b:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    358d:	c1 ea 05             	shr    $0x5,%edx
    3590:	83 c2 30             	add    $0x30,%edx
    3593:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3596:	f7 eb                	imul   %ebx
    3598:	89 f0                	mov    %esi,%eax
    359a:	c1 fa 05             	sar    $0x5,%edx
    359d:	29 ca                	sub    %ecx,%edx
    359f:	6b d2 64             	imul   $0x64,%edx,%edx
    35a2:	29 d0                	sub    %edx,%eax
    35a4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    35a9:	f7 e2                	mul    %edx
    name[4] = '0' + (nfiles % 10);
    35ab:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    35ad:	c1 ea 03             	shr    $0x3,%edx
    35b0:	83 c2 30             	add    $0x30,%edx
    35b3:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    35b6:	ba 67 66 66 66       	mov    $0x66666667,%edx
    35bb:	f7 ea                	imul   %edx
    35bd:	c1 fa 02             	sar    $0x2,%edx
    35c0:	29 ca                	sub    %ecx,%edx
    35c2:	89 f1                	mov    %esi,%ecx
    nfiles--;
    35c4:	83 ee 01             	sub    $0x1,%esi
    name[4] = '0' + (nfiles % 10);
    35c7:	8d 04 92             	lea    (%edx,%edx,4),%eax
    35ca:	01 c0                	add    %eax,%eax
    35cc:	29 c1                	sub    %eax,%ecx
    35ce:	89 c8                	mov    %ecx,%eax
    35d0:	83 c0 30             	add    $0x30,%eax
    35d3:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    35d6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    35d9:	50                   	push   %eax
    35da:	e8 be 08 00 00       	call   3e9d <unlink>
  while(nfiles >= 0){
    35df:	83 c4 10             	add    $0x10,%esp
    35e2:	83 fe ff             	cmp    $0xffffffff,%esi
    35e5:	0f 85 75 ff ff ff    	jne    3560 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    35eb:	83 ec 08             	sub    $0x8,%esp
    35ee:	68 f4 52 00 00       	push   $0x52f4
    35f3:	6a 01                	push   $0x1
    35f5:	e8 f6 09 00 00       	call   3ff0 <printf>
}
    35fa:	83 c4 10             	add    $0x10,%esp
    35fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3600:	5b                   	pop    %ebx
    3601:	5e                   	pop    %esi
    3602:	5f                   	pop    %edi
    3603:	5d                   	pop    %ebp
    3604:	c3                   	ret    
    3605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    360c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003610 <uio>:
{
    3610:	f3 0f 1e fb          	endbr32 
    3614:	55                   	push   %ebp
    3615:	89 e5                	mov    %esp,%ebp
    3617:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    361a:	68 0a 53 00 00       	push   $0x530a
    361f:	6a 01                	push   $0x1
    3621:	e8 ca 09 00 00       	call   3ff0 <printf>
  pid = fork();
    3626:	e8 1a 08 00 00       	call   3e45 <fork>
  if(pid == 0){
    362b:	83 c4 10             	add    $0x10,%esp
    362e:	85 c0                	test   %eax,%eax
    3630:	74 1b                	je     364d <uio+0x3d>
  } else if(pid < 0){
    3632:	78 3d                	js     3671 <uio+0x61>
  wait();
    3634:	e8 1c 08 00 00       	call   3e55 <wait>
  printf(1, "uio test done\n");
    3639:	83 ec 08             	sub    $0x8,%esp
    363c:	68 14 53 00 00       	push   $0x5314
    3641:	6a 01                	push   $0x1
    3643:	e8 a8 09 00 00       	call   3ff0 <printf>
}
    3648:	83 c4 10             	add    $0x10,%esp
    364b:	c9                   	leave  
    364c:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    364d:	b8 09 00 00 00       	mov    $0x9,%eax
    3652:	ba 70 00 00 00       	mov    $0x70,%edx
    3657:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3658:	ba 71 00 00 00       	mov    $0x71,%edx
    365d:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    365e:	52                   	push   %edx
    365f:	52                   	push   %edx
    3660:	68 a0 5a 00 00       	push   $0x5aa0
    3665:	6a 01                	push   $0x1
    3667:	e8 84 09 00 00       	call   3ff0 <printf>
    exit();
    366c:	e8 dc 07 00 00       	call   3e4d <exit>
    printf (1, "fork failed\n");
    3671:	50                   	push   %eax
    3672:	50                   	push   %eax
    3673:	68 99 52 00 00       	push   $0x5299
    3678:	6a 01                	push   $0x1
    367a:	e8 71 09 00 00       	call   3ff0 <printf>
    exit();
    367f:	e8 c9 07 00 00       	call   3e4d <exit>
    3684:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    368b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    368f:	90                   	nop

00003690 <argptest>:
{
    3690:	f3 0f 1e fb          	endbr32 
    3694:	55                   	push   %ebp
    3695:	89 e5                	mov    %esp,%ebp
    3697:	53                   	push   %ebx
    3698:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    369b:	6a 00                	push   $0x0
    369d:	68 23 53 00 00       	push   $0x5323
    36a2:	e8 e6 07 00 00       	call   3e8d <open>
  if (fd < 0) {
    36a7:	83 c4 10             	add    $0x10,%esp
    36aa:	85 c0                	test   %eax,%eax
    36ac:	78 39                	js     36e7 <argptest+0x57>
  read(fd, sbrk(0) - 1, -1);
    36ae:	83 ec 0c             	sub    $0xc,%esp
    36b1:	89 c3                	mov    %eax,%ebx
    36b3:	6a 00                	push   $0x0
    36b5:	e8 1b 08 00 00       	call   3ed5 <sbrk>
    36ba:	83 c4 0c             	add    $0xc,%esp
    36bd:	83 e8 01             	sub    $0x1,%eax
    36c0:	6a ff                	push   $0xffffffff
    36c2:	50                   	push   %eax
    36c3:	53                   	push   %ebx
    36c4:	e8 9c 07 00 00       	call   3e65 <read>
  close(fd);
    36c9:	89 1c 24             	mov    %ebx,(%esp)
    36cc:	e8 a4 07 00 00       	call   3e75 <close>
  printf(1, "arg test passed\n");
    36d1:	58                   	pop    %eax
    36d2:	5a                   	pop    %edx
    36d3:	68 35 53 00 00       	push   $0x5335
    36d8:	6a 01                	push   $0x1
    36da:	e8 11 09 00 00       	call   3ff0 <printf>
}
    36df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36e2:	83 c4 10             	add    $0x10,%esp
    36e5:	c9                   	leave  
    36e6:	c3                   	ret    
    printf(2, "open failed\n");
    36e7:	51                   	push   %ecx
    36e8:	51                   	push   %ecx
    36e9:	68 28 53 00 00       	push   $0x5328
    36ee:	6a 02                	push   $0x2
    36f0:	e8 fb 08 00 00       	call   3ff0 <printf>
    exit();
    36f5:	e8 53 07 00 00       	call   3e4d <exit>
    36fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003700 <rand>:
{
    3700:	f3 0f 1e fb          	endbr32 
  randstate = randstate * 1664525 + 1013904223;
    3704:	69 05 94 65 00 00 0d 	imul   $0x19660d,0x6594,%eax
    370b:	66 19 00 
    370e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3713:	a3 94 65 00 00       	mov    %eax,0x6594
}
    3718:	c3                   	ret    
    3719:	66 90                	xchg   %ax,%ax
    371b:	66 90                	xchg   %ax,%ax
    371d:	66 90                	xchg   %ax,%ax
    371f:	90                   	nop

00003720 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3720:	f3 0f 1e fb          	endbr32 
    3724:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3725:	31 c0                	xor    %eax,%eax
{
    3727:	89 e5                	mov    %esp,%ebp
    3729:	53                   	push   %ebx
    372a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    372d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    3730:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    3734:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    3737:	83 c0 01             	add    $0x1,%eax
    373a:	84 d2                	test   %dl,%dl
    373c:	75 f2                	jne    3730 <strcpy+0x10>
    ;
  return os;
}
    373e:	89 c8                	mov    %ecx,%eax
    3740:	5b                   	pop    %ebx
    3741:	5d                   	pop    %ebp
    3742:	c3                   	ret    
    3743:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    374a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003750 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
    3750:	f3 0f 1e fb          	endbr32 
    3754:	55                   	push   %ebp
    3755:	89 e5                	mov    %esp,%ebp
    3757:	57                   	push   %edi
    3758:	8b 7d 10             	mov    0x10(%ebp),%edi
    375b:	56                   	push   %esi
    375c:	8b 75 08             	mov    0x8(%ebp),%esi
    375f:	53                   	push   %ebx
    3760:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
    3763:	85 ff                	test   %edi,%edi
    3765:	74 39                	je     37a0 <strcat_s+0x50>
    3767:	31 c0                	xor    %eax,%eax
    3769:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    376e:	eb 11                	jmp    3781 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
    3770:	0f b6 12             	movzbl (%edx),%edx
    3773:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
    3776:	84 d2                	test   %dl,%dl
    3778:	74 26                	je     37a0 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
    377a:	83 c0 01             	add    $0x1,%eax
    377d:	39 c7                	cmp    %eax,%edi
    377f:	74 1f                	je     37a0 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
    3781:	89 c2                	mov    %eax,%edx
    3783:	29 ca                	sub    %ecx,%edx
    3785:	01 da                	add    %ebx,%edx
    3787:	83 f9 ff             	cmp    $0xffffffff,%ecx
    378a:	75 e4                	jne    3770 <strcat_s+0x20>
    378c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
    3790:	75 e8                	jne    377a <strcat_s+0x2a>
    3792:	89 da                	mov    %ebx,%edx
    3794:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
    3796:	0f b6 12             	movzbl (%edx),%edx
    3799:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
    379c:	84 d2                	test   %dl,%dl
    379e:	75 da                	jne    377a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
    37a0:	5b                   	pop    %ebx
    37a1:	89 f0                	mov    %esi,%eax
    37a3:	5e                   	pop    %esi
    37a4:	5f                   	pop    %edi
    37a5:	5d                   	pop    %ebp
    37a6:	c3                   	ret    
    37a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37ae:	66 90                	xchg   %ax,%ax

000037b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    37b0:	f3 0f 1e fb          	endbr32 
    37b4:	55                   	push   %ebp
    37b5:	89 e5                	mov    %esp,%ebp
    37b7:	53                   	push   %ebx
    37b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    37bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    37be:	0f b6 01             	movzbl (%ecx),%eax
    37c1:	0f b6 1a             	movzbl (%edx),%ebx
    37c4:	84 c0                	test   %al,%al
    37c6:	75 19                	jne    37e1 <strcmp+0x31>
    37c8:	eb 26                	jmp    37f0 <strcmp+0x40>
    37ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    37d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    37d4:	83 c1 01             	add    $0x1,%ecx
    37d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    37da:	0f b6 1a             	movzbl (%edx),%ebx
    37dd:	84 c0                	test   %al,%al
    37df:	74 0f                	je     37f0 <strcmp+0x40>
    37e1:	38 d8                	cmp    %bl,%al
    37e3:	74 eb                	je     37d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    37e5:	29 d8                	sub    %ebx,%eax
}
    37e7:	5b                   	pop    %ebx
    37e8:	5d                   	pop    %ebp
    37e9:	c3                   	ret    
    37ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    37f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    37f2:	29 d8                	sub    %ebx,%eax
}
    37f4:	5b                   	pop    %ebx
    37f5:	5d                   	pop    %ebp
    37f6:	c3                   	ret    
    37f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37fe:	66 90                	xchg   %ax,%ax

00003800 <strlen>:

uint
strlen(const char *s)
{
    3800:	f3 0f 1e fb          	endbr32 
    3804:	55                   	push   %ebp
    3805:	89 e5                	mov    %esp,%ebp
    3807:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    380a:	80 3a 00             	cmpb   $0x0,(%edx)
    380d:	74 21                	je     3830 <strlen+0x30>
    380f:	31 c0                	xor    %eax,%eax
    3811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3818:	83 c0 01             	add    $0x1,%eax
    381b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    381f:	89 c1                	mov    %eax,%ecx
    3821:	75 f5                	jne    3818 <strlen+0x18>
    ;
  return n;
}
    3823:	89 c8                	mov    %ecx,%eax
    3825:	5d                   	pop    %ebp
    3826:	c3                   	ret    
    3827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    382e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    3830:	31 c9                	xor    %ecx,%ecx
}
    3832:	5d                   	pop    %ebp
    3833:	89 c8                	mov    %ecx,%eax
    3835:	c3                   	ret    
    3836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    383d:	8d 76 00             	lea    0x0(%esi),%esi

00003840 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3840:	f3 0f 1e fb          	endbr32 
    3844:	55                   	push   %ebp
    3845:	89 e5                	mov    %esp,%ebp
    3847:	57                   	push   %edi
    3848:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    384b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    384e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3851:	89 d7                	mov    %edx,%edi
    3853:	fc                   	cld    
    3854:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3856:	89 d0                	mov    %edx,%eax
    3858:	5f                   	pop    %edi
    3859:	5d                   	pop    %ebp
    385a:	c3                   	ret    
    385b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    385f:	90                   	nop

00003860 <strchr>:

char*
strchr(const char *s, char c)
{
    3860:	f3 0f 1e fb          	endbr32 
    3864:	55                   	push   %ebp
    3865:	89 e5                	mov    %esp,%ebp
    3867:	8b 45 08             	mov    0x8(%ebp),%eax
    386a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    386e:	0f b6 10             	movzbl (%eax),%edx
    3871:	84 d2                	test   %dl,%dl
    3873:	75 16                	jne    388b <strchr+0x2b>
    3875:	eb 21                	jmp    3898 <strchr+0x38>
    3877:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    387e:	66 90                	xchg   %ax,%ax
    3880:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    3884:	83 c0 01             	add    $0x1,%eax
    3887:	84 d2                	test   %dl,%dl
    3889:	74 0d                	je     3898 <strchr+0x38>
    if(*s == c)
    388b:	38 d1                	cmp    %dl,%cl
    388d:	75 f1                	jne    3880 <strchr+0x20>
      return (char*)s;
  return 0;
}
    388f:	5d                   	pop    %ebp
    3890:	c3                   	ret    
    3891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    3898:	31 c0                	xor    %eax,%eax
}
    389a:	5d                   	pop    %ebp
    389b:	c3                   	ret    
    389c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000038a0 <gets>:

char*
gets(char *buf, int max)
{
    38a0:	f3 0f 1e fb          	endbr32 
    38a4:	55                   	push   %ebp
    38a5:	89 e5                	mov    %esp,%ebp
    38a7:	57                   	push   %edi
    38a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    38a9:	31 f6                	xor    %esi,%esi
{
    38ab:	53                   	push   %ebx
    38ac:	89 f3                	mov    %esi,%ebx
    38ae:	83 ec 1c             	sub    $0x1c,%esp
    38b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    38b4:	eb 33                	jmp    38e9 <gets+0x49>
    38b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    38bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    38c0:	83 ec 04             	sub    $0x4,%esp
    38c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    38c6:	6a 01                	push   $0x1
    38c8:	50                   	push   %eax
    38c9:	6a 00                	push   $0x0
    38cb:	e8 95 05 00 00       	call   3e65 <read>
    if(cc < 1)
    38d0:	83 c4 10             	add    $0x10,%esp
    38d3:	85 c0                	test   %eax,%eax
    38d5:	7e 1c                	jle    38f3 <gets+0x53>
      break;
    buf[i++] = c;
    38d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    38db:	83 c7 01             	add    $0x1,%edi
    38de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    38e1:	3c 0a                	cmp    $0xa,%al
    38e3:	74 23                	je     3908 <gets+0x68>
    38e5:	3c 0d                	cmp    $0xd,%al
    38e7:	74 1f                	je     3908 <gets+0x68>
  for(i=0; i+1 < max; ){
    38e9:	83 c3 01             	add    $0x1,%ebx
    38ec:	89 fe                	mov    %edi,%esi
    38ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    38f1:	7c cd                	jl     38c0 <gets+0x20>
    38f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    38f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    38f8:	c6 03 00             	movb   $0x0,(%ebx)
}
    38fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    38fe:	5b                   	pop    %ebx
    38ff:	5e                   	pop    %esi
    3900:	5f                   	pop    %edi
    3901:	5d                   	pop    %ebp
    3902:	c3                   	ret    
    3903:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3907:	90                   	nop
    3908:	8b 75 08             	mov    0x8(%ebp),%esi
    390b:	8b 45 08             	mov    0x8(%ebp),%eax
    390e:	01 de                	add    %ebx,%esi
    3910:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    3912:	c6 03 00             	movb   $0x0,(%ebx)
}
    3915:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3918:	5b                   	pop    %ebx
    3919:	5e                   	pop    %esi
    391a:	5f                   	pop    %edi
    391b:	5d                   	pop    %ebp
    391c:	c3                   	ret    
    391d:	8d 76 00             	lea    0x0(%esi),%esi

00003920 <stat>:

int
stat(const char *n, struct stat *st)
{
    3920:	f3 0f 1e fb          	endbr32 
    3924:	55                   	push   %ebp
    3925:	89 e5                	mov    %esp,%ebp
    3927:	56                   	push   %esi
    3928:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3929:	83 ec 08             	sub    $0x8,%esp
    392c:	6a 00                	push   $0x0
    392e:	ff 75 08             	pushl  0x8(%ebp)
    3931:	e8 57 05 00 00       	call   3e8d <open>
  if(fd < 0)
    3936:	83 c4 10             	add    $0x10,%esp
    3939:	85 c0                	test   %eax,%eax
    393b:	78 2b                	js     3968 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    393d:	83 ec 08             	sub    $0x8,%esp
    3940:	ff 75 0c             	pushl  0xc(%ebp)
    3943:	89 c3                	mov    %eax,%ebx
    3945:	50                   	push   %eax
    3946:	e8 5a 05 00 00       	call   3ea5 <fstat>
  close(fd);
    394b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    394e:	89 c6                	mov    %eax,%esi
  close(fd);
    3950:	e8 20 05 00 00       	call   3e75 <close>
  return r;
    3955:	83 c4 10             	add    $0x10,%esp
}
    3958:	8d 65 f8             	lea    -0x8(%ebp),%esp
    395b:	89 f0                	mov    %esi,%eax
    395d:	5b                   	pop    %ebx
    395e:	5e                   	pop    %esi
    395f:	5d                   	pop    %ebp
    3960:	c3                   	ret    
    3961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    3968:	be ff ff ff ff       	mov    $0xffffffff,%esi
    396d:	eb e9                	jmp    3958 <stat+0x38>
    396f:	90                   	nop

00003970 <atoi>:

int
atoi(const char *s)
{
    3970:	f3 0f 1e fb          	endbr32 
    3974:	55                   	push   %ebp
    3975:	89 e5                	mov    %esp,%ebp
    3977:	53                   	push   %ebx
    3978:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    397b:	0f be 02             	movsbl (%edx),%eax
    397e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    3981:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    3984:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    3989:	77 1a                	ja     39a5 <atoi+0x35>
    398b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    398f:	90                   	nop
    n = n*10 + *s++ - '0';
    3990:	83 c2 01             	add    $0x1,%edx
    3993:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    3996:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    399a:	0f be 02             	movsbl (%edx),%eax
    399d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    39a0:	80 fb 09             	cmp    $0x9,%bl
    39a3:	76 eb                	jbe    3990 <atoi+0x20>
  return n;
}
    39a5:	89 c8                	mov    %ecx,%eax
    39a7:	5b                   	pop    %ebx
    39a8:	5d                   	pop    %ebp
    39a9:	c3                   	ret    
    39aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000039b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    39b0:	f3 0f 1e fb          	endbr32 
    39b4:	55                   	push   %ebp
    39b5:	89 e5                	mov    %esp,%ebp
    39b7:	57                   	push   %edi
    39b8:	8b 45 10             	mov    0x10(%ebp),%eax
    39bb:	8b 55 08             	mov    0x8(%ebp),%edx
    39be:	56                   	push   %esi
    39bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    39c2:	85 c0                	test   %eax,%eax
    39c4:	7e 0f                	jle    39d5 <memmove+0x25>
    39c6:	01 d0                	add    %edx,%eax
  dst = vdst;
    39c8:	89 d7                	mov    %edx,%edi
    39ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    39d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    39d1:	39 f8                	cmp    %edi,%eax
    39d3:	75 fb                	jne    39d0 <memmove+0x20>
  return vdst;
}
    39d5:	5e                   	pop    %esi
    39d6:	89 d0                	mov    %edx,%eax
    39d8:	5f                   	pop    %edi
    39d9:	5d                   	pop    %ebp
    39da:	c3                   	ret    
    39db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    39df:	90                   	nop

000039e0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
    39e0:	f3 0f 1e fb          	endbr32 
    39e4:	55                   	push   %ebp
    39e5:	89 e5                	mov    %esp,%ebp
    39e7:	57                   	push   %edi
    39e8:	56                   	push   %esi
    39e9:	53                   	push   %ebx
    39ea:	83 ec 34             	sub    $0x34,%esp
    39ed:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
    39f0:	68 f0 5a 00 00       	push   $0x5af0
hexdump (void *data, size_t size) {
    39f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    39f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
    39fb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
    39fd:	89 c7                	mov    %eax,%edi
    39ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
    3a02:	e8 e9 05 00 00       	call   3ff0 <printf>
  for (offset = 0; offset < size; offset += 16) {
    3a07:	83 c4 10             	add    $0x10,%esp
    3a0a:	85 ff                	test   %edi,%edi
    3a0c:	0f 84 2d 01 00 00    	je     3b3f <hexdump+0x15f>
    3a12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    3a1c:	be 10 00 00 00       	mov    $0x10,%esi
    3a21:	83 e8 01             	sub    $0x1,%eax
    3a24:	83 e0 f0             	and    $0xfffffff0,%eax
    3a27:	83 c0 10             	add    $0x10,%eax
    3a2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3a2d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
    3a30:	83 ec 08             	sub    $0x8,%esp
    3a33:	68 42 5b 00 00       	push   $0x5b42
    3a38:	6a 01                	push   $0x1
    3a3a:	e8 b1 05 00 00       	call   3ff0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
    3a3f:	83 c4 10             	add    $0x10,%esp
    3a42:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
    3a49:	0f 8e 51 01 00 00    	jle    3ba0 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
    3a4f:	8b 7d dc             	mov    -0x24(%ebp),%edi
    3a52:	83 ec 04             	sub    $0x4,%esp
    3a55:	57                   	push   %edi
    3a56:	89 fb                	mov    %edi,%ebx
    3a58:	68 3f 5b 00 00       	push   $0x5b3f
    3a5d:	6a 01                	push   $0x1
    3a5f:	e8 8c 05 00 00       	call   3ff0 <printf>
    3a64:	89 7d d8             	mov    %edi,-0x28(%ebp)
    3a67:	83 c4 10             	add    $0x10,%esp
    3a6a:	8b 7d e0             	mov    -0x20(%ebp),%edi
    3a6d:	eb 28                	jmp    3a97 <hexdump+0xb7>
    3a6f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
    3a70:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    3a74:	80 fa 0f             	cmp    $0xf,%dl
    3a77:	0f 86 e3 00 00 00    	jbe    3b60 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
    3a7d:	83 ec 04             	sub    $0x4,%esp
    3a80:	83 c3 01             	add    $0x1,%ebx
    3a83:	52                   	push   %edx
    3a84:	68 45 5b 00 00       	push   $0x5b45
    3a89:	6a 01                	push   $0x1
    3a8b:	e8 60 05 00 00       	call   3ff0 <printf>
    3a90:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
    3a93:	39 f3                	cmp    %esi,%ebx
    3a95:	74 1e                	je     3ab5 <hexdump+0xd5>
      if(offset + index < (int)size) {
    3a97:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
    3a9a:	7f d4                	jg     3a70 <hexdump+0x90>
      } else {
        printf(1, "   ");
    3a9c:	83 ec 08             	sub    $0x8,%esp
    3a9f:	83 c3 01             	add    $0x1,%ebx
    3aa2:	68 49 5b 00 00       	push   $0x5b49
    3aa7:	6a 01                	push   $0x1
    3aa9:	e8 42 05 00 00       	call   3ff0 <printf>
    3aae:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
    3ab1:	39 f3                	cmp    %esi,%ebx
    3ab3:	75 e2                	jne    3a97 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
    3ab5:	83 ec 08             	sub    $0x8,%esp
    3ab8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
    3abb:	68 42 5b 00 00       	push   $0x5b42
    3ac0:	6a 01                	push   $0x1
    3ac2:	e8 29 05 00 00       	call   3ff0 <printf>
    3ac7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3aca:	83 c4 10             	add    $0x10,%esp
    3acd:	eb 1b                	jmp    3aea <hexdump+0x10a>
    3acf:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
    3ad0:	83 ec 04             	sub    $0x4,%esp
    3ad3:	52                   	push   %edx
    3ad4:	68 4d 5b 00 00       	push   $0x5b4d
    3ad9:	6a 01                	push   $0x1
    3adb:	e8 10 05 00 00       	call   3ff0 <printf>
    3ae0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
    3ae3:	83 c3 01             	add    $0x1,%ebx
    3ae6:	39 de                	cmp    %ebx,%esi
    3ae8:	74 30                	je     3b1a <hexdump+0x13a>
      if(offset + index < (int)size) {
    3aea:	39 df                	cmp    %ebx,%edi
    3aec:	0f 8e 8e 00 00 00    	jle    3b80 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
    3af2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3af5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    3af9:	8d 4a e0             	lea    -0x20(%edx),%ecx
    3afc:	80 f9 5e             	cmp    $0x5e,%cl
    3aff:	76 cf                	jbe    3ad0 <hexdump+0xf0>
        } else {
          printf(1, ".");
    3b01:	83 ec 08             	sub    $0x8,%esp
    3b04:	83 c3 01             	add    $0x1,%ebx
    3b07:	68 ce 4b 00 00       	push   $0x4bce
    3b0c:	6a 01                	push   $0x1
    3b0e:	e8 dd 04 00 00       	call   3ff0 <printf>
    3b13:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
    3b16:	39 de                	cmp    %ebx,%esi
    3b18:	75 d0                	jne    3aea <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
    3b1a:	83 ec 08             	sub    $0x8,%esp
    3b1d:	83 c6 10             	add    $0x10,%esi
    3b20:	68 50 5b 00 00       	push   $0x5b50
    3b25:	6a 01                	push   $0x1
    3b27:	e8 c4 04 00 00       	call   3ff0 <printf>
  for (offset = 0; offset < size; offset += 16) {
    3b2c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
    3b30:	83 c4 10             	add    $0x10,%esp
    3b33:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3b36:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3b39:	0f 85 f1 fe ff ff    	jne    3a30 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
    3b3f:	c7 45 0c f0 5a 00 00 	movl   $0x5af0,0xc(%ebp)
    3b46:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
    3b4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b50:	5b                   	pop    %ebx
    3b51:	5e                   	pop    %esi
    3b52:	5f                   	pop    %edi
    3b53:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
    3b54:	e9 97 04 00 00       	jmp    3ff0 <printf>
    3b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
    3b60:	83 ec 08             	sub    $0x8,%esp
    3b63:	68 c2 49 00 00       	push   $0x49c2
    3b68:	6a 01                	push   $0x1
    3b6a:	e8 81 04 00 00       	call   3ff0 <printf>
    3b6f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    3b73:	83 c4 10             	add    $0x10,%esp
    3b76:	e9 02 ff ff ff       	jmp    3a7d <hexdump+0x9d>
    3b7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b7f:	90                   	nop
        printf(1, " ");
    3b80:	83 ec 08             	sub    $0x8,%esp
    3b83:	68 4b 5b 00 00       	push   $0x5b4b
    3b88:	6a 01                	push   $0x1
    3b8a:	e8 61 04 00 00       	call   3ff0 <printf>
    3b8f:	83 c4 10             	add    $0x10,%esp
    3b92:	e9 4c ff ff ff       	jmp    3ae3 <hexdump+0x103>
    3b97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3b9e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
    3ba0:	83 ec 08             	sub    $0x8,%esp
    3ba3:	68 c2 49 00 00       	push   $0x49c2
    3ba8:	6a 01                	push   $0x1
    3baa:	e8 41 04 00 00       	call   3ff0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
    3baf:	8b 7d dc             	mov    -0x24(%ebp),%edi
    3bb2:	83 c4 10             	add    $0x10,%esp
    3bb5:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    3bbb:	0f 8f 8e fe ff ff    	jg     3a4f <hexdump+0x6f>
    3bc1:	83 ec 08             	sub    $0x8,%esp
    3bc4:	68 c2 49 00 00       	push   $0x49c2
    3bc9:	6a 01                	push   $0x1
    3bcb:	e8 20 04 00 00       	call   3ff0 <printf>
    if (offset <= 0x000f) printf(1, "0");
    3bd0:	83 c4 10             	add    $0x10,%esp
    3bd3:	83 ff 0f             	cmp    $0xf,%edi
    3bd6:	0f 8f 73 fe ff ff    	jg     3a4f <hexdump+0x6f>
    3bdc:	83 ec 08             	sub    $0x8,%esp
    3bdf:	68 c2 49 00 00       	push   $0x49c2
    3be4:	6a 01                	push   $0x1
    3be6:	e8 05 04 00 00       	call   3ff0 <printf>
    3beb:	83 c4 10             	add    $0x10,%esp
    3bee:	e9 5c fe ff ff       	jmp    3a4f <hexdump+0x6f>
    3bf3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003c00 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
    3c00:	f3 0f 1e fb          	endbr32 
    3c04:	55                   	push   %ebp
    if (!endian)
    3c05:	a1 40 66 00 00       	mov    0x6640,%eax
{
    3c0a:	89 e5                	mov    %esp,%ebp
    3c0c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
    3c0f:	85 c0                	test   %eax,%eax
    3c11:	75 1d                	jne    3c30 <hton16+0x30>
        endian = byteorder();
    3c13:	c7 05 40 66 00 00 d2 	movl   $0x4d2,0x6640
    3c1a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
    3c1d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
    3c1f:	5d                   	pop    %ebp
    3c20:	66 c1 c2 08          	rol    $0x8,%dx
    3c24:	89 d0                	mov    %edx,%eax
    3c26:	c3                   	ret    
    3c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c2e:	66 90                	xchg   %ax,%ax
    3c30:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
    3c32:	3d d2 04 00 00       	cmp    $0x4d2,%eax
    3c37:	74 e4                	je     3c1d <hton16+0x1d>
}
    3c39:	89 d0                	mov    %edx,%eax
    3c3b:	5d                   	pop    %ebp
    3c3c:	c3                   	ret    
    3c3d:	8d 76 00             	lea    0x0(%esi),%esi

00003c40 <ntoh16>:
    3c40:	f3 0f 1e fb          	endbr32 
    3c44:	eb ba                	jmp    3c00 <hton16>
    3c46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c4d:	8d 76 00             	lea    0x0(%esi),%esi

00003c50 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
    3c50:	f3 0f 1e fb          	endbr32 
    3c54:	55                   	push   %ebp
    if (!endian)
    3c55:	8b 15 40 66 00 00    	mov    0x6640,%edx
{
    3c5b:	89 e5                	mov    %esp,%ebp
    3c5d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
    3c60:	85 d2                	test   %edx,%edx
    3c62:	75 14                	jne    3c78 <hton32+0x28>
        endian = byteorder();
    3c64:	c7 05 40 66 00 00 d2 	movl   $0x4d2,0x6640
    3c6b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
    3c6e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
    3c70:	5d                   	pop    %ebp
    3c71:	c3                   	ret    
    3c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
    3c78:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
    3c7e:	74 ee                	je     3c6e <hton32+0x1e>
}
    3c80:	5d                   	pop    %ebp
    3c81:	c3                   	ret    
    3c82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003c90 <ntoh32>:
    3c90:	f3 0f 1e fb          	endbr32 
    3c94:	eb ba                	jmp    3c50 <hton32>
    3c96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c9d:	8d 76 00             	lea    0x0(%esi),%esi

00003ca0 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
    3ca0:	f3 0f 1e fb          	endbr32 
    3ca4:	55                   	push   %ebp
    3ca5:	89 e5                	mov    %esp,%ebp
    3ca7:	57                   	push   %edi
    3ca8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3cab:	56                   	push   %esi
    3cac:	53                   	push   %ebx
    3cad:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
    3cb0:	0f b6 01             	movzbl (%ecx),%eax
    3cb3:	3c 09                	cmp    $0x9,%al
    3cb5:	74 09                	je     3cc0 <strtol+0x20>
    3cb7:	3c 20                	cmp    $0x20,%al
    3cb9:	75 14                	jne    3ccf <strtol+0x2f>
    3cbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3cbf:	90                   	nop
    3cc0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
    3cc4:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
    3cc7:	3c 20                	cmp    $0x20,%al
    3cc9:	74 f5                	je     3cc0 <strtol+0x20>
    3ccb:	3c 09                	cmp    $0x9,%al
    3ccd:	74 f1                	je     3cc0 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
    3ccf:	3c 2b                	cmp    $0x2b,%al
    3cd1:	0f 84 a9 00 00 00    	je     3d80 <strtol+0xe0>
    int neg = 0;
    3cd7:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
    3cd9:	3c 2d                	cmp    $0x2d,%al
    3cdb:	0f 84 8f 00 00 00    	je     3d70 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
    3ce1:	0f be 11             	movsbl (%ecx),%edx
    3ce4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
    3cea:	75 12                	jne    3cfe <strtol+0x5e>
    3cec:	80 fa 30             	cmp    $0x30,%dl
    3cef:	0f 84 9b 00 00 00    	je     3d90 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
    3cf5:	85 db                	test   %ebx,%ebx
    3cf7:	75 05                	jne    3cfe <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
    3cf9:	bb 0a 00 00 00       	mov    $0xa,%ebx
    3cfe:	89 5d 10             	mov    %ebx,0x10(%ebp)
    3d01:	31 c0                	xor    %eax,%eax
    3d03:	eb 17                	jmp    3d1c <strtol+0x7c>
    3d05:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
    3d08:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
    3d0b:	3b 55 10             	cmp    0x10(%ebp),%edx
    3d0e:	7d 28                	jge    3d38 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
    3d10:	0f af 45 10          	imul   0x10(%ebp),%eax
    3d14:	83 c1 01             	add    $0x1,%ecx
    3d17:	01 d0                	add    %edx,%eax
    while (1) {
    3d19:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
    3d1c:	8d 72 d0             	lea    -0x30(%edx),%esi
    3d1f:	89 f3                	mov    %esi,%ebx
    3d21:	80 fb 09             	cmp    $0x9,%bl
    3d24:	76 e2                	jbe    3d08 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
    3d26:	8d 72 9f             	lea    -0x61(%edx),%esi
    3d29:	89 f3                	mov    %esi,%ebx
    3d2b:	80 fb 19             	cmp    $0x19,%bl
    3d2e:	77 28                	ja     3d58 <strtol+0xb8>
            dig = *s - 'a' + 10;
    3d30:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
    3d33:	3b 55 10             	cmp    0x10(%ebp),%edx
    3d36:	7c d8                	jl     3d10 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
    3d38:	8b 55 0c             	mov    0xc(%ebp),%edx
    3d3b:	85 d2                	test   %edx,%edx
    3d3d:	74 05                	je     3d44 <strtol+0xa4>
        *endptr = (char *) s;
    3d3f:	8b 75 0c             	mov    0xc(%ebp),%esi
    3d42:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
    3d44:	89 c2                	mov    %eax,%edx
}
    3d46:	5b                   	pop    %ebx
    3d47:	5e                   	pop    %esi
    return (neg ? -val : val);
    3d48:	f7 da                	neg    %edx
    3d4a:	85 ff                	test   %edi,%edi
}
    3d4c:	5f                   	pop    %edi
    3d4d:	5d                   	pop    %ebp
    return (neg ? -val : val);
    3d4e:	0f 45 c2             	cmovne %edx,%eax
}
    3d51:	c3                   	ret    
    3d52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
    3d58:	8d 72 bf             	lea    -0x41(%edx),%esi
    3d5b:	89 f3                	mov    %esi,%ebx
    3d5d:	80 fb 19             	cmp    $0x19,%bl
    3d60:	77 d6                	ja     3d38 <strtol+0x98>
            dig = *s - 'A' + 10;
    3d62:	83 ea 37             	sub    $0x37,%edx
    3d65:	eb a4                	jmp    3d0b <strtol+0x6b>
    3d67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3d6e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
    3d70:	83 c1 01             	add    $0x1,%ecx
    3d73:	bf 01 00 00 00       	mov    $0x1,%edi
    3d78:	e9 64 ff ff ff       	jmp    3ce1 <strtol+0x41>
    3d7d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
    3d80:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
    3d83:	31 ff                	xor    %edi,%edi
    3d85:	e9 57 ff ff ff       	jmp    3ce1 <strtol+0x41>
    3d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
    3d90:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    3d94:	3c 78                	cmp    $0x78,%al
    3d96:	74 18                	je     3db0 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
    3d98:	85 db                	test   %ebx,%ebx
    3d9a:	0f 85 5e ff ff ff    	jne    3cfe <strtol+0x5e>
        s++, base = 8;
    3da0:	83 c1 01             	add    $0x1,%ecx
    3da3:	0f be d0             	movsbl %al,%edx
    3da6:	bb 08 00 00 00       	mov    $0x8,%ebx
    3dab:	e9 4e ff ff ff       	jmp    3cfe <strtol+0x5e>
        s += 2, base = 16;
    3db0:	0f be 51 02          	movsbl 0x2(%ecx),%edx
    3db4:	bb 10 00 00 00       	mov    $0x10,%ebx
    3db9:	83 c1 02             	add    $0x2,%ecx
    3dbc:	e9 3d ff ff ff       	jmp    3cfe <strtol+0x5e>
    3dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3dc8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3dcf:	90                   	nop

00003dd0 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
    3dd0:	f3 0f 1e fb          	endbr32 
    3dd4:	55                   	push   %ebp
    3dd5:	89 e5                	mov    %esp,%ebp
    3dd7:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
    3dd8:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
    3dda:	56                   	push   %esi
    3ddb:	53                   	push   %ebx
    3ddc:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
    3ddf:	83 ec 1c             	sub    $0x1c,%esp
    3de2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
    3de5:	83 ec 04             	sub    $0x4,%esp
    3de8:	6a 0a                	push   $0xa
    3dea:	53                   	push   %ebx
    3deb:	56                   	push   %esi
    3dec:	e8 af fe ff ff       	call   3ca0 <strtol>
        if (ret < 0 || ret > 255) {
    3df1:	83 c4 10             	add    $0x10,%esp
    3df4:	3d ff 00 00 00       	cmp    $0xff,%eax
    3df9:	77 3d                	ja     3e38 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
    3dfb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3dfe:	39 f1                	cmp    %esi,%ecx
    3e00:	74 36                	je     3e38 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
    3e02:	0f b6 11             	movzbl (%ecx),%edx
    3e05:	83 ff 03             	cmp    $0x3,%edi
    3e08:	74 16                	je     3e20 <ip_addr_pton+0x50>
    3e0a:	80 fa 2e             	cmp    $0x2e,%dl
    3e0d:	75 29                	jne    3e38 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
    3e0f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
    3e12:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
    3e15:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
    3e18:	83 c7 01             	add    $0x1,%edi
    3e1b:	eb c8                	jmp    3de5 <ip_addr_pton+0x15>
    3e1d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
    3e20:	84 d2                	test   %dl,%dl
    3e22:	75 14                	jne    3e38 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
    3e24:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    3e27:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
    3e2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
    3e2d:	31 c0                	xor    %eax,%eax
}
    3e2f:	5b                   	pop    %ebx
    3e30:	5e                   	pop    %esi
    3e31:	5f                   	pop    %edi
    3e32:	5d                   	pop    %ebp
    3e33:	c3                   	ret    
    3e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3e38:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
    3e3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    3e40:	5b                   	pop    %ebx
    3e41:	5e                   	pop    %esi
    3e42:	5f                   	pop    %edi
    3e43:	5d                   	pop    %ebp
    3e44:	c3                   	ret    

00003e45 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3e45:	b8 01 00 00 00       	mov    $0x1,%eax
    3e4a:	cd 40                	int    $0x40
    3e4c:	c3                   	ret    

00003e4d <exit>:
SYSCALL(exit)
    3e4d:	b8 02 00 00 00       	mov    $0x2,%eax
    3e52:	cd 40                	int    $0x40
    3e54:	c3                   	ret    

00003e55 <wait>:
SYSCALL(wait)
    3e55:	b8 03 00 00 00       	mov    $0x3,%eax
    3e5a:	cd 40                	int    $0x40
    3e5c:	c3                   	ret    

00003e5d <pipe>:
SYSCALL(pipe)
    3e5d:	b8 04 00 00 00       	mov    $0x4,%eax
    3e62:	cd 40                	int    $0x40
    3e64:	c3                   	ret    

00003e65 <read>:
SYSCALL(read)
    3e65:	b8 05 00 00 00       	mov    $0x5,%eax
    3e6a:	cd 40                	int    $0x40
    3e6c:	c3                   	ret    

00003e6d <write>:
SYSCALL(write)
    3e6d:	b8 10 00 00 00       	mov    $0x10,%eax
    3e72:	cd 40                	int    $0x40
    3e74:	c3                   	ret    

00003e75 <close>:
SYSCALL(close)
    3e75:	b8 15 00 00 00       	mov    $0x15,%eax
    3e7a:	cd 40                	int    $0x40
    3e7c:	c3                   	ret    

00003e7d <kill>:
SYSCALL(kill)
    3e7d:	b8 06 00 00 00       	mov    $0x6,%eax
    3e82:	cd 40                	int    $0x40
    3e84:	c3                   	ret    

00003e85 <exec>:
SYSCALL(exec)
    3e85:	b8 07 00 00 00       	mov    $0x7,%eax
    3e8a:	cd 40                	int    $0x40
    3e8c:	c3                   	ret    

00003e8d <open>:
SYSCALL(open)
    3e8d:	b8 0f 00 00 00       	mov    $0xf,%eax
    3e92:	cd 40                	int    $0x40
    3e94:	c3                   	ret    

00003e95 <mknod>:
SYSCALL(mknod)
    3e95:	b8 11 00 00 00       	mov    $0x11,%eax
    3e9a:	cd 40                	int    $0x40
    3e9c:	c3                   	ret    

00003e9d <unlink>:
SYSCALL(unlink)
    3e9d:	b8 12 00 00 00       	mov    $0x12,%eax
    3ea2:	cd 40                	int    $0x40
    3ea4:	c3                   	ret    

00003ea5 <fstat>:
SYSCALL(fstat)
    3ea5:	b8 08 00 00 00       	mov    $0x8,%eax
    3eaa:	cd 40                	int    $0x40
    3eac:	c3                   	ret    

00003ead <link>:
SYSCALL(link)
    3ead:	b8 13 00 00 00       	mov    $0x13,%eax
    3eb2:	cd 40                	int    $0x40
    3eb4:	c3                   	ret    

00003eb5 <mkdir>:
SYSCALL(mkdir)
    3eb5:	b8 14 00 00 00       	mov    $0x14,%eax
    3eba:	cd 40                	int    $0x40
    3ebc:	c3                   	ret    

00003ebd <chdir>:
SYSCALL(chdir)
    3ebd:	b8 09 00 00 00       	mov    $0x9,%eax
    3ec2:	cd 40                	int    $0x40
    3ec4:	c3                   	ret    

00003ec5 <dup>:
SYSCALL(dup)
    3ec5:	b8 0a 00 00 00       	mov    $0xa,%eax
    3eca:	cd 40                	int    $0x40
    3ecc:	c3                   	ret    

00003ecd <getpid>:
SYSCALL(getpid)
    3ecd:	b8 0b 00 00 00       	mov    $0xb,%eax
    3ed2:	cd 40                	int    $0x40
    3ed4:	c3                   	ret    

00003ed5 <sbrk>:
SYSCALL(sbrk)
    3ed5:	b8 0c 00 00 00       	mov    $0xc,%eax
    3eda:	cd 40                	int    $0x40
    3edc:	c3                   	ret    

00003edd <sleep>:
SYSCALL(sleep)
    3edd:	b8 0d 00 00 00       	mov    $0xd,%eax
    3ee2:	cd 40                	int    $0x40
    3ee4:	c3                   	ret    

00003ee5 <uptime>:
SYSCALL(uptime)
    3ee5:	b8 0e 00 00 00       	mov    $0xe,%eax
    3eea:	cd 40                	int    $0x40
    3eec:	c3                   	ret    

00003eed <ioctl>:
# iotcl
SYSCALL(ioctl)
    3eed:	b8 16 00 00 00       	mov    $0x16,%eax
    3ef2:	cd 40                	int    $0x40
    3ef4:	c3                   	ret    

00003ef5 <socket>:
# socket
SYSCALL(socket)
    3ef5:	b8 17 00 00 00       	mov    $0x17,%eax
    3efa:	cd 40                	int    $0x40
    3efc:	c3                   	ret    

00003efd <bind>:
SYSCALL(bind)
    3efd:	b8 19 00 00 00       	mov    $0x19,%eax
    3f02:	cd 40                	int    $0x40
    3f04:	c3                   	ret    

00003f05 <listen>:
SYSCALL(listen)
    3f05:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3f0a:	cd 40                	int    $0x40
    3f0c:	c3                   	ret    

00003f0d <accept>:
SYSCALL(accept)
    3f0d:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3f12:	cd 40                	int    $0x40
    3f14:	c3                   	ret    

00003f15 <recv>:
SYSCALL(recv)
    3f15:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3f1a:	cd 40                	int    $0x40
    3f1c:	c3                   	ret    

00003f1d <send>:
SYSCALL(send)
    3f1d:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3f22:	cd 40                	int    $0x40
    3f24:	c3                   	ret    

00003f25 <recvfrom>:
SYSCALL(recvfrom)
    3f25:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3f2a:	cd 40                	int    $0x40
    3f2c:	c3                   	ret    

00003f2d <sendto>:
SYSCALL(sendto)
    3f2d:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3f32:	cd 40                	int    $0x40
    3f34:	c3                   	ret    
    3f35:	66 90                	xchg   %ax,%ax
    3f37:	66 90                	xchg   %ax,%ax
    3f39:	66 90                	xchg   %ax,%ax
    3f3b:	66 90                	xchg   %ax,%ax
    3f3d:	66 90                	xchg   %ax,%ax
    3f3f:	90                   	nop

00003f40 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3f40:	55                   	push   %ebp
    3f41:	89 e5                	mov    %esp,%ebp
    3f43:	57                   	push   %edi
    3f44:	56                   	push   %esi
    3f45:	53                   	push   %ebx
    3f46:	83 ec 3c             	sub    $0x3c,%esp
    3f49:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    3f4c:	89 d1                	mov    %edx,%ecx
{
    3f4e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    3f51:	85 d2                	test   %edx,%edx
    3f53:	0f 89 7f 00 00 00    	jns    3fd8 <printint+0x98>
    3f59:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3f5d:	74 79                	je     3fd8 <printint+0x98>
    neg = 1;
    3f5f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    3f66:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    3f68:	31 db                	xor    %ebx,%ebx
    3f6a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    3f6d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3f70:	89 c8                	mov    %ecx,%eax
    3f72:	31 d2                	xor    %edx,%edx
    3f74:	89 cf                	mov    %ecx,%edi
    3f76:	f7 75 c4             	divl   -0x3c(%ebp)
    3f79:	0f b6 92 5c 5b 00 00 	movzbl 0x5b5c(%edx),%edx
    3f80:	89 45 c0             	mov    %eax,-0x40(%ebp)
    3f83:	89 d8                	mov    %ebx,%eax
    3f85:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    3f88:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    3f8b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    3f8e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    3f91:	76 dd                	jbe    3f70 <printint+0x30>
  if(neg)
    3f93:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3f96:	85 c9                	test   %ecx,%ecx
    3f98:	74 0c                	je     3fa6 <printint+0x66>
    buf[i++] = '-';
    3f9a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    3f9f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    3fa1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    3fa6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    3fa9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    3fad:	eb 07                	jmp    3fb6 <printint+0x76>
    3faf:	90                   	nop
    3fb0:	0f b6 13             	movzbl (%ebx),%edx
    3fb3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    3fb6:	83 ec 04             	sub    $0x4,%esp
    3fb9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    3fbc:	6a 01                	push   $0x1
    3fbe:	56                   	push   %esi
    3fbf:	57                   	push   %edi
    3fc0:	e8 a8 fe ff ff       	call   3e6d <write>
  while(--i >= 0)
    3fc5:	83 c4 10             	add    $0x10,%esp
    3fc8:	39 de                	cmp    %ebx,%esi
    3fca:	75 e4                	jne    3fb0 <printint+0x70>
    putc(fd, buf[i]);
}
    3fcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fcf:	5b                   	pop    %ebx
    3fd0:	5e                   	pop    %esi
    3fd1:	5f                   	pop    %edi
    3fd2:	5d                   	pop    %ebp
    3fd3:	c3                   	ret    
    3fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    3fd8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    3fdf:	eb 87                	jmp    3f68 <printint+0x28>
    3fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3fe8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3fef:	90                   	nop

00003ff0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3ff0:	f3 0f 1e fb          	endbr32 
    3ff4:	55                   	push   %ebp
    3ff5:	89 e5                	mov    %esp,%ebp
    3ff7:	57                   	push   %edi
    3ff8:	56                   	push   %esi
    3ff9:	53                   	push   %ebx
    3ffa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ffd:	8b 75 0c             	mov    0xc(%ebp),%esi
    4000:	0f b6 1e             	movzbl (%esi),%ebx
    4003:	84 db                	test   %bl,%bl
    4005:	0f 84 b4 00 00 00    	je     40bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    400b:	8d 45 10             	lea    0x10(%ebp),%eax
    400e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    4011:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    4014:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    4016:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4019:	eb 33                	jmp    404e <printf+0x5e>
    401b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    401f:	90                   	nop
    4020:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    4023:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    4028:	83 f8 25             	cmp    $0x25,%eax
    402b:	74 17                	je     4044 <printf+0x54>
  write(fd, &c, 1);
    402d:	83 ec 04             	sub    $0x4,%esp
    4030:	88 5d e7             	mov    %bl,-0x19(%ebp)
    4033:	6a 01                	push   $0x1
    4035:	57                   	push   %edi
    4036:	ff 75 08             	pushl  0x8(%ebp)
    4039:	e8 2f fe ff ff       	call   3e6d <write>
    403e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    4041:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    4044:	0f b6 1e             	movzbl (%esi),%ebx
    4047:	83 c6 01             	add    $0x1,%esi
    404a:	84 db                	test   %bl,%bl
    404c:	74 71                	je     40bf <printf+0xcf>
    c = fmt[i] & 0xff;
    404e:	0f be cb             	movsbl %bl,%ecx
    4051:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    4054:	85 d2                	test   %edx,%edx
    4056:	74 c8                	je     4020 <printf+0x30>
      }
    } else if(state == '%'){
    4058:	83 fa 25             	cmp    $0x25,%edx
    405b:	75 e7                	jne    4044 <printf+0x54>
      if(c == 'd'){
    405d:	83 f8 64             	cmp    $0x64,%eax
    4060:	0f 84 9a 00 00 00    	je     4100 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    4066:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    406c:	83 f9 70             	cmp    $0x70,%ecx
    406f:	74 5f                	je     40d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4071:	83 f8 73             	cmp    $0x73,%eax
    4074:	0f 84 d6 00 00 00    	je     4150 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    407a:	83 f8 63             	cmp    $0x63,%eax
    407d:	0f 84 8d 00 00 00    	je     4110 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4083:	83 f8 25             	cmp    $0x25,%eax
    4086:	0f 84 b4 00 00 00    	je     4140 <printf+0x150>
  write(fd, &c, 1);
    408c:	83 ec 04             	sub    $0x4,%esp
    408f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    4093:	6a 01                	push   $0x1
    4095:	57                   	push   %edi
    4096:	ff 75 08             	pushl  0x8(%ebp)
    4099:	e8 cf fd ff ff       	call   3e6d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    409e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    40a1:	83 c4 0c             	add    $0xc,%esp
    40a4:	6a 01                	push   $0x1
    40a6:	83 c6 01             	add    $0x1,%esi
    40a9:	57                   	push   %edi
    40aa:	ff 75 08             	pushl  0x8(%ebp)
    40ad:	e8 bb fd ff ff       	call   3e6d <write>
  for(i = 0; fmt[i]; i++){
    40b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    40b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    40b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    40bb:	84 db                	test   %bl,%bl
    40bd:	75 8f                	jne    404e <printf+0x5e>
    }
  }
}
    40bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    40c2:	5b                   	pop    %ebx
    40c3:	5e                   	pop    %esi
    40c4:	5f                   	pop    %edi
    40c5:	5d                   	pop    %ebp
    40c6:	c3                   	ret    
    40c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    40ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    40d0:	83 ec 0c             	sub    $0xc,%esp
    40d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    40d8:	6a 00                	push   $0x0
    40da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    40dd:	8b 45 08             	mov    0x8(%ebp),%eax
    40e0:	8b 13                	mov    (%ebx),%edx
    40e2:	e8 59 fe ff ff       	call   3f40 <printint>
        ap++;
    40e7:	89 d8                	mov    %ebx,%eax
    40e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    40ec:	31 d2                	xor    %edx,%edx
        ap++;
    40ee:	83 c0 04             	add    $0x4,%eax
    40f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    40f4:	e9 4b ff ff ff       	jmp    4044 <printf+0x54>
    40f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    4100:	83 ec 0c             	sub    $0xc,%esp
    4103:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4108:	6a 01                	push   $0x1
    410a:	eb ce                	jmp    40da <printf+0xea>
    410c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    4110:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    4113:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    4116:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    4118:	6a 01                	push   $0x1
        ap++;
    411a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    411d:	57                   	push   %edi
    411e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    4121:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    4124:	e8 44 fd ff ff       	call   3e6d <write>
        ap++;
    4129:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    412c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    412f:	31 d2                	xor    %edx,%edx
    4131:	e9 0e ff ff ff       	jmp    4044 <printf+0x54>
    4136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    413d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    4140:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    4143:	83 ec 04             	sub    $0x4,%esp
    4146:	e9 59 ff ff ff       	jmp    40a4 <printf+0xb4>
    414b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    414f:	90                   	nop
        s = (char*)*ap;
    4150:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4153:	8b 18                	mov    (%eax),%ebx
        ap++;
    4155:	83 c0 04             	add    $0x4,%eax
    4158:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    415b:	85 db                	test   %ebx,%ebx
    415d:	74 17                	je     4176 <printf+0x186>
        while(*s != 0){
    415f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    4162:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    4164:	84 c0                	test   %al,%al
    4166:	0f 84 d8 fe ff ff    	je     4044 <printf+0x54>
    416c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    416f:	89 de                	mov    %ebx,%esi
    4171:	8b 5d 08             	mov    0x8(%ebp),%ebx
    4174:	eb 1a                	jmp    4190 <printf+0x1a0>
          s = "(null)";
    4176:	bb 54 5b 00 00       	mov    $0x5b54,%ebx
        while(*s != 0){
    417b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    417e:	b8 28 00 00 00       	mov    $0x28,%eax
    4183:	89 de                	mov    %ebx,%esi
    4185:	8b 5d 08             	mov    0x8(%ebp),%ebx
    4188:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    418f:	90                   	nop
  write(fd, &c, 1);
    4190:	83 ec 04             	sub    $0x4,%esp
          s++;
    4193:	83 c6 01             	add    $0x1,%esi
    4196:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    4199:	6a 01                	push   $0x1
    419b:	57                   	push   %edi
    419c:	53                   	push   %ebx
    419d:	e8 cb fc ff ff       	call   3e6d <write>
        while(*s != 0){
    41a2:	0f b6 06             	movzbl (%esi),%eax
    41a5:	83 c4 10             	add    $0x10,%esp
    41a8:	84 c0                	test   %al,%al
    41aa:	75 e4                	jne    4190 <printf+0x1a0>
    41ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    41af:	31 d2                	xor    %edx,%edx
    41b1:	e9 8e fe ff ff       	jmp    4044 <printf+0x54>
    41b6:	66 90                	xchg   %ax,%ax
    41b8:	66 90                	xchg   %ax,%ax
    41ba:	66 90                	xchg   %ax,%ax
    41bc:	66 90                	xchg   %ax,%ax
    41be:	66 90                	xchg   %ax,%ax

000041c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    41c0:	f3 0f 1e fb          	endbr32 
    41c4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41c5:	a1 44 66 00 00       	mov    0x6644,%eax
{
    41ca:	89 e5                	mov    %esp,%ebp
    41cc:	57                   	push   %edi
    41cd:	56                   	push   %esi
    41ce:	53                   	push   %ebx
    41cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    41d2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    41d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41d7:	39 c8                	cmp    %ecx,%eax
    41d9:	73 15                	jae    41f0 <free+0x30>
    41db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    41df:	90                   	nop
    41e0:	39 d1                	cmp    %edx,%ecx
    41e2:	72 14                	jb     41f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    41e4:	39 d0                	cmp    %edx,%eax
    41e6:	73 10                	jae    41f8 <free+0x38>
{
    41e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41ea:	8b 10                	mov    (%eax),%edx
    41ec:	39 c8                	cmp    %ecx,%eax
    41ee:	72 f0                	jb     41e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    41f0:	39 d0                	cmp    %edx,%eax
    41f2:	72 f4                	jb     41e8 <free+0x28>
    41f4:	39 d1                	cmp    %edx,%ecx
    41f6:	73 f0                	jae    41e8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    41f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    41fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    41fe:	39 fa                	cmp    %edi,%edx
    4200:	74 1e                	je     4220 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    4202:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    4205:	8b 50 04             	mov    0x4(%eax),%edx
    4208:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    420b:	39 f1                	cmp    %esi,%ecx
    420d:	74 28                	je     4237 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    420f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    4211:	5b                   	pop    %ebx
  freep = p;
    4212:	a3 44 66 00 00       	mov    %eax,0x6644
}
    4217:	5e                   	pop    %esi
    4218:	5f                   	pop    %edi
    4219:	5d                   	pop    %ebp
    421a:	c3                   	ret    
    421b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    421f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    4220:	03 72 04             	add    0x4(%edx),%esi
    4223:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4226:	8b 10                	mov    (%eax),%edx
    4228:	8b 12                	mov    (%edx),%edx
    422a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    422d:	8b 50 04             	mov    0x4(%eax),%edx
    4230:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4233:	39 f1                	cmp    %esi,%ecx
    4235:	75 d8                	jne    420f <free+0x4f>
    p->s.size += bp->s.size;
    4237:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    423a:	a3 44 66 00 00       	mov    %eax,0x6644
    p->s.size += bp->s.size;
    423f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4242:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4245:	89 10                	mov    %edx,(%eax)
}
    4247:	5b                   	pop    %ebx
    4248:	5e                   	pop    %esi
    4249:	5f                   	pop    %edi
    424a:	5d                   	pop    %ebp
    424b:	c3                   	ret    
    424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004250 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4250:	f3 0f 1e fb          	endbr32 
    4254:	55                   	push   %ebp
    4255:	89 e5                	mov    %esp,%ebp
    4257:	57                   	push   %edi
    4258:	56                   	push   %esi
    4259:	53                   	push   %ebx
    425a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    425d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    4260:	8b 3d 44 66 00 00    	mov    0x6644,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4266:	8d 70 07             	lea    0x7(%eax),%esi
    4269:	c1 ee 03             	shr    $0x3,%esi
    426c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    426f:	85 ff                	test   %edi,%edi
    4271:	0f 84 a9 00 00 00    	je     4320 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4277:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    4279:	8b 48 04             	mov    0x4(%eax),%ecx
    427c:	39 f1                	cmp    %esi,%ecx
    427e:	73 6d                	jae    42ed <malloc+0x9d>
    4280:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    4286:	bb 00 10 00 00       	mov    $0x1000,%ebx
    428b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    428e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    4295:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    4298:	eb 17                	jmp    42b1 <malloc+0x61>
    429a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    42a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    42a2:	8b 4a 04             	mov    0x4(%edx),%ecx
    42a5:	39 f1                	cmp    %esi,%ecx
    42a7:	73 4f                	jae    42f8 <malloc+0xa8>
    42a9:	8b 3d 44 66 00 00    	mov    0x6644,%edi
    42af:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    42b1:	39 c7                	cmp    %eax,%edi
    42b3:	75 eb                	jne    42a0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    42b5:	83 ec 0c             	sub    $0xc,%esp
    42b8:	ff 75 e4             	pushl  -0x1c(%ebp)
    42bb:	e8 15 fc ff ff       	call   3ed5 <sbrk>
  if(p == (char*)-1)
    42c0:	83 c4 10             	add    $0x10,%esp
    42c3:	83 f8 ff             	cmp    $0xffffffff,%eax
    42c6:	74 1b                	je     42e3 <malloc+0x93>
  hp->s.size = nu;
    42c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    42cb:	83 ec 0c             	sub    $0xc,%esp
    42ce:	83 c0 08             	add    $0x8,%eax
    42d1:	50                   	push   %eax
    42d2:	e8 e9 fe ff ff       	call   41c0 <free>
  return freep;
    42d7:	a1 44 66 00 00       	mov    0x6644,%eax
      if((p = morecore(nunits)) == 0)
    42dc:	83 c4 10             	add    $0x10,%esp
    42df:	85 c0                	test   %eax,%eax
    42e1:	75 bd                	jne    42a0 <malloc+0x50>
        return 0;
  }
}
    42e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    42e6:	31 c0                	xor    %eax,%eax
}
    42e8:	5b                   	pop    %ebx
    42e9:	5e                   	pop    %esi
    42ea:	5f                   	pop    %edi
    42eb:	5d                   	pop    %ebp
    42ec:	c3                   	ret    
    if(p->s.size >= nunits){
    42ed:	89 c2                	mov    %eax,%edx
    42ef:	89 f8                	mov    %edi,%eax
    42f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    42f8:	39 ce                	cmp    %ecx,%esi
    42fa:	74 54                	je     4350 <malloc+0x100>
        p->s.size -= nunits;
    42fc:	29 f1                	sub    %esi,%ecx
    42fe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    4301:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    4304:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    4307:	a3 44 66 00 00       	mov    %eax,0x6644
}
    430c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    430f:	8d 42 08             	lea    0x8(%edx),%eax
}
    4312:	5b                   	pop    %ebx
    4313:	5e                   	pop    %esi
    4314:	5f                   	pop    %edi
    4315:	5d                   	pop    %ebp
    4316:	c3                   	ret    
    4317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    431e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    4320:	c7 05 44 66 00 00 48 	movl   $0x6648,0x6644
    4327:	66 00 00 
    base.s.size = 0;
    432a:	bf 48 66 00 00       	mov    $0x6648,%edi
    base.s.ptr = freep = prevp = &base;
    432f:	c7 05 48 66 00 00 48 	movl   $0x6648,0x6648
    4336:	66 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4339:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    433b:	c7 05 4c 66 00 00 00 	movl   $0x0,0x664c
    4342:	00 00 00 
    if(p->s.size >= nunits){
    4345:	e9 36 ff ff ff       	jmp    4280 <malloc+0x30>
    434a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    4350:	8b 0a                	mov    (%edx),%ecx
    4352:	89 08                	mov    %ecx,(%eax)
    4354:	eb b1                	jmp    4307 <malloc+0xb7>
