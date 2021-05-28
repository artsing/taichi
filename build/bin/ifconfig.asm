
build/bin/_ifconfig：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
    exit();
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
      13:	53                   	push   %ebx
      14:	51                   	push   %ecx
      15:	83 ec 38             	sub    $0x38,%esp
      18:	8b 01                	mov    (%ecx),%eax
      1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    char *s;
    ip_addr_t addr, netmask;
    int prefix = 0;

    if (argc == 1) {
      1d:	83 f8 01             	cmp    $0x1,%eax
      20:	74 18                	je     3a <main+0x3a>
        display_all();
        exit();
    }
    if (argc == 2) {
      22:	83 f8 02             	cmp    $0x2,%eax
      25:	74 6d                	je     94 <main+0x94>
            display_all();
        else
            display(argv[1]);
        exit();
    }
    if (argc == 3) {
      27:	83 f8 03             	cmp    $0x3,%eax
      2a:	0f 84 88 00 00 00    	je     b8 <main+0xb8>
            usage();
        netmask = hton32(0xffffffff << (32 - prefix));
        ifset(argv[1], &addr, &netmask);
        exit();
    }
    if (argc == 5) {
      30:	83 f8 05             	cmp    $0x5,%eax
      33:	74 0f                	je     44 <main+0x44>
            usage();
      35:	e8 56 06 00 00       	call   690 <usage>
        display_all();
      3a:	e8 01 05 00 00       	call   540 <display_all>
        exit();
      3f:	e8 c9 0d 00 00       	call   e0d <exit>
        if (ip_addr_pton(argv[2], &addr) == -1)
      44:	8d 75 c4             	lea    -0x3c(%ebp),%esi
      47:	51                   	push   %ecx
      48:	51                   	push   %ecx
      49:	56                   	push   %esi
      4a:	ff 73 08             	pushl  0x8(%ebx)
      4d:	e8 3e 0d 00 00       	call   d90 <ip_addr_pton>
      52:	83 c4 10             	add    $0x10,%esp
      55:	83 c0 01             	add    $0x1,%eax
      58:	74 db                	je     35 <main+0x35>
            usage();
        if (strcmp(argv[3], "netmask") != 0)
      5a:	52                   	push   %edx
      5b:	52                   	push   %edx
      5c:	68 39 14 00 00       	push   $0x1439
      61:	ff 73 0c             	pushl  0xc(%ebx)
      64:	e8 07 07 00 00       	call   770 <strcmp>
      69:	83 c4 10             	add    $0x10,%esp
      6c:	85 c0                	test   %eax,%eax
      6e:	75 c5                	jne    35 <main+0x35>
            usage();
        if (ip_addr_pton(argv[4], &netmask) == -1)
      70:	8d 7d c8             	lea    -0x38(%ebp),%edi
      73:	50                   	push   %eax
      74:	50                   	push   %eax
      75:	57                   	push   %edi
      76:	ff 73 10             	pushl  0x10(%ebx)
      79:	e8 12 0d 00 00       	call   d90 <ip_addr_pton>
      7e:	83 c4 10             	add    $0x10,%esp
      81:	83 c0 01             	add    $0x1,%eax
      84:	74 af                	je     35 <main+0x35>
            usage();
        ifset(argv[1], &addr, &netmask);
      86:	8b 43 04             	mov    0x4(%ebx),%eax
      89:	89 f9                	mov    %edi,%ecx
      8b:	89 f2                	mov    %esi,%edx
      8d:	e8 2e 05 00 00       	call   5c0 <ifset>
      92:	eb 1f                	jmp    b3 <main+0xb3>
        if (strcmp(argv[1], "-a") == 0)
      94:	57                   	push   %edi
      95:	57                   	push   %edi
      96:	68 2e 14 00 00       	push   $0x142e
      9b:	ff 73 04             	pushl  0x4(%ebx)
      9e:	e8 cd 06 00 00       	call   770 <strcmp>
      a3:	83 c4 10             	add    $0x10,%esp
      a6:	85 c0                	test   %eax,%eax
      a8:	0f 85 8f 00 00 00    	jne    13d <main+0x13d>
            display_all();
      ae:	e8 8d 04 00 00       	call   540 <display_all>
        exit();
      b3:	e8 55 0d 00 00       	call   e0d <exit>
        if (strcmp(argv[2], "up") == 0) {
      b8:	56                   	push   %esi
      b9:	56                   	push   %esi
      ba:	68 31 14 00 00       	push   $0x1431
      bf:	ff 73 08             	pushl  0x8(%ebx)
      c2:	e8 a9 06 00 00       	call   770 <strcmp>
      c7:	83 c4 10             	add    $0x10,%esp
      ca:	85 c0                	test   %eax,%eax
      cc:	75 7c                	jne    14a <main+0x14a>
            ifup(argv[1]);
      ce:	8b 73 04             	mov    0x4(%ebx),%esi
    fd = socket(AF_INET, SOCK_DGRAM, 0);
      d1:	51                   	push   %ecx
      d2:	6a 00                	push   $0x0
      d4:	6a 02                	push   $0x2
      d6:	6a 02                	push   $0x2
      d8:	e8 d8 0d 00 00       	call   eb5 <socket>
    if (fd == -1)
      dd:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
      e0:	89 c3                	mov    %eax,%ebx
    if (fd == -1)
      e2:	83 f8 ff             	cmp    $0xffffffff,%eax
      e5:	74 cc                	je     b3 <main+0xb3>
    strcpy(ifr.ifr_name, name);
      e7:	8d 7d c8             	lea    -0x38(%ebp),%edi
      ea:	52                   	push   %edx
      eb:	52                   	push   %edx
      ec:	56                   	push   %esi
      ed:	57                   	push   %edi
      ee:	e8 ed 05 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
      f3:	83 c4 0c             	add    $0xc,%esp
      f6:	57                   	push   %edi
      f7:	68 05 69 20 c0       	push   $0xc0206905
      fc:	53                   	push   %ebx
      fd:	e8 ab 0d 00 00       	call   ead <ioctl>
     102:	83 c4 10             	add    $0x10,%esp
     105:	83 c0 01             	add    $0x1,%eax
     108:	0f 84 14 01 00 00    	je     222 <main+0x222>
    ifr.ifr_flags |= IFF_UP;
     10e:	66 83 4d d8 01       	orw    $0x1,-0x28(%ebp)
    if (ioctl(fd, SIOCSIFFLAGS, &ifr) == -1) {
     113:	50                   	push   %eax
     114:	57                   	push   %edi
     115:	68 06 69 20 80       	push   $0x80206906
     11a:	53                   	push   %ebx
     11b:	e8 8d 0d 00 00       	call   ead <ioctl>
     120:	83 c4 10             	add    $0x10,%esp
     123:	83 c0 01             	add    $0x1,%eax
     126:	0f 84 17 01 00 00    	je     243 <main+0x243>
    close(fd);
     12c:	83 ec 0c             	sub    $0xc,%esp
     12f:	53                   	push   %ebx
     130:	e8 00 0d 00 00       	call   e35 <close>
     135:	83 c4 10             	add    $0x10,%esp
     138:	e9 76 ff ff ff       	jmp    b3 <main+0xb3>
            display(argv[1]);
     13d:	8b 43 04             	mov    0x4(%ebx),%eax
     140:	e8 2b 01 00 00       	call   270 <display>
        exit();
     145:	e9 69 ff ff ff       	jmp    b3 <main+0xb3>
        if (strcmp(argv[2], "down") == 0) {
     14a:	50                   	push   %eax
     14b:	50                   	push   %eax
     14c:	68 34 14 00 00       	push   $0x1434
     151:	ff 73 08             	pushl  0x8(%ebx)
     154:	e8 17 06 00 00       	call   770 <strcmp>
     159:	83 c4 10             	add    $0x10,%esp
     15c:	85 c0                	test   %eax,%eax
     15e:	74 78                	je     1d8 <main+0x1d8>
        s = strchr(argv[2], '/');
     160:	50                   	push   %eax
     161:	50                   	push   %eax
     162:	6a 2f                	push   $0x2f
     164:	ff 73 08             	pushl  0x8(%ebx)
     167:	e8 b4 06 00 00       	call   820 <strchr>
        if (!s)
     16c:	83 c4 10             	add    $0x10,%esp
        s = strchr(argv[2], '/');
     16f:	89 c6                	mov    %eax,%esi
        if (!s)
     171:	85 c0                	test   %eax,%eax
     173:	0f 84 bc fe ff ff    	je     35 <main+0x35>
        *s++ = 0;
     179:	c6 00 00             	movb   $0x0,(%eax)
        if (ip_addr_pton(argv[2], &addr) == -1)
     17c:	57                   	push   %edi
     17d:	57                   	push   %edi
     17e:	8d 7d c4             	lea    -0x3c(%ebp),%edi
     181:	57                   	push   %edi
     182:	ff 73 08             	pushl  0x8(%ebx)
     185:	e8 06 0c 00 00       	call   d90 <ip_addr_pton>
     18a:	83 c4 10             	add    $0x10,%esp
     18d:	83 c0 01             	add    $0x1,%eax
     190:	0f 84 9f fe ff ff    	je     35 <main+0x35>
        prefix = atoi(s);
     196:	83 ec 0c             	sub    $0xc,%esp
        *s++ = 0;
     199:	83 c6 01             	add    $0x1,%esi
        prefix = atoi(s);
     19c:	56                   	push   %esi
     19d:	e8 8e 07 00 00       	call   930 <atoi>
        if (prefix < 0 || prefix > 32)
     1a2:	83 c4 10             	add    $0x10,%esp
     1a5:	83 f8 20             	cmp    $0x20,%eax
     1a8:	0f 87 87 fe ff ff    	ja     35 <main+0x35>
        netmask = hton32(0xffffffff << (32 - prefix));
     1ae:	b9 20 00 00 00       	mov    $0x20,%ecx
     1b3:	83 ec 0c             	sub    $0xc,%esp
     1b6:	29 c1                	sub    %eax,%ecx
     1b8:	83 c8 ff             	or     $0xffffffff,%eax
     1bb:	d3 e0                	shl    %cl,%eax
     1bd:	50                   	push   %eax
     1be:	e8 4d 0a 00 00       	call   c10 <hton32>
        ifset(argv[1], &addr, &netmask);
     1c3:	8d 4d c8             	lea    -0x38(%ebp),%ecx
     1c6:	89 fa                	mov    %edi,%edx
        netmask = hton32(0xffffffff << (32 - prefix));
     1c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
        ifset(argv[1], &addr, &netmask);
     1cb:	8b 43 04             	mov    0x4(%ebx),%eax
     1ce:	e8 ed 03 00 00       	call   5c0 <ifset>
        exit();
     1d3:	e8 35 0c 00 00       	call   e0d <exit>
            ifdown(argv[1]);
     1d8:	8b 73 04             	mov    0x4(%ebx),%esi
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     1db:	50                   	push   %eax
     1dc:	6a 00                	push   $0x0
     1de:	6a 02                	push   $0x2
     1e0:	6a 02                	push   $0x2
     1e2:	e8 ce 0c 00 00       	call   eb5 <socket>
    if (fd == -1)
     1e7:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     1ea:	89 c3                	mov    %eax,%ebx
    if (fd == -1)
     1ec:	83 f8 ff             	cmp    $0xffffffff,%eax
     1ef:	0f 84 be fe ff ff    	je     b3 <main+0xb3>
    strcpy(ifr.ifr_name, name);
     1f5:	8d 7d c8             	lea    -0x38(%ebp),%edi
     1f8:	50                   	push   %eax
     1f9:	50                   	push   %eax
     1fa:	56                   	push   %esi
     1fb:	57                   	push   %edi
     1fc:	e8 df 04 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
     201:	83 c4 0c             	add    $0xc,%esp
     204:	57                   	push   %edi
     205:	68 05 69 20 c0       	push   $0xc0206905
     20a:	53                   	push   %ebx
     20b:	e8 9d 0c 00 00       	call   ead <ioctl>
     210:	83 c4 10             	add    $0x10,%esp
     213:	83 c0 01             	add    $0x1,%eax
     216:	74 0a                	je     222 <main+0x222>
    ifr.ifr_flags &= ~IFF_UP;
     218:	66 83 65 d8 fe       	andw   $0xfffe,-0x28(%ebp)
     21d:	e9 f1 fe ff ff       	jmp    113 <main+0x113>
        close(fd);
     222:	83 ec 0c             	sub    $0xc,%esp
     225:	53                   	push   %ebx
     226:	e8 0a 0c 00 00       	call   e35 <close>
        printf(0, "ifconfig: interface %s does not exist\n", name);
     22b:	83 c4 0c             	add    $0xc,%esp
     22e:	56                   	push   %esi
     22f:	68 44 14 00 00       	push   $0x1444
     234:	6a 00                	push   $0x0
     236:	e8 75 0d 00 00       	call   fb0 <printf>
        return;
     23b:	83 c4 10             	add    $0x10,%esp
     23e:	e9 70 fe ff ff       	jmp    b3 <main+0xb3>
        close(fd);
     243:	83 ec 0c             	sub    $0xc,%esp
     246:	53                   	push   %ebx
     247:	e8 e9 0b 00 00       	call   e35 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFFLAGS) failure, interface=%s\n", name);
     24c:	83 c4 0c             	add    $0xc,%esp
     24f:	56                   	push   %esi
     250:	68 6c 15 00 00       	push   $0x156c
     255:	6a 00                	push   $0x0
     257:	e8 54 0d 00 00       	call   fb0 <printf>
        return;
     25c:	83 c4 10             	add    $0x10,%esp
     25f:	e9 4f fe ff ff       	jmp    b3 <main+0xb3>
     264:	66 90                	xchg   %ax,%ax
     266:	66 90                	xchg   %ax,%ax
     268:	66 90                	xchg   %ax,%ax
     26a:	66 90                	xchg   %ax,%ax
     26c:	66 90                	xchg   %ax,%ax
     26e:	66 90                	xchg   %ax,%ax

00000270 <display>:
{
     270:	55                   	push   %ebp
    char **s, *str[] = {
     271:	b9 11 00 00 00       	mov    $0x11,%ecx
{
     276:	89 e5                	mov    %esp,%ebp
     278:	57                   	push   %edi
     279:	56                   	push   %esi
    char **s, *str[] = {
     27a:	be c0 15 00 00       	mov    $0x15c0,%esi
{
     27f:	53                   	push   %ebx
    char **s, *str[] = {
     280:	8d 5d a4             	lea    -0x5c(%ebp),%ebx
     283:	89 df                	mov    %ebx,%edi
{
     285:	81 ec 90 00 00 00    	sub    $0x90,%esp
     28b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    char **s, *str[] = {
     291:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     293:	6a 00                	push   $0x0
     295:	6a 02                	push   $0x2
     297:	6a 02                	push   $0x2
     299:	e8 17 0c 00 00       	call   eb5 <socket>
    if (fd == -1)
     29e:	83 c4 10             	add    $0x10,%esp
     2a1:	83 f8 ff             	cmp    $0xffffffff,%eax
     2a4:	0f 84 48 01 00 00    	je     3f2 <display+0x182>
    strcpy(ifr.ifr_name, name);
     2aa:	83 ec 08             	sub    $0x8,%esp
     2ad:	89 c6                	mov    %eax,%esi
     2af:	8d 45 84             	lea    -0x7c(%ebp),%eax
     2b2:	ff b5 74 ff ff ff    	pushl  -0x8c(%ebp)
     2b8:	50                   	push   %eax
     2b9:	e8 22 04 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
     2be:	83 c4 0c             	add    $0xc,%esp
     2c1:	8d 45 84             	lea    -0x7c(%ebp),%eax
     2c4:	50                   	push   %eax
     2c5:	68 05 69 20 c0       	push   $0xc0206905
     2ca:	56                   	push   %esi
     2cb:	e8 dd 0b 00 00       	call   ead <ioctl>
     2d0:	83 c4 10             	add    $0x10,%esp
     2d3:	83 f8 ff             	cmp    $0xffffffff,%eax
     2d6:	0f 84 34 02 00 00    	je     510 <display+0x2a0>
    printf(0, "%s: ", ifr.ifr_name);
     2dc:	83 ec 04             	sub    $0x4,%esp
     2df:	8d 45 84             	lea    -0x7c(%ebp),%eax
    unsigned short mask = 1;
     2e2:	bf 01 00 00 00       	mov    $0x1,%edi
    printf(0, "%s: ", ifr.ifr_name);
     2e7:	50                   	push   %eax
     2e8:	68 a3 13 00 00       	push   $0x13a3
     2ed:	6a 00                	push   $0x0
     2ef:	e8 bc 0c 00 00       	call   fb0 <printf>
    printf(0, "flags=%x<", ifr.ifr_flags);
     2f4:	0f bf 45 94          	movswl -0x6c(%ebp),%eax
     2f8:	83 c4 0c             	add    $0xc,%esp
     2fb:	50                   	push   %eax
     2fc:	68 a8 13 00 00       	push   $0x13a8
     301:	6a 00                	push   $0x0
     303:	e8 a8 0c 00 00       	call   fb0 <printf>
    for (s = str; *s; s++) {
     308:	8b 55 a4             	mov    -0x5c(%ebp),%edx
     30b:	83 c4 10             	add    $0x10,%esp
    int any = 0;
     30e:	31 c9                	xor    %ecx,%ecx
    for (s = str; *s; s++) {
     310:	85 d2                	test   %edx,%edx
     312:	0f 85 29 01 00 00    	jne    441 <display+0x1d1>
     318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     31f:	90                   	nop
    printf(0, ">");
     320:	83 ec 08             	sub    $0x8,%esp
     323:	68 b2 13 00 00       	push   $0x13b2
     328:	6a 00                	push   $0x0
     32a:	e8 81 0c 00 00       	call   fb0 <printf>
    if (ioctl(fd, SIOCGIFMTU, &ifr) == -1)
     32f:	83 c4 0c             	add    $0xc,%esp
     332:	8d 45 84             	lea    -0x7c(%ebp),%eax
     335:	50                   	push   %eax
     336:	68 0d 69 20 c0       	push   $0xc020690d
     33b:	56                   	push   %esi
     33c:	e8 6c 0b 00 00       	call   ead <ioctl>
     341:	83 c4 10             	add    $0x10,%esp
     344:	83 f8 ff             	cmp    $0xffffffff,%eax
     347:	0f 84 03 01 00 00    	je     450 <display+0x1e0>
     34d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    printf(0, " mtu %d\n", ifr.ifr_mtu);
     350:	83 ec 04             	sub    $0x4,%esp
     353:	50                   	push   %eax
     354:	68 b6 13 00 00       	push   $0x13b6
     359:	6a 00                	push   $0x0
     35b:	e8 50 0c 00 00       	call   fb0 <printf>
    if (ioctl(fd, SIOCGIFHWADDR, &ifr) == 0) {
     360:	83 c4 0c             	add    $0xc,%esp
     363:	8d 45 84             	lea    -0x7c(%ebp),%eax
     366:	50                   	push   %eax
     367:	68 03 69 20 c0       	push   $0xc0206903
     36c:	56                   	push   %esi
     36d:	e8 3b 0b 00 00       	call   ead <ioctl>
     372:	83 c4 10             	add    $0x10,%esp
     375:	85 c0                	test   %eax,%eax
     377:	0f 84 5b 01 00 00    	je     4d8 <display+0x268>
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     37d:	83 ec 04             	sub    $0x4,%esp
     380:	8d 45 84             	lea    -0x7c(%ebp),%eax
        ifr.ifr_addr.sa_family = AF_INET;
     383:	b9 02 00 00 00       	mov    $0x2,%ecx
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     388:	50                   	push   %eax
     389:	68 07 69 20 c0       	push   $0xc0206907
     38e:	56                   	push   %esi
        ifr.ifr_addr.sa_family = AF_INET;
     38f:	66 89 4d 94          	mov    %cx,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     393:	e8 15 0b 00 00       	call   ead <ioctl>
     398:	83 c4 10             	add    $0x10,%esp
     39b:	83 f8 ff             	cmp    $0xffffffff,%eax
     39e:	74 46                	je     3e6 <display+0x176>
        printf(0, "\tinet %d.%d.%d.%d", p[0], p[1], p[2], p[3]);
     3a0:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     3a4:	83 ec 08             	sub    $0x8,%esp
     3a7:	50                   	push   %eax
     3a8:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     3ac:	50                   	push   %eax
     3ad:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     3b1:	50                   	push   %eax
     3b2:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     3b6:	50                   	push   %eax
     3b7:	68 d9 13 00 00       	push   $0x13d9
     3bc:	6a 00                	push   $0x0
     3be:	e8 ed 0b 00 00       	call   fb0 <printf>
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3c3:	83 c4 1c             	add    $0x1c,%esp
     3c6:	8d 45 84             	lea    -0x7c(%ebp),%eax
        ifr.ifr_netmask.sa_family = AF_INET;
     3c9:	ba 02 00 00 00       	mov    $0x2,%edx
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3ce:	50                   	push   %eax
     3cf:	68 09 69 20 c0       	push   $0xc0206909
     3d4:	56                   	push   %esi
        ifr.ifr_netmask.sa_family = AF_INET;
     3d5:	66 89 55 94          	mov    %dx,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3d9:	e8 cf 0a 00 00       	call   ead <ioctl>
     3de:	83 c4 10             	add    $0x10,%esp
     3e1:	83 f8 ff             	cmp    $0xffffffff,%eax
     3e4:	75 7a                	jne    460 <display+0x1f0>
    close(fd);
     3e6:	83 ec 0c             	sub    $0xc,%esp
     3e9:	56                   	push   %esi
     3ea:	e8 46 0a 00 00       	call   e35 <close>
     3ef:	83 c4 10             	add    $0x10,%esp
}
     3f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3f5:	5b                   	pop    %ebx
     3f6:	5e                   	pop    %esi
     3f7:	5f                   	pop    %edi
     3f8:	5d                   	pop    %ebp
     3f9:	c3                   	ret    
     3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(0, "|");
     400:	83 ec 08             	sub    $0x8,%esp
     403:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%ebp)
     409:	68 b4 13 00 00       	push   $0x13b4
     40e:	6a 00                	push   $0x0
     410:	e8 9b 0b 00 00       	call   fb0 <printf>
     415:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
     41b:	83 c4 10             	add    $0x10,%esp
            printf(0, *s);
     41e:	83 ec 08             	sub    $0x8,%esp
     421:	52                   	push   %edx
     422:	6a 00                	push   $0x0
     424:	e8 87 0b 00 00       	call   fb0 <printf>
     429:	83 c4 10             	add    $0x10,%esp
            any = 1;
     42c:	b9 01 00 00 00       	mov    $0x1,%ecx
    for (s = str; *s; s++) {
     431:	8b 53 04             	mov    0x4(%ebx),%edx
     434:	83 c3 04             	add    $0x4,%ebx
        mask <<= 1;
     437:	01 ff                	add    %edi,%edi
    for (s = str; *s; s++) {
     439:	85 d2                	test   %edx,%edx
     43b:	0f 84 df fe ff ff    	je     320 <display+0xb0>
        if (ifr.ifr_flags & mask) {
     441:	66 85 7d 94          	test   %di,-0x6c(%ebp)
     445:	74 ea                	je     431 <display+0x1c1>
            if (any)
     447:	85 c9                	test   %ecx,%ecx
     449:	74 d3                	je     41e <display+0x1ae>
     44b:	eb b3                	jmp    400 <display+0x190>
     44d:	8d 76 00             	lea    0x0(%esi),%esi
        ifr.ifr_mtu = 0;
     450:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
     457:	31 c0                	xor    %eax,%eax
     459:	e9 f2 fe ff ff       	jmp    350 <display+0xe0>
     45e:	66 90                	xchg   %ax,%ax
        printf(0, " netmask %d.%d.%d.%d", p[0], p[1], p[2], p[3]);
     460:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     464:	83 ec 08             	sub    $0x8,%esp
     467:	50                   	push   %eax
     468:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     46c:	50                   	push   %eax
     46d:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     471:	50                   	push   %eax
     472:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     476:	50                   	push   %eax
     477:	68 eb 13 00 00       	push   $0x13eb
     47c:	6a 00                	push   $0x0
     47e:	e8 2d 0b 00 00       	call   fb0 <printf>
        ifr.ifr_broadaddr.sa_family = AF_INET;
     483:	b8 02 00 00 00       	mov    $0x2,%eax
        if (ioctl(fd, SIOCGIFBRDADDR, &ifr) == -1)
     488:	83 c4 1c             	add    $0x1c,%esp
        ifr.ifr_broadaddr.sa_family = AF_INET;
     48b:	66 89 45 94          	mov    %ax,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFBRDADDR, &ifr) == -1)
     48f:	8d 45 84             	lea    -0x7c(%ebp),%eax
     492:	50                   	push   %eax
     493:	68 0b 69 20 c0       	push   $0xc020690b
     498:	56                   	push   %esi
     499:	e8 0f 0a 00 00       	call   ead <ioctl>
     49e:	83 c4 10             	add    $0x10,%esp
     4a1:	83 f8 ff             	cmp    $0xffffffff,%eax
     4a4:	0f 84 3c ff ff ff    	je     3e6 <display+0x176>
        printf(0, " broadcast %d.%d.%d.%d\n", p[0], p[1], p[2], p[3]);
     4aa:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     4ae:	83 ec 08             	sub    $0x8,%esp
     4b1:	50                   	push   %eax
     4b2:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     4b6:	50                   	push   %eax
     4b7:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     4bb:	50                   	push   %eax
     4bc:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     4c0:	50                   	push   %eax
     4c1:	68 00 14 00 00       	push   $0x1400
     4c6:	6a 00                	push   $0x0
     4c8:	e8 e3 0a 00 00       	call   fb0 <printf>
     4cd:	83 c4 20             	add    $0x20,%esp
     4d0:	e9 11 ff ff ff       	jmp    3e6 <display+0x176>
     4d5:	8d 76 00             	lea    0x0(%esi),%esi
        printf(0, "\tether %x:%x:%x:%x:%x:%x\n", p[0], p[1], p[2], p[3], p[4], p[5]);
     4d8:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     4dc:	50                   	push   %eax
     4dd:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     4e1:	50                   	push   %eax
     4e2:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     4e6:	50                   	push   %eax
     4e7:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     4eb:	50                   	push   %eax
     4ec:	0f b6 45 97          	movzbl -0x69(%ebp),%eax
     4f0:	50                   	push   %eax
     4f1:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     4f5:	50                   	push   %eax
     4f6:	68 bf 13 00 00       	push   $0x13bf
     4fb:	6a 00                	push   $0x0
     4fd:	e8 ae 0a 00 00       	call   fb0 <printf>
     502:	83 c4 20             	add    $0x20,%esp
     505:	e9 73 fe ff ff       	jmp    37d <display+0x10d>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        close(fd);
     510:	83 ec 0c             	sub    $0xc,%esp
     513:	56                   	push   %esi
     514:	e8 1c 09 00 00       	call   e35 <close>
        printf(0, "ifconfig: interface %s does not exist\n", name);
     519:	83 c4 0c             	add    $0xc,%esp
     51c:	ff b5 74 ff ff ff    	pushl  -0x8c(%ebp)
     522:	68 44 14 00 00       	push   $0x1444
     527:	6a 00                	push   $0x0
     529:	e8 82 0a 00 00       	call   fb0 <printf>
        return;
     52e:	83 c4 10             	add    $0x10,%esp
}
     531:	8d 65 f4             	lea    -0xc(%ebp),%esp
     534:	5b                   	pop    %ebx
     535:	5e                   	pop    %esi
     536:	5f                   	pop    %edi
     537:	5d                   	pop    %ebp
     538:	c3                   	ret    
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <display_all>:
{
     540:	55                   	push   %ebp
    struct ifreq ifr = {.ifr_ifindex = 0};
     541:	31 d2                	xor    %edx,%edx
     543:	31 c0                	xor    %eax,%eax
{
     545:	89 e5                	mov    %esp,%ebp
     547:	56                   	push   %esi
     548:	53                   	push   %ebx
     549:	83 ec 20             	sub    $0x20,%esp
    struct ifreq ifr = {.ifr_ifindex = 0};
     54c:	89 54 05 d8          	mov    %edx,-0x28(%ebp,%eax,1)
     550:	83 c0 04             	add    $0x4,%eax
     553:	83 f8 20             	cmp    $0x20,%eax
     556:	72 f4                	jb     54c <display_all+0xc>
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     558:	50                   	push   %eax
     559:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     55c:	6a 00                	push   $0x0
     55e:	6a 02                	push   $0x2
     560:	6a 02                	push   $0x2
     562:	e8 4e 09 00 00       	call   eb5 <socket>
    if (fd == -1) {
     567:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     56a:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
     56c:	83 f8 ff             	cmp    $0xffffffff,%eax
     56f:	75 12                	jne    583 <display_all+0x43>
     571:	eb 3a                	jmp    5ad <display_all+0x6d>
     573:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     577:	90                   	nop
        display(ifr.ifr_name);
     578:	89 d8                	mov    %ebx,%eax
     57a:	e8 f1 fc ff ff       	call   270 <display>
        ifr.ifr_ifindex++;
     57f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        if (ioctl(fd, SIOCGIFNAME, &ifr) == -1)
     583:	83 ec 04             	sub    $0x4,%esp
     586:	53                   	push   %ebx
     587:	68 01 69 20 c0       	push   $0xc0206901
     58c:	56                   	push   %esi
     58d:	e8 1b 09 00 00       	call   ead <ioctl>
     592:	83 c4 10             	add    $0x10,%esp
     595:	83 f8 ff             	cmp    $0xffffffff,%eax
     598:	75 de                	jne    578 <display_all+0x38>
    close(fd);
     59a:	83 ec 0c             	sub    $0xc,%esp
     59d:	56                   	push   %esi
     59e:	e8 92 08 00 00       	call   e35 <close>
}
     5a3:	83 c4 10             	add    $0x10,%esp
     5a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5a9:	5b                   	pop    %ebx
     5aa:	5e                   	pop    %esi
     5ab:	5d                   	pop    %ebp
     5ac:	c3                   	ret    
        exit();
     5ad:	e8 5b 08 00 00       	call   e0d <exit>
     5b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005c0 <ifset>:
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	89 c7                	mov    %eax,%edi
     5c6:	56                   	push   %esi
     5c7:	53                   	push   %ebx
     5c8:	89 d3                	mov    %edx,%ebx
     5ca:	83 ec 40             	sub    $0x40,%esp
     5cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     5d0:	6a 00                	push   $0x0
     5d2:	6a 02                	push   $0x2
     5d4:	6a 02                	push   $0x2
{
     5d6:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     5d9:	e8 d7 08 00 00       	call   eb5 <socket>
    if (fd == -1)
     5de:	83 c4 10             	add    $0x10,%esp
     5e1:	83 f8 ff             	cmp    $0xffffffff,%eax
     5e4:	74 5f                	je     645 <ifset+0x85>
    strcpy(ifr.ifr_name, name); 
     5e6:	52                   	push   %edx
     5e7:	89 c6                	mov    %eax,%esi
     5e9:	52                   	push   %edx
     5ea:	57                   	push   %edi
     5eb:	8d 7d c8             	lea    -0x38(%ebp),%edi
     5ee:	57                   	push   %edi
     5ef:	e8 ec 00 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     5f4:	83 c4 0c             	add    $0xc,%esp
    ((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr = *addr;
     5f7:	8b 03                	mov    (%ebx),%eax
    ifr.ifr_addr.sa_family = AF_INET;
     5f9:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     5ff:	57                   	push   %edi
     600:	68 08 69 20 80       	push   $0x80206908
     605:	56                   	push   %esi
    ((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr = *addr;
     606:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     609:	e8 9f 08 00 00       	call   ead <ioctl>
     60e:	83 c4 10             	add    $0x10,%esp
     611:	83 c0 01             	add    $0x1,%eax
     614:	74 57                	je     66d <ifset+0xad>
    ((struct sockaddr_in *)&ifr.ifr_netmask)->sin_addr = *netmask;
     616:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    ifr.ifr_netmask.sa_family = AF_INET;
     619:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
    ((struct sockaddr_in *)&ifr.ifr_netmask)->sin_addr = *netmask;
     61f:	8b 00                	mov    (%eax),%eax
     621:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if (ioctl(fd, SIOCSIFNETMASK, &ifr) == -1) {
     624:	50                   	push   %eax
     625:	57                   	push   %edi
     626:	68 0a 69 20 80       	push   $0x8020690a
     62b:	56                   	push   %esi
     62c:	e8 7c 08 00 00       	call   ead <ioctl>
     631:	83 c4 10             	add    $0x10,%esp
     634:	83 c0 01             	add    $0x1,%eax
     637:	74 14                	je     64d <ifset+0x8d>
    close(fd);
     639:	83 ec 0c             	sub    $0xc,%esp
     63c:	56                   	push   %esi
     63d:	e8 f3 07 00 00       	call   e35 <close>
     642:	83 c4 10             	add    $0x10,%esp
}
     645:	8d 65 f4             	lea    -0xc(%ebp),%esp
     648:	5b                   	pop    %ebx
     649:	5e                   	pop    %esi
     64a:	5f                   	pop    %edi
     64b:	5d                   	pop    %ebp
     64c:	c3                   	ret    
        close(fd);
     64d:	83 ec 0c             	sub    $0xc,%esp
     650:	56                   	push   %esi
     651:	e8 df 07 00 00       	call   e35 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFNETMASK) failure, interface=%s\n", name);
     656:	83 c4 0c             	add    $0xc,%esp
     659:	ff 75 c0             	pushl  -0x40(%ebp)
     65c:	68 a0 14 00 00       	push   $0x14a0
     661:	6a 00                	push   $0x0
     663:	e8 48 09 00 00       	call   fb0 <printf>
        return;
     668:	83 c4 10             	add    $0x10,%esp
     66b:	eb d8                	jmp    645 <ifset+0x85>
        close(fd);
     66d:	83 ec 0c             	sub    $0xc,%esp
     670:	56                   	push   %esi
     671:	e8 bf 07 00 00       	call   e35 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFADDR) failure, interface=%s\n", name);
     676:	83 c4 0c             	add    $0xc,%esp
     679:	ff 75 c0             	pushl  -0x40(%ebp)
     67c:	68 6c 14 00 00       	push   $0x146c
     681:	6a 00                	push   $0x0
     683:	e8 28 09 00 00       	call   fb0 <printf>
        return;
     688:	83 c4 10             	add    $0x10,%esp
     68b:	eb b8                	jmp    645 <ifset+0x85>
     68d:	8d 76 00             	lea    0x0(%esi),%esi

00000690 <usage>:
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	83 ec 10             	sub    $0x10,%esp
    printf(0, "usage: ifconfig interface [command|address]\n");
     696:	68 d8 14 00 00       	push   $0x14d8
     69b:	6a 00                	push   $0x0
     69d:	e8 0e 09 00 00       	call   fb0 <printf>
    printf(0, "           - command: up | down\n");
     6a2:	58                   	pop    %eax
     6a3:	5a                   	pop    %edx
     6a4:	68 08 15 00 00       	push   $0x1508
     6a9:	6a 00                	push   $0x0
     6ab:	e8 00 09 00 00       	call   fb0 <printf>
    printf(0, "           - address: ADDRESS/PREFIX | ADDRESS netmask NETMASK\n");
     6b0:	59                   	pop    %ecx
     6b1:	58                   	pop    %eax
     6b2:	68 2c 15 00 00       	push   $0x152c
     6b7:	6a 00                	push   $0x0
     6b9:	e8 f2 08 00 00       	call   fb0 <printf>
    printf(0, "       ifconfig [-a]\n");
     6be:	58                   	pop    %eax
     6bf:	5a                   	pop    %edx
     6c0:	68 18 14 00 00       	push   $0x1418
     6c5:	6a 00                	push   $0x0
     6c7:	e8 e4 08 00 00       	call   fb0 <printf>
    exit();
     6cc:	e8 3c 07 00 00       	call   e0d <exit>
     6d1:	66 90                	xchg   %ax,%ax
     6d3:	66 90                	xchg   %ax,%ax
     6d5:	66 90                	xchg   %ax,%ax
     6d7:	66 90                	xchg   %ax,%ax
     6d9:	66 90                	xchg   %ax,%ax
     6db:	66 90                	xchg   %ax,%ax
     6dd:	66 90                	xchg   %ax,%ax
     6df:	90                   	nop

000006e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     6e0:	f3 0f 1e fb          	endbr32 
     6e4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     6e5:	31 c0                	xor    %eax,%eax
{
     6e7:	89 e5                	mov    %esp,%ebp
     6e9:	53                   	push   %ebx
     6ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
     6ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
     6f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     6f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     6f7:	83 c0 01             	add    $0x1,%eax
     6fa:	84 d2                	test   %dl,%dl
     6fc:	75 f2                	jne    6f0 <strcpy+0x10>
    ;
  return os;
}
     6fe:	89 c8                	mov    %ecx,%eax
     700:	5b                   	pop    %ebx
     701:	5d                   	pop    %ebp
     702:	c3                   	ret    
     703:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000710 <strcat_s>:

char* strcat_s(char *dest, char *right, int max_len) {
     710:	f3 0f 1e fb          	endbr32 
     714:	55                   	push   %ebp
     715:	89 e5                	mov    %esp,%ebp
     717:	57                   	push   %edi
     718:	8b 7d 10             	mov    0x10(%ebp),%edi
     71b:	56                   	push   %esi
     71c:	8b 75 08             	mov    0x8(%ebp),%esi
     71f:	53                   	push   %ebx
     720:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int writing = -1;
    for(int i = 0; i !=max_len; i++){
     723:	85 ff                	test   %edi,%edi
     725:	74 39                	je     760 <strcat_s+0x50>
     727:	31 c0                	xor    %eax,%eax
     729:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     72e:	eb 11                	jmp    741 <strcat_s+0x31>
        if(writing < 0 && dest[i] == 0){
            writing = i;
        }
        if(writing >= 0){
            dest[i] = right[i - writing];
     730:	0f b6 12             	movzbl (%edx),%edx
     733:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
     736:	84 d2                	test   %dl,%dl
     738:	74 26                	je     760 <strcat_s+0x50>
    for(int i = 0; i !=max_len; i++){
     73a:	83 c0 01             	add    $0x1,%eax
     73d:	39 c7                	cmp    %eax,%edi
     73f:	74 1f                	je     760 <strcat_s+0x50>
        if(writing < 0 && dest[i] == 0){
     741:	89 c2                	mov    %eax,%edx
     743:	29 ca                	sub    %ecx,%edx
     745:	01 da                	add    %ebx,%edx
     747:	83 f9 ff             	cmp    $0xffffffff,%ecx
     74a:	75 e4                	jne    730 <strcat_s+0x20>
     74c:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
     750:	75 e8                	jne    73a <strcat_s+0x2a>
     752:	89 da                	mov    %ebx,%edx
     754:	89 c1                	mov    %eax,%ecx
            dest[i] = right[i - writing];
     756:	0f b6 12             	movzbl (%edx),%edx
     759:	88 14 06             	mov    %dl,(%esi,%eax,1)
            if(dest[i] == 0){
     75c:	84 d2                	test   %dl,%dl
     75e:	75 da                	jne    73a <strcat_s+0x2a>
                break;
            }
        }
    }
    return dest;
}
     760:	5b                   	pop    %ebx
     761:	89 f0                	mov    %esi,%eax
     763:	5e                   	pop    %esi
     764:	5f                   	pop    %edi
     765:	5d                   	pop    %ebp
     766:	c3                   	ret    
     767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76e:	66 90                	xchg   %ax,%ax

00000770 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     770:	f3 0f 1e fb          	endbr32 
     774:	55                   	push   %ebp
     775:	89 e5                	mov    %esp,%ebp
     777:	53                   	push   %ebx
     778:	8b 4d 08             	mov    0x8(%ebp),%ecx
     77b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     77e:	0f b6 01             	movzbl (%ecx),%eax
     781:	0f b6 1a             	movzbl (%edx),%ebx
     784:	84 c0                	test   %al,%al
     786:	75 19                	jne    7a1 <strcmp+0x31>
     788:	eb 26                	jmp    7b0 <strcmp+0x40>
     78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     790:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     794:	83 c1 01             	add    $0x1,%ecx
     797:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     79a:	0f b6 1a             	movzbl (%edx),%ebx
     79d:	84 c0                	test   %al,%al
     79f:	74 0f                	je     7b0 <strcmp+0x40>
     7a1:	38 d8                	cmp    %bl,%al
     7a3:	74 eb                	je     790 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     7a5:	29 d8                	sub    %ebx,%eax
}
     7a7:	5b                   	pop    %ebx
     7a8:	5d                   	pop    %ebp
     7a9:	c3                   	ret    
     7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     7b2:	29 d8                	sub    %ebx,%eax
}
     7b4:	5b                   	pop    %ebx
     7b5:	5d                   	pop    %ebp
     7b6:	c3                   	ret    
     7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7be:	66 90                	xchg   %ax,%ax

000007c0 <strlen>:

uint
strlen(const char *s)
{
     7c0:	f3 0f 1e fb          	endbr32 
     7c4:	55                   	push   %ebp
     7c5:	89 e5                	mov    %esp,%ebp
     7c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     7ca:	80 3a 00             	cmpb   $0x0,(%edx)
     7cd:	74 21                	je     7f0 <strlen+0x30>
     7cf:	31 c0                	xor    %eax,%eax
     7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7d8:	83 c0 01             	add    $0x1,%eax
     7db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     7df:	89 c1                	mov    %eax,%ecx
     7e1:	75 f5                	jne    7d8 <strlen+0x18>
    ;
  return n;
}
     7e3:	89 c8                	mov    %ecx,%eax
     7e5:	5d                   	pop    %ebp
     7e6:	c3                   	ret    
     7e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     7f0:	31 c9                	xor    %ecx,%ecx
}
     7f2:	5d                   	pop    %ebp
     7f3:	89 c8                	mov    %ecx,%eax
     7f5:	c3                   	ret    
     7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7fd:	8d 76 00             	lea    0x0(%esi),%esi

00000800 <memset>:

void*
memset(void *dst, int c, uint n)
{
     800:	f3 0f 1e fb          	endbr32 
     804:	55                   	push   %ebp
     805:	89 e5                	mov    %esp,%ebp
     807:	57                   	push   %edi
     808:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     80b:	8b 4d 10             	mov    0x10(%ebp),%ecx
     80e:	8b 45 0c             	mov    0xc(%ebp),%eax
     811:	89 d7                	mov    %edx,%edi
     813:	fc                   	cld    
     814:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     816:	89 d0                	mov    %edx,%eax
     818:	5f                   	pop    %edi
     819:	5d                   	pop    %ebp
     81a:	c3                   	ret    
     81b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     81f:	90                   	nop

00000820 <strchr>:

char*
strchr(const char *s, char c)
{
     820:	f3 0f 1e fb          	endbr32 
     824:	55                   	push   %ebp
     825:	89 e5                	mov    %esp,%ebp
     827:	8b 45 08             	mov    0x8(%ebp),%eax
     82a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     82e:	0f b6 10             	movzbl (%eax),%edx
     831:	84 d2                	test   %dl,%dl
     833:	75 16                	jne    84b <strchr+0x2b>
     835:	eb 21                	jmp    858 <strchr+0x38>
     837:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     83e:	66 90                	xchg   %ax,%ax
     840:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     844:	83 c0 01             	add    $0x1,%eax
     847:	84 d2                	test   %dl,%dl
     849:	74 0d                	je     858 <strchr+0x38>
    if(*s == c)
     84b:	38 d1                	cmp    %dl,%cl
     84d:	75 f1                	jne    840 <strchr+0x20>
      return (char*)s;
  return 0;
}
     84f:	5d                   	pop    %ebp
     850:	c3                   	ret    
     851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     858:	31 c0                	xor    %eax,%eax
}
     85a:	5d                   	pop    %ebp
     85b:	c3                   	ret    
     85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <gets>:

char*
gets(char *buf, int max)
{
     860:	f3 0f 1e fb          	endbr32 
     864:	55                   	push   %ebp
     865:	89 e5                	mov    %esp,%ebp
     867:	57                   	push   %edi
     868:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     869:	31 f6                	xor    %esi,%esi
{
     86b:	53                   	push   %ebx
     86c:	89 f3                	mov    %esi,%ebx
     86e:	83 ec 1c             	sub    $0x1c,%esp
     871:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     874:	eb 33                	jmp    8a9 <gets+0x49>
     876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     87d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     880:	83 ec 04             	sub    $0x4,%esp
     883:	8d 45 e7             	lea    -0x19(%ebp),%eax
     886:	6a 01                	push   $0x1
     888:	50                   	push   %eax
     889:	6a 00                	push   $0x0
     88b:	e8 95 05 00 00       	call   e25 <read>
    if(cc < 1)
     890:	83 c4 10             	add    $0x10,%esp
     893:	85 c0                	test   %eax,%eax
     895:	7e 1c                	jle    8b3 <gets+0x53>
      break;
    buf[i++] = c;
     897:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     89b:	83 c7 01             	add    $0x1,%edi
     89e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     8a1:	3c 0a                	cmp    $0xa,%al
     8a3:	74 23                	je     8c8 <gets+0x68>
     8a5:	3c 0d                	cmp    $0xd,%al
     8a7:	74 1f                	je     8c8 <gets+0x68>
  for(i=0; i+1 < max; ){
     8a9:	83 c3 01             	add    $0x1,%ebx
     8ac:	89 fe                	mov    %edi,%esi
     8ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     8b1:	7c cd                	jl     880 <gets+0x20>
     8b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     8b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     8b8:	c6 03 00             	movb   $0x0,(%ebx)
}
     8bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8be:	5b                   	pop    %ebx
     8bf:	5e                   	pop    %esi
     8c0:	5f                   	pop    %edi
     8c1:	5d                   	pop    %ebp
     8c2:	c3                   	ret    
     8c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     8c7:	90                   	nop
     8c8:	8b 75 08             	mov    0x8(%ebp),%esi
     8cb:	8b 45 08             	mov    0x8(%ebp),%eax
     8ce:	01 de                	add    %ebx,%esi
     8d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     8d2:	c6 03 00             	movb   $0x0,(%ebx)
}
     8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d8:	5b                   	pop    %ebx
     8d9:	5e                   	pop    %esi
     8da:	5f                   	pop    %edi
     8db:	5d                   	pop    %ebp
     8dc:	c3                   	ret    
     8dd:	8d 76 00             	lea    0x0(%esi),%esi

000008e0 <stat>:

int
stat(const char *n, struct stat *st)
{
     8e0:	f3 0f 1e fb          	endbr32 
     8e4:	55                   	push   %ebp
     8e5:	89 e5                	mov    %esp,%ebp
     8e7:	56                   	push   %esi
     8e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     8e9:	83 ec 08             	sub    $0x8,%esp
     8ec:	6a 00                	push   $0x0
     8ee:	ff 75 08             	pushl  0x8(%ebp)
     8f1:	e8 57 05 00 00       	call   e4d <open>
  if(fd < 0)
     8f6:	83 c4 10             	add    $0x10,%esp
     8f9:	85 c0                	test   %eax,%eax
     8fb:	78 2b                	js     928 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     8fd:	83 ec 08             	sub    $0x8,%esp
     900:	ff 75 0c             	pushl  0xc(%ebp)
     903:	89 c3                	mov    %eax,%ebx
     905:	50                   	push   %eax
     906:	e8 5a 05 00 00       	call   e65 <fstat>
  close(fd);
     90b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     90e:	89 c6                	mov    %eax,%esi
  close(fd);
     910:	e8 20 05 00 00       	call   e35 <close>
  return r;
     915:	83 c4 10             	add    $0x10,%esp
}
     918:	8d 65 f8             	lea    -0x8(%ebp),%esp
     91b:	89 f0                	mov    %esi,%eax
     91d:	5b                   	pop    %ebx
     91e:	5e                   	pop    %esi
     91f:	5d                   	pop    %ebp
     920:	c3                   	ret    
     921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     928:	be ff ff ff ff       	mov    $0xffffffff,%esi
     92d:	eb e9                	jmp    918 <stat+0x38>
     92f:	90                   	nop

00000930 <atoi>:

int
atoi(const char *s)
{
     930:	f3 0f 1e fb          	endbr32 
     934:	55                   	push   %ebp
     935:	89 e5                	mov    %esp,%ebp
     937:	53                   	push   %ebx
     938:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     93b:	0f be 02             	movsbl (%edx),%eax
     93e:	8d 48 d0             	lea    -0x30(%eax),%ecx
     941:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     944:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     949:	77 1a                	ja     965 <atoi+0x35>
     94b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     94f:	90                   	nop
    n = n*10 + *s++ - '0';
     950:	83 c2 01             	add    $0x1,%edx
     953:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     956:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     95a:	0f be 02             	movsbl (%edx),%eax
     95d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     960:	80 fb 09             	cmp    $0x9,%bl
     963:	76 eb                	jbe    950 <atoi+0x20>
  return n;
}
     965:	89 c8                	mov    %ecx,%eax
     967:	5b                   	pop    %ebx
     968:	5d                   	pop    %ebp
     969:	c3                   	ret    
     96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000970 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     970:	f3 0f 1e fb          	endbr32 
     974:	55                   	push   %ebp
     975:	89 e5                	mov    %esp,%ebp
     977:	57                   	push   %edi
     978:	8b 45 10             	mov    0x10(%ebp),%eax
     97b:	8b 55 08             	mov    0x8(%ebp),%edx
     97e:	56                   	push   %esi
     97f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     982:	85 c0                	test   %eax,%eax
     984:	7e 0f                	jle    995 <memmove+0x25>
     986:	01 d0                	add    %edx,%eax
  dst = vdst;
     988:	89 d7                	mov    %edx,%edi
     98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     990:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     991:	39 f8                	cmp    %edi,%eax
     993:	75 fb                	jne    990 <memmove+0x20>
  return vdst;
}
     995:	5e                   	pop    %esi
     996:	89 d0                	mov    %edx,%eax
     998:	5f                   	pop    %edi
     999:	5d                   	pop    %ebp
     99a:	c3                   	ret    
     99b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     99f:	90                   	nop

000009a0 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
     9a0:	f3 0f 1e fb          	endbr32 
     9a4:	55                   	push   %ebp
     9a5:	89 e5                	mov    %esp,%ebp
     9a7:	57                   	push   %edi
     9a8:	56                   	push   %esi
     9a9:	53                   	push   %ebx
     9aa:	83 ec 34             	sub    $0x34,%esp
     9ad:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     9b0:	68 04 16 00 00       	push   $0x1604
hexdump (void *data, size_t size) {
     9b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
     9b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     9bb:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
     9bd:	89 c7                	mov    %eax,%edi
     9bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     9c2:	e8 e9 05 00 00       	call   fb0 <printf>
  for (offset = 0; offset < size; offset += 16) {
     9c7:	83 c4 10             	add    $0x10,%esp
     9ca:	85 ff                	test   %edi,%edi
     9cc:	0f 84 2d 01 00 00    	je     aff <hexdump+0x15f>
     9d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9d5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     9dc:	be 10 00 00 00       	mov    $0x10,%esi
     9e1:	83 e8 01             	sub    $0x1,%eax
     9e4:	83 e0 f0             	and    $0xfffffff0,%eax
     9e7:	83 c0 10             	add    $0x10,%eax
     9ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     9ed:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
     9f0:	83 ec 08             	sub    $0x8,%esp
     9f3:	68 58 16 00 00       	push   $0x1658
     9f8:	6a 01                	push   $0x1
     9fa:	e8 b1 05 00 00       	call   fb0 <printf>
    if (offset <= 0x0fff) printf(1, "0");
     9ff:	83 c4 10             	add    $0x10,%esp
     a02:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
     a09:	0f 8e 51 01 00 00    	jle    b60 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
     a0f:	8b 7d dc             	mov    -0x24(%ebp),%edi
     a12:	83 ec 04             	sub    $0x4,%esp
     a15:	57                   	push   %edi
     a16:	89 fb                	mov    %edi,%ebx
     a18:	68 55 16 00 00       	push   $0x1655
     a1d:	6a 01                	push   $0x1
     a1f:	e8 8c 05 00 00       	call   fb0 <printf>
     a24:	89 7d d8             	mov    %edi,-0x28(%ebp)
     a27:	83 c4 10             	add    $0x10,%esp
     a2a:	8b 7d e0             	mov    -0x20(%ebp),%edi
     a2d:	eb 28                	jmp    a57 <hexdump+0xb7>
     a2f:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
     a30:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     a34:	80 fa 0f             	cmp    $0xf,%dl
     a37:	0f 86 e3 00 00 00    	jbe    b20 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
     a3d:	83 ec 04             	sub    $0x4,%esp
     a40:	83 c3 01             	add    $0x1,%ebx
     a43:	52                   	push   %edx
     a44:	68 5b 16 00 00       	push   $0x165b
     a49:	6a 01                	push   $0x1
     a4b:	e8 60 05 00 00       	call   fb0 <printf>
     a50:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     a53:	39 f3                	cmp    %esi,%ebx
     a55:	74 1e                	je     a75 <hexdump+0xd5>
      if(offset + index < (int)size) {
     a57:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
     a5a:	7f d4                	jg     a30 <hexdump+0x90>
      } else {
        printf(1, "   ");
     a5c:	83 ec 08             	sub    $0x8,%esp
     a5f:	83 c3 01             	add    $0x1,%ebx
     a62:	68 5f 16 00 00       	push   $0x165f
     a67:	6a 01                	push   $0x1
     a69:	e8 42 05 00 00       	call   fb0 <printf>
     a6e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     a71:	39 f3                	cmp    %esi,%ebx
     a73:	75 e2                	jne    a57 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
     a75:	83 ec 08             	sub    $0x8,%esp
     a78:	8b 5d d8             	mov    -0x28(%ebp),%ebx
     a7b:	68 58 16 00 00       	push   $0x1658
     a80:	6a 01                	push   $0x1
     a82:	e8 29 05 00 00       	call   fb0 <printf>
     a87:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     a8a:	83 c4 10             	add    $0x10,%esp
     a8d:	eb 1b                	jmp    aaa <hexdump+0x10a>
     a8f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
     a90:	83 ec 04             	sub    $0x4,%esp
     a93:	52                   	push   %edx
     a94:	68 63 16 00 00       	push   $0x1663
     a99:	6a 01                	push   $0x1
     a9b:	e8 10 05 00 00       	call   fb0 <printf>
     aa0:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     aa3:	83 c3 01             	add    $0x1,%ebx
     aa6:	39 de                	cmp    %ebx,%esi
     aa8:	74 30                	je     ada <hexdump+0x13a>
      if(offset + index < (int)size) {
     aaa:	39 df                	cmp    %ebx,%edi
     aac:	0f 8e 8e 00 00 00    	jle    b40 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
     ab2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ab5:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     ab9:	8d 4a e0             	lea    -0x20(%edx),%ecx
     abc:	80 f9 5e             	cmp    $0x5e,%cl
     abf:	76 cf                	jbe    a90 <hexdump+0xf0>
        } else {
          printf(1, ".");
     ac1:	83 ec 08             	sub    $0x8,%esp
     ac4:	83 c3 01             	add    $0x1,%ebx
     ac7:	68 66 16 00 00       	push   $0x1666
     acc:	6a 01                	push   $0x1
     ace:	e8 dd 04 00 00       	call   fb0 <printf>
     ad3:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     ad6:	39 de                	cmp    %ebx,%esi
     ad8:	75 d0                	jne    aaa <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
     ada:	83 ec 08             	sub    $0x8,%esp
     add:	83 c6 10             	add    $0x10,%esi
     ae0:	68 68 16 00 00       	push   $0x1668
     ae5:	6a 01                	push   $0x1
     ae7:	e8 c4 04 00 00       	call   fb0 <printf>
  for (offset = 0; offset < size; offset += 16) {
     aec:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
     af0:	83 c4 10             	add    $0x10,%esp
     af3:	8b 45 dc             	mov    -0x24(%ebp),%eax
     af6:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
     af9:	0f 85 f1 fe ff ff    	jne    9f0 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     aff:	c7 45 0c 04 16 00 00 	movl   $0x1604,0xc(%ebp)
     b06:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     b0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b10:	5b                   	pop    %ebx
     b11:	5e                   	pop    %esi
     b12:	5f                   	pop    %edi
     b13:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     b14:	e9 97 04 00 00       	jmp    fb0 <printf>
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
     b20:	83 ec 08             	sub    $0x8,%esp
     b23:	68 53 16 00 00       	push   $0x1653
     b28:	6a 01                	push   $0x1
     b2a:	e8 81 04 00 00       	call   fb0 <printf>
     b2f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     b33:	83 c4 10             	add    $0x10,%esp
     b36:	e9 02 ff ff ff       	jmp    a3d <hexdump+0x9d>
     b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b3f:	90                   	nop
        printf(1, " ");
     b40:	83 ec 08             	sub    $0x8,%esp
     b43:	68 61 16 00 00       	push   $0x1661
     b48:	6a 01                	push   $0x1
     b4a:	e8 61 04 00 00       	call   fb0 <printf>
     b4f:	83 c4 10             	add    $0x10,%esp
     b52:	e9 4c ff ff ff       	jmp    aa3 <hexdump+0x103>
     b57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5e:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
     b60:	83 ec 08             	sub    $0x8,%esp
     b63:	68 53 16 00 00       	push   $0x1653
     b68:	6a 01                	push   $0x1
     b6a:	e8 41 04 00 00       	call   fb0 <printf>
    if (offset <= 0x00ff) printf(1, "0");
     b6f:	8b 7d dc             	mov    -0x24(%ebp),%edi
     b72:	83 c4 10             	add    $0x10,%esp
     b75:	81 ff ff 00 00 00    	cmp    $0xff,%edi
     b7b:	0f 8f 8e fe ff ff    	jg     a0f <hexdump+0x6f>
     b81:	83 ec 08             	sub    $0x8,%esp
     b84:	68 53 16 00 00       	push   $0x1653
     b89:	6a 01                	push   $0x1
     b8b:	e8 20 04 00 00       	call   fb0 <printf>
    if (offset <= 0x000f) printf(1, "0");
     b90:	83 c4 10             	add    $0x10,%esp
     b93:	83 ff 0f             	cmp    $0xf,%edi
     b96:	0f 8f 73 fe ff ff    	jg     a0f <hexdump+0x6f>
     b9c:	83 ec 08             	sub    $0x8,%esp
     b9f:	68 53 16 00 00       	push   $0x1653
     ba4:	6a 01                	push   $0x1
     ba6:	e8 05 04 00 00       	call   fb0 <printf>
     bab:	83 c4 10             	add    $0x10,%esp
     bae:	e9 5c fe ff ff       	jmp    a0f <hexdump+0x6f>
     bb3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000bc0 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
     bc0:	f3 0f 1e fb          	endbr32 
     bc4:	55                   	push   %ebp
    if (!endian)
     bc5:	a1 24 1b 00 00       	mov    0x1b24,%eax
{
     bca:	89 e5                	mov    %esp,%ebp
     bcc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
     bcf:	85 c0                	test   %eax,%eax
     bd1:	75 1d                	jne    bf0 <hton16+0x30>
        endian = byteorder();
     bd3:	c7 05 24 1b 00 00 d2 	movl   $0x4d2,0x1b24
     bda:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
     bdd:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
     bdf:	5d                   	pop    %ebp
     be0:	66 c1 c2 08          	rol    $0x8,%dx
     be4:	89 d0                	mov    %edx,%eax
     be6:	c3                   	ret    
     be7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bee:	66 90                	xchg   %ax,%ax
     bf0:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
     bf2:	3d d2 04 00 00       	cmp    $0x4d2,%eax
     bf7:	74 e4                	je     bdd <hton16+0x1d>
}
     bf9:	89 d0                	mov    %edx,%eax
     bfb:	5d                   	pop    %ebp
     bfc:	c3                   	ret    
     bfd:	8d 76 00             	lea    0x0(%esi),%esi

00000c00 <ntoh16>:
     c00:	f3 0f 1e fb          	endbr32 
     c04:	eb ba                	jmp    bc0 <hton16>
     c06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c0d:	8d 76 00             	lea    0x0(%esi),%esi

00000c10 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
     c10:	f3 0f 1e fb          	endbr32 
     c14:	55                   	push   %ebp
    if (!endian)
     c15:	8b 15 24 1b 00 00    	mov    0x1b24,%edx
{
     c1b:	89 e5                	mov    %esp,%ebp
     c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
     c20:	85 d2                	test   %edx,%edx
     c22:	75 14                	jne    c38 <hton32+0x28>
        endian = byteorder();
     c24:	c7 05 24 1b 00 00 d2 	movl   $0x4d2,0x1b24
     c2b:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
     c2e:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
     c30:	5d                   	pop    %ebp
     c31:	c3                   	ret    
     c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
     c38:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
     c3e:	74 ee                	je     c2e <hton32+0x1e>
}
     c40:	5d                   	pop    %ebp
     c41:	c3                   	ret    
     c42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c50 <ntoh32>:
     c50:	f3 0f 1e fb          	endbr32 
     c54:	eb ba                	jmp    c10 <hton32>
     c56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c5d:	8d 76 00             	lea    0x0(%esi),%esi

00000c60 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
     c60:	f3 0f 1e fb          	endbr32 
     c64:	55                   	push   %ebp
     c65:	89 e5                	mov    %esp,%ebp
     c67:	57                   	push   %edi
     c68:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c6b:	56                   	push   %esi
     c6c:	53                   	push   %ebx
     c6d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
     c70:	0f b6 01             	movzbl (%ecx),%eax
     c73:	3c 09                	cmp    $0x9,%al
     c75:	74 09                	je     c80 <strtol+0x20>
     c77:	3c 20                	cmp    $0x20,%al
     c79:	75 14                	jne    c8f <strtol+0x2f>
     c7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c7f:	90                   	nop
     c80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
     c84:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
     c87:	3c 20                	cmp    $0x20,%al
     c89:	74 f5                	je     c80 <strtol+0x20>
     c8b:	3c 09                	cmp    $0x9,%al
     c8d:	74 f1                	je     c80 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
     c8f:	3c 2b                	cmp    $0x2b,%al
     c91:	0f 84 a9 00 00 00    	je     d40 <strtol+0xe0>
    int neg = 0;
     c97:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
     c99:	3c 2d                	cmp    $0x2d,%al
     c9b:	0f 84 8f 00 00 00    	je     d30 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
     ca1:	0f be 11             	movsbl (%ecx),%edx
     ca4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
     caa:	75 12                	jne    cbe <strtol+0x5e>
     cac:	80 fa 30             	cmp    $0x30,%dl
     caf:	0f 84 9b 00 00 00    	je     d50 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
     cb5:	85 db                	test   %ebx,%ebx
     cb7:	75 05                	jne    cbe <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
     cb9:	bb 0a 00 00 00       	mov    $0xa,%ebx
     cbe:	89 5d 10             	mov    %ebx,0x10(%ebp)
     cc1:	31 c0                	xor    %eax,%eax
     cc3:	eb 17                	jmp    cdc <strtol+0x7c>
     cc5:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
     cc8:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
     ccb:	3b 55 10             	cmp    0x10(%ebp),%edx
     cce:	7d 28                	jge    cf8 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
     cd0:	0f af 45 10          	imul   0x10(%ebp),%eax
     cd4:	83 c1 01             	add    $0x1,%ecx
     cd7:	01 d0                	add    %edx,%eax
    while (1) {
     cd9:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
     cdc:	8d 72 d0             	lea    -0x30(%edx),%esi
     cdf:	89 f3                	mov    %esi,%ebx
     ce1:	80 fb 09             	cmp    $0x9,%bl
     ce4:	76 e2                	jbe    cc8 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
     ce6:	8d 72 9f             	lea    -0x61(%edx),%esi
     ce9:	89 f3                	mov    %esi,%ebx
     ceb:	80 fb 19             	cmp    $0x19,%bl
     cee:	77 28                	ja     d18 <strtol+0xb8>
            dig = *s - 'a' + 10;
     cf0:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
     cf3:	3b 55 10             	cmp    0x10(%ebp),%edx
     cf6:	7c d8                	jl     cd0 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
     cf8:	8b 55 0c             	mov    0xc(%ebp),%edx
     cfb:	85 d2                	test   %edx,%edx
     cfd:	74 05                	je     d04 <strtol+0xa4>
        *endptr = (char *) s;
     cff:	8b 75 0c             	mov    0xc(%ebp),%esi
     d02:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
     d04:	89 c2                	mov    %eax,%edx
}
     d06:	5b                   	pop    %ebx
     d07:	5e                   	pop    %esi
    return (neg ? -val : val);
     d08:	f7 da                	neg    %edx
     d0a:	85 ff                	test   %edi,%edi
}
     d0c:	5f                   	pop    %edi
     d0d:	5d                   	pop    %ebp
    return (neg ? -val : val);
     d0e:	0f 45 c2             	cmovne %edx,%eax
}
     d11:	c3                   	ret    
     d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
     d18:	8d 72 bf             	lea    -0x41(%edx),%esi
     d1b:	89 f3                	mov    %esi,%ebx
     d1d:	80 fb 19             	cmp    $0x19,%bl
     d20:	77 d6                	ja     cf8 <strtol+0x98>
            dig = *s - 'A' + 10;
     d22:	83 ea 37             	sub    $0x37,%edx
     d25:	eb a4                	jmp    ccb <strtol+0x6b>
     d27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d2e:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
     d30:	83 c1 01             	add    $0x1,%ecx
     d33:	bf 01 00 00 00       	mov    $0x1,%edi
     d38:	e9 64 ff ff ff       	jmp    ca1 <strtol+0x41>
     d3d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
     d40:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
     d43:	31 ff                	xor    %edi,%edi
     d45:	e9 57 ff ff ff       	jmp    ca1 <strtol+0x41>
     d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
     d50:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
     d54:	3c 78                	cmp    $0x78,%al
     d56:	74 18                	je     d70 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
     d58:	85 db                	test   %ebx,%ebx
     d5a:	0f 85 5e ff ff ff    	jne    cbe <strtol+0x5e>
        s++, base = 8;
     d60:	83 c1 01             	add    $0x1,%ecx
     d63:	0f be d0             	movsbl %al,%edx
     d66:	bb 08 00 00 00       	mov    $0x8,%ebx
     d6b:	e9 4e ff ff ff       	jmp    cbe <strtol+0x5e>
        s += 2, base = 16;
     d70:	0f be 51 02          	movsbl 0x2(%ecx),%edx
     d74:	bb 10 00 00 00       	mov    $0x10,%ebx
     d79:	83 c1 02             	add    $0x2,%ecx
     d7c:	e9 3d ff ff ff       	jmp    cbe <strtol+0x5e>
     d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d8f:	90                   	nop

00000d90 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
     d90:	f3 0f 1e fb          	endbr32 
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
     d97:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
     d98:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
     d9a:	56                   	push   %esi
     d9b:	53                   	push   %ebx
     d9c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
     d9f:	83 ec 1c             	sub    $0x1c,%esp
     da2:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
     da5:	83 ec 04             	sub    $0x4,%esp
     da8:	6a 0a                	push   $0xa
     daa:	53                   	push   %ebx
     dab:	56                   	push   %esi
     dac:	e8 af fe ff ff       	call   c60 <strtol>
        if (ret < 0 || ret > 255) {
     db1:	83 c4 10             	add    $0x10,%esp
     db4:	3d ff 00 00 00       	cmp    $0xff,%eax
     db9:	77 3d                	ja     df8 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
     dbb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     dbe:	39 f1                	cmp    %esi,%ecx
     dc0:	74 36                	je     df8 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
     dc2:	0f b6 11             	movzbl (%ecx),%edx
     dc5:	83 ff 03             	cmp    $0x3,%edi
     dc8:	74 16                	je     de0 <ip_addr_pton+0x50>
     dca:	80 fa 2e             	cmp    $0x2e,%dl
     dcd:	75 29                	jne    df8 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
     dcf:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
     dd2:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
     dd5:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
     dd8:	83 c7 01             	add    $0x1,%edi
     ddb:	eb c8                	jmp    da5 <ip_addr_pton+0x15>
     ddd:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
     de0:	84 d2                	test   %dl,%dl
     de2:	75 14                	jne    df8 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
     de4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     de7:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
     dea:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
     ded:	31 c0                	xor    %eax,%eax
}
     def:	5b                   	pop    %ebx
     df0:	5e                   	pop    %esi
     df1:	5f                   	pop    %edi
     df2:	5d                   	pop    %ebp
     df3:	c3                   	ret    
     df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     df8:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
     dfb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     e00:	5b                   	pop    %ebx
     e01:	5e                   	pop    %esi
     e02:	5f                   	pop    %edi
     e03:	5d                   	pop    %ebp
     e04:	c3                   	ret    

00000e05 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e05:	b8 01 00 00 00       	mov    $0x1,%eax
     e0a:	cd 40                	int    $0x40
     e0c:	c3                   	ret    

00000e0d <exit>:
SYSCALL(exit)
     e0d:	b8 02 00 00 00       	mov    $0x2,%eax
     e12:	cd 40                	int    $0x40
     e14:	c3                   	ret    

00000e15 <wait>:
SYSCALL(wait)
     e15:	b8 03 00 00 00       	mov    $0x3,%eax
     e1a:	cd 40                	int    $0x40
     e1c:	c3                   	ret    

00000e1d <pipe>:
SYSCALL(pipe)
     e1d:	b8 04 00 00 00       	mov    $0x4,%eax
     e22:	cd 40                	int    $0x40
     e24:	c3                   	ret    

00000e25 <read>:
SYSCALL(read)
     e25:	b8 05 00 00 00       	mov    $0x5,%eax
     e2a:	cd 40                	int    $0x40
     e2c:	c3                   	ret    

00000e2d <write>:
SYSCALL(write)
     e2d:	b8 10 00 00 00       	mov    $0x10,%eax
     e32:	cd 40                	int    $0x40
     e34:	c3                   	ret    

00000e35 <close>:
SYSCALL(close)
     e35:	b8 15 00 00 00       	mov    $0x15,%eax
     e3a:	cd 40                	int    $0x40
     e3c:	c3                   	ret    

00000e3d <kill>:
SYSCALL(kill)
     e3d:	b8 06 00 00 00       	mov    $0x6,%eax
     e42:	cd 40                	int    $0x40
     e44:	c3                   	ret    

00000e45 <exec>:
SYSCALL(exec)
     e45:	b8 07 00 00 00       	mov    $0x7,%eax
     e4a:	cd 40                	int    $0x40
     e4c:	c3                   	ret    

00000e4d <open>:
SYSCALL(open)
     e4d:	b8 0f 00 00 00       	mov    $0xf,%eax
     e52:	cd 40                	int    $0x40
     e54:	c3                   	ret    

00000e55 <mknod>:
SYSCALL(mknod)
     e55:	b8 11 00 00 00       	mov    $0x11,%eax
     e5a:	cd 40                	int    $0x40
     e5c:	c3                   	ret    

00000e5d <unlink>:
SYSCALL(unlink)
     e5d:	b8 12 00 00 00       	mov    $0x12,%eax
     e62:	cd 40                	int    $0x40
     e64:	c3                   	ret    

00000e65 <fstat>:
SYSCALL(fstat)
     e65:	b8 08 00 00 00       	mov    $0x8,%eax
     e6a:	cd 40                	int    $0x40
     e6c:	c3                   	ret    

00000e6d <link>:
SYSCALL(link)
     e6d:	b8 13 00 00 00       	mov    $0x13,%eax
     e72:	cd 40                	int    $0x40
     e74:	c3                   	ret    

00000e75 <mkdir>:
SYSCALL(mkdir)
     e75:	b8 14 00 00 00       	mov    $0x14,%eax
     e7a:	cd 40                	int    $0x40
     e7c:	c3                   	ret    

00000e7d <chdir>:
SYSCALL(chdir)
     e7d:	b8 09 00 00 00       	mov    $0x9,%eax
     e82:	cd 40                	int    $0x40
     e84:	c3                   	ret    

00000e85 <dup>:
SYSCALL(dup)
     e85:	b8 0a 00 00 00       	mov    $0xa,%eax
     e8a:	cd 40                	int    $0x40
     e8c:	c3                   	ret    

00000e8d <getpid>:
SYSCALL(getpid)
     e8d:	b8 0b 00 00 00       	mov    $0xb,%eax
     e92:	cd 40                	int    $0x40
     e94:	c3                   	ret    

00000e95 <sbrk>:
SYSCALL(sbrk)
     e95:	b8 0c 00 00 00       	mov    $0xc,%eax
     e9a:	cd 40                	int    $0x40
     e9c:	c3                   	ret    

00000e9d <sleep>:
SYSCALL(sleep)
     e9d:	b8 0d 00 00 00       	mov    $0xd,%eax
     ea2:	cd 40                	int    $0x40
     ea4:	c3                   	ret    

00000ea5 <uptime>:
SYSCALL(uptime)
     ea5:	b8 0e 00 00 00       	mov    $0xe,%eax
     eaa:	cd 40                	int    $0x40
     eac:	c3                   	ret    

00000ead <ioctl>:
# iotcl
SYSCALL(ioctl)
     ead:	b8 16 00 00 00       	mov    $0x16,%eax
     eb2:	cd 40                	int    $0x40
     eb4:	c3                   	ret    

00000eb5 <socket>:
# socket
SYSCALL(socket)
     eb5:	b8 17 00 00 00       	mov    $0x17,%eax
     eba:	cd 40                	int    $0x40
     ebc:	c3                   	ret    

00000ebd <bind>:
SYSCALL(bind)
     ebd:	b8 19 00 00 00       	mov    $0x19,%eax
     ec2:	cd 40                	int    $0x40
     ec4:	c3                   	ret    

00000ec5 <listen>:
SYSCALL(listen)
     ec5:	b8 1a 00 00 00       	mov    $0x1a,%eax
     eca:	cd 40                	int    $0x40
     ecc:	c3                   	ret    

00000ecd <accept>:
SYSCALL(accept)
     ecd:	b8 1b 00 00 00       	mov    $0x1b,%eax
     ed2:	cd 40                	int    $0x40
     ed4:	c3                   	ret    

00000ed5 <recv>:
SYSCALL(recv)
     ed5:	b8 1c 00 00 00       	mov    $0x1c,%eax
     eda:	cd 40                	int    $0x40
     edc:	c3                   	ret    

00000edd <send>:
SYSCALL(send)
     edd:	b8 1d 00 00 00       	mov    $0x1d,%eax
     ee2:	cd 40                	int    $0x40
     ee4:	c3                   	ret    

00000ee5 <recvfrom>:
SYSCALL(recvfrom)
     ee5:	b8 1e 00 00 00       	mov    $0x1e,%eax
     eea:	cd 40                	int    $0x40
     eec:	c3                   	ret    

00000eed <sendto>:
SYSCALL(sendto)
     eed:	b8 1f 00 00 00       	mov    $0x1f,%eax
     ef2:	cd 40                	int    $0x40
     ef4:	c3                   	ret    
     ef5:	66 90                	xchg   %ax,%ax
     ef7:	66 90                	xchg   %ax,%ax
     ef9:	66 90                	xchg   %ax,%ax
     efb:	66 90                	xchg   %ax,%ax
     efd:	66 90                	xchg   %ax,%ax
     eff:	90                   	nop

00000f00 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	57                   	push   %edi
     f04:	56                   	push   %esi
     f05:	53                   	push   %ebx
     f06:	83 ec 3c             	sub    $0x3c,%esp
     f09:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     f0c:	89 d1                	mov    %edx,%ecx
{
     f0e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     f11:	85 d2                	test   %edx,%edx
     f13:	0f 89 7f 00 00 00    	jns    f98 <printint+0x98>
     f19:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     f1d:	74 79                	je     f98 <printint+0x98>
    neg = 1;
     f1f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     f26:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     f28:	31 db                	xor    %ebx,%ebx
     f2a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     f2d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     f30:	89 c8                	mov    %ecx,%eax
     f32:	31 d2                	xor    %edx,%edx
     f34:	89 cf                	mov    %ecx,%edi
     f36:	f7 75 c4             	divl   -0x3c(%ebp)
     f39:	0f b6 92 74 16 00 00 	movzbl 0x1674(%edx),%edx
     f40:	89 45 c0             	mov    %eax,-0x40(%ebp)
     f43:	89 d8                	mov    %ebx,%eax
     f45:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     f48:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     f4b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     f4e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     f51:	76 dd                	jbe    f30 <printint+0x30>
  if(neg)
     f53:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     f56:	85 c9                	test   %ecx,%ecx
     f58:	74 0c                	je     f66 <printint+0x66>
    buf[i++] = '-';
     f5a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     f5f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     f61:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     f66:	8b 7d b8             	mov    -0x48(%ebp),%edi
     f69:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     f6d:	eb 07                	jmp    f76 <printint+0x76>
     f6f:	90                   	nop
     f70:	0f b6 13             	movzbl (%ebx),%edx
     f73:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     f76:	83 ec 04             	sub    $0x4,%esp
     f79:	88 55 d7             	mov    %dl,-0x29(%ebp)
     f7c:	6a 01                	push   $0x1
     f7e:	56                   	push   %esi
     f7f:	57                   	push   %edi
     f80:	e8 a8 fe ff ff       	call   e2d <write>
  while(--i >= 0)
     f85:	83 c4 10             	add    $0x10,%esp
     f88:	39 de                	cmp    %ebx,%esi
     f8a:	75 e4                	jne    f70 <printint+0x70>
    putc(fd, buf[i]);
}
     f8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f8f:	5b                   	pop    %ebx
     f90:	5e                   	pop    %esi
     f91:	5f                   	pop    %edi
     f92:	5d                   	pop    %ebp
     f93:	c3                   	ret    
     f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f98:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     f9f:	eb 87                	jmp    f28 <printint+0x28>
     fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fa8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     faf:	90                   	nop

00000fb0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     fb0:	f3 0f 1e fb          	endbr32 
     fb4:	55                   	push   %ebp
     fb5:	89 e5                	mov    %esp,%ebp
     fb7:	57                   	push   %edi
     fb8:	56                   	push   %esi
     fb9:	53                   	push   %ebx
     fba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     fbd:	8b 75 0c             	mov    0xc(%ebp),%esi
     fc0:	0f b6 1e             	movzbl (%esi),%ebx
     fc3:	84 db                	test   %bl,%bl
     fc5:	0f 84 b4 00 00 00    	je     107f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
     fcb:	8d 45 10             	lea    0x10(%ebp),%eax
     fce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     fd1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     fd4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
     fd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fd9:	eb 33                	jmp    100e <printf+0x5e>
     fdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fdf:	90                   	nop
     fe0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     fe3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     fe8:	83 f8 25             	cmp    $0x25,%eax
     feb:	74 17                	je     1004 <printf+0x54>
  write(fd, &c, 1);
     fed:	83 ec 04             	sub    $0x4,%esp
     ff0:	88 5d e7             	mov    %bl,-0x19(%ebp)
     ff3:	6a 01                	push   $0x1
     ff5:	57                   	push   %edi
     ff6:	ff 75 08             	pushl  0x8(%ebp)
     ff9:	e8 2f fe ff ff       	call   e2d <write>
     ffe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1001:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1004:	0f b6 1e             	movzbl (%esi),%ebx
    1007:	83 c6 01             	add    $0x1,%esi
    100a:	84 db                	test   %bl,%bl
    100c:	74 71                	je     107f <printf+0xcf>
    c = fmt[i] & 0xff;
    100e:	0f be cb             	movsbl %bl,%ecx
    1011:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1014:	85 d2                	test   %edx,%edx
    1016:	74 c8                	je     fe0 <printf+0x30>
      }
    } else if(state == '%'){
    1018:	83 fa 25             	cmp    $0x25,%edx
    101b:	75 e7                	jne    1004 <printf+0x54>
      if(c == 'd'){
    101d:	83 f8 64             	cmp    $0x64,%eax
    1020:	0f 84 9a 00 00 00    	je     10c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1026:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    102c:	83 f9 70             	cmp    $0x70,%ecx
    102f:	74 5f                	je     1090 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1031:	83 f8 73             	cmp    $0x73,%eax
    1034:	0f 84 d6 00 00 00    	je     1110 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    103a:	83 f8 63             	cmp    $0x63,%eax
    103d:	0f 84 8d 00 00 00    	je     10d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1043:	83 f8 25             	cmp    $0x25,%eax
    1046:	0f 84 b4 00 00 00    	je     1100 <printf+0x150>
  write(fd, &c, 1);
    104c:	83 ec 04             	sub    $0x4,%esp
    104f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1053:	6a 01                	push   $0x1
    1055:	57                   	push   %edi
    1056:	ff 75 08             	pushl  0x8(%ebp)
    1059:	e8 cf fd ff ff       	call   e2d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    105e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1061:	83 c4 0c             	add    $0xc,%esp
    1064:	6a 01                	push   $0x1
    1066:	83 c6 01             	add    $0x1,%esi
    1069:	57                   	push   %edi
    106a:	ff 75 08             	pushl  0x8(%ebp)
    106d:	e8 bb fd ff ff       	call   e2d <write>
  for(i = 0; fmt[i]; i++){
    1072:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1076:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1079:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    107b:	84 db                	test   %bl,%bl
    107d:	75 8f                	jne    100e <printf+0x5e>
    }
  }
}
    107f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1082:	5b                   	pop    %ebx
    1083:	5e                   	pop    %esi
    1084:	5f                   	pop    %edi
    1085:	5d                   	pop    %ebp
    1086:	c3                   	ret    
    1087:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1090:	83 ec 0c             	sub    $0xc,%esp
    1093:	b9 10 00 00 00       	mov    $0x10,%ecx
    1098:	6a 00                	push   $0x0
    109a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    109d:	8b 45 08             	mov    0x8(%ebp),%eax
    10a0:	8b 13                	mov    (%ebx),%edx
    10a2:	e8 59 fe ff ff       	call   f00 <printint>
        ap++;
    10a7:	89 d8                	mov    %ebx,%eax
    10a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10ac:	31 d2                	xor    %edx,%edx
        ap++;
    10ae:	83 c0 04             	add    $0x4,%eax
    10b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10b4:	e9 4b ff ff ff       	jmp    1004 <printf+0x54>
    10b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    10c0:	83 ec 0c             	sub    $0xc,%esp
    10c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10c8:	6a 01                	push   $0x1
    10ca:	eb ce                	jmp    109a <printf+0xea>
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    10d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    10d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    10d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    10d8:	6a 01                	push   $0x1
        ap++;
    10da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    10dd:	57                   	push   %edi
    10de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    10e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    10e4:	e8 44 fd ff ff       	call   e2d <write>
        ap++;
    10e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    10ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10ef:	31 d2                	xor    %edx,%edx
    10f1:	e9 0e ff ff ff       	jmp    1004 <printf+0x54>
    10f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1100:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1103:	83 ec 04             	sub    $0x4,%esp
    1106:	e9 59 ff ff ff       	jmp    1064 <printf+0xb4>
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop
        s = (char*)*ap;
    1110:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1113:	8b 18                	mov    (%eax),%ebx
        ap++;
    1115:	83 c0 04             	add    $0x4,%eax
    1118:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    111b:	85 db                	test   %ebx,%ebx
    111d:	74 17                	je     1136 <printf+0x186>
        while(*s != 0){
    111f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1122:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1124:	84 c0                	test   %al,%al
    1126:	0f 84 d8 fe ff ff    	je     1004 <printf+0x54>
    112c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    112f:	89 de                	mov    %ebx,%esi
    1131:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1134:	eb 1a                	jmp    1150 <printf+0x1a0>
          s = "(null)";
    1136:	bb 6c 16 00 00       	mov    $0x166c,%ebx
        while(*s != 0){
    113b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    113e:	b8 28 00 00 00       	mov    $0x28,%eax
    1143:	89 de                	mov    %ebx,%esi
    1145:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1148:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114f:	90                   	nop
  write(fd, &c, 1);
    1150:	83 ec 04             	sub    $0x4,%esp
          s++;
    1153:	83 c6 01             	add    $0x1,%esi
    1156:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1159:	6a 01                	push   $0x1
    115b:	57                   	push   %edi
    115c:	53                   	push   %ebx
    115d:	e8 cb fc ff ff       	call   e2d <write>
        while(*s != 0){
    1162:	0f b6 06             	movzbl (%esi),%eax
    1165:	83 c4 10             	add    $0x10,%esp
    1168:	84 c0                	test   %al,%al
    116a:	75 e4                	jne    1150 <printf+0x1a0>
    116c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    116f:	31 d2                	xor    %edx,%edx
    1171:	e9 8e fe ff ff       	jmp    1004 <printf+0x54>
    1176:	66 90                	xchg   %ax,%ax
    1178:	66 90                	xchg   %ax,%ax
    117a:	66 90                	xchg   %ax,%ax
    117c:	66 90                	xchg   %ax,%ax
    117e:	66 90                	xchg   %ax,%ax

00001180 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1185:	a1 28 1b 00 00       	mov    0x1b28,%eax
{
    118a:	89 e5                	mov    %esp,%ebp
    118c:	57                   	push   %edi
    118d:	56                   	push   %esi
    118e:	53                   	push   %ebx
    118f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1192:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1194:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1197:	39 c8                	cmp    %ecx,%eax
    1199:	73 15                	jae    11b0 <free+0x30>
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop
    11a0:	39 d1                	cmp    %edx,%ecx
    11a2:	72 14                	jb     11b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11a4:	39 d0                	cmp    %edx,%eax
    11a6:	73 10                	jae    11b8 <free+0x38>
{
    11a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11aa:	8b 10                	mov    (%eax),%edx
    11ac:	39 c8                	cmp    %ecx,%eax
    11ae:	72 f0                	jb     11a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11b0:	39 d0                	cmp    %edx,%eax
    11b2:	72 f4                	jb     11a8 <free+0x28>
    11b4:	39 d1                	cmp    %edx,%ecx
    11b6:	73 f0                	jae    11a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    11b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11be:	39 fa                	cmp    %edi,%edx
    11c0:	74 1e                	je     11e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    11c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    11c5:	8b 50 04             	mov    0x4(%eax),%edx
    11c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11cb:	39 f1                	cmp    %esi,%ecx
    11cd:	74 28                	je     11f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    11cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    11d1:	5b                   	pop    %ebx
  freep = p;
    11d2:	a3 28 1b 00 00       	mov    %eax,0x1b28
}
    11d7:	5e                   	pop    %esi
    11d8:	5f                   	pop    %edi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret    
    11db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    11e0:	03 72 04             	add    0x4(%edx),%esi
    11e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    11e6:	8b 10                	mov    (%eax),%edx
    11e8:	8b 12                	mov    (%edx),%edx
    11ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    11ed:	8b 50 04             	mov    0x4(%eax),%edx
    11f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11f3:	39 f1                	cmp    %esi,%ecx
    11f5:	75 d8                	jne    11cf <free+0x4f>
    p->s.size += bp->s.size;
    11f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    11fa:	a3 28 1b 00 00       	mov    %eax,0x1b28
    p->s.size += bp->s.size;
    11ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1202:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1205:	89 10                	mov    %edx,(%eax)
}
    1207:	5b                   	pop    %ebx
    1208:	5e                   	pop    %esi
    1209:	5f                   	pop    %edi
    120a:	5d                   	pop    %ebp
    120b:	c3                   	ret    
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001210 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1210:	f3 0f 1e fb          	endbr32 
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	57                   	push   %edi
    1218:	56                   	push   %esi
    1219:	53                   	push   %ebx
    121a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    121d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1220:	8b 3d 28 1b 00 00    	mov    0x1b28,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1226:	8d 70 07             	lea    0x7(%eax),%esi
    1229:	c1 ee 03             	shr    $0x3,%esi
    122c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    122f:	85 ff                	test   %edi,%edi
    1231:	0f 84 a9 00 00 00    	je     12e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1237:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1239:	8b 48 04             	mov    0x4(%eax),%ecx
    123c:	39 f1                	cmp    %esi,%ecx
    123e:	73 6d                	jae    12ad <malloc+0x9d>
    1240:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1246:	bb 00 10 00 00       	mov    $0x1000,%ebx
    124b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    124e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1255:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1258:	eb 17                	jmp    1271 <malloc+0x61>
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1260:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1262:	8b 4a 04             	mov    0x4(%edx),%ecx
    1265:	39 f1                	cmp    %esi,%ecx
    1267:	73 4f                	jae    12b8 <malloc+0xa8>
    1269:	8b 3d 28 1b 00 00    	mov    0x1b28,%edi
    126f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1271:	39 c7                	cmp    %eax,%edi
    1273:	75 eb                	jne    1260 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1275:	83 ec 0c             	sub    $0xc,%esp
    1278:	ff 75 e4             	pushl  -0x1c(%ebp)
    127b:	e8 15 fc ff ff       	call   e95 <sbrk>
  if(p == (char*)-1)
    1280:	83 c4 10             	add    $0x10,%esp
    1283:	83 f8 ff             	cmp    $0xffffffff,%eax
    1286:	74 1b                	je     12a3 <malloc+0x93>
  hp->s.size = nu;
    1288:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    128b:	83 ec 0c             	sub    $0xc,%esp
    128e:	83 c0 08             	add    $0x8,%eax
    1291:	50                   	push   %eax
    1292:	e8 e9 fe ff ff       	call   1180 <free>
  return freep;
    1297:	a1 28 1b 00 00       	mov    0x1b28,%eax
      if((p = morecore(nunits)) == 0)
    129c:	83 c4 10             	add    $0x10,%esp
    129f:	85 c0                	test   %eax,%eax
    12a1:	75 bd                	jne    1260 <malloc+0x50>
        return 0;
  }
}
    12a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    12a6:	31 c0                	xor    %eax,%eax
}
    12a8:	5b                   	pop    %ebx
    12a9:	5e                   	pop    %esi
    12aa:	5f                   	pop    %edi
    12ab:	5d                   	pop    %ebp
    12ac:	c3                   	ret    
    if(p->s.size >= nunits){
    12ad:	89 c2                	mov    %eax,%edx
    12af:	89 f8                	mov    %edi,%eax
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    12b8:	39 ce                	cmp    %ecx,%esi
    12ba:	74 54                	je     1310 <malloc+0x100>
        p->s.size -= nunits;
    12bc:	29 f1                	sub    %esi,%ecx
    12be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    12c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    12c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    12c7:	a3 28 1b 00 00       	mov    %eax,0x1b28
}
    12cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    12cf:	8d 42 08             	lea    0x8(%edx),%eax
}
    12d2:	5b                   	pop    %ebx
    12d3:	5e                   	pop    %esi
    12d4:	5f                   	pop    %edi
    12d5:	5d                   	pop    %ebp
    12d6:	c3                   	ret    
    12d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    12e0:	c7 05 28 1b 00 00 2c 	movl   $0x1b2c,0x1b28
    12e7:	1b 00 00 
    base.s.size = 0;
    12ea:	bf 2c 1b 00 00       	mov    $0x1b2c,%edi
    base.s.ptr = freep = prevp = &base;
    12ef:	c7 05 2c 1b 00 00 2c 	movl   $0x1b2c,0x1b2c
    12f6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    12fb:	c7 05 30 1b 00 00 00 	movl   $0x0,0x1b30
    1302:	00 00 00 
    if(p->s.size >= nunits){
    1305:	e9 36 ff ff ff       	jmp    1240 <malloc+0x30>
    130a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1310:	8b 0a                	mov    (%edx),%ecx
    1312:	89 08                	mov    %ecx,(%eax)
    1314:	eb b1                	jmp    12c7 <malloc+0xb7>
